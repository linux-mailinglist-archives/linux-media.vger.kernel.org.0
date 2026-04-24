Return-Path: <linux-media+bounces-59533-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kA8ICG1262kQNAAAu9opvQ
	(envelope-from <linux-media+bounces-59533-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 15:55:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5398D45FDAA
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 15:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 191AA300847B
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 13:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D823D9DD2;
	Fri, 24 Apr 2026 13:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ef10MmLp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76E23DA5CA
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 13:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777038920; cv=pass; b=aDnBkir+4X/oOfDPAuRu+zmH67XCE3WxOOPDpc6dEAB3x4W5V1zmnYyw9f0rSzdjnV6XEg6SuX9T44VYuyDNdOWst3hV2PGPM2rNOPv5rBLIH4/mpN/Zhtgm9pjzegUEjjYZfSF8EnbiubCYD4Yn/k6ZT/jFVocaBB+lYN6eAmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777038920; c=relaxed/simple;
	bh=F2Sfgreqd140b+7/7jU7cKPSDXMhHuQeiyipDJjiIos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aN7uj5rnJfxWeT56POlFxKqiV+sIdYrD8KzKHPVlukTAJPdenhjW65/if2uxeCGnBbr+SPj8TiNgLcFzzqz3U4hmHgSjjvPZZjJAejS+CuaQ7EA8+KZh0yxnWo1/+OOHaDYppQokKlO9WT2zSsHGpYHdCaY7Bv616g4HeVVHZOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ef10MmLp; arc=pass smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-694885bf090so2978304eaf.0
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 06:55:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777038910; cv=none;
        d=google.com; s=arc-20240605;
        b=MOxxcckFda6xOlK6TWbJpoGWF3FJyFubVgLUomzUZxWX7pDWlDjRSn/vU7lfYvB/5r
         NpAat3yCaIYD893HPyeKMN5+9uwZPbqJqx1AHPMFlm2vMH6enpaX3PdFfQEb4XZRDHbj
         m48Hk7PVzSv99EPicLOPOjyrCs1xSpeNW2hQ5Cy26AYvAYLYlhJlWosnErdjsWiWF9M+
         ZStyDaFwkWp4qXSaGzcEV0irxYrNwiEBKgrT+GCSTccrB/IllE6Z35c5mcYwYRjLXW5f
         yQMLgc2wjWG6L9jxXJrik6rAPUqMVI3G7dvstvpdUr9M1J+Z7DTg5Mscx2iz/PTZDlbZ
         knLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yw39fPCT3qzGj5AIQ5F5EFjcjfDzFEDb1o1Zmyb9i38=;
        fh=cFfxAAaaHtcat0xwJ3GZosuKzP8gideBM8nOpIt+2Uc=;
        b=MsE1M2QYL0WrJ3PmbEn+e24OjsRfBm+UDKtL7WlJKj9+Sm/y8gmOxhSLM7BjVO5Yt1
         BW8BMUpBmay8V+9nsYCSAykdLYwXhm8rGmZhpO2gNXlHT2QJ5/58wG76XceqKF5wBabp
         gg+ppiwgX6msvtoCRaWalrg3vwCt/AW/G+tuFd2p1d1NZs5ySdSDxOLunOpWPWKM7xat
         cFCy2TWN3XLu8SwpgdKXYRyZRkJDe3+zxRBArqQ2xOE1M8HmUd6P35R3myMl9yWcY7mb
         mbiCnfDXZmmfmDL+fAuALaNTtKoAompQRYh7Cqvw7dW/N2PFLSR2FmhKSBDwnBwf+mIN
         6v6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777038910; x=1777643710; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yw39fPCT3qzGj5AIQ5F5EFjcjfDzFEDb1o1Zmyb9i38=;
        b=Ef10MmLp+EGPi4rTTlLDpptNSCJ87/KZKGmQfS2lgi5jyYNY/kRhS7FIny7CdypKtD
         ssd4oLY3QXjwUeDSahHwRhbpdc5mtg24IHVm9JeOuS3MFPIbOw4ya3RiRLbeFkWAahPW
         okhSXI5Qd20QLjztT9XaqRgcfS2+ozgE7vI+auzJtStRPGVsycPpr1NFP1R2o3hSeGm9
         QdezeLrO/ZEWKSPj1tCHRH3vYkPTIViz2NzRA4SNLcobejRASJixxG4OG9cyCvCJBNiS
         MJdfVlFVwoblGyZmnCODYaDsRcgJuF6wh5j76CApBk8u+0cT4cD8KVWBPT2Rros9T7Wi
         pPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777038910; x=1777643710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yw39fPCT3qzGj5AIQ5F5EFjcjfDzFEDb1o1Zmyb9i38=;
        b=XNOoO3T3iphPPqRelL2TFZ4A+/LBtTNsbQJFpBbZXl8CI2d3NGn5ErfKtgCtQxfMLq
         LL7zmzFbYv5ahR2PLivCMouvIuui76bs7M0NFaTdvU/mW9fnNWacDk8Q1oBs0CIV2O2+
         cvWO3TLWGN4utYGlzjlm5m2Riryy4+NfKAgU+FpJxEIUr0z0+t/cIfM/KuzHnu5dw8pM
         cyOVRpTM+vpFbDiCwow2GpzXh+usUbrppuXLy/tc2mr/bWB+C2eQg8BGOWS82bF88WQA
         VORc6+yF8JcqH+JU/Ps6Cgh9zca6Us4iifIbCQyR3kaI0pI2DzegSEwulURNwI9d7wAd
         IB7g==
X-Gm-Message-State: AOJu0Yw6tPuYSoz3PUHK2R+Bl3bsPQqtVS47kdG/cksAY9c9VkHdrfAX
	K/KI7LbtPw3A6Aqm7knCY8osJoVH84xS9N4mq1KNCpX+x6zmxlR3Aj2LHO2VjlaTT/teR/QSsm8
	BP8H/KJqSHOVH4HGr2N4sl/XlnpIno+zDAsxRstc=
X-Gm-Gg: AeBDievvLfrGkkoyq4frc+OxSlXrUx+M1gymSqjOEGDNsEUbJTUJiWdrku9HbqrZMGi
	siUhSCFRViwnZIR9IfGZKQIOz1qdfRiA/m2Xzj2cj5F/ugiPlSDN3n1S+N523neG5LpAx26dkO3
	FD5yFwAUMbTdfYhZZgVs0rbpIZ2rrL9nR9cojIPUTd96iBsLsFX78h4z0DgvOv+5PhfJy2PNtXV
	QqK0rgklCQU1bh9LkeZ37FeUtqLUCDgk0XKdxIO+5Sz07w9xvjUg5HpDDRPow2uOr3BtXomd7m4
	lE4zGx8Kqqcv16kuFmt0yAXeOS5N8JQRdcf2W/bFWTws1oLQT4aItwa6HE8w+9wg6IVGfWR8DO2
	F2P+BvtBv7QPYxQ==
X-Received: by 2002:a05:6820:4de7:b0:694:9a67:edf6 with SMTP id
 006d021491bc7-6949a67fadcmr9420043eaf.17.1777038910195; Fri, 24 Apr 2026
 06:55:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260217064050.18388-1-arash.golgol@gmail.com>
In-Reply-To: <20260217064050.18388-1-arash.golgol@gmail.com>
From: arash golgol <arash.golgol@gmail.com>
Date: Fri, 24 Apr 2026 17:25:23 +0330
X-Gm-Features: AQROBzCawSZU9BOdYpPlI1AqZnivVmdDHQlwin0eS1mu9a_t4eRrabSdWe-hL9g
Message-ID: <CAMxPZkgOGY+yaLUmFQ-mkF-qUJd6r0BKi7gf47_nALvrCR5JbA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] media: sun6i-csi: Convert to active state and
 improve MC support
