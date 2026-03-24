Return-Path: <linux-media+bounces-56888-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONi2OAO2wmlolAQAu9opvQ
	(envelope-from <linux-media+bounces-56888-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 17:04:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D968318A52
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 17:04:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A8243089DFA
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 15:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84BD7389DF0;
	Tue, 24 Mar 2026 15:56:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B2A36C9E5
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 15:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774367768; cv=none; b=u54p9hbybZ4g0SODzoR0ojjmNSl4iUgtrClJcMSLwwkqdhaOJwJcXFdPZFRaRhKcMJd5aPgtamM/ZceDJmHQSY2iKZnPiy39YCoNNryRa0ErcJTw6NuHYqgnRueRE6lfPTBDQgEJ+MV2MdThBt2CI+F6mSYBbiAbcoHvT+pMtdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774367768; c=relaxed/simple;
	bh=j8p0Q4iAerml1vN8VvOM7FZwGN0liPBvxdYf4F9LQdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=pNDH+/XqsI3pwhEZMfbq9nRRRozka8n1Bm5vMuMcKX5YrRNAAOjwNpIuNuYMhtkyuAGE7Ttz/xnEXev7d762VgyIkiQxTZflo3Shp4HmnYtA+te/TE8egSejxdS6WEHeV2uU7CDR7eqrikN62CmW9gibrRw9PWNowiyPgpHjRoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1w546i-0001ad-Ic; Tue, 24 Mar 2026 16:55:52 +0100
Message-ID: <05de75cb-adc4-470e-bc67-3218b4180025@pengutronix.de>
Date: Tue, 24 Mar 2026 16:55:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/27] media: dt-bindings: media: rockchip-rga: add
 rockchip,rk3588-rga3
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
 <20260127-spu-rga3-v3-1-77b273067beb@pengutronix.de>
 <fc7b74095548d9c13a92d2944c1f5ca9f5c7dba5.camel@ndufresne.ca>
 <f2428e12-88c5-4b6e-a840-382e26da4541@pengutronix.de>
 <f5028eecdecedd9ea5e2a94d4fbf08b675e0842f.camel@ndufresne.ca>
Content-Language: en-US
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@pengutronix.de
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <f5028eecdecedd9ea5e2a94d4fbf08b675e0842f.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56888-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.pueschel@pengutronix.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pengutronix.de:email,pengutronix.de:mid,iotwrt.com:email]
X-Rspamd-Queue-Id: 7D968318A52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Nicolas,

