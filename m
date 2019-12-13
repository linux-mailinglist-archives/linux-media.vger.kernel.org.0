Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1AD411E49D
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 14:30:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727460AbfLMNaB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 08:30:01 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44588 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbfLMNaB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 08:30:01 -0500
Received: by mail-wr1-f66.google.com with SMTP id q10so6623187wrm.11
        for <linux-media@vger.kernel.org>; Fri, 13 Dec 2019 05:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=CcxRGFcCrtkq/Fa7c3EWJk3tVffr+ohpXoBBbiHwCUs=;
        b=cjQ0OZb/t830fsiw1m+88Q5m3W6dN8tb2EKys48brHEsYFriumeCBYH1gzs1T6XiNa
         KhtuxYzXEWvJPJ27bZlxSWvgp7VYtFnP2QlusXGZlXlPvJbKt2yi2FynYUxkpECpAjNm
         TG8sHRSnfxO2OIzRCaJjOpo0Puq/OiXDeuxQOxVouZaPxq1TPv8BC4HTqVZXsDFgTMVE
         gnT14QHP3ipUClIjCClxZu9mh6ubayg9egpQUtNgDdiDOctC5rkkQwl2TY0lewF4war9
         O5/PVU/RtFElEAoU45X82nuswfcKwyuaX0qqBIdLUPqb3f+GeNmBT6XkHKCD5RFxZOnw
         20Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=CcxRGFcCrtkq/Fa7c3EWJk3tVffr+ohpXoBBbiHwCUs=;
        b=FhumphwSulzqxlbR+VHTOEWxghMnMa8r4XxGRrpCRYSkMZfEiXAQsGb6mnxTX32hJD
         x7LyT/3iN9oDKse5lMjtUr9+kQy+dGY5BCWFkl+P8Q7QBKtvzUb3MlSPHZPLdGEiJUE5
         JSs+HCEp/5epFbzMzFqKplDq5ps3LVP0Kbe80ieCzuMsOfw4/1/vBOo92ejAKb0FCPFF
         6SNfE7ymEHsaumTiZRdAByKJWLdsjdnU8UrhX8Jh292KNivsl6+Jz1J5C5mBLUVqnA/5
         v8qzTZ0rka4FDGYcKFxXOIrqe86gycL+4T+BWIyRoxnFvw5Va2WHfI4tSYbg2uxu/ba6
         pyZg==
X-Gm-Message-State: APjAAAWL1kQF1R6jqMT7NOX5Q2JnEc8c/sctLwmR6RJ1UiE/r4wteawf
        F0g2cYzUIwH/rnRGqKAqfkm5IA==
X-Google-Smtp-Source: APXvYqz43qjGSJwCgT1Fuw9onIXmdIlL82ZNT9dug1PH1gM72NKtNtBBRiNR6mykRXSa3xxRxVS7Ig==
X-Received: by 2002:a5d:65cf:: with SMTP id e15mr13144184wrw.126.1576243798663;
        Fri, 13 Dec 2019 05:29:58 -0800 (PST)
Received: from localhost.localdomain ([2a01:cb1d:6e7:d500:82a9:347a:43f3:d2ca])
        by smtp.gmail.com with ESMTPSA id n3sm10540543wmc.27.2019.12.13.05.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 05:29:58 -0800 (PST)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     narmstrong@baylibre.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, khilman@baylibre.com,
        devicetree@vger.kernel.org
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Add support of CEC wakeup on Amlogic G12 and SM1 SoCs
Date:   Fri, 13 Dec 2019 14:29:53 +0100
Message-Id: <20191213132956.11074-1-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

this patchset add support of CEC wakeup.
We need to set logical address and activate some options in registers before going in suspend.
Registers address and options values come from amlogic driver.

Changes since v1:
- fix bad mask variable use to set logical address.
- use FIELD_PREP instead of shift value.

Guillaume La Roque (3):
  media: dt-bindings: media: meson-ao-cec: Add support of ao-sysctrl
    syscon
  arm64: dts: meson-g12g12: add syscon phandle in cec node
  media: platform: meson-ao-cec-g12a: add wakeup support

 .../media/amlogic,meson-gx-ao-cec.yaml        |  4 +++
 .../boot/dts/amlogic/meson-g12-common.dtsi    |  1 +
 drivers/media/platform/meson/ao-cec-g12a.c    | 33 +++++++++++++++++++
 3 files changed, 38 insertions(+)

-- 
2.17.1

