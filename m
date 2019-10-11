Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15D7DD4140
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2019 15:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728446AbfJKN3p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Oct 2019 09:29:45 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:41710 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728392AbfJKN3p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Oct 2019 09:29:45 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1iIuzF-0001UG-3u; Fri, 11 Oct 2019 13:29:41 +0000
From:   Colin King <colin.king@canonical.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: ti-vpe: vpe: use r2y instead of y2r, copy-paste error
Date:   Fri, 11 Oct 2019 14:29:40 +0100
Message-Id: <20191011132940.8995-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There appears to be a copy-paste error on the access of
csc_coeffs.y2r.r601.full.coeff, I believe csc_coeffs.2yr.r601.full.coeff
should be used instead. This is a moot point as the code is never
reached, but at least use the correct structure element.

Addresses-Coverity: ("Copy-paste error")
Fixes: 3ff3a712a9ea ("media: ti-vpe: vpe: don't rely on colorspace member for conversion")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/platform/ti-vpe/csc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/csc.c b/drivers/media/platform/ti-vpe/csc.c
index bd923bee4a31..834114a4eebe 100644
--- a/drivers/media/platform/ti-vpe/csc.c
+++ b/drivers/media/platform/ti-vpe/csc.c
@@ -238,7 +238,7 @@ void csc_set_coeff(struct csc_data *csc, u32 *csc_reg0,
 				coeff = csc_coeffs.r2y.r709.limited.coeff;
 		} else {
 			/* Should never reach this, but it keeps gcc happy */
-			coeff = csc_coeffs.y2r.r601.full.coeff;
+			coeff = csc_coeffs.r2y.r601.full.coeff;
 		}
 	} else {
 		*csc_reg5 |= CSC_BYPASS;
-- 
2.20.1

