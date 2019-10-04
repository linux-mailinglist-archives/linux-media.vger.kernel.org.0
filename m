Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0DE1CB589
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 09:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728462AbfJDH4j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 03:56:39 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43568 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbfJDH4j (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Oct 2019 03:56:39 -0400
Received: by mail-wr1-f68.google.com with SMTP id j18so5073258wrq.10
        for <linux-media@vger.kernel.org>; Fri, 04 Oct 2019 00:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id;
        bh=T0aTsWBtnsgUbgK2GTLviu/j9pyACv0Bs5fMxNMRJmA=;
        b=OSAvUs3vZZMiqxaOA44/aEXn5qp3/C+ZVbc2wDlv20UwXzwClX7cy+LOgMb252Au8B
         IYM3+Y9fkJnvh6Gm6Yf0ozKSd9PJOQwoiyQkcdSnD9VMr97G9zLb8jvcQxopJxI71GjW
         HD0XJeiuvZ6GlLiH2NQZDpS6jsFFvLfyrg72x0Yd3cw5owUNBW5c7dvyvaGlf9W1bUkK
         hnthKUHzmRd6LrleD7/85bL9ONNv0horLFG5U5FlsjHNyuMfgLtj00szT8mvw2AfDajg
         LNlqHisVq0JFkWPMYr9jdI0QGgqhJL9lOBUE0NjmuC8xElbtM65Mkb9L+cFpwOwie1wC
         ie6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=T0aTsWBtnsgUbgK2GTLviu/j9pyACv0Bs5fMxNMRJmA=;
        b=d1RZmTt4uPTdfg7OUESoUvUcH1ullL5MuBel7JA3ZxMl7i9e1RPF1kxcsmf7Qxn9em
         Cht2dMchNHgOarT41wYg2zmYGoseE5BM3BMPSvuhDg6+KpUpwM1Og6Fum1Wjky4E445a
         cbQ3IEqbzWZDe0PYd552WnNPgy3cj1wVq0jWqd2CV25pZ6Y3EA/BIFOo6R8DPv2I+G+v
         H+Ozx2ZFUiXr7fGdrTM7lBJUFwM7WN/Py5kgrtX28jrX98AB0ZJRxmlV7y7OaTT0u79A
         rzYntMiWVuzDKStCGytO/QB8KJnCFRADn7NLAOBJFLsbZVgaiQOKdbP047sYMT1UBpNR
         4xPQ==
X-Gm-Message-State: APjAAAVGNwD5e9oAAnPzCfDPssrIb8YiViLkbUfpVel74s7z0argz0us
        hf9p3Y/eYjXttADvACxsZBUs8FyB2fg=
X-Google-Smtp-Source: APXvYqyytoXJ+2HFXHwGoUnG52wyY5UOfYNdHAJu4M9sigdYloGsqfSP7zXrR2qQS/659GpqSjnFHw==
X-Received: by 2002:a5d:5111:: with SMTP id s17mr9560782wrt.59.1570175796475;
        Fri, 04 Oct 2019 00:56:36 -0700 (PDT)
Received: from mms-0440.qualcomm.mm-sol.com ([37.157.136.206])
        by smtp.gmail.com with ESMTPSA id p7sm6018681wma.34.2019.10.04.00.56.34
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2019 00:56:35 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for v5.5] Venus updates, take 3
Date:   Fri,  4 Oct 2019 10:56:17 +0300
Message-Id: <20191004075617.17328-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The Venus driver updates include:

* two fixes: fail to suspend and frequency table modifications for v3 to 
handle performance issues.
* two new features: interconnect bandwidth support on v4 and more precise
clock-scaling on v4.

Please pull.

Changes since v2:
Dropped "venus: venc: Fix enum frameintervals" patch. I send a new version
here [1]. If it gets reviewed and tested and if the time permits I will
send a new pull request for it.

[1] https://patchwork.linuxtv.org/patch/59149/

regards,
Stan

The following changes since commit 503e59365dd134b2c63864f14e2de0476284b003:

  media: i2c: ov2659: Switch to SPDX Licensing (2019-10-01 17:39:16 -0300)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.5-take3

for you to fetch changes up to b9909ff52973ce39af3f29dc93cbbeee19efec54:

  venus: Update clock scaling (2019-10-04 10:42:55 +0300)

----------------------------------------------------------------
Venus updates for v5.5

----------------------------------------------------------------
Aniket Masule (2):
      venus: Add codec data table
      venus: Update clock scaling

Loic Poulain (1):
      venus: core: Fix msm8996 frequency table

Stanimir Varbanov (2):
      venus: Use on-chip interconnect API
      venus: Fix occasionally failures to suspend

 drivers/media/platform/Kconfig                |   1 +
 drivers/media/platform/qcom/venus/core.c      |  56 +++++-
 drivers/media/platform/qcom/venus/core.h      |  30 ++++
 drivers/media/platform/qcom/venus/helpers.c   | 246 ++++++++++++++++++++++++--
 drivers/media/platform/qcom/venus/helpers.h   |   3 +-
 drivers/media/platform/qcom/venus/hfi_venus.c |   6 +
 drivers/media/platform/qcom/venus/vdec.c      |   8 +-
 drivers/media/platform/qcom/venus/venc.c      |   4 +
 8 files changed, 330 insertions(+), 24 deletions(-)
