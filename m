Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF132D737A
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 12:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730924AbfJOKkg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 06:40:36 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35293 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730938AbfJOKkg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 06:40:36 -0400
Received: by mail-pl1-f193.google.com with SMTP id c3so9401515plo.2
        for <linux-media@vger.kernel.org>; Tue, 15 Oct 2019 03:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6sUe102WmCGNG69XyC7H68ebG+erg/HTvpRcXVfkmdA=;
        b=YzkwwH9SpTwmW326gAUYLA2ZSteCTi2HpMaq6wnFYkQVodejCp741VJ16Ynl7ldXCh
         IbGMk4nRPJzJ2Eh5nbRgJU6374IKuur5e1XwNdRFAKAY4vYTutTNYLiBRcvaCma4IbZ+
         0Kot4X+p6KU9aSxiNa69t0rELZ6+HxnDaLlYGbpbNdcsbYV4uhmipBEtsqC6hmIlr1bH
         qRT3oRpZcf5YV50g6WxwL6h/FTb/HSOQb9+9kHkskZmDJZmqKSELabUt36cs9H+wdudO
         IT3SpGrfaqpFoB1jokRl9ghcp05U+BM8YVaDrlvty+1q9PU84/5DexDohISCEM/+gSNJ
         jdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6sUe102WmCGNG69XyC7H68ebG+erg/HTvpRcXVfkmdA=;
        b=MQ6/d4toxqbKBPkDbqkSuuwbOqdQcWAeSoEMQGMJbw3XTAPErd27oQ4oElL7GmjMC9
         RPi0dKPaX7k2V83QDFE9CCPDvgGd8AXChsE8FSc6xj+QRyEohFp7JUKQovtNY9MrUTbA
         xBw6cIkzodhVzLsLBSFyBla2j2ThkMRBEP3opLa4lG9cHlB/C11o6+K2uKYFuHUh2aVR
         Hha5y2n0/CjPpLrw4wxTw20H1GUZ1lncAcxWG3y6p1YviLmnnef7HfBTOIg5nCYP8elC
         PustOoxf/wFCjPdLWjpkQqDooFdZxBbF+m/tWt923eqFjYFqiNOB+mHBkdWDH2vYJQvS
         yVGw==
X-Gm-Message-State: APjAAAXMIXU1jGP5Ld+mGpxsL8npY7sAwD6SGNbx31YSLxDcOXEeTkIa
        y9qLiJn0FRKSyTt77Ete2mMTBaiR
X-Google-Smtp-Source: APXvYqwTG9BjrttXm7rgQPSxHdg2m/n8w5csUUbdoYOqAUXdV1jKTQaEvTwWUJfua2IQXYXbgWVeGw==
X-Received: by 2002:a17:902:a618:: with SMTP id u24mr34377004plq.112.1571136034756;
        Tue, 15 Oct 2019 03:40:34 -0700 (PDT)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([117.241.198.230])
        by smtp.gmail.com with ESMTPSA id r18sm15306328pgm.31.2019.10.15.03.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 03:40:34 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH v11 0/3] vivid: Metadata support
Date:   Tue, 15 Oct 2019 16:10:14 +0530
Message-Id: <20191015104017.13722-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191008072757.22752-1-bnvandana@gmail.com>
References: <20191008072757.22752-1-bnvandana@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds metadata support in vivid driver.
Metadata capture supports UVCH format V4L2_META_FMT_UVC as it is widely used in webcams.
https://hverkuil.home.xs4all.nl/spec/uapi/v4l/pixfmt-meta-uvc.html
For Metadata output a new format V4L2_META_FMT_VIVID is added,
which is used to set brightness, contrast, sturation and hue.

Changes in V11:
	fix in metadata output patch to correctly update sequence.
	fix in metadata capture patch updating description of node_types
in module patameter.

Regards,
Vandana.

Vandana BN (3):
  vivid: Add metadata capture support
  v4l2-core: Add new metadata format
  vivid: Add metadata output support

 drivers/media/platform/vivid/Makefile         |   2 +-
 drivers/media/platform/vivid/vivid-core.c     | 197 ++++++++++++++++-
 drivers/media/platform/vivid/vivid-core.h     |  24 +++
 drivers/media/platform/vivid/vivid-ctrls.c    |  75 +++++++
 .../media/platform/vivid/vivid-kthread-cap.c  |  54 ++++-
 .../media/platform/vivid/vivid-kthread-out.c  |  49 ++++-
 drivers/media/platform/vivid/vivid-meta-cap.c | 201 ++++++++++++++++++
 drivers/media/platform/vivid/vivid-meta-cap.h |  29 +++
 drivers/media/platform/vivid/vivid-meta-out.c | 174 +++++++++++++++
 drivers/media/platform/vivid/vivid-meta-out.h |  25 +++
 drivers/media/platform/vivid/vivid-vid-cap.c  |   5 +-
 drivers/media/platform/vivid/vivid-vid-out.c  |   5 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/uapi/linux/videodev2.h                |   1 +
 14 files changed, 824 insertions(+), 18 deletions(-)
 create mode 100644 drivers/media/platform/vivid/vivid-meta-cap.c
 create mode 100644 drivers/media/platform/vivid/vivid-meta-cap.h
 create mode 100644 drivers/media/platform/vivid/vivid-meta-out.c
 create mode 100644 drivers/media/platform/vivid/vivid-meta-out.h

-- 
2.17.1

