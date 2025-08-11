Return-Path: <linux-media+bounces-39411-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AB3B201B1
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 10:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 442B3168E83
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 08:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 384B42DC348;
	Mon, 11 Aug 2025 08:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="axyVHtwM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4702DC349;
	Mon, 11 Aug 2025 08:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754900510; cv=none; b=WWODpjuYCVd/fqqFzeDug9b/ghLqyKhUYmJP1A2Nx5MGDDuv4KQPXM5GbC29VxCq6o7K/POmjS2Lpow3cC83EuD/m0xvZq1/fH74l5E1R4N/0BWTThdu+B14dGvtX9eV8QUmLWDUfWvEPBTAqlro37FLbOcDaPmWgcGr0hpNHi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754900510; c=relaxed/simple;
	bh=Vks+ayOIH/1sodpGYur+BQ8OULCen/e02TyguQxrnf8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l3IbCzmT9jjw6wdhw8e5HDqj21tQnPzK2lPpDvQGibHAG31OsvfWKvvrTt8n0VZnnkKOnKP2vthmGUMAW+58liS3aYOpp/LQ3sa5IYOKg2plhyB0Us6mFoeIvwjRbdITIoLx/nZQrs8VqoDF4At4W0rXnGwXhJnMHy4bMTEWWso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=axyVHtwM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.81.143])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB2E882A;
	Mon, 11 Aug 2025 10:20:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754900455;
	bh=Vks+ayOIH/1sodpGYur+BQ8OULCen/e02TyguQxrnf8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=axyVHtwMyzwkxsYzrINbhPKNLVV4on7OYoSNshDYObTn6CfkPTo0ld0k+zZW+8btt
	 IrwAdcSMZusUnhiG8plukKSLYK511rI8KVad4jVOoisHbcJBeYGFQdVSmB7h7jqW8U
	 DgwTI/Fr4pabZw+4MNOWY3dIsMaRt+osUL4W94G0=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 11 Aug 2025 13:50:16 +0530
Subject: [PATCH v4 4/6] media: cadence: csi2rx: Implement get_fwnode_pad op
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-probe_fixes-v4-4-aae22290f1d0@ideasonboard.com>
References: <20250811-probe_fixes-v4-0-aae22290f1d0@ideasonboard.com>
In-Reply-To: <20250811-probe_fixes-v4-0-aae22290f1d0@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Devarsh Thakkar <devarsht@ti.com>, 
 Rishikesh Donadkar <r-donadkar@ti.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=Vks+ayOIH/1sodpGYur+BQ8OULCen/e02TyguQxrnf8=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBomafU054IODBuJfcZILLR625hKxpmsfteVoKX6
 oi22vzKbS6JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaJmn1AAKCRBD3pH5JJpx
 RZeXD/4qy/JtL5zqnMURKJMuI3bCfbdz0lrGGVm1QSWbcEHRvf+v503zfFfefBh48IxT8EjtOZ1
 BOPYr3zesmzP9AMwx4k3oTpe4yEym1xHAbvOoqhkSRyVj/yah/1rCYuGHjf9spK5/gxndomUCRX
 yECNxTTkjkEyuUQorhLraGnkD7vnj/ww4U51zVS+H0UYswQ/+tzHXf9jav+S3w11A6ZYoTt5xVN
 M/1JCuVDgc4Qsd+j+FYtgztJaTAMGX3E5Us6HRir67Dk9I721x88hW5aSSvJGGIiH2jFIVH7DN/
 nOosBpormDm0XdAkwmhKpmKDXzq0cPdiWbdK//PCK1kglz46PcXrLLu4gm0aTAmKt7pA95Buz8Z
 k5Rmrw3/KBsmZzlbNfXLLDDVXLNmSF/3sPYUzzuFj7i4wKUzkqOrfvRmjj6X2+gXk0qVP0jnbgP
 O4gMF3GZ0/96JphSK81WK/bHgQ7qOjyLM1xfFOiR88WTFsjSQ2Zz/rOLCk6mkr1fNRPDkc80q29
 ZsBaKX4ljfMeAgs2wV+j7Ka/zjPhVAjP9U8rGYxPSnNnTU5nXzu6wr0YM6rAEQjjNiajFZ+Dr8u
 ditVKIGl3cdC0rkjk/xay/WSEZQoZZ5NcsC6okErgZ2HZ6ckopjVq7ty1VvvbHFO6Ya5iBry+aw
 hVA569laCPJ1GXQ==
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
index 7f1ce95cdc3f13e29b3892cff89f21ee0d71a168..c232047487852d431957434c4c97f84dbb66acad 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -595,6 +595,7 @@ static const struct v4l2_subdev_internal_ops csi2rx_internal_ops = {
 
 static const struct media_entity_operations csi2rx_media_ops = {
 	.link_validate = v4l2_subdev_link_validate,
+	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
 };
 
 static int csi2rx_async_bound(struct v4l2_async_notifier *notifier,

-- 
2.50.1


