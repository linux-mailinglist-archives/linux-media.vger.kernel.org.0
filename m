Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F33C02260C6
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 15:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727982AbgGTNXw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 09:23:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727062AbgGTNXt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 09:23:49 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 270CAC0619D4
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2020 06:23:49 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id b30so7403846lfj.12
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2020 06:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=KrAss4lc00W6QNDjWbi871nOrYWlFTN1XCNqWDD3xTU=;
        b=VZyRZ8ObOiDkJFkElvWyTKxxdXm9e4MYZm9YE30BwMl//sSArnmaw3oRZYtDwIDQ4W
         ejftejyWE5IdHtL2TKM/WE9ZLPWjLCCq6uVgraHoDXor3gUZkpc1QuVkGtQQcxRyba6p
         No9blhxvD66qzWU42jf14Cmst1vtPBQr2pxjCyQIiRGjOAJYimFyCCI3Va5CplUKsHb6
         PSikL/IGq8hBhNKFmUV9IMAK2d33qQGDgNBrM2JierbC9C7M/CHi5rUmPVuYTaFztUYe
         C352eI/yIDaBkHKJG+K0GN/FFvAbSkitcVBsYFRvVDrRSr6aGCZxZWhbNDJZJomGmHs6
         L7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KrAss4lc00W6QNDjWbi871nOrYWlFTN1XCNqWDD3xTU=;
        b=AkDKQDP8ANIdXkr5QJuYnlbmIg9gu7pFwjXHg4eaSEIg2QIY60Gv4EACTN5/c9bO4b
         5HZmxTnl+uk3lOa8s2o4cqIPfuRLFLWDLw+rPyDO3jL2pKYSYJ1E+mmc07ol9OFQzwKW
         tK5uaY4Fxdyir9zGbq+tRSZDPX14+IaNJi/yzLsbUC29JDTJKXxb+xEWmJTcYOskxA7R
         usvLNzAWzT5eSDjXGJTmRV3ZTCNQjlv5tg4fR3Gh7J/tjiqyZOIMSBXM6x2sNZw3dQ1K
         Qn0A2XpPq3OwxlL9E6K87Tje8VXRZcAcU5lkZFrXW/qZtNeS+AE9Z9RAtZGHoEiVvCOS
         YSiA==
X-Gm-Message-State: AOAM531Cp+3DOhkAGyvul82si9rU2WFfYHxHT19WNcIyRJbpj7Jh9bqb
        iTTkQLZTBWfgujDN4qrC4xxuK2xZEXA=
X-Google-Smtp-Source: ABdhPJwnQCUyckx2BckYhrK0HLOXPQ2J0bwLgJivl+wgL2+y7cZFqkZzofNiCa/h/g7WzB0ZtEKC7w==
X-Received: by 2002:ac2:4183:: with SMTP id z3mr7912099lfh.3.1595251427255;
        Mon, 20 Jul 2020 06:23:47 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id h6sm867829lfc.84.2020.07.20.06.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 06:23:46 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 0/6] Add new controls for CQ and Frame-skip
Date:   Mon, 20 Jul 2020 16:23:07 +0300
Message-Id: <20200720132313.4810-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This is a new series which adds Constant quality and Frame skip std
controls. The series is combined from two other series [1] and [2].

Changes:
 * added Reviewed-by Hans tag in 1/6 and 3/6.
 * fixed typos in 6/6
 * rebased on top of media/master

regards,
Stan

[1] https://www.spinics.net/lists/linux-media/msg171411.html 
[2] https://www.spinics.net/lists/kernel/msg3578260.html

Maheshwar Ajja (1):
  media: v4l2-ctrls: Add encoder constant quality control

Stanimir Varbanov (5):
  venus: venc: Add support for constant quality control
  media: v4l2-ctrl: Add frame-skip std encoder control
  venus: venc: Add support for frame-skip mode v4l2 control
  media: s5p-mfc: Use standard frame skip mode control
  media: docs: Deprecate mfc frame skip control

 .../media/v4l/ext-ctrls-codec.rst             | 48 +++++++++++++++++++
 drivers/media/platform/qcom/venus/core.h      |  2 +
 drivers/media/platform/qcom/venus/hfi_cmds.c  | 37 +++++++++++++-
 .../media/platform/qcom/venus/hfi_helper.h    | 10 +++-
 drivers/media/platform/qcom/venus/venc.c      | 20 ++++++--
 .../media/platform/qcom/venus/venc_ctrls.c    | 17 ++++++-
 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c  |  6 +++
 drivers/media/v4l2-core/v4l2-ctrls.c          | 12 +++++
 include/uapi/linux/v4l2-controls.h            |  8 ++++
 9 files changed, 154 insertions(+), 6 deletions(-)

-- 
2.17.1

