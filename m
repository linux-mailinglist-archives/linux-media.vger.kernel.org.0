Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19B2755FF24
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 13:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232978AbiF2L6U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 07:58:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbiF2L6S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 07:58:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D74012096
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 04:58:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B702A61B6F
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 11:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4620FC341D8;
        Wed, 29 Jun 2022 11:58:14 +0000 (UTC)
Message-ID: <5ff3220b-d8c9-430b-7e7a-621746ccf23d@xs4all.nl>
Date:   Wed, 29 Jun 2022 13:58:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] media: stm32: dcmi: Switch to
 __v4l2_subdev_state_alloc()
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Alain Volmat <alain.volmat@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Hugues FRUCHET <hugues.fruchet@foss.st.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philippe CORNU <philippe.cornu@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20220627174156.66919-1-marex@denx.de>
 <3ef88906-188d-52a6-c3bf-647bc4e36732@xs4all.nl>
 <c4abd47e-a721-b92f-c84a-bdb6436d997d@denx.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <c4abd47e-a721-b92f-c84a-bdb6436d997d@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/06/2022 13:04, Marek Vasut wrote:
> On 6/29/22 11:41, Hans Verkuil wrote:
>> Hi Marek, Tomi, Laurent,
> 
> Hi,
> 
> [...]
> 
>>>   drivers/media/platform/st/stm32/stm32-dcmi.c | 59 ++++++++++++--------
>>>   1 file changed, 37 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
>>> index c604d672c2156..c68d32931b277 100644
>>> --- a/drivers/media/platform/st/stm32/stm32-dcmi.c
>>> +++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
>>> @@ -996,22 +996,30 @@ static int dcmi_try_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f,
>>>               struct dcmi_framesize *sd_framesize)
>>>   {
>>>       const struct dcmi_format *sd_fmt;
>>> +    static struct lock_class_key key;
>>>       struct dcmi_framesize sd_fsize;
>>>       struct v4l2_pix_format *pix = &f->fmt.pix;
>>> -    struct v4l2_subdev_pad_config pad_cfg;
>>> -    struct v4l2_subdev_state pad_state = {
>>> -        .pads = &pad_cfg
>>> -        };
>>> +    struct v4l2_subdev_state *sd_state;
>>>       struct v4l2_subdev_format format = {
>>>           .which = V4L2_SUBDEV_FORMAT_TRY,
>>>       };
>>>       bool do_crop;
>>>       int ret;
>>>   +    /*
>>> +     * FIXME: Drop this call, drivers are not supposed to use
>>> +     * __v4l2_subdev_state_alloc().
>>> +     */
>>> +    sd_state = __v4l2_subdev_state_alloc(dcmi->source, "dcmi:state->lock", &key);
>>> +    if (IS_ERR(sd_state))
>>> +        return PTR_ERR(sd_state);
>>> +
>>
>> I've been reading the discussion for the v1 patch, and I seriously do not like this.
>>
>> My comments are not specifically for this patch, but for all cases where
>> __v4l2_subdev_state_alloc is called.
>>
>> It is now used in 4 drivers, so that's no longer a rare case, and the code isn't
>> exactly trivial either.
>>
>> I think a helper function might be beneficial, but the real problem is with the
>> comment: it does not explain why you shouldn't use it and what needs to be done
>> to fix it.
>>
>> My suggestion would be to document that in the kerneldoc for this function in
>> media/v4l2-subdev.h, and then refer to that from this comment (and similar comments
>> in the other drivers that use this).
> 
> Would it be OK if I left the core rework/documentation to Tomi as a subsequent patch to this one ?

Yes. It would be nice if Tomi can make a patch fixing the comments as suggested above,
and then your patch can go on top. Adding a helper function can be done later, it's
not my main concern.

> 
>> And another question: are more drivers affected by this? Is it possible to
>> find those and fix them all?
> 
> Probably, I only ran into it with the DCMI so far.

Tomi, do you know?

Regards,

	Hans
