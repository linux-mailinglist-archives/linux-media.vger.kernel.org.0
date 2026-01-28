Return-Path: <linux-media+bounces-51722-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACslCo7ceWnI0QEAu9opvQ
	(envelope-from <linux-media+bounces-51722-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 10:53:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B61D39F059
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 10:53:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE1FD300D311
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 09:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA3734D4D8;
	Wed, 28 Jan 2026 09:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MT4bhqjZ"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8952FF169;
	Wed, 28 Jan 2026 09:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769593986; cv=none; b=jWkSPG8I86lWaJHVKaP9LmD8m3Rg1ciibfy8tG+AcUCnKsKsvRnZjFw19sYpLZfIeuQuEh2Y/YI4EtRg2KB2dEdkTEpfbeDDFxWJ2TsmqxviclAh2ziiR52cCP/J9txFJb8bKen5mq7hi+J2RFwx34moozH+pu8qO5VqW7AmY3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769593986; c=relaxed/simple;
	bh=vr1IpjsppjvWE/p2emkhB1rpnvnBV8VpHY5/IN7FEzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WYzTFaLpwDQDhvsjNwVTJUDF4b5pl35ktg1lS8gysn0Hxj0yLIvj8YMTsAfXbJk7li6sLW6hNxT5ZO4UIbU7Gm+AlkxSThjvvuxG7rTbad9B1dg5S+AbJxjzyYW9gBrHFxqQcHtcM/T4VKyaunubWe5sbvicDpMHmHF9rMher0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MT4bhqjZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769593982;
	bh=vr1IpjsppjvWE/p2emkhB1rpnvnBV8VpHY5/IN7FEzs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MT4bhqjZXbv6XCbzGcAoPi4Gya9NPY16Q89TwSaa81gBDfiTwuN9LfosCOBMVxcit
	 LZ9CAuatyL4Lbl541UEsL4cJXn7oIqZrrUN8bjj0gjggHVRYlmgxvo1cLGjwU2zHgY
	 MlHB981uLUCXcSSVrhtgrnRvgXbjkTdfhpXYQS5VXXYZwGsZyZL+eLKzd4bCcurz79
	 6P23n+nZlT+YZoR5GfIcrVM7K2tAeeXjSonQF8iMsSNBfvD2uqC+Zu3rXiFJ+jY4DR
	 FcOuKmY5cJQSDRPixZ2VuRkhxOi59YscHAo4Z1qQZmriiS7zzve2jqs8SAP7X7J4Wx
	 gs4WXzwFyzEmg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1B96717E0E4C;
	Wed, 28 Jan 2026 10:53:02 +0100 (CET)
Message-ID: <8b1c78db-12fc-4f06-bf2b-49b47f24850a@collabora.com>
Date: Wed, 28 Jan 2026 10:53:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/10] media: mediatek: vcodec: Add Decoder profile &
 level Initialization
