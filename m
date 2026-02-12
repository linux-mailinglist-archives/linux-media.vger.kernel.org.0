Return-Path: <linux-media+bounces-52675-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLLuJLIEjmlf+gAAu9opvQ
	(envelope-from <linux-media+bounces-52675-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 17:49:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F8B12FA05
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 17:49:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B899C301513F
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 16:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1913235DD13;
	Thu, 12 Feb 2026 16:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="kEacJbLO"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557C62222C4;
	Thu, 12 Feb 2026 16:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770914965; cv=pass; b=dniXHJd+w7r9J29NMcOdIJw+EfhOObJf5OKsbP3TBwZhnMtgxKSVRRNEJcf2mPvPQIXJWHNHCRUcVYTaP7qj1GJxwH0X8DrTnP15k7+Y+x0hsNdsbqoqPl5OWwBrlakqPmT4usCC9EKKp5TebFgCNuecJlcgg4Qb1D1O4QZCbUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770914965; c=relaxed/simple;
	bh=17NA+xX63KfOc8IC1UEsrNa/JiCcSqUhQEv7yhp8Icw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BIGmJISbNB5XRvYTNIHcmDUH5mrPTTwPbmYk+ltZZ4x2oykuLZ1doyr8a92VtsJAvJ10xKX+q1knqfstX4el9Da43D1LthgLZ0gpE4WcFTAqEaL7PuaAtED6yKlFEs6L3F9/RoPo/kad6e6ub/n75ha/FjoaHdnoBZn6AASHC60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=kEacJbLO; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1770914947; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GntedfQoFf7F2/e7NlXFTKi/Mb6mAyCH8ddYWYop+R/QZD0smFta0zBLwMwf3Mfqook9LiYeWb3KwNolAOE3cdByvuvnsA6XCmFA4sIOcxyWNxkKGTtiNLTPwIAq3K/HreJIDq6WgqLKPZi6BVAcfz7dFrKeC1GMoQOVNtlTwog=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770914947; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YEZEYfQ5IqjMYzUTZcNQQmkihMOlKDImNppM9Hi9DKM=; 
	b=W7D+cKfhamN+7nN7V3gq1t11y/IjVF4qXDwOoSdSH1kJCbD6I7hUG8PvU+/G914vuV71Q0pUhYBKXU5EMPSOLqHiIqgRVLnN7rslbi24v8llgJNNDhv74gVffsTkbEffYXbtG3P57n/fYf6xE8wV791DbrUNZXN0VB8wHg35EBw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770914947;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=YEZEYfQ5IqjMYzUTZcNQQmkihMOlKDImNppM9Hi9DKM=;
	b=kEacJbLO7qxakyNVUa231nnK8vGEosGfou35o9KAELftxBbq+CAoAxasUAftKfaz
	s3qgiTn9xa+PwwkWqaWQjbEiwcubWqcQTJHWWXTaJbqUBVBH5ZAb4Ab5+wpJcMzFh5b
	1myRX8/trow/D11TP0CfElQT0LGCdeXdM6xrJZMQ=
Received: by mx.zohomail.com with SMTPS id 1770914944758152.7910589638292;
	Thu, 12 Feb 2026 08:49:04 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 linux-mediatek@lists.infradead.org
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 Yunfei Dong <yunfei.dong@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Yunfei Dong <yunfei.dong@mediatek.com>
Subject:
 Re: [PATCH v3 02/14] media: mediatek: vcodec: add decoder compatible to
 support mt8196
Date: Thu, 12 Feb 2026 17:48:58 +0100
Message-ID: <6176231.DvuYhMxLoT@workhorse>
In-Reply-To: <20260211054149.27249-3-yunfei.dong@mediatek.com>
References:
 <20260211054149.27249-1-yunfei.dong@mediatek.com>
 <20260211054149.27249-3-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	CTE_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[collabora.com,xs4all.nl,chromium.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-52675-lists,linux-media=lfdr.de];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,collabora.com:dkim,mediatek.com:email]
X-Rspamd-Queue-Id: 76F8B12FA05
X-Rspamd-Action: no action

On Wednesday, 11 February 2026 06:41:29 Central European Standard Time Yunfei Dong wrote:
> MT8196 is lat single core architecture. Support its compatible and
> use `mtk_lat_sig_core_pdata` to initialize platform data.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c   | 6 ++++++
>  .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> index 3b81fae9f913..d9f722698198 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> @@ -347,6 +347,8 @@ static void mtk_vcodec_dec_get_chip_name(struct mtk_vcodec_dec_dev *vdec_dev)
>  		vdec_dev->chip_name = MTK_VDEC_MT8186;
>  	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8188-vcodec-dec"))
>  		vdec_dev->chip_name = MTK_VDEC_MT8188;
> +	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8196-vcodec-dec"))
> +		vdec_dev->chip_name = MTK_VDEC_MT8196;

Why is this entire function written like this, and why does it exist
at all? You can store the chip name in the platform data for a compatible,
thereby avoiding a massive of_device_is_compatible if block because that's
what platform data is for.

The only place where this function is even used is in probe.

Just store it in your mtk_vcodec_match's .data struct and pull it from
dev->vdec_pdata. No need for the function.

>  	else
>  		vdec_dev->chip_name = MTK_VDEC_INVAL;
>  }
> @@ -560,6 +562,10 @@ static const struct of_device_id mtk_vcodec_match[] = {
>  		.compatible = "mediatek,mt8188-vcodec-dec",
>  		.data = &mtk_lat_sig_core_pdata,
>  	},
> +	{
> +		.compatible = "mediatek,mt8196-vcodec-dec",
> +		.data = &mtk_lat_sig_core_pdata,
> +	},
>  	{},
>  };
>  
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> index c9d27534c63e..f06dfc1a3455 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> @@ -29,6 +29,7 @@ enum mtk_vcodec_dec_chip_name {
>  	MTK_VDEC_MT8188 = 8188,
>  	MTK_VDEC_MT8192 = 8192,
>  	MTK_VDEC_MT8195 = 8195,
> +	MTK_VDEC_MT8196 = 8196,
>  };
>  
>  /*
> 





