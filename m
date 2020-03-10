Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01DA017FF27
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 14:44:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728140AbgCJNoo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 09:44:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:37694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727229AbgCJNnT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 09:43:19 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 755F2246AF;
        Tue, 10 Mar 2020 13:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583847797;
        bh=6mjoLPnJEj6hbDb4a3eDjFAtssbP0Kb2t1OmT5Z5JAI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bS+x0cHwLj2nnml4PeaGKjEfaapqjCPtcoiw7PLTX/3dlV5vQyROUd04YzBvaw5LI
         9LXuWIBnYcw28hS2hlGIHg/NMiEYS8ttJ5IaEnjS7DEVJIP95JEMBvX77w3H90f7xd
         be+TW3q1bvR8ceo4vhpVFf5v4evagW49G6j6RffU=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jBfAB-0005wc-JZ; Tue, 10 Mar 2020 14:43:15 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 18/22] media: docs: move fourcc file to the uAPI document
Date:   Tue, 10 Mar 2020 14:43:09 +0100
Message-Id: <0311cecc3382a55c6b02c494ae9c617859c887c4.1583847557.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1583847556.git.mchehab+huawei@kernel.org>
References: <cover.1583847556.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This file gives a hint about how fourcc should be named.

It is on a very weird place, as such kind of thing belongs to the
uAPI guide.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/media/v4l-drivers/index.rst                        | 1 -
 Documentation/userspace-api/media/v4l/common.rst                 | 1 +
 .../{media/v4l-drivers => userspace-api/media/v4l}/fourcc.rst    | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/{media/v4l-drivers => userspace-api/media/v4l}/fourcc.rst (100%)

diff --git a/Documentation/media/v4l-drivers/index.rst b/Documentation/media/v4l-drivers/index.rst
index 67665a8abe02..8962a86dad70 100644
--- a/Documentation/media/v4l-drivers/index.rst
+++ b/Documentation/media/v4l-drivers/index.rst
@@ -31,7 +31,6 @@ For more details see the file COPYING in the source distribution of Linux.
 	:maxdepth: 5
 	:numbered:
 
-	fourcc
 	v4l-with-ir
 	tuners
 	cardlist
diff --git a/Documentation/userspace-api/media/v4l/common.rst b/Documentation/userspace-api/media/v4l/common.rst
index af28ac1bcf88..7d81c58a13cd 100644
--- a/Documentation/userspace-api/media/v4l/common.rst
+++ b/Documentation/userspace-api/media/v4l/common.rst
@@ -57,6 +57,7 @@ applicable to all devices.
     ext-ctrls-fm-tx
     ext-ctrls-fm-rx
     ext-ctrls-detect
+    fourcc
     format
     planar-apis
     selection-api
diff --git a/Documentation/media/v4l-drivers/fourcc.rst b/Documentation/userspace-api/media/v4l/fourcc.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/fourcc.rst
rename to Documentation/userspace-api/media/v4l/fourcc.rst
-- 
2.24.1

