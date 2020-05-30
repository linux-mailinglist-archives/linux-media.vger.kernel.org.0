Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8301E8EBE
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 08:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729183AbgE3G7W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 02:59:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:44966 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728826AbgE3G4F (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 02:56:05 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4FA2021534;
        Sat, 30 May 2020 06:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590821763;
        bh=5bcWPbVOrG7j+OP6Xyz7uIKyWpwnQnhVLv2vj0C97fs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qCqQPQX6tuEKE9sWbP4thIvVSFBRDrjLG7KuASo0RrQBSXTsv3eKrld68NtPbRWlx
         9Ra9PAJq8uE9lBwsfrBN2igc6Q1P0Fj4f9WLTJ71SBVhOfDbrhvou1diC4tbMn2iL9
         DjUjeql1aJkWrCs8nDtjRKsStxAPvEZFnncjnfGA=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jevPV-001hpE-4k; Sat, 30 May 2020 08:56:01 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/41] media: atomisp: add debug for hmm alloc
Date:   Sat, 30 May 2020 08:55:32 +0200
Message-Id: <6b9fbe34195df5a2ef410f0e877b47ba90bb2aa3.1590821410.git.mchehab+huawei@kernel.org>
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

The hmm code is still complex and has bugs. Add a debug print
when memory gets allocated, in order to help identifying what's
happening out there.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/hmm/hmm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 5e983442ca80..c8a6e2d6e498 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -253,7 +253,7 @@ ia_css_ptr hmm_alloc(size_t bytes, enum hmm_bo_type type,
 		goto alloc_page_err;
 	}
 
-	/* Combind the virtual address and pages togather */
+	/* Combine the virtual address and pages together */
 	ret = hmm_bo_bind(bo);
 	if (ret) {
 		dev_err(atomisp_dev, "hmm_bo_bind failed.\n");
@@ -265,6 +265,10 @@ ia_css_ptr hmm_alloc(size_t bytes, enum hmm_bo_type type,
 	if (attrs & ATOMISP_MAP_FLAG_CLEARED)
 		hmm_set(bo->start, 0, bytes);
 
+	    dev_dbg(atomisp_dev,
+	    "%s: pages: 0x%08x (%ld bytes), type: %d from highmem %d, user ptr %p, cached %d\n",
+	    __func__, bo->start, bytes, type, from_highmem, userptr, cached);
+
 	return bo->start;
 
 bind_err:
-- 
2.26.2

