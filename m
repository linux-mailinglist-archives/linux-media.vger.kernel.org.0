Return-Path: <linux-media+bounces-51744-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LbYJ4Ygemmv2wEAu9opvQ
	(envelope-from <linux-media+bounces-51744-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 15:43:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E427A3042
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 15:43:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E51B7302E0C6
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 14:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89E53A1CD;
	Wed, 28 Jan 2026 14:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VskxW8cQ"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F66352FA5;
	Wed, 28 Jan 2026 14:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769611311; cv=none; b=e0HBp8f61sNnvmduZpyJ+4kIvQmKJ5t5sfjBsAgMrxAfNmIPytHq1xO7FuID/RjOcbgz8m3+D9anFPga3EVkKy4SEWGEsPlvaU0v/bCHSHTHckfttcwlHwzncWJq2JPkA468wu2G2l+4ESYVbQumfVq6hJMPZR53868xwmguTdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769611311; c=relaxed/simple;
	bh=wAlJzcsh4bYcVJgHM5D12nidM5/BBv4ehJTvbKYkBXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IIrUM3ts6hTFa1X1EweK1vdx6EIzT5kqcgfLlX3/e6XpfRHSC+B0BGCN9ULRSpdWFrlPI0Sfd4/szCe/bEGQ8zKGukx7dVLLDMUwBu0HpE4ElGTm4Zvcdi8G1+RiNE3cS3bMhN9u0BW8a71rutQexorXh2L+F2BZH6hlsoa7m10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VskxW8cQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769611307;
	bh=wAlJzcsh4bYcVJgHM5D12nidM5/BBv4ehJTvbKYkBXY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VskxW8cQHOvCgDxJWR5jQb0a7ljthDHhE46HFb7V4NWE6bTMUh6bjUOb1KcTt6PTd
	 OfzE5i91d4FrRg9WNrAl2lnzH9E9r6bdVxrIQsPIqM9h6+YcP6bTiWsJW/wrrYDmwJ
	 Y3G67ScEvLw1gUGY95KVXXTy6eGqvjyNOzMyl7jOsm/KtPiw5WOrKOe3sHSYDRZfOZ
	 VXl1i208d5j8uSPWvNq/Eg+BDvw7de3GtWhcKmlvkrQOSpO5auDnncpnfhwIyS4Ubd
	 C4imqDlgX1frq8W75CH7TG6jk0608gPt3GzB8SDRa7GFxiD1BvTHLYB9DXSwj0CxpK
	 wwCq2kwH3nodg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A919017E0699;
	Wed, 28 Jan 2026 15:41:46 +0100 (CET)
Message-ID: <92cabfc7-b35c-4ed8-9654-c4ef52bcbe03@collabora.com>
Date: Wed, 28 Jan 2026 15:41:46 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/10] media: mediatek: vcodec: Add Decoder profile &
 level Initialization
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 =?UTF-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?R2VvcmdlIFN1biAo5a2Z5p6XKQ==?= <George.Sun@mediatek.com>,
 =?UTF-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
 "nhebert@chromium.org" <nhebert@chromium.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 =?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 =?UTF-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
 =?UTF-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
 <Andrew-CT.Chen@mediatek.com>
