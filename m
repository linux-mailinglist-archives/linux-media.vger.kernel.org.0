Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCC12CB9EC
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 14:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729466AbfJDMIq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 08:08:46 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41494 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729189AbfJDMIq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Oct 2019 08:08:46 -0400
Received: by mail-pf1-f195.google.com with SMTP id q7so3776590pfh.8
        for <linux-media@vger.kernel.org>; Fri, 04 Oct 2019 05:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ir8dBvZLujYueC0YjiWySw7WwEfEeAGw9Tj5rBPXK0E=;
        b=dB3A4xQ5wAJVLJADNNy0qez3As2Pun6RuQnMW3ID1nR3worp24ieb4k6OBvL9f+Dyl
         OrCuN7RH/Zladugg8zcjK4srkyrDpIDtteKU9K5btRyb6afkkclyMchoLQpPUIUKH7PG
         XNif2vLgnOHHYECiOqeukMzQP8W0C3j2wn3X/ki1Lop3nz1o25Bzt/eudNq1U2XMEWPH
         9m6cBqNsY0Lz3fiqrfbTaHjygZbIMA2lMMtPzIoZqlDv6I2MSz3qpv0pPfpN5D4Xp+Kb
         GptMvNxTnrYqiqp1/HMDxrsEI6r9UbnyeKrH7LIn2pWhtYyd+uhPhzRe7VVismZG/6U7
         TwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Ir8dBvZLujYueC0YjiWySw7WwEfEeAGw9Tj5rBPXK0E=;
        b=Ct8GEMYLL6HPzbhSvlixIUGSt1cVngzc8USgIvGiXkgFP+pSdhYJfP2s9NiQvKtVCO
         +XATg/anQNry7j4FvD+ye9JVYMPuJkqqIuqyFmtahqru5ZATY9NJWV+rDaUp6c40q0FU
         B2YBPGYY2epvsFEAVfijC+tRtNr3TevN156vZl+LNGl6y1n41B6PAZQJbetR89XK5jLb
         a7PLaXLwoAtgvaCzcKSBeLOsJQ4uNr1zxQPr1p0vSxAZjKMArkjWZTzig2xa9iDqQVNB
         k8U+J+TC5WaYt/dznqfy7aNpAA8CLrFwkQY46SFgrSByHZ8TXrWiesg9fSXdgilsNYWM
         8S8g==
X-Gm-Message-State: APjAAAVrTj5vx5IZ0omLattIVJePrFKRKZPviaLSX8/kL1s/T51K95cA
        be6deJajYlkNH6uBULUgUNW3jCGr
X-Google-Smtp-Source: APXvYqx/41DXnIkQFN178ox15zHn4J7Tx0ej4gB8ia9ua4wXNL76HvRJRzpckpcsEdSuwh83ujU+eg==
X-Received: by 2002:a62:168e:: with SMTP id 136mr16841683pfw.144.1570190925378;
        Fri, 04 Oct 2019 05:08:45 -0700 (PDT)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([117.241.195.107])
        by smtp.gmail.com with ESMTPSA id e184sm8162435pfa.87.2019.10.04.05.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2019 05:08:44 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH v3 0/2] vivid: Metadata output support
Date:   Fri,  4 Oct 2019 17:38:35 +0530
Message-Id: <20191004120837.31614-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <787ff1cb-dde3-800a-9dde-68f1db5e4897@xs4all.nl>
References: <787ff1cb-dde3-800a-9dde-68f1db5e4897@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds metadata output support in vivid driver.
New metadata format V4L2_META_FMT_VIVID is added,
which is used to set brightness, contrast, sturation and hue.
V2 has changes in metadata output structure and metadata format define.
V3 addresses review comments.

Regards,
Vandana.

Vandana BN (2):
  v4l2-core: Add new metadata format
  vivid: Add metadata output support

 drivers/media/platform/vivid/Makefile         |   2 +-
 drivers/media/platform/vivid/vivid-core.c     |  98 +++++++++-
 drivers/media/platform/vivid/vivid-core.h     |  10 +
 drivers/media/platform/vivid/vivid-ctrls.c    |  12 +-
 .../media/platform/vivid/vivid-kthread-out.c  |  50 ++++-
 drivers/media/platform/vivid/vivid-meta-out.c | 174 ++++++++++++++++++
 drivers/media/platform/vivid/vivid-meta-out.h |  25 +++
 drivers/media/platform/vivid/vivid-vid-out.c  |   5 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/uapi/linux/videodev2.h                |   1 +
 10 files changed, 367 insertions(+), 11 deletions(-)
 create mode 100644 drivers/media/platform/vivid/vivid-meta-out.c
 create mode 100644 drivers/media/platform/vivid/vivid-meta-out.h

-- 
2.17.1

