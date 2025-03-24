Return-Path: <linux-media+bounces-28632-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E08DBA6D9BA
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 13:03:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 721A916BD0C
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 12:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DD8D25E81A;
	Mon, 24 Mar 2025 12:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uZU/tCbG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6011225DD13;
	Mon, 24 Mar 2025 12:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742817743; cv=none; b=cpR+KCpbNSpG5LqEiiBgmC3FG1x2Q/N7KFIxsRzy7Rq655M4+uEejYMX+8F8IIc6haZVF2CpvO5ujspDfbImPerHCdpf9orQtAoh3+1IzEYvX8DcPiNTjHQWz9ELUGh3ZZSDx/jVKdF08u3cY6LjSW2Nt5mbB+kh0z0GLrjveWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742817743; c=relaxed/simple;
	bh=qZ+kzep2D1ptJkwQqG63N/Mysy4aFVl8JZ6Q8lpusBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aC9cp4Vk2kzhwe1kY1j3EA6GT5TGOt9jQO81M4nVhe2/LP4WG3f4c3pFTYoeis8LfMmnMKszYERXp+42UBcICsJmfb/MKyyqRa9o+44b7lkgQKOqVhs3ofL03eC9lk3/WRqFNQd2vuk3snioHTDjZA67KVbILwp2vak3JQkv8D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uZU/tCbG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:904a:b2d:8d57:4705:738e])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58AF1455;
	Mon, 24 Mar 2025 13:00:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742817634;
	bh=qZ+kzep2D1ptJkwQqG63N/Mysy4aFVl8JZ6Q8lpusBs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uZU/tCbGozGw4rsX3Zh6eItUJmvC2UIJbKBE3hXiYxiZL41cNEAx4pnOByIUxd5y8
	 nf/o99kwibzXylge/rD34+KPILhJuTcEN+5LWzQxeWe8+Ix6KSJN5oFtuOKLCgNnIp
	 Ll2wlqAk8Cud8Bezxe1dtMvhJbit/mukoxxBXvS8=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 24 Mar 2025 17:31:40 +0530
Subject: [PATCH 4/6] media: cadence: csi2rx: Implement get_fwnode_pad op
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-probe_fixes-v1-4-5cd5b9e1cfac@ideasonboard.com>
References: <20250324-probe_fixes-v1-0-5cd5b9e1cfac@ideasonboard.com>
In-Reply-To: <20250324-probe_fixes-v1-0-5cd5b9e1cfac@ideasonboard.com>
To: Jai Luthra <jai.luthra@linux.dev>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: Devarsh Thakkar <devarsht@ti.com>, 
 Rishikesh Donadkar <r-donadkar@ti.com>, Vaishnav Achath <vaishnav.a@ti.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=944;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=qZ+kzep2D1ptJkwQqG63N/Mysy4aFVl8JZ6Q8lpusBs=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBn4Umx5rfYtyLqQZULmg+MN0oprHVxlG3FonYov
 A60lobfwwOJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ+FJsQAKCRBD3pH5JJpx
 RW+PD/95RmwO92Hx+mz79R+oI56r5+LWXWezZpf1ZfvPAbjQWTQSNgYKZBBtyRnFXlpfxb1wOyK
 TDc9xso6MvPdUVIHrEMPXo2cYkfXVWuGYdnHF58fLwNUA3FZi1TvUDi1t8559JOYw7Ch10yF323
 GFzstAJENB0f/V40SqcvS8qg3/NocPiULlbmpf+r6BNyKG03xDOAFOPYMzNEaZ2KaaE1MNdoGjG
 a1gJGhUzXpClQEbMDXzgN+ybjCoHhYJ9PHFTIvkiYoPVUg/amJIMpKRd0ez7ba545Zyfkwz7Kcr
 rsdsGYqSnxrRaOxmQjNbcpvU/WT6ykNUZT90rGKqcWdEDj1TxYuCYGyn2WQkjJ2mDJjiXaT7WrL
 twmPP8I2teLq2jxUw/0bf0BiLhWWFj2fzSLT1ckiBuHtZM7KBDdQPcFssSg+++V+Xr3/85KTRVY
 ZWh90tNuBZvZLV+GUoXpT91cUOTNVfcgK04ILWXhuB4/9/EeQfMo6FIVlGFDSs00Sh9ytOLrKIP
 vtIrJ8a7krOBwyXGARZ4OQe0H5Kp5AC8bBVm0G222MqmNIEqVBogSqZd2kSRAHWlr+apGjjCrZI
 0t4A0qMWJVWYbd8qz/7MXfuYAEartp802A2t8WTZRRThAi74v1AxWfw7RQsguAk+P9Pb/VUb1tV
 zAHXeGORHt1uhiA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Use v4l2_subdev_get_fwnode_pad_1_to_1() as the get_fwnode_pad operation.
Cadence CSI2RX maps port numbers and pad indices 1:1.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 4d64df829e7585b6e305651f3ff9bdd008508ec5..b489967563cde96ac109c44a665b30e573125721 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -477,6 +477,7 @@ static const struct v4l2_subdev_internal_ops csi2rx_internal_ops = {
 
 static const struct media_entity_operations csi2rx_media_ops = {
 	.link_validate = v4l2_subdev_link_validate,
+	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
 };
 
 static int csi2rx_async_bound(struct v4l2_async_notifier *notifier,

-- 
2.48.1


