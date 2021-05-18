Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8326D38775A
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 13:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231185AbhERLXJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 07:23:09 -0400
Received: from mail-m121144.qiye.163.com ([115.236.121.144]:58306 "EHLO
        mail-m121144.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231147AbhERLW4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 07:22:56 -0400
X-Greylist: delayed 573 seconds by postgrey-1.27 at vger.kernel.org; Tue, 18 May 2021 07:22:55 EDT
Received: from Wanjb.localdomain (unknown [36.152.145.182])
        by mail-m121144.qiye.163.com (Hmail) with ESMTPA id 8DBC5AC0516;
        Tue, 18 May 2021 19:11:57 +0800 (CST)
From:   Wan Jiabing <wanjiabing@vivo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiabing Wan <kael_w@yeah.net>,
        Wan Jiabing <wanjiabing@vivo.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media: atomisp: Align block comments
Date:   Tue, 18 May 2021 19:11:12 +0800
Message-Id: <20210518111125.87304-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZQ0MZS1ZITU4eSktITkpDS09VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
        hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Oj46HQw5Kj8VLysUTA0sHBxN
        EzhPCT5VSlVKTUlKSEhNSEpDSUpCVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
        TVVKTklVSk9OVUpDSVlXWQgBWUFJS0xONwY+
X-HM-Tid: 0a797f2cdf88b039kuuu8dbc5ac0516
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jiabing Wan<kael_w@yeah.net>

Fixing the following checkpatch warning:
WARNING: Block comments should align the * on each line

Signed-off-by: Jiabing Wan<kael_w@yeah.net>
---
 .../atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h
index be3534e46c15..9b22f2da45d5 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h
@@ -17,8 +17,8 @@
 #define __IA_CSS_ANR_TYPES_H
 
 /* @file
-* CSS-API header file for Advanced Noise Reduction kernel v1
-*/
+ * CSS-API header file for Advanced Noise Reduction kernel v1
+ */
 
 /* Application specific DMA settings  */
 #define ANR_BPP                 10
-- 
2.20.1

