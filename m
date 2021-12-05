Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0E8A468CF4
	for <lists+linux-media@lfdr.de>; Sun,  5 Dec 2021 20:18:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237870AbhLETWG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Dec 2021 14:22:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237264AbhLETWG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Dec 2021 14:22:06 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EB86C061751
        for <linux-media@vger.kernel.org>; Sun,  5 Dec 2021 11:18:38 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 3DDEBC63C2; Sun,  5 Dec 2021 19:18:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1638731915; bh=SLVSiL/DXKFM+LKl0lLgz1wxSqmzRmMxKigJDU56mZk=;
        h=From:To:Subject:Date:From;
        b=YNmPSuAsCnLmZvdPxs3AHacFuSVgNEl1rm9IZlrYygyKrCQif/vQpdWzwKspkkGve
         Z396UTH+jCWZKYKEfrf8jFxWiI087S1yJHvDPKuUEzaceYQS+XopD1vOKXgRtp4kzm
         qLiw6/EpdWBB6bX7mnAyboioOixuu6Gs7Z3HHi/jINa7MIKa+HKiPkWrtwDUy73uFD
         COo24Ea8xHvL1C5bzTYFMdKJNSjQEekrWlz63z0UqfG34024BYYavkJpUL116fRUfm
         1av1+rN7YM0WPPiBB645oLVfo0goUEX4MKnibqEjWshD6oN50P0pnpo3bV4YoVN/Rt
         MXUGorAGmse9g==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/2] media: streamzap: remove unnecessary ir_raw_event_reset and handle
Date:   Sun,  5 Dec 2021 19:18:34 +0000
Message-Id: <8a5f192d46f6bf631feeec91f6942b568bac8c05.1638731886.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is no reason to have a reset after an IR timeout.
Calling ir_raw_event_handle() twice for the same interrupt has no
affect.

Fixes: 56b0ec30c4bc ("[media] rc/streamzap: fix reporting response times")

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/streamzap.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/rc/streamzap.c b/drivers/media/rc/streamzap.c
index 1cc5ebb85b6c..76f5c72501c4 100644
--- a/drivers/media/rc/streamzap.c
+++ b/drivers/media/rc/streamzap.c
@@ -244,8 +244,6 @@ static void streamzap_callback(struct urb *urb)
 				sz->idle = true;
 				if (sz->timeout_enabled)
 					sz_push(sz, rawir);
-				ir_raw_event_handle(sz->rdev);
-				ir_raw_event_reset(sz->rdev);
 			} else {
 				sz_push_full_space(sz, sz->buf_in[i]);
 			}
-- 
2.33.1

