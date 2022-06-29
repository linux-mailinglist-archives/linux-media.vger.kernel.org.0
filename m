Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 389E555FE33
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 13:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbiF2LFD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 07:05:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232813AbiF2LEt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 07:04:49 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6867A3D482
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 04:04:43 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id AB874801C3;
        Wed, 29 Jun 2022 13:04:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1656500680;
        bh=Itm2HcTS0UVX0IwR2cN/zN3rDcTcHySEnwbQlGTUGvE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=QWsrGxA6yKjNj+CN6I/xPwkYnROQoLKwfd5Srsnq11iN0gIm7LwDeA643vS6fKuh/
         6STbhwSRX2slI7UnmbUOT940hulObf+w2F8qYjI5zRFRoLxDbGBxxzU0tB0qwtZcsm
         M0/bc4HrluHnnZhHBveFaIwLNUHEoBaJeSYFSvNVh5bobIKd1fzG+yYrbWXaIxHAsh
         +GJS56xgCScKjcY4Qz/z1TU5g5VSdBT6usTjq+Jqn+CKj91N72IT6ZD+0o9BFYvHzj
         9xtVPGFycsmDpa6vPHoOcmRF6A3V9hpDyVsyB/3yqVFahASvTvWyngtBCApQ0Jym07
         VCttic8lmeFHg==
Message-ID: <c4abd47e-a721-b92f-c84a-bdb6436d997d@denx.de>
Date:   Wed, 29 Jun 2022 13:04:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] media: stm32: dcmi: Switch to
 __v4l2_subdev_state_alloc()
Content-Language: en-US
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     Alain Volmat <alain.volmat@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Hugues FRUCHET <hugues.fruchet@foss.st.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philippe CORNU <philippe.cornu@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20220627174156.66919-1-marex@denx.de>
 <3ef88906-188d-52a6-c3bf-647bc4e36732@xs4all.nl>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <3ef88906-188d-52a6-c3bf-647bc4e36732@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/29/22 11:41, Hans Verkuil wrote:
> Hi Marek, Tomi, Laurent,

Hi,

[...]

>>   drivers/media/platform/st/stm32/stm32-dcmi.c | 59 ++++++++++++--------
>>   1 file changed, 37 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
>> index c604d672c2156..c68d32931b277 100644
>> --- a/drivers/media/platform/st/stm32/stm32-dcmi.c
>> +++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
>> @@ -996,22 +996,30 @@ static int dcmi_try_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f,
>>   			struct dcmi_framesize *sd_framesize)
>>   {
>>   	const struct dcmi_format *sd_fmt;
>> +	static struct lock_class_key key;
>>   	struct dcmi_framesize sd_fsize;
>>   	struct v4l2_pix_format *pix = &f->fmt.pix;
>> -	struct v4l2_subdev_pad_config pad_cfg;
>> -	struct v4l2_subdev_state pad_state = {
>> -		.pads = &pad_cfg
>> -		};
>> +	struct v4l2_subdev_state *sd_state;
>>   	struct v4l2_subdev_format format = {
>>   		.which = V4L2_SUBDEV_FORMAT_TRY,
>>   	};
>>   	bool do_crop;
>>   	int ret;
>>   
>> +	/*
>> +	 * FIXME: Drop this call, drivers are not supposed to use
>> +	 * __v4l2_subdev_state_alloc().
>> +	 */
>> +	sd_state = __v4l2_subdev_state_alloc(dcmi->source, "dcmi:state->lock", &key);
>> +	if (IS_ERR(sd_state))
>> +		return PTR_ERR(sd_state);
>> +
> 
> I've been reading the discussion for the v1 patch, and I seriously do not like this.
> 
> My comments are not specifically for this patch, but for all cases where
> __v4l2_subdev_state_alloc is called.
> 
> It is now used in 4 drivers, so that's no longer a rare case, and the code isn't
> exactly trivial either.
> 
> I think a helper function might be beneficial, but the real problem is with the
> comment: it does not explain why you shouldn't use it and what needs to be done
> to fix it.
> 
> My suggestion would be to document that in the kerneldoc for this function in
> media/v4l2-subdev.h, and then refer to that from this comment (and similar comments
> in the other drivers that use this).

Would it be OK if I left the core rework/documentation to Tomi as a 
subsequent patch to this one ?

> And another question: are more drivers affected by this? Is it possible to
> find those and fix them all?

Probably, I only ran into it with the DCMI so far.
