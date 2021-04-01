Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3870A351C7B
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235844AbhDASRs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 14:17:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234680AbhDASKq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 14:10:46 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 556B5C0045E9;
        Thu,  1 Apr 2021 07:43:49 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id y6so2266089eds.1;
        Thu, 01 Apr 2021 07:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zVDA2U87siFM4bZ03zT66KCDipDzfZC9XU/CesvHFfk=;
        b=ppjMXHiKLN4nrgzpuZWnErAVl4VqKZhSm767onbkZd3jCkdF9RFeJcLceb3RjPrQP/
         0cRXkoEpt0a+YJ4pvQELXNYptTgiOZjodVCpqi/hdUOVJ7bly6TetsSrZJp2rG8n10LZ
         NVipJJUp6zrh944qg6i+6/y3xf+raLRS1kTntUju58niMldgO2LwSze05TjwaWeClZkH
         TdWXEi5vTK8EZKxw9cnM1rHgp51UMYq44cbMPaqXxKApsbnD47EPbqQXr1TrC4EkHvJ/
         g7afBz7qMgp8U2UJt6Pw7wAaSVvBEUrPI+mbS1aZ22kH0Nx9bhrqLk06iZ/qgmmLh/Hh
         EBdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zVDA2U87siFM4bZ03zT66KCDipDzfZC9XU/CesvHFfk=;
        b=SFrDjG1pJ3LzgmqLDhaH4RRcf7SZUShgYwrhkdDFISCP3w9BMlL9yQ9+kmuSoyIB3k
         tIJkchAZB6rCP6o+rfNAJ099X4cGYlNXNJa6fbWtxKZIyDHdoHSjSKSl6+L/ELaN5U+d
         /0ig2tSmzVBQVxRLRXRsGaSM/BjdCi93LVLJu/z8hQCnXHMk5f8dc5YFiiuhsLLfJ2aB
         F6R4FFBEtnrLJvwNwx4jKTaksN3KH0iDXPtaiOvMZZzTicxKQ/H+EWN0V8paSEWE+4K8
         IOCC9mGQn5WfpavN5mKZk6jYzclv4ufK4AqKiKLrVRMi+NO/9ZGvmRsRr6C81Pa3K+zC
         SFgg==
X-Gm-Message-State: AOAM531DC9f+a0Iylg/VZWG00/YzzJfZYjBuVnlIWqdmT+vw5VpPPD+y
        cu4CBgU7JCk+BNAg1fXx7MM=
X-Google-Smtp-Source: ABdhPJxDjWYWAJ6CH7cpMYUtIYM3bzWT+WYeumva0k/FHVEhLjz31ru+X9G8m029yNHv5J5ZNSvlWA==
X-Received: by 2002:a05:6402:c11:: with SMTP id co17mr10540834edb.246.1617288228170;
        Thu, 01 Apr 2021 07:43:48 -0700 (PDT)
Received: from arch-x1c3.. (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with ESMTPSA id nd36sm2854950ejc.21.2021.04.01.07.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 07:43:47 -0700 (PDT)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     emil.l.velikov@gmail.com
Subject: [PATCH v4 3/9] media: hantro: imx: remove duplicate dec_base init
Date:   Thu,  1 Apr 2021 15:43:30 +0100
Message-Id: <20210401144336.2495479-4-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210401144336.2495479-1-emil.l.velikov@gmail.com>
References: <20210401144336.2495479-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Emil Velikov <emil.velikov@collabora.com>

The vpu->dec_base is already set by the hantro driver itself.

Fixes: 8e4aaa687863 ("media: hantro: add initial i.MX8MQ support")
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/staging/media/hantro/imx8m_vpu_hw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index 1f48c1956cd2..cb1ac02c03d2 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -150,7 +150,6 @@ static irqreturn_t imx8m_vpu_g1_irq(int irq, void *dev_id)
 
 static int imx8mq_vpu_hw_init(struct hantro_dev *vpu)
 {
-	vpu->dec_base = vpu->reg_bases[0];
 	vpu->ctrl_base = vpu->reg_bases[vpu->variant->num_regs - 1];
 
 	return 0;
-- 
2.31.1

