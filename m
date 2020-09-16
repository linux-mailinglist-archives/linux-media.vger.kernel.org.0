Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17BA526BFC9
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 10:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbgIPIt4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 04:49:56 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:46257 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbgIPItz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 04:49:55 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 16 Sep 2020 01:49:55 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 16 Sep 2020 01:49:52 -0700
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg02-blr.qualcomm.com with ESMTP; 16 Sep 2020 14:19:39 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id 26E3F21D3B; Wed, 16 Sep 2020 14:19:38 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [PATCH v4 0/3] venus: core: add shutdown callback for venus
Date:   Wed, 16 Sep 2020 14:19:31 +0530
Message-Id: <1600246174-31802-1-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
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
 drivers/media/platform/qcom/venus/hfi.c      | 17 ++++++++++++++++-
 3 files changed, 38 insertions(+), 5 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

