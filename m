Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8586627E99A
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 15:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730255AbgI3NZW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 09:25:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:39018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730198AbgI3NZV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 09:25:21 -0400
Received: from mail.kernel.org (unknown [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6A56D207FB;
        Wed, 30 Sep 2020 13:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601472320;
        bh=L11eOxvDowjwlPTvkbhyZpdA60k6ulJgvpYz2/X3w3M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IsGIrYd53RSdsfZqfSizEES8M5vROwipqCgAx2VDIOfrej5AWTIdFWFVQyJZYRmQ+
         JqulgvxlKhuhqxWfNBGI9ERjg7kplW2laptxCjbYF2Honc0RmXlO1Tc2Zl9hOcOUwx
         Fy4/JUJsedVqrO7+E37XBqo1RA15idVgAozw5ynU=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNc6g-001XJb-Gf; Wed, 30 Sep 2020 15:25:18 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v4 17/52] media: cec-core.rst: don't use c:type for structs
Date:   Wed, 30 Sep 2020 15:24:40 +0200
Message-Id: <807d364686dd56c6e95321bdfd455984d6a0bddb.1601467849.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601467849.git.mchehab+huawei@kernel.org>
References: <cover.1601467849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The new C domain code on Sphinx 3 doesn't allow anymore
to use c:type:: for structs.

Now that cdomain.py has backward support, let's use
c:struct:: instead.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/media/cec-core.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/media/cec-core.rst b/Documentation/driver-api/media/cec-core.rst
index 03016eeaf8f4..bc42982ac21e 100644
--- a/Documentation/driver-api/media/cec-core.rst
+++ b/Documentation/driver-api/media/cec-core.rst
@@ -98,7 +98,7 @@ Implementing the Low-Level CEC Adapter
 The following low-level adapter operations have to be implemented in
 your driver:
 
-.. c:type:: struct cec_adap_ops
+.. c:struct:: cec_adap_ops
 
 .. code-block:: none
 
-- 
2.26.2

