Return-Path: <linux-media+bounces-67536-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uJSgNGLZVWpSuQAAu9opvQ
	(envelope-from <linux-media+bounces-67536-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 08:38:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E83751904
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 08:38:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=aXTcyGe9;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67536-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67536-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A6C9A3032ADE
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 06:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C6737AA95;
	Tue, 14 Jul 2026 06:37:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EB53E6DD2;
	Tue, 14 Jul 2026 06:36:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784011019; cv=none; b=DXvPbJ3hdoNAT+6YeyNw8rkn+Fy/S34ZpRFcAdBZzV+MVueFrOnlORUn97ciQ7daoMRXt2+omSiCNfvIRdNdGwG3ep56t4CL/8coE95iUR7j0IhBrtte1qWS5c5naduDDUkOEhSRkyfCwxKm9E4RG7AbpUkH1OJdStACaIOaGqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784011019; c=relaxed/simple;
	bh=rv7+5xGlTRLQD0K+Zr3AFjuxlLGkscjf5d+T+G82QT8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=qZtzpNj/PvVYL3t+nQiqeTGAVaAAuZsHpPZK6QTCRbpm3B0VwePA23TBHgBAWBjPQ21jzMx9T/31cpt+3lqMHi2fZijTfhQWOgjsAFqCXZQe+js1d0b8e2fcLGyi1gdaHJySJPtKN4TWbl4DNirvefCooZB4MHHS7N0U0Mo5uEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aXTcyGe9; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:6882:e7a6:c276:3fc9:5f7a])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A6DED7CA;
	Tue, 14 Jul 2026 08:35:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784010956;
	bh=rv7+5xGlTRLQD0K+Zr3AFjuxlLGkscjf5d+T+G82QT8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=aXTcyGe92HcgctssT7vXRRuA1x93A5of9INDa1un/i5J+QAWxSupXDDPYZqWOOHM4
	 vZ+Fd9oevIY/VS+8ywLPdDRd8ShrqE31MNF0vBOdE6JF2lsK00a6l3i7X4tdGAY8Ms
	 M9r9Vb51EwAlZbnnKW/DPvbRMWjUcnKoXfoGQnzI=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260701125738.6384-1-tharitt97@gmail.com>
References: <20260701125738.6384-1-tharitt97@gmail.com>
Subject: Re: [PATCH v3] media: imx219: add test patterns
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Tharit Tangkijwanichakul <tharitt97@gmail.com>
Date: Tue, 14 Jul 2026 12:06:44 +0530
Message-ID: <178401100430.9736.3724953452669883732@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67536-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[raspberrypi.com,kernel.org,linux.intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:linux-kernel-mentees@lists.linux.dev,m:tharitt97@gmail.com,m:dave.stevenson@raspberrypi.com,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linuxfoundation.org,lists.linux.dev,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,freya:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68E83751904

Hi Tharit,

Quoting Tharit Tangkijwanichakul (2026-07-01 18:27:38)
> Add 5 missing test patterns to complete the available
> hardware test patterns.
>=20
> The original mapping for color bars and solid color in the menu
> is preserved to prevent existing userspace application and automated
> vendor capture tests.
>=20
> The changes were validated on a raspberry pi 5 with an imx219 sensor
> using v4l2-ctl and rpicam-still.
>=20
> Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

> ---
> Changes in v3:
>         - Revert the change to the original test pattern mapping
>         to avoid breaking userspace applications
> Changes in v2:
>         - Fix typo in commit message: correct the color bars index
>         to 1 and solid color to 2
>         - No code changes from v1
>  drivers/media/i2c/imx219.c | 27 +++++++++++++++++++++------
>  1 file changed, 21 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 223d3753c..9571f3622 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -110,11 +110,16 @@
> =20
>  /* Test Pattern Control */
>  #define IMX219_REG_TEST_PATTERN                CCI_REG16(0x0600)
> -#define IMX219_TEST_PATTERN_DISABLE    0
> -#define IMX219_TEST_PATTERN_SOLID_COLOR        1
> -#define IMX219_TEST_PATTERN_COLOR_BARS 2
> -#define IMX219_TEST_PATTERN_GREY_COLOR 3
> -#define IMX219_TEST_PATTERN_PN9                4
> +#define IMX219_TEST_PATTERN_DISABLE                    0
> +#define IMX219_TEST_PATTERN_SOLID_COLOR                        1
> +#define IMX219_TEST_PATTERN_COLOR_BARS                 2
> +#define IMX219_TEST_PATTERN_GREY_COLOR                 3
> +#define IMX219_TEST_PATTERN_PN9                                4
> +#define IMX219_TEST_PATTERN_16SPLIT_COLOR_BARS         5
> +#define IMX219_TEST_PATTERN_16SPLIT_INV_COLOR_BARS     6
> +#define IMX219_TEST_PATTERN_COLUMN_COUNTER             7
> +#define IMX219_TEST_PATTERN_INV_COLUMN_COUNTER         8
> +#define IMX219_TEST_PATTERN_PN31                       9
> =20
>  /* Test pattern colour components */
>  #define IMX219_REG_TESTP_RED           CCI_REG16(0x0602)
> @@ -238,7 +243,12 @@ static const char * const imx219_test_pattern_menu[]=
 =3D {
>         "Color Bars",
>         "Solid Color",
>         "Grey Color Bars",
> -       "PN9"
> +       "PN9",
> +       "16 Split Color Bars",
> +       "16 Split Inverted Color Bars",
> +       "Column Counter",
> +       "Inverted Column Counter",
> +       "PN31"
>  };
> =20
>  static const int imx219_test_pattern_val[] =3D {
> @@ -247,6 +257,11 @@ static const int imx219_test_pattern_val[] =3D {
>         IMX219_TEST_PATTERN_SOLID_COLOR,
>         IMX219_TEST_PATTERN_GREY_COLOR,
>         IMX219_TEST_PATTERN_PN9,
> +       IMX219_TEST_PATTERN_16SPLIT_COLOR_BARS,
> +       IMX219_TEST_PATTERN_16SPLIT_INV_COLOR_BARS,
> +       IMX219_TEST_PATTERN_COLUMN_COUNTER,
> +       IMX219_TEST_PATTERN_INV_COLUMN_COUNTER,
> +       IMX219_TEST_PATTERN_PN31
>  };
> =20
>  /* regulator supplies */
> --=20
> 2.53.0
>

