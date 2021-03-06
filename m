Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35C7F32FAF8
	for <lists+linux-media@lfdr.de>; Sat,  6 Mar 2021 14:57:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230489AbhCFN5B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Mar 2021 08:57:01 -0500
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:10943 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230481AbhCFN4k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 6 Mar 2021 08:56:40 -0500
X-IronPort-AV: E=Sophos;i="5.81,228,1610406000"; 
   d="scan'208";a="496488757"
Received: from palace.lip6.fr ([132.227.105.202])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-SHA; 06 Mar 2021 14:56:38 +0100
From:   Julia Lawall <Julia.Lawall@inria.fr>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: flexcop-usb: delete unneeded return
Date:   Sat,  6 Mar 2021 14:42:25 +0100
Message-Id: <20210306134225.1659307-1-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

No need for a return after a break;

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/media/usb/b2c2/flexcop-usb.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/usb/b2c2/flexcop-usb.c b/drivers/media/usb/b2c2/flexcop-usb.c
index e731243267e4..01d22834f4ac 100644
--- a/drivers/media/usb/b2c2/flexcop-usb.c
+++ b/drivers/media/usb/b2c2/flexcop-usb.c
@@ -195,7 +195,6 @@ static int flexcop_usb_memory_req(struct flexcop_usb *fc_usb,
 		break;
 	default:
 		return -EINVAL;
-		break;
 	}
 	for (i = 0; i < len;) {
 		pagechunk =

