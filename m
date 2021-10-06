Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BAFF424998
	for <lists+linux-media@lfdr.de>; Thu,  7 Oct 2021 00:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239769AbhJFW2W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 18:28:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbhJFW2V (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Oct 2021 18:28:21 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2913C061753
        for <linux-media@vger.kernel.org>; Wed,  6 Oct 2021 15:26:28 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id x7so14725920edd.6
        for <linux-media@vger.kernel.org>; Wed, 06 Oct 2021 15:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VD3lIaPhwxpiFPvSjShOBn9yYub+GzlLOsSfdgfH8kY=;
        b=FO8Wgx3bjUhN1ufnB4gjIBjG9DMc46H0yRjb0uzZa5kYPh1snwafQOFSmo2/I4w+3J
         BHh8w/7Dba1gzA+3en8E3Bwvwkvpp05qYJU7tYqY9i0Ub/DtviLxk13jAnk53v5iJvcU
         L9X+KvJKFjZHbihc9IfR7r7EJSqxOdwULYx8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VD3lIaPhwxpiFPvSjShOBn9yYub+GzlLOsSfdgfH8kY=;
        b=PRbG1+r5wmadKJr7UwMJnkinySMCHHrKOor8C+a9+8fWDrSyEw3JjL6PLl9g7R6zN8
         drShPaITrdWehCACiPxOgiT6FBCf3TfTroUyafMLNdNHDXhqBZ1eANrcEwO3hYOpz4Oe
         Xd8UJ+1blpf/SOlUeMABB3M4jYbbDMCndlrFJ5v92zKvfYKnyDGT6R+AxuOsdE+TFeiI
         jMOWpqO0FzjxjXfOQFyzdPLRQaMHlwtRZ5RHrLL0hCre3EQBtKuYbCHNtCd0rwWF/2Xb
         y/J5L1/XSEGf432s9JX4RWQuXXQlrE5DC0hRB0qgvjS0pTpCmVaM9I5tMXKra2IpUg+T
         nmoA==
X-Gm-Message-State: AOAM5310I6h0zWeiB9lTp4TV27dgmegMaTq5KOKDBffouXCOzXglnRtl
        81aFwgTxTK7Xk+f37o1/Ptb+TQ==
X-Google-Smtp-Source: ABdhPJyCqpg4sG67zyv4UxQTzYgYY0dySDh7HFkarbDtzTbfvWP8Uml9YEN1YbtdpbkklAp7V5yIXA==
X-Received: by 2002:a17:906:1856:: with SMTP id w22mr1031739eje.393.1633559187318;
        Wed, 06 Oct 2021 15:26:27 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id h7sm10557906edt.37.2021.10.06.15.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 15:26:26 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v4 0/8] media: ipu3 + i2c: Fix v4l2-compliance issues
Date:   Thu,  7 Oct 2021 00:26:17 +0200
Message-Id: <20211006222625.401122-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix some issues found with v4l2-compliance. Tested in Soraka which also
has some subdevices that had some issues with v4l2-compliance.

Changelog:
v3->v4
- Rebase on top of Sakari's tree

v1->v3
- Rename cio2 to imgu
- Refactor bytesperline calculation

Ricardo Ribalda (8):
  media: ipu3-cio2 Check num_planes and sizes in queue_setup
  media: ipu3-imgu: Refactor bytesperpixel calculation
  media: ipu3-imgu: Set valid initial format
  media: ipu3-imgu: imgu_fmt: Handle properly try
  media: ipu3-imgu: VIDIOC_QUERYCAP: Fix bus_info
  media: dw9714: Add implementation for events
  media: ov13858: Add implementation for events
  media: ov5670: Add implementation for events

 drivers/media/i2c/dw9714.c                    | 14 ++++++++++++--
 drivers/media/i2c/ov13858.c                   | 11 ++++++++++-
 drivers/media/i2c/ov5670.c                    | 11 ++++++++++-
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  8 ++++++--
 drivers/staging/media/ipu3/ipu3-css.c         | 19 +++----------------
 drivers/staging/media/ipu3/ipu3-css.h         |  1 -
 drivers/staging/media/ipu3/ipu3-v4l2.c        | 11 +++++++----
 drivers/staging/media/ipu3/ipu3.h             | 12 ++++++++++++
 8 files changed, 60 insertions(+), 27 deletions(-)

-- 
2.33.0.800.g4c38ced690-goog

