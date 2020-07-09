Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BFAD219F6F
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2020 13:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727795AbgGIL67 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jul 2020 07:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbgGIL66 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jul 2020 07:58:58 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48997C061A0B
        for <linux-media@vger.kernel.org>; Thu,  9 Jul 2020 04:58:58 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id r12so2012559wrj.13
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2020 04:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=gHgWXTMGTgSJ9NzYNTwxkcCv5i1cvCfL1OrkN27Xvho=;
        b=tnHPMiKoFwJCftAE8SCg0kw8XH99fwSKXcvrjclQk5KumZPLQx8iVZbjVHV01m5o31
         b7Ajh+U/4PD7rAc6ZOhSWoQaHUp9f97KeTfDZIwK2Ty9dTc+62IYRmUPf22orpGpxm0a
         eXacwtRdXeteEBT6ljePIFJsgtXHM8COLkEXPVSwQxguBgqaK0rQBlEouxg7ow+ob0rW
         /zD4eYoi+YVEJOsQrJXLKPGMUYpSxrZqEHXbEMBeX7FoGShcixB86bnOVYpMQoX9jFXt
         AjayRUt9ET3KIFz1nMOa8WLOMcCuILTPfTiS/uAMBAumBNj243HdfpxuGlSL0OTT6MQF
         okEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=gHgWXTMGTgSJ9NzYNTwxkcCv5i1cvCfL1OrkN27Xvho=;
        b=B2oRyc0NqFU3jzPntWmm9fN+j2uCmt5RAczEBPcGmSctKeCLecGlPQQO43Mk2080mk
         q2Yo5t+F2iUL+JN2FKHb2AZoHJuLRHQKCRYeRYEF+GvOt9inHWA8wRhGWQsoNPIvKCqU
         9bQ2AXpS2iknB56cS8dUYchdcv+Demma+zz5ZuKWKUehCJxnHOOkLsaJEXBgE7sz3fNx
         p7mFe3sgW8hnOxAkFUrsSB3/vXtH4BdAy9w2PDVHQdL9tCxosSnyWN5Ap5o3V3HMUPrF
         ztQiTkYAb7hIYj5EGMHcTzbP0SNuqMUecFQXwGyPHzW6eZ/LcUr4/Es2f4lalFJZqWe5
         hDuQ==
X-Gm-Message-State: AOAM533N1OsYy3tSRlTEx3ign9RiY+xlgzDThbWaSl1LzKXjljGTKW2w
        nsSOEnQmOOdsbQgwImxmVVYwCw==
X-Google-Smtp-Source: ABdhPJyCuhps/FwjgEGCNRrbS5o38e0SWuvhsNtaS+uo0Brld9JdD09WDpyF2aDUN4l3vMi+qlU9vA==
X-Received: by 2002:adf:e68d:: with SMTP id r13mr59987094wrm.141.1594295937009;
        Thu, 09 Jul 2020 04:58:57 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-112.ip.btc-net.bg. [212.5.158.112])
        by smtp.gmail.com with ESMTPSA id v7sm5140737wrp.45.2020.07.09.04.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 04:58:56 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Elliot Berman <eberman@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 0/2] Venus - fix firmware load failure
Date:   Thu,  9 Jul 2020 14:58:27 +0300
Message-Id: <20200709115829.8194-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

These two patches fixed the problem with "failed to reset venus core"
seen with various firmware versions (including the one from linux-firmware)
on sdm845 and sdm850.

regards,
Stan

Stanimir Varbanov (2):
  firmware: qcom_scm: Add memory protect virtual address ranges
  venus: firmware: Set virtual address ranges

 drivers/firmware/qcom_scm.c                  | 24 ++++++++++++++++++++
 drivers/firmware/qcom_scm.h                  |  1 +
 drivers/media/platform/qcom/venus/core.c     |  4 ++++
 drivers/media/platform/qcom/venus/core.h     |  4 ++++
 drivers/media/platform/qcom/venus/firmware.c | 18 ++++++++++++++-
 include/linux/qcom_scm.h                     |  8 ++++++-
 6 files changed, 57 insertions(+), 2 deletions(-)

-- 
2.17.1

