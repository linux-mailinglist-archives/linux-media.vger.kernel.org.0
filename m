Return-Path: <linux-media+bounces-63514-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xdj0GqfVH2rWqgAAu9opvQ
	(envelope-from <linux-media+bounces-63514-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 09:20:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D21BF635221
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 09:20:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Ir6RFSHJ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63514-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63514-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3AB3231490C0
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 07:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E5D2400E09;
	Wed,  3 Jun 2026 07:14:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D933FE37D
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 07:14:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780470847; cv=none; b=N2/OH4K0aYDY52Uua/mIDyzH/C9xfEzDrppoATnwqN9zvV10G/Km6N8JcqD0YYQirCRDJyH0cJvrtE8c0oy1lasaru6PBOkj5d9cYUwJaR9rau/Ux/dxZ5hhT/rrwLdCHXgUTcHT7R2vcCfQldMR/WJAScTAZfrlPTU6F0l98Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780470847; c=relaxed/simple;
	bh=sAdA5dMCkdiHQ09E+ibH/ebNqLyDBvPv69ZAWpw3Qvs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EFJLNfjcSwzzlUjDvDFPEHiOTPulV4Jspi1KV1WUM+30Nf6qe1lhGGjbJ2CBnbDBoI8i8zmZMjR00Yw8IzrLB9iWAE4VavuTxMPtc9QdwxCZ8r93+Ecp0rk3bfrwFY7Dsb3DVf7WS69pmpGxE+Hmxe3KQemfZ5270DaCzyHbSkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ir6RFSHJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 011221F008A0;
	Wed,  3 Jun 2026 07:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780470845;
	bh=A+gQ5uv+FECzOhwxe87d9Dw3yKbd+d3sxgmT390y6ZM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ir6RFSHJ5u83bAG4FP+2KsvK2vto/m9o8t2rSpaEV0/DzphJ/mDv53znsxgtrjDW/
	 O8TaAR3MCZk4xzReR68YX9p1Fs0WOf5fd5o4N4I5kU5fE+aeLQE711ylvKgXckn5tj
	 DAb8qBods/Oe//WbnzwaQuXVdWXttAtArW1paFPjQVfNMPBy5s+lWnU0n9FHXbCkmf
	 neiKVfEqZEmljgzXkFnrffQ04rw1VyrMAIfwT2NT3hwMFpiwvHmgpPblqNf86E/HLG
	 iEmp+b6rxWxC+q8oJMv7ZRtf61au7QnJLCKaR+yE4Y+5rXoWvR1TpeQzx1iPfqREcG
	 pnwVeoFnbGqrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 10/12] media: microchip-isc: use weighted averages
 for Grey World AWB
Reply-To: sashiko-reviews@lists.linux.dev
To: "Balakrishnan Sambath" <balakrishnan.s@microchip.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260603-microchip-isc-fixes-v6-10-8c3d7474a768@microchip.com>
References: <20260603-microchip-isc-fixes-v6-10-8c3d7474a768@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 07:14:04 +0000
Message-Id: <20260603071405.011221F008A0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-63514-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:balakrishnan.s@microchip.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:replyto,sashiko.dev:url,microchip.com:email,vger.kernel.org:from_smtp,smtp.kernel.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D21BF635221

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The new histogram loop incorrectly uses 1-based indexing, skipping=
 bin 0 and corrupting AWB black-level offsets.
- [Medium] The minimum pixel count guard is not applied to the black-level =
offset and stretch gain calculations.
--

commit e4a1f6aa73ea293f51168aa52cc58f18a48000f7
Author: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Subject: media: microchip-isc: use weighted averages for Grey World AWB

This commit replaces pixel-count averages with intensity-weighted averages =
for
Grey World AWB estimation to prevent overexposures from dominating the esti=
mate.
It also resets per-channel histogram statistics in isc_reset_awb_ctrls() and
skips the darkest and brightest 2% of histogram entries as outliers.

> diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/driv=
ers/media/platform/microchip/microchip-isc-base.c
> index 3a941757906ae..6ebbb8adea452 100644
> --- a/drivers/media/platform/microchip/microchip-isc-base.c
> +++ b/drivers/media/platform/microchip/microchip-isc-base.c
[ ... ]
> @@ -1283,44 +1304,98 @@ static void isc_hist_count(struct isc_device *isc=
, u32 *min, u32 *max)
>  	regmap_bulk_read(regmap, ISC_HIS_ENTRY + isc->offsets.his_entry,
>  			 hist_entry, HIST_ENTRIES);
[ ... ]
> +	/* Find effective minimum (skip dark noise) */
> +	*min =3D 1;
>  	for (i =3D 1; i < HIST_ENTRIES; i++) {
> -		if (*hist_entry && !*min)
> +		cumulative +=3D hist_entry[i];

[Severity: High]
Does this loop unintentionally skip hist_entry[0]?

Since the loop starts at index 1 and uses literal array indexing
(hist_entry[i]) instead of the previous pointer increment (*hist_entry++),
bin 0 appears to be completely omitted when finding the effective minimum.

> +		if (cumulative > dark_threshold) {
>  			*min =3D i;
> -		if (*hist_entry)
> +			break;
> +		}
> +	}
[ ... ]
> +	/* Calculate both pixel count and weighted average for useful range */
> +	*hist_count =3D 0;
> +	weighted_sum =3D 0;
> +
> +	for (i =3D *min; i <=3D *max; i++) {
> +		pixel_count =3D hist_entry[i];
> +		*hist_count +=3D pixel_count;
> +		weighted_sum +=3D (u64)i * pixel_count;
> +	}

