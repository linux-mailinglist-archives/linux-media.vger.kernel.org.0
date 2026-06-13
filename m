Return-Path: <linux-media+bounces-64779-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b17VKOKkLWq1iAQAu9opvQ
	(envelope-from <linux-media+bounces-64779-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 20:43:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F7267F56A
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 20:43:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="bGjkI/W6";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64779-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64779-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB958304346D
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 18:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A6A738E8D0;
	Sat, 13 Jun 2026 18:43:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153B837F011;
	Sat, 13 Jun 2026 18:43:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781376212; cv=none; b=rmTbQR6GLGUcwN5LvXu5KPC4lfVQPY1prn/PD1P9EWdrPlnn/dASr2PuSnOp48ySB7w2AAGgczdPlC+LGhy93l0XlXTYECcTjtxDcOdDspzqtXYH7XP85mGkh/FXp8MUNs3fZz1TaS2XCTJt6W0UgRaEaft9BsyeG+jTKjQmK1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781376212; c=relaxed/simple;
	bh=8wP4sVNIakxniupzxJRszXC4bYyJrcvPnWKv6+dS7Oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d0wyiptuFIaT2WRuJnaL6TFtwi/F/ZMNZJmz55Im11e0CoC+bcxd0Moh50rKchWFJCBNaNvfQ3KbWiEUR+Mm4+gNJ830Sv/YoP2rMKr1Z9KwPzkWqqWacpcyZpMxGXjUxCnCXyR9o11QfDwXMXWbGVVy45tizZqkOZdkBHsmP3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bGjkI/W6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E75141F000E9;
	Sat, 13 Jun 2026 18:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781376210;
	bh=E5OxYVxEnxPSINP+iLBTBhgmbmiSGilAnYAH4qvmbE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bGjkI/W6lMNGFSpuvwSRT8HTDobzdQpCXKMAapFqK7VY1w9akhx1bwFn2Q/m5gs0c
	 77v+ecfSratNxmtN1YJAAfZ0gM+qRNCY1hNFq/jWjNZbplPCnmnVPvn6ootWIsRope
	 FEtt4iU9lW02PToqdBKWtxKKcsfR33VMkpiBxhfZ7i63IcPHr4A1Hf92BoX9d6FfZw
	 jNgVRimfalwQ24ieRO+GECgVnGvNRtsyJiTUez6DHn2MRXuaTSPEqYR++0ynR0Qzh0
	 qpbzm4z+zuY5+pVXDZNt2/YCCyowbzsm5AXfc1tTdCkgysY++3luLitztjCNCZqz/A
	 bGM2aR0jELEiw==
Date: Sat, 13 Jun 2026 20:43:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, bod@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/4] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
Message-ID: <20260613-eccentric-statuesque-centipede-5f8d8a@quoll>
References: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
 <20260612194417.1737009-5-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260612194417.1737009-5-atanas.filipov@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:bod@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64779-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,quoll:mid,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06F7267F56A

On Fri, Jun 12, 2026 at 10:44:17PM +0300, Atanas Filipov wrote:
> Add a Qualcomm JPEG encoder driver implemented on top of the
> V4L2 mem2mem framework.
> 
> The driver wires vb2 queue handling, format negotiation, JPEG header
> handling, interrupt-driven job completion, and runtime PM/clock/ICC
> integration for the standalone JPEG encode hardware block.
> 
> Initial support in this series targets SM8250, QCM6490, and SM8550
> class platforms.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/Kconfig           |    1 +
>  drivers/media/platform/qcom/Makefile          |    1 +
>  drivers/media/platform/qcom/jpeg/Kconfig      |   18 +
>  drivers/media/platform/qcom/jpeg/Makefile     |    9 +
>  .../media/platform/qcom/jpeg/qcom_jenc_defs.h |  244 +++
>  .../media/platform/qcom/jpeg/qcom_jenc_dev.c  |  336 ++++
>  .../media/platform/qcom/jpeg/qcom_jenc_dev.h  |  107 ++
>  .../media/platform/qcom/jpeg/qcom_jenc_hdr.c  |  360 ++++
>  .../media/platform/qcom/jpeg/qcom_jenc_hdr.h  |  119 ++
>  .../media/platform/qcom/jpeg/qcom_jenc_ops.c  | 1658 +++++++++++++++++
>  .../media/platform/qcom/jpeg/qcom_jenc_ops.h  |   52 +
>  .../media/platform/qcom/jpeg/qcom_jenc_res.c  |  226 +++
>  .../media/platform/qcom/jpeg/qcom_jenc_res.h  |   54 +
>  .../qcom/jpeg/qcom_jenc_v420_hw_info.h        |  529 ++++++
>  .../media/platform/qcom/jpeg/qcom_jenc_v4l2.c | 1109 +++++++++++
>  .../media/platform/qcom/jpeg/qcom_jenc_v4l2.h |   25 +
>  16 files changed, 4848 insertions(+)
>  create mode 100644 drivers/media/platform/qcom/jpeg/Kconfig
>  create mode 100644 drivers/media/platform/qcom/jpeg/Makefile
>  create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h
>  create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
>  create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h
>  create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
>  create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h
>  create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c
>  create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h
>  create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_res.c
>  create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_res.h
>  create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h
>  create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
>  create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h
> 
> diff --git a/drivers/media/platform/qcom/Kconfig b/drivers/media/platform/qcom/Kconfig
> index 4f4d3a68e6e5..f33d53a754a0 100644
> --- a/drivers/media/platform/qcom/Kconfig
> +++ b/drivers/media/platform/qcom/Kconfig
> @@ -5,3 +5,4 @@ comment "Qualcomm media platform drivers"
>  source "drivers/media/platform/qcom/camss/Kconfig"
>  source "drivers/media/platform/qcom/iris/Kconfig"
>  source "drivers/media/platform/qcom/venus/Kconfig"
> +source "drivers/media/platform/qcom/jpeg/Kconfig"
> diff --git a/drivers/media/platform/qcom/Makefile b/drivers/media/platform/qcom/Makefile
> index ea2221a202c0..30c94949e9de 100644
> --- a/drivers/media/platform/qcom/Makefile
> +++ b/drivers/media/platform/qcom/Makefile
> @@ -2,3 +2,4 @@
>  obj-y += camss/
>  obj-y += iris/
>  obj-y += venus/
> +obj-y += jpeg/

Same comments.

It seems you ignored entire v1 review and just ask us to do the same
work twice.

NAK, please address review you received.

Best regards,
Krzysztof


