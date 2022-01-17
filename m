Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 099DD490BEC
	for <lists+linux-media@lfdr.de>; Mon, 17 Jan 2022 16:56:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240692AbiAQP4a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jan 2022 10:56:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240690AbiAQP43 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jan 2022 10:56:29 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD427C061747
        for <linux-media@vger.kernel.org>; Mon, 17 Jan 2022 07:56:27 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id l12-20020a7bc34c000000b003467c58cbdfso25420146wmj.2
        for <linux-media@vger.kernel.org>; Mon, 17 Jan 2022 07:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DsqyxsAVSlOxkHs/ktXlOIw0yzzlQm8nxft+ufPq6ZE=;
        b=Be35HJXMEKMEDeYomL0vE4JSstxzgh5Pw2+y6BLt5xqr0tVHCBQFkkRvcdoCQqw5P4
         G7uvxNF3mp3szyL3Mi+c6BcbUa37AR9OGg4+Qa7PS1NfWmg3LQGttAfgDkeFc594M3M0
         EdikTcg36rkSP0F1f1tm0IPUXyZiAC4RaB5Y2SW621B8M/3o+AT0+dRmEE4GPYa3EyRd
         GZS3V7skrUj+cf6DY0jiDSrDsj0FmMu/IlkKQ8Yk6dfO/axKpgAWNMtJI3KtQZ2nxu2B
         s1Tjg1IP8mbOChCX/usmY9i6c5bNTzQ72nqPt2AFQd9MZbvIvmVDBb2JZ+fF4At0VKI6
         jwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DsqyxsAVSlOxkHs/ktXlOIw0yzzlQm8nxft+ufPq6ZE=;
        b=M2mhaw8hzj2XjRrQEi59NYHVxEXbHyWxhaNReGToeV2AQxJRyKMz9MfptLQPNO+4TA
         sHTqkWsWtNvyxxc/6ECAaM7+XlLSbmPu1m90+QOwRp53RBKutKKh4VPvI+tMg8upXjGd
         gveLneukOvXajqmneEwYY+2F2gbfco7ZdKXGoRh57pft/ZqBsBv/04vNDYK0W4hyZrUv
         uEtZWGotEFAxpffDsyH98dzqX0xQ0XEsbnamXSWOb9CKezbvbbU8zqWKWpx+gUQSVIW4
         KOIHNtmu22aikP3Nagpxbx3p0hSODMtsmHuColDQ9v8n/g0WMKJdUebRxErU+1ciDIkG
         XL7g==
X-Gm-Message-State: AOAM5337Zse70HcgRMklFJo43Ddj8T32VQQnSlj4wiTWHczPzdNouX13
        0AsHYLRQ2yew8bFFLH5VIOp96t23qJawow==
X-Google-Smtp-Source: ABdhPJzahs8bcHSsKhULSprSsbqUAigoWScg0qPNCMMBkhA12fU/iySVFVyEzZ9GkhQKC/nO+JwuRQ==
X-Received: by 2002:a5d:6dd1:: with SMTP id d17mr21161718wrz.520.1642434986037;
        Mon, 17 Jan 2022 07:56:26 -0800 (PST)
Received: from localhost.localdomain (hst-221-60.medicom.bg. [84.238.221.60])
        by smtp.gmail.com with ESMTPSA id i82sm15542900wma.23.2022.01.17.07.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 07:56:25 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-api@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 0/6] Qualcomm custom compressed pixfmt
Date:   Mon, 17 Jan 2022 17:55:53 +0200
Message-Id: <20220117155559.234026-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Changes since v2:

- 1/6, Added a phrase that the format is opaque (Hans).
- 6/6, new patch to address an issue with reconfigure.

regards,
Stan

Stanimir Varbanov (6):
  v4l: Add Qualcomm custom compressed pixel formats
  venus: helpers: Add helper to check supported pixel formats
  venus: Add a handling of QC08C compressed format
  venus: hfi_platform: Correct supported compressed format
  venus: Add a handling of QC10C compressed format
  venus: vdec: Use output resolution on reconfigure

 .../media/v4l/pixfmt-reserved.rst             | 19 +++++++
 drivers/media/platform/qcom/venus/helpers.c   | 51 +++++++++++--------
 drivers/media/platform/qcom/venus/helpers.h   |  1 +
 .../platform/qcom/venus/hfi_platform_v4.c     |  4 +-
 .../platform/qcom/venus/hfi_platform_v6.c     |  4 +-
 drivers/media/platform/qcom/venus/vdec.c      | 35 +++++++++++--
 drivers/media/v4l2-core/v4l2-ioctl.c          |  2 +
 include/uapi/linux/videodev2.h                |  2 +
 8 files changed, 87 insertions(+), 31 deletions(-)

-- 
2.25.1

