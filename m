Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 782D039F34A
	for <lists+linux-media@lfdr.de>; Tue,  8 Jun 2021 12:15:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbhFHKRQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 06:17:16 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:33430 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229626AbhFHKRP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Jun 2021 06:17:15 -0400
X-UUID: 968a5aa102434385859ef1fc8cbb58a1-20210608
X-UUID: 968a5aa102434385859ef1fc8cbb58a1-20210608
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
        (envelope-from <lecopzer.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 939033216; Tue, 08 Jun 2021 18:15:20 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 18:15:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Jun 2021 18:15:11 +0800
From:   Lecopzer Chen <lecopzer.chen@mediatek.com>
To:     <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <yj.chiang@mediatek.com>,
        Lecopzer Chen <lecopzer.chen@mediatek.com>
Subject: [PATCH] media: Kconfig: Fix DVB_CORE can't be selected as module
Date:   Tue, 8 Jun 2021 18:14:51 +0800
Message-ID: <20210608101451.9301-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The DVB_CORE now depends on MEDIA_DIGITAL_TV_SUPPORT and
default MEDIA_DIGITAL_TV_SUPPORT, and this makes it can never be =m
since the type of MEDIA_DIGITAL_TV_SUPPORT is bool.

Change MEDIA_DIGITAL_TV_SUPPORT to tristate so it's possible to set
DVB_CORE as =m.

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

