Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6129F40F6D2
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 13:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242024AbhIQLuz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 07:50:55 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:48114
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240718AbhIQLuy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 07:50:54 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id E0DF13F234;
        Fri, 17 Sep 2021 11:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631879371;
        bh=o1svmj9FW/O2TpubDpCCd4h+o8vOHM4Lf/k/ntltkBU=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=TSh3v888gsqV6LgYPkJE5Vaus/eAXBbSz7yjRySiVtJGM296jgVE1E+f/PtzRSd6B
         nsMJ/0pedoPcNB8UIRHMImuR7EZwIpRLn0A4r1fODbMgRZjWI7xkd1ZOvt/hVld7uk
         N9PZIo2Vt5ICKhaY0ZoQxQsp5vwbYFUAAo5IrdzdaDjkGGYdOMdsWgJikMGLqMl2SQ
         lg9jPIFuuDUldswHMj3DtaWlspoBN18R8MRZAdqYj25f9lRSiOtKp5YjZWnPegdZrS
         1TzvXKUdpuJJFWGbWos+L3ssb9MfAKr58l0jaIehyfms7rsHkXfRuFuRhqaAfrot3x
         IOxt9JZNt6x4A==
From:   Colin King <colin.king@canonical.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: uvcvideo: Fix memory leak of object map on error exit path
Date:   Fri, 17 Sep 2021 12:49:30 +0100
Message-Id: <20210917114930.47261-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently when the allocation of map->name fails the error exit path
does not kfree the previously allocated object map. Fix this by
setting ret to -ENOMEM and taking the free_map exit error path to
ensure map is kfree'd.

Addresses-Coverity: ("Resource leak")
Fixes: 07adedb5c606 ("media: uvcvideo: Use control names from framework")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index f4e4aff8ddf7..711556d13d03 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -44,8 +44,10 @@ static int uvc_ioctl_ctrl_map(struct uvc_video_chain *chain,
 	if (v4l2_ctrl_get_name(map->id) == NULL) {
 		map->name = kmemdup(xmap->name, sizeof(xmap->name),
 				    GFP_KERNEL);
-		if (!map->name)
-			return -ENOMEM;
+		if (!map->name) {
+			ret = -ENOMEM;
+			goto free_map;
+		}
 	}
 	memcpy(map->entity, xmap->entity, sizeof(map->entity));
 	map->selector = xmap->selector;
-- 
2.32.0

