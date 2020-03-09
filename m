Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5DC17E3E3
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 16:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbgCIPqH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 11:46:07 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35323 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726866AbgCIPqH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Mar 2020 11:46:07 -0400
Received: by mail-lj1-f194.google.com with SMTP id u12so6277500ljo.2
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2020 08:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id;
        bh=7Si+GCP++fcrBa5/SJEYQn0DWCVcxKHRbAoO8aEp5A8=;
        b=G2tLJz+gXmlmqci99Ler+bptd5UaKXBBrEwWG6U8Mck9KeWQoutNeMaGvkhDRStCkf
         QOMWl1GKt/xfxJChluSDCze0F3sv8ggov1mMMqFXrmaTh62mOiu9l7D+YoX/96RDlQO3
         qtncrV1vEMP+QZsgyWgMoPUzrKpYsRWuaM4AShtw+721GgR8m+ztPIrsm2iXqB2OHcPt
         ZHT4tEp/6sBAi/TN7R4OiAFr0ptSbgFRbf6VLyuiVTmijc2MkslYHHxHUH4et1p/iXdJ
         0yJ/Zh06rZYRPSUs53Bcvn0HKu0tC5k0ijmC8DvOnmFVPpqAseggx5midj/2X6voFWpD
         nXYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=7Si+GCP++fcrBa5/SJEYQn0DWCVcxKHRbAoO8aEp5A8=;
        b=mRIQMCz8QzJsCmsCAz2OPhrgwkORNch2bwgRowFxOFzXeecosZcYQXjvMeMAm/rL6v
         uFb2t2dfV1aMX0zIun6w0a0kmneFUnzbN96LEDJ2n0iXbVWMRDJZryRT4BL1aqGOdG3H
         MquWox6CWqYMqk4DXMvxnz1ZiCzlc+/QHAtbiV8nLcauZa21/MgE4ZH0sQDfdmvwcV7a
         iNtNUL73JstTyz1L0n2F1x0VcpXShSLa1jrFZ+YaquRLRtv3qiUAj8AKiE+WJJZqAGwM
         WraLYRWVRtJRC/Ws0UpI1okAzM2OgGEG0Ek/mNNI3pOoWgEyPxOg1A0O6Vvb5qax1L89
         M/ww==
X-Gm-Message-State: ANhLgQ3Zr5RvSdDeICV25zD+rWZtM6rLnoOrsVXV5eBU3DIsGHz2qeiP
        hsb3fkeqxx9uh6JNY3a19wpcnyT1cZg=
X-Google-Smtp-Source: ADFU+vsOKL9FO+HVCtfffHmfpgiASzSizGoOb1DegeXPjH40D3jzDijVJZ63/kaqol4j5hm+cVIX4g==
X-Received: by 2002:a2e:b168:: with SMTP id a8mr148839ljm.29.1583768763716;
        Mon, 09 Mar 2020 08:46:03 -0700 (PDT)
Received: from localhost.localdomain ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id n12sm4828lji.77.2020.03.09.08.46.02
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 08:46:02 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL v2 for v5.7] Venus updates - part2
Date:   Mon,  9 Mar 2020 17:45:47 +0200
Message-Id: <20200309154547.19194-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here are two more patches for v5.7.

 - a smatch fix over Venus updates part1.
 - add support for frame rate v4l control.

Please pull.

Changes since v1:
 - changed patch subject per checkpatch warn
 - fixed identation per checkpatch warn

regards,
Stan

The following changes since commit 00c43088aa680989407b6afbda295f67b3f123f1:

  media: meson: vdec: add VP9 decoder support (2020-03-05 23:05:34 +0100)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.7-part2-v2

for you to fetch changes up to ba235963ae47dd9b6263ac72b6a3a71e6181d5c7:

  venus: support frame rate control (2020-03-09 17:33:26 +0200)

----------------------------------------------------------------
Venus updates for v5.7 part2 v2

----------------------------------------------------------------
Jeffrey Kardatzke (1):
      venus: support frame rate control

Stanimir Varbanov (1):
      venus: vdec: Fix forgotten mutex unlock in start streaming

 drivers/media/platform/qcom/venus/core.h       | 1 +
 drivers/media/platform/qcom/venus/vdec.c       | 2 +-
 drivers/media/platform/qcom/venus/venc.c       | 4 +++-
 drivers/media/platform/qcom/venus/venc_ctrls.c | 8 +++++++-
 4 files changed, 12 insertions(+), 3 deletions(-)
