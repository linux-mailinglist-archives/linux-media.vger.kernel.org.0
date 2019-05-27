Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBA512B7F7
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 16:58:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbfE0O6l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 May 2019 10:58:41 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:33365 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726115AbfE0O6l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 May 2019 10:58:41 -0400
Received: from [IPv6:2001:983:e9a7:1:10b2:2e62:e4b1:bd13] ([IPv6:2001:983:e9a7:1:10b2:2e62:e4b1:bd13])
        by smtp-cloud7.xs4all.net with ESMTPA
        id VH5Chbt4F3qlsVH5DhdHAY; Mon, 27 May 2019 16:58:39 +0200
Subject: Re: [PATCH v6 3/5] media: dt-bindings: media: Add vendor prefix for
 allegro
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org,
        tfiga@chromium.org, dshah@xilinx.com, Rob Herring <robh@kernel.org>
References: <20190513172131.15048-1-m.tretter@pengutronix.de>
 <20190513172131.15048-4-m.tretter@pengutronix.de>
 <3e65382c-f120-8310-5407-6a6a115913f2@xs4all.nl>
 <20190527165729.540d457e@litschi.hi.pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c1f2aa85-4d6e-86a7-b627-a0463ff5e802@xs4all.nl>
Date:   Mon, 27 May 2019 16:58:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190527165729.540d457e@litschi.hi.pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPYRCU/sGXrJ0vmCAqLXT3q1VO5OgT2ntsl/8XyKTHT9Resycl2WVoBGrefDo+aed/THBdWp4KM6TNQuSNCS9OG70osd4Hi275GN56fWQAXdZ4lysdMM
 I+ZJfa+VLTqwnigRNH/THv+9WmGESF/hd2rcdiD+mb35ICay+Pjsw3iWIb8dxG+Gl95riuklgCRIlbawOy2rBUkWaBhofdrSGEQSfxiwvWZfoXC3h8GpD724
 9t7z1j7O6sfcwjbLr6qflV1lAXRfyJgWPtEo3YR+WEqFncYV+MN8RCZ92SQ1K4pORQj0WiAjfCKTo6dH24hRRGLm2Jhrg6m33KOpU5fgT571XMEKw0sMTQlE
 1i3aY3DlOBTrQSHqXaCZVdGeUXNjGGRmcSPnqMhi1qWTrVlQIN0litMIv9VPsphT4FunPonZa/9f7uvsary8/O9Asi1m2dIPUQ0vkcI/Uv51HTPMsQ+P8IHb
 BA85eHy6G/0otYFQ8Au+YE5/7Scg84MIj2LcXgRAoUFaPfDGf7bOytW1+XI=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/27/19 4:57 PM, Michael Tretter wrote:
> On Mon, 27 May 2019 16:35:24 +0200, Hans Verkuil wrote:
>> This patch no longer applies (vendor-prefixes.txt is now vendor-prefixes.yaml).
>> Can you rebase this patch?
> 
> Should I rebase the entire series and send a v7 or is it enough to
> rebase only this patch?

Up to you, I have no preference.

Regards,

	Hans

> 
> Michael
> 
>>
>> Regards,
>>
>> 	Hans
>>
>> On 5/13/19 7:21 PM, Michael Tretter wrote:
>>> Add vendor prefix for Allegro DVT, a provider of H.264/AVC, H.265/HEVC,
>>> AVS2, VP9 and AV1 compliance test suites and H.264/AVC, H.265/HEVC, and
>>> VP9 encoder, codec and decoder hardware (RTL) IPs.
>>>
>>> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>> ---
>>> v5 -> v6:
>>> none
>>>
>>> v5:
>>> - new patch
>>> ---
>>>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
>>> index 8162b0eb4b50..78a849b25f64 100644
>>> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
>>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
>>> @@ -16,6 +16,7 @@ adi	Analog Devices, Inc.
>>>  advantech	Advantech Corporation
>>>  aeroflexgaisler	Aeroflex Gaisler AB
>>>  al	Annapurna Labs
>>> +allegro	Allegro DVT
>>>  allo	Allo.com
>>>  allwinner	Allwinner Technology Co., Ltd.
>>>  alphascale	AlphaScale Integrated Circuits Systems, Inc.
>>>   
>>
>>

