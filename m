Return-Path: <linux-media+bounces-33112-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F34AC0AF9
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 14:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 364DA1BA6F8A
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 12:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D0B28A1DC;
	Thu, 22 May 2025 12:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="rGramiku";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aszY0/Ka"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FE823371B;
	Thu, 22 May 2025 12:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747915239; cv=none; b=gMq+Q0VjA2zWmYad+kMAnYg9MTbH7vp+gC1FaG4stADfNwX1I48xOeKemO/KTt1igaUFH1AJ4CZSqoUW9Dhc22A5lJVl+Qa2YKvUUB4x19UdD1fxFneeDElEJ/DeqvxfdFSK5rPgPW37nuVeay68yFQVkBrrtJRnfwJm0UfxCQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747915239; c=relaxed/simple;
	bh=TZJBtckr+0YhiYU4JYBefTLIvZ1GesF7M+rIRbesUv8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Df0S88K3fm1X5DuRhboaPar+P2uYYzdFx09pDX6GoR5FIOSyAdEbhA61jUoAzkUw3Sg6UTrwXghBU5QuJyycdVqw36/ek2WCTsLelNYF2MO8Ee4McxY7VTwL9IO1lDnrKktl8iy9sQyzR5eK+L4czjHOvz4ioPdI13xf93GeiQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=rGramiku; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aszY0/Ka; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 36BEC1380F1F;
	Thu, 22 May 2025 08:00:36 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Thu, 22 May 2025 08:00:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1747915236;
	 x=1748001636; bh=R2+3bXIxZtLULTw/4QW5SXosCY7HWSreFWCjsRAqiqQ=; b=
	rGramikuRirMGNPVClxY5GMAE9dNzHy1QeHygqyEfCTO73UlEPdRb1GZxUGBOajJ
	1ccd6eFQ2vFQvU6fOt4xwgj0Qn2DtAVItrbYW1ZAjqvTH/+Hu9qjE8mBgi6455kV
	Q5BR/kUGfX3wqKJqIvr/8FCa/4nYUGbxPSuSDXMByoL47uBF1AUlKy+I9OanI59r
	A1047NWf+zqwkVrYSn7WQjplK7On8v4VilW5EksZ27PgKiJp/gCjcssFEVt9nzoS
	/3SzBHfWXxx/rdY8EpSn79vMWiG6gOkqSXg4/Fln3i5Xfn+7RheUzckkHXPjoEFT
	KPA80/bIeK2t4nFiwjfWbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747915236; x=
	1748001636; bh=R2+3bXIxZtLULTw/4QW5SXosCY7HWSreFWCjsRAqiqQ=; b=a
	szY0/KaQsutSJRjnfRzSFy0lHKhm/GzvDdNCvSZXql3nxPzGe0iipmQgcTKslkTf
	DvQ1Z8kUizgtkVWwF4J82ckHqxFlmUZsQRc9w2AprpUar7sOrNPZ1gwnlqtCLDyL
	PVE9Ut/UYAgl6GPEtHX3RdWfOfAlWtmBIk4s1nB5DMWqe0zfl4Dzzk3wytcLxVnv
	j8SHAYAqmg1cpHmihqNLN3lwzriCckAHwMMAETRqCVB3gfIuEUxnxjFulSNxNxCK
	TlpjIT/iVErGDBds8KcbDwkYetyLWqBTfQYA1wK/cOT9sjjVnCjdCex4HRk1b+gp
	cMTZ9tkRZgakRQ2QtaJ0A==
X-ME-Sender: <xms:4hEvaLVjIdjF8BSjiHszfeyLjcQXXg4Wal-S_mlwuYgGXMTjdPxKLA>
    <xme:4hEvaDkuni4_LQ1lDcWpz3rtXLNCJg_DZM7Eo7eOk6M2wJy0TXuD1CLc0p-M6B6zR
    TZI6pfkAH4Ir_YosNE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdehleduucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgj
    fhfutgfgsehtqhertdertdejnecuhfhrohhmpedfofgrrhhkucfrvggrrhhsohhnfdcuoe
    hmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrqeenucggtffrrghtthgv
    rhhnpefhveekjeeuueekfefhleeljeehuedugfetffdvteekffejudelffdvjeekfeehvd
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgv
    rghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopeduke
    dpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgrrhhiohdrlhhimhhonhgtihgv
    lhhlohesrghmugdrtghomhdprhgtphhtthhopehrihgsrghluggrsegthhhrohhmihhumh
    drohhrghdprhgtphhtthhopehhlhhjuhhnghhgrhestghishgtohdrtghomhdprhgtphht
    thhopehsvggsrghsthhirghnrdhfrhhitghkvgestgholhhlrggsohhrrgdrtghomhdprh
    gtphhtthhopehhrghnnhgvlhhothhtrgesghhmrghilhdrtghomhdprhgtphhtthhopeif
    pggrrhhmihhnsehgmhigrdguvgdprhgtphhtthhopehjohhnrghthhgrnhdrtggrmhgvrh
    honheshhhurgifvghirdgtohhmpdhrtghpthhtohepuggrvhgvrdhjihgrnhhgsehinhht
    vghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:4hEvaHY8zfhnfEFBLb0x36Mm6hSeEP6nvp17mn71Jx-rzvnbOwh_Fg>
    <xmx:4hEvaGUuYKnHLqA_zOELro7QZ1Thvp6IuzVz_24fC3HdsD8Gh6R9bQ>
    <xmx:4hEvaFlDAh_GHTF1gdqbFP7lKTamJd8zJY_5q-B4dfd84uQuDClrPA>
    <xmx:4hEvaDc_awGxOys5fvnEE7mP4ER2GQqzvbEjfw1D5ya8GcreouxIiA>
    <xmx:5BEvaGuU4u8mIdopa_Tq35LohciGgxpd01S0DKXRhxhgytx4qzFASm8Y>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 89D1D2CE005D; Thu, 22 May 2025 08:00:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tf116baca9747cd23
Date: Thu, 22 May 2025 08:00:03 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: =?UTF-8?Q?Hanne-Lotta_M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>,
 mchehab@kernel.org, ribalda@chromium.org, hverkuil@xs4all.nl,
 sebastian.fricke@collabora.com, hljunggr@cisco.com, dave.jiang@intel.com,
 jgg@ziepe.ca, saeedm@nvidia.com, Jonathan.Cameron@huawei.com,
 "Jonathan Corbet" <corbet@lwn.net>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Limonciello, Mario" <mario.limonciello@amd.com>,
 "Armin Wolf" <W_Armin@gmx.de>, skhan@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
Message-Id: <6554dc5c-55dc-4051-b835-187d9f43cb08@app.fastmail.com>
In-Reply-To: <20250522115255.137450-4-hannelotta@gmail.com>
References: <20250522115255.137450-1-hannelotta@gmail.com>
 <20250522115255.137450-4-hannelotta@gmail.com>
Subject: Re: [PATCH v2 4/4] docs: Fix typos, improve grammar in Userspace API
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025, at 7:52 AM, Hanne-Lotta M=C3=A4enp=C3=A4=C3=A4 wro=
te:
> Fix a typo and improve wording and punctuation in
> the documentation for Userspace API.
>
> Signed-off-by: Hanne-Lotta M=C3=A4enp=C3=A4=C3=A4 <hannelotta@gmail.co=
m>
> ---
>
> Notes:
>     v1 -> v2: No changes
>
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
Looks good to me.
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

