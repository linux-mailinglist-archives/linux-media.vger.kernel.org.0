Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21ACA2FCC3
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2019 15:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726768AbfE3N6u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 May 2019 09:58:50 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:46250 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbfE3N6u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 May 2019 09:58:50 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id CDE31607CA; Thu, 30 May 2019 13:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559224729;
        bh=ZhapyRz7rpO7+RXjnPRw8coTCr3ij19lsTGVLI65SL4=;
        h=From:To:Cc:Subject:Date:From;
        b=Q6+JwilLbIhB+XoM/3S6CaEKG5a6wNZx5/wkuJWPEAD0A5cUs0buLCy5OTbV1/9qO
         lG22IAs9K95buf1UgYiFVUoMSScNTJJPqYFbZfgNQ+4VILP+EGeMcHaKjbcrL5bAPk
         O41rBltZWg7/J1QtkiWuwFnTq+jyjFMGnJ2PGLas=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 722026049C;
        Thu, 30 May 2019 13:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559224729;
        bh=ZhapyRz7rpO7+RXjnPRw8coTCr3ij19lsTGVLI65SL4=;
        h=From:To:Cc:Subject:Date:From;
        b=Q6+JwilLbIhB+XoM/3S6CaEKG5a6wNZx5/wkuJWPEAD0A5cUs0buLCy5OTbV1/9qO
         lG22IAs9K95buf1UgYiFVUoMSScNTJJPqYFbZfgNQ+4VILP+EGeMcHaKjbcrL5bAPk
         O41rBltZWg7/J1QtkiWuwFnTq+jyjFMGnJ2PGLas=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 722026049C
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=amasule@codeaurora.org
From:   Aniket Masule <amasule@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Aniket Masule <amasule@codeaurora.org>
Subject: [PATCH 0/5] media: venus: Update clock scaling and core selection
Date:   Thu, 30 May 2019 19:28:23 +0530
Message-Id: <1559224708-6039-1-git-send-email-amasule@codeaurora.org>
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

Aniket Masule (5):
  media: venus: Add codec data table
  media: venus: Initialize codec data
  media: venus: Update clock scaling
  media: venus: Add interface for load per core
  media: venus: Update core selection

 drivers/media/platform/qcom/venus/core.c       |  13 ++
 drivers/media/platform/qcom/venus/core.h       |  15 ++
 drivers/media/platform/qcom/venus/helpers.c    | 189 +++++++++++++++++++++++--
 drivers/media/platform/qcom/venus/helpers.h    |   3 +-
 drivers/media/platform/qcom/venus/hfi_helper.h |   1 +
 drivers/media/platform/qcom/venus/hfi_parser.h |   5 +
 drivers/media/platform/qcom/venus/vdec.c       |   9 +-
 drivers/media/platform/qcom/venus/venc.c       |   8 +-
 8 files changed, 229 insertions(+), 14 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