On 3/24/26 1:55 PM, Nicolas Dufresne wrote:
> Le mardi 24 mars 2026 à 11:22 +0100, Sven Püschel a écrit :
>> Hi Nicolas,
>>
>> On 3/19/26 7:44 PM, Nicolas Dufresne wrote:
>>> Le mardi 27 janvier 2026 à 15:39 +0100, Sven Püschel a écrit :
>>>> Add a new compatible for the RGA3 (Raster Graphic Acceleration 3)
>>>> peripheral found on the RK3588 SoC. Also specify an iommu property,
>>>> as the RGA3 contains the generic rockchip iommu. The RGA2 also has
>>>> an iommu, but it's specific to the RGA2.
>>>>
>>>> The existing binding refers to the RGA2 peripheral. The RK3588
>>>> contains one RGA2 core and two RGA3 cores. Both feature a similar
>>>> functionality of scaling, cropping and rotating of up to two input
>>>> images into one output image. Key differences of the RGA3 are:
>>>>
>>>> - supports 10bit YUV output formats
>>>> - supports 8x8 tiles and FBCD as inputs and outputs
>>>> - supports BT2020 color space conversion
>>>> - max output resolution of (8192-64)x(8192-64)
>>>> - MMU can map up to 32G DDR RAM
>>>> - fully planar formats (3 planes) are not supported
>>>> - max scale up/down factor of 8 (RGA2 allows up to 16)
>>> Nothing import, but some more details on the differences can be found here.
>>>
>>> https://github.com/sravansenthiln1/rga-demos/tree/main
>>>
>>> They also removed from RGA3 the neural network quantization support
>>> (CLIP((source + offset) * scale). I suppose that integer tensors are fading
>>> away, and the accelerator does not do floats.
>> I've found a more complete list in the librga docs [1]. There are a
>> bunch of different RGA2 versions out there, the RGA2 from the rk3288
>> isn't the same as the RGA2-Enhanced contained in the rk3588/rk3399. Only
>> the latter one includes the NN features.
>>
>> [1]
>> https://github.com/airockchip/librga/blob/main/docs/Rockchip_Developer_Guide_RGA_EN.md#design-index
> That is a way better list, thanks.
>
>>> One things that isn't clear, even in the upstream RGA2 implementation is if the
>>> accelerator is cache coherent. When I study the BSP usage of RGA2, they
>>> integrate the RGA2 directly into GStreamer software video converter. They don't
>>> do anything to flush the cache, indicating that RGA2 is most probably cache
>>> coherent.
>>>
>>> Do you know if RGA3 has the same feature or if this is one of the difference ?
>>> Typically, RKIOMMU users are not, in RGA2, a completely custom mmu was used (and
>>> implemented inside the driver, as standalone).
>> I don't know. Looking at the vendor driver for the RGA3 it sets a cache
>> flush flag when the source is virtual memory (vs. dma-bufs and physical
>> memory). So I'd assume the RGA3 is not cache coherent. From a chat with
>> my colleagues, they found it a bit odd that the RGA2 should be cache
>> coherent, as it looks like a strange exception for a minor peripheral.
>>
>> Does this imply anything for my driver or is the whole cache coherency
>> handled by the underlying buffer handling or is this just for the
>> difference documentation?
>>
>> Btw. to which BSP do you refer?
> No implication, pretty much everything I looked in in rockchip-linux/kernel on
> github. Checking again, with a bit more knowledge then last time (but still very
> little), indeed, it seems that virtual address handling is similar to what VB2
> USERPTR code is doing. Basically, locks pages, and sync them in some ways.
>
> I was just trying to help gather what this driver is leaving behind.
>
>>>> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
>>>> ---
>>>>    .../devicetree/bindings/media/rockchip-rga.yaml       | 19 ++++++++++++++++++-
>>>>    1 file changed, 18 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/media/rockchip-rga.yaml b/Documentation/devicetree/bindings/media/rockchip-rga.yaml
>>>> index ac17cda65191b..7735d8794c719 100644
>>>> --- a/Documentation/devicetree/bindings/media/rockchip-rga.yaml
>>>> +++ b/Documentation/devicetree/bindings/media/rockchip-rga.yaml
>>>> @@ -9,7 +9,9 @@ title: Rockchip 2D raster graphic acceleration controller (RGA)
>>>>    description:
>>>>      RGA is a standalone 2D raster graphic acceleration unit. It accelerates 2D
>>>>      graphics operations, such as point/line drawing, image scaling, rotation,
>>>> -  BitBLT, alpha blending and image blur/sharpness.
>>>> +  BitBLT, alpha blending and image blur/sharpness. There exist two variants
>>>> +  named RGA2 and RGA3 that differ in the supported inputs/output formats,
>>>> +  the attached IOMMU and the supported operations on the input.
> We should say, "this driver supports two variants", rather then there exist. Can
> we clarify that we don't support BitBLT, I think it is miss-leading. In general,
> I found most 2D m2m fooling people into thinking, great, that chip is supported
> until they find that v4l2 m2m can only handle a tiny subset.

Isn't talking about drivers/implementation at this point incorrect? In 
my understanding the dt docs just describe the Hardware (which can do 
more than the m2m API supports).

Btw.: given the multitude of different RGA versions (as I've only found 
out recently through the librga docs) I'll adjust the docs to avoid 
implying that there only exists a RGA2 and RGA3. Instead more like 
"there exist various RGA versions" and that some SoCs (aka. the rk3588) 
contain RGA cores with different version (making the rga3 distiction 
necessary, as rk3588-rga doesn't imply if it's the RGA2-Enhanced or the 
RGA3 core).

Sincerely
     Sven

>
> Nicolas
>
>>>>    
>>>>    maintainers:
>>>>      - Jacob Chen <jacob-chen@iotwrt.com>
>>>> @@ -20,6 +22,7 @@ properties:
>>>>        oneOf:
>>>>          - const: rockchip,rk3288-rga
>>>>          - const: rockchip,rk3399-rga
>>>> +      - const: rockchip,rk3588-rga3
>>>>          - items:
>>>>              - enum:
>>>>                  - rockchip,rk3228-rga
>>>> @@ -45,6 +48,9 @@ properties:
>>>>      power-domains:
>>>>        maxItems: 1
>>>>    
>>>> +  iommus:
>>>> +    maxItems: 1
>>>> +
>>>>      resets:
>>>>        maxItems: 3
>>>>    
>>>> @@ -54,6 +60,17 @@ properties:
>>>>          - const: axi
>>>>          - const: ahb
>>>>    
>>>> +allOf:
>>>> +- if:
>>>> +    properties:
>>>> +      compatible:
>>>> +        contains:
>>>> +          enum:
>>>> +            - rockchip,rk3588-rga3
>>>> +  then:
>>>> +    required:
>>>> +      - iommus
>>>> +
>>> You really can't use this chip with CMA ?
>> Ah, no. I'd rather thought that this just describes that there is a
>> dedicated iommu (which also has a appropriate dt node) for this
>> peripheral. I'll just drop this block (which also fixes the indentation
>> issue).
>>
>> Sincerely
>>       Sven
>>
>>> Nicolas
>>>
>>>>    required:
>>>>      - compatible
>>>>      - reg

