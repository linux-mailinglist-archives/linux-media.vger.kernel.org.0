Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69422AB3BC
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 10:11:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731067AbfIFILg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 04:11:36 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:58450 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbfIFILg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Sep 2019 04:11:36 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1i69LB-0005py-VI; Fri, 06 Sep 2019 08:11:34 +0000
From:   Colin King <colin.king@canonical.com>
To:     Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: s3c-camif: make array 'registers' static const, makes object smaller
Date:   Fri,  6 Sep 2019 09:11:33 +0100
Message-Id: <20190906081133.22543-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array 'registers' on the stack but instead make it
static const. Makes the object code smaller by 45 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  17364	   5000	      0	  22364	   575c	platform/s3c-camif/camif-regs.o

After:
   text	   data	    bss	    dec	    hex	filename
  17255	   5064	      0	  22319	   572f	platform/s3c-camif/camif-regs.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/platform/s3c-camif/camif-regs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/s3c-camif/camif-regs.c b/drivers/media/platform/s3c-camif/camif-regs.c
index 1a65532dc36d..e80204f5720c 100644
--- a/drivers/media/platform/s3c-camif/camif-regs.c
+++ b/drivers/media/platform/s3c-camif/camif-regs.c
@@ -553,7 +553,7 @@ void camif_hw_disable_capture(struct camif_vp *vp)
 
 void camif_hw_dump_regs(struct camif_dev *camif, const char *label)
 {
-	struct {
+	static const struct {
 		u32 offset;
 		const char * const name;
 	} registers[] = {
-- 
2.20.1

