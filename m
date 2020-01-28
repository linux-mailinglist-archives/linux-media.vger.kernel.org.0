Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E67C14AFE9
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2020 07:41:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbgA1GlH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jan 2020 01:41:07 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:44788 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725810AbgA1GlG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jan 2020 01:41:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=irDvNvMPu+MyYJbjRW4UBc3IIkb5VZlMlk/bR+uOR3Y=; b=jncTHtSMxXXF4vLyOhw8Z0Jdt+
        uXvi5Bhc+hz58eDxnRDUr2NZ/ZDcacogNt31wOVNOjZ99rgpdu8FDFwVUnH64S0h1s/Zu4pe2CMMK
        Z5QEptcMq49wpRxTZzboVMLLqlbMWcVvv3msuI+Bz/AFVCv8zCLAlD720s1E+NX1uQElwMP9KQUyg
        cw2ruZhhINWOSuYctqYMKrmOrZzmkCAsZlGidSLHUZQ7vYWhPKq4gGbhPkZWbfJ7pYf5/Se+cHHu/
        YNzNSBmdaH7bwhW78cLFRFpijSlS9WD4bI0jEz+ZpqRyzegKuXPREtik7ATexjcIPPSfzajlXG+7R
        jgYivdhA==;
Received: from [80.156.29.194] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iwKYb-00077n-Vh; Tue, 28 Jan 2020 06:41:06 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1iwKYa-001AeA-2V; Tue, 28 Jan 2020 07:41:04 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Jaskaran Singh <jaskaransingh7654321@gmail.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Christian Brauner <christian@brauner.io>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Tobin C. Harding" <tobin@kernel.org>, linux-doc@vger.kernel.org
Subject: [PATCH 2/2] docs: filesystems: add overlayfs to index.rst
Date:   Tue, 28 Jan 2020 07:41:01 +0100
Message-Id: <3b8e7783b1fcc71e4f94af5ea8e5fa264392f8c4.1580193653.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <00008303fde6b4e06d027d3b76ae7032614a7030.1580193653.git.mchehab+huawei@kernel.org>
References: <00008303fde6b4e06d027d3b76ae7032614a7030.1580193653.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While the document is there, it is currently missing at the
index file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/filesystems/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystems/index.rst
index ad6315a48d14..328e2c48df31 100644
--- a/Documentation/filesystems/index.rst
+++ b/Documentation/filesystems/index.rst
@@ -47,4 +47,5 @@ Documentation for filesystem implementations.
    :maxdepth: 2
 
    autofs
+   overlayfs
    virtiofs
-- 
2.24.1

