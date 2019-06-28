Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 622ED59D7E
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 16:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbfF1OIu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 10:08:50 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:33437 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726686AbfF1OIu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 10:08:50 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id grYRhmatqSfvXgrYVhSH9J; Fri, 28 Jun 2019 16:08:47 +0200
Subject: Re: [PATCH 01/31] staging: bcm2835-camera: Ensure H264 header bytes
 get a sensible timestamp
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Cc:     Stefan Wahren <wahrenst@gmx.net>, Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" 
        <linux-rpi-kernel@lists.infradead.org>,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        LMML <linux-media@vger.kernel.org>
References: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
 <1561661788-22744-2-git-send-email-wahrenst@gmx.net>
 <5e20b1d04b3c2f64173631ec2f0261a8a9597f0c.camel@ndufresne.ca>
 <CAAoAYcOvnF55U0kPMFE4cOd=nUqjoidirbGP6AWN=5Rqp0RhbQ@mail.gmail.com>
 <54088ebc2fcbcc3a202ab0fd4d32f9ad8c1e9b82.camel@ndufresne.ca>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <df6c4e8e-9182-f629-2bd7-a36b5697f382@xs4all.nl>
Date:   Fri, 28 Jun 2019 16:08:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <54088ebc2fcbcc3a202ab0fd4d32f9ad8c1e9b82.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfAFVr8kH07cqrycMoPg0UKoxLhH4ZEyplXokG0GMZIGrINjoHgRTsy1BaOcnzWmK6oLyxeL3/noA1gwtMP/gwqCLEH+BOikyuE9OqYvyR+mUcTmx3L/k
 7BV/S1j2Ybk/J4mrhBrH9jZ8GL470m3J7CPvCl9cYWrt07Djb5RcoIbBx1G1UWm8k+pyEtgwJJzApxM3wOhhiIihbBMIV4RlSunb5Z8+kYbKcTJiR1R/P+dB
 RumRySCmILVB2VH0PhrTEauSp9Bl7xmk+3pdx1YUyBzdURFJ+H+GnRmJIjnVEfME7yX13RdMry7O31VPTlanBi9LqsfZ97ISg2Crs+Wjz25XnScTc0SaDkNt
 5Ch6kIvugMGuP+ToOrL+w78VGNWWyiXogFOlR/+ev/HPsDUtNSgvub0at6jzrn5KSwfk1Oh7+4FbMLxfXC3fx+N+1yKjzVQrPKsnqxT1v9IwM3EZy5MbozJu
 DfEJgSFooPOFVj57cHFp5q8KyRBTzgeHWvxmBJF8Wwu9k1DDff55gp0q75Q=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/28/19 4:00 PM, Nicolas Dufresne wrote:
> Le vendredi 28 juin 2019 à 11:10 +0100, Dave Stevenson a écrit :
>> Hi Nicolas
>>
>> On Thu, 27 Jun 2019 at 20:55, Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
>>> Hi Dave,
>>>
>>> Le jeudi 27 juin 2019 à 20:55 +0200, Stefan Wahren a écrit :
>>>> From: Dave Stevenson <dave.stevenson@raspberrypi.org>
>>>>
>>>> H264 header come from VC with 0 timestamps, which means they get a
>>>> strange timestamp when processed with VC/kernel start times,
>>>> particularly if used with the inline header option.
>>>> Remember the last frame timestamp and use that if set, or otherwise
>>>> use the kernel start time.
>>>
>>> Normally H264 headers are considered to be part of the following frame.
>>> Giving it the timestamp of the previous frame will likely confuse some
>>> userspace and cause an off-by-one in timestamp. I understand this is a
>>> workaround, but am wondering if this can be improved.
>>
>> Sorry, slight ambiguity in how I'm reading your comment.
>>
>> Are you saying that the header bytes want to be in the same buffer as
>> the following frame?
>> I thought this had also been discussed in the V4L2 stateful codec API
>> threads along with how many encoded frames were allowed in a single
>> V4L2 buffer. I certainly hadn't seen a statement about the header
>> bytes being combined with the next frame.
>> If the behaviour required by V4L2 is that header bytes and following
>> frame are in the same buffer, then that is relatively easy to achieve
>> in the firmware. This workaround can remain for older firmware as it
>> will never trigger if the firmware has combined the frames.
> 
> The frame alignment is a requirement specific to the stateful codec
> API.

Is it? I don't remember it being specified anywhere explicitly.
Here is the latest text:

https://hverkuil.home.xs4all.nl/codec-api/uapi/v4l/dev-encoder.html

I'll start a new thread about this, since this really needs to be
clarified.

Regards,

	Hans

 Stateful codec must interpret _H264 format as being one full frame
