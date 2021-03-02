Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E07F132A868
	for <lists+linux-media@lfdr.de>; Tue,  2 Mar 2021 18:43:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349791AbhCBRgQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Mar 2021 12:36:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349996AbhCBLpa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Mar 2021 06:45:30 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F906C061793
        for <linux-media@vger.kernel.org>; Tue,  2 Mar 2021 03:44:36 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id dm26so1195048edb.12
        for <linux-media@vger.kernel.org>; Tue, 02 Mar 2021 03:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FUKuTJ1LDEzVO3XBC3k62B0BGBJI0QRnQDrxQFi6j1A=;
        b=fun8reQZEh6C+pMkSUWS75G0gTGU/orNT/mF4KmgY8W/sw6+nTaMq6jn/LyKbh4g6f
         HUE7VP3xN9V163qzooj6JY33uqVluF1ut5tEr61vs+PXAuvgiReRsDwkkKED/JC38O5K
         Jbd2EC8CWdWyK1ifZGHn07FMmyB4lnNZQLenK3TQBK9u96WHqPKqt+XSOfpVTsC9p1SH
         O0qqn69Xw0cUy5xsak8X/aksGjvbE07aoq06VEwoO2VSH/1sId/K+O4cZ1OYwJSBcHWf
         q69FmAmbwQhiwhro6MY5RPbtxDzw/9Qi9PG1svFs53F4CcTPV69hCKS4jp21DjM8ioeS
         gzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FUKuTJ1LDEzVO3XBC3k62B0BGBJI0QRnQDrxQFi6j1A=;
        b=dzz06HgcgPPiYitfEDx7+/T4A/LCnKiVIWPVgwnkWkiZNjKm5KeRizCmaG+LxMdBlZ
         1paFoTmQtkYR80j9jz4dNtY8pwKBPbVLqa7v+nl5TeOtN92pvg4UlIn/1lDe8ufuPi+i
         owoHBwF8EjuPpmXpqOKSmxuaD810ByeSyoMwsv5zQ8xFPXWfYJ3JoNNzE3id0HvkSPr5
         PLJAtFi1ZE0aABjuYdUpqO1Flzy1TW0c5W8fSbiHK8VtixGZBu4Tw1DNmhQA3/kPb9ft
         W1hBpXrA8YRNSq4v7thIfUIyjBFrquiXUud553IbPLM33HVaFjMJ6b69qi/EbeFZC9To
         iG7Q==
X-Gm-Message-State: AOAM530LYPSwi6syi7i32h7r1FtTPnm0b3ypfD/zSBdKJ1s9C1gTUH4j
        XGt0W+GRHQQE8RAYefhd7/cku6hn2XfzTgLq
X-Google-Smtp-Source: ABdhPJw+fo40jeKi+qv6b80N0rf+a2IVpwRJfPE1Z5vpM8bg0CT+NppoS8QsgCzy0Wcaopls37c1LA==
X-Received: by 2002:a05:6402:35c9:: with SMTP id z9mr11471416edc.94.1614685474801;
        Tue, 02 Mar 2021 03:44:34 -0800 (PST)
Received: from localhost.localdomain (hst-208-217.medicom.bg. [84.238.208.217])
        by smtp.gmail.com with ESMTPSA id x17sm18494897edq.42.2021.03.02.03.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 03:44:34 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 0/2] Add decoder conceal color ctrl
Date:   Tue,  2 Mar 2021 13:44:28 +0200
Message-Id: <20210302114430.3594475-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

The changes in v2 includes:
 * reformat the table in documetation to define Bits for different
   bit-depths of color formats.

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
 .../media/platform/qcom/venus/vdec_ctrls.c    |  7 ++++
 drivers/media/v4l2-core/v4l2-ctrls.c          |  9 +++++
 include/uapi/linux/v4l2-controls.h            |  1 +
 8 files changed, 87 insertions(+), 3 deletions(-)

-- 
2.25.1

