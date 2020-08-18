Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D43F3248622
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 15:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726570AbgHRNgB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 09:36:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:45360 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726480AbgHRNfy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 09:35:54 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 219472076D;
        Tue, 18 Aug 2020 13:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597757753;
        bh=3RDFnusPuTN/gUIFW524Igr1Ma20iPQgX1vJUa86zcc=;
        h=From:To:Cc:Subject:Date:From;
        b=YAji/SJ6m5Ii17h8yZsQkWBp16JjwEsppLu6q+XvKPAbDgAM2M1hUTrKQWdHdL7VE
         s+zIu5JLujEF+LFjSrPR+rfsGipkzKwQL4+5VxyRYENf+u8aYF+Q4nbv0RaMrWnuSI
         uVLyGF9hN2SwCQIez5mToI7C7U+Fh553z+dZGqb0=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-media@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] media: cec: no need to check return value of debugfs_create functions
Date:   Tue, 18 Aug 2020 15:36:02 +0200
Message-Id: <20200818133608.462514-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/media/cec/core/cec-core.c | 27 ++++++++-------------------
 include/media/cec.h               |  2 --
 2 files changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index c599cd94dd62..562792f545ac 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -359,27 +359,16 @@ int cec_register_adapter(struct cec_adapter *adap,
 	if (!top_cec_dir)
 		return 0;
 
-	adap->cec_dir = debugfs_create_dir(dev_name(&adap->devnode.dev), top_cec_dir);
-	if (IS_ERR_OR_NULL(adap->cec_dir)) {
-		pr_warn("cec-%s: Failed to create debugfs dir\n", adap->name);
-		return 0;
-	}
-	adap->status_file = debugfs_create_devm_seqfile(&adap->devnode.dev,
-		"status", adap->cec_dir, cec_adap_status);
-	if (IS_ERR_OR_NULL(adap->status_file)) {
-		pr_warn("cec-%s: Failed to create status file\n", adap->name);
-		debugfs_remove_recursive(adap->cec_dir);
-		adap->cec_dir = NULL;
-		return 0;
-	}
+	adap->cec_dir = debugfs_create_dir(dev_name(&adap->devnode.dev),
+					   top_cec_dir);
+
+	debugfs_create_devm_seqfile(&adap->devnode.dev, "status", adap->cec_dir,
+				    cec_adap_status);
+
 	if (!adap->ops->error_inj_show || !adap->ops->error_inj_parse_line)
 		return 0;
-	adap->error_inj_file = debugfs_create_file("error-inj", 0644,
-						   adap->cec_dir, adap,
-						   &cec_error_inj_fops);
-	if (IS_ERR_OR_NULL(adap->error_inj_file))
-		pr_warn("cec-%s: Failed to create error-inj file\n",
-			adap->name);
+	debugfs_create_file("error-inj", 0644, adap->cec_dir, adap,
+			    &cec_error_inj_fops);
 #endif
 	return 0;
 }
diff --git a/include/media/cec.h b/include/media/cec.h
index c48b5f2e4b50..cd35ae6b7560 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -248,8 +248,6 @@ struct cec_adapter {
 #endif
 
 	struct dentry *cec_dir;
-	struct dentry *status_file;
-	struct dentry *error_inj_file;
 
 	u32 sequence;
 
-- 
2.28.0