[Severity: High]
Because *min is forced to be at least 1 above, this loop also skips bin 0
from *hist_count and ctrls->total_pixels.

For mostly dark scenes, could this report an artificially low total pixel
count, improperly triggering the min_pixels guard in isc_wb_update() and
erroneously disabling AWB gain?

>  static void isc_wb_update(struct isc_ctrls *ctrls)
>  {
[ ... ]
> +	/*
> +	 * Require a minimum pixel count for both black-level offset and
> +	 * grey-world gain: 1/64 of the frame area, which equals ~6.25% of
> +	 * one Bayer channel's expected pixel count.  This scales with sensor
> +	 * resolution and prevents noise-dominated histograms (from very small
> +	 * crops or a nearly-empty frame) from producing wild corrections.
> +	 * A floor of 64 ensures the guard is non-zero for tiny crops.
> +	 */
> +	frame_pixels =3D isc->fmt.fmt.pix.width * isc->fmt.fmt.pix.height;
> +	min_pixels =3D frame_pixels ? max(frame_pixels >> 6, 64u) : 64u;
> +
>  	for (c =3D ISC_HIS_CFG_MODE_GR; c <=3D ISC_HIS_CFG_MODE_B; c++) {
> +		u32 hist_min =3D ctrls->hist_minmax[c][HIST_MIN_INDEX];
> +		u32 hist_max =3D ctrls->hist_minmax[c][HIST_MAX_INDEX];
> +		u32 channel_avg =3D ctrls->channel_avg[c];
> +		u32 total_pixels =3D ctrls->total_pixels[c];
> +
>  		/*
> -		 * the color offset is the minimum value of the histogram.
> -		 * we stretch this color to the full range by substracting
> +		 * the color offset is the minimum value of the histogram.
> +		 * we stretch this color to the full range by substracting
>  		 * this value from the color component.
>  		 */
> -		offset[c] =3D ctrls->hist_minmax[c][HIST_MIN_INDEX];
> +		offset[c] =3D ctrls->hist_minmax[c][HIST_MIN_INDEX];
>  		/*
>  		 * The offset is always at least 1. If the offset is 1, we do
>  		 * not need to adjust it, so our result must be zero.
>  		 * the offset is computed in a histogram on 9 bits (0..512)
>  		 * but the offset in register is based on
>  		 * 12 bits pipeline (0..4096).
>  		 * we need to shift with the 3 bits that the histogram is
>  		 * ignoring
>  		 */
> -		ctrls->offset[c] =3D (offset[c] - 1) << 3;
> +		ctrls->offset[c] =3D (offset[c] - 1) << 3;

[Severity: High]
Since offset[c] (which is *min) is now a 0-based array index but the loop
above forced it to be >=3D 1, does subtracting 1 here corrupt the offset?

For example, if hist_entry[1] exceeds the threshold, *min is 1. The formula
(1 - 1) << 3 yields 0 instead of the expected 8 for bin 1, potentially
under-compensating the black level persistently.

>  		/*
>  		 * the offset is then taken and converted to 2's complements,
>  		 * and must be negative, as we subtract this value from the
>  		 * color components
>  		 */
>  		ctrls->offset[c] =3D -ctrls->offset[c];
> =20
>  		/*
> -		 * the stretch gain is the total number of histogram bins
> -		 * divided by the actual range of color component (Max - Min)
> -		 * If we compute gain like this, the actual color component
> -		 * will be stretched to the full histogram.
> -		 * We need to shift 9 bits for precision, we have 9 bits for
> -		 * decimals
> +		 * Stretch gain: scale the histogram range [hist_min, hist_max]
> +		 * to the full 512-bin span.  Result is in Q9 fixed-point
> +		 * (1.0 =3D 512).
>  		 */
> -		s_gain[c] =3D (HIST_ENTRIES << 9) /
> -			(ctrls->hist_minmax[c][HIST_MAX_INDEX] -
> -			ctrls->hist_minmax[c][HIST_MIN_INDEX] + 1);
> +		s_gain =3D (HIST_ENTRIES << 9) / (hist_max - hist_min + 1);
> =20
>  		/*
> -		 * Now we have to compute the gain w.r.t. the average.
> -		 * Add/lose gain to the component towards the average.
> -		 * If it happens that the component is zero, use the
> -		 * fixed point value : 1.0 gain.
> +		 * Grey-world gain: scale each channel towards the green
> +		 * average.  Require a minimum pixel count so noise-dominated
> +		 * channels do not produce wild corrections.
>  		 */
> -		if (hist_count[c])
> -			gw_gain[c] =3D div_u64(avg << 9, hist_count[c]);
> +		if (channel_avg > 0 && total_pixels >=3D min_pixels)
> +			gw_gain =3D div64_u64((avg << 9), channel_avg);
>  		else
> -			gw_gain[c] =3D 1 << 9;
> +			gw_gain =3D 1 << 9;

[Severity: Medium]
The comment earlier explicitly states the min_pixels guard is required for
"both black-level offset and grey-world gain", but the condition here is
only applied to gw_gain.

Because offset[c] and s_gain are computed unconditionally above, will nearly
empty histograms still compute s_gain and offset from noise bins? This seems
like it could apply wildly incorrect black-level offsets and up to a 16x
stretch multiplier to the noise, contradicting the intent of the guard.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-microchip-=
isc-fixes-v6-0-8c3d7474a768@microchip.com?part=3D10

