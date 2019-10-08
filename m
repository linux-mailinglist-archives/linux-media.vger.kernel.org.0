Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86377CF3B3
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 09:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730298AbfJHH2K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 03:28:10 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44085 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730112AbfJHH2K (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 03:28:10 -0400
Received: by mail-pl1-f193.google.com with SMTP id q15so8068659pll.11
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2019 00:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EdVbTabv1Vobi5x7WpGsQE69f2jDQAnIyndQ2O9YVEs=;
        b=nnqU+DJqwDd/K+vBHY3I9jROEpSo5aQHNSpgqVSsYBZcLVaPr/hz2dxGC3KYEwtPIR
         3c9ujjCHeQbf76KcB6J9MOyhiSVFJou5kIPiH5eEwZjOkfkoWS959dhF0KItmTlLrdY6
         FKLb67VBjhXjOf9kQ96W+lpnhRpZdNWyH+3gEUMH1nnh9xJ5WqquFtIHVYhL+aWjriY3
         HVCqrbQIYRpdVolLdj5lHUIo75DoelWjCjihh6ETX53xhEvRLFW/3ZthA/X8ZPuD1SU2
         Ye2D0zRlGiSaT2r6/6Cwn2rYI87PPNRT5FjlEOQ4GzXCHR+sKxdXPKS9Zl0WgWTzPaOD
         8pJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EdVbTabv1Vobi5x7WpGsQE69f2jDQAnIyndQ2O9YVEs=;
        b=CCNS4Vc8L/ZvEwEg7w+zyQH1Ct46p5ItQQyjQDZeSkRYnD3OFwtgko2B6+8WiwIOCi
         nnK8pFNzXuna8iHlNBHbm9qE67nCBrU7LprFscQcWRyqObIUdE2YqVUROlCfalfJINPd
         tWr12zNEHCAmFtsZwyMNbWcIioSxealEnpsV9VoxL7GnkVdS732hpXeolLufSJt+RmRR
         21wLqdszOEokAXMgiOJcO4TCQsC8/OAgXmHMlRONahudr60yBerivMh52ye7AvQ2P/kX
         1qxWi81sHkMlcBqc5OVd+tXOSuRmGrtAxtX7cEelORh74/d5sUriOdP2A9o5oaegrJ8z
         fDFA==
X-Gm-Message-State: APjAAAWW82tSJhWfAWuE6feVI5EhnaVcgEk8P0liozloibiFjaMTpZku
        c31E/a3MlfMrJONAHVifoEBkj853
X-Google-Smtp-Source: APXvYqxSwj6uv2w8noKBs+A5qwXqsLg/3DsnihvFabDEmR6LhN1yQXay29WRVGWnz5iyATRtr71QNQ==
X-Received: by 2002:a17:902:9a44:: with SMTP id x4mr34388008plv.125.1570519689079;
        Tue, 08 Oct 2019 00:28:09 -0700 (PDT)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([117.241.202.140])
        by smtp.gmail.com with ESMTPSA id w14sm29663090pge.56.2019.10.08.00.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 00:28:08 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH v10 0/3] vivid: Metadata support
Date:   Tue,  8 Oct 2019 12:57:54 +0530
Message-Id: <20191008072757.22752-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <96d53360-5520-f253-db8e-995bf5920746@xs4all.nl>
References: <96d53360-5520-f253-db8e-995bf5920746@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds metadata support in vivid driver.
Metadata capture supports UVCH format V4L2_META_FMT_UVC as it is widely used in webcams.
https://hverkuil.home.xs4all.nl/spec/uapi/v4l/pixfmt-meta-uvc.html
For Metadata output a new format V4L2_META_FMT_VIVID is added,
which is used to set brightness, contrast, sturation and hue.

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
 .../media/platform/vivid/vivid-kthread-out.c  |  50 ++++-
 drivers/media/platform/vivid/vivid-meta-cap.c | 201 ++++++++++++++++++
 drivers/media/platform/vivid/vivid-meta-cap.h |  29 +++
 drivers/media/platform/vivid/vivid-meta-out.c | 174 +++++++++++++++
 drivers/media/platform/vivid/vivid-meta-out.h |  25 +++
 drivers/media/platform/vivid/vivid-vid-cap.c  |   5 +-
 drivers/media/platform/vivid/vivid-vid-out.c  |   5 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/uapi/linux/videodev2.h                |   1 +
 14 files changed, 825 insertions(+), 18 deletions(-)
 create mode 100644 drivers/media/platform/vivid/vivid-meta-cap.c
 create mode 100644 drivers/media/platform/vivid/vivid-meta-cap.h
 create mode 100644 drivers/media/platform/vivid/vivid-meta-out.c
 create mode 100644 drivers/media/platform/vivid/vivid-meta-out.h

-- 
2.17.1

