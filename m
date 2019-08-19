Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45A6391DF3
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 09:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbfHSHf5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 03:35:57 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:42301 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbfHSHf4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 03:35:56 -0400
Received: by mail-pl1-f196.google.com with SMTP id y1so550305plp.9
        for <linux-media@vger.kernel.org>; Mon, 19 Aug 2019 00:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mz5277Wf7QmhodaejrUdoJlivd192UtE+H2UxO076Qg=;
        b=ZUzWLF0fwZBvb1DvizQJ+xFAJpomvlUTipCUnlVZ9WXPUoUVZzmuPT0bDBMiJ+mYxo
         oPBc+JVk6lc2fc/wYDtTNI1ILBLFZ7Gp1/7feHxuWc9mzgdiwNT5cMTZj7MupiQ1/I3z
         YxgyYj6olD4hz02tkdvTAVjTjA1+A9sogRTPIo1hmkHI4drIPoX+siMAV02e2eS66B8g
         spSTuS7hHyrH0UHVOHMRVW0B9luUVfl2/P58SqZ/y8euPxBSgr+XaqNM7fm2AA9vQ111
         4HgcnKG22dWlUB1KzVb1WiteybSg7TdNkgfieiJHd/ft8QpLSYYnxdV+xTyvKOqiHsxc
         Ea/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mz5277Wf7QmhodaejrUdoJlivd192UtE+H2UxO076Qg=;
        b=tXMxVu0rLGJ0iAf+jwNivs/9j8Stk8N32j532lXz+pZvlwO+Rz4vqd2fA0PtCkIXFA
         xJpPwxaeLy5A+4C4huttRRNLH3YhdwL+dcxZgGzDbOmA4UZCCZjUFI7MOgltlTGPn47r
         IwQEzFPzE2NdHe4dJx8VcV0IRG5OlMt3b2KSSXJJ8HyFSA0OGhX6qWBP+Djn1Cqy59MI
         pXWidDvkzZWDqXsYmtpesbNTwtA226m3cCpWT2HzZfdRsGDf/ZW84FWFDlPBSRH9Skfg
         Fz922ao+wepZiph3aPwRHhkpzn6aPbwGMPtgx3McUhqpLYTBZpcu5H10LhDK7BLhSe8B
         Y4hw==
X-Gm-Message-State: APjAAAXOFZEc4F8Z7zvsX23RRf+o8UG0bzgqT4tNaGIfBBsMRC/QRw2R
        ttKuoc7GYmTLZks7todFpiQ=
X-Google-Smtp-Source: APXvYqzNbEkVLWjtJOq4fgg2yOim2wWOxUvsrX4OXV0pu7JJEYCt/6M+fIerrItEnpZ5l20h0uXySg==
X-Received: by 2002:a17:902:bb81:: with SMTP id m1mr21458710pls.125.1566200156309;
        Mon, 19 Aug 2019 00:35:56 -0700 (PDT)
Received: from localhost.localdomain ([110.225.16.165])
        by smtp.gmail.com with ESMTPSA id f205sm23424987pfa.161.2019.08.19.00.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 00:35:55 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] media: dvb-bt8xx: Make variable dst_config constant
Date:   Mon, 19 Aug 2019 13:05:42 +0530
Message-Id: <20190819073542.32072-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Static structure dst_config, of type dst_config, is not used except to
be assigned as the value of field state of a variable having type
dst_state *. In the definition of dst_state, field config is declared as
const. Hence dst_config, when assigned to config, cannot be modified.
Therefore, make dst_config const as well.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/media/pci/bt8xx/dvb-bt8xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/bt8xx/dvb-bt8xx.c b/drivers/media/pci/bt8xx/dvb-bt8xx.c
index 64df9d491941..02ebd43e672e 100644
--- a/drivers/media/pci/bt8xx/dvb-bt8xx.c
+++ b/drivers/media/pci/bt8xx/dvb-bt8xx.c
@@ -393,7 +393,7 @@ static struct mt352_config advbt771_samsung_tdtc9251dh0_config = {
 	.demod_init = advbt771_samsung_tdtc9251dh0_demod_init,
 };
 
-static struct dst_config dst_config = {
+static const struct dst_config dst_config = {
 	.demod_address = 0x55,
 };
 
-- 
2.19.1

