Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C24227247A
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 15:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726644AbgIUNCG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 09:02:06 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:61209 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbgIUNCG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 09:02:06 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 21 Sep 2020 06:02:05 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 21 Sep 2020 06:02:03 -0700
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 21 Sep 2020 18:31:42 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 31A134DEF; Mon, 21 Sep 2020 18:31:41 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        ezequiel@collabora.com, stanimir.varbanov@linaro.org,
        vgarodia@codeaurora.org, majja@codeaurora.org,
        Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v2 0/2] Add new controls for QP and layer bitrate
Date:   Mon, 21 Sep 2020 18:31:16 +0530
Message-Id: <1600693278-2669-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds frame specific min/max qp controls for hevc and layer
wise bitrate control for h264.

change since v1:
 corrected email.

Dikshita Agarwal (2):
  media: v4l2-ctrl: Add frame-specific min/max qp controls for hevc
  media: v4l2-ctrl: Add layer wise bitrate controls for h264

 .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 74 +++++++++++++++++++++-
 drivers/media/v4l2-core/v4l2-ctrls.c               | 15 +++++
 include/uapi/linux/v4l2-controls.h                 | 17 +++++
 3 files changed, 104 insertions(+), 2 deletions(-)

-- 
1.9.1

