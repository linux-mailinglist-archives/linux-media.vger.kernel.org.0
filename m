Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36EB71E8E9F
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 08:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728960AbgE3G6O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 02:58:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:44988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728870AbgE3G4H (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 02:56:07 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7591A221FA;
        Sat, 30 May 2020 06:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590821764;
        bh=DLTUqbAG4VjJQgYy71x1AgKZ/LSej0118SmB0WgyqLk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=x8WmFLIYL27rhi9DsprWBEb5aDm0yqiK1h0iATnLO0MhNWUi0ui8JGoaShOV62EDi
         2vzHQOsgaVyW59OtTngx+j/cWZ6C0BiqYgfiG/s7HI1IaZs8FP4e98AqYX6mV9D87W
         dKbeZGbSfB/qzxo8WWlLwKJj04KmbFNDjiJpzqWY=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jevPW-001hr5-C3; Sat, 30 May 2020 08:56:02 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 38/41] media: atomisp: add a debug message at hmm free
Date:   Sat, 30 May 2020 08:55:55 +0200
Message-Id: <1647dbd3a070380753d65e9083b87c1a84102bbc.1590821410.git.mchehab+huawei@kernel.org>
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

In order to check if aren't there any memory leaks, let's
add a debug print for hmm_free().

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/hmm/hmm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 670382c48034..25b92b2c4830 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -285,6 +285,8 @@ void hmm_free(ia_css_ptr virt)
 {
 	struct hmm_buffer_object *bo;
 
+	dev_dbg(atomisp_dev, "%s: free 0x%08x\n", __func__, virt);
+
 	WARN_ON(!virt);
 
 	bo = hmm_bo_device_search_start(&bo_device, (unsigned int)virt);
-- 
2.26.2

