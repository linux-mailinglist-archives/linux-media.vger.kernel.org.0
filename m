Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6BD82A6E21
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 20:37:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731639AbgKDThK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 14:37:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731590AbgKDTgq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 14:36:46 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86532C0401C4
        for <linux-media@vger.kernel.org>; Wed,  4 Nov 2020 11:36:44 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id e2so3441728wme.1
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2020 11:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QJlyn82FOfM7EXjR0q74MRu42lgfKXYpFARoLgEcKcw=;
        b=CDTWv8+b7Pc7euhcDEsYBH2s0hgrrGZ9dFeeb26B0gMt0vQRbHOkNYq12S81R2kSIb
         BkAZElbMwbidJp0VR2ZQrpMuxtaij6l4SS3iiFsKW8QQicUO0kgIo+9bHizDrHJSN/7i
         8aOmvSrphp4pnAsk4raJf8eABmQqhcqbtF86lo5/LYL3HQ5u/y5vVtfwc19HNURBk39W
         TmrGK+eFMC0IBsAxiOCp5WoexunKFDgC+MdbkeMV3/YLnbC7GDLyFT1NlqdhgeAJKI2T
         ZxTy7SwCJ2VQzBXSlfn77lrnQBilU8LpnRRDY2CaseHey2g0t+xd3ZnRCPrqr5TSTd3/
         jHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QJlyn82FOfM7EXjR0q74MRu42lgfKXYpFARoLgEcKcw=;
        b=cc/XDGKhCUltDiuHdus+pK3/mug11+YWtCvW7Mjp24QVTTUED050kEV69mI+xoyRPB
         Rwi/GQRfs6auiGGhhI+HCvOpkOvu7JsD/nnHTP+x15PpPUiGzDv3bjRFwGiufbW2Gq3h
         rWp+DnWXvhPLNbfKqKE/3R5SVOIRdjR84eXSYhitT7bU4Zh3XB5Olgt5NUsKdym505Ad
         VLASXsE9Jf6eYYVXaUR4dMOM08iKAuxthw3dwHHJF1YJs1T5N2IZu9GEheT5FqiREj25
         ZXVp0u9dHVrpsPt2tX1iPFCRrpbK6iZbLbKo+IlDfJSv5CdpJJb6AHyu/ED4M5xCKIUs
         X8Jg==
X-Gm-Message-State: AOAM533O2dx9ENqMywDpFGYpoaYnwlAHUWrNLS0UoNPjF1+zWLxPhWO+
        xKviU+goWw5qQHV8jGsBT6Z8qA==
X-Google-Smtp-Source: ABdhPJwCKoSo/a5+S17lYgSHyM7aF0XsUIOUlkwoI96HWyiOrIZnl0nWmrJK04DiKb1xktIaygjjXQ==
X-Received: by 2002:a1c:4c0a:: with SMTP id z10mr5105765wmf.96.1604518603201;
        Wed, 04 Nov 2020 11:36:43 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id x10sm4034444wrp.62.2020.11.04.11.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 11:36:42 -0800 (PST)
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
Subject: [PATCH 30/36] tty: serial: serial-tegra: Provide some missing struct member descriptions
Date:   Wed,  4 Nov 2020 19:35:43 +0000
Message-Id: <20201104193549.4026187-31-lee.jones@linaro.org>
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

 drivers/tty/serial/serial-tegra.c:94: warning: Function parameter or member 'fifo_mode_enable_status' not described in 'tegra_uart_chip_data'
 drivers/tty/serial/serial-tegra.c:94: warning: Function parameter or member 'uart_max_port' not described in 'tegra_uart_chip_data'
 drivers/tty/serial/serial-tegra.c:94: warning: Function parameter or member 'max_dma_burst_bytes' not described in 'tegra_uart_chip_data'
 drivers/tty/serial/serial-tegra.c:94: warning: Function parameter or member 'error_tolerance_low_range' not described in 'tegra_uart_chip_data'
 drivers/tty/serial/serial-tegra.c:94: warning: Function parameter or member 'error_tolerance_high_range' not described in 'tegra_uart_chip_data'

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
 drivers/tty/serial/serial-tegra.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/tty/serial/serial-tegra.c b/drivers/tty/serial/serial-tegra.c
index c363ee0470f45..bbae072a125db 100644
--- a/drivers/tty/serial/serial-tegra.c
+++ b/drivers/tty/serial/serial-tegra.c
@@ -81,6 +81,11 @@
  * @allow_txfifo_reset_fifo_mode: allow_tx fifo reset with fifo mode or not.
  *			Tegra30 does not allow this.
  * @support_clk_src_div: Clock source support the clock divider.
+ * @fifo_mode_enable_status: Is FIFO mode enabled?
+ * @uart_max_port: Maximum number of UART ports
+ * @max_dma_burst_bytes: Maximum size of DMA bursts
+ * @error_tolerance_low_range: Lowest number in the error tolerance range
+ * @error_tolerance_high_range: Highest number in the error tolerance range
  */
 struct tegra_uart_chip_data {
 	bool	tx_fifo_full_status;
-- 
2.25.1

