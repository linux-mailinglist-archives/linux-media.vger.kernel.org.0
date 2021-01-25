Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 689863021E9
	for <lists+linux-media@lfdr.de>; Mon, 25 Jan 2021 06:48:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725960AbhAYFs2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 00:48:28 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:19708 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbhAYFs0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 00:48:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
  s=qcdkim; t=1611553706; x=1643089706;
  h=from:to:cc:subject:date:message-id;
  bh=Jc0pww2EeutSvXzzlyYPwaeU7Tg2Hh9IkScJ5YhJZCE=;
  b=Cq6gSEqXXHKGOs/JJ7FTO8C2vFxr4TCsLFWXieaZv+6DES7LFFyz4IYy
   hdDx4Wgl+X1B/tMzlZYj/pwB1ISLbLkqjy6skDoE4oVfpAJ85lAwT2CEr
   SFOY4Sa2cJ1gblb/yCA+SMWr05vEjqPjSzovupblgQvdl2qOI38ZFwei2
   E=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 24 Jan 2021 21:47:45 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 24 Jan 2021 21:47:44 -0800
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 25 Jan 2021 11:17:28 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id EE43921578; Mon, 25 Jan 2021 11:17:27 +0530 (IST)
From:   Dikshita Agarwal <dikshita@qti.qualcomm.com>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Subject: [PATCH v6 0/2] Add encoder ctrls for long term reference
Date:   Mon, 25 Jan 2021 11:16:56 +0530
Message-Id: <1611553618-17224-1-git-send-email-dikshita@qti.qualcomm.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series add the encoder controls for long term reference (LTR)
and support for the same in venus driver.

Dikshita Agarwal (2):
  media: v4l2-ctrl: add controls for long term reference.
  venus: venc: Add support for Long Term Reference (LTR) controls

 .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 18 ++++++++
 drivers/media/platform/qcom/venus/venc_ctrls.c     | 49 +++++++++++++++++++++-
 drivers/media/v4l2-core/v4l2-ctrls.c               | 14 +++++++
 include/uapi/linux/v4l2-controls.h                 |  3 ++
 4 files changed, 83 insertions(+), 1 deletion(-)

-- 
2.7.4

