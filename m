Return-Path: <linux-media+bounces-32726-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D63ABB2FA
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 03:49:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E033018952EC
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 01:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949721B043C;
	Mon, 19 May 2025 01:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="hv7IaCV9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Vr7d/1G8"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491C811185;
	Mon, 19 May 2025 01:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747619388; cv=none; b=c4/BxbSLo12cwjm6xUaGqr7eEzPLzjQV7ZQKeG0KI+FHwraDT4pUpJaTkwMttK9Q7ZrdWVlhCC7vsT5lJdbsigmAO5VGjHCW/r2GhhPfgWz8M2kBusdfkssKINCPXLZOvKSwOyPm8U7vgdGMm1ZswvW/R4O6JoPJQGBomHATZ3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747619388; c=relaxed/simple;
	bh=/U6TKh2oMVkO/7Qth2zCrD0HNDB8iMs7E20SuYJycwc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=iXRp5QAO2s/yWy2iE/ImTdsjGUnCeM7bv/QozRMdprkmwMKEmF0LBWFizwcCn/uzWujVYx1UZDBl4Hj/8gSKD7pVJAd/freyVltioJTZeQRBZqC82pvQw3hzARIqtSWxWW3Xec4IZ5mTKPkvxAMqjmDlSrREGfZ0vWL3lhKLuqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=hv7IaCV9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Vr7d/1G8; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9502125400A7;
	Sun, 18 May 2025 21:49:43 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Sun, 18 May 2025 21:49:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1747619383;
	 x=1747705783; bh=x31b95ul4uGCCE3g8B0frdXiCbArzUhwN/geGWE//n8=; b=
	hv7IaCV9uheXABFsVG1xvJmLtOos9fpWYsNPE/Rxu2LQrdpJFYjwBKH3G2sPOWPn
	c9gLvV8LRbMyFNewEKdef0zIPmyAh5BtHXg2ZA03sThwkUBa7AnkBV6r8jzyScMF
	jlLZ0zQguZX3v17LbAyGcvNIsHQVlxzlbGYSjegOFEqOdqRI3zT3Lw9/knHTG26o
	v8jdcDSdCEGb+kPYhrKFPmnLv1FdbOgcJAmyF8n4+sw8T0YrwsVBwEFQ71sl+TU2
	/0zmTFlO0zE2OL1MU/IGdthdjC25gk1UvBjv3y7bBefAMEl5rMo2kGAelr0WNzFp
	UyBvFoSPsyY2NyCSOZmIgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747619383; x=
	1747705783; bh=x31b95ul4uGCCE3g8B0frdXiCbArzUhwN/geGWE//n8=; b=V
	r7d/1G8Mb2Fz4Zyobi5H1BfUEWxMl0475AgHTEWRuDgprEPzeFtRwskDzmWCPuXi
	CVjQTXMOgV0/UeJHQkFPAIm/gnomsax2o3C17oz9G1q79mETO9K2FNvUWjVZ2lgd
	DlR3p5zFwsOU0fjCUfin9HsdiwijM6xfSxh8tPa3FWLDBln/z5L/ktaPrXmIxW69
	L9Ny2NoLvj7YWNPuNa3+uHfQtFkl2d2qctsbzThZgifT/bZ0nwOzy+e4WlK/ns7S
	3icjCRGsA6RUKFbqszQvw5jCmkB3hx4/bvgDgx+8/EtP8ekYd7I97VTe8XbrFaga
	9zvKY3Y4HGRe+CTvRXRWA==
