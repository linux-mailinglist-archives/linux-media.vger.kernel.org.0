Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37B5B28228C
	for <lists+linux-media@lfdr.de>; Sat,  3 Oct 2020 10:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbgJCImB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Oct 2020 04:42:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:37436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725601AbgJCImB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 3 Oct 2020 04:42:01 -0400
Received: from mail.kernel.org (ip5f5ad5cf.dynamic.kabel-deutschland.de [95.90.213.207])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 84AFC206DB;
        Sat,  3 Oct 2020 08:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601714520;
        bh=r1d9UMV1FRCy3qUUZr6k4FtRW/rBPkyuBQ2m7N/qcVs=;
        h=From:To:Cc:Subject:Date:From;
        b=V66y5vJV5kg1ipCMSeNJUnpOYEC0krMUKoIbkD5J24Tzz8zeHYVpAJNe1cvKVYarm
         /pfU38Q9AXOuIjWRnhfsZOWqUadGtAeMe8u3dGL6l6F68iRy1VGJKkWQzg5qbYXGk3
         SIIgJUOuiAnOxF8OB/EuP4IltJeMtLwzPw36ENbU=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kOd77-0002Is-UA; Sat, 03 Oct 2020 10:41:57 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Corentin Labbe <clabbe@baylibre.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        mjpeg-users@lists.sourceforge.net
Subject: [PATCH 1/4] media: zoran: move documentation file to the right place
Date:   Sat,  3 Oct 2020 10:41:54 +0200
Message-Id: <6b90346919d42ffc7c3ad283bfca2825b238147a.1601714147.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The zoran revert patch misplaced the Zoran doc file. Move it to
the right place.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/media/drivers/index.rst                 | 1 +
 .../{media => driver-api/media/drivers}/v4l-drivers/zoran.rst    | 0
 2 files changed, 1 insertion(+)
 rename Documentation/{media => driver-api/media/drivers}/v4l-drivers/zoran.rst (100%)

diff --git a/Documentation/driver-api/media/drivers/index.rst b/Documentation/driver-api/media/drivers/index.rst
index 5f340cfdb4cc..eb7011782863 100644
--- a/Documentation/driver-api/media/drivers/index.rst
+++ b/Documentation/driver-api/media/drivers/index.rst
@@ -25,6 +25,7 @@ Video4Linux (V4L) drivers
 	sh_mobile_ceu_camera
 	tuners
 	vimc-devel
+	zoran
 
 
 Digital TV drivers
diff --git a/Documentation/media/v4l-drivers/zoran.rst b/Documentation/driver-api/media/drivers/v4l-drivers/zoran.rst
similarity index 100%
rename from Documentation/media/v4l-drivers/zoran.rst
rename to Documentation/driver-api/media/drivers/v4l-drivers/zoran.rst
-- 
2.26.2

