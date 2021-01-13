Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE1CB2F48B3
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 11:32:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbhAMKaL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 05:30:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726898AbhAMKaL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 05:30:11 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 217B2C061795
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 02:29:31 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id d17so2290218ejy.9
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 02:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=O1ISGW1RaU0XNG0J5lpJPahfmekjOSoZHUoUK6eXzeY=;
        b=tpSYzA/7Owm4gVFs36ogemVFjXeDYR+jzWi4Cp4UMcA7mHlFrB0cpVoAAfLcJR6kET
         Q6CT4ymmP+DRgWCQVXkiHK3BKdzJgWcpWWRokCgPIGP3vBHT8iVYqaKy/vBq494I0G3O
         Y5SkiVY7r51r4dU6H779DFjkUJ10nGvUIuv3lNYF7UVMQSi9hxmnZTB5lDVH5Kt2wym0
         Tv1OARpOnqnjQObG16qloUrd8XMdBsraAmWCwfwDpsJx6WWtBFGPiDKgCsgmRXisNNGl
         1nkuMIK2jPkcOLTed9cRLlwkRmPVpWtgMKlJPASVIIf3Nhp7uLKkCFw3cec+DUQkWCL/
         U3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=O1ISGW1RaU0XNG0J5lpJPahfmekjOSoZHUoUK6eXzeY=;
        b=gb0SySWqNK3ukJvzZvuCn0J5mv2DpwYAGLiG07rS/7yK4WUvLOOQthtOe6+cdseGY6
         wolxWEX3kVyOKkl7GAjKoXckx9SWOzlVSci3c81+NUU5BjMziO7TVPtZTGEE26kegRe3
         eJVabjEP946nRLf3DkgE0H8zo6HKQFN0ZSZet9E6/6/W6g6V3Nce2Z/IpK45LnPZ+Nlg
         RfA3v6rOIedX0BM2OPXkIdCexbstIJNeYOCHAXhEPkLsz03iEWwE0sTDHJHSGuTdW/e+
         cMaSBoOjSUzUF2FDxfSsv3lyXa0u616B59k7YVFAqg9UHhJZmIPDTFnR6NrBIDE2V/lR
         MrLg==
X-Gm-Message-State: AOAM533iAxX06WU7UQFb6NOw86goZqxlUpCmUfK31iIkNaWPLB4fCyXB
        ZN/n1UVbBxPx/nbfuNQclt60TcPuKposDoaX
X-Google-Smtp-Source: ABdhPJxmf863ISkG6HUSgsuXyuhC9GiBpmDhAY8DCknXAyR9TX9tYt7SyZfcMin1m25CvnWirp2FMQ==
X-Received: by 2002:a17:906:1288:: with SMTP id k8mr1063584ejb.206.1610533769627;
        Wed, 13 Jan 2021 02:29:29 -0800 (PST)
Received: from localhost.localdomain (hst-221-90.medicom.bg. [84.238.221.90])
        by smtp.gmail.com with ESMTPSA id h12sm551253ejx.81.2021.01.13.02.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 02:29:28 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH] venus: hfi_plat: Fix warning for missing function prototype
Date:   Wed, 13 Jan 2021 12:29:20 +0200
Message-Id: <20210113102920.12841-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The bufreq_enc function should be static.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
index 072e349dd46c..d43d1a53e72d 100644
--- a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
+++ b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
@@ -1239,8 +1239,8 @@ static int bufreq_dec(struct hfi_plat_buffers_params *params, u32 buftype,
 	return 0;
 }
 
-int bufreq_enc(struct hfi_plat_buffers_params *params, u32 buftype,
-	       struct hfi_buffer_requirements *bufreq)
+static int bufreq_enc(struct hfi_plat_buffers_params *params, u32 buftype,
+		      struct hfi_buffer_requirements *bufreq)
 {
 	enum hfi_version version = params->version;
 	struct enc_bufsize_ops *enc_ops;
-- 
2.17.1

