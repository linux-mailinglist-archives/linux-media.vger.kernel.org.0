Return-Path: <linux-media+bounces-52956-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sD9OEksdlGn0/wEAu9opvQ
	(envelope-from <linux-media+bounces-52956-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 08:48:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FA31494EA
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 08:48:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37025301D68D
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 07:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 286842D8798;
	Tue, 17 Feb 2026 07:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="X2Zlmpzj"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC182D780E;
	Tue, 17 Feb 2026 07:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771314492; cv=none; b=DQkblkYJeZHiX36oXYF98FCVRzjuNJxHIKGPQF+qi/Sz6mn2tG91AP85wRihVBOJGe8ejH2uwEgAacpR1yjLOKhMQH42jYdO+++L6y35xeJKpc3Yp4LC2cjXQOm5tRu0FTRbrBiAHpnn7Z91MRMMhs/pQt4N8hXGkzVVRkbHmoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771314492; c=relaxed/simple;
	bh=hV2LXUFRvp3gGdAS+sOIikPEF9/2c/sgwXOC2d/azYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OWmt1ZdVAHAxe7w6hde8n6wzTNpzoJZQjLylkGeBo0I3Q4IR0uwnLIf/f2cPYkAXSiHT+zK6ikN29J5fxhHEWUvT2OCqJpn/cqcW5rf/deJ3QR/z7K0v0VfpqmgeIJTBASRBAFoeTaxogiw/AmYSwKmfRvb/ZQfyd0frteuDnA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=X2Zlmpzj; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771314483;
	bh=hV2LXUFRvp3gGdAS+sOIikPEF9/2c/sgwXOC2d/azYE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X2ZlmpzjoC1o4Lr2vL4mNberYUWTbWNcNWOzF7fPy9rS4rztiPfQWulvVccX/qOwJ
	 rhB3Qgw3tPDe8X9VtMy0Qv1iS9ULe5oRYV7dxT3tLszOuLfpiLWL1CFkqQq+Ps6HrB
	 Nx99Fu68lVfUQmLl81wvvcV0BwC3ZUroShPvloIEN0V/YSzopp2UGiwZdAKpMfySrG
	 7JAxdKkPRGLiBqrAGrnHs3H0L3obTapJTwPMdu3AwB3ZCpQ+ROQOByKoFsCBtUr+jy
	 VWbCVqjaTr1AcCn/4oJYOKlTAJ4ndfeQls3MrmPJiewc8VG4sEC11cKBek9T44hoOl
	 WgYWLHIQnHR7Q==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4812417E114C;
	Tue, 17 Feb 2026 08:48:03 +0100 (CET)
Message-ID: <2c3f5c57-9ecc-4a99-9f8b-e1b09a98539b@collabora.com>
Date: Tue, 17 Feb 2026 08:48:02 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] media: synopsys: csi2rx: implement
 .get_frame_desc() callback
To: Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev
References: <20260216-imx93-dw-csi2-v3-0-aabafee10923@nxp.com>
 <20260216-imx93-dw-csi2-v3-3-aabafee10923@nxp.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260216-imx93-dw-csi2-v3-3-aabafee10923@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52956-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: 99FA31494EA
X-Rspamd-Action: no action

Hi Frank,

Thanks for the patch.

On 2/16/26 20:18, Frank Li wrote:
> Implement the .get_frame_desc() callback to fetch information from the
> remote endpoint.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
> change in v3
> - use media_entity_to_v4l2_subdev()
> 
> change in v2
> - add csi2rx in subject
> ---
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index f03fe01280013bf9a832433c6b06dab691bf8f4c..bcbf109a0bfd040c568c0652e28752c94a1bc30d 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -429,10 +429,31 @@ static int dw_mipi_csi2rx_disable_streams(struct v4l2_subdev *sd,
>  	return ret;
>  }
>  
> +static int
> +dw_mipi_csi2rx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +			      struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct dw_mipi_csi2rx_device *csi2 = to_csi2(sd);
> +	struct v4l2_subdev *remote_sd;
> +	struct media_pad *remote_pad;
> +
> +	remote_pad = media_pad_remote_pad_unique(&csi2->pads[DW_MIPI_CSI2RX_PAD_SINK]);
> +	if (IS_ERR(remote_pad)) {
> +		dev_err(csi2->dev, "can't get remote source pad\n");
> +		return PTR_ERR(remote_pad);
> +	}
> +
> +	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
> +
> +	return v4l2_subdev_call(remote_sd, pad, get_frame_desc,
> +				remote_pad->index, fd);
> +}
> +
>  static const struct v4l2_subdev_pad_ops dw_mipi_csi2rx_pad_ops = {
>  	.enum_mbus_code = dw_mipi_csi2rx_enum_mbus_code,
>  	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = dw_mipi_csi2rx_set_fmt,
> +	.get_frame_desc = dw_mipi_csi2rx_get_frame_desc,
>  	.set_routing = dw_mipi_csi2rx_set_routing,
>  	.enable_streams = dw_mipi_csi2rx_enable_streams,
>  	.disable_streams = dw_mipi_csi2rx_disable_streams,
> 


