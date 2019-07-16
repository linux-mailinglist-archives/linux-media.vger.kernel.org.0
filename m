Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4012D6A1B9
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2019 07:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbfGPFJa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jul 2019 01:09:30 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:58170 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbfGPFJ3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jul 2019 01:09:29 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 858CE61893; Tue, 16 Jul 2019 05:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563253768;
        bh=OR+b8xG3JN4MsGIuyUTtBg46Iqvq/JC/f+ljaZY+unU=;
        h=From:To:Cc:Subject:Date:From;
        b=ipoloAjbRrFj+6qc7Owizojii4CGwn9wEzBrvghhdWRfFDKdZWU3obsCFnZ6PHAml
         j+I+Ch3cuQ56NLFmC7KHXBdnUPz70lxFIePG4aBaoMGt7E78l1wblqQLfnRJXOVZgQ
         i7yX/KxESZOZxqmF9fHGAd2g5R+cfmENJGa+yElE=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1BB8B6063A;
        Tue, 16 Jul 2019 05:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563253768;
        bh=OR+b8xG3JN4MsGIuyUTtBg46Iqvq/JC/f+ljaZY+unU=;
        h=From:To:Cc:Subject:Date:From;
        b=ipoloAjbRrFj+6qc7Owizojii4CGwn9wEzBrvghhdWRfFDKdZWU3obsCFnZ6PHAml
         j+I+Ch3cuQ56NLFmC7KHXBdnUPz70lxFIePG4aBaoMGt7E78l1wblqQLfnRJXOVZgQ
         i7yX/KxESZOZxqmF9fHGAd2g5R+cfmENJGa+yElE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1BB8B6063A
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=amasule@codeaurora.org
From:   Aniket Masule <amasule@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Aniket Masule <amasule@codeaurora.org>
Subject: [PATCH v5 0/4] media: venus: Update clock scaling and core selection
Date:   Tue, 16 Jul 2019 10:39:10 +0530
Message-Id: <1563253754-12003-1-git-send-email-amasule@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In this patch series, clock scaling and core selection methods are
updated. Current clock scaling and core selection methods are same
for vpu4 and previous versions. Introducing load calculations using
vpp cycles, which indicates the cycles required by video hardware to
process each macroblock. Also adding vsp cycles, cycles require by
stream processor. Clock scaling is now done more precisely using vpp
and vsp cycles. Instance is assigned to core with minimum load, instead
of static assignment.

Changes since v4:
 - Added call to load_scale_clocks from venus_helper_vb2_buf_queue.
 - Modified check to match core_id in core_selection.

Changes since v3:
 - vsp_cycles and vpp_cyles are now unsigned long.
 - Core number counting aligned with VIDC_CORE_ID_.
 - Aligned hardware overload handling of scale_clocks_v4 with scale_clocks.
 - Added bitrate based clock scaling patch in this patch series.
 - Instance state check is now moved from scale_clocks to load_scale_clocks.

Aniket Masule (4):
  media: venus: Add codec data table
  media: venus: Update clock scaling
  media: venus: Update to bitrate based clock scaling
  media: venus: Update core selection

 drivers/media/platform/qcom/venus/core.c       |  13 ++
 drivers/media/platform/qcom/venus/core.h       |  16 ++
 drivers/media/platform/qcom/venus/helpers.c    | 215 +++++++++++++++++++++++--
 drivers/media/platform/qcom/venus/helpers.h    |   3 +-
 drivers/media/platform/qcom/venus/hfi_helper.h |   1 +
 drivers/media/platform/qcom/venus/hfi_parser.h |   5 +
 drivers/media/platform/qcom/venus/vdec.c       |   6 +-
 drivers/media/platform/qcom/venus/venc.c       |   6 +-
 8 files changed, 252 insertions(+), 13 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

