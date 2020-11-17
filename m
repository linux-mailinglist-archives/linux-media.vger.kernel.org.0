Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72D892B5AE1
	for <lists+linux-media@lfdr.de>; Tue, 17 Nov 2020 09:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbgKQIU3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Nov 2020 03:20:29 -0500
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:56461 "EHLO
        cmccmta2.chinamobile.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbgKQIU3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Nov 2020 03:20:29 -0500
X-Greylist: delayed 550 seconds by postgrey-1.27 at vger.kernel.org; Tue, 17 Nov 2020 03:20:27 EST
Received: from spf.mail.chinamobile.com (unknown[172.16.121.17]) by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee65fb38597038-9abb3; Tue, 17 Nov 2020 16:11:03 +0800 (CST)
X-RM-TRANSID: 2ee65fb38597038-9abb3
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[10.42.68.12])
        by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee95fb38595c5d-51dec;
        Tue, 17 Nov 2020 16:11:03 +0800 (CST)
X-RM-TRANSID: 2ee95fb38595c5d-51dec
From:   Ding Xiang <dingxiang@cmss.chinamobile.com>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp: remove redundant NULL check of "params"
Date:   Tue, 17 Nov 2020 16:10:58 +0800
Message-Id: <20201117081058.673291-1-dingxiang@cmss.chinamobile.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The check result of (!A || (A && B)) is equivalent to (!A || B),
so remove redundant NULL check of "params"

Signed-off-by: Ding Xiang <dingxiang@cmss.chinamobile.com>
---
 drivers/staging/media/atomisp/pci/sh_css_params.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 24fc497bd491..9eb02f463eba 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -4649,10 +4649,8 @@ ia_css_dvs2_6axis_config_allocate(const struct ia_css_stream *stream)
 	params = stream->isp_params_configs;
 
 	/* Backward compatibility by default consider pipe as Video*/
-	if (!params || (params &&
-			!params->pipe_dvs_6axis_config[IA_CSS_PIPE_ID_VIDEO])) {
+	if (!params || !params->pipe_dvs_6axis_config[IA_CSS_PIPE_ID_VIDEO])
 		goto err;
-	}
 
 	dvs_config = kvcalloc(1, sizeof(struct ia_css_dvs_6axis_config),
 			      GFP_KERNEL);
-- 
2.28.0



