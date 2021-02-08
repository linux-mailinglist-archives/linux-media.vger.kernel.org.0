Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A10AD3129E4
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 06:20:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbhBHFTq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 00:19:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbhBHFTp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Feb 2021 00:19:45 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57A9CC061756;
        Sun,  7 Feb 2021 21:19:05 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id a16so7183488plh.8;
        Sun, 07 Feb 2021 21:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mqsr8rkLfqpOE2FWxVDf35jXr09/PzAFAasrds1i32Q=;
        b=TH814+FIgkw5Nwo9ObaMWOcJlW2Hh7hsrlBQaUrSclETVIFhAXJVspuPXAiG+0pfyA
         cotIEqiz1piv77TF+mC4SeYJ1KugSbieP56GDHlyK++Pe4XjvKdfRKOYnbxvD0lRXoQa
         n4WXSisSfJPbeMKtPx7M7YP1HZVfdHMvDdUlII3lT4HuIc5ak6ueJErLCGkB32UdNG98
         AAiMx2V9tcNBfKdfxffg8k7N1yMc1BXAbOGhEELZexL1lwF2KWMS33tvwPrftxG3eAxm
         RQ6/IDN78qubElIhXWqwQiFcIrDWRZOhwskGcu97shTDGydoYGqG8xqQEDhdpaWXbpSV
         woBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mqsr8rkLfqpOE2FWxVDf35jXr09/PzAFAasrds1i32Q=;
        b=RA86JBUlv/8PzXfr5c5t5NQ1RUIgT1F6qGNdXo2ZPOTKXZOaxryDneIjzbguTZFtfq
         Fs728l8pUHzqQYJKrEpknuBI0rJMOLIvzaNcjht5b4MROVUfYW9fu6XIV0QTrKLaVTEV
         Kv1nQ0GwxGlDMTLVdRkye1OT1wA+LESfRwXhpXyqgMXtYQcNdTY2rF4rea0Dh1p0jP6P
         GSN5oooUM+lYyOlbNpuMTSddaxbtpCX5WNyvT0MppGSynsksYb8yc2eEn0HHXE8e/SzL
         QIzLd4i62oGuPgCLN+YhBrNypvEobe7DzKetLw6Ibvp2NebprM1tLEN1woaGB+ws3U4Q
         nOlQ==
X-Gm-Message-State: AOAM533TYAtLOzKL5nsjM63MGYAmyfx7IfzsEr0eEUwcZwCWsxMOgGzo
        v8IF9JllRAtKTEF2+kczoA8=
X-Google-Smtp-Source: ABdhPJy5yVAFDziJbToPQj71lV5UZ1A2Pok5+B47uY6iWi4GFEAKB/g7EFqBdIFGTDJIWRh1qiP0bw==
X-Received: by 2002:a17:90b:4a0b:: with SMTP id kk11mr15511727pjb.95.1612761544828;
        Sun, 07 Feb 2021 21:19:04 -0800 (PST)
Received: from localhost.localdomain ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id 1sm14644458pjk.34.2021.02.07.21.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 21:19:03 -0800 (PST)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        sergey.senozhatsky@gmail.com
Subject: [PATCHv2 0/3] Add UVC 1.5 Region Of Interest control to uvcvideo
Date:   Mon,  8 Feb 2021 14:17:46 +0900
Message-Id: <20210208051749.1785246-1-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

	Hello,

	RFC

This patch set adds UVC 1.5 Region of Interest support.

v1->v2:
- Address Laurent's comments

Sergey Senozhatsky (3):
  media: v4l UAPI docs: document ROI selection targets
  media: uvcvideo: add ROI auto controls
  media: uvcvideo: add UVC 1.5 ROI control

 .../media/v4l/ext-ctrls-camera.rst            |  25 +++
 .../media/v4l/selection-api-configuration.rst |  23 +++
 .../media/v4l/v4l2-selection-targets.rst      |  21 +++
 drivers/media/usb/uvc/uvc_ctrl.c              |  19 +++
 drivers/media/usb/uvc/uvc_v4l2.c              | 143 +++++++++++++++++-
 include/uapi/linux/usb/video.h                |   1 +
 include/uapi/linux/v4l2-common.h              |   8 +
 include/uapi/linux/v4l2-controls.h            |   9 ++
 8 files changed, 246 insertions(+), 3 deletions(-)

-- 
2.30.0

