Return-Path: <linux-media+bounces-41015-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64020B34058
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 15:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2766F206FAB
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 13:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E573E20102B;
	Mon, 25 Aug 2025 13:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="pNXzyJlm"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE551DE892
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 13:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756127158; cv=none; b=IEFOP0GiZrWAzHyylOdT8vPN4SvRWsq1VNnc+JYIzGl/zyKYQxVTIHxoGWPXnlMqdU/sGm+hulOLcYPGktAaqZBBGUCdECEGtOIWU5EQ4fDmove14QVqqxi4+YZqOsPQOQBFXqDQTrIPJydrfKnyjQugy+F8kjujaFdfetVvFNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756127158; c=relaxed/simple;
	bh=0995YYnJAnTIjeYpCGOJk4eW/chxUHWP1YLO7EuU3ls=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=cvoi2uWFZA1yl9fN1Vw+w/CRTe17scDfqD6FVE079bfNDUYBbTJvq8HNNNwO6+bA3Yeoq8oWcI8TgiPPLIwxXXu+9/Ggao68VZJqStfjx3DT093Nhy98PX9xhSQ3qRMpAiqbaZpi9nCc1rO7MMgiGK6sPyYa9lJbrru3ZfYsa1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=pNXzyJlm; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250825130554epoutp0440075e35f0b95b2ca8af3484ab9597d0~fBFfGqLR92600426004epoutp04k
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 13:05:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250825130554epoutp0440075e35f0b95b2ca8af3484ab9597d0~fBFfGqLR92600426004epoutp04k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756127154;
	bh=0995YYnJAnTIjeYpCGOJk4eW/chxUHWP1YLO7EuU3ls=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=pNXzyJlmiBU0DKc3lKjNxALMNiodJJDOgD3UbtdopGEJf6bzcmeQWgNNz1Lk9eXNO
	 Wt9rlxB7IBa4VIR0mrcc5qNUBCpf83wThWFZbDjlYBqWWTEodrNVPYaRzwpMoMO4Xp
	 fTbuVl9VgcepLUshqo7rV6iNe3urRYxtQB/WtgEc=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250825130553epcas5p10e031531d1ea200953db9b7c4a02085b~fBFeQTGPi0198901989epcas5p10;
	Mon, 25 Aug 2025 13:05:53 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.88]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4c9WJ06HqZz6B9m6; Mon, 25 Aug
	2025 13:05:52 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250825130552epcas5p2bae9faf360067377690b741b0b5ed53c~fBFc1uXMc2846128461epcas5p2b;
	Mon, 25 Aug 2025 13:05:52 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250825130548epsmtip1d0a172254122ea7684cf0024cd158ef4~fBFZDiPSG1232912329epsmtip1B;
	Mon, 25 Aug 2025 13:05:48 +0000 (GMT)
From: "Inbaraj E" <inbaraj.e@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <s.nawrocki@samsung.com>, <s.hauer@pengutronix.de>,
	<shawnguo@kernel.org>, <cw00.choi@samsung.com>, <rmfrfs@gmail.com>,
	<laurent.pinchart@ideasonboard.com>, <martink@posteo.de>,
	<mchehab@kernel.org>, <linux-fsd@tesla.com>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <pankaj.dubey@samsung.com>,
	<shradha.t@samsung.com>, <ravi.patel@samsung.com>
Cc: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alim.akhtar@samsung.com>,
	<linux-samsung-soc@vger.kernel.org>, <kernel@puri.sm>,
	<kernel@pengutronix.de>, <festevam@gmail.com>,
	<linux-media@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
In-Reply-To: <41434afa-fecd-4507-bcca-735d358ac925@kernel.org>
Subject: RE: [PATCH v2 04/12] arm64: dts: fsd: Add CSI nodes
Date: Mon, 25 Aug 2025 18:35:46 +0530
Message-ID: <016401dc15c0$fc0dcfe0$f4296fa0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK5oFMD+tt4mLQU5V9KgVyIDaUIUQE9OnCOAxwEstACXXiXxwGMECOMAYbqfFmyafJvQA==
Content-Language: en-in
X-CMS-MailID: 20250825130552epcas5p2bae9faf360067377690b741b0b5ed53c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141019epcas5p2f957b934d5b60d4649cf9c6abd6969d5
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141019epcas5p2f957b934d5b60d4649cf9c6abd6969d5@epcas5p2.samsung.com>
	<20250814140943.22531-5-inbaraj.e@samsung.com>
	<1919de68-99ea-47f7-b3d2-cae4611f9c52@kernel.org>
	<00d101dc136c$aa037020$fe0a5060$@samsung.com>
	<41434afa-fecd-4507-bcca-735d358ac925@kernel.org>

Hi Krzysztof,

> >
> > CSIS stands for Camera Serial Interface Slave.
>=20
> Googling for =22MIPI CSIS=22 gives me 0 results, so I still claim this is=
 not a generic
> name.

I checked other vendors (e.g: freescale), and they are using mipi-csi. I'll=
 adopt for the
same.

>=20
> >

Regards,
Inbaraj E


