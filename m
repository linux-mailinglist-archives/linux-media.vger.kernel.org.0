Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52743214C58
	for <lists+linux-media@lfdr.de>; Sun,  5 Jul 2020 14:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbgGEMMA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Jul 2020 08:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726833AbgGEMMA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Jul 2020 08:12:00 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0ED3C08C5DF
        for <linux-media@vger.kernel.org>; Sun,  5 Jul 2020 05:11:59 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id p20so39491643ejd.13
        for <linux-media@vger.kernel.org>; Sun, 05 Jul 2020 05:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=isrInYoUXrbFffPc47IJyxGU9lKhBtrchnU6KHdwR2M=;
        b=RwtX5+900ZFC8SeHyTCdRlw3uUTyMSGBW7Q7hy8nF2oeq5HqT/Y5rxC1oKlf4+LTyh
         NpcwaASIJldFKLJa9sGubeQpgRm9FS1bAhwyZ7E1J2wX0Vh5hzKU3etEKoH+m8MRcBy4
         RUSqPUMGmFngCpVf79vVvoPXieVtbWUxevTsDyu2q4fsoIZHqE1qOofyp4FFbGsKuPW/
         B7bIi3NRRI3/u8iMOd03aTqKPpn7lhD6WOj3N76552CdNKuFS/406twIt8pORcbP1Msm
         9HL9fhDqLMlSD1OEcuC8rh1XeUGzCzVNXWOEYPK+C/9MGduuCXDO511fH5rs4S4W5sal
         +ZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=isrInYoUXrbFffPc47IJyxGU9lKhBtrchnU6KHdwR2M=;
        b=dQJg8kjmbbMLV2A49Eh4Y77957hPCrVP5FjaCeKGkeyB8OIiBHXgOr055m7sLgUhj/
         eCJ2TdHJKieGaHaC9/iyg7WE1k/8QY+WiSPnwus3XPmre5S52QwlvT8VEbsm89KGIeuo
         lmvGojuYTf4KdRBYdIGZ4LPUrAm/6z9mdJSong57lNPgbqUHP4wH422OsnsCGcOakjLJ
         NeBbS+eDyJdAOI2M7V5OfHrzR9J/MWACtCZIPp7KSZE085Ff1fJeVn3Hc7ZVqZfLUZZd
         FtC+ZlIsSGH2TaG+BVRXCp/PYK5BUBG/386IuQutOKc8CaD+oUC1t6DLAE4r5GlzspB+
         vgbg==
X-Gm-Message-State: AOAM532v2RtVf3FByDU7tK8/iL8wqawe7NbLL2GwptLPbASeGlYX7YCC
        MO3rYQAndVDQ2F1WjayRGlwdm4ZOtq+few==
X-Google-Smtp-Source: ABdhPJz7vzannraogjdgriWNq5/RhT6Q0BO5Oyk8QjUHuW2mXs/JhrqP+IIoHk9maSx2np3HDe1OxQ==
X-Received: by 2002:a17:906:1747:: with SMTP id d7mr31399376eje.39.1593951117954;
        Sun, 05 Jul 2020 05:11:57 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-133.ip.btc-net.bg. [212.5.158.133])
        by smtp.gmail.com with ESMTPSA id j64sm1517458edd.61.2020.07.05.05.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 05:11:57 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 0/4] Make Frame Skip Mode control a standard
Date:   Sun,  5 Jul 2020 15:11:24 +0300
Message-Id: <20200705121128.5250-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Suggested by Hans at [1], this patchset is promoting a standard control
for frame skip mode.

The original private V4L2_CID_MPEG_MFC51_VIDEO_FRAME_SKIP_MODE control is
applicable and can be used by Venus driver too (and probably other drivers).
In order to make that possible make a new V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE
standard menu control (a copy of the private one).

Also, to keep mfc driver backward compatible kept the private one, and mark
it as depricated in docs.

regards,
Stan

[1] https://lkml.org/lkml/2020/5/19/122

Stanimir Varbanov (4):
  media: v4l2-ctrl: Add frame-skip std encoder control
  venus: venc: Add support for frame-skip mode v4l2 control
  media: s5p-mfc: Use standard frame skip mode control
  media: docs: Depricate mfc frame skip control

 .../media/v4l/ext-ctrls-codec.rst             | 37 +++++++++++++++++++
 drivers/media/platform/qcom/venus/core.h      |  1 +
 drivers/media/platform/qcom/venus/venc.c      |  6 ++-
 .../media/platform/qcom/venus/venc_ctrls.c    | 12 +++++-
 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c  |  6 +++
 drivers/media/v4l2-core/v4l2-ctrls.c          | 10 +++++
 include/uapi/linux/v4l2-controls.h            |  6 +++
 7 files changed, 75 insertions(+), 3 deletions(-)

-- 
2.17.1

