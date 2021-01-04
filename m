Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 944002E8FE6
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 06:10:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727357AbhADFKc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 00:10:32 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:7178 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbhADFKc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 00:10:32 -0500
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 03 Jan 2021 21:09:52 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 03 Jan 2021 21:09:50 -0800
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg02-blr.qualcomm.com with ESMTP; 04 Jan 2021 10:39:34 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 164EE214AA; Mon,  4 Jan 2021 10:39:34 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v5 0/2] Add encoder ctrls for long term reference
Date:   Mon,  4 Jan 2021 10:39:29 +0530
Message-Id: <1609736971-14454-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series add the encoder controls for long term reference (LTR)
and support for the same in venus driver.

changes since v4:
- Rebased the changes on latest media tree
- Addressed the comments
- Added driver side implementation for new controls.

Dikshita Agarwal (2):
  media: v4l2-ctrl: add control for long term reference.
  venus: venc: Add support for Long Term Reference (LTR) controls

 .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 18 ++++++++
 drivers/media/platform/qcom/venus/venc_ctrls.c     | 49 +++++++++++++++++++++-
 drivers/media/v4l2-core/v4l2-ctrls.c               | 14 +++++++
 include/uapi/linux/v4l2-controls.h                 |  3 ++
 4 files changed, 83 insertions(+), 1 deletion(-)

-- 
2.7.4

