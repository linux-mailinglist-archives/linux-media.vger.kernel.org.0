Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E709E5616E1
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 11:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234611AbiF3J4v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 05:56:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233974AbiF3J4u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 05:56:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 977C1433B4
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 02:56:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 022B9615BB
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 09:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE78C34115;
        Thu, 30 Jun 2022 09:56:46 +0000 (UTC)
Message-ID: <3f2f765e-72da-529c-b233-8585187eefdd@xs4all.nl>
Date:   Thu, 30 Jun 2022 11:56:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/7] media: v4l2: Make colorspace validity checks more
 future-proof
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de
References: <20220616183656.19089-1-laurent.pinchart@ideasonboard.com>
 <20220616183656.19089-5-laurent.pinchart@ideasonboard.com>
 <1d76d6bf-7809-edca-0d1a-9ab84e0c15ea@xs4all.nl>
 <Yr1w6Pt7mGpz+XWv@valkosipuli.retiisi.eu>
 <Yr1xWpyR37kPcM0c@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <Yr1xWpyR37kPcM0c@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 30/06/2022 11:48, Laurent Pinchart wrote:
> On Thu, Jun 30, 2022 at 12:46:16PM +0300, Sakari Ailus wrote:
>> On Wed, Jun 29, 2022 at 03:50:47PM +0200, Hans Verkuil wrote:
>>>> @@ -585,8 +585,8 @@ static inline bool v4l2_is_hsv_enc_valid(__u8 hsv_enc)
>>>>  
>>>>  static inline bool v4l2_is_quant_valid(__u8 quantization)
>>>>  {
>>>> -	return quantization == V4L2_QUANTIZATION_FULL_RANGE ||
>>>> -	       quantization == V4L2_QUANTIZATION_LIM_RANGE;
>>>> +	return quantization > V4L2_QUANTIZATION_DEFAULT &&
>>>> +	       quantization < V4L2_QUANTIZATION_LAST;
>>>
>>> There are only two quantization ranges: full and limited. And I very sincerely
>>> hope there will never be a third!
>>
>> For consistency of the checks and definitions I prefer it how it's in the
>> patch. There's no functional difference though.
> 
> I'm ready to send a pull request for this patch once you and Hans agree
> on how this should be done :-) I also have a slight preference for
> consistency. Hans, what do you think ?
> 

Quantization Range is quite different from the others: where the other colorimetry
settings are regularly extended with new variants, quantization range is not.
Limited vs Full range is really a reflection of two parallel developments: TV and
PC monitors. We're stuck with it, but it is highly unlikely someone will ever
introduce a third option for this.

So suggesting that it can be extended by introducing a V4L2_QUANTIZATION_LAST gives
the wrong signal IMHO.

Regards,

	Hans
