Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 905AE89A90
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 11:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727461AbfHLJzh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 05:55:37 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:57415 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727324AbfHLJzh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 05:55:37 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id x733hPhfSur8Tx737hhn5I; Mon, 12 Aug 2019 11:55:34 +0200
Subject: Re: [PATCH 1/2]: media: hdpvr: Add adaptive sleeping in
 hdpvr_start_streaming
To:     Keith Pyle <kpyle@austin.rr.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <d037c895-4280-1b73-ec82-fd7ae8b4b7d1@austin.rr.com>
 <60e3cded-b88c-f99c-1d65-da9334d32b82@xs4all.nl>
 <b647eebd-5f86-4d3f-13b8-c069256f4da4@austin.rr.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e5686272-596c-9f4e-ccf1-8bd85299bfc9@xs4all.nl>
Date:   Mon, 12 Aug 2019 11:55:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b647eebd-5f86-4d3f-13b8-c069256f4da4@austin.rr.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfAPvCPGqsaN/il8+4DxN0WvYZrvMaNViSaYtA9r/bshmfjbo8NGMEOnhTnQYI5VwAUs1daKidKUcfEj6wO0O0CbhsWd8iLUV4WAehuy88ocSBA2o6wxo
 j3+ApGqD3tQyiVEqwXXYccN2HxmrTe73uyLHZ+4qgDomLhLPR3kH6c25uJeSzXoKvTwNWkrNQkw47dOswx6qHl/YdsbU/l5zSFY=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/11/19 7:54 PM, Keith Pyle wrote:
> On 08/07/19 04:58, Hans Verkuil wrote:
>> On 8/4/19 12:09 AM, Keith Pyle wrote:
>>> The hdpvr firmware reacts poorly to a fast close/open sequence.  Delaying
>>> a few seconds between the close and next open produces generally reliable
>>> results.  Rather than requiring user programs to implement this delay and
>>> coordinate among themselves when the device is handed from one program to
>>> another, add kernel support for delaying the attempt to start streaming if
>>> the device only recently stopped streaming.  A delay of 4 seconds seems to
>>> be sufficient, but some administrators may wish to push their luck by
>>> trying shorter delays.  To allow administrators to change the delay, add a
>>> new parameter to the hdpvr module: `hdpvr_close_to_open_ms_delay`, which
>>> specifies the delay in milliseconds between a close and subsequent
>>> start-streaming.  If the user application has already delayed by at least
>>> that long for its own reasons, this feature will add no further delay.
>>>
>>> Signed-off-by: Keith Pyle <kpyle@austin.rr.com>
>>> Tested-by: Keith Pyle <kpyle@austin.rr.com>
>>> ---
>>> Changes since v2:
>>> - Rewrapped comments again, per request from Hans.
>>> - Per advice from checkpatch.pl --strict (suggested by Hans), added
>>> spacing around `|` for mode permissions.  This satisfies checkpatch,
>>> but reduces consistency in hdpvr-core.c, which had preexisting uses that
>>> violate checkpatch --strict.
>> That's OK.
>>
>>> - Changed indentation of declaration of jiffies_next_start_streaming to
>>> line up when viewed with tabstop=8.
>>> Changes since v1:
>>> - Rewrapped output at 80 columns, per request from Hans.  Literal strings
>>> still exceed 80 columns where necessary to keep an entire string together,
>>> since this makes it easier for grep to find the file and line that
>>> generates a given message.
>>> - Reviewed Hans request to use `jiffies` instead of `get_jiffies_64()`.
>>> Per the documentation, raw `jiffies` appears to be inappropriate
>> Per what documentation? 'jiffies' is used everywhere, so this makes no sense.
>> Just look at the use counts:
>>
>> $ git grep [^_a-z0-9]jiffies[^_a-z0-9]|wc
>>   10712   60812  810344
>> $ git grep get_jiffies_64|wc
>>      83     401    6342
>>
>> get_jiffies_64() should only be used in the rare cases where you need a
>> 64-bit jiffies value, even on a 32-bit system. That's not needed here.
>>
>> Doing unusual things requires a good reason, and there is no good reason
>> to use get_jiffies_64 here.
> 
> As I explained on July 26, there is a good reason to use a 64 jiffies: to avoid jiffies rollover on a 32-bit
> system.  I stated:
> 
>> Actually, it isn't.  Contrary to your interpretation, we intentionally used the 64 bit value for jiffies on both 32 and 64
>> bit systems since the get_jiffies_64 macro returns a u64 in all cases.  Recording systems using HD-PVR devices frequently
>> have long uptimes, so rollover of a 32-bit jiffies value could be a problem (i.e., the necessary delay before a streaming
>> restart would be missing in the event of a rollover).  Extra code for rollover detection would be needed.