To: linux-media@vger.kernel.org
Cc: yong.deng@magewell.com, paulk@sys-base.io, mchehab@kernel.org, 
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	laurent.pinchart@ideasonboard.com, linux-sunxi@lists.linux.dev, 
	sakari.ailus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 5398D45FDAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[magewell.com,sys-base.io,kernel.org,gmail.com,sholland.org,ideasonboard.com,lists.linux.dev,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-59533-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arashgolgol@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

Hi,

This is a gentle ping on the series.
Link to series:
https://patchwork.kernel.org/project/linux-media/list/?series=3D1054768

--=20
Regards,
Arash Golgol

On Tue, Feb 17, 2026 at 10:11=E2=80=AFAM Arash Golgol <arash.golgol@gmail.c=
om> wrote:
>
> Hi,
>
> This series modernizes the sun6i-csi driver by aligning the bridge and
> capture components with the V4L2 subdev active state API and improving
> media controller integration.
>
> The first patch migrates the bridge driver to the V4L2 subdev active
> state framework. The private mbus_format field and its associated lock
> are removed, with the framework-managed state becoming the single
> source of truth. As part of this change, the capture driver no longer
> accesses bridge-private data directly and instead resolves the active
> format through the subdev pad API. Since the hardware does not perform
> format conversion, identical formats are enforced on both pads.
>
> The second patch implements vidioc_enum_framesizes for the capture
> device, reporting a stepwise range of even frame sizes within the
> hardware limits.
>
> The final patch adds MC-centric format enumeration support by filtering
> pixel formats based on the provided mbus code and advertises
> V4L2_CAP_IO_MC to reflect the intended usage within a media graph.
>
> Hardware testing performed on LicheePi Zero Dock (Allwinner V3s):
>
>   - Parallel pipeline (csi1):
>     ov7670 -> sun6i-csi-bridge -> sun6i-csi-capture
>
>   - MIPI pipeline (csi0):
>     ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-csi-capture
>
>
> Arash Golgol (3):
>   media: sun6i-csi: bridge: Use V4L2 subdev active state
>   media: sun6i-csi: capture: Implement vidioc_enum_framesizes
>   media: sun6i-csi: capture: Support MC-centric format enumeration
>
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 154 ++++++++----------
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  87 ++++++++--
>  3 files changed, 142 insertions(+), 108 deletions(-)
>
> --
> 2.34.1
>

