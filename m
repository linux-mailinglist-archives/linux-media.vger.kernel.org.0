Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A4F94223E9
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 12:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234220AbhJEKxQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 06:53:16 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:49918 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S233919AbhJEKxO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 06:53:14 -0400
X-UUID: 418e6dbd2e5348fdb2053d940f40cd39-20211005
X-UUID: 418e6dbd2e5348fdb2053d940f40cd39-20211005
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <lecopzer.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 686552742; Tue, 05 Oct 2021 18:51:20 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Oct 2021 18:51:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 5 Oct 2021 18:51:19 +0800
From:   Lecopzer Chen <lecopzer.chen@mediatek.com>
To:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <yj.chiang@mediatek.com>,
        Lecopzer Chen <lecopzer.chen@mediatek.com>
Subject: [PATCH] media: Kconfig: Make DVB_CORE=m possible when MEDIA_SUPPORT=y
Date:   Tue, 5 Oct 2021 18:51:10 +0800
Message-ID: <20211005105110.14082-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A case that we need VIDEO_DEV=y but DVB_CORE=m, and this doesn't
work since DVB_CORE is default MEDIA_DIGITAL_TV_SUPPORT and then
follows MEDIA_SUPPORT.

Change to tristate to make DVB_CORE=m possible when MEDIA_SUPPORT=y

Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
---
 drivers/media/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index b07812657cee..c3baf92b4d02 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -88,7 +88,7 @@ config MEDIA_ANALOG_TV_SUPPORT
 		will disable support for them.
 
 config MEDIA_DIGITAL_TV_SUPPORT
-	bool
+	tristate
 	prompt "Digital TV" if MEDIA_SUPPORT_FILTER
 	default y if !MEDIA_SUPPORT_FILTER
 	help
-- 
2.18.0

