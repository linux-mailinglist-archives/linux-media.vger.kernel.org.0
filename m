Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2B93774A4
	for <lists+linux-media@lfdr.de>; Sun,  9 May 2021 02:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbhEIADH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 May 2021 20:03:07 -0400
Received: from mslow1.mail.gandi.net ([217.70.178.240]:42997 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbhEIADG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 May 2021 20:03:06 -0400
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id C2B76C192C
        for <linux-media@vger.kernel.org>; Sat,  8 May 2021 23:53:05 +0000 (UTC)
X-Originating-IP: 24.194.32.49
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 598A4FF809;
        Sat,  8 May 2021 23:52:43 +0000 (UTC)
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Subject: [PATCH 2/4] staging: media: atomisp: Remove unnecessary parens in sh_css.c
Date:   Sat,  8 May 2021 19:56:20 -0400
Message-Id: <20210508235622.300394-3-vrzh@vrzh.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210508235622.300394-1-vrzh@vrzh.net>
References: <20210508235622.300394-1-vrzh@vrzh.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove unnecessary parenthesis.

Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 53c1001b807b..51fe939a8958 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -10162,7 +10162,7 @@ ia_css_stop_sp(void)
 		timeout--;
 		udelay(1);
 	}
-	if ((ia_css_spctrl_get_state(SP0_ID) != IA_CSS_SP_SW_TERMINATED))
+	if (ia_css_spctrl_get_state(SP0_ID) != IA_CSS_SP_SW_TERMINATED)
 		IA_CSS_WARNING("SP has not terminated (SW)");
 
 	if (timeout == 0) {
-- 
2.31.1

