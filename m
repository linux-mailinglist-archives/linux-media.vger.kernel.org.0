Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C67D5A746C
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 22:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbfICUNB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 16:13:01 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:38536 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbfICUNA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Sep 2019 16:13:00 -0400
Received: by mail-lf1-f66.google.com with SMTP id c12so13952916lfh.5;
        Tue, 03 Sep 2019 13:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TqZpCEc2/8tUldbExRFmKjACrPG9pTOCMD6ZeKBJvh0=;
        b=qCG5EB/BNYcDpzusk7tXh8k/GcYv8Y9Y/ufQVApsp2beShx2y9MdJdzLhDYkBhU2/s
         OzOoe+vxm9XTnN1HLABX6d9UP8NFIsX3OWnm/psFfSw+tnMsQxJJBLWufZhWw3aIkj3M
         Dm5GVq+E3L2WBufLfISb3ufLZ76IbdKzLsSz39Lf8aEzm3qQFR3pxTMJX0Nqz2yVMNKY
         5KwYrpg0q5VRygW8LB9gyJcOr2qJThQPwiebZJGEwdCkcRX0LBddkVFDeCkwkKjGalRq
         ID+nzIh2fhaJ5wN3CAe/Spe+eHxP15QbUdrC/8Tk+c2KS9KWYDb9AL1TV3Pl87iEhMpO
         I+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TqZpCEc2/8tUldbExRFmKjACrPG9pTOCMD6ZeKBJvh0=;
        b=Ke1hFfibzhWYT5J1LvsaxeLTtB0T2n7F7vEukeurlV3l0fMGTWu3r98Wm5CKmY9WNK
         L32pyQPAE1wD2Xoi5EBUzLMUrOVp+ewsQpYGRRkljWNhPV/OzFeCf1sWHKSG9ptpois+
         fxCn8dCbtZ0HQSqnDPN0KZzNn7n1owI/rpL6NJszPg2KBeJkNsGdbHtgIO692qw6XyMX
         iOSi/RCI1UJSqpcyHXWEtt44t3jcHIV0nlw/9Tom5HiPd8xmVaZ8vWACo+40P81hlwxg
         bDvykBrQAjej7UnRM6KHx+hOWfRpHOSvC4NgS8ZFvfzYgYpSu3dCnXJYQltNVTkjpOeK
         QrOg==
X-Gm-Message-State: APjAAAXrVWRVPVuz85OsOdA/5Bxk1FCcCDVsSdnD2YYxsV4KntavXEZ3
        ifuKaztdyHZg+YRpD3y+ZZo=
X-Google-Smtp-Source: APXvYqyqAWSy4WcC7EG4kVv0M8D57a3lY1RC4OvE3ie9aB+1KfDEaUQ9jgCNpDoIJrj/fPMTUh8T0g==
X-Received: by 2002:a19:4b0d:: with SMTP id y13mr21777325lfa.128.1567541578455;
        Tue, 03 Sep 2019 13:12:58 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id u14sm2960884ljd.14.2019.09.03.13.12.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Sep 2019 13:12:57 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v3 0/9] media: ov6650: A collection of fixes
Date:   Tue,  3 Sep 2019 22:11:35 +0200
Message-Id: <20190903201144.13219-1-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Janusz Krzysztofik (9):
  media: ov6650: Fix MODULE_DESCRIPTION
  media: ov6650: Fix control handler not freed on init error
  media: ov6650: Fix crop rectangle alignment not passed back
  media: ov6650: Fix incorrect use of JPEG colorspace
  media: ov6650: Fix some format attributes not under control
  media: ov6650: Fix .get_fmt() V4L2_SUBDEV_FORMAT_TRY support
  media: ov6650: Fix default format not applied on device probe
  media: ov6650: Fix stored frame format not in sync with hardware
  media: ov6650: Fix stored crop rectangle not in sync with hardware

 drivers/media/i2c/ov6650.c | 137 +++++++++++++++++++++++--------------
 1 file changed, 86 insertions(+), 51 deletions(-)

v2: dropped patches 3/14 through 7/14 which were adding parameter checks
    now called from v4l2_subdev_call() - inspired by Sakari's request, 
    thanks!
v3: * drop Cc: stable@vger.kernel.org on Greg rquest (non-critical fixes)
    * fix typos and some wording in commit messages
    * rebase on media/v5.3-3
-- 
2.21.0

