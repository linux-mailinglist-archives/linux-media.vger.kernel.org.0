Return-Path: <linux-media+bounces-61709-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNftKboNB2oLrAIAu9opvQ
	(envelope-from <linux-media+bounces-61709-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:12:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 504A954F3CC
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:12:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EDF5C30402E2
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 12:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1D3547A0C7;
	Fri, 15 May 2026 12:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fSiedV18"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB7147DF84
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 12:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778846787; cv=pass; b=WBvid0iWryObJRXjQft8b8y2fSUuHfKox0Ha/jsjAXA/0xuJ1M6QV1pBV0iw35SSPXF0hvkYv3JlAj+VbGZkngMfUGL6h7w3XVcwRErq+LMjBTT6e73wKSLfk/cpjPne4Qx63gYDFCwbliYJILCtAnV2RmLRR8q28oWbrLEGM10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778846787; c=relaxed/simple;
	bh=q5bl+69zkmypiwMoiO+7fjfWxyUFssPPi1EuZdo7nIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pEHRxJr56iMkxUYG2ZadLlCaR2QQ9ykXVhDAGMPFwLtmOgiMY3wsFUfGShozHuxEKghN8CfSCR4Q+XfR9B3I2dKrjAd/grbggCCo5i2j1c09UGLB9b8xW7AR8LqItY+ZRmgAiizPPE3/5KXW9+HbbZJFgvGFzlJgPTBcGdS5eEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fSiedV18; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d734223e4so545204f8f.0
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 05:06:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778846784; cv=none;
        d=google.com; s=arc-20240605;
        b=deeSggdUiUGQzrgjoM22u2XzCzoi5VdDZoGg91bW653r4JpeTmicr/sxUmmm3Ojd+d
         0zud789adO7t0fGEnOjaooMIXZC3O6cRAJ3LeXWlcD/CSM9OyubImBiyEtdIpV3xYK5F
         s110Sxeb7shKomiq/PR4fBnfog1hq5RdR/JXRuhrdWGtktljSRc83pW52/wuTWB95Jx0
         5KbF+ekD1yU1BP0VwIXpVUHx+T2jd3Y+m/w4JdxqDxhvNIBnBAoFdNb2JTAs8LRWvHaC
         HzjzvGJE9obfLj51PFzWsUKX2PEk/+Ku4bgt823O54dA2IzXWYjASWd4/KTQskwte7TC
         T1HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QneO8pDIgfkwAbhOOAG6ki15SUDiUiZrWTWCyj+hT8k=;
        fh=AgduAMirl7kPKemF0976dZjDquIiAUAh6nxjGuajIO0=;
        b=PlMNQ2+ZDKjOig+IiRd175AS8JGfe1G4SESzRMgGY8VA92cwavLH8X1dkN5hFes1L/
         5myctvMTyVFZH5MQSvVbbFKwsYPrN+BkN4s/9zhDQO1YuEb3QWhsKiVA4e95vbAkUBP1
         KYLxYQwaL807wjHSuv+/xHlC+qrSxDlgFH2Xr26KnmrHF1cskr4m0fPlRw+Lfr9oWIfq
         tNtDFi6kw1Mkf8rXqnEilvTF/JqziVvIlGIedpFGdXTBbvqDzr69HVpSLlpmEYkRTbt9
         1q2XyiqUkFVKMOoPMXbm5Jkv/FWmdc34+H44s9HJq1hrC6N4wIA8K6t0M6z2KZvTu4h2
         YL5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778846784; x=1779451584; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QneO8pDIgfkwAbhOOAG6ki15SUDiUiZrWTWCyj+hT8k=;
        b=fSiedV18vZX5H2p4YPKZlEwU/SoXhfCPsCzsSNfNsmGjkOoXmR8dIfeM3WN5j9aL9t
         4KpWFDrQFhnX41E0YpXqS/+NCfeUDUkF97tq+ECtIt6DHNblOv78j0NVmQld2j7iHUZZ
         EQm8IO/SLpaxUGuBGtRkk0wsIzobUdj1s4rxVVkDcnvjD24AoKfkhPuBp+BOn0FIU6nq
         888m2oyu1fdssJzPpwEihgZ5HQyAoc7bh2hf+h39n8WaIfxH9wnQmOiFtASerLx5nU13
         jTtoXmFWz46bEHgsKv+E9htXUM/PBx79c3F2QeoMMso6dhYOru/UYibgmuqHCOGe5tEk
         0U8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778846784; x=1779451584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QneO8pDIgfkwAbhOOAG6ki15SUDiUiZrWTWCyj+hT8k=;
        b=Lm6WD1t1LS2e0MhFlcOsnRB9pof4iG8GbJ3wFyArtPOW1dDFS1Y/FUV6Bb976cFb8B
         UJRtbxHEWHRER8iXzf3S9dpjbTa9w3oI+hpMa/I36ePk41B13f3DdSqlHC0e3Tz8TyKx
         2I/ydWWBM4OCPSvKq0I2YSn7dQIi+75dGsdsLBD6ll2QAhs8pHWn5iMC9+8dU6T/DXEc
         tTcRO7SEx8BK6Gr8AQ/WobLHoITF1e02HhmabMn41J8nBvdzXwNBBjAH/M5t7Hr9gx+F
         DDwIfGbFpOr07yMIQBmXS88vv8+dInej7o3Wpc6qEnDP4Lwp9ng5XwuSpKfPETSoBSEo
         t/EQ==
X-Forwarded-Encrypted: i=1; AFNElJ/RzyBAiVSG17ZAbZLSkk9GGajOLlURZq9iKCAglAdloGLN1OWqabRM0Ug6sHG6d+d7RVBPr8qI0w8+5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YycmYwBdXdOuvP8nQJS/f40729QszRwCHf7w3CeglO/d/6IQbOR
	x7GKo/u+Aw6GxmVSkqxv/f5UXtHIvZVkt61WXeBETzYMTHio71Y3OHM/KGWg3n5MgHQJIOCWr7w
	5ONliPBM2oiVncrc0QlgN0WjA7uaJTtw=
X-Gm-Gg: Acq92OGLlCp/BCL6sOD2799YOqJ7spCzfcE2/zzu7imaL4TorriNHqXGSsz4M/A7KZO
	2fKsjwIV17mmQFvAtCW8oqNNAMyILabxllH5aKjOs0CBVTjZGrC1TyViTB3+YPqQj2mXbt2fkM4
	KOKMT2eBMuFS82QFlFHQD1xiHsGxMpK1iMuWXXUzhVaNGThZs+TDJkEoNPwMrsUONEtNBrYB5uS
	Sn9zcbuG5XqQMgWJJTDM3q7Vy5Elaf8MkcCFa63mp5LsFmds7J82Za4gXrE28C97/oUI0garzzW
	F6rrn/HKHazYGJrQen0+ytmvuJhe/hGUX1RiiQRg244JlbGKnFGTdcckzB7F0ixcaMA=
X-Received: by 2002:a5d:5f90:0:b0:441:2397:f40f with SMTP id
 ffacd0b85a97d-45d900ec71fmr12258747f8f.4.1778846784068; Fri, 15 May 2026
 05:06:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330144509.258986-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260330144509.258986-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 15 May 2026 13:05:58 +0100
X-Gm-Features: AVHnY4J7iyFvZ1_OTQGwe8obo1L48yvwada0RoL4MXD5-AftuDdqfdQVOgBB0n4
Message-ID: <CA+V-a8vVhjFzuxKSLBG=WKUCnyih_8f6Ww2mJ=tUV8VE4mp8_Q@mail.gmail.com>
Subject: Re: [PATCH v3] media: i2c: ov5645: Convert to CCI register access helpers
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Xiaolei Wang <xiaolei.wang@windriver.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 504A954F3CC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61709-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Sakari and Hans

On Mon, Mar 30, 2026 at 3:45=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Convert the ov5645 driver to use the V4L2 CCI register access helpers
> and regmap infrastructure instead of the custom I2C register access
> implementation.
>
> Keep ov5645_set_register_array() as ov5645_global_init_setting requires
> a delay between specific register writes, which cannot be expressed
> through the generic CCI multi-write helper.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Xiaolei Wang <Xiaolei.Wang@windriver.com>
> ---
> Note, this patch was originally part of series [0] since patch 1/2
> is no longer needed after patch [1] just sending this single patch.
>
> [0] https://lore.kernel.org/all/20260328132902.776757-1-prabhakar.mahadev=
-lad.rj@bp.renesas.com/
> [1] https://lore.kernel.org/all/20260329195625.2840728-1-sakari.ailus@lin=
ux.intel.com/
>
> v2->v3:
> - Made use of CCI_REG16 for the chip ID register
> - Replaced CHIP_ID_HIGH and CHIP_ID_LOW with a single
>   CHIP_ID register definition
> - Added RB tag from Xiaolei Wang
>
> v1->v2
> - Fixed selecting V4L2_CCI_I2C config option for the OV5645 driver.
> - Fixed checkpatch warnings limiting to 80 characters per line.
> ---
>  drivers/media/i2c/Kconfig  |   1 +
>  drivers/media/i2c/ov5645.c | 919 ++++++++++++++++++-------------------
>  2 files changed, 439 insertions(+), 481 deletions(-)
>
Gentle ping.

Cheers,
Prabhakar

