Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CFC0336FC0
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 11:21:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232215AbhCKKUs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 05:20:48 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:38309 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232278AbhCKKU3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 05:20:29 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id KIQYlPLX0C40pKIQdlKo4i; Thu, 11 Mar 2021 11:20:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615458028; bh=j4XFtcazo/8FIRcxVGDojwNolTgnnTgxybMo/pEcHYw=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=WiOuQKxUz4O4TuWidTTBsnf5f5E56qPd6QnghgO7C9ga06wGXLx77+9jsAXJa6XWb
         xT4xHVoEG/FI2C+CWHOl+YJmm0ocPYjxUVOn3axvGCFtlR8B4AIX3dtL/0cANlhmYI
         19EN/hEMJxXzQgzItUK8UCTePxTVTZ53aBuTK4VdW80R0kIZEUdq36SZCHA1SuAlPL
         Dq0n7URwMZAHp1NfaissX/IOS1hbBuet8zT59hmJqpNdM1iA7KMHWKwMIgOgyQ3bm1
         j5SgdMJg2uAxjmaZTEfb5J3G1dUCkc01pHuxvTikw/DxBaEQrVC9Cqm2zPUfz//Wyc
         AdsopsheQdX5w==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 01/13] exynos-gsc/exynos4-is: add missing 'struct' to kerneldoc
Date:   Thu, 11 Mar 2021 11:20:10 +0100
Message-Id: <20210311102022.96954-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210311102022.96954-1-hverkuil-cisco@xs4all.nl>
References: <20210311102022.96954-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfI2xPb/zUiB1u72ER64GdeqlP5VATSz1rK0PzXa8A/OqDFQ+9I+MEpAR3WYnAs21EYlBUZ6IxwHRH6xiF5pUwmHqHeW73aKBo1Cd+mE10150Hj0IjQg7
 ecQCpfUlobofQ4V2L0ZWzyWiBBpQFk0AB9QJ8+ZMYGJf2IQyv28zB5+HYc8rqQ7O6rPCkoVzKowBnfff9HGYHvNFMbYHTFG1bmNDpI13ufBtXq+hNuWXjWyn
 jeoQpbah2/Uj2UDuK3EmlqgUdWHmqVZnOC6yQDOx0O5LE0Luis24Q0X4Hsvuaqim
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix kernel-doc warnings due to missing 'struct' keyword.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/media/platform/exynos-gsc/gsc-core.h  | 2 +-
 drivers/media/platform/exynos4-is/fimc-core.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/exynos-gsc/gsc-core.h b/drivers/media/platform/exynos-gsc/gsc-core.h
index 8e5a9acb78aa..a2eeb8affe0d 100644
--- a/drivers/media/platform/exynos-gsc/gsc-core.h
+++ b/drivers/media/platform/exynos-gsc/gsc-core.h
@@ -340,7 +340,7 @@ struct gsc_dev {
 };
 
 /**
- * gsc_ctx - the device context data
+ * struct gsc_ctx - the device context data
  * @s_frame:		source frame properties
  * @d_frame:		destination frame properties
  * @in_path:		input mode (DMA or camera)
diff --git a/drivers/media/platform/exynos4-is/fimc-core.h b/drivers/media/platform/exynos4-is/fimc-core.h
index 58b72a052cef..24212a6bce25 100644
--- a/drivers/media/platform/exynos4-is/fimc-core.h
+++ b/drivers/media/platform/exynos4-is/fimc-core.h
@@ -453,7 +453,7 @@ struct fimc_ctrls {
 };
 
 /**
- * fimc_ctx - the device context data
+ * struct fimc_ctx - the device context data
  * @s_frame:		source frame properties
  * @d_frame:		destination frame properties
  * @out_order_1p:	output 1-plane YCBCR order
-- 
2.30.1

