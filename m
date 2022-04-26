Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8C7750F079
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 07:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233192AbiDZFzY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 01:55:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232297AbiDZFzX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 01:55:23 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B21446C979
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 22:52:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 2A866CE19B7
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 05:52:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4126AC385A0;
        Tue, 26 Apr 2022 05:52:12 +0000 (UTC)
Message-ID: <63c20ead-6c83-64ab-3178-7629d5df5008@xs4all.nl>
Date:   Tue, 26 Apr 2022 07:52:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/7] media: coda: set output buffer bytesused to appease
 v4l2-compliance
Content-Language: en-US
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@pengutronix.de
References: <20220404163533.707508-1-p.zabel@pengutronix.de>
 <3b1ace8f-a425-6a61-cb97-39e93100e75c@xs4all.nl>
 <2d160491ffdba0642e2bda6096524d10ad2b647d.camel@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <2d160491ffdba0642e2bda6096524d10ad2b647d.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-8.5 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/04/2022 12:24, Philipp Zabel wrote:
> Hi Hans,
> 
> On Do, 2022-04-21 at 11:44 +0200, Hans Verkuil wrote:
>> On 04/04/2022 18:35, Philipp Zabel wrote:
>>> The V4L2 specification states:
>>>
>>>  "If the application sets this to 0 for an output stream, then bytesused
>>>   will be set to the size of the buffer (see the length field of this
>>>   struct) by the driver."
>>>
>>> Since we set allow_zero_bytesused, we have to handle this ourselves.
>>>
>>> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
>>> ---
>>>  drivers/media/platform/chips-media/coda-bit.c | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/media/platform/chips-media/coda-bit.c b/drivers/media/platform/chips-media/coda-bit.c
>>> index c484c008ab02..705a179ea8f0 100644
>>> --- a/drivers/media/platform/chips-media/coda-bit.c
>>> +++ b/drivers/media/platform/chips-media/coda-bit.c
>>> @@ -381,6 +381,9 @@ void coda_fill_bitstream(struct coda_ctx *ctx, struct list_head *buffer_list)
>>>  		/* Dump empty buffers */
>>>  		if (!vb2_get_plane_payload(&src_buf->vb2_buf, 0)) {
>>>  			src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
>>> +			vb2_set_plane_payload(&src_buf->vb2_buf, 0,
>>> +					      vb2_plane_size(&src_buf->vb2_buf,
>>> +							     0));
>>
>> Would it be possible to stop using allow_zero_bytesused altogether?
>>
>> Are there still applications that rely on zero-sized output buffers to stop the
>> decoder?
> 
> This was used by GStreamer 1.8. The code is still left in current
> versions, but is never executed unless the decoder stop command fails:
> 
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/blob/main/subprojects/gst-plugins-good/sys/v4l2/gstv4l2videodec.c#L446-454
> 
> Whether there are still any applications using GStreamer 1.8 for V4L2
> video decoding on devices that get kernel updates, I don't know.
> 
>> I'm not actually sure that I want this in the driver, perhaps v4l2-compliance
>> can be modified to turn a fail into a warn if the driver is the coda driver.
> 
> Same for nxp/imx-jpeg, qcom/venus and samsung/s5p-mfc?

Yes for venus and s5p, but why would imx-jpeg use this? It makes no sense
for a jpeg codec. I think it should just be removed for imx-jpeg.

IMHO, once a decoder supports the STOP command, it should no longer set
allow_zero_bytesused to true. But that decision is up to you for the coda
driver.

Regards,

	Hans

> 
>> Patching the driver is hiding the fact that the coda driver does something
>> non-standard for legacy reasons. It doesn't make sense either to change
>> bytesused to the buffer size since there really is nothing in the buffer.
>>
>> v4l2-compliance already has checks for two drivers, search for is_vivid and
>> is_uvcvideo.
> 
> Ok.
> 
>> I'm skipping this patch for now.
> 
> regards
> Philipp

