Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5E7A1E8EA9
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 08:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728934AbgE3G6i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 02:58:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:45020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728853AbgE3G4G (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 02:56:06 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 30ACA221E6;
        Sat, 30 May 2020 06:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590821764;
        bh=7zqcBMUWnlZYtXp6OeucXDvSCyZB2ep8pDSjBh/HdTg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nKa1K+5ueykun/vdeOVo+wRpoAOnmeczUy9hrZPC9HN/Or09YlAsJWN7h7hT3t1he
         /tC5MDMT52MzWC/oz2BUa9pSCiLKkpOkv4F+c8JyejnuRNOKOZlx2UgClebf3s4Rj/
         4+OT/WPtvwqiKrXHDTI8O6iePHmPJOL5xNKdjPJ4=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jevPW-001hqe-4X; Sat, 30 May 2020 08:56:02 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 32/41] media: atomisp: don't cause a warn if probe failed
Date:   Sat, 30 May 2020 08:55:49 +0200
Message-Id: <cc4a83575bdb55ffce5cabc4a3650d83b320de9f.1590821410.git.mchehab+huawei@kernel.org>
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

When probe fails, it is possible that hmm_init() to not be
called. On such case, hmm_cleanup() will cause a WARN_ON().

Avoid it by adding an explicit check at hmm_cleanup() to
ensure that the hmm code was properly initialized.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/hmm/hmm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index c8a6e2d6e498..670382c48034 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -208,6 +208,8 @@ int hmm_init(void)
 
 void hmm_cleanup(void)
 {
+	if (!dummy_ptr)
+		return;
 	sysfs_remove_group(&atomisp_dev->kobj, atomisp_attribute_group);
 
 	/* free dummy memory first */
-- 
2.26.2

