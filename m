Return-Path: <linux-media+bounces-52846-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPLsHnzdkmlvzQEAu9opvQ
	(envelope-from <linux-media+bounces-52846-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 10:03:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C53141D01
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 10:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 692F630054E3
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 09:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C410723D7F5;
	Mon, 16 Feb 2026 09:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PxqPN+nj"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB3726E719;
	Mon, 16 Feb 2026 09:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771232633; cv=none; b=EGjf2KeKD8s7J2xsEJWe79o7LE6xq+IEedjNcxq2IcYy9kb0a2AyoSvgKwKa652r/n68a1K51yrYfBOSV1TeDEwQEctLehDgl6sYi2dq2NSPAgZNr8+dpUp+YPywFOvPtN0pPgZKPnL0buxbLKnotmh9D5pLBvQMbxfFREgsEqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771232633; c=relaxed/simple;
	bh=egyZNlVxOKps8c+uu05c+5nto53qJQKuDG16P33A490=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bwdj5wsfmZfV0OP9Smzohw9UsZm4BI5LpyAZrb1UswYMWZ4qGyBfMpjahOWYm/ZSMvG6qIiIFk5xSgtcn7vHs5QI/mV0uA0TtB3VHFj/YDm1wM3ZX2GpB/iN/wLZKlEygPoHINCQOoAWDMpzIfSnd7mBl9cPMukL3aQvPD1N954=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PxqPN+nj; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771232630;
	bh=egyZNlVxOKps8c+uu05c+5nto53qJQKuDG16P33A490=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PxqPN+nj4/xel63axAnL+UABpl+Xy88tyLF+48q1YvuE0TXc+PQjjdnay1cPPdYqY
	 XTLhup0YYmEnJtlUWYS8IweQuB16PAAGl1tR0HAhPoYEQlmU3C48xpUpt0aMa4eHNN
	 bWYLMV9Jdf/tk56we0+mJVDhn8zMt/f1z5jMCdRCfOsU+BD1/+OtXN2uCfwZd3y52A
	 4xiwjrNMvfiziZLcfoNDbGWbq8CpMOkhJ+wJVXejKBjiX20RYc5+T4PNkvJhKJqxLI
	 +KRR8Kp5tchL5SO5PMhfPoRbbZwSYgdenbCxtWRqzOqUceNNjeyNhImTI6mY7LwD2A
	 OYKJHXuvfkL6A==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B5D7717E137B;
	Mon, 16 Feb 2026 10:03:49 +0100 (CET)
Message-ID: <75abd9eb-6141-46cc-b2d7-0c4d112e2ca5@collabora.com>
Date: Mon, 16 Feb 2026 10:03:49 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] media: synopsys: csi2rx: implement
 .get_frame_desc() callback
To: Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev
References: <20260213-imx93-dw-csi2-v2-0-8be6039f44c6@nxp.com>
 <20260213-imx93-dw-csi2-v2-3-8be6039f44c6@nxp.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260213-imx93-dw-csi2-v2-3-8be6039f44c6@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52846-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,collabora.com:mid,collabora.com:dkim]
X-Rspamd-Queue-Id: 27C53141D01
X-Rspamd-Action: no action

Hi Frank,

On 2/13/26 21:25, Frank Li wrote:
> Implement the .get_frame_desc() callback to fetch information from the
> remote endpoint.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - add csi2rx in subject
> ---
>  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 25 ++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> index f03fe01280013bf9a832433c6b06dab691bf8f4c..a6d251ca5ad14c5138a6fd0202a970460e64c68f 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -68,6 +68,8 @@ struct dw_mipi_csi2rx_device {
>  	struct v4l2_async_notifier notifier;
>  	struct v4l2_subdev sd;
>  
> +	struct v4l2_subdev *remote_source;
> +
>  	enum v4l2_mbus_type bus_type;
>  	u32 lanes_num;
>  };
> @@ -429,10 +431,31 @@ static int dw_mipi_csi2rx_disable_streams(struct v4l2_subdev *sd,
>  	return ret;
>  }
>  
> +static int
> +dw_mipi_csi2rx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +			      struct v4l2_mbus_frame_desc *fd)
> +{
> +	struct dw_mipi_csi2rx_device *csi2 = to_csi2(sd);
> +	struct media_pad *remote_pad;
> +
> +	if (!csi2->remote_source)
> +		return -ENODEV;
> +
> +	remote_pad = media_pad_remote_pad_unique(&csi2->pads[DW_MIPI_CSI2RX_PAD_SINK]);
> +	if (IS_ERR(remote_pad)) {
> +		dev_err(csi2->dev, "can't get source pad of %s (%pe)\n",
> +			csi2->remote_source->name, remote_pad);
> +		return PTR_ERR(remote_pad);
> +	}

You can get the remote subdevice with
	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
instead of storing it in the device data.

Best regards,
Michael

> +	return v4l2_subdev_call(csi2->remote_source, pad, get_frame_desc,
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
> @@ -485,6 +508,8 @@ static int dw_mipi_csi2rx_notifier_bound(struct v4l2_async_notifier *notifier,
>  		return ret;
>  	}
>  
> +	csi2->remote_source = sd;
> +
>  	return 0;
>  }
>  
> 


