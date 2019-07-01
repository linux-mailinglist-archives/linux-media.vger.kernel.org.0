Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A700B5B6F0
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 10:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727717AbfGAIgr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 04:36:47 -0400
Received: from mail-vs1-f73.google.com ([209.85.217.73]:38941 "EHLO
        mail-vs1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727653AbfGAIgr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 04:36:47 -0400
Received: by mail-vs1-f73.google.com with SMTP id p62so4224513vsd.6
        for <linux-media@vger.kernel.org>; Mon, 01 Jul 2019 01:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=ikrRopSlEMkZ/zgCzvflPQoQutKQZizmRq75KXvajME=;
        b=lI83tdkLW0r7Fd17b5wJYa0auFUVQhpc5hzbkn9CKu4bplZhjiGAGDM6NyzH8JRxvE
         xMyiIGMg+ZCLozv4TPJCrnLVAbkRa1OW+drnK4AjVM5UZXDcL6nwJxpQbmO3yjt/G4nP
         JY6tj0MajGOOiw27WH0+DAi4xjhbev6dKocg5GxgrYCoSdU9oKk0H+8crtZAzOh5vg1B
         N0pjR7NMpiQZk3yQriAoGhwicnnubjTrhn52gLJw3xejO7sCG+sdOmy6ON3gZL7GErBt
         wVaOyVDGIDOYq4lbnEm5zqwqgT8fR+As+GWHK0mBpXJHJw/zlhxmjLlueZEoI2uM5Dl6
         kxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=ikrRopSlEMkZ/zgCzvflPQoQutKQZizmRq75KXvajME=;
        b=hN+0JNs/R315fTJpKczz2fhlyEayo4RFetg9Lfr9IIXo9uZgpA6KdMpT1eDTMnZFJn
         03LP3jaue2ckawz6V4ylGooIKiBpP9Gnl/yfZLVtAHLu7I8ROYP7fIH9M6qaiqhILWid
         i3/LslW5pRiiURnkv/hyw3WEN0AtP4kmkzcAIzCMn4qbbjUUo1tjvK0fos6RFF4+t3tM
         0vrGLjlNEhvwhQhMGU0DrE4LOUMUlG4S4EwHNQ3TCB8PvmcnZPMXDI5PAspr4908RmaS
         W3Io2e5Afp0nNfN/tiY5CEEQEES0Y7IBu3UPfbFCA5StZAtiM0I/HOc9Mpf7d97LmjVo
         djWA==
X-Gm-Message-State: APjAAAXPVDFLX7NUp6SaCi6cxCmwpRZk5LTffW9WqKQJBMFNEIqiupQL
        F/Uz106Rz59gs4SLW9KzHGzBPINFhwpxPPhh2syPAefyLIQ0fWKj+iRhxVOw0jbW2ZWOdjQPhSY
        zA1DEmwh0nuXt7kx+IvkrdFuLTgIGo7AEBxN1hdcvdBT2hZ38nP7PFPwliiwQYdV6Qj8W
X-Google-Smtp-Source: APXvYqxJ3ghe4e0IqADQP/kmEnQrAR6x7xHgmxTDCiZwpr+w2OdgylM1IAz/woAkRRcH04KNKNSmdXRdVhc=
X-Received: by 2002:a1f:4107:: with SMTP id o7mr7833025vka.34.1561970206425;
 Mon, 01 Jul 2019 01:36:46 -0700 (PDT)
Date:   Mon,  1 Jul 2019 10:35:40 +0200
Message-Id: <20190701083545.74639-1-darekm@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH 0/5] cec: convert remaining drivers to the new notifier API
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        hverkuil@xs4all.nl
Cc:     Dariusz Marcinkiewicz <darekm@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series updates remaining drivers in DRM to use new CEC notifier API.

Those complement the "cec: improve notifier support, add
connector info" patch series and also replace 2 following patches from
there:
- [PATCHv8 09/13] dw-hdmi: use cec_notifier_conn_(un)register
- [PATCHv9 12/13] tda998x: use cec_notifier_conn_(un)register

None of those changes were not tested on a real hardware.

Dariusz Marcinkiewicz (5):
  drm: tda998x: use cec_notifier_conn_(un)register
  drm: sti: use cec_notifier_conn_(un)register
  drm: tegra: use cec_notifier_conn_(un)register
  drm: dw-hdmi: use cec_notifier_conn_(un)register
  drm: exynos: exynos_hdmi: use cec_notifier_conn_(un)register

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 32 +++++++++++++---------
 drivers/gpu/drm/exynos/exynos_hdmi.c      | 33 ++++++++++++++---------
 drivers/gpu/drm/i2c/tda998x_drv.c         | 27 ++++++++++++-------
 drivers/gpu/drm/sti/sti_hdmi.c            | 20 +++++++++-----
 drivers/gpu/drm/tegra/output.c            | 18 ++++++++-----
 5 files changed, 81 insertions(+), 49 deletions(-)

-- 
2.22.0.410.gd8fdbe21b5-goog

