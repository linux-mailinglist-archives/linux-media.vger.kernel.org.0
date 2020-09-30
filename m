Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C52EC27E132
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 08:36:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728025AbgI3GgH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 02:36:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:59270 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726924AbgI3GgG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 02:36:06 -0400
Received: from mail.kernel.org (ip5f5ad5c4.dynamic.kabel-deutschland.de [95.90.213.196])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2117D2076A;
        Wed, 30 Sep 2020 06:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601447766;
        bh=Rhqi3Xr5j3S4w5//6C1yLKFp1bK36UdJCSRITo3QGXk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ua+VLY+h5KZEK6KljyIinwNB6UvLfAGBmnHz+LyEOEBNJUpYQInM50S7wEE75ZUJN
         icWp6ZpqNM+10TxVIFyimYjsnPj5ird7TGAFkhQqo0FR8s4LAigMnTetfMGDNmP4Sz
         1P+6q+5FCX4vAbf3tZNZm7H36MGR0MxqZcKgxHvE=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNVid-001QmO-Qo; Wed, 30 Sep 2020 08:36:03 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] media: camera-sensor.rst: fix a doc build warning
Date:   Wed, 30 Sep 2020 08:35:54 +0200
Message-Id: <6fcadfc727239a6c870a851bf6b54fcfb4805cb9.1601447236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601447236.git.mchehab+huawei@kernel.org>
References: <cover.1601447236.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

	Documentation/driver-api/media/camera-sensor.rst:123: WARNING: Inline literal start-string without end-string.

There's a missing blank space over there.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/media/camera-sensor.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index bd81c2cc37f8..4d1ae12b9b4d 100644
--- a/Documentation/driver-api/media/camera-sensor.rst
+++ b/Documentation/driver-api/media/camera-sensor.rst
@@ -123,7 +123,7 @@ Control framework
 ``v4l2_ctrl_handler_setup()`` function may not be used in the device's runtime
 PM ``runtime_resume`` callback, as it has no way to figure out the power state
 of the device. This is because the power state of the device is only changed
-after the power state transition has taken place. The ``s_ctrl``callback can be
+after the power state transition has taken place. The ``s_ctrl`` callback can be
 used to obtain device's power state after the power state transition:
 
 .. c:function::
-- 
2.26.2

