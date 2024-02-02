Return-Path: <linux-media+bounces-4598-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A26846BC9
	for <lists+linux-media@lfdr.de>; Fri,  2 Feb 2024 10:22:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1136728AF2D
	for <lists+linux-media@lfdr.de>; Fri,  2 Feb 2024 09:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B55577F1F;
	Fri,  2 Feb 2024 09:21:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1069677F18
	for <linux-media@vger.kernel.org>; Fri,  2 Feb 2024 09:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706865715; cv=none; b=aY52TlCynPKSW5rT7hUb/J50aM9lyoNnWOaNbsMZdTRKQ836f3bhAYwLejJ70OgjfQmw1e4GqEJ45l+ZFjgU4h+7BvormkEGmecQbAa0IM9iDlsDlXpPzw4ByYS0mSy526jBVjU6VCuSlGa6KTVhUfMsYypQhjOjR7hydpFJrkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706865715; c=relaxed/simple;
	bh=iOQWAbPUgsenTVdkFpbrscgPLXD4FaVrv9hpFWTjqDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DLjkPUT3z8l12dtBvuX1q3hWVi8a4JULP1lQhDvmSGa08mZSTt07OoDdx/IIvkhtIPOiHZRwf4dzEjhk7KuWw/w75UoiJha02a2/7i2wWLhK+kaU0pKPb58Zf980bX8puW6W+jQ9i254Qla1UXgIlzJH+ZMWPubsslRZGNHid7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9FBBC433C7;
	Fri,  2 Feb 2024 09:21:53 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/2] media: atomisp: make dbgopt static
Date: Fri,  2 Feb 2024 10:21:20 +0100
Message-ID: <186826ed0f3d3ff42171fdabb30897f03575141a.1706865681.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706865681.git.hverkuil-cisco@xs4all.nl>
References: <cover.1706865681.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes a sparse warning:

drivers/staging/media/atomisp/pci/atomisp_drvfs.c:40:14: warning: symbol 'dbgopt' was not declared. Should it be static?

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/staging/media/atomisp/pci/atomisp_drvfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_drvfs.c b/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
index 293171da1266..ba7dd569a55a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_drvfs.c
@@ -37,7 +37,7 @@
  *        bit 1: running binary
  *        bit 2: memory statistic
  */
-unsigned int dbgopt = OPTION_BIN_LIST;
+static unsigned int dbgopt = OPTION_BIN_LIST;
 
 static inline int iunit_dump_dbgopt(struct atomisp_device *isp,
 				    unsigned int opt)
-- 
2.43.0


