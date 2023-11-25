Return-Path: <linux-media+bounces-1016-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A83A57F8C5D
	for <lists+linux-media@lfdr.de>; Sat, 25 Nov 2023 17:27:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 451DBB210FF
	for <lists+linux-media@lfdr.de>; Sat, 25 Nov 2023 16:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A1929438;
	Sat, 25 Nov 2023 16:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Ak23BEoP"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84D96FB
	for <linux-media@vger.kernel.org>; Sat, 25 Nov 2023 08:27:37 -0800 (PST)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20231125162734epoutp046ae0579e670997ee3b33811ae32f3d1a~a6oJFBCtF0387803878epoutp04R
	for <linux-media@vger.kernel.org>; Sat, 25 Nov 2023 16:27:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20231125162734epoutp046ae0579e670997ee3b33811ae32f3d1a~a6oJFBCtF0387803878epoutp04R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1700929654;
	bh=9/mt4hKtXbPt9JTfCxZXcTOLXHjVOEDr7yiZBBoORKs=;
	h=Subject:Reply-To:From:To:Date:References:From;
	b=Ak23BEoP1GsvpKzCq1Kkenss5BtsuBRhunBAGOqEL08TT6p2ttgKTFxmB+TLQwDSs
	 0ZJNg3nc5WkF2KV/uK9sWkD2MleIqRctKldWtTW2xUcE1NIm/wwVJd1UUMlfka9d07
	 sz5CxkU7uoo9hRtuD480x4TZnBrNI3Uf3I08RCTo=
Received: from epsmgec2p1.samsung.com (unknown [182.195.42.67]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20231125162733epcas2p3e850aa8e97c961549563a559647be03a~a6oIO89Fo2994929949epcas2p3z
	for <linux-media@vger.kernel.org>; Sat, 25 Nov 2023 16:27:33 +0000 (GMT)
X-AuditID: b6c32a43-4b3ff700000021c8-eb-656220751215
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	2E.28.08648.57022656; Sun, 26 Nov 2023 01:27:33 +0900 (KST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Subject: unsubscribe linux-media
Reply-To: sungchun.kang@samsung.com
Sender: =?UTF-8?B?6rCV7ISx7LKc?= <sungchun.kang@samsung.com>
From: =?UTF-8?B?6rCV7ISx7LKc?= <sungchun.kang@samsung.com>
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20231125162732epcms2p529beaf1da3d267cba40064275c470667@epcms2p5>
Date: Sat, 25 Nov 2023 17:27:32 +0100
X-CMS-MailID: 20231125162732epcms2p529beaf1da3d267cba40064275c470667
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRmVeSWpSXmKPExsWy7bCmmW6pQlKqwd5PshY9G7ayOjB6fN4k
	F8AYxWWTkpqTWZZapG+XwJXx+sURlgLdistNh1gbGDW6GDk5JARMJLYefMbcxcjFISSwg1Gi
	9eYvli5GDg5eAUGJvzuEQWqEBRQkJk19zwQSFhJQlrjzNQDEFBawkZjyLh+kgk3ASmL5pPfM
	ILaIgL3E8taVzBDTeSVmtD9lgbClJbYv38oIYYtK3Fz9lh3Gfn9sPlRcRKL13lmoXkGJBz93
	M8L0fri8lhXCzpa4vPACE4RdIXFszg2oGnOJncdmM0Mc7ysx72MIiMkioCrxaasdiCkh4CLR
	fywdpJhZQFti2cLXYMXMApoS63fpQ4T5JDoO/2WHuX3HvCdMEJ3qEr3rDSHCshIvrqyBWu8h
	MWXic7D1QgKBEssuLGGcwCg7CxF8s5DsmoWwawEj8ypGsdSC4tz01GSjAkO94sTc4tK8dL3k
	/NxNjOAY1XLewXhl/j+9Q4xMHIyHGCU4mJVEeHP/xKcK8aYkVlalFuXHF5XmpBYfYpTmYFES
	573XOjdFSCA9sSQ1OzW1ILUIJsvEwSnVwHTh1483/ldLbjbJib+6c+BL4Tm1Uo6OYPVn87t4
	jv3WY3ZnexFdv3WpbeJSm3uc98Xfix9r/6Jrum6NjbFp167CO0+3ezxiyv/AeqN6j63n7Xib
	F0FrFXxLjjFfU4qZGFO17uz37EO239XOirfOYDkWl3t6Z6nm1iUKKkYfJiSl3mn61TNTJGX5
	xyfTTeZMlZe5tciPra55t2Z8s5bFvq/H5JhYspa/PXjG/Hva9AlTjUQ/JyROmZWlMOmKz6l/
	b52P+LQrXTx2Y32QYfbJu0Uyr2ZzbOLRdOuMlIiN+Oy4W7N/Ondpy9+adKm6Hsua6cZ2rvFq
	62uS7odM/W/gIXxg6YnKA2dq164qyvJa3aXEUpyRaKjFXFScCAAIsJnjQAMAAA==
X-CMS-RootMailID: 20231125155712epcms2p6b4f5710f594fd1704f85424754f7c61d
References: <CGME20231125155712epcms2p6b4f5710f594fd1704f85424754f7c61d@epcms2p5>

unsubscribe linux-media
=C2=A0=0D=0A=0D=0A

