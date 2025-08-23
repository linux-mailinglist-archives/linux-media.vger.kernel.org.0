Return-Path: <linux-media+bounces-40818-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BE8B328BB
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 15:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF7577A8282
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 13:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E2725F98A;
	Sat, 23 Aug 2025 13:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="L+z4tQyo"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DED78F58
	for <linux-media@vger.kernel.org>; Sat, 23 Aug 2025 13:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755954913; cv=none; b=Zx9E4GtDwHFamj5kRNc40nF+yY5rI21ztdqakutzgJw3esVO6N1cxxVhclauweRJRcshx3m5/bNZj21nw097EtpL6q6FM2LON19WsoDSRhwfsjAWlDwfJUAN4gamaz6mpIbpQUBe5RwCzBMR77y32Mop7NSzciK59tgPJDMTLQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755954913; c=relaxed/simple;
	bh=bbAJUcd0Lj4kx5MXd/4AdzZ70uX0rPpDgcSWwiHkp7w=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=RjLbBp56ni6EyCs+7Aek37HDV8wAc3ipD2EvEpDjnocmdt35hzbwFeit+fmd7dyr//9D6pUhAI4TuPuwqSZlRZJASm18MKWTsPt8+6De7S3N47aii4SlXpRQmBHbkBiQJ3/S9XNl6JbbeKpiUIquLXZhPYU1sb4f5MoCT5+M4+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=L+z4tQyo; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250823131509epoutp04f2121497a70c893d5e4081833bfb04ec~eZ6-IkaW-2991929919epoutp04D
	for <linux-media@vger.kernel.org>; Sat, 23 Aug 2025 13:15:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250823131509epoutp04f2121497a70c893d5e4081833bfb04ec~eZ6-IkaW-2991929919epoutp04D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755954909;
	bh=bbAJUcd0Lj4kx5MXd/4AdzZ70uX0rPpDgcSWwiHkp7w=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=L+z4tQyogOIgpq7CHKr23bqBSKOZ/LhsoKG4HLfKi1UOiEAZ8F6k2bukM06XX46U8
	 Y7VAxZgSjG+7oErH0sK9PwYvL4K6qApSvt6gY6C8oCQz3f/Gad2BeTQ3NeRKN3rLEx
	 xrqf79XqscWMqrvuWOY6btZG2TGkr0HSA8zwuD4E=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250823131508epcas5p2aaf5d4d729045a14d3146dfccb43a917~eZ69_4JnV0380703807epcas5p2G;
	Sat, 23 Aug 2025 13:15:08 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.89]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4c8Hbb1kFtz6B9m5; Sat, 23 Aug
	2025 13:15:07 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250823131505epcas5p1dfafdab973b7e1a7dc609e20b9762f92~eZ67vrRKB1219212192epcas5p1j;
	Sat, 23 Aug 2025 13:15:05 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250823131501epsmtip19f76be1bbffaa71da10a7c36455d69f8~eZ64BzDho1729417294epsmtip1_;
	Sat, 23 Aug 2025 13:15:01 +0000 (GMT)
From: "Inbaraj E" <inbaraj.e@samsung.com>
To: "'Laurent Pinchart'" <laurent.pinchart@ideasonboard.com>
Cc: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <s.hauer@pengutronix.de>, <shawnguo@kernel.org>,
	<cw00.choi@samsung.com>, <rmfrfs@gmail.com>, <martink@posteo.de>,
	<mchehab@kernel.org>, <linux-fsd@tesla.com>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <pankaj.dubey@samsung.com>,
	<shradha.t@samsung.com>, <ravi.patel@samsung.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alim.akhtar@samsung.com>,
	<linux-samsung-soc@vger.kernel.org>, <kernel@puri.sm>,
	<kernel@pengutronix.de>, <festevam@gmail.com>,
	<linux-media@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
In-Reply-To: <20250818093030.GB5862@pendragon.ideasonboard.com>
Subject: RE: [PATCH v2 08/12] media: imx-mipi-csis: Add support to dump all
 vc regs
Date: Sat, 23 Aug 2025 18:45:00 +0530
Message-ID: <00e601dc142f$f125d880$d3718980$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK5oFMD+tt4mLQU5V9KgVyIDaUIUQE40n8LAcQUHd4CRD4O7rKLFTGw
Content-Language: en-in
X-CMS-MailID: 20250823131505epcas5p1dfafdab973b7e1a7dc609e20b9762f92
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141041epcas5p2b281659391a8e45c95e8db21d9867f98
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141041epcas5p2b281659391a8e45c95e8db21d9867f98@epcas5p2.samsung.com>
	<20250814140943.22531-9-inbaraj.e@samsung.com>
	<20250818093030.GB5862@pendragon.ideasonboard.com>

Hi Laurent,

Thanks for the review.

>=20
> Please see =5B1=5D and in particular =5B2=5D. I would like to get that se=
ries merged for
> v6.18, but it's missing reviews. If you want to speed it up, you can revi=
ew the
> patches :-)

I'll rebase my patches on top of your changes, test and provide review comm=
ent.

>=20
> =5B1=5D https://lore.kernel.org/linux-media/20250608235840.23871-1-
> laurent.pinchart=40ideasonboard.com
> =5B2=5D https://lore.kernel.org/linux-media/20250608235840.23871-9-
> laurent.pinchart=40ideasonboard.com/


Regards,
Inbaraj E


