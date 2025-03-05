Return-Path: <linux-media+bounces-27549-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D69A4F70E
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 07:23:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 338D616530B
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 06:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B221E0DB3;
	Wed,  5 Mar 2025 06:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="W0PBd+yi"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F8D1C84BA
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 06:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741155770; cv=none; b=bDwVrNUl3DYxbMsRWY/2kEZ7dKFPy9AonoGvN3DIyol3Y9s/KNbdwsM4l0WLmbLJPP7py3pp2F/B7vHTCtKp+OLLvCBMfbRFpAxN4L/48ceoSAK0JilY+NfS6s+XgKJGev/MoFQfG2kyPjk1I10HmyLDyJ3h6H98/ctKXJ5xkEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741155770; c=relaxed/simple;
	bh=Hp/3hLQszbQpC4Dkavwf3pq6VtFVA0LTPkBh/vhoZIw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:References; b=R9N8ZiJl/k6Bc+3on4PlkNrFZxF/me8FgAY7nAuYavYJwN9zvZfVLaRnizILUnXjo35QdhGaySvl5Pk1h8sI2RCJ+JxJhkoLA5i0UzXMMfl0+ieVYIA/C2bRKLO87s/r9FFrYBpuV/sVTf5MxRU0BCxwre8ErByLc7d7Zv+yY9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=W0PBd+yi; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250305062246epoutp0329d7c4822dbb8e8f5db4b15db95de65f~p0-HFkvBw0121401214epoutp03l
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 06:22:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250305062246epoutp0329d7c4822dbb8e8f5db4b15db95de65f~p0-HFkvBw0121401214epoutp03l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1741155766;
	bh=skXfz601zwxGnlS1FM693PJw5hGibXY8CTNZiA2Lo4I=;
	h=From:To:Cc:Subject:Date:References:From;
	b=W0PBd+yi6The5YrQkeDh0UCvBO0stflph3otVBGx4s98U0wiT6Eq62pXemkHABil9
	 Hb1KguJQCCUOj6jnLSzdWl+MLDNx+RE+vqKQZH0FGqLU/7ODqc9etxf3wqJ5dngZVM
	 aYHy9pQIACdPhhFZ5S9ijR7fRf5Q8dN4iKd7vSds=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20250305062245epcas5p23067eadd0e690fbee68023f2774468ac~p0-GUv7ny1813318133epcas5p2X;
	Wed,  5 Mar 2025 06:22:45 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.181]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4Z72Xg2Z94z4x9Q0; Wed,  5 Mar
	2025 06:22:43 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	32.02.19933.3BDE7C76; Wed,  5 Mar 2025 15:22:43 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250305060259epcas5p20c02f4c4b4ff84b0f790b4ea446056e6~p0t1X1d2e1988819888epcas5p2W;
	Wed,  5 Mar 2025 06:02:59 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250305060259epsmtrp11bd6866051780894bf24883dc4b2621b~p0t1W9LDS0144901449epsmtrp1K;
	Wed,  5 Mar 2025 06:02:59 +0000 (GMT)
X-AuditID: b6c32a4a-b87c770000004ddd-7f-67c7edb3dabb
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	5E.5E.33707.219E7C76; Wed,  5 Mar 2025 15:02:58 +0900 (KST)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250305060256epsmtip2ebb003603dcf4055c8070785ac5dc092~p0tzO5xUE2406324063epsmtip2J;
	Wed,  5 Mar 2025 06:02:56 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: pankaj.dubey@samsung.com, rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com, martink@posteo.de, kernel@puri.sm,
	mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, gost.dev@samsung.com, Inbaraj E
	<inbaraj.e@samsung.com>
