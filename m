Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01C8F26D09D
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 03:32:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726159AbgIQBcb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 21:32:31 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:54335 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbgIQBc3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 21:32:29 -0400
X-Greylist: delayed 365 seconds by postgrey-1.27 at vger.kernel.org; Wed, 16 Sep 2020 21:32:29 EDT
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 16 Sep 2020 18:26:22 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 16 Sep 2020 18:26:20 -0700
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg02-blr.qualcomm.com with ESMTP; 17 Sep 2020 06:56:07 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id C930921D3F; Thu, 17 Sep 2020 06:56:05 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [RESEND v2 0/4] Venus - change clk enable, disable order and change bw values
Date:   Thu, 17 Sep 2020 06:55:59 +0530
Message-Id: <1600305963-7659-1-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The intention of this patchset is to correct clock enable and disable
order and vote for venus-ebi and cpucfg paths with average bandwidth
instad of peak bandwidth since with current implementation we are seeing
clock related warning during XO-SD and suspend device while video playback
---
Resending as all patches not updated properly because
of some mailing issues

Mansur Alisha Shaik (4):
  venus: core: change clk enable and disable order in resume and suspend
  venus: core: vote for video-mem path
  venus: core: vote with average bandwidth and peak bandwidth as zero
  venus: put dummy vote on video-mem path after last session release

 drivers/media/platform/qcom/venus/core.c       | 29 +++++++++++++++++++-------
 drivers/media/platform/qcom/venus/pm_helpers.c |  3 +++
 2 files changed, 25 insertions(+), 7 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

