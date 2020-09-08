Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCFC426090A
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 05:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728479AbgIHDnq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Sep 2020 23:43:46 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:58666 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728327AbgIHDnq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Sep 2020 23:43:46 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 07 Sep 2020 20:43:44 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 07 Sep 2020 20:43:42 -0700
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg01-blr.qualcomm.com with ESMTP; 08 Sep 2020 09:13:29 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id 320C021D04; Tue,  8 Sep 2020 09:13:28 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [PATCH 0/2] Venus - change clk enable, disable order and change bw values
Date:   Tue,  8 Sep 2020 09:13:25 +0530
Message-Id: <1599536605-4243-1-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The intention of this patchset is to correct clock enable and disable
order and vote for venus-ebi and cpucfg paths with average bandwidht
instad of peakbandwidht since with current implementation we are seeing
"video_cc_venus_ctl_axi_clk status stuck at 'off' " warnings and XO-SD
failures while streaming.

Mansur Alisha Shaik (2):
  venus: core: change clk enable and disable order in resume and suspend
  venus: core: vote for video-mem icc path and change avg, peak bw

 drivers/media/platform/qcom/venus/core.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