X-ME-Sender: <xms:No4qaFwROeGqAR2INU1cTc7HVSl04B7PV4ujQoIOJYuXZqktMXO3Gg>
    <xme:No4qaFQoqzuxjNsKi65ZsR8xJnTJXIwZXM3vwXKMWoCeAvJuk04P-ctUeSfwdLEdV
    1hary345R2V1fMbGGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvddtudduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedfofgrrhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlh
    gvnhhovhhosehsqhhuvggssgdrtggrqeenucggtffrrghtthgvrhhnpefhveekjeeuueek
    fefhleeljeehuedugfetffdvteekffejudelffdvjeekfeehvdenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhho
    vhhosehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopeduiedpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepmhgrrhhiohdrlhhimhhonhgtihgvlhhlohesrghmugdrtgho
    mhdprhgtphhtthhopehrihgsrghluggrsegthhhrohhmihhumhdrohhrghdprhgtphhtth
    hopehhlhhjuhhnghhgrhestghishgtohdrtghomhdprhgtphhtthhopehhrghnnhgvlhho
    thhtrgesghhmrghilhdrtghomhdprhgtphhtthhopeifpggrrhhmihhnsehgmhigrdguvg
    dprhgtphhtthhopehjohhnrghthhgrnhdrtggrmhgvrhhonheshhhurgifvghirdgtohhm
    pdhrtghpthhtohepuggrvhgvrdhjihgrnhhgsehinhhtvghlrdgtohhmpdhrtghpthhtoh
    epmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhlphhordhjrghr
    vhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:No4qaPX76yrs1wR-5hJOreJZVYwk4ChWrV7Wer98ih10bNKOcGulhQ>
    <xmx:No4qaHjRl0umFrMO2hJNhGWSAB2uC50MHxLniswwBR_dTKZWj9Wigw>
    <xmx:No4qaHDEufzhg85HSnD4eUr2_mMPPV3Y3cGebRG-x5QWSESlEQ5xzw>
    <xmx:No4qaALguzlaefbioP9mo6dA9UQ0MW688Os1KQegoyI7KC3v_ANriQ>
    <xmx:N44qaBqj2yXWHWPk_xyXkNVkprQwtFoUPcgWJfMj8Tn7DUPYFxfONs-j>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 62AF82CE005C; Sun, 18 May 2025 21:49:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T65863607ee30c55f
Date: Sun, 18 May 2025 21:49:22 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: =?UTF-8?Q?Hanne-Lotta_M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>,
 mchehab@kernel.org, ribalda@chromium.org, hverkuil@xs4all.nl,
 hljunggr@cisco.com, dave.jiang@intel.com, jgg@ziepe.ca, saeedm@nvidia.com,
 Jonathan.Cameron@huawei.com, "Jonathan Corbet" <corbet@lwn.net>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Limonciello, Mario" <mario.limonciello@amd.com>,
 "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
Message-Id: <288253c0-c194-47e0-be54-f17dc1695a1a@app.fastmail.com>
In-Reply-To: <20250517132711.117618-4-hannelotta@gmail.com>
References: <20250517132711.117618-1-hannelotta@gmail.com>
 <20250517132711.117618-4-hannelotta@gmail.com>
Subject: Re: [PATCH 4/4] docs: Fix typos, improve grammar in Userspace API
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi

On Sat, May 17, 2025, at 9:27 AM, Hanne-Lotta M=C3=A4enp=C3=A4=C3=A4 wro=
te:
> Fix a typo and improve wording and punctuation in
> the documentation for Userspace API.
>
> Signed-off-by: Hanne-Lotta M=C3=A4enp=C3=A4=C3=A4 <hannelotta@gmail.co=
m>
> ---
>  Documentation/userspace-api/sysfs-platform_profile.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/userspace-api/sysfs-platform_profile.rst=20
> b/Documentation/userspace-api/sysfs-platform_profile.rst
> index 7f013356118a..6613e188242a 100644
> --- a/Documentation/userspace-api/sysfs-platform_profile.rst
> +++ b/Documentation/userspace-api/sysfs-platform_profile.rst
> @@ -18,9 +18,9 @@ API for selecting the platform profile of these=20
> automatic mechanisms.
>  Note that this API is only for selecting the platform profile, it is
>  NOT a goal of this API to allow monitoring the resulting performance
>  characteristics. Monitoring performance is best done with device/vend=
or
> -specific tools such as e.g. turbostat.
> +specific tools, e.g. turbostat.
>=20
> -Specifically when selecting a high performance profile the actual ach=
ieved
> +Specifically, when selecting a high performance profile the actual ac=
hieved
>  performance may be limited by various factors such as: the heat gener=
ated
>  by other components, room temperature, free air flow at the bottom of=
 a
>  laptop, etc. It is explicitly NOT a goal of this API to let userspace=
 know
> @@ -44,7 +44,7 @@ added. Drivers which wish to introduce new profile n=
ames must:
>  "Custom" profile support
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  The platform_profile class also supports profiles advertising a "cust=
om"
> -profile. This is intended to be set by drivers when the setttings in =
the
> +profile. This is intended to be set by drivers when the settings in t=
he
>  driver have been modified in a way that a standard profile doesn't re=
present
>  the current state.
>=20
> --=20
> 2.39.5

Looks good. Thanks.
Mark

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

