Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53490246039
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 10:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728082AbgHQIcb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 04:32:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728077AbgHQIcY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 04:32:24 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E0CFC061388;
        Mon, 17 Aug 2020 01:32:24 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id o13so7791383pgf.0;
        Mon, 17 Aug 2020 01:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=07OcTn0WvfbdnvA4s7Eut/eKjTVLyM4q+0Qmy2LDm0U=;
        b=l7ws862qdf+QG/FRgRzM2zyRMT8buz3qjIIUIC911q8cLJC5Fr7zqyZ9VZdli+Y4CO
         mg02zvbTldmq+25rE+w6TL3nVPvfkF9Dsc6rBcmJ2PjPHZAvCYHfWytpyM/n4mrGCoY8
         GYvfL+4pmdgrQD2EkIsKqmPzkDtq/mLjng08sY2/morHJ0/b2LgTwmp5BxkF9z4HvWfM
         Th3BZh/j01nqCWwKf/JvN0oEq5Mr5vfIKwiUsD+/WU46dmw1Q7UBfWnu1NCAlUCZw0uN
         2JlQuG0h61ifPd4Wu1hHBKNUFSFQ9R+VIfWQz9U4TQIonljShIoAbbKnXjtNPL4an9aH
         D8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=07OcTn0WvfbdnvA4s7Eut/eKjTVLyM4q+0Qmy2LDm0U=;
        b=ZcziOOUFP3inyjTYm2ljwcroAukqWolALrAt51dwS3S6lb74TzoamcM/a2z7YUN7bv
         1FqWSZf7tCASxk/6qX2H4mbtp+33K3np/FYnQx31fwNYaQLcWuaFCEu/vXeIdTHTkzKF
         Vu4I7bftTkt2xwU5K4iyOjbMbSWjzU1b3dD5lFGI9X2WQk7/uKZppDt/df0ZAzSybIt3
         hvnRFud1ChCuhKV45C5569mnlbkktOxKS+lU+cSgjPIGZTt4UafqxbYg8h50qlZivwr0
         sQR1XiKsouGVf241EqJQWYgloGtV3J1VQ8kLFUVJeChaHw9wP2f0ZSigwbEYDkBE/tul
         s09w==
X-Gm-Message-State: AOAM530HdCMFPk9QPFyKaIvFTNUxBd6JTjcY5LApNi0x/5UkMAnDtiQ8
        AsQ99+gll6rpntuAt5sc+ZQ=
X-Google-Smtp-Source: ABdhPJwwstyk15Z19/5BM2jWQthYwAlrQCLHl80YU15rdh8SHJRf4gdYA8ej4Z8R4dt9WWOsmps+Og==
X-Received: by 2002:a62:1614:: with SMTP id 20mr10690453pfw.258.1597653144118;
        Mon, 17 Aug 2020 01:32:24 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
        by smtp.gmail.com with ESMTPSA id b15sm18448351pft.116.2020.08.17.01.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 01:32:23 -0700 (PDT)
From:   Allen Pais <allen.lkml@gmail.com>
To:     mchehab@kernel.org, maintainers@bluecherrydvr.com,
        patrice.chotard@st.com
Cc:     keescook@chromium.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Allen Pais <allen.lkml@gmail.com>,
        Romain Perier <romain.perier@gmail.com>
Subject: [PATCH 04/11] media: smipcie: convert tasklets to use new tasklet_setup() API
Date:   Mon, 17 Aug 2020 14:01:46 +0530
Message-Id: <20200817083153.22218-5-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817083153.22218-1-allen.lkml@gmail.com>
References: <20200817083153.22218-1-allen.lkml@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/media/pci/smipcie/smipcie-main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/smipcie/smipcie-main.c b/drivers/media/pci/smipcie/smipcie-main.c
index 9ca0fc3e6f80..e7604b7ecc8d 100644
--- a/drivers/media/pci/smipcie/smipcie-main.c
+++ b/drivers/media/pci/smipcie/smipcie-main.c
@@ -280,9 +280,9 @@ static void smi_port_clearInterrupt(struct smi_port *port)
 }
 
 /* tasklet handler: DMA data to dmx.*/
-static void smi_dma_xfer(unsigned long data)
+static void smi_dma_xfer(struct tasklet_struct *t)
 {
-	struct smi_port *port = (struct smi_port *) data;
+	struct smi_port *port = from_tasklet(port, t, tasklet);
 	struct smi_dev *dev = port->dev;
 	u32 intr_status, finishedData, dmaManagement;
 	u8 dmaChan0State, dmaChan1State;
@@ -422,7 +422,7 @@ static int smi_port_init(struct smi_port *port, int dmaChanUsed)
 	}
 
 	smi_port_disableInterrupt(port);
-	tasklet_init(&port->tasklet, smi_dma_xfer, (unsigned long)port);
+	tasklet_setup(&port->tasklet, smi_dma_xfer);
 	tasklet_disable(&port->tasklet);
 	port->enable = 1;
 	return 0;
-- 
2.17.1

