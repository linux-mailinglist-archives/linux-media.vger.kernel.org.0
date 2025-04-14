Return-Path: <linux-media+bounces-30124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8ADCA87BA2
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 11:15:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54D87188E5A2
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 09:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D2B25E822;
	Mon, 14 Apr 2025 09:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="SThNxVR1"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275BB25DD14;
	Mon, 14 Apr 2025 09:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744622108; cv=none; b=tjPgLc1pMDGE7HKmpJKg+kKGe2rBuYr30VN4ItkQn1Xp4QOIH5vLRlCJnA/CzeFTDvSLaomDOP3qxGtawdTRm9RgT4zVcxk1bPKmsi5lnjtRarPWhHR9anU+n9A4hhWr9I3A6vd/asbdkeqq6GL91017mEOsVnYiWVStB5rr8rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744622108; c=relaxed/simple;
	bh=tbf2Ml+im2U5RuM0vedTThyItIN7sEEhL5l/QHjL5o0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s3AhVmW73173nGvi++ggsdoasCgme0sXiwB4/iYebvGP8J+EYD1IhWgWJcXqSvOGuMdUoVTF0aNx1CTzzk7SiEM0kvEa26rc90JwC/HFwH8bjZXlOE8WKEgr4N//V7MFlnT++xif+pObAgAmhuhHY5SSjU7WuCmyyQqmiUBfNc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=SThNxVR1; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ZbhHk3fWvz9sDW;
	Mon, 14 Apr 2025 11:06:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1744621618; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tbf2Ml+im2U5RuM0vedTThyItIN7sEEhL5l/QHjL5o0=;
	b=SThNxVR1vzQL7BET5P1K6nuJsueazkEi+KLxlj6xQUXphxIbKznNn2FLOscQWCk+FuI4HF
	H0FUT7xq4or84vM2711OLYFfJvlmphetgICzJuGn2FdPZc3+q4w7dsEZBP/wE18eU0ye73
	iZ6mThKow7JkzxMmh6cli2pmlNyFZ/AynGitljkjbo1U241VkrYX7HhvAqixtJG+BhxFdv
	qgcTkYvv+DtqsQH2L7ajUW04wcyP1s9TpwhIi4XRoak66dzx/pewJWDJrL4o51jlInyw7M
	wezMfzs4JEurV88SU4bueNomg31ufOehPf/AGMlhdwJHnEUtZg1kfVQi+yrxfg==
Message-ID: <edf236654c39fbd3afb6db20e3ef42501a8628b0.camel@mailbox.org>
Subject: Re: [PATCH 0/5] media: Replace deprecated PCI functions
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Philipp Stanner <phasta@kernel.org>, Yong Zhi <yong.zhi@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao
 <bingbu.cao@intel.com>, Dan Scally <djrscally@gmail.com>, Tianshu Qiu
 <tian.shu.qiu@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Akihiro Tsukada <tskd08@gmail.com>, Bluecherry Maintainers
 <maintainers@bluecherrydvr.com>, Andrey Utkin <andrey_utkin@fastmail.com>, 
 Ismael Luceno <ismael@iodev.co.uk>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 14 Apr 2025 11:06:54 +0200
In-Reply-To: <20250404135344.93241-2-phasta@kernel.org>
References: <20250404135344.93241-2-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: gmpbdfu87n44n7f5mo3d6tw1tu6ifmbr
X-MBO-RS-ID: 7b9016a84fb764f1ee5

On Fri, 2025-04-04 at 15:53 +0200, Philipp Stanner wrote:
> Replaces pcim_iomap_regions() and pcim_iomap_table(), which have been
> deprecated.
>=20
> The successor pcim_iomap_region() is already used in many places and
> shouldn't cause trouble.
>=20
> I test-built it, but have no hardware for testing.
>=20
> P.
>=20
> Philipp Stanner (5):
> =C2=A0 media: ipu3-cio2: Replace deprecated PCI functions
> =C2=A0 media: pt3: Replace deprecated PCI functions
> =C2=A0 media: intel/ipu6: Replace deprecated PCI functions
> =C2=A0 media: solo6x10: Replace deprecated PCI functions
> =C2=A0 media: tw5864: Replace deprecated PCI functions

Hello,

is there someone who's in charge of all of media: who could take this,
or would it be more feasible to aim for the subcomponents?

P.

>=20
> =C2=A0drivers/media/pci/intel/ipu3/ipu3-cio2.c=C2=A0=C2=A0 |=C2=A0 5 ++--=
-
> =C2=A0drivers/media/pci/intel/ipu6/ipu6.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 8 ++++----
> =C2=A0drivers/media/pci/pt3/pt3.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 17 +++++++++++------
> =C2=A0drivers/media/pci/solo6x10/solo6x10-core.c |=C2=A0 4 ++--
> =C2=A0drivers/media/pci/tw5864/tw5864-core.c=C2=A0=C2=A0=C2=A0=C2=A0 | 13=
 ++++++++-----
> =C2=A05 files changed, 27 insertions(+), 20 deletions(-)
>=20


