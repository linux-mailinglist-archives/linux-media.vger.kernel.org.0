Return-Path: <linux-media+bounces-51816-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOKzGO11fGmWNAIAu9opvQ
	(envelope-from <linux-media+bounces-51816-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 10:12:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A58DB8C24
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 10:12:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE2F13012C91
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 09:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A17350A0E;
	Fri, 30 Jan 2026 09:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="fX8ub/RK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx-relay36-hz2.antispameurope.com (mx-relay36-hz2.antispameurope.com [94.100.136.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB7934DCE3
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 09:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.136.236
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769764329; cv=pass; b=KLCIRzKwG1xIgiWaAQBZ7cFcOXYV3AHLw1GDvSQ97VgK8Rc/ldV1lXz/hFv3u9ZQOSOdNHhnHPJLf6hE/m/wPI5pwdz3datdYtaPJw+pU6gcrRnsG89wWm7RPYuA+OVdNMQXVSAm+bntSkjjKVTpEZ0rkJxD/owzDwuwNgUWTvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769764329; c=relaxed/simple;
	bh=JJ6ZgfjzIHBLd6Y+kOxT96PhgvFLGLY3oKWCw1HaN/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S9EIBq85dMQ/YJELa7NZTm2KapNdgdvo47l7NnMl0raUb6E0amR/VM9TkoShlH+7Oe6taJTgnp+8bN4B9Nn2vh4oTCxkDYkvd1n5hRHNRrzcxnioJHG09MFn9pVmWRoiNPF4y7S9QsZY19X0Axv2Ym2wwQIwV+4H2MQoruDq5uY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=fX8ub/RK; arc=pass smtp.client-ip=94.100.136.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate36-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=OlaaAEdyH/nGPP2TYnuTAVW6ys1F2ggjuG22tntgfjs=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1769764253;
 b=DYKZeZwBOAeyDpCBKy/9WeeIg+DcJuQtbtXEUPI+Knsvr946jnN6MJrOTU8OBBC/6J/77/k1
 hqHX1IVjQR7/Bwu5sfVErdxwBIP3HEhlrQC7vn26ofBGZez/zmDnVJxk67VivREpKLAO4GhV5o/
 yUA/Ffk6dQqsD5igigvAjaQVdOAzdG/5MV/jnoCHGrVYjX/DqyvLcZGfWKLUi2dw3pm+cPlcHdd
 eYfMiV7AeAgA9u6Kjtd/FSDcuXIo8Q4HfvC+V6JGHOExWE0lsoiz3RwzjTONYxGmxSGqS8QLNqg
 ftdTTp9Q2guvwZR1ZWHvmzcH5BQx6VCq4eYSEcQqv02qg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1769764253;
 b=XJlKCVGBQMz3ilSenYeEhhjFmHd+sSYe+Kepn9qpA6K6ayRojG6YcVavptp3xx1habSu++DO
 tq7acMHHzW8JuNZyvxn7yELkmeoi2+/exTsUMBS2wGlCWtSIEgRCbYTtEsUihY1ynWJZRVdLfGI
 iPp+KELTqPA3k+oteUAJPIyHe4XXAtMJloM+gjY2NfLl58FVRaWDZsT30Yh6B1jYOImoSkaOZbY
 o/DqcM1OjbdZnZlkdLOdbUGVFyGB5M/B4zC8TsDhAluYhtB1nAFkn/LdRL6BFJ8Nojn7DCixqjM
 /25MsSeHtI1FxhnfYkZ7c0a0bYw8dLcgAOrP3RsgqCorQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay36-hz2.antispameurope.com;
 Fri, 30 Jan 2026 10:10:53 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id DEE09A40EF0;
	Fri, 30 Jan 2026 10:10:22 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
 benjamin.gaignard@collabora.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, sebastian.fricke@collabora.com,
 shawnguo@kernel.org, ulf.hansson@linaro.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 l.stach@pengutronix.de, Frank.li@nxp.com, peng.fan@nxp.com,
 eagle.zhou@nxp.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ming.qian@oss.nxp.com
Subject:
 Re: [PATCH] arm64: dts: imx8mq: Restore VPU G2 clock to 600MHz for 4K60fps
 decoding
Date: Fri, 30 Jan 2026 10:09:46 +0100
Message-ID: <5476502.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260130084133.2159-1-ming.qian@oss.nxp.com>
References: <20260130084133.2159-1-ming.qian@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-media@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay36-hz2.antispameurope.com with 4f2VbN1GXyz1S63D
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:f72694e440bb7dafe036a5498634db5d
X-cloud-security:scantime:2.180
DKIM-Signature: a=rsa-sha256;
 bh=OlaaAEdyH/nGPP2TYnuTAVW6ys1F2ggjuG22tntgfjs=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1769764252; v=1;
 b=fX8ub/RKcZudyuWbLECbVsp6eCrJmuz0hXwzL4rahHzUzhrAwy3pn05J0+dRMZrpuq5Us0aD
 wTICB3aBhSgwbcYKcn10BjPlRmkPsaeAbxzOt/Z/otvuLt/tcUAHCyYxFxRCSE74RHXocExUcXz
 iBlYtElQyC+Au50jm4f4Ny3w5h//Pso7oDw6wSZlO+vMwEg2Vc1ZZVahZ99d51LyJ4QQhKyYY1G
 zSTsCAYRFNnCqMrW0JjBuYYzQGym0FLlc9J3k6KCA51xeUD6TfzsIQRhrfHoHfZdu7S4MK7pmlj
 RLL3JRd4dR3uHYGML4Wts3VSWM5Hf/Zai4WvgQGAt3LKA==
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	CTE_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=hse1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,ndufresne.ca,collabora.com,pengutronix.de,linaro.org,gmail.com,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,oss.nxp.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	TAGGED_FROM(0.00)[bounces-51816-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ew.tq-group.com:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.6:email,ew.tq-group.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,60fps:email]
X-Rspamd-Queue-Id: 1A58DB8C24
X-Rspamd-Action: no action

Am Freitag, 30. Januar 2026, 09:41:31 CET schrieb ming.qian@oss.nxp.com:
> From: Ming Qian <ming.qian@oss.nxp.com>
> 
> The VPU G2 clock was reduced from 600MHz to 300MHz in commit
> b27bfc5103c7 ("arm64: dts: freescale: Fix VPU G2 clock") to address
> pixel errors with high-resolution HEVC postprocessor output.
> 
> However, testing shows the 300MHz clock rate is insufficient for
> 4K60fps decoding and the original pixel errors no longer occur at
> 600MHz with current drivers.
> 
> Test results with 3840x2160@60fps HEVC stream decoded to NV12
> (the same scenario that exhibited pixel errors previously):
> 
> 300MHz performance:
> - Severe frame dropping throughout playback
> - Only 336 frames rendered in 11:53 (0.471 fps)
> - Continuous "A lot of buffers are being dropped" warnings
> - Completely unusable for 4K video
> 
> 600MHz performance:
> - Smooth playback with only 1 frame dropped at startup
> - 37981 frames rendered in 10:34 (59.857 fps)
> - Achieves target 60fps performance
> - No pixel errors or artifacts observed
> 
> Restore the clock to 600MHz to enable proper 4K60fps decoding
> capability while maintaining stability.
> 
> Test pipeline:
>   gst-launch-1.0 filesrc location=<4K60_HEVC.mkv> ! \
>     video/x-matroska ! aiurdemux ! h265parse ! \
>     v4l2slh265dec ! video/x-raw,format=NV12 ! \
>     queue ! waylandsink
> 
> Fixes: b27bfc5103c7 ("arm64: dts: freescale: Fix VPU G2 clock")
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> index 607962f807be..731142176625 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -960,7 +960,7 @@ pgc_vpu: power-domain@6 {
>  									 <&clk IMX8MQ_SYS1_PLL_800M>,
>  									 <&clk IMX8MQ_VPU_PLL>;
>  						assigned-clock-rates = <600000000>,
> -								       <300000000>,
> +								       <600000000>,

If I read the Datasheet correctly 600 MHz is only supported by overdrive
mode (also depending on the VDD_VPU).
Is this frequency really correct?

Best regards,
Alexander

>  								       <800000000>,
>  								       <0>;
>  					};
> 
> base-commit: c824345288d11e269ce41b36c105715bc2286050
> prerequisite-patch-id: 0000000000000000000000000000000000000000
> 





