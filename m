Return-Path: <linux-media+bounces-19099-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CB59906C9
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 16:54:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57E311F216B1
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 14:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F1E1C75E9;
	Fri,  4 Oct 2024 14:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sQq/pu9c"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F1E1C3031;
	Fri,  4 Oct 2024 14:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728053253; cv=none; b=JkwOK8QxrhAlKd5wwszWULsFOiIKrk9hUbNPz9msQKAu1CvY/xIrTw4eqVCQYHawT9QgKnyD7B34oPCCnJ3DYQeUiiK1FFgWlDd3V83ppOijS7Om8v83nEFdyKEuCwv36TVeOnp6MsR9iBYxvCZtwSpyNmocxaYfviyVYwk5eXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728053253; c=relaxed/simple;
	bh=qKxdFEJd3KSL7NpISVW6N32V2S3UB2c4wWfyL/7uadU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tH9Ho6ICUkocmtotVXbuxghYOIgr5jKuBSa5ZgXE9zRrp+tXcw22MtVWqu+8rfyWpP8i6VO+9cD7jgTlW3/idWv6mbsDVWsEgUx+wOhdNM2VMJ5XdQcH+gunprj16GQIx2APdFyI0IxFOX0VbImrD5kSKYun+QSntn9gHRepY6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sQq/pu9c; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A77CC1590;
	Fri,  4 Oct 2024 16:45:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728053145;
	bh=qKxdFEJd3KSL7NpISVW6N32V2S3UB2c4wWfyL/7uadU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sQq/pu9czEyVEo+V5wGRi3HK6eALeHooY6POESoGd1Eku/xDHyuUT2Nixw3/IKSa3
	 Dcl8/RlEJa0tvHLTzyc8FHkyyTQ3YBAdtVjUwMoG3BXEGbeYHtKHHfhVFVcSt/wNHQ
	 +93Vrpn93OOIV7L95aqq7V2qZvAsy9lptDTMQTE4=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 04 Oct 2024 17:46:40 +0300
Subject: [PATCH 09/13] media: i2c: ds90ub960: Drop unused indirect block
 define
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241004-ub9xx-fixes-v1-9-e30a4633c786@ideasonboard.com>
References: <20241004-ub9xx-fixes-v1-0-e30a4633c786@ideasonboard.com>
In-Reply-To: <20241004-ub9xx-fixes-v1-0-e30a4633c786@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=855;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=qKxdFEJd3KSL7NpISVW6N32V2S3UB2c4wWfyL/7uadU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBm///vG1KHxaDyqpkAIdM6rdA/HuNSTdx7cT4u8
 +NG89KtetqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZv//7wAKCRD6PaqMvJYe
 9bSgD/4xb1whfKV3pYanCpN9wsbKRDfL1TYcWOG5UNmWhBqeuWCmCvCUYrlNT6XHGwmW6WV9dCa
 0r0eQywktARZGLGU/7lLZrzQe3MuvkX96P3LAqunRAZqpBL5Z1UJ6nmtSIKVOkK7pdBpjbkNPYk
 MOd2TZZMYTDHIY9MuRBsdwffvkR/kEmY0pEdYwhE8v3o5nr6gFxp6i9gVXBk0dQhn8brit+MSOO
 HViDyZOvtZdd5PWL6YeEGKZYRBkrjNTYEueejTDCTUpYxRS83OJ5PwNtDiWAK3Ev7FqwXcqQ3lm
 oj0BZKKoSZwwfRKIq3qsxYvHZfDNGLAclhtOqtVwRyfx092GuBnnrdSX6m9PmRkPaKK7ZgQzMSn
 aD/gsjGj0jRwPaNBUnNMqA+/PK9JEtRKa4BLn+39J2fHJ7msiyf4iH17eNghtvev/opkimStt/5
 EhBVbj3ld8+r3xVleje7rfMb17jXOQWHiPsWh649sDrQ7QuyF15RylVLWzoaNwv1yJ73pVRDhnM
 b85CYPsxRyzdCNtZ5nbSbpeH8nGXRVmWKuLVOPxOR2+k7m0ojQdc4jWRdruhKoQQWtil5jZQOl5
 2ijY3z1Sz7BReuyOrwPlfESKRUaanJa+eIQkmKtJoipYUyf7NNVlQ7gF/9x4b6uX+Rzi9ytGdss
 6Q0OcSvN6kQmnrg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Drop the unused UB960_IND_TARGET_CSI_CSIPLL_REG_1 define. It does not
even match to any block in the more recent documents, so it's possible
it is not only unused but also wrong.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 09a19553ec53..d4a3759bc568 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -366,7 +366,6 @@
 /* Indirect register blocks */
 #define UB960_IND_TARGET_PAT_GEN		0x00
 #define UB960_IND_TARGET_RX_ANA(n)		(0x01 + (n))
-#define UB960_IND_TARGET_CSI_CSIPLL_REG_1	0x92	/* UB9702 */
 #define UB960_IND_TARGET_CSI_ANA		0x07
 
 /* UB960_IR_PGEN_*: Indirect Registers for Test Pattern Generator */

-- 
2.43.0


