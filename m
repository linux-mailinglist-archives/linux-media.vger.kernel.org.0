Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 741A51A754
	for <lists+linux-media@lfdr.de>; Sat, 11 May 2019 11:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728478AbfEKJzy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 May 2019 05:55:54 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43841 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbfEKJzy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 May 2019 05:55:54 -0400
Received: by mail-lj1-f194.google.com with SMTP id z5so7058069lji.10;
        Sat, 11 May 2019 02:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FZcJEXqVDANWwYB6owLxOgwCD4ERWg2mDzKvoksXMjE=;
        b=XyhNnMpeEdjw84bpxZd5jE8qGuRa5un6YUK9d4dHsa4/h87QvSELcWtIuANWyaJKFJ
         HoSVoA7xP43Jq4TTE28/cNsoH2z+qafv7gq6NXzEVJHTms32lYuqdig0Jr9NSIg/xL9A
         Pyty+JHvZQjwWV28ncms35dBqxNsxn1Y+fKvdKtZ3KnYiOjv04xEk0Ax+xhaghnun+er
         DwVYko6t5FMSE4zYQUI8mS2BlgtP6B4No05fvt3c/beIuGbpoimJR9mvl1M6teCVkiOf
         05qZTvySf7spSv93gQP17c+OIgfMCuBcd8iDtomTaCbJBfaxkhCJjE/9/3zpM0rrWo5G
         rSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FZcJEXqVDANWwYB6owLxOgwCD4ERWg2mDzKvoksXMjE=;
        b=NFfNI740rMSpMsZTZl3P9VnX2aWfsCuc6l/QcKDzUMUrDVp9Z63CceibltUn5WS/ab
         dRNu3Bc3M7vwAgaJbFzRWQ6zD88Pb3C+sKysciBRgo2BBKvn7/YVMTa+gqEYLs5a0wqZ
         PBqo8tUm38cO8voA6FTw3avcd7mE7JPk/JzXOXtd+EG+aJYVNT69k61RvWuYxLKjy3Dk
         TOA6gy232NtGmXueyoBHfuhogc3dJ56Uy4UTPa8s6nHt901D2Ico00J2lS1Y/H+AIv41
         73DLoFvykC4BG25gRAAGs9nsEPZU2AuVlZswO5TXzkrlZF3jIPU3/V74J1oZCh0ka/sx
         6CdQ==
X-Gm-Message-State: APjAAAVvZR9djG23rEAWHkruNKB16tmdlokVMdr4f1NHAH52WNt0WZjW
        2q2DvCfkr0BVBKMeKTJUtuw=
X-Google-Smtp-Source: APXvYqxFBRMZL7fPGco5pgdbFvLEJzelYbu4iLzpwU8IUeGJyvlX956YswUAreBi4udRaZ3R+hv4Iw==
X-Received: by 2002:a2e:548:: with SMTP id 69mr1207600ljf.176.1557568551907;
        Sat, 11 May 2019 02:55:51 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id x6sm2126224lfn.74.2019.05.11.02.55.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 11 May 2019 02:55:50 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v3 0/2] media: v4l2-subdev: Verify arguments of v4l2_subdev_call()
Date:   Sat, 11 May 2019 11:53:57 +0200
Message-Id: <20190511095359.21502-1-jmkrzyszt@gmail.com>
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
v2->v3:
- add patch 2/2 with pad config check,
- adjust continuation line alignments in patch 1/2 to match those 
  used in 2/2.

v1->v2:
- replace the horrible macro with a structure of wrapper functions;
  inspired by Hans' and Sakari's comments - thanks!

-- 
2.21.0

