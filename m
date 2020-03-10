Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51E65180A17
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 22:13:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgCJVNx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 17:13:53 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:42555 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbgCJVNx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 17:13:53 -0400
Received: by mail-qk1-f193.google.com with SMTP id e11so24243qkg.9
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2020 14:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=u0MvnR+V9KVIsJGYMsf2KRY3H3EbUNJYzlAPYArXW1c=;
        b=W0V5R9pXO8qlSebx63NXA/S6wtFfNFipyqGpNyicH5qrx4/0OtsFH4v1dwYGuAM/r6
         BS3RdafDpGZktu90O2dPtm3yPXamQbRQhQPCh01+L98QOcxpClmiPy80EnLvYeE2Yfyl
         PAtoPlJmsd+AYUR3bZ29fYm7v1O6YY+Uisnl7HTOqkGRvGTEDBkpMJLISllbwy5q9HPK
         tGOQ/HcpWX2jafUI/nzOekA5wpAC0SfjsRCq5/Ng59XOSLlvSmP0pQhlDbwzwGq6ZDOz
         nWzNnRMmXtbuHvADlXiRk98jvw5WJSSjMZs7MKHRw5hCR3gPPbP525ZpzyHVx4t9VFFk
         4Vwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=u0MvnR+V9KVIsJGYMsf2KRY3H3EbUNJYzlAPYArXW1c=;
        b=hOT+AL2Sc964KFlFetn2PJpjqdncudrEX4IFtarBcwWzr+m9itrabN8ZEfAdGsB9jw
         Y9aCuyYlMCykBSoVFxt8l93JIRw+wE89mKHmq6VK6ZhDdBb+h0OvCNEtEw3r2x+iVJ3a
         5acrEQOmcTWVXP5wKND5Cejo9I+HApb+q1Ik8Cp2jacw2f0Dcj17a0rN8pDgm2wtK+rD
         vc2FUN1Tr6fckonQnXCRv7mAovQhh3Ujq3LHeSpH6cnpXHLuck87NT2L8mr0pEVRKLKD
         /cilGLw/n+GbOWGwNCDY7VqBNEqrnpInR6EnGDKajc+y7Isb1FEt1tizPOtTvLp3cOMe
         bMGw==
X-Gm-Message-State: ANhLgQ39UpxbQEkUDsXOv10u2Ytu7sm9tvj1OlM/+qEilGy/eLc7GitE
        9SCplM85FJ7FCHdvuCWdMhKZTRLxOjJHqg==
X-Google-Smtp-Source: ADFU+vtYgu2V6tmdm1vYm2C5c2xCIc1VCBHP0jhA2s7HW6X0rI0E3ju7J68jC9lmYHBUxTZH7+2o7w==
X-Received: by 2002:ae9:c003:: with SMTP id u3mr21685920qkk.337.1583874830948;
        Tue, 10 Mar 2020 14:13:50 -0700 (PDT)
Received: from DESKTOP-JC0RTV5.neu.edu ([155.33.132.17])
        by smtp.gmail.com with ESMTPSA id 10sm3966937qtt.65.2020.03.10.14.13.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 10 Mar 2020 14:13:50 -0700 (PDT)
From:   Changming Liu <charley.ashbringer@gmail.com>
To:     prabhakar.csengg@gmail.com
Cc:     linux-media@vger.kernel.org,
        Changming Liu <charley.ashbringer@gmail.com>
Subject: [PATCH] Signed-off-by: Changming Liu <charley.ashbringer@gmail.com>
Date:   Tue, 10 Mar 2020 17:13:20 -0400
Message-Id: <1583874800-23105-1-git-send-email-charley.ashbringer@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

media: am437x-vpfe: exclude illegal values for enum when validing params from user space

When calling ccdc_data_size_max_bit() to validate data_sz in vpfe_ccdc_validate_param(), it's treated
as an enumeration ranging from 0 to 7 while essentially it's an 32 bit unsigned integer directly from
user space. This can make the return value of ccdc_data_size_max_bit() underflow and bypass the
following check.

To fix this, an additional check is added to the following if clause to keep this enumaration
variable in range. And if its value is not legal, return -EINVAL properly.

Signed-off-by: Changming Liu <charley.ashbringer@gmail.com>
---
 drivers/media/platform/am437x/am437x-vpfe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index 0910430..190d1a6 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -285,6 +285,7 @@ vpfe_ccdc_validate_param(struct vpfe_ccdc *ccdc,
 	max_data = ccdc_data_size_max_bit(ccdcparam->data_sz);
 
 	if (ccdcparam->alaw.gamma_wd > VPFE_CCDC_GAMMA_BITS_09_0 ||
+	    ccdcparam->data_sz > VPFE_CCDC_DATA_8BITS ||
 	    max_gamma > max_data) {
 		vpfe_dbg(1, vpfe, "Invalid data line select\n");
 		return -EINVAL;
-- 
2.7.4

