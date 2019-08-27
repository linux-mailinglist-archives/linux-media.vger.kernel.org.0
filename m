Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FACF9DD9C
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 08:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbfH0GXS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 02:23:18 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:59420 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbfH0GXS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 02:23:18 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id C15BD60DAB; Tue, 27 Aug 2019 06:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566886996;
        bh=8JDB7XEGpzAup5vhaZHeRs9FwAfWZJ2300GU6dey8g0=;
        h=From:To:Cc:Subject:Date:From;
        b=mEw+pjhC20Hs5D3av8Yqr+CtjJesRRC3MOHxE1RrtsIMK4O/U3rfs5HocUZW1DS7/
         bl8LfX07Ccwf2K+02pLwxuFJPPhvFBJxqhg9meEi9F6N1y5gkZGqOZbVjHm7MvaGQ0
         StEQJeGOVYtvcvd4Szgy8/jAs0vIc5raF/CpH0TM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from amasule-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: amasule@codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E504860CEC;
        Tue, 27 Aug 2019 06:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566886996;
        bh=8JDB7XEGpzAup5vhaZHeRs9FwAfWZJ2300GU6dey8g0=;
        h=From:To:Cc:Subject:Date:From;
        b=mEw+pjhC20Hs5D3av8Yqr+CtjJesRRC3MOHxE1RrtsIMK4O/U3rfs5HocUZW1DS7/
         bl8LfX07Ccwf2K+02pLwxuFJPPhvFBJxqhg9meEi9F6N1y5gkZGqOZbVjHm7MvaGQ0
         StEQJeGOVYtvcvd4Szgy8/jAs0vIc5raF/CpH0TM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E504860CEC
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=amasule@codeaurora.org
From:   Aniket Masule <amasule@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Aniket Masule <amasule@codeaurora.org>
Subject: [PATCH v7 0/3] media: venus: Update clock scaling
Date:   Tue, 27 Aug 2019 11:53:03 +0530
Message-Id: <1566886986-10329-1-git-send-email-amasule@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In this patch series, clock scaling and core selection methods are
updated. Current clock scaling is same for vpu4 and previous versions.
Introducing load calculations using vpp cycles, which indicates the
cycles required by video hardware to process each macroblock. Also
adding vsp cycles, cycles require by stream processor. Clock scaling
is now done more precisely using vpp and vsp cycles.
Removing core selection from this series, there will be separate patch
once issue related to power domain is fixed.

This patch depends on the following patches:
https://lore.kernel.org/patchwork/patch/1114762/ - Venus interconnect support for sdm845
https://lore.kernel.org/patchwork/patch/1114761/ - Venus interconnect support for sdm845

Changes since v6:
 - Removed core selection.
 - Corrected frequency calculations.
 - Removed instance lock used while iterating over buffers.
 
Changes since v5:
 - Corrected load_per_core calculations.

Changes since v4:
 - Added call to load_scale_clocks from venus_helper_vb2_buf_queue.
 - Modified check to match core_id in core_selection.

Changes since v3:
 - vsp_cycles and vpp_cyles are now unsigned long.
 - Core number counting aligned with VIDC_CORE_ID_.
 - Aligned hardware overload handling of scale_clocks_v4 with scale_clocks.
 - Added bitrate based clock scaling patch in this patch series.
 - Instance state check is now moved from scale_clocks to load_scale_clocks

Aniket Masule (3):
  media: venus: Add codec data table
  media: venus: Update clock scaling
  media: venus: Update to bitrate based clock scaling

 drivers/media/platform/qcom/venus/core.c    |  13 ++
 drivers/media/platform/qcom/venus/core.h    |  16 +++
 drivers/media/platform/qcom/venus/helpers.c | 188 +++++++++++++++++++++++++---
 drivers/media/platform/qcom/venus/helpers.h |   3 +-
 drivers/media/platform/qcom/venus/vdec.c    |   8 +-
 drivers/media/platform/qcom/venus/venc.c    |   4 +
 6 files changed, 209 insertions(+), 23 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

