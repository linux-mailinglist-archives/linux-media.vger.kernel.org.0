Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2F3B314C14
	for <lists+linux-media@lfdr.de>; Tue,  9 Feb 2021 10:51:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbhBIJtD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Feb 2021 04:49:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230344AbhBIJrC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Feb 2021 04:47:02 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 983B9C061788
        for <linux-media@vger.kernel.org>; Tue,  9 Feb 2021 01:46:21 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id m1so2828466wml.2
        for <linux-media@vger.kernel.org>; Tue, 09 Feb 2021 01:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NtiOGrIIJ5Mm3MgDZJonQ2tOQT3ZSoFpEI0CN22UV14=;
        b=u5g39gXJIngfU1XExmEXBx8hqDny5vGFigabTUxsM0TPFIQA7FuqkLq0j7YwYUBp6f
         RskGlhaj1idVZ2wvXZ8yQTiP3S9PHjWg8ozxjUDFRsBgVrFd5AfAQmR7nnCt/DGONGs4
         PixCihIg+INClWp6UZmF0QmAgarFGkpMiuEJKNqSYrWxq1QSM8qh8xlnsItfRD5blKdO
         fG+QiD70qlCXlqR69gS+qAvpyV4uUPjl5p/+cqCeBSt67lGXPQ4ysvYYbnF6g86WPdSw
         oKS++DcM+hWzFUS1AICMoY0DQcI13BDLhDmVE1aviSr6fFaZNllS38oPY66PjFL6aBy0
         Xn6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NtiOGrIIJ5Mm3MgDZJonQ2tOQT3ZSoFpEI0CN22UV14=;
        b=GixquWARtBczQJdgyY1zTePRJjlPXSmxgeRPjp0s+hFxUPRIZ0fI7U7ukL9hoJkMrf
         e8Ksa2s7n2CtfRXHqmCrYjXstWtjxNO4nyNdg65YDVhrLcgz4kvwFlrIqdzR6ulbYuZ4
         PuEHcfXDk217pIPvtlmoOmADCttMJudndr9xKn5RZRs+mTDdDYqkYQqUngi+RaLDhjPo
         RhCXHNYt3KO86FrZCRotANxVKxyeq7yHe/wawj6vKdSbXE8c2t8shpLq270m6e9vFNw4
         WEsw44w3PrSaDRCiH6kyG4Lf06gCL9ahm7yX2ac1hw/MtTOyaFMqL0aK72539uqB8fiF
         EurA==
X-Gm-Message-State: AOAM53075Bpza4ni05nWCMk/5IP7DADDLqjS1z+8qf3VAiyKlnvE9wA6
        BJW0dVGpHrE3jKolOGcQqgrDXweF2Q018N8r
X-Google-Smtp-Source: ABdhPJxXQSPqb96K9C+tjUdGhrW9PVpw7siPtQwZ7h3AN8rn+JLKNtGm276sUZjhB5XDOFTFY1HKPA==
X-Received: by 2002:a1c:f70f:: with SMTP id v15mr2554723wmh.38.1612863980176;
        Tue, 09 Feb 2021 01:46:20 -0800 (PST)
Received: from localhost.localdomain (hst-221-63.medicom.bg. [84.238.221.63])
        by smtp.gmail.com with ESMTPSA id u14sm1509627wro.10.2021.02.09.01.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 01:46:19 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 0/2] Add decoder conceal color ctrl
Date:   Tue,  9 Feb 2021 11:45:25 +0200
Message-Id: <20210209094527.2173690-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

The first patch is adding a new control for conceal error color and the
second adds support for it in the Venus decoder driver.

Comments are welcome!

regards,
Stan

Stanimir Varbanov (2):
  v4l2-ctrl: Add decoder conceal color control
  venus: vdec: Add support for conceal control

 .../media/v4l/ext-ctrls-codec.rst             | 20 +++++++++++++++++++
 drivers/media/platform/qcom/venus/core.h      |  1 +
 drivers/media/platform/qcom/venus/hfi_cmds.c  | 18 +++++++++++++++--
 .../media/platform/qcom/venus/hfi_helper.h    | 10 ++++++++++
 drivers/media/platform/qcom/venus/vdec.c      | 11 +++++++++-
 .../media/platform/qcom/venus/vdec_ctrls.c    |  7 +++++++
 drivers/media/v4l2-core/v4l2-ctrls.c          |  9 +++++++++
 include/uapi/linux/v4l2-controls.h            |  1 +
 8 files changed, 74 insertions(+), 3 deletions(-)

-- 
2.25.1

