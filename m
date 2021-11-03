Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59A5A443DE3
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 08:57:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbhKCIAK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Nov 2021 04:00:10 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:46068 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231393AbhKCIAH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Nov 2021 04:00:07 -0400
X-UUID: 111caf1cd817452eb3e8cef6653baa56-20211103
X-UUID: 111caf1cd817452eb3e8cef6653baa56-20211103
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
        (envelope-from <lecopzer.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 663423507; Wed, 03 Nov 2021 15:57:18 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Nov 2021 15:57:17 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkexhb01.mediatek.inc (172.21.101.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Nov 2021 15:57:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs10n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 3 Nov 2021 15:57:17 +0800
From:   Lecopzer Chen <lecopzer.chen@mediatek.com>
To:     <linux-media@vger.kernel.org>
CC:     <mchehab@kernel.org>, <yj.chiang@mediatek.com>,
        <linux-kernel@vger.kernel.org>, <hverkuil@xs4all.nl>,
        Lecopzer Chen <lecopzer.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2] media: Kconfig: Make DVB_CORE=m possible when MEDIA_SUPPORT=y
Date:   Wed, 3 Nov 2021 15:57:10 +0800
Message-ID: <20211103075710.9780-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A case in Android GKI set MEDIA_SUPPORT to y but we need DVB_CORE=m,
and this doesn't work since DVB_CORE is default MEDIA_DIGITAL_TV_SUPPORT
and then follows MEDIA_SUPPORT.

Change to tristate to make DVB_CORE=m possible when MEDIA_SUPPORT=y

Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index b07812657cee..f2d1d7fdcea1 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -179,7 +179,7 @@ config MEDIA_CONTROLLER
 #
 
 config DVB_CORE
-	tristate
+	tristate "DVB core"
 	depends on MEDIA_DIGITAL_TV_SUPPORT
 	depends on (I2C || I2C=n)
 	default MEDIA_DIGITAL_TV_SUPPORT
-- 
2.18.0