Cc: "andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 =?UTF-8?B?WWlsb25nIFpob3UgKOWRqOaYk+m+mSk=?= <Yilong.Zhou@mediatek.com>
References: <20260127024248.18406-1-kyrie.wu@mediatek.com>
 <20260127024248.18406-6-kyrie.wu@mediatek.com>
 <4a6e111d-49ef-449d-af9d-b0bd4fb468a5@collabora.com>
 <54689bc16875b979147c021123c2546aacb7541e.camel@mediatek.com>
 <8b1c78db-12fc-4f06-bf2b-49b47f24850a@collabora.com>
 <d00d4dc685d76273ea99c9b90897602617c53abb.camel@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <d00d4dc685d76273ea99c9b90897602617c53abb.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51744-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[collabora.com,mediatek.com,vger.kernel.org,lists.infradead.org,chromium.org,kernel.org,xs4all.nl,gmail.com,arndb.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[gmail.com,linaro.org,mediatek.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxtv.org:url,mediatek.com:email,collabora.com:email,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: 1E427A3042
X-Rspamd-Action: no action

Il 28/01/26 14:39, Nicolas Dufresne ha scritto:
> Hi,
> 
> Le mercredi 28 janvier 2026 à 10:53 +0100, AngeloGioacchino Del Regno a écrit :
>> Il 28/01/26 08:45, Kyrie Wu (吴晗) ha scritto:
>>> On Tue, 2026-01-27 at 13:07 +0100, AngeloGioacchino Del Regno wrote:
>>>> Il 27/01/26 03:42, Kyrie Wu ha scritto:
>>>>> This commit initializes codec profile & level for VDEC. It sets
>>>>> default values for H264, H265, and VP9 codecs across multiple
>>>>> chipset configurations.
>>>>>
>>>>
>>>> The previous patch "Refactor decoder profile and level handling" will
>>>> break the
>>>> driver if this patch is not also applied at the same time.
>>>>
>>>> The change looks good, but you should squash 05/10 in 04/10, and
>>>> assign the params
>>>> that you're adding here along with the refactoring, so that you get
>>>> one single
>>>> patch that, if applied, doesn't break anything as it doesn't depend
>>>> on additional
>>>> (future, as this is number 5) patch.
>>>>
>>>> Please squash
>>>>
>>>> Cheers,
>>>> Angelo
>>>
>>> Dear Angelo,
>>>
>>> The 04/10 and 05/10 were designed in one patch in v6,
>>> but Nicolas thought that refactor patch and configuration
>>> were two different changes, should separate them in this
>>> comments:
>>> https://patchwork.linuxtv.org/project/linux-media/patch/20251202074038.3173-5-kyrie.wu@mediatek.com/
>>
>> Even though in this case I disagree with Nicolas, I'm the mediatek maintainer,
>> not a linux-media maintainer... so... let's go with whatever the media
>> maintainers think it's best.
> 
> No need to disagree, I was not very clear in my reply indeed. What I want to see
> is the added MT8189 configuration in isolation. So when I said two patches, the
> first one should reorganize the code for existing platform, without breaking it,
> and the second should add MT8189 support. I will have a read at these two patch
> to understand what is being done wrong, and can provide further feedback later.
> 
> The commit description in v6 was only saying that it was adding a configuration
> for MT8189.
> 

Re-reading what I wrote - my words could be misunderstood as well, so - just in
case anyone did: sorry, that wasn't meant as any form of attack and was purely
about sharing an opinion in a friendlier way than what appears from my previous
words. Eh, writing emails fast .... :-P

Btw.

Happy to see that we're on the same page.

Cheers,
Angelo

> Nicolas
> 
>>
>>>
>>> In my mind, refactor profile and level setting and assign
>>> former ICs' parameters could merge into same patch. The
>>> configuration of MT8189 should split to another one, because
>>> it is a new setting.
>>>
>>> Do you agree with my opinion? I look forward to your further reply.
>>>
>>
>> I agree with your opinion, but if linux-media maintainers want those two
>> patches separated as you just did, I will raise my hands, so...
>>
>> Reviewed-by: AngeloGioacchino Del Regno
>> <angelogioacchino.delregno@collabora.com
>>
>> ...because when the two patches are applied at the same time, there's no
>> breakage. But I want to still repeat my stance on this: single patches
>> should never depend on subsequent patches to avoid regressions (and I know
>> you agree as your previous version was compliant with that stance).
>>
>> Cheers,
>> Angelo
>>
>>> Thanks.
>>>
>>> Regards,
>>> Kyrie.
>>>
>>>
>>>>
>>>>> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
>>>>> ---
>>>>>     .../vcodec/decoder/mtk_vcodec_dec_stateful.c  | 12 +++
>>>>>     .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 84
>>>>> +++++++++++++++++++
>>>>>     2 files changed, 96 insertions(+)
>>>>>
>>>>> diff --git
>>>>> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
>>>>> teful.c
>>>>> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
>>>>> teful.c
>>>>> index 8ddb61670dc6..a47906b9d717 100644
>>>>> ---
>>>>> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
>>>>> teful.c
>>>>> +++
>>>>> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
>>>>> teful.c
>>>>> @@ -619,4 +619,16 @@ const struct mtk_vcodec_dec_pdata
>>>>> mtk_vdec_8173_pdata = {
>>>>>     	.is_subdev_supported = false,
>>>>>     	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
>>>>>     	.chip_name = 8173,
>>>>> +	.h264_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_4_1,
>>>>> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
>>>>> +	},
>>>>> +	.h265_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
>>>>> +		.profile =
>>>>> V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
>>>>> +	},
>>>>> +	.vp9_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
>>>>> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
>>>>> +	},
>>>>>     };
>>>>> diff --git
>>>>> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
>>>>> teless.c
>>>>> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
>>>>> teless.c
>>>>> index a1f419202a24..b571c4ed3f79 100644
>>>>> ---
>>>>> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
>>>>> teless.c
>>>>> +++
>>>>> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
>>>>> teless.c
>>>>> @@ -830,6 +830,18 @@ const struct mtk_vcodec_dec_pdata
>>>>> mtk_vdec_8183_pdata = {
>>>>>     	.is_subdev_supported = false,
>>>>>     	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
>>>>>     	.chip_name = 8183,
>>>>> +	.h264_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
>>>>> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
>>>>> +	},
>>>>> +	.h265_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
>>>>> +		.profile =
>>>>> V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
>>>>> +	},
>>>>> +	.vp9_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
>>>>> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
>>>>> +	},
>>>>>     };
>>>>>     
>>>>>     /* This platform data is used for one lat and one core
>>>>> architecture. */
>>>>> @@ -869,24 +881,72 @@ const struct mtk_vcodec_dec_pdata
>>>>> mtk_vdec_8188_pdata = {
>>>>>     	MTK_STATELESS_DEC_DATA,
>>>>>     	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
>>>>>     	.chip_name = 8188,
>>>>> +	.h264_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
>>>>> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
>>>>> +	},
>>>>> +	.h265_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1,
>>>>> +		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
>>>>> +	},
>>>>> +	.vp9_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
>>>>> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
>>>>> +	},
>>>>>     };
>>>>>     
>>>>>     const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata = {
>>>>>     	MTK_STATELESS_DEC_DATA,
>>>>>     	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
>>>>>     	.chip_name = 8192,
>>>>> +	.h264_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
>>>>> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
>>>>> +	},
>>>>> +	.h265_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
>>>>> +		.profile =
>>>>> V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
>>>>> +	},
>>>>> +	.vp9_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
>>>>> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
>>>>> +	},
>>>>>     };
>>>>>     
>>>>>     const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata = {
>>>>>     	MTK_STATELESS_DEC_DATA,
>>>>>     	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
>>>>>     	.chip_name = 8195,
>>>>> +	.h264_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
>>>>> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
>>>>> +	},
>>>>> +	.h265_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2,
>>>>> +		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
>>>>> +	},
>>>>> +	.vp9_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
>>>>> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
>>>>> +	},
>>>>>     };
>>>>>     
>>>>>     const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata = {
>>>>>     	MTK_STATELESS_DEC_DATA,
>>>>>     	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
>>>>>     	.chip_name = 8196,
>>>>> +	.h264_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
>>>>> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
>>>>> +	},
>>>>> +	.h265_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2,
>>>>> +		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
>>>>> +	},
>>>>> +	.vp9_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
>>>>> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
>>>>> +	},
>>>>>     };
>>>>>     
>>>>>     const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata = {
>>>>> @@ -910,6 +970,18 @@ const struct mtk_vcodec_dec_pdata
>>>>> mtk_vdec_8186_pdata = {
>>>>>     	MTK_STATELESS_DEC_DATA,
>>>>>     	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
>>>>>     	.chip_name = 8186,
>>>>> +	.h264_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
>>>>> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
>>>>> +	},
>>>>> +	.h265_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
>>>>> +		.profile =
>>>>> V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
>>>>> +	},
>>>>> +	.vp9_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_1,
>>>>> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
>>>>> +	},
>>>>>     };
>>>>>     
>>>>>     const struct mtk_vcodec_dec_pdata mtk_vdec_8189_pdata = {
>>>>> @@ -928,4 +1000,16 @@ const struct mtk_vcodec_dec_pdata
>>>>> mtk_vdec_8189_pdata = {
>>>>>     	.is_subdev_supported = true,
>>>>>     	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
>>>>>     	.chip_name = 8189,
>>>>> +	.h264_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
>>>>> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
>>>>> +	},
>>>>> +	.h265_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
>>>>> +		.profile =
>>>>> V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
>>>>> +	},
>>>>> +	.vp9_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
>>>>> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
>>>>> +	},
>>>>>     };
>>>>
>>>>



