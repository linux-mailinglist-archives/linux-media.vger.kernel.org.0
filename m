Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C63F2262EF3
	for <lists+linux-media@lfdr.de>; Wed,  9 Sep 2020 15:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgIINJV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Sep 2020 09:09:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:52490 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730193AbgIINHM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Sep 2020 09:07:12 -0400
Received: from mail.kernel.org (ip5f5ad5d6.dynamic.kabel-deutschland.de [95.90.213.214])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8669721D7F;
        Wed,  9 Sep 2020 13:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599656837;
        bh=B9YXH7kKcmpKkRf5PveeRw/OKYnJRSRuqEBnbbe3KFg=;
        h=From:To:Cc:Subject:Date:From;
        b=MjqfgxoMtne2a2ZJEnyhfPC1sCwjPdsmpMupAlRJ2KN/jxk+NGVHMUkE3scVo6RTd
         Z3z81qPHSRmi+yzI+yUubLgk0TMlps9MHTm5lN8o2traM1iCIMct4c9Egepdphe+gF
         AevS9sI55si/W92HP/ED3A2ByNzoM3pqlnAZz15k=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kFzog-00DP89-6A; Wed, 09 Sep 2020 15:07:14 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH] media: camera-sensor.rst: fix a doc build warning
Date:   Wed,  9 Sep 2020 15:07:11 +0200
Message-Id: <c326774ad841b905c3b2925e5f8f509d29fb4c6f.1599656828.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

	Documentation/driver-api/media/camera-sensor.rst:123: WARNING: Inline literal start-string without end-string.

There's a missing blank line over there.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/media/camera-sensor.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index bd81c2cc37f8..2a8889bf5046 100644
--- a/Documentation/driver-api/media/camera-sensor.rst
+++ b/Documentation/driver-api/media/camera-sensor.rst
@@ -127,6 +127,7 @@ after the power state transition has taken place. The ``s_ctrl``callback can be
 used to obtain device's power state after the power state transition:
 
 .. c:function::
+
 	int pm_runtime_get_if_in_use(struct device *dev);
 
 The function returns a non-zero value if it succeeded getting the power count or
-- 
2.26.2

