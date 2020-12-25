Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD8102E2A7B
	for <lists+linux-media@lfdr.de>; Fri, 25 Dec 2020 09:48:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728983AbgLYIrd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Dec 2020 03:47:33 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:57618 "EHLO cstnet.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725863AbgLYIrc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Dec 2020 03:47:32 -0500
Received: from localhost.localdomain (unknown [124.16.141.241])
        by APP-03 (Coremail) with SMTP id rQCowADXTPj9pOVfX+OnAA--.33235S2;
        Fri, 25 Dec 2020 16:38:21 +0800 (CST)
From:   Xu Wang <vulab@iscas.ac.cn>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp: Remove redundant NULL check
Date:   Fri, 25 Dec 2020 08:38:18 +0000
Message-Id: <20201225083818.64588-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: rQCowADXTPj9pOVfX+OnAA--.33235S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF13uw1xuFW7KrW7Ww1kuFg_yoW8JFW3pa
        y8Z3W7G3yUXF1jyrsrXws7ZFW5AayftF1UKa4q93WfCw13t3WfZF1akF15JF1rtw45W3y5
        Z3WrXrW3Ww1qyFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkIb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8Jr0_Cr
        1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_GFyl42xK
        82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
        C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
        MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
        IF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
        x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8ZZ23UUUUU==
X-Originating-IP: [124.16.141.241]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgcBA10Te3q+NAAAsG
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix warnings reported by coccicheck:
./drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c:159:4-10: WARNING: NULL check before some freeing functions is not needed.

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 .../media/atomisp/pci/runtime/isp_param/src/isp_param.c        | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
index e861777385a0..823ec54b6281 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
@@ -155,8 +155,7 @@ ia_css_isp_param_destroy_isp_parameters(
 
 	for (mem = 0; mem < IA_CSS_NUM_MEMORIES; mem++) {
 		for (pclass = 0; pclass < IA_CSS_NUM_PARAM_CLASSES; pclass++) {
-			if (mem_params->params[pclass][mem].address)
-				kvfree(mem_params->params[pclass][mem].address);
+			kvfree(mem_params->params[pclass][mem].address);
 			if (css_params->params[pclass][mem].address)
 				hmm_free(css_params->params[pclass][mem].address);
 			mem_params->params[pclass][mem].address = NULL;
-- 
2.17.1

