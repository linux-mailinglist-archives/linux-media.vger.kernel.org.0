Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B75662929C0
	for <lists+linux-media@lfdr.de>; Mon, 19 Oct 2020 16:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729751AbgJSOtd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Oct 2020 10:49:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729743AbgJSOtd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Oct 2020 10:49:33 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB471C0613CE;
        Mon, 19 Oct 2020 07:49:32 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id k21so168028wmi.1;
        Mon, 19 Oct 2020 07:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XPta4rekIVbia9VF5yEVUkoev5tfVS1mlF3jAfoEQbw=;
        b=s8OB4I8yRyVM1D2CTyGaUErAsiEk2MIaiavNfWsqPFHsB603xhHJ5pOJpyciBlg5xE
         T7LRWtS8AuU3diyZ4WoOA+3DuSHEtyycSdMwHmEHVil/OeS2XLK1XjrDahhzlrXBZjy0
         fnrGh72xik/9PXx5a2xozDI0VDSqUtJhi4nQHTv8xNjmS+kj7Y/Cn0kDu11K9HboYyf3
         tqjDpsTYaXEyUuEI5AtwaJeVN9jGtSJCGZ1H5qe1saaeunWLqEIk5lnZkC/0CeZ9cm4x
         acldD1H+MxjpajKSkJMlvOD2mnU6+bA3JpJfSDJIsYfzumHzmd6SaZHBKzb7YPLy87FO
         SP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XPta4rekIVbia9VF5yEVUkoev5tfVS1mlF3jAfoEQbw=;
        b=HOatFmmpA0COGI4+d7P3baMTJSfgjqY6x2snWmtSJSccfY3gsmBnbHnLS2TMVE+hWC
         FO07b53p/u66kjnO8MZflMyKw3v/O2XSW1j1pMcyO0HFOzX1Uwpcb5ysdb2xRJG3YUNA
         jMqB0SINg4vJugzf+K7QyySv6+tWTbAktp8EpDjVEWLchsH73WuYZFxYTV7GRErOlI1C
         /DfYbC6AMYMFYqSJHGIkBhTzd5oITl1qohxRBN8Aty2X512SX1looLOsVbJ9fLw3K1qj
         yYiQzrXgeTacNlM6wbVBvW37eD3OTHZJkQJF/owxQDxHpT3dmILMGmyuXP8m0TGyrQja
         Pw5A==
X-Gm-Message-State: AOAM532/1hOjOi9je60FkFsjY1+IwbvFH3MFOvMpVrqup9m++sB/YG0J
        OLivLeEKx6WB+3vdVB7zayI=
X-Google-Smtp-Source: ABdhPJxm+pkdadTlCgU4PZjquNu1saM3yq3n9q/xgtEjR8MlYO0bewnlTXt9axFgLyJcosaOgNNpAg==
X-Received: by 2002:a1c:4c13:: with SMTP id z19mr17919948wmf.121.1603118971448;
        Mon, 19 Oct 2020 07:49:31 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id d4sm18319243wrp.47.2020.10.19.07.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 07:49:30 -0700 (PDT)
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, sakari.ailus@linux.intel.com,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH v3 0/3] dt-bindings: media: imx7 and ov2680 updates to yaml
Date:   Mon, 19 Oct 2020 15:49:22 +0100
Message-Id: <20201019144925.1627715-1-rmfrfs@gmail.com>
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

v2 -> v3:
  Jacopo Mondi:
  Patch 1/3:
    https://lore.kernel.org/linux-media/20201015144905.4b23k5uy7ycuhvlo@uno.localdomain/
    - add prefix ovti to yaml file
    - remove double space
    - adjust port properties
    - fix additional properties
    - fix end of file line and empty line before ...
    - add Jacopo Reviewed-by tag

  Patch 2/3:
    https://lore.kernel.org/linux-media/20201015144905.4b23k5uy7ycuhvlo@uno.localdomain/
    - fix dual license
    - rearrange ports properties
    - add Jacopo Reviewed-by tag

  Patch 3/3:
    https://lore.kernel.org/linux-media/20201015144905.4b23k5uy7ycuhvlo@uno.localdomain/
    - fix dual license
    - capital letters fix
    - const instead of enum in compatible
    - data lanes array setup
    - add phy-supply to required
    - additionalProperties replace
 
v1 -> v2:
  Sakari Ailus - Patch 1/3:
  https://lore.kernel.org/linux-media/20201013160908.GC13341@paasikivi.fi.intel.com/
  - omit remote-endpoint
  - remove not needed clock-lanes and data-lanes


Rui Miguel Silva (3):
  dt-bindings: ov2680: convert bindings to yaml
  dt-bindings: imx7-csi: convert bindings to yaml
  dt-bindings: imx7-mipi-csi2: convert bindings to yaml

 .../devicetree/bindings/media/i2c/ov2680.txt  |  46 -----
 .../bindings/media/i2c/ovti,ov2680.yaml       | 101 ++++++++++
 .../devicetree/bindings/media/imx7-csi.txt    |  42 -----
 .../bindings/media/imx7-mipi-csi2.txt         |  90 ---------
 .../bindings/media/nxp,imx7-csi.yaml          |  71 ++++++++
 .../bindings/media/nxp,imx7-mipi-csi2.yaml    | 172 ++++++++++++++++++
 MAINTAINERS                                   |   6 +-
 7 files changed, 347 insertions(+), 181 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov2680.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/imx7-csi.txt
 delete mode 100644 Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml

-- 
2.28.0

