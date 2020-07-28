Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D023230689
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 11:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728247AbgG1J2t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 05:28:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727845AbgG1J2s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 05:28:48 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D15BC061794;
        Tue, 28 Jul 2020 02:28:47 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id i92so2767946pje.0;
        Tue, 28 Jul 2020 02:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y5s9edaIzkddCgobfmY3uqcn7wmzvnyo8IQdQIisAEg=;
        b=ms8WzW9fy2JOJRlxGxRty1F7izoJ1DiSavf0TwZDK5owazISbPe2BdEia2Q6JjkGtI
         YO3AdTlqY99dOM01esgxBxR6l7Xi+F/gidMUU3m8UP1iX01ebs6rODmju1pJAfhgze6p
         yu/toL1lopVUU/fbcJ3B7dNhJsX9Yy30R9yp5SEMOgZiMXw0ayqSR8sN5VcEqbEOEoKg
         B9Bbc1pN437Kl13AxCWBofOXcHnjCe5ExOPaZIZKScFToeVlNs+9QBkJiyCoIMrcqhbJ
         ofFq9sfte0SEOBCEgjD+gOzK97YshhI62x0e3E0TxVoeNjOaOVMvgmP09SlXeww75HEj
         m3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y5s9edaIzkddCgobfmY3uqcn7wmzvnyo8IQdQIisAEg=;
        b=evw14D8nkH9MYrJgYZFzZm8ymwQxRvt1Xqw5H0bE3NUH7k9zCW+30OsRSOn23RWtFg
         PQ3rf1TivZFYG9yAfrzJc80HreRKzP67vUBGb4EIqBq1L09w+S/uod1LVEgF70gh9s8d
         EzuGZpPH+WHUKSNG09YB7qp/3OmS0MnCfbwFfyegPeDEWu4j70xiFX7QozKd6mbElsTe
         GL66rbHRwmV9rQ6bM7ZVWgxGZV2+2P6CeZ04M3eTWVUQZYSszAfynhqwjlN7Y+bjZBcp
         LR/J/EY+fVwZGPc+ypem6pvBI6ssI4eyjVKBo6SPFRJsaHVA6Ux5ysyN6vctFrnbauJo
         tXWg==
X-Gm-Message-State: AOAM531WK3Fyh2aoGNyDTxozHTN1FMZbc/5Zw2rNzv6hKzOE9TQ27d+A
        S4UO4+08GizBZjPARMK6vK8=
X-Google-Smtp-Source: ABdhPJwQn0Kxf+lANu9Wff8D3FwTjJZmSHuynPC36O2mlh26UdMyd75qxUVAeTUbfxaypdwyL2aqwg==
X-Received: by 2002:a17:90a:1388:: with SMTP id i8mr3744902pja.210.1595928527010;
        Tue, 28 Jul 2020 02:28:47 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
        by smtp.gmail.com with ESMTPSA id k63sm18526319pge.0.2020.07.28.02.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 02:28:46 -0700 (PDT)
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Helgaas <bjorn@helgaas.com>,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v1] [media] netup_unidvb: use generic power management
Date:   Tue, 28 Jul 2020 14:57:17 +0530
Message-Id: <20200728092717.937023-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The .suspend() and .resume() callbacks are not defined for this driver.
Still, their power management structure follows the legacy framework. To
bring it under the generic framework, simply remove the binding of
callbacks from "struct pci_driver".

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/media/pci/netup_unidvb/netup_unidvb_core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
index 80a7c41baa90..6f3125c2d097 100644
--- a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
+++ b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
@@ -1016,8 +1016,6 @@ static struct pci_driver netup_unidvb_pci_driver = {
 	.id_table = netup_unidvb_pci_tbl,
 	.probe    = netup_unidvb_initdev,
 	.remove   = netup_unidvb_finidev,
-	.suspend  = NULL,
-	.resume   = NULL,
 };
 
 module_pci_driver(netup_unidvb_pci_driver);
-- 
2.27.0

