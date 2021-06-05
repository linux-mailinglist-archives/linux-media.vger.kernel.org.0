Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEFB639C86C
	for <lists+linux-media@lfdr.de>; Sat,  5 Jun 2021 15:18:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbhFENU2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Jun 2021 09:20:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:35000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230025AbhFENUZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 5 Jun 2021 09:20:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F9DE6140F;
        Sat,  5 Jun 2021 13:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622899117;
        bh=cpiHjfyPEv/eHZzUJgDyYv5zqPtLLTjjoYauXF2rsVc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IwkKWGTpNZmW8lJRvOT0Hoa7stmZz0s64aQNb2o7yUdr8Y5RHpZUlDfjtaBUSgCr+
         8LaTEElCpGdxfmkWlW/43C07tZzmx4rqj84DMb2sRzd2R28yHkS75PPTPRKWflLQsq
         Yj2bBFCqNH7vVRglCNy9H2WfIhlyrieTYnXiwZgC82IMTDe5A0T/KymfXpe1JGo/XS
         dOzFGR+SknlkdWV4afyaIawbhF+JwGmQ7awDaJCSucSNOxBVtXK1cCKZYhH4xIo983
         CUe9cEaBWhHyhq+0Hc/ye+Im0hYv1v1LemfFndkUQ5AbPjIo4oC2mywybt2Dn9P/Jy
         9RUl7yj7QgO7g==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lpWCB-008GEn-Ew; Sat, 05 Jun 2021 15:18:35 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "Jonathan Corbet" <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 05/34] media: driver-api: drivers: avoid using ReST :doc:`foo` markup
Date:   Sat,  5 Jun 2021 15:18:04 +0200
Message-Id: <c776cab33419e27d1e5c359b4a5ed3ad1348b9d5.1622898327.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1622898327.git.mchehab+huawei@kernel.org>
References: <cover.1622898327.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The :doc:`foo` tag is auto-generated via automarkup.py.
So, use the filename at the sources, instead of :doc:`foo`.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/media/drivers/bttv-devel.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/media/drivers/bttv-devel.rst b/Documentation/driver-api/media/drivers/bttv-devel.rst
index c9aa8b95a5e5..0885a04563a9 100644
--- a/Documentation/driver-api/media/drivers/bttv-devel.rst
+++ b/Documentation/driver-api/media/drivers/bttv-devel.rst
@@ -21,7 +21,7 @@ log, telling which card type is used.  Like this one::
 
 You should verify this is correct.  If it isn't, you have to pass the
 correct board type as insmod argument, ``insmod bttv card=2`` for
-example.  The file :doc:`/admin-guide/media/bttv-cardlist` has a list
+example.  The file Documentation/admin-guide/media/bttv-cardlist.rst has a list
 of valid arguments for card.
 
 If your card isn't listed there, you might check the source code for
-- 
2.31.1

