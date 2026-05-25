Return-Path: <linux-media+bounces-62722-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDNAOhtmFGoxNAcAu9opvQ
	(envelope-from <linux-media+bounces-62722-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 17:09:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 617FD5CC1AC
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 17:09:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 795D530157CE
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 15:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4593F39FA;
	Mon, 25 May 2026 15:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ge4FHCOT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A3A2848A7
	for <linux-media@vger.kernel.org>; Mon, 25 May 2026 15:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779721750; cv=none; b=S36ifCzmZ7mn+lAtHItaXbR6/MuAqUBaM12g1QIbT4mRXnSLjTp8Rs67i0FAD9Wj7tWeb+6AXoN47ozEWs9alIwkhJgUoqrgTsZGUQTr8ALy8TC8LpVycAFo5wuHyYnMnu6xo4dBcgc/PEifxkJX7fn2peN3bzdospEo13OFz3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779721750; c=relaxed/simple;
	bh=IzCOny6Nod21N13gA9cuvXZomqjhn4bBDjSiTnSkKGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DsJrLHSP7FXdC/te+LwXkrYkCPMpUNHipJwxR4+4UC/IsH+QxJEuDJg86EXzWO8GYJgyLo9KFOWGrWqiyEPcaY8uUTm/33CGsKWA3gslK0a7+t4YAMJfg+Uhk6ehIxB+YOiZniyzrgMcmnEGmanKYlhnIQXw5lbTns560QHRIOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ge4FHCOT; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bda62f13d90so883164866b.2
        for <linux-media@vger.kernel.org>; Mon, 25 May 2026 08:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779721747; x=1780326547; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gBVorB1+8JpSCZMZQ/463osKFmmbEUZ3oriEHdtVZIk=;
        b=ge4FHCOTJ4bZ7+BV/QKOgVLQFSQPZ9MwbdG8ySaOaE65PjetoBkPuuSUFXvwhGkyYe
         tvnRPnDD+TBjKZ0HYONg6V63RTtRjdZAw+0b3rWRMWd3CqRC/ySEKTdYyr9dee4pyzgd
         nLhy5uGLmxQhfolt3C5r7+iz0De2boHSsZeko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779721747; x=1780326547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBVorB1+8JpSCZMZQ/463osKFmmbEUZ3oriEHdtVZIk=;
        b=arzpyxAcl/NqA/9v87JbEKxp3ICIcc+fDkoPJ4c9ByW0RUd1dJ/kvx6wTen2QxU2sU
         mmrf/tk4GZOrTzmwj4rx5eOwuWxFlLdDC9wSdT2FHgEeKLn4W81xMxngIouSdr/Fgv+F
         +0oeXiSmFB5dyyPLi7ry/ghEmdpGQ19Y28DiqjU3Gu0Ftnko5DVmWnudtVPf4H1oAood
         Y9UK7ox5FJ3wuJU7uBwdCGX/G2/qmjUeLeWAfSdyNuv/O2SBOdkUkN1wbxQ5L+SMCwCU
         8eYWAbWJai+rQkB+Aup2e/JGCudm9Ym8Nx34Ob+SyTcQwd3AMvCH5as8/6vRSThpFIet
         +eCw==
X-Gm-Message-State: AOJu0Yz1wGT4RaW+MCl1XWd6bqpGJRwPZVGDPx0VLbPGpfG/Uikw8SMO
	DnNY/POCQDySmhHTa4eGTzmCYUHULZmcSkDO+lZRwPj1oD7455NjoKrtOh19DPMd0yk5NMd92Wz
	ob4I=
X-Gm-Gg: Acq92OFGeHzPQq1MLGiwtBs4aUC/rbzm+JGpvyQYrapj0eYk0Z+8yprOqvyFLN2BZLl
	AQ/3KpA6YHF4OknaGOtKyoNC+C/X72XjNDurNvaaJ/+mxyNLiLSzNlzOcvRGHWRMAvCByN7BdFy
	eZDw+f3O6VofJUHcJVWs1SHZEtj83BpVOh8TjEagx7ZaI0IuuYwoDY5r4RPpO0bt0/P5QLSQwxP
	X4Q/hkHHHalWkkZbpfgT+qurGtOSmE9EIWNvc9Z/Z/Q7QVx5DF05zrY/pW18DkWEPVcK0zzHb/r
	59HKpZBa23uiXglU+H+Dvlnj51W6ZdVONnvyKec7zBhCtMfH09wWVLvS13PA5XxfWuMNrVAq8+S
	80I535rz3N3bGvkd+s8XY5Vfv16gcP4rnRgok5Lp2a4LSsoAesQk4Ar1xFeJFNnRSP4oNDI1Sc3
	WggIAa8vWeFgbq8DrZzRCSmXknpIb2luFRKdL2SOlCEmH7MOJfer1o0Rkrlukj
X-Received: by 2002:a17:907:d113:b0:bd8:f771:ea9a with SMTP id a640c23a62f3a-bdd264c895dmr898123366b.41.1779721746764;
        Mon, 25 May 2026 08:09:06 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc3051337sm414908866b.19.2026.05.25.08.09.04
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 08:09:05 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bda62f13d90so883156466b.2
        for <linux-media@vger.kernel.org>; Mon, 25 May 2026 08:09:04 -0700 (PDT)
X-Received: by 2002:a17:907:75cd:b0:bd4:f3e2:f1b with SMTP id
 a640c23a62f3a-bdd25de3aacmr624430066b.32.1779721743664; Mon, 25 May 2026
 08:09:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522225402.247080-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20260522225402.247080-1-sakari.ailus@linux.intel.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 25 May 2026 17:08:51 +0200
X-Gmail-Original-Message-ID: <CANiDSCtH7treRe_2Y7h9YoiAfRGXZoX9pHNpLhcaoT2qS5+mFA@mail.gmail.com>
X-Gm-Features: AVHnY4KHjF2CvUVfOXmmOXhC4JD1fJqn38lKojxndSpMQ56wO-e5JrHGy6OnzP0
Message-ID: <CANiDSCtH7treRe_2Y7h9YoiAfRGXZoX9pHNpLhcaoT2qS5+mFA@mail.gmail.com>
Subject: Re: [PATCH 1/1] staging: media: ipu3-imgu: Ensure correct binary selection
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62722-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[chromium.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 617FD5CC1AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari



On Sat, 23 May 2026 at 00:55, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> The ImgU has two sets of binaries, those that support striping (fixed at
> 2) and those that don't. There's overlap between the stripes and so that
> implies a minimum width for the images themselves, or the Bayer downscale
> rectangle in particular.
>
> Take this account in binary selection.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> Hi Ricardo,
>
> I'm not sure if this makes smatch happy but it somehow addresses the issue
> it found. In the end it's up to the userspace to configure this
> correctly...

Smatch should be calmed now:

https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/c32fe4c4918c9aa49f61359e3b42619c4d8686de

But if you want to add more tests, you are of course welcome :)

>
> Compile tested only.
>
> - Sakari
>
>  drivers/staging/media/ipu3/ipu3-css.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
> index 8063401246fb..3e4e03a8fa3a 100644
> --- a/drivers/staging/media/ipu3/ipu3-css.c
> +++ b/drivers/staging/media/ipu3/ipu3-css.c
> @@ -1613,6 +1613,12 @@ static int imgu_css_find_binary(struct imgu_css *css,
>                     in->height > bi->info.isp.sp.input.max_height)
>                         continue;
>
> +               /* Check the striping overlap isn't wider than the stripe. */
> +               if (bi->info.isp.sp.iterator.num_stripes > 1 &&
> +                   rects[IPU3_CSS_RECT_BDS].width <
> +                   4 * IPU3_UAPI_ISP_VEC_ELEMS * 2)
> +                       continue;
> +
>                 if (imgu_css_queue_enabled(&queue[IPU3_CSS_QUEUE_OUT])) {
>                         if (bi->info.isp.num_output_pins <= 0)
>                                 continue;
> --
> 2.47.3
>


-- 
Ricardo Ribalda

