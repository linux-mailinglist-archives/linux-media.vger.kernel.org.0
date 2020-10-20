Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 815042942A0
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 21:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390916AbgJTTBa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 15:01:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390864AbgJTTBa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 15:01:30 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06B1BC0613CE;
        Tue, 20 Oct 2020 12:01:29 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id n18so3568235wrs.5;
        Tue, 20 Oct 2020 12:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hzwE3DMeVYcufvpW2YO0HT1T1YwdgLKYNBKj7iKs0iM=;
        b=BDd1Vx6LVrnMGvhRT0Zwl/HGiPUmAfQDT/L6U1mzKuEKIBuNoowFabDwgqMiU672Ue
         ltCZDKkDKigPnFAWSwS9Y2YstgjLjtuCMuSKi9mt8pSYZZe3h4wkemwksyg5cbGNIT6m
         S+YBRcPDdzeVNpiG9YKEUIKXT2F3y/3QlFn70H1SzDGQx9a12FnAH93yXGNVjH8g8Jon
         XSa/xA83aAXI3GLdumH++GGeGd8kej2haOZgC5rItDp0bhxMx6WcZgL80CHtMJh9xH7g
         jF72k58ZKY831snaN1oG/0G0ZPSudL6ML5er0UpZOIVSCnK+z3drAgWDao/R2osFpBBp
         wmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hzwE3DMeVYcufvpW2YO0HT1T1YwdgLKYNBKj7iKs0iM=;
        b=NWzY2Kj+jsjXFLpnMHFVu0bVVAPGRuw7/ECwntU6ofqHWFRX+T9C9FLTFfeVnhpW4d
         PUo8avBpduSGH5Q+ieYFSJSOWJ8DsnmnhGuT1KsFwbkEnuBIbRVedb2iZ9oSmBg1yrSP
         WYt4ifFSsemb2Lvnrw58zlnQVUu87gOJPgcSXxsfLUwRYeBh0QaScc0ENSdWtF6NNWJP
         V0gd6ZCM/+7NEOxo7+mS1tw6ohS6OWn4kROeds0cJFNA8GqnaXPFUG3FnralYkPRwPS0
         laiCvU0TiUOK2n22ykafK/uUlDnDvOJ+6V3sgKgCJFpwZxCt3eVhfds4bbogWqmoHx7F
         wfTQ==
X-Gm-Message-State: AOAM533rKoSJmhEkb7tcRYs63gfiKJLGOV1rSCln1E/RthWAUkQOC/rE
        FiUoGqEVeefyzw+wiRVqokY=
X-Google-Smtp-Source: ABdhPJzntt4Q8H0CJkTpnSeKn+ljNJbsc6NqEz9BMVesgBw7OZBKjWOZC2W4KIWd/uRzDBDjjA5ihA==
X-Received: by 2002:a1c:7d49:: with SMTP id y70mr4392513wmc.103.1603220488633;
        Tue, 20 Oct 2020 12:01:28 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id c18sm4279289wrq.5.2020.10.20.12.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 12:01:27 -0700 (PDT)
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, sakari.ailus@linux.intel.com,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH v5 0/3] dt-bindings: media: imx7 and ov2680 updates to yaml
Date:   Tue, 20 Oct 2020 20:00:48 +0100
Message-Id: <20201020190051.1852778-1-rmfrfs@gmail.com>
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

v4 -> v5:
  Rob Herring:
  Patch 3/3:
    https://lore.kernel.org/linux-media/20201020153044.GA875273@bogus/
    - fix indentation of oneOf items const

v3 -> v4:
  Rob Herring:
  Patch 1/3:
    https://lore.kernel.org/linux-media/20201019203910.GB3550266@bogus/
    - remove clock-names description
    - add maxItems to reset-gpios

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
 .../bindings/media/i2c/ovti,ov2680.yaml       |  99 ++++++++++
 .../devicetree/bindings/media/imx7-csi.txt    |  42 -----
 .../bindings/media/imx7-mipi-csi2.txt         |  90 ---------
 .../bindings/media/nxp,imx7-csi.yaml          |  71 ++++++++
 .../bindings/media/nxp,imx7-mipi-csi2.yaml    | 172 ++++++++++++++++++
 MAINTAINERS                                   |   6 +-
 7 files changed, 345 insertions(+), 181 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov2680.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/imx7-csi.txt
 delete mode 100644 Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml

-- 
2.28.0

