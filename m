Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB87C98E6
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 09:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727925AbfJCHTI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 03:19:08 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34330 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727368AbfJCHTI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 03:19:08 -0400
Received: by mail-pf1-f193.google.com with SMTP id b128so1167305pfa.1
        for <linux-media@vger.kernel.org>; Thu, 03 Oct 2019 00:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=po2v5AOrNCCFQlL3phPmGt0Sn08IvXTHDFtdZ46/PB4=;
        b=tbwUZYzj+PzivqlS7TnR5n2o2WTM8x8v0PKTEGNG/9mNHFUgq5PoSA+svcmKTSpJ2X
         uxSGgXaFvcPWMKx4b0SCJN7VKWil6TfDtHH2Iyjc/t/n4Ls59IHHz+MAZp+HbvEsMYm+
         o0Bx43Rt+kV15gFnp37n5gxvLZounom4tX1C04We2CxemtmTO05anhe2BsHxSVF/ERDh
         Cw4jNcRHbQ1kSRF0nvOUX+81jyENEeQ1GdWbjaHbp0l4OSz5jI/C+Y+98S1ohhJaW07q
         UnqlHCAjwiCMA7Vb5EuvTz9MT2VXoOJ+eG79+9siAcNfI6Dg2J9rZW8dCXfDI8joJpem
         rYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=po2v5AOrNCCFQlL3phPmGt0Sn08IvXTHDFtdZ46/PB4=;
        b=Bt8ZfniVndOQ5gWYT+l0kPOYLC6dtVquP21+WEFco/f/GCgOxrJU0U7wWBufogTsoX
         S/dz6HBoV8iIGCLilc9HpT7h1CLNvA4VUwkgW1eKQKKAbUiQ6wGRgLqZehPPAt9cvZnV
         +NebUiUxX+ZoWKw1hwqzLYtrIeOo0e8Cin+w46T3sV4OJZ+e8FMEr1lOiQBadVw2MRkQ
         pDw3LrjW7kLdis7XwZdVUM2m/kbJU0JoBxnYIF/R+VqJtv4Q6OaN0KMeDPP0Bfh/JZS3
         MfAYZH7pRy+ED1CGiYW3YvxeLjCx9w1P2pN0jI5r/qwiHJ4rCZdOz1SJm8lW9YSWWSQy
         Hl2w==
X-Gm-Message-State: APjAAAXXVm2aHALlYKUXo2yCaMYwQzkd8c2EPM3rVsy0KnKvn4E7MClJ
        6L56gqaQXZifm9BFfU8wTdxItsVi
X-Google-Smtp-Source: APXvYqxJyeOejkEv9IsKqyYDy1xNl1uIlwMF9Bqot5zW06ImUx6VJ8JVhIYZPQRE78NFJWtNY8Mb1g==
X-Received: by 2002:aa7:97b0:: with SMTP id d16mr9577224pfq.54.1570087146136;
        Thu, 03 Oct 2019 00:19:06 -0700 (PDT)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([117.241.207.214])
        by smtp.gmail.com with ESMTPSA id y17sm2645109pfo.171.2019.10.03.00.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 00:19:05 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH 0/2] vivid: Metadata output support
Date:   Thu,  3 Oct 2019 12:48:54 +0530
Message-Id: <20191003071856.23664-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds metadata output support in vivid driver.
New metadata format V4L2_META_FMT_VIVID is added,
which is used to set brightness, contrast, sturation and hue.

Regards,
Vandana.

Vandana BN (2):
  v4l2-core: Add new metadata format
  vivid: Add metadata output support

 drivers/media/platform/vivid/Makefile         |   2 +-
 drivers/media/platform/vivid/vivid-core.c     |  98 +++++++++-
 drivers/media/platform/vivid/vivid-core.h     |  10 +
 drivers/media/platform/vivid/vivid-ctrls.c    |  14 +-
 .../media/platform/vivid/vivid-kthread-out.c  |  50 ++++-
 drivers/media/platform/vivid/vivid-meta-out.c | 174 ++++++++++++++++++
 drivers/media/platform/vivid/vivid-meta-out.h |  25 +++
 drivers/media/platform/vivid/vivid-vid-out.c  |   5 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/uapi/linux/videodev2.h                |   1 +
 10 files changed, 368 insertions(+), 12 deletions(-)
 create mode 100644 drivers/media/platform/vivid/vivid-meta-out.c
 create mode 100644 drivers/media/platform/vivid/vivid-meta-out.h

-- 
2.17.1

