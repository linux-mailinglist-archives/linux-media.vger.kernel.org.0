Return-Path: <linux-media+bounces-129-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE05A7E903C
	for <lists+linux-media@lfdr.de>; Sun, 12 Nov 2023 14:28:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6256D1F21009
	for <lists+linux-media@lfdr.de>; Sun, 12 Nov 2023 13:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EE4512B80;
	Sun, 12 Nov 2023 13:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pUniXUNk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC52D10A1D
	for <linux-media@vger.kernel.org>; Sun, 12 Nov 2023 13:27:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E068BC433C7;
	Sun, 12 Nov 2023 13:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699795666;
	bh=Z1g+PkT9+YcNoLveB5s4Kcz6GlKNQUZJs2E9KCwoAeM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pUniXUNkfLaVtVKGOabckFStV/nmTHu7+Q/sik4P/BcAZe/uaRZcElLicayG3WgMI
	 JEGQbjMjTAxa3dakDtbrNI5kMm2sJP4RpRDOTpOAlNec9ptKsMJGO+eit9OiEDfa7U
	 CuS/CA0linMHlDgZuTN+oFxw2c+0lFUtvoPfBd2jasbbzO3bFhb5LPir4Y1/3CStHL
	 XUsqx2xObNqADcdKeqDYa6CArGs+TBNR7Y3P1Lt9CIk8uEnXyIfpMe5GFI4QRxzimD
	 zb4w7kPFi7Ero5k3fvhkepCCwYKrPaWq3yGWrfkQaCqZ4xodmBiEARw1V8BOEaAWmF
	 VwHfUVJmfiJiQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 07/11] media: ccs: Fix driver quirk struct documentation
Date: Sun, 12 Nov 2023 08:27:30 -0500
Message-ID: <20231112132736.175494-7-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231112132736.175494-1-sashal@kernel.org>
References: <20231112132736.175494-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.1
Content-Transfer-Encoding: 8bit

From: Sakari Ailus <sakari.ailus@linux.intel.com>

[ Upstream commit 441b5c63d71ec9ec5453328f7e83384ecc1dddd9 ]

Fix documentation for struct ccs_quirk, a device specific struct for
managing deviations from the standard. The flags field was drifted away
from where it should have been.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/i2c/ccs/ccs-quirk.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-quirk.h b/drivers/media/i2c/ccs/ccs-quirk.h
index 5838fcda92fd4..0b1a64958d714 100644
--- a/drivers/media/i2c/ccs/ccs-quirk.h
+++ b/drivers/media/i2c/ccs/ccs-quirk.h
@@ -32,12 +32,10 @@ struct ccs_sensor;
  *		@reg: Pointer to the register to access
  *		@value: Register value, set by the caller on write, or
  *			by the quirk on read
- *
- * @flags: Quirk flags
- *
  *		@return: 0 on success, -ENOIOCTLCMD if no register
  *			 access may be done by the caller (default read
  *			 value is zero), else negative error code on error
+ * @flags: Quirk flags
  */
 struct ccs_quirk {
 	int (*limits)(struct ccs_sensor *sensor);
-- 
2.42.0


