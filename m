Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09C89716FE5
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 23:41:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbjE3Vk4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 17:40:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233554AbjE3Vkw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 17:40:52 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21ABD11B
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 14:40:40 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f61530506aso53406985e9.1
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 14:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685482838; x=1688074838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1TlvuonkSjjlOLEcObUEavnK0dvpdAeYDopMtOIpLYM=;
        b=gXAhMV9/9GKve01fDtGfvpp3Jj0xDjalrBNlEs4zo9djHArdbNY6Unu3xdAeSctviR
         +3g5fC3BodjZ8+BZlDMuLmKpvJK3Ax6Rmroctxg+YEmiyQKxJSklKQgDaR0hz0OJSp9N
         mvTm1Q1/orNqDcC8znJzgnNuNxFyTJXnLYeFhUUdp/FHlbPHswRCSQf+F011XC+kSNP7
         AZtFXJiUgg94fuEd6Iwp7JtYA6E+2+3cx0ZBO1eDMJ6isRUmipWt5CZzvRkJVUPCzwbq
         WupCXYUaFnKXEeIC1OJLGeS+OTGipE04VIuT7vkoTaHFTahknQ3LB31z2L7FeryNUto3
         17mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685482838; x=1688074838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1TlvuonkSjjlOLEcObUEavnK0dvpdAeYDopMtOIpLYM=;
        b=d30iaZlomUJMftaPPVE0miRx0MXQ77jEA+VUizbEw40ho83ScKHXi4Ga7G41XApVxL
         lc80z6oC+/UoM5F3I1JqDq1eWYs2DEP6A2xV3v2dwzzUlg/mnmPzWkdce7iDHr1FWCge
         VUPFzAf4ep+V1jnZ3JSCXnhqDgCdcivpOK1pg8VsFWT34GGKm/eXLs/vleVHjRLamInZ
         vD2V+RF1bFvfHXwDIBPb1BfQe/VA9wLAzed2zJMP6HHq/+d8W9/Irt8ZYGkO7jLaxtFd
         9e9pRaBN0xryt2jDkay0XLwqdFfVcTFg3o0IQ4Wt2mlAwXW8A4+da4dH4hmULjynJrqz
         2+lA==
X-Gm-Message-State: AC+VfDwWUJDTrE8CBuf0S6N4reYbRro5pR0XanIkbeBx3lrTaKt533yx
        mXLQQ44P4WpGneiPpPyHsdRWJ7aqxOo=
X-Google-Smtp-Source: ACHHUZ7BKuaQ0kpwsXJPvvet0rzP68LXObGvPpEcCR8MJCzBfiUuOkr0i1ksjEixopo7PoOcMZ6XUw==
X-Received: by 2002:a05:600c:2246:b0:3f6:1430:7e71 with SMTP id a6-20020a05600c224600b003f614307e71mr2619487wmm.31.1685482838467;
        Tue, 30 May 2023 14:40:38 -0700 (PDT)
Received: from aero-laptop.. ([37.63.25.59])
        by smtp.gmail.com with ESMTPSA id q13-20020a7bce8d000000b003f43f82001asm22124763wmj.31.2023.05.30.14.40.37
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 14:40:38 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.5] Venus updates
Date:   Wed, 31 May 2023 00:40:33 +0300
Message-Id: <20230530214033.293439-1-stanimir.k.varbanov@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This time the pull request includes following changes:

 - Adds support for P010 pixel format.
 - Adds firmware version checks to fix an issue with sufficient sequence
change for VP9.
 - Few patches replacing one-element arrays with flexible-array members.
 - A patch to add per m2m ctx queue locking.
 - Few patches to simplify return expressions. 

Please pull.

regards,
Stan

The following changes since commit a23a3041c733e068bed5ece88acb45fe0edf0413:

  Merge tag 'v6.4-rc2' into media_stage (2023-05-14 22:55:40 +0100)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/tag-venus-for-v6.5

for you to fetch changes up to ecb5bc207d6bcababa14c240c9d11bd0cdf8b1d7:

  media: venus: provide ctx queue lock for ioctl synchronization (2023-05-31 00:19:09 +0300)

----------------------------------------------------------------
Venus updates for v6.5

----------------------------------------------------------------
Dikshita Agarwal (8):
      venus: add firmware version based check
      venus: enable sufficient sequence change support for vp9
      venus: fix EOS handling in decoder stop command
      venus: replace arrary index with enum for supported formats
      venus: add support for V4L2_PIX_FMT_P010 color format
      venus: update calculation for dpb buffers
      venus: add handling of bit depth change from firmwar
      venus: return P010 as preferred format for 10 bit decode

Gustavo A. R. Silva (4):
      media: venus: hfi_cmds: Replace fake flex-array with flexible-array member
      media: venus: Replace one-element arrays with flexible-array members
      media: venus: hfi_cmds: Replace one-element array with flexible-array member
      media: venus: hfi_cmds: Use struct_size() helper

Liu Shixin (1):
      media: venus: simplify the return expression of venus_sys_set_* function

Qinglang Miao (1):
      media: venus: simplify the return expression of session_process_buf()

Rikard Falkeborn (1):
      media: venus: helpers: Fix ALIGN() of non power of two

Sergey Senozhatsky (1):
      media: venus: provide ctx queue lock for ioctl synchronization

 drivers/media/platform/qcom/venus/core.h           | 39 +++++++++
 drivers/media/platform/qcom/venus/helpers.c        | 33 ++++++--
 drivers/media/platform/qcom/venus/hfi_cmds.c       | 19 ++---
 drivers/media/platform/qcom/venus/hfi_cmds.h       |  4 +-
 drivers/media/platform/qcom/venus/hfi_helper.h     |  2 +
 drivers/media/platform/qcom/venus/hfi_msgs.c       | 34 ++++++--
 drivers/media/platform/qcom/venus/hfi_msgs.h       | 14 ++--
 drivers/media/platform/qcom/venus/hfi_plat_bufs.h  |  3 +
 .../media/platform/qcom/venus/hfi_plat_bufs_v6.c   | 11 ++-
 drivers/media/platform/qcom/venus/hfi_venus.c      | 28 +------
 drivers/media/platform/qcom/venus/vdec.c           | 94 +++++++++++++++-------
 drivers/media/platform/qcom/venus/venc.c           | 35 +++++---
 12 files changed, 217 insertions(+), 99 deletions(-)
