Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 728661E8EC7
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 08:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729013AbgE3G7n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 02:59:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:44864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728724AbgE3G4F (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 02:56:05 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 08940208B8;
        Sat, 30 May 2020 06:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590821763;
        bh=ZKvnU11AYCI4nr14Od48MkcRV6UFQGKSgsFvtzY9Xzo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=yUznQc82sbf5xYVSO4LeahswM9GmDTTM4zQhXJPWzwNIq+zmxVzJdsDQlDGNplpk+
         AfSVB0QocMkcb+gXDE1X4ykfwluWi3Itx7xnTLWj0zGk2SgX9m7fnN1tjkETLW8DPp
         KYXYlH64SKIwflSR9vHzkFqvtaGumOa2ms29H0Lg=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jevPU-001hom-Tz; Sat, 30 May 2020 08:56:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/41] media: atomisp: hmm_bo: untag user pointers
Date:   Sat, 30 May 2020 08:55:26 +0200
Message-Id: <5ec48b790129c5559aa8a2e41f13a12ba9b7d38e.1590821410.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1590821410.git.mchehab+huawei@kernel.org>
References: <cover.1590821410.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The kernel ABI was extended to allow pass tagged user pointers.

Untag the pointers in this function.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 492b76c29490..6fce8c95be1d 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -997,6 +997,9 @@ static int alloc_user_pages(struct hmm_buffer_object *bo,
 	 * Handle frame buffer allocated in other kerenl space driver
 	 * and map to user space
 	 */
+
+	userptr = untagged_addr(userptr);
+
 	if (vma->vm_flags & (VM_IO | VM_PFNMAP)) {
 		page_nr = get_pfnmap_pages(current, current->mm,
 					   (unsigned long)userptr,
-- 
2.26.2

