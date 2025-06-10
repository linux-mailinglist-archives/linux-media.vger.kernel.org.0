Return-Path: <linux-media+bounces-34422-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D40AD3654
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 14:34:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 710F91648BF
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 12:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2AE12951BB;
	Tue, 10 Jun 2025 12:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="M8fLrVig"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1870293462
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 12:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558805; cv=none; b=cmAo+MBczbgrxewDpIhingsIC7XKQHow/Rpn8bxJN45K7eK6Z3IcbaQJ1pvK5gPygmsmrdvCNE9NeSD21HTrKIRxA13aVkq9eSi6n0rOO5ejpfyVDRMyvJ4GsySEWTvNDOI97uXiLuAh7A2G5ZSnOaRDkZ3VA+yeRCHaxioZZbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558805; c=relaxed/simple;
	bh=ayF3jNEPfY6C3pq4Jgz7NP8946jRWhOsDXy9Jlzx6wk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=UVVevz+Ogku+wc/35PG3+OnLjtP87hmhWJwbc/S2gGWCpEblCHUmEpYGcxMHyXf6UXE6KpGIBv6J1jIIxOELRkX4JKlWJJGgAOMClWCMEI6+/9rwAu1qeXbXIHpK09+7BIhdMXxdCP/HVaWv68duUliQ0iypC9Kyn04g1OrzqVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=M8fLrVig; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250610123320epoutp031d429dcd6a18604f3fa2880dc1f776da~HrnWvgb1o1624816248epoutp03M
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 12:33:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250610123320epoutp031d429dcd6a18604f3fa2880dc1f776da~HrnWvgb1o1624816248epoutp03M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749558800;
	bh=ayF3jNEPfY6C3pq4Jgz7NP8946jRWhOsDXy9Jlzx6wk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=M8fLrVigVnpru5bZuqeKXaSCDVi13UlCSL8hq65aRUt1sLILrCl2JR+rGPXZu7nNK
	 iEfAUwvDph4Vy57iFu3R446c33wz3MEGlx5biczX85RVgAEToKVRvx2p6f2ezvb9Uy
	 7pLca5fRZk9TSK3cVAmoYwqwOP6EkhHjo+l43lUo=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTPS id
	20250610123319epcas1p4a001dfde2b2c47c1113a09545f8475c7~HrnV4WN_R1828518285epcas1p4a;
	Tue, 10 Jun 2025 12:33:19 +0000 (GMT)
Received: from epcas1p3.samsung.com (unknown [182.195.36.227]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bGp9W3CSSz6B9m6; Tue, 10 Jun
	2025 12:33:19 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250610123318epcas1p2240d409d9c1147909117d9c30177e285~HrnUvAMgp1158611586epcas1p2v;
	Tue, 10 Jun 2025 12:33:18 +0000 (GMT)
Received: from yjjunylee03 (unknown [10.252.68.99]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250610123318epsmtip1c143d51ea4b3b3adeb48b8439e79d191~HrnUp_A5M3001530015epsmtip1A;
	Tue, 10 Jun 2025 12:33:18 +0000 (GMT)
From: <yjjuny.lee@samsung.com>
To: "'Ricardo Ribalda'" <ribalda@chromium.org>
Cc: <laurent.pinchart@ideasonboard.com>, <hdegoede@redhat.com>,
	<mchehab@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <yjjuny.lee@samsung.com>
In-Reply-To: <CANiDSCtQiiutnqGWwL1u=K4kFavhw0-z=m_Kztr2xRpDUZ+iLA@mail.gmail.com>
Subject: RE: [PATCH] usb: uvc: Fix 1-byte out-of-bounds read in
 uvc_parse_format()
Date: Tue, 10 Jun 2025 21:33:18 +0900
Message-ID: <000401dbda03$d86b7680$89426380$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKCyo7SiFF4zOkHo9myOxnMTfGFigInfKOAArpWgXKyh1vlkA==
Content-Language: ko
X-CMS-MailID: 20250610123318epcas1p2240d409d9c1147909117d9c30177e285
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
cpgsPolicy: CPGSC10-711,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250610113726epcas1p449116bfeef2a102c90e9519a632eb0b9
References: <CGME20250610113726epcas1p449116bfeef2a102c90e9519a632eb0b9@epcas1p4.samsung.com>
	<20250610113722.36820-1-yjjuny.lee@samsung.com>
	<CANiDSCtQiiutnqGWwL1u=K4kFavhw0-z=m_Kztr2xRpDUZ+iLA@mail.gmail.com>

Hi Ricardo Ribalda

> I think it makes more sense to add the length check where it is going to =
be used not on a caller function. If we every change=20
> uvc_parse_format to read byte =235 we will probably miss the check on
> uvc_parse_streaming()
I agree. Moving the length check into the function itself is a better appro=
ach.
I'll send v2 patch.




