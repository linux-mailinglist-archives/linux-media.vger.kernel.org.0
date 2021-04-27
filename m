Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8CFB36C342
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235426AbhD0K2D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:28:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:47652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235304AbhD0K17 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:27:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E24CB611F2;
        Tue, 27 Apr 2021 10:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519235;
        bh=euIQLwDaPDSgWFx6NM45FK2bpju26XjkPQY0ICj4Fck=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=P5fSA5LOibNGMYPA1Zp+9c/obPnU5Jakea77X+sfyVZD1AbcxM+wz45KtcseD8bNm
         4KD7oFM2gDFXeB3CAvy7Vp4Z1Pvd4kNk/u2KHTVriRp55zVTWvp4hO/9aVgPIfULYH
         ek2JL00/fnm68LMnquJI1vcAo7Gx9eAQdu8YNAzWx2TZeN4luu0iPPxUiKt2YbsqQq
         Ey26ocTLTDuHk/PokhKcaFxFQE3lrLtjATLKqFusiPHjGUafuSxFdDDFqZXZU/oLbx
         zuKhsEgsojEcGmBQ8OlPk2v72wytbr9pfV8V9DoryqOg//I833iMiR8AwXZUx3+tWK
         AqYGEAlMoFq+Q==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvv-000nzw-LS; Tue, 27 Apr 2021 12:27:11 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 15/79] media: sh_vou: fix pm_runtime_get_sync() usage count
Date:   Tue, 27 Apr 2021 12:26:05 +0200
Message-Id: <3d2ef55f0ca6f4f58804b402d0d1bf176bcf9791.1619519080.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619519080.git.mchehab+huawei@kernel.org>
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pm_runtime_get_sync() internally increments the
dev->power.usage_count without decrementing it, even on errors.
Replace it by the new pm_runtime_resume_and_get(), introduced by:
commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
in order to properly decrement the usage counter and avoid memory
leaks.

While here, check if the PM runtime error was caught at open time.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/sh_vou.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/sh_vou.c b/drivers/media/platform/sh_vou.c
index 4ac48441f22c..ca4310e26c49 100644
--- a/drivers/media/platform/sh_vou.c
+++ b/drivers/media/platform/sh_vou.c
@@ -1133,7 +1133,11 @@ static int sh_vou_open(struct file *file)
 	if (v4l2_fh_is_singular_file(file) &&
 	    vou_dev->status == SH_VOU_INITIALISING) {
 		/* First open */
-		pm_runtime_get_sync(vou_dev->v4l2_dev.dev);
+		err = pm_runtime_resume_and_get(vou_dev->v4l2_dev.dev);
+		if (err < 0) {
+			v4l2_fh_release(file);
+			goto done_open;
+		}
 		err = sh_vou_hw_init(vou_dev);
 		if (err < 0) {
 			pm_runtime_put(vou_dev->v4l2_dev.dev);
-- 
2.30.2

