Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E32C42F49C4
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 12:21:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728132AbhAMLMU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 06:12:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728126AbhAMLMT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 06:12:19 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62D06C061794;
        Wed, 13 Jan 2021 03:11:39 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id i7so1273893pgc.8;
        Wed, 13 Jan 2021 03:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O2lyKnr22hhUPpXetJhQO1be4sEDYnPV91pq2a64nS4=;
        b=WCc2cSmh1/HAtrSeE3fS7o3q7edSXlxbkDEFscAtWV8E3lbQ4KsOgEQEWNoH9Hqhpc
         /cWsZufkwl8BBXyhZ2IpSTpoyEVegJUcporbNOEvm3xcxNWJyBmr5Gl7aFGOH18M0htk
         ApaOboMiOBCsaJOSJkj4aUZflO8ued9e7np0zjLbDVpk6+aHaxHJ9CWY4ucK2cyFXuds
         fcG6xe335OD8M97mv6XjucBFlaIr7d3Duiql4qzMj5oukgrF8z7woz5+336Fr2wCdgnz
         qZ3tNE3s08EfuIXCqw7iY55srPsT7tEuglnl9+vIoJ7U8X0ck3hkfANwHNGo0Bh9/T76
         X4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O2lyKnr22hhUPpXetJhQO1be4sEDYnPV91pq2a64nS4=;
        b=sjz6WFJP2qkpWfr4Y0yJzpTkpIq8H4kkGrMC4K9knDMpUr+AieV6X42e7X64bQ8D+L
         QXDjeuBI+dlyAsuXLRFi4Z9oiE3lSqkqZ4X66B6zmRKXtktUC1giBVpOie7aTlRYKLDR
         qjmvOWdsIdhir4fGKp8X9oQcm0rJj8BIcNj7E+q7KU07db0pUW6/qM7roE36BrWAJSl9
         OTIgqCltNVOnsrp43H5O4t/vcvpo4/xDr6QLK4ihcm+5FUD4NvjWXtNIM8FyIof4C2XG
         CHfQJTt0xP9QO3QcEqTYv/4Iz6rmH0yWm264XMILPVJH7iQCkMurJpuFW/Y9SoesHHe+
         9+3g==
X-Gm-Message-State: AOAM533e8Vi2Vb+5/e7fYAenf/qTAr9RE4PZgnC/HOkKfyI9xva5Xoeo
        KnzwlhPUq4/ChKWgpLl8xwGHOd2j6hhSvpHT
X-Google-Smtp-Source: ABdhPJyPF0Xy8RdIGT8687M41wVItB/eXfu7VrohRmnK3LZZglJYI2fFko8o7mOtpRFSfX8fHTYSXQ==
X-Received: by 2002:a63:4e44:: with SMTP id o4mr1671941pgl.46.1610536298837;
        Wed, 13 Jan 2021 03:11:38 -0800 (PST)
Received: from localhost.localdomain ([45.135.186.83])
        by smtp.gmail.com with ESMTPSA id gw21sm2351247pjb.28.2021.01.13.03.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 03:11:38 -0800 (PST)
From:   Dongliang Mu <mudongliangabcd@gmail.com>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, mudongliangabcd@gmail.com
Subject: [PATCH] Fix shift-out-of-bound in mceusb_process_ir_data
Date:   Wed, 13 Jan 2021 19:11:22 +0800
Message-Id: <20210113111122.1739478-1-mudongliangabcd@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The missing check of ir->buf_in[i+1] can lead to an shift-out-of-bound
in mceusb_handle_command or mceusb_dev_printdata. This patch adds a
check to limit its value lower than 16. The concrete report of UBSAN is
as follows.

UBSAN: shift-out-of-bounds in drivers/media/rc/mceusb.c:704:13
shift exponent 230 is too large for 32-bit type 'unsigned int'
CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.10.0-syzkaller #0
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x107/0x163 lib/dump_stack.c:120
 ubsan_epilogue+0xb/0x5a lib/ubsan.c:148
 __ubsan_handle_shift_out_of_bounds.cold+0xb1/0x181 lib/ubsan.c:395
 mceusb_dev_printdata.cold+0x19/0x1e drivers/media/rc/mceusb.c:704
 mceusb_process_ir_data drivers/media/rc/mceusb.c:1275 [inline]
 mceusb_dev_recv+0x3cb/0x1990 drivers/media/rc/mceusb.c:1376
 __usb_hcd_giveback_urb+0x2b0/0x5c0 drivers/usb/core/hcd.c:1657
 usb_hcd_giveback_urb+0x38c/0x430 drivers/usb/core/hcd.c:1728
 dummy_timer+0x11f4/0x32a0 drivers/usb/gadget/udc/dummy_hcd.c:1971

Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
 drivers/media/rc/mceusb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
index f9616158bcf4..755808c6e747 100644
--- a/drivers/media/rc/mceusb.c
+++ b/drivers/media/rc/mceusb.c
@@ -1272,6 +1272,8 @@ static void mceusb_process_ir_data(struct mceusb_dev *ir, int buf_len)
 		switch (ir->parser_state) {
 		case SUBCMD:
 			ir->rem = mceusb_cmd_datasize(ir->cmd, ir->buf_in[i]);
+			if (ir->buf_in[i+1] >= 16)
+				continue;
 			mceusb_dev_printdata(ir, ir->buf_in, buf_len, i - 1,
 					     ir->rem + 2, false);
 			if (i + ir->rem < buf_len)
-- 
2.25.1

