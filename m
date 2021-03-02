Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40E2F32A85C
	for <lists+linux-media@lfdr.de>; Tue,  2 Mar 2021 18:42:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1580217AbhCBRao (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Mar 2021 12:30:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1577805AbhCBJym (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Mar 2021 04:54:42 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78B7CC06178B
        for <linux-media@vger.kernel.org>; Tue,  2 Mar 2021 01:54:01 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id mm21so33742246ejb.12
        for <linux-media@vger.kernel.org>; Tue, 02 Mar 2021 01:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7j7OEM/ymaPJfAqZdVgfn2Lno1HYW5rb20Fl48M4KC0=;
        b=w0I0jEwBaURpdTtjfwqPY8SsrsFt+1IbGa5hPfPk1jVQHD7a3HTGX31iApDo+WzAcb
         U2QaNp8FsSNSbBdiK2MgKweKoE9+rmH0tc8AXXlTxIYE24bpEiPdEr+InxUgfoE62KEc
         Kb/mY+A8zsW4GP7lnOH+yRSo0WUDiuF+sfGz07AoiY4cPp5uLV7RylttFiBNqAh6cf/P
         4i8uqf6ARpAAtEYkeS8JqNgyjQ38ASJcXr3YN56PVgC9PiscS3k/KHbdzwZ8Hdv1pn06
         QrG1Csf9vhF+OM6QRvVHXuEzNXT3vgtvR5l15A6KWkES+Y8MzBlh1wbBlP5AQ8/mp3hI
         m7wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7j7OEM/ymaPJfAqZdVgfn2Lno1HYW5rb20Fl48M4KC0=;
        b=cpqiNvdZULppyIckjkyCAt9oMrR59517RlxmIp6Tw56ZvZaJzT6QmG4MI2lGuu99DW
         +WViZ7R3h6UxlpchLJw3cfC1ujnRLLKAixXKpUiiRx1R0q1MrYjW3T48JrSFQcFZN1wI
         kK85kphmFnMvf+NOvZdR9B+hQ4P9e1LS42AkGF4HWbW6qMIY6P/4k+kvPqRp5slGFJAJ
         c14ktvtLnlMDo5LEMDxs3hcMYdXYv0odDihGPKKcSlkPSa3Aryl0yK9uhC6tvE7lxnvm
         VjXWSKWjxUl6a9zYLXQRiD4I4UYMlH13mA0dHrDqKF3TLRulZB5SpaUIL46GaEczjv79
         zvVg==
X-Gm-Message-State: AOAM532WbjAKehjKAfsGpfiGBQB33Kxlt9xJiAlmwpG36V8ptuP/DyIw
        KxRfVfMpTDlwpsxcx6iklb7J+6BmrK5AWRWb
X-Google-Smtp-Source: ABdhPJwGnIWYOZ6GGtyYRsVQX+UxoCX2/f1dF03MVr81u2TRpqq9+TEauPF2Vd6h1fUkxC2H/resAQ==
X-Received: by 2002:a17:906:780b:: with SMTP id u11mr20085171ejm.492.1614678839966;
        Tue, 02 Mar 2021 01:53:59 -0800 (PST)
Received: from localhost.localdomain (hst-208-217.medicom.bg. [84.238.208.217])
        by smtp.gmail.com with ESMTPSA id be27sm2530535edb.47.2021.03.02.01.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 01:53:59 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        nicolas.dufresne@collabora.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 0/2] Intra-refresh period control
Date:   Tue,  2 Mar 2021 11:53:38 +0200
Message-Id: <20210302095340.3584204-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This series add a new intra-refresh period control for encoders. The
series is a continuation of [1]. Comments addressed:
 * A typo in .rst (Hans)
 * Clarified the relationship with CYCLIC_INTRA_REFRESH_MB (Hans)

Comments are welcome!

regards,
Stan

[1] https://www.spinics.net/lists/linux-media/msg183019.html

Stanimir Varbanov (2):
  media: v4l2-ctrls: Add intra-refresh period control
  venus: venc: Add support for intra-refresh period

 .../media/v4l/ext-ctrls-codec.rst             | 12 ++++++++
 drivers/media/platform/qcom/venus/core.h      |  1 +
 drivers/media/platform/qcom/venus/venc.c      | 28 +++++++++++++++++++
 .../media/platform/qcom/venus/venc_ctrls.c    | 13 ++++-----
 drivers/media/v4l2-core/v4l2-ctrls.c          |  2 ++
 include/uapi/linux/v4l2-controls.h            |  1 +
 6 files changed, 50 insertions(+), 7 deletions(-)

-- 
2.25.1

