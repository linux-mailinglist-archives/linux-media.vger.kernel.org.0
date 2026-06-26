Return-Path: <linux-media+bounces-65699-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pqFvE8lOPmqXDAkAu9opvQ
	(envelope-from <linux-media+bounces-65699-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 12:04:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6EC6CBE85
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 12:04:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b="AMhWy/Ij";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65699-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65699-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 523BC304E6E0
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 10:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605C93E5A1D;
	Fri, 26 Jun 2026 10:04:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BED3B993F;
	Fri, 26 Jun 2026 10:04:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782468252; cv=none; b=NqjQNbKZlGL7VrDwhKIGiUBVomKUoJHdGUYjDpur67cOPA/5JSa00crVcuOoMxHgqwaWOR7ZgFbIvLyI1YcH/QHM1v8A8X48JfN+b+cS25bnMRR6vwS56pxWEK+9lgEKg2IDRO1OUMtpaT4Eh2MHyOEeebXZcpS5S4jReYwKz+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782468252; c=relaxed/simple;
	bh=Bdl152pzFf7aWbtoJlbgiblz0+jWiyoHZ5m/pPAcdzA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=kPi50M77cvJPvZUcQ6qCGDKJfgNh3cj2s/kRrS41gFHxm53gydFWPeJfnXCF/FZ3S/KAHAcpkeI7dwCwDjOA3/9EnoWaBUWC6VWcMcsqNhh+EXgl9znK49i59+le7wdkqnk/+4qtb5jor+BsPya5sH4kE87TnYuERDjPILR1AqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AMhWy/Ij; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:bcf2:9325:a9bd:32b:e71])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 000551E7;
	Fri, 26 Jun 2026 12:03:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782468208;
	bh=Bdl152pzFf7aWbtoJlbgiblz0+jWiyoHZ5m/pPAcdzA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=AMhWy/Ijnd3/IrcXSSZRs/TtjQgApSC5zA4fxAgkCr9MRsHxcbYctZ+zSIvBGJhac
	 BfeFEaPcatCuPEEMOS/HlTQkUATEmInDSLSOglxU99ryuEr25A5SPpOjWohcvSVRQs
	 tF5RAw1+ixPP0Oy2kw1ZBDFVQI6K53284sAfPuP0=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260625160228.59672-1-tharitt97@gmail.com>
References: <20260625160228.59672-1-tharitt97@gmail.com>
Subject: Re: [PATCH] media: imx219: fix test pattern ordering and add patterns
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Tharit Tangkijwanichakul <tharitt97@gmail.com>
Date: Fri, 26 Jun 2026 15:34:01 +0530
Message-ID: <178246824177.1799417.1678746966574660598@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65699-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,linuxfoundation.org,lists.linux.dev,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:linux-kernel-mentees@lists.linux.dev,m:tharitt97@gmail.com,m:dave.stevenson@raspberrypi.com,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[raspberrypi.com,kernel.org,linux.intel.com,gmail.com];
	FORGED_SENDER(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A6EC6CBE85

Hi Tharit,

Thank you for the patch.

Quoting Tharit Tangkijwanichakul (2026-06-25 21:32:28)
> The test pattern menu currently maps 0 to color bars and 1 to a solid
> color, whereas the imx219 datasheet specifies the reverse layout. fix
> the ordering to align with the hardware specification.
>=20

I'm not aware why the order was originally switched for the control menu.
Do you have a strong reason to switch this to the datasheet values?

I ask because this might break what userspace applications expect
(libcamera) and also automated capture tests (that compare md5sums of the
test pattern) in vendor board-farms.

Moreover, given this is a menu control with (correct) string descriptions
for what pattern will be selected, I don't see why the order should
strictly match the sensor register values except that it would be "nice".

Thanks,
    Jai

> Additionally, add 5 missing test patterns to complete the available
> hardware test patterns.
>=20
> The changes were validated on a raspberry pi 5 with an imx219 sensor
> using v4l2-ctl and rpicam-still.
>=20
> Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
> ---
>  drivers/media/i2c/imx219.c | 31 +++++++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 223d3753c..8f0c04afd 100644
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
> @@ -235,18 +240,28 @@ static const s64 imx219_link_freq_4lane_menu[] =3D {
> =20
>  static const char * const imx219_test_pattern_menu[] =3D {
>         "Disabled",
> -       "Color Bars",
>         "Solid Color",
> +       "Color Bars",
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
>         IMX219_TEST_PATTERN_DISABLE,
> -       IMX219_TEST_PATTERN_COLOR_BARS,
>         IMX219_TEST_PATTERN_SOLID_COLOR,
> +       IMX219_TEST_PATTERN_COLOR_BARS,
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
>=20
> base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
> --=20
> 2.53.0
>=20
>

