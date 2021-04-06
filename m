Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32B92354F2E
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 10:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244668AbhDFI5U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 04:57:20 -0400
Received: from mail-m17637.qiye.163.com ([59.111.176.37]:32296 "EHLO
        mail-m17637.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244667AbhDFI5S (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Apr 2021 04:57:18 -0400
Received: from wanjb-virtual-machine.localdomain (unknown [36.152.145.182])
        by mail-m17637.qiye.163.com (Hmail) with ESMTPA id CDEFE980154;
        Tue,  6 Apr 2021 16:57:05 +0800 (CST)
From:   Wan Jiabing <wanjiabing@vivo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Wan Jiabing <wanjiabing@vivo.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     kael_w@yeah.net
Subject: [PATCH] cx231xx/cx231xx.h: Remove repeated struct declaration
Date:   Tue,  6 Apr 2021 16:56:52 +0800
Message-Id: <20210406085657.645848-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZS0NIT09KTUpOHhpDVkpNSkxNQkJPSU1LQ09VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MjY6MBw*HD8ITy0xLStPCCFI
        Og8aCzBVSlVKTUpMTUJCT0lNSE1KVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
        TVVKTklVSk9OVUpDSVlXWQgBWUFKTkpONwY+
X-HM-Tid: 0a78a6664ec0d992kuwscdefe980154
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

struct cx231xx is declared at 146th line.
The declaration here is unnecessary. Remove it.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/media/usb/cx231xx/cx231xx.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx.h b/drivers/media/usb/cx231xx/cx231xx.h
index b32eab641793..6929e4d97067 100644
--- a/drivers/media/usb/cx231xx/cx231xx.h
+++ b/drivers/media/usb/cx231xx/cx231xx.h
@@ -425,8 +425,6 @@ struct cx231xx_audio {
 	u16 end_point_addr;
 };
 
-struct cx231xx;
-
 /*****************************************************************/
 /* set/get i2c */
 /* 00--1Mb/s, 01-400kb/s, 10--100kb/s, 11--5Mb/s */
-- 
2.25.1

