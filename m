Return-Path: <linux-media+bounces-36059-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22076AEAC35
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 03:08:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC3D34A3EB4
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 01:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03892199E94;
	Fri, 27 Jun 2025 01:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NPBrF11L"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC501991CA;
	Fri, 27 Jun 2025 01:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750986433; cv=none; b=C5QOhX9ufTLdbYFoAvATZcNe15ultMe7dcnPBWwmY/zy+zEK152XH1HiWxVE9+9iofvb2ucBRrLCkwb/pASBH5BiTwBHHpFgitXmYCPnTP1HPJBHrcZv/4gpBmeckbszC02dq1d0fRJtzMvT7fefhZKJqAZiQuEffHPGdxq3skU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750986433; c=relaxed/simple;
	bh=SQdp7YKEv7n75y2nsTB+qjQFaLoOz3nxRazSiLXyvo4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=acWlKSfW487avblRBEk6FNJsEOf8kQaYbJarO6xtrgR6zRp1iANbfA3GDnFWwUfMsF3QksIlrVc0bFtW2zfLLas2aqzZi3PKErXozTe11NbbNkKZdHrJ5akO7noOMqU7txe1vm9MQRZBsqt/7blAGNjyYK46a7BPmQtkS5ofJ50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NPBrF11L; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2601:602:8100:c320::cf66])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D87CF73B;
	Fri, 27 Jun 2025 03:06:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750986411;
	bh=SQdp7YKEv7n75y2nsTB+qjQFaLoOz3nxRazSiLXyvo4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NPBrF11LvyKCVyuQtjT88mFI5TGywd9ln9HeuSJevAEKRmD4a/yn8og+I4D5YZNN3
	 g3UkhQEXRiHt5i8EG8c3nerAn5wtdYrOJeryovrFiy/aF6FSR9u25TrQ1IW+ZBDgbw
	 n67wnFQE3Mjg6yN7HV02eQpx9bUVMTd7vuss7T+8=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 26 Jun 2025 18:06:09 -0700
Subject: [PATCH v3 4/6] media: cadence: csi2rx: Implement get_fwnode_pad op
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-probe_fixes-v3-4-83e735ae466e@ideasonboard.com>
References: <20250626-probe_fixes-v3-0-83e735ae466e@ideasonboard.com>
In-Reply-To: <20250626-probe_fixes-v3-0-83e735ae466e@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: Devarsh Thakkar <devarsht@ti.com>, 
 Rishikesh Donadkar <r-donadkar@ti.com>, Vaishnav Achath <vaishnav.a@ti.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=SQdp7YKEv7n75y2nsTB+qjQFaLoOz3nxRazSiLXyvo4=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBoXe6l/9ORJZOjvFHRBS5vLdMCCPYNcGRhyMHr8
 GEHKywQC3SJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaF3upQAKCRBD3pH5JJpx
 RXN7EACwnDJlcdj+YH1MdfyP/CMhQYjLkpSZx9RuU/D+EoMetirM030pRdL71jXvnwU21baJ/Dw
 pUwI37v/eJ4zkO4E8Fle48QDWIM3dMHYJHPbpMs5nNAFQ8KeZNFbJzENMWckbxMAzgCR9dI246V
 5CM6XM+4gqWbSNU/MeTnzY7buwbhoFk8bfcSXxEQJKZ+AzQ1ZpjItOtaKHFWklXUP14QMAH5WMg
 M+kLkVBBUnw6bK04hmHLgs1EAHIf3FSpM3Cz4n2Q7kaNssdEYEopMY3SDzY/PiqV6AG5SId2ZDZ
 l08nHHlJkKM8JKmfWrDPtsvLVPW2c25wTnyO3GCvd/oHUOn+GjUmfN+VoAzb36F8e43GsprmUTj
 8VO4/VXSDJKAputrDmgHz8HmrAC7VBk1X9RTvy49U2gbp8EJW2KYd5r/v5s6ILY0Y6ryDOccLwy
 WV1CxB0yLWcmkkZdoA1q39pGcu9u3bYfW7fJ398XcWi/Bo449w/l+edI7dGfw2jjQMfPUiT57HG
 8n6w8YEoo8Z8OYBrzrx62ZUZAWZ03SmHqHn4vBrwrwW9EgfLuCzNstpba2W3E7KMk3L0wiztIb7
 E+AqDTwxwknF3vNNrXso0iPRJ1479b29mJRujaBPkzomQKAD/5Xr7jRw3G4IAUAEWcITBHyW13m
 YlEZXu4FpqjB2bA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Use v4l2_subdev_get_fwnode_pad_1_to_1() as the get_fwnode_pad operation.
Cadence CSI2RX maps port numbers and pad indices 1:1.

Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
Tested-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com> (on SK-AM68)
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index cebcae196eeccc65548d2c8e14bcba4799415beb..608298c72462031515d9ad01c6b267bf7375a5bf 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -479,6 +479,7 @@ static const struct v4l2_subdev_internal_ops csi2rx_internal_ops = {
 
 static const struct media_entity_operations csi2rx_media_ops = {
 	.link_validate = v4l2_subdev_link_validate,
+	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
 };
 
 static int csi2rx_async_bound(struct v4l2_async_notifier *notifier,

-- 
2.49.0


