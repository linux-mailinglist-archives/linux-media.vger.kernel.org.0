Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9C853C3C0
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 08:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403793AbfFKGFp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 02:05:45 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:45182 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391051AbfFKGFp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 02:05:45 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id CE2D060716; Tue, 11 Jun 2019 06:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560233144;
        bh=g8o/XaBmT++SLXNr1w/x/Na79QmBHhkYEa5Vnaxh1I8=;
        h=From:To:Cc:Subject:Date:From;
        b=fS2MnoxtfyWL2VqbUs0B02YzDi8i0VUS/za7m5dWrNP7vOUhWPJ4Cibl1TRZ59FCY
         94RDV/40gofB6sfEA/gEZI01yqyM4zWStGAI9MPcZgq8a/B4FovnYkb4I/pxsxRK8/
         GeWYqIY/1k6Mkvao8PqkQZe+iFz/DGGmFd+LrApQ=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5530D60240;
        Tue, 11 Jun 2019 06:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560233144;
        bh=g8o/XaBmT++SLXNr1w/x/Na79QmBHhkYEa5Vnaxh1I8=;
        h=From:To:Cc:Subject:Date:From;
        b=fS2MnoxtfyWL2VqbUs0B02YzDi8i0VUS/za7m5dWrNP7vOUhWPJ4Cibl1TRZ59FCY
         94RDV/40gofB6sfEA/gEZI01yqyM4zWStGAI9MPcZgq8a/B4FovnYkb4I/pxsxRK8/
         GeWYqIY/1k6Mkvao8PqkQZe+iFz/DGGmFd+LrApQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5530D60240
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=amasule@codeaurora.org
From:   Aniket Masule <amasule@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Aniket Masule <amasule@codeaurora.org>
Subject: [PATCH v2 0/5] media: venus: Update clock scaling and core selection
Date:   Tue, 11 Jun 2019 11:35:25 +0530
Message-Id: <1560233130-27264-1-git-send-email-amasule@codeaurora.org>
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
of static assignment

Changes since v1:
 - Corrected VPP cycles entries in codec data table.
 - Removed filled_len from arguments to calculate_inst_freq, 
   filled_len won't be used in this patch series.
   filled_len will be used in clock scaling based on bitrate.

Aniket Masule (5):
  media: venus: Add codec data table
  media: venus: Initialize codec data
  media: venus: Update clock scaling
  media: venus: Add interface for load per core
  media: venus: Update core selection

 drivers/media/platform/qcom/venus/core.c       |  13 ++
 drivers/media/platform/qcom/venus/core.h       |  15 ++
 drivers/media/platform/qcom/venus/helpers.c    | 186 +++++++++++++++++++++++--
 drivers/media/platform/qcom/venus/helpers.h    |   3 +-
 drivers/media/platform/qcom/venus/hfi_helper.h |   1 +
 drivers/media/platform/qcom/venus/hfi_parser.h |   5 +
 drivers/media/platform/qcom/venus/vdec.c       |   9 +-
 drivers/media/platform/qcom/venus/venc.c       |   8 +-
 8 files changed, 226 insertions(+), 14 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

