Return-Path: <linux-media+bounces-40817-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1428B328B7
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 15:11:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 936B29E0FD2
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 13:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89A4D25D20D;
	Sat, 23 Aug 2025 13:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ZiMqRRr9"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE50E23D7EE
	for <linux-media@vger.kernel.org>; Sat, 23 Aug 2025 13:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755954696; cv=none; b=IV8UazEYG/gTLKyZMBe38MzDNUckfqVxkIzXOxroLjz9JOlvnAF5vx9RjFPI9S+ngT9bVSeiTK32wWd+c/r7371ztJSxcIGFY2RMllw8cyjSo7GZgZkQARQNTIofTSCmPvx5YdyCNY/tEzL1ZtwXyIZ1XLZUKXhsJOHiIik3jq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755954696; c=relaxed/simple;
	bh=I8mvS0BbwcPzpAldr30b0h17KTJ3yaJ7PjTV1jAPy9k=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=UMyqWUPhNiiUsSXYbIVRQXxTpJ+eZDbt1Uzok/MyXv58YmxuZYB3Gm6z4S8J2ix9YWmtUM56k4Sw5XvyeNPMqEaxDE70g9luGRekc4p6LOVfRenggF+5aVGQGKuLLigZ7bjW+YMtdCOE2PZFucdlm/ZfwXuZv8ONHCVuKgaW0FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ZiMqRRr9; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250823131131epoutp0400da799addf3eb4f90e417991dcf3d95~eZ30cnKWE2404824048epoutp045
	for <linux-media@vger.kernel.org>; Sat, 23 Aug 2025 13:11:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250823131131epoutp0400da799addf3eb4f90e417991dcf3d95~eZ30cnKWE2404824048epoutp045
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755954691;
	bh=WiQTdOzmRl4diLSEyaAVQbrK02Hybw4ffhxcVsTNGiM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=ZiMqRRr9uH/lN4Q0d1TmeATkDKmMvkmfWkes2vqRPPQPWuDbIsAjeH+h2NqYGgfeI
	 qoLXZBflMVx3FF0jlGENgEUoGMeA3g1JPmIZOnkN4xx+/NQ1UqCfYTAVIm6fbMR99B
	 dmH6gzHILcfJAwowyIjlUGDKraQBpeKCUmxmrGqY=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250823131130epcas5p43f11088842c7f9b7f44340b05f222777~eZ3zBWwHU3181231812epcas5p4i;
	Sat, 23 Aug 2025 13:11:30 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.94]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4c8HWP28gCz3hhT3; Sat, 23 Aug
	2025 13:11:29 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250823131128epcas5p3d9a44a02d9295f8c614cf2e14d7c5e50~eZ3xYVpFR0066200662epcas5p3g;
	Sat, 23 Aug 2025 13:11:28 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250823131124epsmtip2695fc1d2c6e33945577f3e502b3c925b~eZ3tq6noF1099010990epsmtip2h;
	Sat, 23 Aug 2025 13:11:24 +0000 (GMT)
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
In-Reply-To: <20250818092133.GA5862@pendragon.ideasonboard.com>
Subject: RE: [PATCH v2 05/12] media: imx-mipi-csis: Move clk to
 mipi_csis_info structure
Date: Sat, 23 Aug 2025 18:41:23 +0530
Message-ID: <00e501dc142f$6fa00a10$4ee01e30$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK5oFMD+tt4mLQU5V9KgVyIDaUIUQIYHCmyAlXzoNQBZbmW2rKGel0g
Content-Language: en-in
X-CMS-MailID: 20250823131128epcas5p3d9a44a02d9295f8c614cf2e14d7c5e50
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141025epcas5p2b226c4eaab5d60d0e95f684e2ef930f2
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141025epcas5p2b226c4eaab5d60d0e95f684e2ef930f2@epcas5p2.samsung.com>
	<20250814140943.22531-6-inbaraj.e@samsung.com>
	<20250818092133.GA5862@pendragon.ideasonboard.com>


Hi Laurent,

Thanks for the review.

>=20
> On Thu, Aug 14, 2025 at 07:39:36PM +0530, Inbaraj E wrote:
> > clock names in NXP SoC's is different from the FSD SoC. Inorder to
>=20
> s/clock/Clock/
> s/Inorder/In order/
>=20
I'll change in next patchset.

> Is the difference really a matter of SoCs, or is it because the FSD SoC u=
ses a
> different version of the IP ?
>=20

Yes, it is dependent on the version of the IP.  Thanks for pointing it out.=
 I'll update commit
description accordingly.

> I also suspect that the =22phy=22 clock was added by mistake, and isn't n=
eeded in
> NXP SoCs. Could you please check and confirm if the v3.3 and
> v3.6.3 versions of the IP have an input PHY clock ?

I don't have manuals for v3.3 and v3.6.3, So I cannot confirm  this.=20

>=20
> > extend this driver to use for FSD SoC. Move the clock names to
> > mipi_csis_info structure.
> >

Regards,
Inbaraj E


