Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7586B591E6
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 05:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbfF1DTO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 23:19:14 -0400
Received: from out1.zte.com.cn ([202.103.147.172]:37142 "EHLO mxct.zte.com.cn"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726565AbfF1DTO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 23:19:14 -0400
Received: from mse-fl1.zte.com.cn (unknown [10.30.14.238])
        by Forcepoint Email with ESMTPS id 09FD3A5B0E6363CF63DF;
        Fri, 28 Jun 2019 11:03:35 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
        by mse-fl1.zte.com.cn with ESMTP id x5S32eB2063726;
        Fri, 28 Jun 2019 11:02:40 +0800 (GMT-8)
        (envelope-from wen.yang99@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
          by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
          with ESMTP id 2019062811031183-1800720 ;
          Fri, 28 Jun 2019 11:03:11 +0800 
From:   Wen Yang <wen.yang99@zte.com.cn>
To:     linux-kernel@vger.kernel.org
Cc:     wang.yi59@zte.com.cn, Wen Yang <wen.yang99@zte.com.cn>,
        Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 3/3] media: ti-vpe: fix leaked of_node references
Date:   Fri, 28 Jun 2019 11:01:16 +0800
Message-Id: <1561690876-20977-4-git-send-email-wen.yang99@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1561690876-20977-1-git-send-email-wen.yang99@zte.com.cn>
References: <1561690876-20977-1-git-send-email-wen.yang99@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release 8.5.3FP6|November
 21, 2013) at 2019-06-28 11:03:11,
        Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2019-06-28 11:02:45,
        Serialize complete at 2019-06-28 11:02:45
X-MAIL: mse-fl1.zte.com.cn x5S32eB2063726
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The call to of_get_parent returns a node pointer with refcount
incremented thus it must be explicitly decremented after the last
usage.

Detected by coccinelle with the following warnings:
drivers/media/platform/ti-vpe/cal.c:1621:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 1607, but without a corresponding object release within this function.

Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: Benoit Parrot <bparrot@ti.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/media/platform/ti-vpe/cal.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 9e86d761..8e19974 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1613,6 +1613,7 @@ of_get_next_port(const struct device_node *parent,
 			}
 			prev = port;
 		} while (!of_node_name_eq(port, "port"));
+		of_node_put(ports);
 	}
 
 	return port;
-- 
2.9.5

