Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65725243A0
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2019 00:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbfETWuc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 May 2019 18:50:32 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:43343 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726584AbfETWuc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 May 2019 18:50:32 -0400
Received: by mail-lf1-f66.google.com with SMTP id u27so11518086lfg.10;
        Mon, 20 May 2019 15:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N7DcnttIK4QIE2fqTB5eA+h3fpiQjRO9TCxwlrvmTVM=;
        b=pk6+OUOehvaImxJ8jwS6aOGVW5ikv7HDSY9GlcGLysFL00AigbEpg5PRMJbIVGyrmN
         FXX81RZr1l2f1l5YGSV3sCoovEA79PyEiw/BEJWYECppBfRp+Zr4X5oDo/+WfBuStxV1
         OLWgiyJ8FHi5n5+K5Za5xiEuUxyNVKdKjrs1uuHpZ/hHuXn/hXpGn5SfenmR6GK3WJPc
         gDZjxKfphopaZtPn5yTL7dM3qMPKsBLDSeIRsyCndsV6RooXBNVCed5/l5U2wL+7qgSE
         ybygRswV2x4yanxN23foc3o3k8fGiAUc3Qb2kJ0chGxWWa5aXnQImXHQr0jy2fUikePJ
         Km0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N7DcnttIK4QIE2fqTB5eA+h3fpiQjRO9TCxwlrvmTVM=;
        b=bTlbGPc85OTTwtLh0QDR8SDDvbbIJZADGb6jERoUrJQT6W0f/44xkvAndPLkIInIqA
         6rZ31PcD7aQAxx+CeTeLTImFs1CVT+Jbr9NRNn35OBBDd5pKGo0WQpBXa8TBAObEJXMZ
         LpTtp2gb1v1lRLjU8jfYpbVWPmfTVhxgPaASbF0jc4zVK8Y2kKai06To0oSZbXX/mjhy
         PoDxy1jm/dW0Fk0iRC4Q45AjNYWZYE+h6Twhw5Z18nAz4eZPq81MgMx8a1WKUq9r5qaj
         Y6P0/JWEFpS8oqfBXXO8JyElZ1ZvojkC/XrSxf+RQrvnECj694Idxp1mQi8DMQLSGI8o
         jt2w==
X-Gm-Message-State: APjAAAWNR0JKzOACE6paTH1v6qnY8XP68jfpF4lFiOYFWb9gu6ZPt0RB
        X0mXinuxMs32hFz4baqSQXGxV6+zp6w=
X-Google-Smtp-Source: APXvYqwCiZ2A+ccmhZvyzEZ1uVaaVvHY/IDUW4uz69RuxGFOP0eRptADzFiC0zT7uoOfUzylpwyv7w==
X-Received: by 2002:ac2:518e:: with SMTP id u14mr513843lfi.120.1558392630352;
        Mon, 20 May 2019 15:50:30 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id t13sm2371646lji.47.2019.05.20.15.50.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 15:50:29 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v2 0/9] media: ov6650: A collection of fixes
Date:   Tue, 21 May 2019 00:49:58 +0200
Message-Id: <20190520225007.2308-1-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Janusz Krzysztofik (9):
  media: ov6650: Fix MODDULE_DESCRIPTION
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

Changelog
v1->v2:
- dropped patches 3/14 through 7/14 which were adding parameter checks
  now called from v4l2_subdev_call() - inspired by Sakari's requiest, 
  thanks!

-- 
2.21.0

