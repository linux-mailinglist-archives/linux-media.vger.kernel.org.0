Return-Path: <linux-media+bounces-62598-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICMyJrM+EGrzVAYAu9opvQ
	(envelope-from <linux-media+bounces-62598-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 13:32:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D061D5B309A
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 13:32:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D1D13026F3D
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 11:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7FA3DFC79;
	Fri, 22 May 2026 11:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ydw5hkY0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E6A2D0606
	for <linux-media@vger.kernel.org>; Fri, 22 May 2026 11:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779449315; cv=pass; b=VnEWeuSzLZEQ76Ce9VJa82Vq00kkGyst3MJw85oTxcL4izla0wQdYq51gj1E1cNl/nLGb4RhiP5L7cHtwGO1V8sGEGvfqhaL92+3YFF2sQUXpETE/YGLL49gvGdB0ZZvCH8Ck0mZBHuJQ+pJorEpfmH2pfGj9Ym7snvxtySXo3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779449315; c=relaxed/simple;
	bh=5j8vE3+rn+gH3FCAT2MjUQthiUdN953EbDZ0iABy9ks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rNPwyKfPXGROvxsR3GjN4SSJ65HQZ94hNQUaBlDtgEBOuzzx3SvqWI5wxGJvLp0QervLLDDlMiyCF9J0QemMux9Rpug07f0w50WrTjEdWnN2A/8moLeii+aXDFX5euafTgMiKZr3ECkZsTiq41LhFdzPnViYxHJzmOS9ccYEcZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ydw5hkY0; arc=pass smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-393c40246afso82953901fa.1
        for <linux-media@vger.kernel.org>; Fri, 22 May 2026 04:28:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779449311; cv=none;
        d=google.com; s=arc-20240605;
        b=L8DViTHKeROevxc7O0nen5LybTBE5+qviBhIWsBxfMgoFZCQxt/rP8JeU3f7udQGlA
         SYbDoDBys+hfJqoMZ4zNX6r5N3AKuTRd8/jV+wh7X8HsSSnmJaxYyunLhPgrWZ1XZWGi
         qHW1S7Mz84jWNPEGTju26NCDYlrYOmGmGOX7EpVz5nsju145l7oF9mHLaE96FZXwxqSO
         eci/lcIn7Tq1JOmv4drXsF6NR67gkzydL7KrO7hF150crvwz1bi7h9lcAKXrWV2RqVho
         T+RrY85bhnRVFvi4O4CLse8qIozBg30fVVCtojsVY0X/oVhI5MWth5XgytxJ/y76zMuP
         ocRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fa7dC+O8YGHKdhROB6LlQr8p2/+2vxZ+5YIvHDJ13XM=;
        fh=u0wZ++/79CIdoiG6wufBrzEZ2vsb7GSAtQG1T8F2vQ0=;
        b=Oh0tMZbYCkizzZAgz93Iy8boy8r4oe0Vmf/rKGEF/xvrkIdU5cRTGgj0BtmYas+bz4
         iy71QJPO0n+tg21LXhNThsWIr4ZyTKeWnnkszq6v1HFgBhcMMGy6uuLDgWNmj/8WLd1B
         +FJx9I3yka+WBtfW5+URTNdHnQEQH8+tBHFT6rrQlQnhvU/vVsuEPL/GwS4DMQXXeOPR
         Cmza9kh6O4brnuJSP0mJLxPX74Ai+vwZ0kIx1/tWFi1FJ9xWGL3xkFHhW2iTtRQ9ajem
         c8jxsd0YsnXLCtg2w5VhMdMtWCB7ptqHfVYXrGI3XNTezyJPfP+FAgdTPwS3pqpVxfZh
         yE1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779449311; x=1780054111; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fa7dC+O8YGHKdhROB6LlQr8p2/+2vxZ+5YIvHDJ13XM=;
        b=Ydw5hkY0BDeQGSgwdGviD0qHKDhwfMOQCKhTy35C4Qgaab9qlKeygh9tv0MEY1QTdo
         MLmJj2JtRtDNeZDfeaQCjcMCZg023ddHDgPfOKWjNk2BLI+TF5NaZduFjGFClQB5uy3l
         8mVyC2SGxqZOSjvcT26ZuPx0fJHeU85Fbeu4k9UrWcmiCJFjJ3XUUvk/CEXD1WrgA3v4
         GZEcrwKue1JfWiAFMg+cdlp0NOeAVZoPeTQm7M8GIKRIl+UL0AJa3Yt6w9tSeeAX8ctQ
         XIHBlYqk4N0wKbiCp11UpdfilxC0T/Mtw7351AgkOQoi00pO/17cwPV6wo6Mpatk+fO7
         05Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779449311; x=1780054111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fa7dC+O8YGHKdhROB6LlQr8p2/+2vxZ+5YIvHDJ13XM=;
        b=K52IK4h0aLX8GMQbG2HUeZSGEpppPqChShZbxsGCmHXkTI/s23uL0aNGK5Hw9MAdqz
         alCG/VhXkXov49MMJzgd77ONrwWe9Xt/AusjNP451bh5oZbCdgpPkThaVqzWPPA52zMr
         LkYhTW1eKgt0AUeOUICyNCa7TChuqjcFBl7HouC6RuWYp6YKw/eLLnFYyHho5Z5LyfJg
         ID0GSvDAEPUDFO8R6loRIQ9xdvBEIzYMUyzpxSqqkkIaF+I/Xy1cp/CxWLvcjOwxb2Fa
         /Uy3v6oXdGPdCj4B7NJc8LYZFjPi1CuXDkpUnpiZF+XBUX1tL132s2MwaqHfLsg2QVxN
         FUiQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Fla3oL895wPPiNxyNZySXkXJ8hDC1P+vaXns4ISSmDe/gajd/rX2ropztGENOih7Q8ql5MThE37jSug==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmj7bGmf+LrFki377vZsQPNpSuVlZAm74THhcjugh0cYAXWhw8
	TYDQvaUowzZQSVM9cUzjmAZhSu2X1NyNhxbSFRb6lvQceoiyAYvBt65LweGHf6JtTClHP9xW9ct
	ohVpARfcLSokMXFScS5guP9HdIlpL2Qg=
X-Gm-Gg: Acq92OG6fthBtZMGcglEVEG0lDTecSejNAkFvs8rt1Lo+YFNiOrLgBudayBnq+t7YuH
	L5F4B/l20wgTyoRL/alttIzY9Z+ZN4B+n6dZek4x2qaoU639T/CPhlDsbE22y1WJShC/J8IOEj7
	gDJOxkUqmJIFkIJy/CpeshwZ37jZ2lqXBBaAxyTRZhHTvXKYaSePu688+j2BrRZaZD3ASwJKiwm
	Lf43/nTkRxfsiKP/iFpZGUej2Ajh0UQFJSJyO9yFROkwpzb7qHiij6tVfnlAdr1+A0QeBDp3hDI
	5nIP6bh240wlKd+lplAuJRsifSS555KrJUal9Y5CPD8wrMQn9xpgenog1E+/CJ4/jk9i8ZL/
X-Received: by 2002:a2e:a9ab:0:b0:389:fa42:b266 with SMTP id
 38308e7fff4ca-395d891aebamr11019001fa.11.1779449310900; Fri, 22 May 2026
 04:28:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522101653.2565125-1-paulk@sys-base.io> <20260522101653.2565125-15-paulk@sys-base.io>
In-Reply-To: <20260522101653.2565125-15-paulk@sys-base.io>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 22 May 2026 08:28:18 -0300
X-Gm-Features: AVHnY4LV1-i2NLucbS2YgdzZXBX26-Ma3QP1bn3Gx38hCGfG5dS4UR0F3rTTEKQ
Message-ID: <CAOMZO5B+vaoXM1F+avtcdo=_tpJ4ZZfCcNCqaUo=KiQUw49caA@mail.gmail.com>
Subject: Re: [PATCH 14/14] arm64: dts: imx8mp: add VC8000E encoder node
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Marco Felsch <m.felsch@pengutronix.de>, Michael Tretter <m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62598-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[festevam@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[2.72.144.112:email,2.72.183.128:email,mail.gmail.com:mid,sys-base.io:email,pengutronix.de:email]
X-Rspamd-Queue-Id: D061D5B309A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Paul,

Thanks for working on this.

On Fri, May 22, 2026 at 7:49=E2=80=AFAM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> From: Marco Felsch <m.felsch@pengutronix.de>
>
> Add support for the Versilicon VC8000E multi-codec stateless encoder.

Typo: Verisilicon

> The IP integrated on the i.MX8MP supports H.264 and H.265 encoding.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

You need to add your Signed-off-by tag as well.

> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index a3de6604e29f..4e63c2b16c1a 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -2290,6 +2290,17 @@ vpu_g2: video-codec@38310000 {
>                         power-domains =3D <&vpumix_blk_ctrl IMX8MP_VPUBLK=
_PD_G2>;
>                 };
>
> +               vpu_vc8000e: video-codec@38320000 {
> +                       compatible =3D "nxp,imx8mp-vpu-vc8000e";

This compatible must be documented in a dt-bindings yaml file.

