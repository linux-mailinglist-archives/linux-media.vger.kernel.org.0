Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B39737756F
	for <lists+linux-media@lfdr.de>; Sat, 27 Jul 2019 02:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbfG0AiW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jul 2019 20:38:22 -0400
Received: from cdptpa-outbound-snat.email.rr.com ([107.14.166.227]:57586 "EHLO
        cdptpa-cmomta02.email.rr.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726115AbfG0AiW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jul 2019 20:38:22 -0400
Received: from [192.168.2.97] ([72.182.16.184])
        by cmsmtp with ESMTP
        id rAj2hXLs9zqEzrAj4hBsp7; Sat, 27 Jul 2019 00:38:19 +0000
Subject: Re: [PATCH 1/2]: media: hdpvr: Add adaptive sleeping in
 hdpvr_start_streaming
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <f3ef6967-2b00-6ee7-19ef-086014fe6aab@austin.rr.com>
 <f2cc9f3c-b4e4-cb89-910c-f4782390d8d9@xs4all.nl>
From:   Keith Pyle <kpyle@austin.rr.com>
Message-ID: <b40667d3-09ea-9ff3-78d5-12f890314c8f@austin.rr.com>
Date:   Fri, 26 Jul 2019 19:38:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.0
MIME-Version: 1.0
In-Reply-To: <f2cc9f3c-b4e4-cb89-910c-f4782390d8d9@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CMAE-Envelope: MS4wfDv5jinnMElRx7AGfaE0Yj9SsBzfU1IH0e42hHn+cIlJm4L6ScNNAAIC+LwOYzJAEQt/Sk1b2iSaa48S68SOhT9OCwO/Dk3XGICYoHOn87o8dGY2cj4B
 qnbWpjAEGdRL04AODpGg2udsxwwxaVDqJHSmV8QHHXVxY6qv7d02OKeNlAnYHGtHysMdOpe8bIaPdBCKMRWtexn4PSByUrAPaPY=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/25/19 02:10, Hans Verkuil wrote:
> On 7/7/19 11:15 PM, Keith Pyle wrote:
>> The hdpvr firmware reacts poorly to a fast close/open sequence.  Delaying
>> a few seconds between the close and next open produces generally reliable
>> results.  Rather than requiring user programs to implement this delay and
>> coordinate among themselves when the device is handed from one program to
>> another, add kernel support for delaying the attempt to start streaming if
>> the device only recently stopped streaming.  A delay of 4 seconds seems to
>> be sufficient, but some administrators may wish to push their luck by
>> trying shorter delays.  To allow administrators to change the delay, add a
>> new parameter to the hdpvr module: `hdpvr_close_to_open_ms_delay`, which
>> specifies the delay in milliseconds between a close and subsequent
>> start-streaming.  If the user application has already delayed by at least
>> that long for its own reasons, this feature will add no further delay.
>>
>> Signed-off-by: Keith Pyle <kpyle@austin.rr.com>
>> Tested-by: Keith Pyle <kpyle@austin.rr.com>
>> ---
>> Changes since v1:
>> - Rewrapped output at 80 columns, per request from Hans.  Literal strings
>> still exceed 80 columns where necessary to keep an entire string together,
>> since this makes it easier for grep to find the file and line that
>> generates a given message.
>> - Reviewed Hans request to use `jiffies` instead of `get_jiffies_64()`.
>> Per the documentation, raw `jiffies` appears to be inappropriate
>> on 32-bit systems, so the patch continues to use `get_jiffies_64()`.
> That's news to all the 32-bit systems that have been using jiffies since the
> dawn of time.
>
> Please use jiffies, like everyone else. 'jiffies' is an unsigned long, so
> 32 bits on a 32 bit system and 64 bit on a 64 bit system. Just want you
> want.
Actually, it isn't.  Contrary to your interpretation, we intentionally used the 64 bit value for jiffies on both 32 and 64 bit systems since the get_jiffies_64 macro returns a u64 in all cases.  Recording systems using HD-PVR devices frequently have long uptimes, so rollover of a 32-bit jiffies value could be a problem (i.e., the necessary delay before a streaming restart would be missing in the event of a rollover).  Extra code for rollover detection would be needed.

Also, include/linux/jiffies.h specifically says "The 64-bit value is not atomic - you MUST NOT read it...", so we use the get_jiffies_64 macro as the header recommends.  On a 64-bit system, the macro becomes an inline return of jiffies.   On a 32-bit system, it becomes an appropriate function call.

>> On 64-bit systems, `get_jiffies_64()` becomes a direct read of `jiffies`.
>> Further, both uses of `get_jiffies_64()` are on relatively cold paths
>> (one just before starting streaming, the other just before a 10ms
>> hardcoded sleep), so the performance impact even on the 32-bit path
>> should be trivial relative to the time required for the surrounding code.
>> ---
>>  drivers/media/usb/hdpvr/hdpvr-core.c  |  4 ++++
>>  drivers/media/usb/hdpvr/hdpvr-video.c | 22 ++++++++++++++++++++++
>>  drivers/media/usb/hdpvr/hdpvr.h       |  5 +++++
>>  3 files changed, 31 insertions(+)
>>
>> diff --git a/drivers/media/usb/hdpvr/hdpvr-core.c b/drivers/media/usb/hdpvr/hdpvr-core.c
>> index 23d3d0754308..fd7608e7e94c 100644
>> --- a/drivers/media/usb/hdpvr/hdpvr-core.c
>> +++ b/drivers/media/usb/hdpvr/hdpvr-core.c
>> @@ -39,6 +39,10 @@ int hdpvr_debug;
>>  module_param(hdpvr_debug, int, S_IRUGO|S_IWUSR);
>>  MODULE_PARM_DESC(hdpvr_debug, "enable debugging output");
>>  
>> +uint hdpvr_close_to_open_ms_delay = 4000;
>> +module_param(hdpvr_close_to_open_ms_delay, uint, S_IRUGO|S_IWUSR);
>> +MODULE_PARM_DESC(hdpvr_close_to_open_ms_delay, "delay restarting streaming by the specified number of milliseconds");
>> +
>>  static uint default_video_input = HDPVR_VIDEO_INPUTS;
>>  module_param(default_video_input, uint, S_IRUGO|S_IWUSR);
>>  MODULE_PARM_DESC(default_video_input, "default video input: 0=Component / 1=S-Video / 2=Composite");
>> diff --git a/drivers/media/usb/hdpvr/hdpvr-video.c b/drivers/media/usb/hdpvr/hdpvr-video.c
>> index 3d199d5d6738..8a2b883d372e 100644
>> --- a/drivers/media/usb/hdpvr/hdpvr-video.c
>> +++ b/drivers/media/usb/hdpvr/hdpvr-video.c
>> @@ -278,6 +278,8 @@ static int hdpvr_start_streaming(struct hdpvr_device *dev)
>>  {
>>  	int ret;
>>  	struct hdpvr_video_info vidinf;
>> +	u64 now_jiffies, delta_jiffies;
>> +	uint msec_to_sleep;
>>  
>>  	if (dev->status == STATUS_STREAMING)
>>  		return 0;
>> @@ -298,6 +300,22 @@ static int hdpvr_start_streaming(struct hdpvr_device *dev)
>>  	v4l2_dbg(MSG_BUFFER, hdpvr_debug, &dev->v4l2_dev,
>>  			"video signal: %dx%d@%dhz\n", vidinf.width,
>>  			vidinf.height, vidinf.fps);
>> +	now_jiffies = get_jiffies_64();
>> +	/* inline time_after64 since the result of the subtraction is needed
>> +	 * for the sleep
>> +	 */
>> +	delta_jiffies = dev->jiffies_next_start_streaming - now_jiffies;
>> +	if ((__s64)delta_jiffies > 0) {
>> +		/* device firmware may not be ready yet */
>> +		msec_to_sleep = jiffies_to_msecs(delta_jiffies);
>> +		v4l2_dbg(MSG_INFO, hdpvr_debug, &dev->v4l2_dev,
>> +			 "firmware may not be ready, sleeping for %u ms\n",
>> +			 msec_to_sleep);
>> +		msleep(msec_to_sleep);
>> +	} else {
>> +		v4l2_dbg(MSG_INFO, hdpvr_debug, &dev->v4l2_dev,
>> +			 "firmware assumed to be ready, not sleeping\n");
>> +	}
>>  
>>  	/* start streaming 2 request */
>>  	hdpvr_usb_lock(dev, HDPVR_USB_CTRL);
>> @@ -332,6 +350,7 @@ static int hdpvr_stop_streaming(struct hdpvr_device *dev)
>>  	int actual_length;
>>  	uint c = 0;
>>  	u8 *buf;
>> +	u64 now_jiffies;
>>  
>>  	if (dev->status == STATUS_IDLE)
>>  		return 0;
>> @@ -368,6 +387,9 @@ static int hdpvr_stop_streaming(struct hdpvr_device *dev)
>>  	kfree(buf);
>>  	v4l2_dbg(MSG_BUFFER, hdpvr_debug, &dev->v4l2_dev,
>>  		 "used %d urbs to empty device buffers\n", c-1);
>> +	now_jiffies = get_jiffies_64();
>> +	dev->jiffies_next_start_streaming = now_jiffies +
>> +		msecs_to_jiffies(hdpvr_close_to_open_ms_delay);
>>  	msleep(10);
>>  
>>  	dev->status = STATUS_IDLE;
>> diff --git a/drivers/media/usb/hdpvr/hdpvr.h b/drivers/media/usb/hdpvr/hdpvr.h
>> index 7b3d166da1dd..9e5f88146827 100644
>> --- a/drivers/media/usb/hdpvr/hdpvr.h
>> +++ b/drivers/media/usb/hdpvr/hdpvr.h
>> @@ -43,6 +43,7 @@
>>  /* #define HDPVR_DEBUG */
>>  
>>  extern int hdpvr_debug;
>> +extern uint hdpvr_close_to_open_ms_delay;
>>  
>>  #define MSG_INFO	1
>>  #define MSG_BUFFER	2
>> @@ -95,6 +96,10 @@ struct hdpvr_device {
>>  	struct v4l2_dv_timings	cur_dv_timings;
>>  
>>  	uint			flags;
>> +	/* earliest jiffies at which the device firmware will be ready to
> Multiple comments should put the '/*' on a separate line. Please adjust
> both patches for this. Don't forget to run 'checkpatch.pl --strict' for both
> patches before posting!
>
>> +	 * start streaming
>> +	 */
>> +	u64             jiffies_next_start_streaming;
> The indent of jiffies_next_start_streaming doesn't seem to match the other fields.
>
>>  
>>  	/* synchronize I/O */
>>  	struct mutex		io_mutex;
>>
> Regards,
>
> 	Hans
>

