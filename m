Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6E321E8EC5
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 08:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728872AbgE3G7h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 02:59:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:44904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728783AbgE3G4F (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 02:56:05 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0A87B208E4;
        Sat, 30 May 2020 06:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590821763;
        bh=wIU4L8fcCAnFawFS/JHH3TeHXuSwoOH6ncEx3KzNzKo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=p16mhMVYA85/oBVoMcguyyOSOIhNsBu7VHFf93bOM38CKdxibTAri17CE09tg54dA
         SLzdJJzxiQR3moaWdlUwL5YzRUgzhX66q57wL66N1xddCp/BiAP+6sDavjQsilhzPN
         IJG4MRbz7LvDmstKzKgUt1EP9uB4mMvLGWg6ewbs=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jevPU-001hor-Ut; Sat, 30 May 2020 08:56:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/41] media: atomisp: add debug message to help debugging hmm code
Date:   Sat, 30 May 2020 08:55:27 +0200
Message-Id: <33194cee97bd5102335b72edd9adfcc7a3e23305.1590821410.git.mchehab+huawei@kernel.org>
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

The hmm code is partially based on a fork from 3.10 code,
and has bugs.

Add debug there to help tracking what happens there.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 6fce8c95be1d..b6dcd246d7af 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -1015,6 +1015,11 @@ static int alloc_user_pages(struct hmm_buffer_object *bo,
 		bo->mem_type = HMM_BO_MEM_TYPE_USER;
 	}
 
+	dev_dbg(atomisp_dev, "%s: %d %s pages were allocated as 0x%08x\n",
+		__func__,
+		bo->pgnr,
+		bo->mem_type == HMM_BO_MEM_TYPE_USER ? "user" : "pfn", page_nr);
+
 	/* can be written by caller, not forced */
 	if (page_nr != bo->pgnr) {
 		dev_err(atomisp_dev,
-- 
2.26.2

