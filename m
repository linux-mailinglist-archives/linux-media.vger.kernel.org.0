Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86E43311697
	for <lists+linux-media@lfdr.de>; Sat,  6 Feb 2021 00:19:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbhBEXGl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 18:06:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231547AbhBEKpk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 05:45:40 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1290C0617A7
        for <linux-media@vger.kernel.org>; Fri,  5 Feb 2021 02:44:52 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id y187so5526128wmd.3
        for <linux-media@vger.kernel.org>; Fri, 05 Feb 2021 02:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=omqwj2z9F9rHihQvE5my1Bq8ugVfe2upOvjFAe2eO3E=;
        b=DUta3lZ0jeeI2mfAqLuOr0LoAqSjyP23YOvSA+MGuTzk4YeiWS8LBvmcgwrS5tCvYV
         fnucjozO55ga96eLIstQFcnyycgJgSiRHBXPjGIfIVJtqWTLT8AHvi5U/IWsqoullzsu
         a/bkI/nGkbAkbYEYBkrEMKgd76oXlQ52qYWzKCPSRUkDNSMTO+prsyg0ttXvd43Okgs4
         rY8YKdEx3U1dOy7Ee5b+N2KLj5rvWz68ZF2SsKe+3PuLUyodvTyejV1jIsrbJ2hApeNZ
         MUnBp8pxIqbe6AJU1jK7H0V1GRNKrynctXEho6kmk+BTRmFF4rcToQqSHX/oNp5FZU//
         AMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=omqwj2z9F9rHihQvE5my1Bq8ugVfe2upOvjFAe2eO3E=;
        b=JAJWdBlBVQiN2XEf1ca4j1+sxWtthjxL3D2EiBWLPF9iQOe5m3LHuSaB0FFdvWYixK
         bAQ/PtCsukpaTIbaQulRafhHAJUW6yFLZxmbcoIpraBBJTrfSoylFK7FhXcMxcredCiF
         VwnLSvry5d1HqWbjv1UyBA5XlkAzfU+MOkNiWaqnExoPuM6nR7sjeiClXw2rQMyqqchP
         ppFNV80OJ5s1caC/cbChSZ6J6C9bZOU8Safp1N/8FkBXD0VvaGLoSIugZEaVVn60AYUP
         hgmZCUdEPXwmkBOEdwryM8jaOx9AGvPiPUuazBQUDtYqCCYwgA9lvbSN2k3MTbIdy8eF
         LkFA==
X-Gm-Message-State: AOAM531v+CRmT3Ta5q8gnc6AxFBUv5zcUMJDN2Z/cDKcpIcSQuUrEjD2
        d+GP7umyalD0k2HyqlS2rRnzJg==
X-Google-Smtp-Source: ABdhPJxPUNLwMwT4bGzn7FeYdysUYRlPlp0U/g7xufG2oYznDmaogyxykCu85IMPt+dilZ2bj9kO0g==
X-Received: by 2002:a1c:7fca:: with SMTP id a193mr3052465wmd.189.1612521891428;
        Fri, 05 Feb 2021 02:44:51 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:38fd:e0db:ea01:afc8])
        by smtp.gmail.com with ESMTPSA id u4sm11300233wrr.37.2021.02.05.02.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 02:44:50 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v4 01/22] media: camss: Fix vfe_isr_comp_done() documentation
Date:   Fri,  5 Feb 2021 11:43:53 +0100
Message-Id: <20210205104414.299732-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210205104414.299732-1-robert.foss@linaro.org>
References: <20210205104414.299732-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Function name is comment is wrong, and was changed to be
the same as the actual function name.

The comment was changed to kerneldoc format.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---

Changes since v1
 - Bjorn: Fix function doc name & use kerneldoc format


 drivers/media/platform/qcom/camss/camss-vfe.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index fae2b513b2f9..94c9ca7d5cbb 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1076,8 +1076,8 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 }
 
-/*
- * vfe_isr_wm_done - Process composite image done interrupt
+/**
+ * vfe_isr_comp_done() - Process composite image done interrupt
  * @vfe: VFE Device
  * @comp: Composite image id
  */
-- 
2.27.0

