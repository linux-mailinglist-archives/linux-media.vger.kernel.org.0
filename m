Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3D5C1A6523
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2020 12:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbgDMKXe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Apr 2020 06:23:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728416AbgDMJjr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Apr 2020 05:39:47 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF845C008749
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2020 02:30:46 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id y4so1888017ljn.7
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2020 02:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id;
        bh=ZixBhzrJcAyOnyoJzh1q7blfE19WOYmijmH5Wvbza38=;
        b=gpBXOQmvEM2xy6G3j4DSwv3GDdp7wR3g78LfqrmXDZKvNMunLVekU7/7N2yIWfChIL
         BTTjTCbYwv1q0bTEy4BIG+8GINqc2dFSu2WvHSx2hzKsBCIbCWisgIWX9k16Gqim/Elp
         MP04JeKN5MQP/JdJIe2Wff8zv/sCifPsgoRTyrm7HWTM8FuaiLwXLLtze6zDr054Af8x
         yikzac8shHsTWIfHpTMzn7I9AKra7Tku9oAErlePfyns3k0HEYiFgvO1h3OXq1OS4UNb
         9nEzvMrlLIK5XXkagmWsTicFzFzWd5t86/qrU8WYkJJRHES6qevD51uLrEVPpdviwRAC
         9OfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=ZixBhzrJcAyOnyoJzh1q7blfE19WOYmijmH5Wvbza38=;
        b=WES3SKWUb00lGL8vm2Jb+2ruuG0CRU8y0ripXUQAHKbUKA2zBLLOAj/Fi3crYwM/91
         fMOfPBuqzJthWNTlEO9kn2Dm4XcybBXpEBQ7izHtPmESIjq5yYRG9Ew0UXTPsiO/OkHA
         GpruAJMBk8SkpXS9OTuAVdf0ZCA2RvcLkBa+ZgzS/m/OurM1x4S7ko0DcW0EheGiW20g
         MhANN5eVFMWDAK2KvI5m+9gvE2DURMbncXXnZiJYzejcq3CZ994EVQpXDWtzRqycHm12
         U8owY8rZQtcGq66rv5S+TYgRc38qhozuzbPOCq8PTxsLhynIrx+95l5nQ/URjgM0HuEa
         LK9g==
X-Gm-Message-State: AGi0PuY0N9k4Xaz9oFCUvSBJydulf+bGpMrXinfhO1sNj5ogpgnE11hV
        OxIflZUYp4NqeI62vrT2kQReLjFCX1s=
X-Google-Smtp-Source: APiQypJDlvjHjEKQ20Z88Uq3kHEnmbWDPuM7DvNXcqmHEy+BuYTSSxkxDpEqvaumQg0X4571Gz1gzg==
X-Received: by 2002:a2e:a303:: with SMTP id l3mr3098302lje.166.1586770245069;
        Mon, 13 Apr 2020 02:30:45 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-142.ip.btc-net.bg. [212.5.158.142])
        by smtp.gmail.com with ESMTPSA id v18sm9412985lfd.0.2020.04.13.02.30.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 02:30:43 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for v5.8] Venus updates
Date:   Mon, 13 Apr 2020 12:30:00 +0300
Message-Id: <20200413093000.5567-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The Venus driver updates include:

 - Added pm-runtime autosuspend for decoder.
 - Replace zero-length array with flexible-array member in hfi_cmds|msgs.
 - A fix for interconnect configuration NoC requests. 

Please pull.

regards,
Stan

The following changes since commit 2632e7b618a7730969f9782593c29ca53553aa22:

  media: venus: firmware: Ignore secure call error on first resume (2020-03-30 11:28:18 +0200)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.8

for you to fetch changes up to 0478a4dbb49856f941f1a2349d39000600f39821:

  venus: core: remove CNOC voting while device suspend (2020-04-13 12:10:42 +0300)

----------------------------------------------------------------
Venus updates for v5.8

----------------------------------------------------------------
Gustavo A. R. Silva (2):
      media: venus: hfi_cmds.h: Replace zero-length array with flexible-array member
      media: venus: hfi_msgs.h: Replace zero-length array with flexible-array member

Mansur Alisha Shaik (1):
      venus: core: remove CNOC voting while device suspend

Stanimir Varbanov (1):
      venus: vdec: Use pmruntime autosuspend

 drivers/media/platform/qcom/venus/core.c     |  15 ++-
 drivers/media/platform/qcom/venus/core.h     |   2 +
 drivers/media/platform/qcom/venus/hfi_cmds.h |   2 +-
 drivers/media/platform/qcom/venus/hfi_msgs.h |  10 +-
 drivers/media/platform/qcom/venus/vdec.c     | 134 +++++++++++++++++++++++----
 5 files changed, 133 insertions(+), 30 deletions(-)
