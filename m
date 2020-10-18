Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9711029178A
	for <lists+linux-media@lfdr.de>; Sun, 18 Oct 2020 14:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbgJRMwn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Oct 2020 08:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbgJRMwm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Oct 2020 08:52:42 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F970C061755;
        Sun, 18 Oct 2020 05:52:42 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id n18so8396990wrs.5;
        Sun, 18 Oct 2020 05:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T/hDz/LE1jLmX/Z0po7n7HZyOjMfrENvnItV9zxg6TQ=;
        b=vbrjL3yMUFf87yU5V/QgWwdXP7ot4mbkpNia9XPXUhHwLVaYGLz6zydMozDktAtCD7
         uyi6qtcv/PCQfMbeE0RufV8uoKJRi/oSLHoxy4UIqd4XJSYq2voU1/m7BM1qQFFJ1y5s
         BVebH3SERxwj0Tj4lhONgCQhUEYAwmaVWb/p81gxt21gReh3Fs3p5Cm/Nk24DkXJgocP
         4ppRy9Q1RVDNj134UXWnSN0hDx7QM6CjNkN5oVHtn2kZ81dqXnhKLc+2XeRzg3ViFBfD
         +rrClPRKcPIH+uCmDaopjEjBF2IaaJEke0yLys0eQ427eqn7t6+hpkL3MdJNyr6AnLrQ
         3B1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T/hDz/LE1jLmX/Z0po7n7HZyOjMfrENvnItV9zxg6TQ=;
        b=hJs3WeWVzc/lGHLQnbALxe6S8HXzRo7WzVADAvErrd3/cHAVJXY0zlXkcc6fuGJZNd
         h64y6P1W75AX3BrQ9fGgS0QxdCW99SOu5Lvv8Tkw71vcuTkm/voij17ix2wqxwG8PW/n
         Xs8QjgVm/MNt3KyAKdB4tXVJ1QlTx2BanATGV72yeBD5LMRfvh1Cv9iKXRcPGTbxJYq0
         YDUMiadppJHGzrEpyAfjQ9KtnaIM4n5apD6H1Wol4QqGdj35aD3Er84eUiLd4woRMcW2
         PphgV9DG3ZGtLrSpIxnD85gbwhbxHUBObsC47alPOG6BvdYRar7oyP/gGFcDF1tJs22g
         7M7A==
X-Gm-Message-State: AOAM531LpX14Jj+0vSQDVtj2D6Ipc56g8w9zjV5xXI9/aeRoxbTADJSn
        ytB2esSTzE7hXoQQhoyI+Iw=
X-Google-Smtp-Source: ABdhPJw8RiADdfZF+1kTP16XsXSqydaKxM+H9npeMri+Y3OkJA1pYRYJYBv54k7zgaJLOyo1KLSWlg==
X-Received: by 2002:a5d:684d:: with SMTP id o13mr15467083wrw.302.1603025560974;
        Sun, 18 Oct 2020 05:52:40 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id u2sm11940158wme.1.2020.10.18.05.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2020 05:52:40 -0700 (PDT)
From:   kholk11@gmail.com
To:     todor.too@gmail.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        robh+dt@kernel.org, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH 0/6] Add support for SDM630/660 Camera Subsystem
Date:   Sun, 18 Oct 2020 14:52:31 +0200
Message-Id: <20201018125237.16717-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

This patch series implements support for the entire camera subsystem
found in SDM630/636/660 and SDA variants, including CSIPHY 3-Phase,
CSID v5.0, ISPIF 3.0 (though it didn't need any adaptation) and
VFE 4.8.

One small note about VFE4.8, even if I wrote it in the commit that
adds support for it: I know, the VFE support here is split in
multiple files having the name of the actual VFE version that it is
targeting... but it didn't feel right to commonize the VFE 4.7 file
and make another one only for VFE4.8, when it's just about something
like 3 small differences.
That VFE 4.8 seems to be just a minor revision of VFE 4.7.

While at it, also fix a small issue when using two VFEs: only one
of them was being resetted (always VFE0) so, after the first usage
of VFE1, in case we leave it in a bad state, it would not properly
start again. Now... it's fine :)))

P.S.: SDM630/660's camss seems to be *very* similar to MSM8998, so
      likely 90% of this series should be reusable on that one, too!

Tested on:
 - Sony Xperia XA2 (IMX300 on CSI0/PHY0/VFE0, IMX219 on CSI2,PHY2,VFE1)
   * VFE0/1 RDI only, as the VIDEO one does not work with SRGGB Bayer
     formats yet. As far as I can see, that color format hasn't been
     implemented yet in the video interface.

AngeloGioacchino Del Regno (6):
  media: camss: csiphy-3ph: Add support for SDM630/660
  media: camss: ispif: Correctly reset based on the VFE ID
  media: camss: vfe: Add support for VFE 4.8
  media: camss: Add support for SDM630/636/660 camera subsystem
  media: dt-bindings: media: qcom,camss: Add bindings for SDM660 camss
  media: camss: csiphy: Set rate on csiX_phy clock on SDM630/660

 .../devicetree/bindings/media/qcom,camss.txt  |   7 +
 .../media/platform/qcom/camss/camss-csid.c    |   9 +-
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |   7 +-
 .../media/platform/qcom/camss/camss-csiphy.c  |  25 ++-
 .../media/platform/qcom/camss/camss-csiphy.h  |   1 +
 .../media/platform/qcom/camss/camss-ispif.c   | 100 ++++++---
 .../media/platform/qcom/camss/camss-ispif.h   |   2 +-
 .../media/platform/qcom/camss/camss-vfe-4-7.c | 129 ++++++++++-
 drivers/media/platform/qcom/camss/camss-vfe.c |  19 +-
 drivers/media/platform/qcom/camss/camss-vfe.h |   1 +
 .../media/platform/qcom/camss/camss-video.c   |   3 +-
 drivers/media/platform/qcom/camss/camss.c     | 206 +++++++++++++++++-
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 13 files changed, 448 insertions(+), 62 deletions(-)

-- 
2.28.0

