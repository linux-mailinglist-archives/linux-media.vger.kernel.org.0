Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABFBC45CB7E
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 18:57:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243193AbhKXSAa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 13:00:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240749AbhKXSAa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 13:00:30 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9886C061574
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 09:57:19 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id o13so5656150wrs.12
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 09:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jJoyvThcbb9hgq1QujgM3jWedxTK6fvqPUXSUejGJVY=;
        b=qnOp5jdLIclbSuOfa2slKfB9E6Mni1982ntv3MHYfDgQV83zRWA4N69hahwqYnF9DU
         CxxSG7FMztgD4UNHcVh5SzsoURXAFle4T4OG90mjFIh65pfkIMqHlXZibHwBcuzTIP/w
         8mS21rh56S8lBYJQHuQotCODgdAJv8dF1WMEHYVEdvuGtyBVzewI8QTdVQ7dv/bKTfbu
         eKjNWQwMfy7MWqlV9X3uf9r7hNjc1mzncgPqfgMjKVv6eDpPSsyRC1EW3gCEPafg1uV1
         Koa34LvZThbXe3qK8R06ZV7GDFjyxLOszlh1JYcH04ZpsoaJEPKNhppcFfL5epvhVFuh
         sUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jJoyvThcbb9hgq1QujgM3jWedxTK6fvqPUXSUejGJVY=;
        b=h9WeIZvHcQtWmOfpoGZd18l158t6FjWcGAPQxVOXzN5axCQanq3ou37vlr7JhbVpu4
         uhIMxLh2sZ/sNIxNwuO9435tueWHiv8HOE2IfnmGKH0zys+jjoczcLBcihq8iBWWpW+Q
         Ng6DIU3CbpeSDXnacgJPZx+8uOQXNaRbly+xjZVo58JTrcAV9lmmekzHhq7DV3OOhS4w
         2mDg0D4RaR63W9XInVP0KPwaXr9TJKjWRCbMR0vYDlIElifSMo2719QU9td0rGwm+9B+
         EtbkOVuG2Uh2Cy0f65VVoY0WUN5ptOaGamKfkoxtazLUAnB35i2ktxTjKBXs0n9OSdxt
         hR5g==
X-Gm-Message-State: AOAM5331vCEow3O9V0sIOyrgOhCE2Jo0bkQYk4hJUGnDOPQhZL+Q8GCs
        s2liveAQ/PAb4R81U+HqHhyg0A==
X-Google-Smtp-Source: ABdhPJzyWMOnDp9PnEBKFZfV0YJ9HfPYmzM4ZFon4mGsv4PzEG38G5UMe87hIXgfD9b7IM/j7qu0qw==
X-Received: by 2002:a5d:4889:: with SMTP id g9mr73962wrq.455.1637776638500;
        Wed, 24 Nov 2021 09:57:18 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id s24sm380576wmj.26.2021.11.24.09.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 09:57:17 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH v2 00/19] CAMSS: Add SM8250 support
Date:   Wed, 24 Nov 2021 17:59:02 +0000
Message-Id: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V2:
- Adds Tested-by Julian Grahsl as indicated.
- Fixes low-level noise checkpatch --strict
  I ended up having to push defines into static inlines for this.
- Adds Reviewed-by Robert Foss.
- Adds VFE/CSID fix for sdm845 as explicit additional sdm845 specific
  patch per Robert's suggestion.

I took the time then to test out on sdm845 to ensure the new patch breaks
nothing "./cam -c 1 --capture=1 --file=capture.raw" continues to produce
expected data.

Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/commit/?h=v5.16-rc1-sm8250-camss-imx577-only
Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/commit/?h=v5.16-rc3-sm8250-camss-imx577-only-v2

git diff v5.16-rc1-sm8250-camss-imx577-only..v5.16-rc3-sm8250-camss-imx577-only-v2 -- drivers/media/platform/qcom/camss

