Return-Path: <linux-media+bounces-67234-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Iv/HFdasUGoP3QIAu9opvQ
	(envelope-from <linux-media+bounces-67234-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 10:27:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C59738706
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 10:27:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=zohomail header.b=FFnMn0Cf;
	dmarc=pass (policy=none) header.from=collabora.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67234-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67234-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79EEC300E38A
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 08:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B89883EF0BD;
	Fri, 10 Jul 2026 08:20:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6713EF0D3;
	Fri, 10 Jul 2026 08:19:59 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783671601; cv=pass; b=OqNkPatFlD0NSztCEYPwBfc9YiFRf6xXYoex2ICdvWeUU0cKgeDCKU4zUkJx6cCiVKijobfmSloWPV4cb7NprTg0yNsuVZSoBI6HUYOIt0Y+Ia6VRAMdMghBfT69pFHE15DWwGtsA655AHbaiBKfmct9pnK+HcDauNNXkRbJtYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783671601; c=relaxed/simple;
	bh=A6yuDsR2nZi6+auXXFpGtmRTYQlKL2m32zKzAUWpsuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M+BJ55CTh98rrmuc0znOTxtL6W4A0ZrSF/wRnGkj4XJKx4Do6bnyHtC49JUcDKIQm9Y6QPlglWEGLGDKbw/3nfIgBVpltik4Isw56gYlfDEqD5H7keDwEmAJ2E6sbdOIhGduGsmGyA5dXC+jps/Kk4WP1JfiGYTJ2c2dBIgNeMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b=FFnMn0Cf; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal: i=1; a=rsa-sha256; t=1783671496; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=n1lilrOhB4g5YW6x6G9IiFkIE7cfPY646RXZhmeBeRU8vt/Xx9bipqzOH437Yw97SoOGWsi6diBYmTI0TYz7Spkgc8HTkBcyOyMzfh59yPBSw05OA6h2azT2bgsLebTK/kztYKqSVt1g4J+Lfr3EC3HBXmEksib7LE6CevODMbI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783671496; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wNhWASr7b/ZTOhcTDo/rAGZJQBNr7Kmww1CuII50ggg=; 
	b=KzVJV3qeyarguw6hz9kE7z6vCLOBH41NDHxBP60XjAWbYdVyRx4BdzoxPYnBsKXqISCpPpiknHP/lbrKwWbfZSlZj8qPWnerYwHuVZfthM/RiwyHsk1sJsbpbDcruZtep4SIczOrhwHVxxhJF8ObBRv1kKP+7ED7nKrf1V47Ws0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783671496;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=wNhWASr7b/ZTOhcTDo/rAGZJQBNr7Kmww1CuII50ggg=;
	b=FFnMn0CfDn5F3352XtaZr/QmRsRz8rLmzZocUKukr5Ojp1+hiTHPyc3rbW2Zy+S1
	bOUZDwihK/kW3HXc+EyDdMZPXBcsEVnrUiNVKyPQWNQCSgGFPDMhHaTIewGDobgikZT
	oCrvfmpvHCAuKEHCF4PM+K5AHYqHi8YICnThQ1PA=
Received: by mx.zohomail.com with SMTPS id 1783671494588655.4558382967103;
	Fri, 10 Jul 2026 01:18:14 -0700 (PDT)
Message-ID: <66d4ed68-f8b1-4275-96de-83d1125d49c9@collabora.com>
Date: Fri, 10 Jul 2026 10:18:05 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] media: dt-bindings: video-interface-devices: add
 video-interface-devices.h references
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>,
 Matthias Fend <matthias.fend@emfend.at>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Martin Kepplinger <martin.kepplinger@puri.sm>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Richard Acayan <mailingradian@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux@ew.tq-group.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20260628-kbingham-orientation-v3-0-4ed92968aff8@ideasonboard.com>
 <20260628-kbingham-orientation-v3-2-4ed92968aff8@ideasonboard.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260628-kbingham-orientation-v3-2-4ed92968aff8@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:kieran.bingham@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jacopo@jmondi.org,m:sakari.ailus@linux.intel.com,m:jimmy.su@intel.com,m:matthias.fend@emfend.at,m:mike.rudenko@gmail.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:laurent.pinchart@ideasonboard.com,m:paul.elder@ideasonboard.com,m:martin.kepplinger@puri.sm,m:quentin.schulz@theobroma-systems.com,m:tomm.merciai@gmail.com,m:clamor95@gmail.com,m:mailingradian@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:heiko@sntech.de,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux@ew.tq-group.com,m:imx@
 lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:vladimir.zapolskiy@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,m:mikerudenko@gmail.com,m:tommmerciai@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,jmondi.org,linux.intel.com,intel.com,emfend.at,gmail.com,foss.st.com,puri.sm,theobroma-systems.com,nvidia.com,nxp.com,pengutronix.de,glider.be,sntech.de];
	FORGED_SENDER(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[43];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67234-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:from_mime,collabora.com:email,collabora.com:mid,collabora.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,vger.kernel.org:from_smtp,linaro.org:email,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D7C59738706

Hi Kieran,

On 6/28/26 12:22, Kieran Bingham wrote:
> Expand the documentation of the video-interface-devices orientation to
> reference the include/dt-bindings/media/video-interface-devices.h header
> which provides human readable defines for the orientation enum, to help
> avoid hardcoding values in dts.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Acked-by: Michael Riesch <michael.riesch@collabora.com>

Thanks and best regards,
Michael

> ---
>  .../bindings/media/video-interface-devices.yaml         | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/video-interface-devices.yaml b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> index a81d2a155fe6..c9c3f4f16719 100644
> --- a/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> +++ b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> @@ -392,17 +392,22 @@ properties:
>        The orientation of a device (typically an image sensor or a flash LED)
>        describing its mounting position relative to the usage orientation of the
>        system where the device is installed on.
> +      See include/dt-bindings/media/video-interface-devices.h.
> +
>      $ref: /schemas/types.yaml#/definitions/uint32
>      enum:
> -        # Front. The device is mounted on the front facing side of the system. For
> -        # mobile devices such as smartphones, tablets and laptops the front side
> -        # is the user facing side.
> +        # MEDIA_ORIENTATION_FRONT
> +        # The device is mounted on the front facing side of the system. For
> +        # mobile devices such as smartphones, tablets and laptops the front
> +        # side is the user facing side.
>        - 0
> -        # Back. The device is mounted on the back side of the system, which is
> +        # MEDIA_ORIENTATION_BACK
> +        # The device is mounted on the back side of the system, which is
>          # defined as the opposite side of the front facing one.
>        - 1
> -        # External. The device is not attached directly to the system but is
> -        # attached in a way that allows it to move freely.
> +        # MEDIA_ORIENTATION_EXTERNAL
> +        # The device is not attached directly to the system but is attached in
> +        # a way that allows it to move freely.
>        - 2
>  
>  additionalProperties: true
> 


