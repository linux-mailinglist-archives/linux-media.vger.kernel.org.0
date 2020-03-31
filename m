Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E66C9199784
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 15:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730999AbgCaNd5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 09:33:57 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34644 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730845AbgCaNd5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 09:33:57 -0400
Received: by mail-wr1-f68.google.com with SMTP id 65so26003678wrl.1
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2020 06:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oWqPN/2F35kUoboB7VuE68BOKEz/BXfljK/zGatyCzo=;
        b=CX6rpgNk5Dr3qKnrubMvK4q2UgrMeUkjr0E0F1JgHADGyPC55iYFRLqqwEoNKST6nU
         TpLcGrh+pmaxEVHOtDSD6OuZT/Ndnhg57uaHqlvXy4DomvQNq1AdGLybR7F1F9CJvUxk
         yA9hK1JEZDI/fRjyCLIUziE6uXDS1AYzE17wfcFI7hlEpU94InlVQbrE6W2sXLF1eGUw
         gNjpV8lWh5cdXoz8cPICBXHh+x7omJKnUJC80LxDenNWHvPHmlLlEG026qnejDduZWrG
         oJhe8g2MqDHIUyLNQudXifQmq1vvvFzwdtix95uSlvlOmhJC5tsXDCLfA5GOC+64IRmD
         dejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oWqPN/2F35kUoboB7VuE68BOKEz/BXfljK/zGatyCzo=;
        b=pqcpxt5R9StcJadSQXkyLTVeqDeJpIjP7LHz0Ir6P/3LW3cf5dYfWnGVoj4WGT8+B1
         6zRmFPd6DztRwhybXM2GIKA0Mmso8jImZAWRK4890cxWyEdBmQJ6rs/Edfq3BpuGE7Em
         z3vgiX8ZckfjltNqIrSGSAR3EfN2AqQl5L97CJQsEHQUv8xaPvzSisYogBR/HfM5CqKU
         7wcAonfzDAQ/AskgOwx3pdrHC5wNeVGxMFQsFJlT8a5ilbBVavvL3LD5zEAeEri327mu
         k1cPWp8gMHyHwyEV/xX5gWP1YB2RNq0utuBGA/+uDEREScwLjZJPTtnSdV+7wwoXZRrO
         F3yg==
X-Gm-Message-State: ANhLgQ0zro8lIRALkDbQWClP5JkwzttpzV9QMpKo99NFtq9BNACa96u3
        gXLlFgoh7Vxjj96JIXUvIPMTCg==
X-Google-Smtp-Source: ADFU+vu4XlDHD+eAXmhnbIITSDymKAgWq0Yc108LTSVU+JOlZDZX5TChQouQWuBq86nDsCf9jJIwSg==
X-Received: by 2002:adf:e684:: with SMTP id r4mr20689718wrm.6.1585661635563;
        Tue, 31 Mar 2020 06:33:55 -0700 (PDT)
Received: from localhost.localdomain ([37.120.50.78])
        by smtp.gmail.com with ESMTPSA id 61sm28623081wrn.82.2020.03.31.06.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 06:33:54 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v3 0/3] media: ov8856: Add devicetree support
Date:   Tue, 31 Mar 2020 15:33:43 +0200
Message-Id: <20200331133346.372517-1-robert.foss@linaro.org>
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

 .../devicetree/bindings/media/i2c/ov8856.yaml | 150 ++++++++++++++
 MAINTAINERS                                   |   1 +
 drivers/media/i2c/ov8856.c                    | 192 ++++++++++++++++--
 3 files changed, 327 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.yaml

-- 
2.25.1

