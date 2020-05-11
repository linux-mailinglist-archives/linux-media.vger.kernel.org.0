Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 442CB1CD717
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 13:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729281AbgEKLD6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 07:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729163AbgEKLD5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 07:03:57 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 065FDC061A0C
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 04:03:56 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id u16so18687695wmc.5
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 04:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YYtGTZN1IDnhl2DGD//+L1M7Uh3Y6F/c8Nk8YQ5S4LM=;
        b=E9OP0txQ0ln5On8Vka2/Vii+xPPWCDo+RcC3j57ohFiiq2XXOryTEwRz7wf7CUES1D
         XLBbz005jDzpG32wam1NdBdE83ezou1oSdw0e1idkMW4nC1UnTgk/GJXlpUkgCwa61u1
         bslbKk0GCirkIlfCMRfxCpNfKUapVA78c/zQW9YDeC/mwvSkkuUa0CpcXJp0vmB2y0st
         T/7Q4p9ECBNIK8uJkJH0KheQL8m1BUB2u30iVIJk6EswQgTEZ22Hku8MJRmKU7PO04zk
         bQTZ1OrirQqxfolrRrly5w5qcC0WShhxz6cdN28PDyOObp++sJPG1rk1WhxDb6rnDbST
         nLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YYtGTZN1IDnhl2DGD//+L1M7Uh3Y6F/c8Nk8YQ5S4LM=;
        b=f3kPmtoWxw++m4w8ya9TY3JRqq0dS55Kz9ZPW7i6oXfAcEhwGTi57l2PQzPCCjIJzY
         Aao7MWUon+ZztRBbKz7KcWoiRE2cb3WG7eNJ5YvQMYNZWfuGta5pjly8CgEVJ/hj/h8w
         aT3FlmYvwRCNzdRJ02yUy2FH4eorC5nNLZ5tnlQRlcKLaFxI7VEunUUmLLplqMF5m1iK
         giT3UYQl85iEzo9HALBVlyiMdUBQ0VZZjXrnfyGeKBEaoBtGMsH6xMBdp4yLsNwB6/dO
         TBsRaoQYr6BwOrSIlCyvlGFWkIxQLfBN/qKeBoOuCfP+slXMFQ+sEpqWS+g0EofgbYd0
         XtJg==
X-Gm-Message-State: AGi0PuYMuGyhELz9H8/M9ChjAAxmI7SlEhZ8vVfeSQZELM2ZEfOyMqDp
        +RzQOFV7bpOoLdE3Pri0wnDrsQ==
X-Google-Smtp-Source: APiQypJIuLYqKCCu71EykxQAeZzhyH4J/mpRW6NrzLFbXBbwDpDNbWaJx31A7kAP/ES5nX8d1Hu08Q==
X-Received: by 2002:a1c:7d92:: with SMTP id y140mr15836919wmc.10.1589195034723;
        Mon, 11 May 2020 04:03:54 -0700 (PDT)
Received: from localhost.localdomain ([37.120.63.158])
        by smtp.gmail.com with ESMTPSA id z18sm7046584wmk.46.2020.05.11.04.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 04:03:54 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Maxime Ripard <maxime@cerno.tech>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>, Ben Kao <ben.kao@intel.com>,
        Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v8 0/3] media: ov8856: Add devicetree support
Date:   Mon, 11 May 2020 13:03:47 +0200
Message-Id: <20200511110350.11565-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds devicetree support to the ov8856 driver.
In order to to aid debugging and enable future sensor
modes to be supported, module revision detection is also added.

Dongchun Zhu (1):
  media: dt-bindings: ov8856: Document YAML bindings

Robert Foss (2):
  media: ov8856: Add devicetree support
  media: ov8856: Implement sensor module revision identification

 .../devicetree/bindings/media/i2c/ov8856.yaml | 142 +++++++++++++
 MAINTAINERS                                   |   3 +-
 drivers/media/i2c/ov8856.c                    | 191 ++++++++++++++++--
 3 files changed, 321 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.yaml

-- 
2.25.1

