Return-Path: <linux-media+bounces-45862-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C5BC165D1
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 19:02:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53F8518952F9
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 18:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00A1A340DA3;
	Tue, 28 Oct 2025 17:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DWsbCydV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3260534D4D4;
	Tue, 28 Oct 2025 17:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761674391; cv=none; b=p1c38hKyTQslZEVWamj6syTGqAjrQd932xvwGDfn0RBowUHTDgK4n0I+s4sYBNT/0uT0aHyfRQcm4wEcu9F2KArfEM3Nl7z5N3/eb57yX50FrUmwRSF0soz5P3CvzL2mQr/7FIjqu32GnDsfMr/80LEr5HWBk6nnFWJP94LvZZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761674391; c=relaxed/simple;
	bh=5NrAtnDMjFJ5Ghvd4YzRYA7Yl9j9ybNfKvOu24MzvDY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=tuj/aeAStamERORJsp+VCdf5k188O0WGBE8AKdFi8Cxr6JSZMeSZ0dlz9auYgJydMo4JQjQzW21IBF5c42rVf4v4Gf+dYwXhulv906e597aLn70gfov1MONhXzbQzyx1T2uo+5jj5eD4AIl7wYLxd++/zNHaimdas77OvvFvzHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DWsbCydV; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 68D811A1713;
	Tue, 28 Oct 2025 17:59:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 317B860692;
	Tue, 28 Oct 2025 17:59:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5BF2A102F12E3;
	Tue, 28 Oct 2025 18:59:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761674385; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5NrAtnDMjFJ5Ghvd4YzRYA7Yl9j9ybNfKvOu24MzvDY=;
	b=DWsbCydV//xvHJDzeBuKG+WnZG/edBwN8WM2T9lhTpTinwkZ0dIA2UZjyoX14KfXZp5A+L
	6yMwepOhql+aaE6JDeDrZ0EkwWn+ZxHeml10mbFfmmD13E+s8mjiqKcU0M97nBX73UzWLN
	BChe1d7SvfH6cinPba30dyagwWao6+OzFRhWx8huv/FYdeRLnV7o86wnuvqYDKG0YYWn+4
	QGMv7SyPDnzCpT0vivKdNDoa7R7uZ/QonZ1SmGW0IbNzV67hjVN/wI/KjhEd7tWvm7OIpW
	hFqkFFciyjrLYjfMEBIhI9DaTrqZqLbBT4CR+3wepCvI3BKcXwIXPJWwlyH2Yw==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Oct 2025 18:59:36 +0100
Message-Id: <DDU5G3UHOYM7.2WNR6PPEK6ST1@bootlin.com>
Cc: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-staging@lists.linux.dev>
Subject: Re: [PATCH v5 00/23] tegra-video: add CSI support for Tegra20 and
 Tegra30
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: "Svyatoslav Ryhel" <clamor95@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Thierry Reding" <thierry.reding@gmail.com>,
 "Jonathan Hunter" <jonathanh@nvidia.com>, "Sowjanya Komatineni"
 <skomatineni@nvidia.com>, "Prashant Gaikwad" <pgaikwad@nvidia.com>,
 "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Mikko Perttunen" <mperttunen@nvidia.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, =?utf-8?q?Jonas_Schw=C3=B6bel?=
 <jonasschwoebel@yahoo.de>, "Dmitry Osipenko" <digetx@gmail.com>, "Charan
 Pedumuru" <charan.pedumuru@gmail.com>, "Diogo Ivo"
 <diogo.ivo@tecnico.ulisboa.pt>, "Aaron Kling" <webgeek1234@gmail.com>,
 "Arnd Bergmann" <arnd@arndb.de>
X-Mailer: aerc 0.20.1
References: <20251022142051.70400-1-clamor95@gmail.com>
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Svyatoslav,

On Wed Oct 22, 2025 at 4:20 PM CEST, Svyatoslav Ryhel wrote:
> Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC along
> with a set of changes required for that.

Whole v5 series (including patches 21-23):
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel ca=
mera

As you seem to have issues with sending a long series over e-mail, I may
suggest looking at b4 [0] for the future. It automates many boring and
repetitive tasks in handling a patch series, and also offers a way to send
e-mails when an SMTP server is problematic e.g. due to limitations in
e-mails per hour.

[0] https://b4.docs.kernel.org

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

