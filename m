Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 913CD264655
	for <lists+linux-media@lfdr.de>; Thu, 10 Sep 2020 14:50:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730868AbgIJMtn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Sep 2020 08:49:43 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:11026 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730680AbgIJMo6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Sep 2020 08:44:58 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 10 Sep 2020 05:44:37 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 10 Sep 2020 05:44:35 -0700
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg02-blr.qualcomm.com with ESMTP; 10 Sep 2020 18:14:21 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id 90E2721D23; Thu, 10 Sep 2020 18:14:19 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [PATCH v2 0/3] Venus - Handle race conditions in concurrency
Date:   Thu, 10 Sep 2020 18:14:13 +0530
Message-Id: <1599741856-16239-1-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The intention of this patchset is to handle race
conditions during concurrency usecases like
Multiple YouTube browser tabs(approx 50 plus tabs),
graphics_Stress, WiFi ON/OFF, Bluetooth ON/OF,
and reboot in parallel.

Mansur Alisha Shaik (3):
  venus: core: handle race condititon for core ops
  venus: core: cancel pending work items in workqueue
  venus: handle use after free for iommu_map/iommu_unmap

 drivers/media/platform/qcom/venus/core.c     |  4 ++++
 drivers/media/platform/qcom/venus/firmware.c | 17 +++++++++++++----
 drivers/media/platform/qcom/venus/hfi.c      |  5 ++++-
 3 files changed, 21 insertions(+), 5 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

