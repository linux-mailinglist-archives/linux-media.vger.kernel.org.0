Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6261447CF9
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 10:40:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236518AbhKHJnP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 04:43:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:33596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238473AbhKHJnO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Nov 2021 04:43:14 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 05DEF61242;
        Mon,  8 Nov 2021 09:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636364430;
        bh=3kdsbDiloldfUsyYCakxpoQVBFAHbfEI/J3qiZ1fOrg=;
        h=From:To:Cc:Subject:Date:From;
        b=o8BTlm/F88B66GDeVFjWEcYDaB3Y7up4uV396tzow/YxPVLZLmQXMT0Vyrwo20qJn
         YjDf/7Zs38d99UpOdZ4Ga2I0Mlz+p8nqi1wW9/Sz8SBqr1pNp3XbjjBBKpf0fwNRj4
         1EbG3vqcIJoAuBu1zBVR1bMJXCWSF0KRwebOsbs5dOQGIMm6olykmD/qMQA7KwjlHC
         jlHzmYKQXwxfc91F7Uvk2U39RPXAo9addLB+7fD+W5/l0kBd1xq2R6jLPJ/eqTNOqh
         k9FxnCFXYjmbw6rQSPwxj78IWCpdV1M6bFinXUyKzXqIIgL3sQ+vlE1UjWyiDOC1/R
         oCdNJyj20IyfA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mk18c-00118a-Jw; Mon, 08 Nov 2021 09:40:26 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Alan <alan@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH] media: atomisp: only initialize mode if pipe is not null
Date:   Mon,  8 Nov 2021 09:40:25 +0000
Message-Id: <6406265f2d5f3791d5c7cbd1364186217f19524c.1636364423.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

During atomisp register, udev tries to open all devices. For
some, pipe is NULL, at least during register time, causing the
driver to try to access a NULL pointer.

So, add an extra check to avoid such condition.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/atomisp_fops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index a57d480820bd..c7ac313a2edf 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -901,7 +901,7 @@ static int atomisp_open(struct file *file)
 	rt_mutex_unlock(&isp->mutex);
 
 	/* Ensure that a mode is set */
-	if (asd)
+	if (asd && pipe)
 		v4l2_ctrl_s_ctrl(asd->run_mode, pipe->default_run_mode);
 
 	return 0;
-- 
2.33.1