V1/RESEND:
RESEND: git send-email --to=inux-arm-msm@vger.kernel.org -> --to=linux-arm-msm@vger.kernel.org

This series is imported from excellent enabling work contributed by
Jonathan Marek which we have picked up in Linaro for the RB5 project.

Link: https://patchwork.kernel.org/project/linux-arm-msm/patch/20210511180728.23781-2-jonathan@marek.ca/
Link: https://www.qualcomm.com/products/robotics-rb5-platform
Link: https://www.96boards.org/product/qualcomm-robotics-rb5
Link: https://www.thundercomm.com/app_en/product/1590131656070623?index=1&categoryId=category0&tabIndex=1

The RB5 has a slightly different sku I think to Jonathan's platform -
QRB5165 in our case with a different version of LK the relevant bootloader
for the board.

As a result we needed to make some additional updates to the provided
patcheset, included here.

The most notable changes are:

- Addition of clocks.
- Addition of bandwidth settings.
- Representing the dependency on a VFE for a given CSID so that V4L
  subdevs will come out of reset right when poked.

A full tree which is bootable and capable of producing pixel data from the
imx577 main sensor is availble here, with this series being a sub-set of
the necessary patches on the SoC side only.

Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=v5.16-rc1-sm8250-camss-imx577-only

media-ctl --reset
media-ctl -v -d /dev/media0 -V '"imx412 '20-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
media-ctl -V '"msm_csiphy2":0[fmt:SRGGB10/4056x3040]'
media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'

yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0


Bryan O'Donoghue (3):
  media: camss: Add SM8250 bandwdith configuration support
  media: camss: Do vfe_get/vfe_put for csid on sm8250
  media: camss: Apply vfe_get/vfe_put fix to SDM845

Jonathan Marek (16):
  media: dt-bindings: media: camss: Add qcom,sm8250-camss binding
  media: camss: csiphy-3ph: don't print HW version as an error
  media: camss: csiphy-3ph: disable interrupts
  media: camss: csiphy-3ph: add support for SM8250 CSI DPHY
  media: camss: csid-170: fix non-10bit formats
  media: camss: csid-170: don't enable unused irqs
  media: camss: csid-170: remove stray comment
  media: camss: csid-170: support more than one lite vfe
  media: camss: csid-170: set the right HALT_CMD when disabled
  media: camss: csid: allow csid to work without a regulator
  media: camss: remove vdda-csiN from sdm845 resources
  media: camss: fix VFE irq name
  media: camss: vfe-170: fix "VFE halt timeout" error
  media: camss: Add initial support for VFE hardware version Titan 480
  media: camss: add support for V4L2_PIX_FMT_GREY for sdm845 HW
  media: camss: add support for SM8250 camss

 .../bindings/media/qcom,sm8250-camss.yaml     | 450 ++++++++++++++
 drivers/media/platform/qcom/camss/Makefile    |   3 +-
 .../{camss-csid-170.c => camss-csid-gen2.c}   |  32 +-
 .../media/platform/qcom/camss/camss-csid.c    |  56 +-
 .../media/platform/qcom/camss/camss-csid.h    |   2 +-
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 184 ++++--
 .../media/platform/qcom/camss/camss-csiphy.c  |   9 +-
 .../media/platform/qcom/camss/camss-vfe-170.c |  12 +-
 .../media/platform/qcom/camss/camss-vfe-480.c | 564 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c |  17 +-
 drivers/media/platform/qcom/camss/camss-vfe.h |   4 +
 .../media/platform/qcom/camss/camss-video.c   |   5 +-
 drivers/media/platform/qcom/camss/camss.c     | 306 +++++++++-
 drivers/media/platform/qcom/camss/camss.h     |  18 +
 14 files changed, 1558 insertions(+), 104 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
 rename drivers/media/platform/qcom/camss/{camss-csid-170.c => camss-csid-gen2.c} (95%)
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-480.c

-- 
2.33.0

