Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 735A7135C79
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2020 16:19:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732279AbgAIPTm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jan 2020 10:19:42 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:39617 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727945AbgAIPTm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 Jan 2020 10:19:42 -0500
Received: from [192.168.2.10] ([62.249.185.68])
        by smtp-cloud9.xs4all.net with ESMTPA
        id pZasihcxsT6sRpZaviL3MC; Thu, 09 Jan 2020 16:19:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578583180; bh=VNEi5PU7IG9NfDb52u/2pR82DSRm5KClWM9VRFCCDUo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=RhIcuWxZ9+hiD/y9DDq/k2ryV450adLGGpoEY9pPMi8aRaHitS67FsDwMo70iZ2vP
         g8sdS0liOzLVh9KB1/CvPIJyx8nP8CGXbSYUurfalOGLRqbgHMnV1GzGoHwSzPC/aR
         /MWedl7UUKNI1hNfahNa/XkqD0MLopaU0EbZaAsCO/WO/SSWvKQWgnj6i8aOGe1SOC
         acrckfmsfDrt8iAiOE91+OHWhrhBAbu3AkP0TbJZ5RwGiaTFdfFsSKaCoDdLu6GFfg
         gr19sPlqN/gDm2AwtMSTOiQIlkHdEhe4EghCb1yWi4500WH5Qil6kasAeWcRIlxSif
         d0mZY5Li0VXxA==
Subject: Re: [PATCH v2 1/4] media: uapi: hevc: Add scaling matrix control
To:     =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@siol.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     mripard@kernel.org, gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org
References: <20191213160428.54303-1-jernej.skrabec@siol.net>
 <20200108151157.17cf9774@kernel.org> <20200108144336.GB229960@aptenodytes>
 <3030664.44csPzL39Z@jernej-laptop>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <16682efd-763a-8cb1-c5ee-b48ee6063c6b@xs4all.nl>
Date:   Thu, 9 Jan 2020 16:19:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3030664.44csPzL39Z@jernej-laptop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfOF7U22xoTpAUEvOw1tUUHvhY8l8MGCYN6pm66YVC1msyl/wb+aPV6ofqVnScSZSFqW+nC1UviknZzPIYd5r6e+AywVxKkehHqEolEDAW0goIbOeEpdT
 xYnO5Xi82/ote3XVG+kxN7/LU0Cjo7M0yO2o4lkJ/HlDHFwxSgFqdiFmckw7gLb8dizx5TpRR/ZbW0LDNmoW99uojm0xmYQr3dJ9HFwdY+JlMi4mKTMcMRo7
 M3xUSygvwUCUNPkJHqtAWpIfvdfV2vf7yYxwhLPUYXpk1RMEk1TfV2CEwDH3gyUhYo17zoIEBuFS8wr5pu49HLLhKUb+n7pPvEt87XpRHIAb07On6pfHyZ+h
 3Qy7V+SUOQiifwumvZgQJYnsilU8xYP7ezbz4JgivjXT2/PY1KtXwv1yenNj6zcNFD7K7J/tsMy69vUwsNwMnQMAl9RQvb8BKPAuXIa+0hvNgV7CkHXjpzA1
 5Fuli1a9Nd1fKEm2YMv2dTAIvJCr6OlYmL2oQlwcw3+tJV09eD4M7ZGzLB4=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/9/20 4:17 PM, Jernej Škrabec wrote:
> Hi!
> 
> Dne sreda, 08. januar 2020 ob 15:43:36 CET je Paul Kocialkowski napisal(a):
>> Hi Mauro,
>>
>> On Wed 08 Jan 20, 15:11, Mauro Carvalho Chehab wrote:
>>> Em Fri, 13 Dec 2019 17:04:25 +0100
>>>
>>> Jernej Skrabec <jernej.skrabec@siol.net> escreveu:
>>>> HEVC has a scaling matrix concept. Add support for it.
>>>>
>>>> +struct v4l2_ctrl_hevc_scaling_matrix {
>>>> +	__u8	scaling_list_4x4[6][16];
>>>> +	__u8	scaling_list_8x8[6][64];
>>>> +	__u8	scaling_list_16x16[6][64];
>>>> +	__u8	scaling_list_32x32[2][64];
>>>> +	__u8	scaling_list_dc_coef_16x16[6];
>>>> +	__u8	scaling_list_dc_coef_32x32[2];
>>>> +};
>>>
>>> I never looked at HEVC spec, but the above seems really weird.
>>>
>>> Please correct me if I am wrong, but each of the above matrixes
>>> is independent, and the driver will use just one of the above on
>>> any specific time (for a given video output node), right?
>>
>> I am not too sure about what the specification really entails, but it is my
>> understanding that HEVC allows simultaneous block sizes between 4x4 and
>> 32x32 to exist within the same coding tree and slice. That suggests that it
>> makes sense to have specific coefficients for each case.
> 
> Specs ITU-T REC. H.265 (06/2019), chapter 7.3.4 shows that multiple different 
> matrices can be present at the same time. If they are not, default values 
> should be used instead. But in general, more than one can be needed at the 
> same time.
> 
> Only real question is if default values should be also provided by userspace 
> or by kernel. Since place has to be reserved for all different scaling lists 
> anyway, we won't save any space by providing default values in kernel. Cedrus 
> VPU has only bit switch for using default values for all matrices at the same 
> time or all custom.
> 
> Note that this control contains slightly processed data. Frame has stored 
> these matrices in form of deltas. But because this is the only driver that use 
> this structure I have no idea what is the most proper form of this data (raw 
> values or deltas). That's why this will stay in staging using private headers 
> until we figure this out.

This definitely needs to be documented! Otherwise this will be forgotten.

Regards,

	Hans

> 
> Best regards,
> Jernej
> 
>>
>> Note that the hardware also has distinct registers for each scaling list.
>>
>> Cheers,
>>
>> Paul
>>
>>> If so, why would userspace be forced to update lots of matrixes, if would
>>> likely use just one at a given time?
>>>
>>> IMO, the proper way would be, instead, to use an uAPI like:
>>>
>>> /*
>>>
>>>  * Actually, as this is uAPI, we will use a fixed size integer type, like
>>>  *  unsigned int
>>>  */
>>>
>>> enum hevc_scaling_matrix_type {
>>>
>>> 	HEVC_SCALING_MATRIX_4x4,
>>> 	HEVC_SCALING_MATRIX_8x8,
>>>
>>> ...
>>>
>>> 	HEVC_SCALING_MATRIX_DC_COEF_32x32,
>>>
>>> };
>>>
>>> struct v4l2_ctrl_hevc_scaling_matrix {
>>>
>>> 	__u32	scaling_type 		/* as defined by enum 
> hevc_scaling_matrix_type */
>>> 	
>>> 	union {
>>> 	
>>> 		__u8	scaling_list_4x4[6][16];
>>> 		__u8	scaling_list_8x8[6][64];
>>> 		__u8	scaling_list_16x16[6][64];
>>> 		__u8	scaling_list_32x32[2][64];
>>> 		__u8	scaling_list_dc_coef_16x16[6];
>>> 		__u8	scaling_list_dc_coef_32x32[2];
>>> 	
>>> 	};
>>>
>>> };
>>>
>>> And let the core use a default for each scaling matrix, if userspace
>>> doesn't set it.
>>>
>>>
>>>
>>> Cheers,
>>> Mauro
> 
> 
> 
> 

