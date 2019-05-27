Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C8402B87B
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 17:40:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbfE0PkT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 May 2019 11:40:19 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54054 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbfE0PkT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 May 2019 11:40:19 -0400
Received: by mail-wm1-f67.google.com with SMTP id d17so3313188wmb.3
        for <linux-media@vger.kernel.org>; Mon, 27 May 2019 08:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=if0dvOxPFZMTRCUDLGJXrtErSrV3TkkgDXw6lswOXKw=;
        b=s58oswTZuPdQpVM4Q7/Nsea1m3OZ9oxj+fLPudJzrZ6kzqbwJbwFcGBiSGW1WNimcj
         IwaLUrHH8eP35Evfuci/mq07T9GEPI7Um6iWeD/Nquc6qfg10wABNiLBqeTiBjrvFzML
         R+m2GduUou731CTsT0O4dVHTlobXYnYC9vQfrRD7p+jqcuyjq/NolFTFRRgRcteE2H1+
         NsBqDFj04si/R8WRIA94I/T5vfyjQn06IHHRdtadt1vH9O4cwqqrOuwhYpeFROuh4lwQ
         LMIegnzrJJB3D1OWSkMm9SkuB3mpFuIWMVGf8ZQWTrpYQmLkUBnq7eI6EFUoueP2dJyC
         wniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=if0dvOxPFZMTRCUDLGJXrtErSrV3TkkgDXw6lswOXKw=;
        b=Cd4EFs+gvOZ9v8WBq2X4Xit3yUEAArmzZRwM+gKkaj0YyLHDUG9ExGWN85rI13jg0m
         o82Rz2eyTGekQ36guMnpB2/L9cd4hoNwhFYFVhMQuG41sn0Yuo7hPryhUbGLmFjwd1Ts
         pnwvVi95u7eZBGFoFiCVDPSbGYFPt2XkevHsDBHSlum6oTZTRUtTgYpj2Cnp5jlBEEC9
         lkWVV6Igg8AhGRWbBrsQtes4YhIncbs3FH48BHaKS5P3CgfpD+fKlEc+pDCBPrgLmwDt
         LVZpeR+pW4p+xr372pw+AMRyLmkVY516m7U8czt+nvSPJ0/VtaTLyoORI6+i5MItjV15
         uWZA==
X-Gm-Message-State: APjAAAXkPK6RzAw063lKeB3HMRZHOKId9Hqm969Jxhu/whs1+MixOOt+
        grimTJTqYWZtjy6YrizZb0oCJoa1c5o=
X-Google-Smtp-Source: APXvYqyzWNVUholum0COSzgfMq6oO+Q+SFaJDTh2QcqMkldrbsSgPu/5a77hS320h8e2T+E36WxOjA==
X-Received: by 2002:a1c:9dc7:: with SMTP id g190mr26063379wme.121.1558971616866;
        Mon, 27 May 2019 08:40:16 -0700 (PDT)
Received: from localhost.localdomain ([37.157.136.206])
        by smtp.gmail.com with ESMTPSA id b2sm10125744wrt.20.2019.05.27.08.40.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 08:40:16 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH] venus: hfi_parser: fix a regression in parser
Date:   Mon, 27 May 2019 18:39:48 +0300
Message-Id: <20190527153948.3432-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This fixes the following data abort:

 Unable to handle kernel paging request at virtual address 0000078000000040
 Mem abort info:
   ESR = 0x96000004
   Exception class = DABT (current EL), IL = 32 bits
   SET = 0, FnV = 0
   EA = 0, S1PTW = 0
 Data abort info:
   ISV = 0, ISS = 0x00000004
   CM = 0, WnR = 0
 user pgtable: 4k pages, 48-bit VAs, pgdp = (____ptrval____)
 [0000078000000040] pgd=0000000000000000
 Internal error: Oops: 96000004 [#1] PREEMPT SMP
 Process irq/28-venus (pid: 292, stack limit = 0x(____ptrval____))
 CPU: 0 PID: 292 Comm: irq/28-venus Not tainted 5.2.0-rc1+ #60
 Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
 pstate: 60000005 (nZCv daif -PAN -UAO)
 pc : __memcpy+0x100/0x180
 lr : parse_caps+0x94/0xc0 [venus_core]
 sp : ffff0000114e3990
 x29: ffff0000114e3990 x28: ffff80003a7d0148
 x27: 00000000000df018 x26: ffff000008bd4618
 x25: 0000000000020003 x24: 0000078000000040
 x23: 0000000000000002 x22: 0000000000000002
 x21: ffff80003b9b8080 x20: 0000000000000008
 x19: ffff000010f59000 x18: 0000000000000000
 x17: 0000000000000000 x16: ffff80003c0f9b80
 x15: 0000000000000000 x14: 0100000100000002
 x13: 000000010020100b x12: 000000010000100a
 x11: 0000100000000040 x10: 0000100000000004
 x9 : 0000000000000000 x8 : ffff0000114e3bd8
 x7 : 0000000000000000 x6 : ffff0000114e39d8
 x5 : 0000000000000040 x4 : 0000000000000000
 x3 : 0000000000000010 x2 : 0000000000000000
 x1 : 0000078000000040 x0 : ffff0000114e39d8
 Call trace:
  __memcpy+0x100/0x180
  hfi_parser+0x23c/0x3b8 [venus_core]
  hfi_session_init_done+0x40/0x60 [venus_core]
  hfi_process_msg_packet+0xd4/0x1d8 [venus_core]
  venus_isr_thread+0x1e0/0x230 [venus_core]
  hfi_isr_thread+0x18/0x20 [venus_core]
  irq_thread_fn+0x28/0x78
  irq_thread+0x124/0x1c0
  kthread+0x124/0x128
  ret_from_fork+0x10/0x18
 Code: d503201f d503201f d503201f d503201f (a8c12027)
 ---[ end trace fd253ebaeea05ffc ]---
 genirq: exiting task "irq/28-venus" (292) is an active IRQ thread (irq 28)

by modifying structure members to flexible array members.

Fixes: ded716267196862809e5926072adc962a611a1e3 media: hfi_parser: don't trick gcc with a wrong expected size
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_helper.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index 34ea503a9842..a2b95ff79c4a 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -569,7 +569,7 @@ struct hfi_capability {
 
 struct hfi_capabilities {
 	u32 num_capabilities;
-	struct hfi_capability *data;
+	struct hfi_capability data[];
 };
 
 #define HFI_DEBUG_MSG_LOW	0x01
@@ -726,7 +726,7 @@ struct hfi_profile_level {
 
 struct hfi_profile_level_supported {
 	u32 profile_count;
-	struct hfi_profile_level *profile_level;
+	struct hfi_profile_level profile_level[];
 };
 
 struct hfi_quality_vs_speed {
-- 
2.17.1

