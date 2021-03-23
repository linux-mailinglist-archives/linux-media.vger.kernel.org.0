Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75ED7345FC2
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 14:36:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231513AbhCWNgH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 09:36:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231477AbhCWNff (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 09:35:35 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E366AC061764
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 06:35:34 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id ce10so27125470ejb.6
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 06:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ntjagxyS+LYabIumqt5awpwriDBPHPu/LFN1q/dlMqM=;
        b=TqGjivAJb7F0P/srjBeMCJaPta0vld25XGxynx8tT96VQcBkepFegU4+lpcjSuBBGA
         AHeIEEOwypx68YJCIlNTKKzCZmsE2monoECPNz5j0xVOdfzEfcKPG2ZNgdf84WiggpF5
         l3li2arOaAAIj7SUAwr7p9IoSiQV+/vGkcot4rg7YqnKN5+eqgBZ7X3yeKnWfI4n8bQd
         4Tczl/rQkSNdC3dmzvT4PxL5yBJ4II2KjJ4TtpnpOiFsHWGLeLuvaqYLp3Paya7WxGjj
         lnjC+RHdcCIMVE9XMeS6vC8UyBOKp6qJiK5izzF5XdX2Mp/cprluWZHSjlmjxiaeIZjT
         cQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ntjagxyS+LYabIumqt5awpwriDBPHPu/LFN1q/dlMqM=;
        b=e6oHKLTfUUY/d8NhIwqI28Scl//9godZoU+mAnH6E4WiFelmzyKXMaa/87KNVnTJwH
         9RCvsHuFWs4feIT00Cq9wIPWynBDReRu/9d6iL1uCj/b2Kb6q6r8KBd605SGK5dpRiUx
         BY7SG+T3h11AFKAaZuuNXXv72UG8cvLrCwydi2N5s5wXrtUukazpydTi8B87CIVtCQq/
         ned/sKE4WI7++DPx8HYawVHpo/ZhDhDLC8i06WbMeXUq+MtomAed3TsmY+dou4Z7f9kw
         pCaYo6alOAQWhOWhTpOjzY9lFotKak5fa69vxQXBJgYVWjmo157OhBqnBUgWXCHhJ1EC
         oyyQ==
X-Gm-Message-State: AOAM533Om4znu9G6kcgk7dUTaqujoeRom7v4QjiZLXqFNf4AdmzK5zuA
        eOy3saMnaUc4rBflFUrRhdSJAmoPjQ9M3jZv
X-Google-Smtp-Source: ABdhPJwUJqV6+cN+QRopOAqXtcnPEV0jSss4iauXIjAOmCxfRNpfW/HmkPPkwO01/Xtjo0ifs7vI/w==
X-Received: by 2002:a17:906:e0d6:: with SMTP id gl22mr4925865ejb.444.1616506533482;
        Tue, 23 Mar 2021 06:35:33 -0700 (PDT)
Received: from localhost.localdomain (hst-221-103.medicom.bg. [84.238.221.103])
        by smtp.gmail.com with ESMTPSA id m7sm12627104edp.81.2021.03.23.06.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 06:35:33 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 0/2] Add decoder conceal color ctrl
Date:   Tue, 23 Mar 2021 15:35:18 +0200
Message-Id: <20210323133520.943317-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Changes since v2:

 * addressed Hans's comments 1/2 in documentation.

regards,
Stan

Stanimir Varbanov (2):
  v4l2-ctrl: Add decoder conceal color control
  venus: vdec: Add support for conceal control

 .../media/v4l/ext-ctrls-codec.rst             | 33 +++++++++++++++++++
 drivers/media/platform/qcom/venus/core.h      |  1 +
 drivers/media/platform/qcom/venus/hfi_cmds.c  | 18 ++++++++--
 .../media/platform/qcom/venus/hfi_helper.h    | 10 ++++++
 drivers/media/platform/qcom/venus/vdec.c      | 11 ++++++-
 .../media/platform/qcom/venus/vdec_ctrls.c    |  9 ++++-
 drivers/media/v4l2-core/v4l2-ctrls.c          |  9 +++++
 include/uapi/linux/v4l2-controls.h            |  1 +
 8 files changed, 88 insertions(+), 4 deletions(-)

-- 
2.25.1

