Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED04345895
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 08:25:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbhCWHYr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 03:24:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:40508 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230096AbhCWHY3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 03:24:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BBC8C619B2;
        Tue, 23 Mar 2021 07:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616484269;
        bh=LwQRwWB1kiwBzsjF7W8rnkogSfH1nFFBz3L7fNZAikI=;
        h=From:To:Cc:Subject:Date:From;
        b=BEF7w1M16YcNFxOJbyD5FiYSDPlSjRrtjuxZAtP+tUHQoJ6AT1OrPCksqbnTUhG4f
         z1b9D8OjFdhMF2qsA+YwaFxckU8ZFyquTjQzI51Ju5DS+Z6hALyWXNV9XFLsxgPdEy
         BjOJMHF0r14sk9BLzoZjAKKlalBs2Ywa1zfsx4erq8KLBef0dEZQ72Z/TNp4hgClLR
         Q+glCskaV3b2R+sXaIkvOnckJOKDoJ4a51JuVx+oHK6wCCNrqZUi1+u4pt0W8H4Zqr
         AnlGglHHnzBFBwJOQt78akmQ9zbRhwyq8dMCQ6OyKCaYfVUvSKU/q+0EWRpSKHuNQ9
         yiCmJqImpMkWA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lObOr-009dYn-HP; Tue, 23 Mar 2021 08:24:25 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH] media: camera-sensor.rst: fix c:function build warning
Date:   Tue, 23 Mar 2021 08:24:24 +0100
Message-Id: <e4214991b7d59c0d7aa4e6e48833dc1809c47d47.1616484262.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The :c:function: tag evaluation depends on Sphinx version 2 or 3.
Use a syntax that should work with both versions.

Fixes: c0e3bcb25390 ("media: camera-sensor.rst: fix a doc build warning")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/media/camera-sensor.rst | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index cd5c989769a1..7160336aa475 100644
--- a/Documentation/driver-api/media/camera-sensor.rst
+++ b/Documentation/driver-api/media/camera-sensor.rst
@@ -144,9 +144,7 @@ of the device. This is because the power state of the device is only changed
 after the power state transition has taken place. The ``s_ctrl`` callback can be
 used to obtain device's power state after the power state transition:
 
-.. c:function::
-
-	int pm_runtime_get_if_in_use(struct device *dev);
+.. c:function:: int pm_runtime_get_if_in_use(struct device *dev);
 
 The function returns a non-zero value if it succeeded getting the power count or
 runtime PM was disabled, in either of which cases the driver may proceed to
-- 
2.30.2

