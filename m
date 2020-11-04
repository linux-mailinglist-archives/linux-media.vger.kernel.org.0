Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 938AC2A6E2F
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 20:40:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731243AbgKDThd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 14:37:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731485AbgKDTgi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 14:36:38 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1C07C061A4C
        for <linux-media@vger.kernel.org>; Wed,  4 Nov 2020 11:36:36 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id w1so23362529wrm.4
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2020 11:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LLsN4EencXRGtGh6NICYbwvfxRBgSaeY1vL5/hXBaSE=;
        b=mDUmwxxsTe07lHZdCK2NULBQOzn4QryCvAiJRBiNod0SQqJoH9VRDVYsjyFYKGVo/W
         reE/6DdkeQRZ5mln/8ZmhUKS1Roow+CuhxYEGWCbHlGiH6Qvhf2OzHgt7m1ca/RB6IfC
         1Z/XDwPlOsKdZWNpKBMdu/7ai2sBwVtTD3IVxbySNMGnN2mYL5XCqTeOJDO84TsaAUgR
         y4+ySv4XxyVtAkylZ1TZa2e5KfXHwqh1NYm4Q5nd7bi3EBSwCAabLS+uoRknth3lyNIL
         4C639ZtdSlM3cWtK32QsZklz9nt/+PfSD/KdhAz8FygBldRS4KP1oWuJo4VC0x5CKunJ
         1MpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LLsN4EencXRGtGh6NICYbwvfxRBgSaeY1vL5/hXBaSE=;
        b=VeXtu5r7ewTBBi7FJIKX2oyk/EJrAl2CFxCpEVZvaiFUbhL7Zsqe1Oj9bLur5ht+N9
         H74VcWI+ARGdJBorceBfVf8cYwanZecbSgXA3jQt7kAWPVfLPiRke+qgLCdEjQlDMT04
         WYmi2aFAI8k7L3LSHZzM3/miithcJCovSK1tFncFUbe5fSqtnUATmlmZYlIeF5j/nxRr
         NBp7/YSR99P4ld3msz0Ynd3Zoc6qjy7SElPOudozdI85bcsbHHUhh5H/V4xCiNRD0qGq
         17q/aMpgPFQJKXpiqfoYh9i1Ijr9W22rjtJgB9Zuui3H79kmuSNkR2Y7lkwvpCPJpQ74
         0AoA==
X-Gm-Message-State: AOAM531Y1GFUV/oL1PrJbX7+dWHP8Xdc0g3zeS0U6tzHr53HY+KvjsIj
        Sdfj0mq5eW6MKXRe7LWNC9LGDQ==
X-Google-Smtp-Source: ABdhPJwj69pglo5oKTGjibnfQaOnqOYeg+zi78YMRNFefrSr4xnzdjafE2tVb3anObZuT+KBZ5gsIg==
X-Received: by 2002:adf:de89:: with SMTP id w9mr33569428wrl.212.1604518595494;
        Wed, 04 Nov 2020 11:36:35 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id x10sm4034444wrp.62.2020.11.04.11.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 11:36:34 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 24/36] tty: serial: serial-tegra: Struct headers should start with 'struct <name>'
Date:   Wed,  4 Nov 2020 19:35:37 +0000
Message-Id: <20201104193549.4026187-25-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104193549.4026187-1-lee.jones@linaro.org>
References: <20201104193549.4026187-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/tty/serial/serial-tegra.c:85: warning: cannot understand function prototype: 'struct tegra_uart_chip_data '

Cc: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-serial@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/tty/serial/serial-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/serial-tegra.c b/drivers/tty/serial/serial-tegra.c
index bd13014a1c537..c363ee0470f45 100644
--- a/drivers/tty/serial/serial-tegra.c
+++ b/drivers/tty/serial/serial-tegra.c
@@ -75,7 +75,7 @@
 #define TEGRA_UART_FCR_IIR_FIFO_EN		0x40
 
 /**
- * tegra_uart_chip_data: SOC specific data.
+ * struct tegra_uart_chip_data: SOC specific data.
  *
  * @tx_fifo_full_status: Status flag available for checking tx fifo full.
  * @allow_txfifo_reset_fifo_mode: allow_tx fifo reset with fifo mode or not.
-- 
2.25.1

