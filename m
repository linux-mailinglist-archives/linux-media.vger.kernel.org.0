Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD8A2937D8
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 11:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392673AbgJTJT1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 05:19:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391238AbgJTJT0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 05:19:26 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DAB6C061755;
        Tue, 20 Oct 2020 02:19:26 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id n6so1199691wrm.13;
        Tue, 20 Oct 2020 02:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G55jsoO41AdZ7cjprwBTVcg52NPKR1+58eYRGpqfSgc=;
        b=H5pxUAMI8AUZf3bcCMhDwNh6szblzd+C6n2Ae9LaiXW2AGFOjsJudpUPR5GmDCnYJq
         KctPbP9gDeI6RO5IELne1KXUUKQTB95r9uZ/sJnmrfskoeuOsPqx9qtxeLCa46VJYOSi
         ct4KLXmSA/gQtE6lMG2jbMyWY1dyv0n65n99Nbf49GHR7TuveE2iHZkiiEp0bfm0SrNX
         QCnOw3Agpysb/3g/QUS8I2d4e+QebYET1T1fBq2cfjSI5bKov+4ypCjAUpXsLVqCKzSZ
         5zlPcYqp6s+7fqxjzNK4BlElP2JnV4S2FBmMa5ET5Zg04+FcFpf6CK/+EON26xXql8yK
         vs0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G55jsoO41AdZ7cjprwBTVcg52NPKR1+58eYRGpqfSgc=;
        b=OSgYOr86xOr9g8tnKTzMWxNmGjAnzMPTWIVUg80TZb4xWR4Rgrk/f//A64gem10MOT
         WPyJowQdUwzBXchJ9z/r6DlYApsYWMewbI+3h/sCisBv6Bm2W5Cx24HOf7TTwUQahRMC
         4AG4tbosC2EsEg6nlYARYaepFpSyf//+VjkR7cnJwwDnv9w16htZEk82zLBm94H6bTtj
         D1/HHGYrxXAnE06y+kmV70bzQXRGlN/N98k/gmMlujUYWzZSW2LQyU42hsQCkRRn1KNA
         BAhkTVTDQFlUz25zQ3Dj04ykovEjkXYmU+LgQJpKnZp3aU4Gk2k1zDyr4e6lXhUQCyUF
         JoCw==
X-Gm-Message-State: AOAM530r4X4xV8DGTMV6rvVluViE3FtdckcBQlnJx5KckAofSaOhtqj0
        1QNa+eMBmKgWs+Ub5+FcrQjBkDdtP5QWkg==
X-Google-Smtp-Source: ABdhPJw6xDviu+Aknk/OFvgM0nEyNiQpfBndDHeEZkcARpLTvHFI0N/EudeXQrGOqJcWtJ1tbidApA==
X-Received: by 2002:a5d:62cf:: with SMTP id o15mr2310697wrv.49.1603185565225;
        Tue, 20 Oct 2020 02:19:25 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id g5sm1773660wmi.4.2020.10.20.02.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 02:19:24 -0700 (PDT)
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, sakari.ailus@linux.intel.com,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH v4 0/3] dt-bindings: media: imx7 and ov2680 updates to yaml
Date:   Tue, 20 Oct 2020 10:19:18 +0100
Message-Id: <20201020091921.1730003-1-rmfrfs@gmail.com>
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