> per buffer (1 AU in progressive, and 1 to 2 AU in interlaced), the
> first frame should include SPS/PPS and any other prefix NALs. You may
> follow this rule in your capture driver if you want to make it possible
> to zero-copy the encoded frames from the capture to the decoder.
> Though, userspace will still have to parse as there is no indication
> for capture devices of the H264 alignment being used (that imply 1
> frame latency). Boris is working on a control for stateless CODEC to
> control if we are running in full-frame or per slices. I do hope this
> control will be extended later to allow cameras and decoders to signal
> their alignment, or simply to allow enabling low-latency modes
> supported by CODA and ZynMP firmwares.
> 
>>
>> Or are you saying that the header bytes remain in their own buffer,
>> but the timestamp wants to be the same as the next frame? That is
>> harder to achieve in the firmware, but could probably be done in the
>> kernel driver by holding on to the header bytes frame until the next
>> buffer had been received, at which point the timestamp can be copied
>> across. Possible, but just needs slightly careful handling to ensure
>> we don't lose buffers accidentally.
> 
> So this isn't specified by V4L2 itself. So instead I rely on H264 and
> MPEG TS specification to advance this. This is also the interpretation
> we have of timestamp in GStreamer (ffmpeg uses out-of-band headers with
> full frame AVC, so this does not apply).
> 
> So H264 AUD, SPS, PPS, SEI and other prefix NAL are considered to be
> the start of a frame. With this interpretation in mind, accumulating
> them is considered zero-latency. This basically means that if they are
> to have a timestamp, they would share that timestamp with all the
> slices of the same frame. In GStreamer, we have the notion of no
> timestamp, so in such a case we'd leave the timestamp empty and our
> parsers would pick the first valid timestamp that formed the full frame
> as being the frame timestamp (it's a bit buggier then that, but that's
> what it's suppose to do).
> 
> On top of that, if you don't have any meaningful alignment in your H264
> stream, the MPEG TS format states that the timestamp of a buffer should
> be the timestamp of the first NAL starting within this buffer, or the
> timestamp of the current NAL if there is not NAL start.
> 
> By respecting these standards you ensure that latency aware application
> can work with your driver without causing delays, or worst, having to
> deal with artificially late frames.
> 
> I hope this clarify and helps understand my request for "unhacking" the
> headers timestamps. I had assumed the timestamp came from the driver
> (instead of from the firmware), sorry if that caused confusion. If
> merging full frames is easier, I think I would opt for that as it's
> beneficial to performance when combined with other full frame APIs.
> 
> Nicolas
> 
>>
>>   Dave
>>
>>>> Link: https://github.com/raspberrypi/linux/issues/1836
>>>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
>>>> ---
>>>>  .../staging/vc04_services/bcm2835-camera/bcm2835-camera.c  | 14 ++++++++++++--
>>>>  .../staging/vc04_services/bcm2835-camera/bcm2835-camera.h  |  2 ++
>>>>  2 files changed, 14 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
>>>> index dce6e6d..0c04815 100644
>>>> --- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
>>>> +++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
>>>> @@ -359,7 +359,9 @@ static void buffer_cb(struct vchiq_mmal_instance *instance,
>>>>               }
>>>>       } else {
>>>>               if (dev->capture.frame_count) {
>>>> -                     if (dev->capture.vc_start_timestamp != -1 && pts) {
>>>> +                     if (dev->capture.vc_start_timestamp != -1) {
>>>> +                             buf->vb.vb2_buf.timestamp = ktime_get_ns();
>>>> +                     } else if (pts) {
>>>>                               ktime_t timestamp;
>>>>                               s64 runtime_us = pts -
>>>>                                   dev->capture.vc_start_timestamp;
>>>> @@ -372,8 +374,15 @@ static void buffer_cb(struct vchiq_mmal_instance *instance,
>>>>                                        ktime_to_ns(timestamp));
>>>>                               buf->vb.vb2_buf.timestamp = ktime_to_ns(timestamp);
>>>>                       } else {
>>>> -                             buf->vb.vb2_buf.timestamp = ktime_get_ns();
>>>> +                             if (dev->capture.last_timestamp) {
>>>> +                                     buf->vb.vb2_buf.timestamp =
>>>> +                                             dev->capture.last_timestamp;
>>>> +                             } else {
>>>> +                                     buf->vb.vb2_buf.timestamp =
>>>> +                                             ktime_to_ns(dev->capture.kernel_start_ts);
>>>> +                             }
>>>>                       }
>>>> +                     dev->capture.last_timestamp = buf->vb.vb2_buf.timestamp;
>>>>
>>>>                       vb2_set_plane_payload(&buf->vb.vb2_buf, 0, length);
>>>>                       vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
>>>> @@ -541,6 +550,7 @@ static int start_streaming(struct vb2_queue *vq, unsigned int count)
>>>>                        dev->capture.vc_start_timestamp, parameter_size);
>>>>
>>>>       dev->capture.kernel_start_ts = ktime_get();
>>>> +     dev->capture.last_timestamp = 0;
>>>>
>>>>       /* enable the camera port */
>>>>       dev->capture.port->cb_ctx = dev;
>>>> diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h
>>>> index 2b5679e..09273b0 100644
>>>> --- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h
>>>> +++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h
>>>> @@ -90,6 +90,8 @@ struct bm2835_mmal_dev {
>>>>               s64         vc_start_timestamp;
>>>>               /* Kernel start timestamp for streaming */
>>>>               ktime_t kernel_start_ts;
>>>> +             /* Timestamp of last frame */
>>>> +             u64             last_timestamp;
>>>>
>>>>               struct vchiq_mmal_port  *port; /* port being used for capture */
>>>>               /* camera port being used for capture */
>>>> --
>>>> 2.7.4
>>>>

