Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3BEB1C6F24
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 13:21:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727067AbgEFLVh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 07:21:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:41148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725824AbgEFLVg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 07:21:36 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3A00120663;
        Wed,  6 May 2020 11:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588764096;
        bh=d4mDA4HfnftlwzqOHYr6QJ3frqpCJNky6Px5eIZd2qg=;
        h=From:To:Cc:Subject:Date:From;
        b=qjoALIQvMgvr0+QIqLSvhP7SCnENmCpVEr/A7W5df0f6hbK1unO+sgCuUqHlVXlf1
         G/BtKVsJh4qf8dgDmr+EO+0Uj1LM3jsuEQZ1BQ26XW/UDClWtvQk5jYwgUrTigg6Uy
         4JFoZ3cal0nQsQig2tjIC5zFY56oNctvS4pvTvxU=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jWI7J-002uTl-UU; Wed, 06 May 2020 13:21:33 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>
Subject: [PATCH] media: ipu3.rst: fix a build warning
Date:   Wed,  6 May 2020 13:21:33 +0200
Message-Id: <b8167513340188632a8632d7252dbf5e888cde99.1588764091.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sphinx 2.4.4 produces this warning:

	Documentation/admin-guide/media/ipu3.rst:235: WARNING: Title underline too short.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/ipu3.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/media/ipu3.rst b/Documentation/admin-guide/media/ipu3.rst
index 7a257c358f9d..9361c34f123e 100644
--- a/Documentation/admin-guide/media/ipu3.rst
+++ b/Documentation/admin-guide/media/ipu3.rst
@@ -232,7 +232,8 @@ The IPU3 ImgU pipelines can be configured using the Media Controller, defined at
 :ref:`media_controller`.
 
 Running mode and firmware binary selection
--------------------------
+------------------------------------------
+
 ImgU works based on firmware, currently the ImgU firmware support run 2 pipes in
 time-sharing with single input frame data. Each pipe can run at certain mode -
 "VIDEO" or "STILL", "VIDEO" mode is commonly used for video frames capture, and
-- 
2.25.4

