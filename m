Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE2A428D137
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 17:27:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389386AbgJMP1G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 11:27:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389379AbgJMP1F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 11:27:05 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 809F3C0613D2
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 08:27:05 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id k18so56485wmj.5
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 08:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d1nW1e8BW37kG8S2Q/+J/RTjhvcX6BLWpU1KmHqRl0Y=;
        b=nSvxSBnIW0+ymq3uWtUfsqXPFdYdr7Lbnal6vp+EV/O3aqxaKLYjdYcZP24aKR/KLo
         DkA8y4YMhPbQqBTJIIVhrSGWX01xijFkyUQQNLRyyZbjW1bswYA6vwvbOZrGSBT+nNjA
         zvcdI3KIdbbZDY+MAVfzDvL/29vAH9CIgIVjHpZrMzrrWY3aERRqInSmruYDoq3wtYB7
         sEasu5tOKqrR1DMY2u93yVFG9lp7+DH5P+0X1u5O+dZJRfq4mk9xoe8xAZaPD3m9Z0yz
         1cfMi0rdUDlZiXTJzzkVIjrpdBoAwwwCpsaId/nGWs4DkraNYjIKP1sgv0PMp8AVMxAH
         904g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d1nW1e8BW37kG8S2Q/+J/RTjhvcX6BLWpU1KmHqRl0Y=;
        b=iKg9P2XZT3v0t7n9P08V3K3jPOiCGgp0H+Mq97JPnJEb9VsgF0thWMPzINqOe3uObr
         KJajJzWJxTM2P5+0fyoI95rxkwqgCSmHG1QqTamUZPhH78vN+Ax/QscbtevNNepCELpE
         lyvzSaDPyS/TpRug/llqL1xQ0KqoD0wKRjOSQVrtu9TjUGuMNoOiAoujmmXC3xoqP258
         Otyfq903ppQLFuR5Gzv9nvfOdeZeg//ul68fuOm1EpDp30/L4l2UkI17GowHk7srshVP
         plJR3au1S8dg8itdwwEEPK7GnkQa01agxXTcglMxhkOwNpS8obsvPjS1Y9BQLCpCvIfB
         wv5Q==
X-Gm-Message-State: AOAM530NRDbeR3h0ePetUNmNCnytkU29xXZi/dsME6jdTniZyNIDQ6k3
        nAFVUqbim15LwfjXy7yTY3O7sWQXVEoECQ==
X-Google-Smtp-Source: ABdhPJwtJpHyandexUO80T5uxJgeW5ugVnrneA9hSgScQAoY6LOGM10nHMAgafB7ITWQK4FSQk7LIA==
X-Received: by 2002:a7b:c14f:: with SMTP id z15mr403466wmi.73.1602602822252;
        Tue, 13 Oct 2020 08:27:02 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id z127sm111575wmc.2.2020.10.13.08.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 08:27:01 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
X-Google-Original-From: Rui Miguel Silva <rmfrfs@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, sakari.ailus@linux.intel.com,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 0/3] dt-bindings: media: imx7 and ov2680 updates to yaml
Date:   Tue, 13 Oct 2020 16:26:44 +0100
Message-Id: <20201013152647.537323-1-rmfrfs@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Update bindings documentation to json-schema yaml in imx7 csi, mipi csi and
ov2680 sensor media devices along the respective MAINTAINERS entry.

Cheers,
  Rui

Rui Miguel Silva (3):
  dt-bindings: ov2680: convert bindings to yaml
  dt-bindings: imx7-csi: convert bindings to yaml
  dt-bindings: imx7-mipi-csi2: convert bindings to yaml

 .../devicetree/bindings/media/i2c/ov2680.txt  |  46 -----
 .../devicetree/bindings/media/i2c/ov2680.yaml | 131 +++++++++++++
 .../devicetree/bindings/media/imx7-csi.txt    |  42 ----
 .../bindings/media/imx7-mipi-csi2.txt         |  90 ---------
 .../bindings/media/nxp,imx7-csi.yaml          |  84 ++++++++
 .../bindings/media/nxp,imx7-mipi-csi2.yaml    | 181 ++++++++++++++++++
 MAINTAINERS                                   |   6 +-
 7 files changed, 399 insertions(+), 181 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov2680.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov2680.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/imx7-csi.txt
 delete mode 100644 Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml

-- 
2.28.0

