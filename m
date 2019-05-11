Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D90301A778
	for <lists+linux-media@lfdr.de>; Sat, 11 May 2019 12:11:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728517AbfEKKKh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 May 2019 06:10:37 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39777 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbfEKKKh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 May 2019 06:10:37 -0400
Received: by mail-lf1-f66.google.com with SMTP id f1so5827315lfl.6;
        Sat, 11 May 2019 03:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VzMtYzzNqYL2idEdrrg1jhwZJhQgObiWzEmMj0ADVDw=;
        b=Hze29szeSBCrx8PCMd2kozwM2hfpOtEfKzcHNtT3VSdMN/WQ5OyUHsli5azMvHhLkq
         QfzH167TZcBL2kcYYHrav171bPly9pvqZHXE/RyHPD2mUr8uaYy8TIMOsttzGSUmUnk1
         SgmB/xntyeBpr6IqUAUExDN6VSxvowwua5glTQAyDWAs9MgPaQrggJQHzmlidQsbTP5v
         VHi6+7kLYFqNtSa1ucP2ugDnmftnvtl1D6ZBfoIykqc99OZPflVc0JfLVCZpFkYvWHOP
         rEQDvhvYCAUu05zzadpMNb3rkUbKcJ/7x1XyZHG7UbdPf9WmReBGmZABFrvQMOp//NLw
         2GLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VzMtYzzNqYL2idEdrrg1jhwZJhQgObiWzEmMj0ADVDw=;
        b=lJC0gTrwjFtKHo5qZNMODm9r90VoQqrpkhjfqIzaC+1S70IiXzUpxi+MCqM05+ncS/
         AXthOaNdXL3RicdOVv/YQziI8te1vBOUapAkXPVcqM0WU68vLuynW015vRwrMscSoGyh
         QhAs/2UC9m8kImQzN179pAAXMA/RZ7OevgClHLscPFn9bYL6F+tY37Y0vuQpJQ7Kk8Qy
         XzDcY5VzmZoR87emqYU/6EqfPP+oD50nlz1bdRRgRXf2PFdpI7WXIdviJK7OTztocvsy
         KN+xxJSQjMVJpr6FVlPPRC3PUtDFvQzIeioQe3R9WmxfL3wjRT10eAXxi/FrFIRd/z2W
         xLcA==
X-Gm-Message-State: APjAAAWJOD5cCwUyGxOmQKZ7EMhhu9lk6Ugc0axK9iMKYgt6QALEVuet
        nDeTf8y0WJwtzCYH0kYZbDY=
X-Google-Smtp-Source: APXvYqzPa7PsMelHqLBk5OBG2GNU/d6s1cKSStqRF0KcddlbymTxZxcd+/NvolSQExLAihGj49b4YA==
X-Received: by 2002:ac2:528f:: with SMTP id q15mr7979913lfm.37.1557569435575;
        Sat, 11 May 2019 03:10:35 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id o124sm1443874lfe.92.2019.05.11.03.10.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 11 May 2019 03:10:34 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v4 0/2] media: v4l2-subdev: Verify arguments of v4l2_subdev_call()
Date:   Sat, 11 May 2019 12:10:29 +0200
Message-Id: <20190511101031.4777-1-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Correctness of format type (try or active) and pad number parameters
passed to subdevice operation callbacks is now verified only for IOCTL
calls.  However, those callbacks are also used by drivers, e.g., V4L2
host interfaces.
    
Since both subdev_do_ioctl() and drivers are using v4l2_subdev_call()
macro while calling subdevice operations, move those parameter checks
from subdev_do_ioctl() to v4l2_subdev_call().  Also, add a check for
a non-NULL pad config pointer if V4L2_SUBDEV_FORMAT_tRY is requested.

This way we can avoid taking care of those checks inside drivers.

Janusz Krzysztofik (2):
  media: v4l2-subdev: Verify arguments of v4l2_subdev_call()
  media: v4l2-subdev: Verify pad config argument

 drivers/media/v4l2-core/v4l2-subdev.c | 234 ++++++++++++++++----------
 include/media/v4l2-subdev.h           |   6 +
 2 files changed, 151 insertions(+), 89 deletions(-)

Changelog:
v3->v4:
- fix 'struct' keyword missing from patch 2/2,
- fix checkpatch reported style issue in patch 2/2
Sorry for that.

v2->v3:
- add patch 2/2 with pad config check,
- adjust continuation line alignments in patch 1/2 to match those 
  used in 2/2.

v1->v2:
- replace the horrible macro with a structure of wrapper functions;
  inspired by Hans' and Sakari's comments - thanks!

-- 
2.21.0

