Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7601327694D
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 08:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727094AbgIXGv0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 02:51:26 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:18478 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727000AbgIXGv0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 02:51:26 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 23 Sep 2020 23:51:25 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 23 Sep 2020 23:51:23 -0700
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg02-blr.qualcomm.com with ESMTP; 24 Sep 2020 12:21:10 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id C05FA21D59; Thu, 24 Sep 2020 12:21:08 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [PATCH v3 0/4] Venus - change clk enable, disable order and change bw values
Date:   Thu, 24 Sep 2020 12:21:02 +0530
Message-Id: <1600930266-9668-1-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The intention of this patchset is to correct clock enable and disable
order and vote for venus-ebi and cpucfg paths with average bandwidth
instad of peak bandwidth since with current implementation we are seeing
clock related warning during XO-SD and suspend device while video playback

Mansur Alisha Shaik (4):
  venus: core: change clk enable and disable order in resume and suspend
  venus: core: vote for video-mem path
  venus: core: vote with average bandwidth and peak bandwidth as zero
  venus: put dummy vote on video-mem path after last session release

 drivers/media/platform/qcom/venus/core.c       | 32 ++++++++++++++++++++------
 drivers/media/platform/qcom/venus/pm_helpers.c | 10 ++++++++
 2 files changed, 35 insertions(+), 7 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

