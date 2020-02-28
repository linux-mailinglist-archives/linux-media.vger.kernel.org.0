Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DBB6173D8B
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2020 17:50:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgB1QuQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Feb 2020 11:50:16 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41933 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbgB1QuQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Feb 2020 11:50:16 -0500
Received: by mail-wr1-f65.google.com with SMTP id v4so3686199wrs.8;
        Fri, 28 Feb 2020 08:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ptyAW0CaITCOGU6uMR1Y6lC9nQJFqQFDJtzDeifQS9I=;
        b=l3s0B9dD5cbnT+tDYSz4eKacSfHu+Db56dgBLC3hqgQsS1vsiyPpDGvJpzoJKe5lyS
         YAdsvf4DLFDtnTZYloMYVPpT+S/CtDUB/HokArZ9SF7VX107IrLhE+2SXDeYC5QC1ZEr
         deX2Hovym+MEYbahoocdqNDzpupY5xes9xipsMjje6Uv6HcEztAE/8k+VBk5IbKNVdOO
         Ums7WbdOFEKbVkpBlTejHNABNfpWoFUL56EsVRKUYZFNTyUkyQqakYwY36tSMRxI73mm
         toNuvsRVUynSu+iA0u0aBdNie5Ug88nhfbkWKiY9Qvw+66qNdeGizLBzo8edfJBgesg7
         XODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ptyAW0CaITCOGU6uMR1Y6lC9nQJFqQFDJtzDeifQS9I=;
        b=mKwMkouE7+B20dnLkPzBLEOnQTAaYD7Lv6CgHPYBn1myju0FQzlyKRsEOCNiYJ7iRL
         tBVS+Q6XohZz2q3f2GlPn8c3Cdup6mOWsS65CHdlA+bnNIst+zggflvb1OPCk8q9TmhO
         9vNwgVJfZTWAJ4oKxyYOVU/s8+RuUcHEourr2M3rY3LhsFB/txjLMxP82r6fZkdmp+4M
         MMwFmysKisfJFByYq3B9k3B5CudItKtWsMQSppdbAZe4BLJ3tmGvCmWCkuRvhnuosDoR
         prpvz8Y0+69cXJbxuofGBpk143LejXdu7oVcv3xBnRfn0x/U8ojce3B1UydAH0CnUdAU
         6Uqw==
X-Gm-Message-State: APjAAAWjmlNBus/d4dfPoH36yBBVz57lqoxD4maEeX0g2Lb3ZZmD6iDg
        ZtVXmHLQ7EsGOejepZsHzhD4oy2HlrY=
X-Google-Smtp-Source: APXvYqxtMOkK0rtqDfAgCFY0WIbDeFle7t52h2u/lr6aqGBMu4jWB+bStrNDa6x0ZLTjCdXEusnxeA==
X-Received: by 2002:adf:ffc1:: with SMTP id x1mr230842wrs.3.1582908614070;
        Fri, 28 Feb 2020 08:50:14 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2510:d000:3855:fd13:6b76:a11b])
        by smtp.gmail.com with ESMTPSA id h2sm13263408wrt.45.2020.02.28.08.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 08:50:13 -0800 (PST)
From:   Lad Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Niklas <niklas.soderlund@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] media: rcar-vin: feature enhancement and fixes
Date:   Fri, 28 Feb 2020 16:50:09 +0000
Message-Id: <20200228165011.17898-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

First patch of the series fixes registering endpoints to the vin module and
the second patch adds supports for SRGGB8_1X8 format.

Lad Prabhakar (2):
  media: rcar-csi2: Fix registering camera endpoint to VIN
  media: rcar-vin: Add support for SRGGB8_1X8

 drivers/media/platform/rcar-vin/rcar-core.c |  1 +
 drivers/media/platform/rcar-vin/rcar-csi2.c | 15 +++++++--------
 drivers/media/platform/rcar-vin/rcar-dma.c  | 14 ++++++++++++--
 drivers/media/platform/rcar-vin/rcar-v4l2.c |  4 ++++
 4 files changed, 24 insertions(+), 10 deletions(-)

-- 
2.20.1

