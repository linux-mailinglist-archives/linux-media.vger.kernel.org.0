Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AD1E55470
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 18:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729312AbfFYQ1n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 12:27:43 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:60980 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726740AbfFYQ1m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 12:27:42 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id BB7BF608CE; Tue, 25 Jun 2019 16:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561480061;
        bh=OQmDurrz4oeNBssRUIUWXCS8QrhdrRt1sbFPXIyNCxA=;
        h=From:To:Cc:Subject:Date:From;
        b=K/4eFNIq4GRXMTG6YCm+xJUEsGKVok8IKCvSd7u7fwYRgRSH52ZIWBP4/S/KhB1F8
         J1wk0dlzTZbUO7/4ercXe1fVz3MuJXfuk3ubHq3/2xMoIP4r+huj9pgmpt/I+gqCTT
         f1lg6BviW+yDMiehBXM6I4yrkhAC+W+jF23nmwY4=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 147816025A;
        Tue, 25 Jun 2019 16:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561480060;
        bh=OQmDurrz4oeNBssRUIUWXCS8QrhdrRt1sbFPXIyNCxA=;
        h=From:To:Cc:Subject:Date:From;
        b=FYMt7zlKERj993qidX4lwevPK0RPksf8hE013NRIDOBprvkaXDsCqiw78IbcwU4Ws
         EZ1XT2AsKTrSdkaCmk/1NDJB/tlDBfjj+h4LKeKWrT031B4bBFLowGn+9hfQlvjWri
         VECFMwPqnSadJg1fgGL5MOKkn73KZEvVRALVfbzY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 147816025A
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=amasule@codeaurora.org
From:   Aniket Masule <amasule@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Aniket Masule <amasule@codeaurora.org>
Subject: [PATCH v3 0/4] media: venus: Update clock scaling and core selection
Date:   Tue, 25 Jun 2019 21:57:20 +0530
Message-Id: <1561480044-11834-1-git-send-email-amasule@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In this patch series, clock scaling and core selection methods are
updated. Current clock scaling and core selection methods are same
for vpu4 and previous versions. Introducing load calculations using
vpp cycles, which indicates the cycles required by video hardware to
process each macroblock. Clock scaling is now done more precisely using
vpp cycles. Instance is assigned to core with minimum load, instead of
of static assignment.

Changes since v2 addressing the comments:
 - Codec_data and vpp_cycles have renamed to codec_freq_data and
   vpp_freq respectively.
 - Conditional check in patch 4 for checking max cores available
   is updated to VIDC_CORE_ID_2.
 - venus_helper_decide_core renamed to venus_helper_set_core.
 - scale_clocks_vpu4 renamed scale_clocks_v4.

For comment on freq fied in clk_data structure, it is getting initialized
and used in scale_clocks_v4 function. 


Aniket Masule (4):
  media: venus: Add codec data table
  media: venus: Update clock scaling
  media: venus: Add interface for load per core
  media: venus: Update core selection

 drivers/media/platform/qcom/venus/core.c       |  13 ++
 drivers/media/platform/qcom/venus/core.h       |  15 ++
 drivers/media/platform/qcom/venus/helpers.c    | 190 +++++++++++++++++++++++--
 drivers/media/platform/qcom/venus/helpers.h    |   3 +-
 drivers/media/platform/qcom/venus/hfi_helper.h |   1 +
 drivers/media/platform/qcom/venus/hfi_parser.h |   5 +
 drivers/media/platform/qcom/venus/vdec.c       |   6 +-
 drivers/media/platform/qcom/venus/venc.c       |   6 +-
 8 files changed, 226 insertions(+), 13 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

