Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3542291F8E
	for <lists+linux-media@lfdr.de>; Sun, 18 Oct 2020 22:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727442AbgJRTSU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Oct 2020 15:18:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:56298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727416AbgJRTST (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Oct 2020 15:18:19 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3D15C222BA;
        Sun, 18 Oct 2020 19:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603048699;
        bh=vJFXUUXbzdk6b30x0KD3inikwaRRFzDEaCtkhqDKtxk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=igTVQtvnRkIDhQ/IH0vjd0T2lJeDc1TI+4TdiQuVXqq5v7+qKksXnaRKinVzo15BS
         NocdfTa94967BNhQOwfW5aRL6+vw+xNYQopgG25HjeGVNhxGTnKlons0Ta9mYsgCRw
         U/4uegjf9UQ0Nk0RsHtD58qq2SWmEBZ1Bp61FaMc=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Aditya Pakki <pakki001@umn.edu>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 009/111] media: st-delta: Fix reference count leak in delta_run_work
Date:   Sun, 18 Oct 2020 15:16:25 -0400
Message-Id: <20201018191807.4052726-9-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201018191807.4052726-1-sashal@kernel.org>
References: <20201018191807.4052726-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Aditya Pakki <pakki001@umn.edu>

[ Upstream commit 57cc666d36adc7b45e37ba4cd7bc4e44ec4c43d7 ]

delta_run_work() calls delta_get_sync() that increments
the reference counter. In case of failure, decrement the reference
count by calling delta_put_autosuspend().

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/sti/delta/delta-v4l2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/sti/delta/delta-v4l2.c b/drivers/media/platform/sti/delta/delta-v4l2.c
index 2503224eeee51..c691b3d81549d 100644
--- a/drivers/media/platform/sti/delta/delta-v4l2.c
+++ b/drivers/media/platform/sti/delta/delta-v4l2.c
@@ -954,8 +954,10 @@ static void delta_run_work(struct work_struct *work)
 	/* enable the hardware */
 	if (!dec->pm) {
 		ret = delta_get_sync(ctx);
-		if (ret)
+		if (ret) {
+			delta_put_autosuspend(ctx);
 			goto err;
+		}
 	}
 
 	/* decode this access unit */
-- 
2.25.1

