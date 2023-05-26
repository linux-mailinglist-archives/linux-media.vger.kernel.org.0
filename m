Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9F3712430
	for <lists+linux-media@lfdr.de>; Fri, 26 May 2023 12:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbjEZKGh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 May 2023 06:06:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbjEZKGg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 May 2023 06:06:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 647119E
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 03:06:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E8AF064ED9
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 10:06:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4A35C433EF;
        Fri, 26 May 2023 10:06:33 +0000 (UTC)
Message-ID: <a1e0324d-9409-52e4-96e7-577e8e987aa5@xs4all.nl>
Date:   Fri, 26 May 2023 12:06:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 13/13] media: bttv: convert to vb2
Content-Language: en-US
To:     Deborah Brouwer <deborah.brouwer@collabora.com>
Cc:     linux-media@vger.kernel.org
References: <cover.1682995256.git.deborah.brouwer@collabora.com>
 <b9c14229f95f8100a2fb17f4991163b513ad8691.1682995256.git.deborah.brouwer@collabora.com>
 <3286f56e-012b-44bd-b3dd-9b91a24d1a8c@xs4all.nl> <ZGJAa/0Y1u9gAuoV@db550>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <ZGJAa/0Y1u9gAuoV@db550>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Deb,

On 15/05/2023 16:59, Deborah Brouwer wrote:
> On Thu, May 11, 2023 at 05:29:14PM +0200, Hans Verkuil wrote:
>> Hi Deb,
>>
>> When testing this I was wondering why the sequence counter didn't detect dropped
>> frames (which happens when you start/stop a vbi stream while streaming video).
>>
>> On 02/05/2023 05:27, Deborah Brouwer wrote:
>>> -static void bttv_field_count(struct bttv *btv)
>>> -{
>>> -	int need_count = 0;
>>> -
>>> -	if (btv->users)
>>> -		need_count++;
>>> -
>>> -	if (need_count) {
>>> -		/* start field counter */
>>> -		btor(BT848_INT_VSYNC,BT848_INT_MASK);
>>> -	} else {
>>> -		/* stop field counter */
>>> -		btand(~BT848_INT_VSYNC,BT848_INT_MASK);
>>> -		btv->field_count = 0;
>>> -	}
>>> -}
>>
>> This is the root cause: this function is used to turn on VSYNC interrupts
>> and in the interrupt handler the field_count is incremented.
>>
>> In the vb1 version of this driver this field_count is passed on to vb1, which
>> uses it to set the sequence counter to field_count / 2.
>>
>> By removing this function the VSYNC irq is never enabled and so field_count is
>> always 0. So I think in bttv the seqnr field should be dropped and the field_count
>> mechanism re-instated.
>>
>> Comparing the number of dropped frames when starting/stopping vbi it looks like
>> in both cases (vb1 and vb2) one frame is dropped when starting vbi. But when
>> stopping vbi no frames are dropped in the vb1 case, but 3 in the vb2 case.
> 
> Ok, I used btv->field_count >> 1 to set the sequence numbers and I added VSYNC to
> the interrupt mask when start_streaming() is called. I can see the dropped video frames
> in v4l2-ctl when vbi starts and stops (or vice versa), but I am not sure if this means
> that we are actually dropping any valid, captured pixels.
> 
> The internal FIELD change signal (even/odd) that is picked up by VSYNC seems to run
> independently from capturing. For example, out of curiosity, I added VSYNC to the
> interrupt mask at probe, and it starts to increment field_count (and so the sequence
> numbers) immediately and continuously even though capture isn't enabled.

How exactly it is triggered, I'm not sure myself (I never dug deep enough into the
technical details), but remember that this is analog video, and it behaves quite
differently from modern video interfaces. Just think of the way old TVs worked: even
though there is no valid signal, you still get a picture (snow).

> So I am wondering if field_count is a totally reliable way to assign sequence numbers
> to the buffers. For example, using field_count, the buffer sequence numbers start with
> 3 instead of 0 in both vb1 and vb2 (sometimes it starts at 2 in vb2).
> Maybe the reason for this is that the field signal (even/odd) continues to be sent while
> the captured pixels are being input into the chip's FIFO buffer. The FIFO buffer is
> preparing the pixels for output by adding the timing/control
> information but hasn't yet made them available to be picked up by the DMA controller for
> output to memory. So, there is a disconnect, when streaming starts, between field_count
> (which keeps incrementing) and the actual availability of pixels.
> 
> Maybe there is a similar disconnect happening when vbi starts or stops. Instead of actually
> dropping pixels what we really have is just a delay in the RISC program that has to cycle
> through its instructions. vb2 has made this a bit worse when streaming stops because we wait
> for all the buffers to finish. I will investigate more if there is an easy way to fix this in vb2
> without changing the RISC program.

You can clearly see based on the timestamps that bttv really drops frames. That
corresponds with the field count that's based on the VSYNC.

An alternative to using the VSYNC would be to just use the timestamps and detect
if frames have been dropped.

> 
>>
>> Another thing I discovered is that for PAL the vcr_hack control has to be enabled,
>> otherwise the video is full of glitches. This was present before your series, and
>> happens even with a video signal from a proper PAL video generator, so this is really
>> strange. I can't remember that I needed this in the past, but it has been years
>> since I last tested it.
>>
>> PAL capture is fine for Top/Bottom/Alternate settings, it only fails for Interlaced
>> and Sequential Top/Bottom capture modes.
> 
> Interesting to know that this happened in your tests also.
> Obviously the easy solution would be just to enable the vcr_hack by default.
> It removes the last four scan lines and so prevents the risc program
> counter from getting stuck at a buffer memory address (which definitely
> causes dropped frames) instead of returning to the main risc program address.

Dropping 4 lines is really too much. A single line was sufficient to make it work
again for PAL, but it's just weird behavior.

Unfortunately, I won't have time to dig deeper into this and since it is not
something that this series introduced, I don't think it is important enough to
work on this, at least for now.

Regards,

	Hans

> 
>>
>> When I have more time I will dig into this a bit more.
>>
>> Regards,
>>
>> 	Hans

