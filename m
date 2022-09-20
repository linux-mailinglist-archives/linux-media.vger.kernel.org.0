Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 437725BF0AF
	for <lists+linux-media@lfdr.de>; Wed, 21 Sep 2022 00:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbiITW5w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Sep 2022 18:57:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiITW5s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Sep 2022 18:57:48 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F47B71BDA
        for <linux-media@vger.kernel.org>; Tue, 20 Sep 2022 15:57:43 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id y3so9765436ejc.1
        for <linux-media@vger.kernel.org>; Tue, 20 Sep 2022 15:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date;
        bh=cMIEC+/8gNosY0ckhHMIkQhSMNNRlILZApKp3aKWkGk=;
        b=fErqjyjn5l5kh85qOslyNle1VLrOTCpc9/pqSi+znind6gtqQzn4WpGT0k8Npc9JKe
         aYfzKbdK7h2Skk11x+0070exVy56WU/wsf3aOqWkhO66ZHzW8aLAzAT33jQXpczQPm7a
         xtU/9B9/qtbKPrA/KWlxCsGEe5F8zTw4N7VM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date;
        bh=cMIEC+/8gNosY0ckhHMIkQhSMNNRlILZApKp3aKWkGk=;
        b=qLNr23ByykDN4UfryAtR+8ATYObVHEnAfJVUtq3iBBVIc4MwzG1vkvgys6OdTXOfl4
         YdSvc8+l0esKDAu6R+1oC98jqmGIxuxQYDcAJdbjPAcgn1Vezgm0DDauvawL9X3vkS13
         bTLxIYVXIisABk+a9ffxgZ8Z5iW6mX1pHvhsiXRFck17sGFMAQeY8aA4aXHQaHFGOpGz
         gD3FO9C/iXGRv5izUvNHxDzl6ysdLZKrjVMmXb3qzEQ+koulaQuQSc68E4+voVfyQG6K
         hX2+fEqBxv3+hRI9blIwkIco/fyMMB18EGiOf7FB1TwwwHiZIuSd2GEPcxCwE6rUDpAN
         6ogw==
X-Gm-Message-State: ACrzQf1br6tgg7WgRe9fEm1dI8XXe8CRji+p19/LIWiQpjUpwnM19Av2
        HCdZVJ2pnsRqDgPZfH6OjCFg4G0iWXrOjumKCUQ=
X-Google-Smtp-Source: AMsMyM5cnihxSH6f037lGUNPEKF+8EvkHAAznG6i6pcZoLtt4PyPZIwvZE1kqLYwYaW7isxQP+ZgSw==
X-Received: by 2002:a17:906:8a76:b0:781:7530:8b05 with SMTP id hy22-20020a1709068a7600b0078175308b05mr7712222ejc.489.1663714661642;
        Tue, 20 Sep 2022 15:57:41 -0700 (PDT)
Received: from alco.roam.corp.google.com (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id g13-20020a170906538d00b0073100dfa7b0sm531832ejo.8.2022.09.20.15.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 15:57:41 -0700 (PDT)
Subject: [PATCH v2 0/2] media: uvc: Get menu names from framework
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAFhFKmMC/3WNwQrCMBBEf6Xs2UiyRWs8+R/iIU3WJtAmsNsUpPTfDd49DW/gzewgxIkE7t0OTF
 uSVHIDPHXgo8sTqRQaA2pEbVErWV0OjoNaKFcSdQ2D7v1leGNvoFmjE1Iju+xj83Kd51bGJGvhz+9l
 My2e/wc3o7S69Xaw1lgkGx4+cllSXc6FJ3gdx/EFpBPygrYAAAA=
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 21 Sep 2022 00:57:28 +0200
Message-Id: <20220920-standard-menues-v2-0-a35af3243c2f@chromium.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
X-Mailer: b4 0.11.0-dev-d93f8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=VMy89JO7FygCS8BFCye9k25GaVr7pUaGnXwG39WZsA8=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjKkVa0eu9xK44OA47AIsia7k9TErjVVUmi6BGEgHi
 sPMvomGJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCYypFWgAKCRDRN9E+zzrEiFBLEA
 CUJLn6aX/DfdKZ9QVcftt1CMhYt1eV3W3EEWsCTe9duuzY+Jj7QQ6ruqsno+7/AUOKxL/Ax3q3U81z
 VI4vHnWfXmbhC0Y8DlgabvFdrcKxmxfScJ7jkNYHYKYaMS0d3SvyTvCwvvm6GLSU1J29wkRIxfkraj
 WEMqoDkBvRRTzv1LwLhw7roCEepwAjLy+6F8x6gPvML2ij/kOtbXH4Q7wT3y5dRhUGTYb7i+MLFLLp
 F16rWr/9+c40bS0eF6902n/rVTM/2sI7JDSKKF7Kngq4R0UF0kUEeeCRnqJA+h21jkJW1ScojN82Yj
 sdzUBlzKgImS/nDf4m4qRn7VWx7wHWCrd8JNGTb66OmbFUi1ubGAmxU6y/Vg2/rAM14nJwS/ghr2As
 vnrzJGdeS+nrJTvyFOFNlQ4P7+2JwC6Ah/lcQuBJdaofS0T/NC0SN99UiUtLE/w4CkSsB9W7E/aQR5
 iQCBpLIHpguLQtIQu552K8u7JSfvrQ2sO5OqkYR4ZNhkbq9VIWzaFMJ17kBg22HDyR7Dgq3cqvyQyN
 odvGRlCi6qI81Gu1k97ABFmbFN/2/5BnZCrWZRDDAt1npoVaWnsG1dyuIJzHbKM6vHjbey9shhct8e
 HcAgtoU0uya7jnKTav+GlW7UXja3W3iQLfShE/64K4jKpof30SPOnwNEIiCA==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Do not have a local copy of the item names. Instead use the ones from the
v4l2 framework.

To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

---
Changes in v2:
- Remove unused variables
- Link to v1: https://lore.kernel.org/r/20220920-standard-menues-v1-0-839799192e9d@chromium.org

---
Ricardo Ribalda (2):
      media: uvcvideo: Implement mask for V4L2_CTRL_TYPE_MENU
      media: uvcvideo: Use standard names for menus

 drivers/media/usb/uvc/uvc_ctrl.c   | 136 +++++++++++++++++++++++++------------
 drivers/media/usb/uvc/uvc_driver.c |   8 +--
 drivers/media/usb/uvc/uvc_v4l2.c   |  81 ++++++++++++++++------
 drivers/media/usb/uvc/uvcvideo.h   |   5 +-
 include/uapi/linux/uvcvideo.h      |   3 +-
 5 files changed, 162 insertions(+), 71 deletions(-)
---
base-commit: 521a547ced6477c54b4b0cc206000406c221b4d6
change-id: 20220920-standard-menues-6d703c57f231

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>
