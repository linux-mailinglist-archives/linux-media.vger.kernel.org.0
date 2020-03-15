Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17A8F185BED
	for <lists+linux-media@lfdr.de>; Sun, 15 Mar 2020 11:27:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbgCOK1j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Mar 2020 06:27:39 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37631 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728230AbgCOK1j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Mar 2020 06:27:39 -0400
Received: by mail-wr1-f65.google.com with SMTP id 6so17541053wre.4;
        Sun, 15 Mar 2020 03:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pqm0PezCCdfuI97ApKbyt3LnL9VFZxah2FPqIKHnX0w=;
        b=VLjEFbXFE5x9GBhCgoIExA0aVaVqvPUcT4E5pbWxZyUDXbzuiQJlTuiWbO9urbHkwu
         VT83BtZpyfUhpFSW4u+uB9LPlDu3fiQe0VzopeQDDdzBkU6Wr2k+BawCN02a/cXqnD4O
         AxwYkfYNe5PoOFYi8JK/jMwcI/FdszMm5Er/RAA7lNp0vbBVcu1xBLYQA7Jx6PBK+ge+
         x30eBLdeYa+6umoOgegu3FkSwCiIYCDb95jMmgzvvoyqiD8UVBMd15LrxQ/xBjaJqkNO
         xyRatiuZBPdRRNJ9/IdrXiNQvHNHrKGMLqNj4rVG/n+dRPjPYVA8RqTfMRgMpSUesgKZ
         T1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pqm0PezCCdfuI97ApKbyt3LnL9VFZxah2FPqIKHnX0w=;
        b=V1EgUAM5Q3a9iG22q1x2KMoVV+8VIHOgL9+CxHbuyNuc1DgAfe6ssPGqvAASkWSNye
         u5O3adMnb7DUgyh2FwdQbSuqX0joa8g/gr+rzgLEHKI04BihPsZHXxtOfQo+Ce75IwIu
         Y/W0psVU2Ls3KJIF+aPjfRhuM8sx8gyyXx58vb9Kx2S945aNMg0ZOPQDEeqqHGa6dWiY
         z5KmUgT1PQCvnDySC32heteZjgr1reEzRBAKAcJ10x8qdRU/YKOLXTKbZ5C8WvzaSX93
         ToAo41gFh1DGizPJpE+dvV/Uk8P0VtY4h0mJiH+zENxAPvxdj/eMeKEzfCIqpM94ushN
         V10A==
X-Gm-Message-State: ANhLgQ3b+VhYPxmngLhUtKIFWgknqLDXOwsmfGPPOyW7fO6dNTIranfD
        b97QsTXm8VfNfJT8OuS5SnI=
X-Google-Smtp-Source: ADFU+vsTmcIviMV4vJ/hno2hqUEhcSA8Lnh1f0YRw4PvD2ZwSES5j/oCoHOFQUtz2x7upZ+fBX1KWw==
X-Received: by 2002:adf:cf08:: with SMTP id o8mr27979007wrj.192.1584268056357;
        Sun, 15 Mar 2020 03:27:36 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2510:d000:2c12:3438:7cb7:556d])
        by smtp.gmail.com with ESMTPSA id z129sm25765190wmb.7.2020.03.15.03.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2020 03:27:35 -0700 (PDT)
From:   Lad Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Niklas <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] rcar-csi2: make use V4L2_ASYNC_MATCH_CUSTOM to do fwnode matching
Date:   Sun, 15 Mar 2020 10:27:22 +0000
Message-Id: <20200315102724.26850-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

This patch series adds support for fwnode matching to be handled by rcar-csi2 driver.

Thanks,
Prabhakar

Lad Prabhakar (2):
  media: v4l2-async: Pass pointer to struct v4l2_subdev in match_custom
    callback
  media: rcar-csi2: Let the driver handle fwnode matching using
    match_custom callback

 drivers/media/platform/rcar-vin/rcar-csi2.c | 46 +++++++++++++++++++--
 drivers/media/v4l2-core/v4l2-async.c        |  2 +-
 include/media/v4l2-async.h                  |  4 +-
 3 files changed, 46 insertions(+), 6 deletions(-)

-- 
2.20.1