To: =?UTF-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?R2VvcmdlIFN1biAo5a2Z5p6XKQ==?= <George.Sun@mediatek.com>,
 =?UTF-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
 "nhebert@chromium.org" <nhebert@chromium.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 "nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
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
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <54689bc16875b979147c021123c2546aacb7541e.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51722-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[mediatek.com,vger.kernel.org,lists.infradead.org,chromium.org,kernel.org,xs4all.nl,collabora.com,gmail.com,arndb.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxtv.org:url,mediatek.com:email,collabora.com:email,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: B61D39F059
X-Rspamd-Action: no action

Il 28/01/26 08:45, Kyrie Wu (吴晗) ha scritto:
> On Tue, 2026-01-27 at 13:07 +0100, AngeloGioacchino Del Regno wrote:
>> Il 27/01/26 03:42, Kyrie Wu ha scritto:
>>> This commit initializes codec profile & level for VDEC. It sets
>>> default values for H264, H265, and VP9 codecs across multiple
>>> chipset configurations.
>>>
>>
>> The previous patch "Refactor decoder profile and level handling" will
>> break the
>> driver if this patch is not also applied at the same time.
>>
>> The change looks good, but you should squash 05/10 in 04/10, and
>> assign the params
>> that you're adding here along with the refactoring, so that you get
>> one single
>> patch that, if applied, doesn't break anything as it doesn't depend
>> on additional
>> (future, as this is number 5) patch.
>>
>> Please squash
>>
>> Cheers,
>> Angelo
> 
> Dear Angelo,
> 
> The 04/10 and 05/10 were designed in one patch in v6,
> but Nicolas thought that refactor patch and configuration
> were two different changes, should separate them in this
> comments:
> https://patchwork.linuxtv.org/project/linux-media/patch/20251202074038.3173-5-kyrie.wu@mediatek.com/

Even though in this case I disagree with Nicolas, I'm the mediatek maintainer,
not a linux-media maintainer... so... let's go with whatever the media
maintainers think it's best.

> 
> In my mind, refactor profile and level setting and assign
> former ICs' parameters could merge into same patch. The
> configuration of MT8189 should split to another one, because
> it is a new setting.
> 
> Do you agree with my opinion? I look forward to your further reply.
> 

I agree with your opinion, but if linux-media maintainers want those two
patches separated as you just did, I will raise my hands, so...

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com

...because when the two patches are applied at the same time, there's no
breakage. But I want to still repeat my stance on this: single patches
should never depend on subsequent patches to avoid regressions (and I know
you agree as your previous version was compliant with that stance).

Cheers,
Angelo

> Thanks.
> 
> Regards,
> Kyrie.
> 
> 
>>
>>> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
>>> ---
>>>    .../vcodec/decoder/mtk_vcodec_dec_stateful.c  | 12 +++
>>>    .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 84
>>> +++++++++++++++++++
>>>    2 files changed, 96 insertions(+)
>>>
>>> diff --git
>>> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
>>> teful.c
>>> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
>>> teful.c
>>> index 8ddb61670dc6..a47906b9d717 100644
>>> ---
>>> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
>>> teful.c
>>> +++
>>> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
>>> teful.c
>>> @@ -619,4 +619,16 @@ const struct mtk_vcodec_dec_pdata
>>> mtk_vdec_8173_pdata = {
>>>    	.is_subdev_supported = false,
>>>    	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
>>>    	.chip_name = 8173,
>>> +	.h264_params = {
>>> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_4_1,
>>> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
>>> +	},
>>> +	.h265_params = {
>>> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
>>> +		.profile =
>>> V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
>>> +	},
>>> +	.vp9_params = {
>>> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
>>> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
>>> +	},
>>>    };
>>> diff --git
>>> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
>>> teless.c
>>> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
>>> teless.c
>>> index a1f419202a24..b571c4ed3f79 100644
>>> ---
>>> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
>>> teless.c
>>> +++
>>> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
>>> teless.c
>>> @@ -830,6 +830,18 @@ const struct mtk_vcodec_dec_pdata
>>> mtk_vdec_8183_pdata = {
>>>    	.is_subdev_supported = false,
>>>    	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
>>>    	.chip_name = 8183,
>>> +	.h264_params = {
>>> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
>>> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
>>> +	},
>>> +	.h265_params = {
>>> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
>>> +		.profile =
>>> V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
>>> +	},
>>> +	.vp9_params = {
>>> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
>>> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
>>> +	},
>>>    };
>>>    
>>>    /* This platform data is used for one lat and one core
>>> architecture. */
>>> @@ -869,24 +881,72 @@ const struct mtk_vcodec_dec_pdata
>>> mtk_vdec_8188_pdata = {
>>>    	MTK_STATELESS_DEC_DATA,
>>>    	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
>>>    	.chip_name = 8188,
>>> +	.h264_params = {
>>> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
>>> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
>>> +	},
>>> +	.h265_params = {
>>> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1,
>>> +		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
>>> +	},
>>> +	.vp9_params = {
>>> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
>>> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
>>> +	},
>>>    };
>>>    
>>>    const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata = {
>>>    	MTK_STATELESS_DEC_DATA,
>>>    	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
>>>    	.chip_name = 8192,
>>> +	.h264_params = {
>>> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
>>> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
>>> +	},
>>> +	.h265_params = {
>>> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
>>> +		.profile =
>>> V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
>>> +	},
>>> +	.vp9_params = {
>>> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
>>> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
>>> +	},
>>>    };
>>>    
>>>    const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata = {
>>>    	MTK_STATELESS_DEC_DATA,
>>>    	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
>>>    	.chip_name = 8195,
>>> +	.h264_params = {
>>> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
>>> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
>>> +	},
>>> +	.h265_params = {
>>> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2,
>>> +		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
>>> +	},
>>> +	.vp9_params = {
>>> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
>>> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
>>> +	},
>>>    };
>>>    
>>>    const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata = {
>>>    	MTK_STATELESS_DEC_DATA,
>>>    	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
>>>    	.chip_name = 8196,
>>> +	.h264_params = {
>>> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
>>> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
>>> +	},
>>> +	.h265_params = {
>>> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2,
>>> +		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
>>> +	},
>>> +	.vp9_params = {
>>> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
>>> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
>>> +	},
>>>    };
>>>    
>>>    const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata = {
>>> @@ -910,6 +970,18 @@ const struct mtk_vcodec_dec_pdata
>>> mtk_vdec_8186_pdata = {
>>>    	MTK_STATELESS_DEC_DATA,
>>>    	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
>>>    	.chip_name = 8186,
>>> +	.h264_params = {
>>> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
>>> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
>>> +	},
>>> +	.h265_params = {
>>> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
>>> +		.profile =
>>> V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
>>> +	},
>>> +	.vp9_params = {
>>> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_1,
>>> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
>>> +	},
>>>    };
>>>    
>>>    const struct mtk_vcodec_dec_pdata mtk_vdec_8189_pdata = {
>>> @@ -928,4 +1000,16 @@ const struct mtk_vcodec_dec_pdata
>>> mtk_vdec_8189_pdata = {
>>>    	.is_subdev_supported = true,
>>>    	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
>>>    	.chip_name = 8189,
>>> +	.h264_params = {
>>> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
>>> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
>>> +	},
>>> +	.h265_params = {
>>> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
>>> +		.profile =
>>> V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
>>> +	},
>>> +	.vp9_params = {
>>> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
>>> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
>>> +	},
>>>    };
>>
>>


