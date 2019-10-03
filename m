Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6A25C9CDB
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 13:10:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729719AbfJCLJG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 07:09:06 -0400
Received: from mail-pf1-f169.google.com ([209.85.210.169]:40715 "EHLO
        mail-pf1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729589AbfJCLJG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 07:09:06 -0400
Received: by mail-pf1-f169.google.com with SMTP id x127so1531490pfb.7
        for <linux-media@vger.kernel.org>; Thu, 03 Oct 2019 04:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vOOpNbcRptKp8cJn2LSgfx69HW/Vp+4na5CM4GuBMCc=;
        b=UZfAqw39jrPEaef7TCvHM1nwOgPklTnRsdPeyF1osoEQrq1cxSVAgB7d0YB0dwBaIc
         1SwH4QX3QvKG0A0PNzZH2ceIrE+3B8RG+SNNstaZaZ0o3oMSrzhBKpVeHtvOxpjXQuVD
         AhmhyKia1Vxfd5MfZD4W6lDh7nGm8r47XFw4fwp+hLceIAevxhhjCQWdNJiOP+/coJM5
         hkYcs87hQl7t7WTbjkhnSJ8xwdp6eECUHyDezpHbn/zhBHpUC902NeGQVqKh4YWkEUZV
         x7mqHXEU29Mgt7IN4EJwvAea97n8kL2yFdToKuVVUf8Pm1hwl9GNHsbSWqmdbMxk19yy
         r13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vOOpNbcRptKp8cJn2LSgfx69HW/Vp+4na5CM4GuBMCc=;
        b=YPTtEck5IyetK4pDYLEvMYJMuY8djtaMeYokgwPSrZEnUT7d6+bv8KI+qems2sazjE
         g6zlHEREACQoXh0B8gPY1JAJTbIcKwYSb70Sy9LQyhmCXcSfPyuVWDPVYO6/IF5xPwBj
         BiAn28wJODT194VmpqpCkpxlv6VJzB9Rhks9uOQytBMJNI4p3k37fIAUry05dNXdHvMH
         CKO5SPXJA3LtBggQnNhoBSovEi+WthflrT9usoBhddwlx4GsQCxnChoqKE5UlSADpxqX
         PQOVRCabC6pgR/mzBPHbND7zfVYGg+siY/EqXcnzrx/H/xtzGSxNNIvuhMQgWNFOASRW
         CYpw==
X-Gm-Message-State: APjAAAWI72E3aOkYz7H5KnsWrKgdLrUPs9GWyTyt/7TDH6apdSkZUr5X
        rkpNKp0W3puFT13ci7Tc6J1FwbaW
X-Google-Smtp-Source: APXvYqycVMxCIy9/cp9Pg+I1RZQUYNoNnv0FZGtteZ0hl3nZX1nRoaBojwOFxVEkuomwt0ZrA4joAA==
X-Received: by 2002:a63:e444:: with SMTP id i4mr9075662pgk.45.1570100945070;
        Thu, 03 Oct 2019 04:09:05 -0700 (PDT)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([117.241.207.214])
        by smtp.gmail.com with ESMTPSA id i16sm3169060pfa.184.2019.10.03.04.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 04:09:04 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH v2 0/2] vivid: Metadata output support
Date:   Thu,  3 Oct 2019 16:38:56 +0530
Message-Id: <20191003110858.7120-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <9439560a-dbc7-9aeb-a27b-314ace85dc81@xs4all.nl>
References: <9439560a-dbc7-9aeb-a27b-314ace85dc81@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds metadata output support in vivid driver.
New metadata format V4L2_META_FMT_VIVID is added,
which is used to set brightness, contrast, sturation and hue.
V2 has changes in metadata output structure and metadata format define.

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