I think I missed that reply, or just simply forgot it.

Rollover does indeed require more precision. But in that case I prefer that we switch to
ktime_get() (u64, ns since boot). That's much more common for such situations.

Regards,

	Hans

> 
>> Also, include/linux/jiffies.h specifically says "The 64-bit value is not atomic - you MUST NOT read it...", so we use the
>> get_jiffies_64 macro as the header recommends.  On a 64-bit system, the macro becomes an inline return of jiffies.   On a
>> 32-bit system, it becomes an appropriate function call.
> 
> I don't see any reason to knowingly introduce a roll-over bug for the 32-bit builds, even if it would be a low probability
> issue.  Since we continue to disagree on this point, you can consider both of these patches withdrawn.
> 
>>> on 32-bit systems, so the patch continues to use `get_jiffies_64()`.
>>> On 64-bit systems, `get_jiffies_64()` becomes a direct read of `jiffies`.
>>> Further, both uses of `get_jiffies_64()` are on relatively cold paths
>>> (one just before starting streaming, the other just before a 10ms
>>> hardcoded sleep), so the performance impact even on the 32-bit path
>>> should be trivial relative to the time required for the surrounding code.
>>> ---
>>>  drivers/media/usb/hdpvr/hdpvr-core.c  |  4 ++++
>>>  drivers/media/usb/hdpvr/hdpvr-video.c | 22 ++++++++++++++++++++++
>>>  drivers/media/usb/hdpvr/hdpvr.h       |  5 +++++
>>>  3 files changed, 31 insertions(+)
>>>
>>> diff --git a/drivers/media/usb/hdpvr/hdpvr-core.c b/drivers/media/usb/hdpvr/hdpvr-core.c
>>> index 23d3d0754308..a3d2f632fe38 100644
>>> --- a/drivers/media/usb/hdpvr/hdpvr-core.c
>>> +++ b/drivers/media/usb/hdpvr/hdpvr-core.c
>>> @@ -39,6 +39,10 @@ int hdpvr_debug;
>>>  module_param(hdpvr_debug, int, S_IRUGO|S_IWUSR);
>>>  MODULE_PARM_DESC(hdpvr_debug, "enable debugging output");
>>>  
>>> +uint hdpvr_close_to_open_ms_delay = 4000;
>>> +module_param(hdpvr_close_to_open_ms_delay, uint, S_IRUGO | S_IWUSR);
>> I'm getting this warning from checkpatch:
>>
>> WARNING: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred. Consider using octal permissions '0644'.
>> #10: FILE: drivers/media/usb/hdpvr/hdpvr-core.c:39:
>> +module_param(hdpvr_close_to_open_ms_delay, uint, S_IRUGO | S_IWUSR);
>>
>> Same elsewhere. Please use 0644 instead.
>>
>>> +MODULE_PARM_DESC(hdpvr_close_to_open_ms_delay, "delay restarting streaming by the specified number of milliseconds");
>>> +
>>>  static uint default_video_input = HDPVR_VIDEO_INPUTS;
>>>  module_param(default_video_input, uint, S_IRUGO|S_IWUSR);
>>>  MODULE_PARM_DESC(default_video_input, "default video input: 0=Component / 1=S-Video / 2=Composite");
>>> diff --git a/drivers/media/usb/hdpvr/hdpvr-video.c b/drivers/media/usb/hdpvr/hdpvr-video.c
>>> index 3d199d5d6738..7e5897dd8dff 100644
>>> --- a/drivers/media/usb/hdpvr/hdpvr-video.c
>>> +++ b/drivers/media/usb/hdpvr/hdpvr-video.c
>>> @@ -278,6 +278,8 @@ static int hdpvr_start_streaming(struct hdpvr_device *dev)
>>>  {
>>>  	int ret;
>>>  	struct hdpvr_video_info vidinf;
>>> +	u64 now_jiffies, delta_jiffies;
>>> +	uint msec_to_sleep;
>>>  
>>>  	if (dev->status == STATUS_STREAMING)
>>>  		return 0;
>>> @@ -298,6 +300,22 @@ static int hdpvr_start_streaming(struct hdpvr_device *dev)
>>>  	v4l2_dbg(MSG_BUFFER, hdpvr_debug, &dev->v4l2_dev,
>>>  			"video signal: %dx%d@%dhz\n", vidinf.width,
>>>  			vidinf.height, vidinf.fps);
>>> +	now_jiffies = get_jiffies_64();
>>> +	/* inline time_after64 since the result of the subtraction is needed for
>> The preferred style (Documentation/process/coding-style.rst) for multi-line comments
>> is to have the /* on a line of its own.
>>
>> Regards,
>>
>> 	Hans
>>
>>> +	 * the sleep
>>> +	 */
>>> +	delta_jiffies = dev->jiffies_next_start_streaming - now_jiffies;
>>> +	if ((__s64)delta_jiffies > 0) {
>>> +		/* device firmware may not be ready yet */
>>> +		msec_to_sleep = jiffies_to_msecs(delta_jiffies);
>>> +		v4l2_dbg(MSG_INFO, hdpvr_debug, &dev->v4l2_dev,
>>> +			 "firmware may not be ready, sleeping for %u ms\n",
>>> +			 msec_to_sleep);
>>> +		msleep(msec_to_sleep);
>>> +	} else {
>>> +		v4l2_dbg(MSG_INFO, hdpvr_debug, &dev->v4l2_dev,
>>> +			 "firmware assumed to be ready, not sleeping\n");
>>> +	}
>>>  
>>>  	/* start streaming 2 request */
>>>  	hdpvr_usb_lock(dev, HDPVR_USB_CTRL);
>>> @@ -332,6 +350,7 @@ static int hdpvr_stop_streaming(struct hdpvr_device *dev)
>>>  	int actual_length;
>>>  	uint c = 0;
>>>  	u8 *buf;
>>> +	u64 now_jiffies;
>>>  
>>>  	if (dev->status == STATUS_IDLE)
>>>  		return 0;
>>> @@ -368,6 +387,9 @@ static int hdpvr_stop_streaming(struct hdpvr_device *dev)
>>>  	kfree(buf);
>>>  	v4l2_dbg(MSG_BUFFER, hdpvr_debug, &dev->v4l2_dev,
>>>  		 "used %d urbs to empty device buffers\n", c-1);
>>> +	now_jiffies = get_jiffies_64();
>>> +	dev->jiffies_next_start_streaming = now_jiffies +
>>> +		msecs_to_jiffies(hdpvr_close_to_open_ms_delay);
>>>  	msleep(10);
>>>  
>>>  	dev->status = STATUS_IDLE;
>>> diff --git a/drivers/media/usb/hdpvr/hdpvr.h b/drivers/media/usb/hdpvr/hdpvr.h
>>> index 7b3d166da1dd..32498b7120aa 100644
>>> --- a/drivers/media/usb/hdpvr/hdpvr.h
>>> +++ b/drivers/media/usb/hdpvr/hdpvr.h
>>> @@ -43,6 +43,7 @@
>>>  /* #define HDPVR_DEBUG */
>>>  
>>>  extern int hdpvr_debug;
>>> +extern uint hdpvr_close_to_open_ms_delay;
>>>  
>>>  #define MSG_INFO	1
>>>  #define MSG_BUFFER	2
>>> @@ -95,6 +96,10 @@ struct hdpvr_device {
>>>  	struct v4l2_dv_timings	cur_dv_timings;
>>>  
>>>  	uint			flags;
>>> +	/* earliest jiffies at which the device firmware will be ready to start
>>> +	 * streaming
>>> +	 */
>>> +	u64			jiffies_next_start_streaming;
>>>  
>>>  	/* synchronize I/O */
>>>  	struct mutex		io_mutex;
>>>
>>
> 

