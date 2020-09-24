Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F9882769E2
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 08:59:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbgIXG7y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 02:59:54 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:27029 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726902AbgIXG7y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 02:59:54 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 23 Sep 2020 23:59:54 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 23 Sep 2020 23:59:51 -0700
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg02-blr.qualcomm.com with ESMTP; 24 Sep 2020 12:29:50 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id CDB2521D59; Thu, 24 Sep 2020 12:29:48 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [PATCH v5 0/3] venus: core: add shutdown callback for venus
Date:   Thu, 24 Sep 2020 12:29:43 +0530
Message-Id: <1600930786-18275-1-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add shutdown callback for venus driver.
Handle race conditions in concurrency usecases like
multiple browser YouTube browser tabs(approx 50 tabs)
graphics_Stress, WiFi ON/OFF, Bluetooth ON/OF,
and reboot in parallel.

Mansur Alisha Shaik (3):
  venus: core: handle race condititon for core ops
  venus: handle use after free for iommu_map/iommu_unmap
  venus: core: add shutdown callback for venus

 drivers/media/platform/qcom/venus/core.c     |  9 +++++++++
 drivers/media/platform/qcom/venus/firmware.c | 17 +++++++++++++----
 drivers/media/platform/qcom/venus/hfi.c      | 12 ++++++++++++
 3 files changed, 34 insertions(+), 4 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