Subject: [PATCH] media: imx-mipi-csis: Fix v4l2 mbus frame descriptor type
Date: Wed,  5 Mar 2025 11:26:55 +0530
Message-Id: <20250305055655.6622-1-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCJsWRmVeSWpSXmKPExsWy7bCmhu7mt8fTDZ5/5rV4eNXf4uaBnUwW
	M++1slnc/TOJzWLV1J0sFvPbZrBYdE5cwm6x6fE1VovLu+awWfRs2MpqcW3FRFaLZZv+MFks
	2vqF3aJxwXsWi7/bN7FYvNgi7iDgsXPWXXaP2R0zWT02repk89i8pN7jxeaZjB79fw08fh0W
	9Xi04xajR9+WVYwenzfJBXBFZdtkpCampBYppOYl56dk5qXbKnkHxzvHm5oZGOoaWlqYKynk
	Jeam2iq5+AToumXmAP2hpFCWmFMKFApILC5W0rezKcovLUlVyMgvLrFVSi1IySkwKdArTswt
	Ls1L18tLLbEyNDAwMgUqTMjOWL/3AlvBRI6KLZt+sjUwNrF3MXJySAiYSPTPWsHYxcjFISSw
	m1Hi/JWXzBDOJ0aJv382M8I511YeZ4RpWf/oCTOILSSwk1HiyW89iKIvjBLPV31iAkmwCahL
	bOj+ztbFyMEhIlAl0btSBaSGWWAhk8TrawfYQGqEBbwk+g72gt3BIqAqsXTuUbBeXgFLib4l
	S1kglslLrN5wAOwkCYFODom767awQSRcJD7feM0KYQtLvDq+BeohKYmX/W1Qto/E/jm/oK7O
	kDi2fTlUvb3EgStzWECOYxbQlFi/Sx8iLCsx9dQ6sBuYBfgken8/YYKI80rsmAdjK0vMPHIf
	6gRJiZ2Xd0Ld6SFxf/cGJkigxEqs+/eZeQKj7CyEDQsYGVcxSqYWFOempxabFhjlpZbDIyo5
	P3cTIzh5anntYHz44IPeIUYmDsZDjBIczEoivK9PHU8X4k1JrKxKLcqPLyrNSS0+xGgKDLOJ
	zFKiyfnA9J1XEm9oYmlgYmZmZmJpbGaoJM7bvLMlXUggPbEkNTs1tSC1CKaPiYNTqoFp/yeX
	fW/95x6umugfIr46pDaQgSfQc7mK8bKmrgkWfKcDUhmPbDYykCq/bf35yOpkux/3rzbuP2y4
	4mlMzbxfWveTbBhzt9W9Xlky/+7VJWwVbtxPuAv8LO0cFgeeaGc5Z/ei4diF2jkmDD+S5s0p
	qji1j+eO1epDhW2MCZOVV+mZrDDLMFt/Oy/T/ZwYd7C0Wo9FkralP7cu5+6Nzrf3i+gmzin1
	frfk4zOe5Que71S7z3YjykP7vUBP1KQ7+fuzVx0y2+pw4EqFU2ueVFHYpufPV7Y9LvCu7ZBt
	qnOPlvpX9LzSNZNpLkv+L59ZK718+F8YxwYdt5v3b61E+slpU/w7+45f/jnvcPY9sU9KLMUZ
	iYZazEXFiQCh3jAxJwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLLMWRmVeSWpSXmKPExsWy7bCSvK7Qy+PpBhd+W1o8vOpvcfPATiaL
	mfda2Szu/pnEZrFq6k4Wi/ltM1gsOicuYbfY9Pgaq8XlXXPYLHo2bGW1uLZiIqvFsk1/mCwW
	bf3CbtG44D2Lxd/tm1gsXmwRdxDw2DnrLrvH7I6ZrB6bVnWyeWxeUu/xYvNMRo/+vwYevw6L
	ejzacYvRo2/LKkaPz5vkAriiuGxSUnMyy1KL9O0SuDLW773AVjCRo2LLpp9sDYxN7F2MnBwS
	AiYS6x89Ye5i5OIQEtjOKNG5eAcTREJSYvbv6VBFwhIr/z1nhyj6xChxafV9RpAEm4C6xIbu
	72wgtohAncT8B3NZQIqYBdYzSXx9DzKWk0NYwEui72Av2CQWAVWJpXOPgm3gFbCU6FuylAVi
	g7zE6g0HmCcw8ixgZFjFKJpaUJybnptcYKhXnJhbXJqXrpecn7uJERzCWkE7GJet/6t3iJGJ
	g/EQowQHs5II7+tTx9OFeFMSK6tSi/Lji0pzUosPMUpzsCiJ8yrndKYICaQnlqRmp6YWpBbB
	ZJk4OKUamOb9rnWOEN4a8zeXsW5n+o31ilpGq33b7367nKhgk9O6iP/zvZueN/Z/rGv7eHJd
	fUxGlBdvT1HH1qbXhfca779alqk96dVJ19p/G6Otn+e0t8pMdRZb5Lv6Wlc8p9JvnuVhn4w/
	sc9WXPXk+a2++Q6G++YdqXa49sZCv9yV1z+s+LF6d/5CrdVqvE+MUy9EypzROOL670hSAGva
	3dw9BT1P/wjrzNo1N1EgPzs1e8u8Yt9tTN0n9XULC9PO5OdM26HQP8XxcNHr7Q9uWc9xZlar
	rLnwZX7cwm+VrN2sghNjNmZwGS21OrdBN+dsZyfX5/05a1Yoz816pe+j4Fd1920Vb3pj8fVT
	dXrxf/NalViKMxINtZiLihMBPJ9jr9ACAAA=
X-CMS-MailID: 20250305060259epcas5p20c02f4c4b4ff84b0f790b4ea446056e6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250305060259epcas5p20c02f4c4b4ff84b0f790b4ea446056e6
References: <CGME20250305060259epcas5p20c02f4c4b4ff84b0f790b4ea446056e6@epcas5p2.samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

For MIPI CSI2 v4l2 mbus frame descriptor type should be set to
V4L2_MBUS_FRAME_DESC_TYPE_CSI2. Now frame descriptor type is set to
V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL. So changing the frame descriptor
type to V4L2_MBUS_FRAME_DESC_TYPE_CSI2.

Fixes: d200de90de2a0 ("media: imx: imx-mipi-csis: Implement the .get_frame_desc() operation")
Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 29523bb84d95..bb6550bed230 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1137,7 +1137,7 @@ static int mipi_csis_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 	if (!csis_fmt)
 		return -EPIPE;
 
-	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
 	fd->num_entries = 1;
 
 	entry->flags = 0;
-- 
2.17.1


