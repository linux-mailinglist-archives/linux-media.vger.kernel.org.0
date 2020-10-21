Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7925295420
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 23:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505976AbgJUVZx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 17:25:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2441532AbgJUVZw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 17:25:52 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A3E8C0613CE;
        Wed, 21 Oct 2020 14:25:52 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id s9so4705392wro.8;
        Wed, 21 Oct 2020 14:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SdaHcYhja6LCBoYp+0klkgoEvCFEzoRcRBXinDR4Shk=;
        b=o6uWyYDVYZZA9fzS0K06Ahy2W2tPgb362MI4JbZWYP51WwaBeqnJFxOgijgbXNcCoN
         zGWtR617q1XIPNw2tw+xQpcegSIBv9wi1+A5FX+cLTfj2BeRQxYdK6kqVCkjRkVXS6/i
         /GuRbgBskIbtt+Zzs0Zd7EAIxjyJd0StbNOCIRpv/kLH/xbU/a3rPwbVWDKLGA6xrNZN
         cTMiCZbHtfQeUnaE2a39Er6vlWPdul8mEnxZMB0HPL+UVLD/LyWw0S9GfYgPxKoMDrHT
         TvX+NEx/EieD5KGGnMHrU9FjpocijbIJJKhZimUr3H/EaTL28NnmTtUrxciDuQXl8oy+
         dfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SdaHcYhja6LCBoYp+0klkgoEvCFEzoRcRBXinDR4Shk=;
        b=fout4o1DGizDp9hLE6AdCEI+9850736V9AuzOgIuMupg/L7QzHYmDgis4B5w3jjUZw
         x2dr8eHBavysZFseNetBNzcyoQhEvSa3HsQmxSZMN+JMz8CYT/agH6wkgDn7ZvCepJsp
         7yzlrK4Kzkvv4H8MjHaUWVJPj+lSBgkR/7db9WK6xsd86U+r5jggq4/Mm1Pw49gJNea/
         k8CXJU4jwraWSjbtcPC4uWcbnK9gOHpZeq6CqzuLmB52ZY71iqjnt0/vBX7TAVmYfJgd
         dWn1IQOXkd6V6wvUSea3tkFF8JgyV26L5o6U2oTD9Ml3p+ap0ZRoYCNCXTfLfUwgRrI4
         MOug==
X-Gm-Message-State: AOAM5322/+akF85V5oHB1+6z2n5gsNfjTLkUdIv41uQUWPaOU2fXqTaI
        zFS1fjcp+qzUPhjwHyGg80c=
X-Google-Smtp-Source: ABdhPJwzrCt79Z2StuMteZpIGYKYstYTTh7gF0Q7Fdm9mJTt9tGQsBfnl1+cZhLquKTCLotALTYN4w==
X-Received: by 2002:a05:6000:118c:: with SMTP id g12mr6951100wrx.246.1603315550936;
        Wed, 21 Oct 2020 14:25:50 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id c18sm5877220wrq.5.2020.10.21.14.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 14:25:50 -0700 (PDT)
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, sakari.ailus@linux.intel.com,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH v6 0/3] dt-bindings: media: imx7 and ov2680 updates to yaml
Date:   Wed, 21 Oct 2020 22:25:40 +0100
Message-Id: <20201021212543.1920793-1-rmfrfs@gmail.com>
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

v5 -> v6:
  Jacopo Mondi:
  Patch 3/3:
    https://lore.kernel.org/linux-media/20201021155016.bs2n5ixuhxwjzjy2@uno.localdomain/
    - fix capital MIPI CSI-2 and i.MX in description
    - add maxItems in clocks
    - add Jacopo Reviewed-by tag
  
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
 .../bindings/media/nxp,imx7-csi.yaml          |  71 +++++++
 .../bindings/media/nxp,imx7-mipi-csi2.yaml    | 173 ++++++++++++++++++
 MAINTAINERS                                   |   6 +-
 7 files changed, 346 insertions(+), 181 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov2680.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/imx7-csi.txt
 delete mode 100644 Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml

-- 
2.28.0

