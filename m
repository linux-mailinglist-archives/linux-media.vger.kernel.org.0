Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2507527E138
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 08:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728318AbgI3Ggg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 02:36:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:59312 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727886AbgI3GgH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 02:36:07 -0400
Received: from mail.kernel.org (ip5f5ad5c4.dynamic.kabel-deutschland.de [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 382BB2137B;
        Wed, 30 Sep 2020 06:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601447766;
        bh=EtRGmIsfdSn+nJFr0PpwO5FfDqpexevAafV+Zei2Qsw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UorkgwiC3ozsGrZ3lX4UFpXLv8GMx1obQf5xy9Zm6sWAPHS2X7rohTnEb745Z6zIU
         HyH+P8K01T8CnQ1fTvBhjmqUqXgye51ZO0O7Nk4b6gCPSwQ2kEQH38saZ/aL0uHJzh
         Lgy/QFdLkyyH4JTadoX8duYUq/z6j/1GqxrH8Ie8=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNVid-001QmW-Uy; Wed, 30 Sep 2020 08:36:03 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] media: v4l2-subdev.rst: get rid of a duplicatd kernel-doc markup
Date:   Wed, 30 Sep 2020 08:35:58 +0200
Message-Id: <7b5bf459111b3b6056864513e636157218134299.1601447236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601447236.git.mchehab+huawei@kernel.org>
References: <cover.1601447236.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are two kernel-doc markups for include/media/v4l2-async.h,
one at v4l2-async.rst and another one at v4l2-subdev.rst.

Sphinx 3.x checks it and complains for duplicated symbols.

So, get rid of one of them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/media/v4l2-subdev.rst | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index d3e0fd6652b0..6248ea99e979 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -495,5 +495,3 @@ V4L2 sub-device functions and data structures
 ---------------------------------------------
 
 .. kernel-doc:: include/media/v4l2-subdev.h
-
-.. kernel-doc:: include/media/v4l2-async.h
-- 
2.26.2

