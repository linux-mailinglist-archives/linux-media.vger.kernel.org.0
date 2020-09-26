Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF494279922
	for <lists+linux-media@lfdr.de>; Sat, 26 Sep 2020 14:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727499AbgIZMyY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Sep 2020 08:54:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbgIZMyX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Sep 2020 08:54:23 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44A31C0613CE;
        Sat, 26 Sep 2020 05:54:23 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id y15so2114513wmi.0;
        Sat, 26 Sep 2020 05:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3xaKMAWzpL5OM2zoqzxxMUrIQNf25ypkmGgsbg09Cgc=;
        b=IZDiXn3rjGnfLR2cV5Tv5kVbno5CaOpHkPVPdXopCAC8o8TcK7gLBgSsZktmajXO+e
         9PlukDTdO3ZQLO6/wXMUMYM9zuE0YDjRt3eiDi+jdnRur/n71H+Cn3qbfryNTWoIr6hR
         Er4J8gnV7pNOqqzT5qsj7moCaUNBwN1e1v3TCy6fVCQoegxCUIYFt9b//CWc5gqwxDKE
         OMUty7Cy75byX08Zey/O/7GLAgbEXl1vOkI8s0L402nJEgjD79MVtsycIGfWVoDnQZRm
         FRJ4HGkkMMCxxjiQ/epPbjSzyd8YqrA/uezoxSBxWZa4NYi1gTtYEmWq+fu4k7TQ7sRd
         7NnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3xaKMAWzpL5OM2zoqzxxMUrIQNf25ypkmGgsbg09Cgc=;
        b=IBVwRYtys9gyI+gH3qN8WGcm2t5+U0bo2GfEJ4Uu5btB1Etbp02BeVIzaAU66lPegr
         DCBBGPEkG6TcwU3fWiPDK1vIwOu2GXRtefLFCDocEEchAqGiU2avetiMTf3VQo/i5iDj
         6s66NiWGQd2NC1fZztQaLuIU25d4O0ZWtpn1JTsPDc1iIPokBN10GFZbaDTR3lHY1xil
         HmoN6MAt46NDaAn9Iod6V4ufx8941WNzFW2yuOF8mjX28xwgoUb+07N/dNy7vUZg7zSi
         qKh3pPpcoI1JtEOR0vuFGgWcZ29XVyl9ZuIfQiSAQ70szY+JRx+egR96KnqfdSE3b6PX
         tDYg==
X-Gm-Message-State: AOAM530PCDSdmYJL5pPhGqKS8u7Hh9sO/8KbNqTlR+zv14XAIVVKsdyt
        WHPwPdIxFC5StqF1+j7A+mw=
X-Google-Smtp-Source: ABdhPJyrzC8zmEPPomIiUMO+khLzkLVQ3GUjv3E5rknio4D3BKwDHE9DKFk5ldcd7GJN6glPGBvOxA==
X-Received: by 2002:a1c:5988:: with SMTP id n130mr2616027wmb.95.1601124861907;
        Sat, 26 Sep 2020 05:54:21 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id 70sm2617707wmb.41.2020.09.26.05.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 05:54:21 -0700 (PDT)
From:   kholk11@gmail.com
To:     stanimir.varbanov@linaro.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-media@vger.kernel.org, kholk11@gmail.com,
        marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Qualcomm Venus enablement for SDM630/636/660
Date:   Sat, 26 Sep 2020 14:54:09 +0200
Message-Id: <20200926125412.13024-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

In this patch series, I am enabling the Venus video (enc/dec)oding
functionality on SDM630, SDM636, SDM660 and their SDA variants.

To reliably achieve this, commonizing most of the v3/v4 pm_helper
functions (while keeping compatibility with the previous bindings)
seemed to be totally legit, as (almost) the whole logic that's been
introduced in the v4 helpers does actually apply to all (in my knowledge)
of the SoCs that are currently needing the v3 ops to *at least*
optimize the power consumption while using this remote processor.

In the specific case of the SDM630/660 family, this was necessary in
order to correctly bring up the clocks required by the Venus subsystem
without using particular hacks in the clock drivers.
This patch series achieves functional video encoding and decoding on
the SDM630/660 family of SoCs.

The testing was done with the following methodology:
 - Boot the system (libc with GNOME DE on Wayland)
 - Upload a 720p mp4 h264 sample video file [1] on the device
 - Open gnome-terminal and use FFMPEG to transcode:
   1. Software H264 decoder to Venus HW encoder (wow it's so fast!)
   2. Venus HW decoder to Software H264 decoder
 - Download the resulting files on a PC and start playback
   - Playing back both files works

This patch series has been tested against the following devices:
 - Sony Xperia XA2 Ultra (SDM630 Nile Discovery)
 - Sony Xperia 10        (SDM630 Ganges Kirin)

[1] https://dvdloc8.com/clip.php?movieid=12167&clipid=1

AngeloGioacchino Del Regno (3):
  media: venus: pm_helper: Commonize v3/v4 pmdomains and clocks
    management
  media: venus: core: Add sdm660 DT compatible and resource struct
  media: dt-bindings: media: venus: Add sdm660 DT schema

 .../bindings/media/qcom,sdm660-venus.yaml     | 153 +++++
 drivers/media/platform/qcom/venus/core.c      |  68 +++
 .../media/platform/qcom/venus/pm_helpers.c    | 525 +++++++++---------
 3 files changed, 498 insertions(+), 248 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml

-- 
2.28.0

