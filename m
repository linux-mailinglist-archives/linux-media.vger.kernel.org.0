Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC22F375692
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235106AbhEFPYu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:24:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:38110 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235187AbhEFPY3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:24:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3EB3F61289;
        Thu,  6 May 2021 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314610;
        bh=mHMffteSTguBJ20cEjxFDlhyxs7b4CZOVWuPWstQVxs=;
        h=From:To:Cc:Subject:Date:From;
        b=V5sH6CPic+zohK9e0Tej3j8T0kxhtrLLXH+mZlmBv49+NZtZPuX2kr6TsFBz5vekd
         urwi/KUoo9XkzkPDq6TXUaZQ7nYXGaRLBm8llSAPGI1KovW1EGpcUWUY6erJRofnaH
         bZnc3eARG7nffX83sw1h1xumx9wqxAA9j0K3VIi0R7jlVOKT5Xp9/B/Eh/XkCNXDzs
         9+90CCva4xyhxqv+w+WZWiyLR78rX1Z2hD8XE5MZahgwqCOEvUI6WXnWjY4Rh/4mTq
         0bCj7Zdd2oR1IOAQKOOjIMUGbBRARvm0VVC7riOKIwpD4JN3ZHbZ443EJtIpd6ZSy6
         0nFUXN48LqZbg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lefqZ-000RuV-V0; Thu, 06 May 2021 17:23:27 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Leon Luo <leonl@leopardimaging.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Matt Ranostay <matt.ranostay@konsulko.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Shawn Tu <shawnx.tu@intel.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Wenyou Yang <wenyou.yang@microchip.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v5 00/30] media: i2c: use pm_runtime_resume_and_get() were possible
Date:   Thu,  6 May 2021 17:22:56 +0200
Message-Id: <cover.1620314098.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dealing with PM runtime (RPM) is different than dealing with other kAPIs used
on media, as most pm_runtime_get_*() functions won't return to the the state
before the call if an error rises. They, instead, increment an usage_count.

Due to that, there were several bugs on media. Just on this review, we found
24 such errors.

So, let's use pm_runtime_resume_and_get() whenever possible, as it
has two advantages over :

1. On errors, it decrements the usage count;
2. It always return zero on success or an error code. This prevents a 
   common error pattern of checking if ret is not zero to identify
   for errors.

There are however a few places where calls to pm_runtime_get_sync()
are kept. On several of those, a comment was added, in order to
help preventing trivial patches that could try to change them.

PS.: This series was submitted already together with the fix patches
at:

	https://lore.kernel.org/linux-media/cover.1619621413.git.mchehab+huawei@kernel.org/

I opted to break it on 3 parts, in order to make easier to review.

This is the second part.

Mauro Carvalho Chehab (30):
  media: i2c: ak7375: use pm_runtime_resume_and_get()
  media: i2c: dw9714: use pm_runtime_resume_and_get()
  media: i2c: dw9768: use pm_runtime_resume_and_get()
  media: i2c: dw9807-vcm: use pm_runtime_resume_and_get()
  media: i2c: hi556: use pm_runtime_resume_and_get()
  media: i2c: imx214: use pm_runtime_resume_and_get()
  media: i2c: imx219: use pm_runtime_resume_and_get()
  media: i2c: imx258: use pm_runtime_resume_and_get()
  media: i2c: imx274: use pm_runtime_resume_and_get()
  media: i2c: imx290: use pm_runtime_resume_and_get()
  media: i2c: imx319: use pm_runtime_resume_and_get()
  media: i2c: imx355: use pm_runtime_resume_and_get()
  media: i2c: mt9m001: use pm_runtime_resume_and_get()
  media: i2c: ov02a10: use pm_runtime_resume_and_get()
  media: i2c: ov13858: use pm_runtime_resume_and_get()
  media: i2c: ov2659: use pm_runtime_resume_and_get()
  media: i2c: ov2685: use pm_runtime_resume_and_get()
  media: i2c: ov2740: use pm_runtime_resume_and_get()
  media: i2c: ov5647: use pm_runtime_resume_and_get()
  media: i2c: ov5648: use pm_runtime_resume_and_get()
  media: i2c: ov5670: use pm_runtime_resume_and_get()
  media: i2c: ov5675: use pm_runtime_resume_and_get()
  media: i2c: ov5695: use pm_runtime_resume_and_get()
  media: i2c: ov7740: use pm_runtime_resume_and_get()
  media: i2c: ov8856: use pm_runtime_resume_and_get()
  media: i2c: ov8865: use pm_runtime_resume_and_get()
  media: i2c: ov9734: use pm_runtime_resume_and_get()
  media: i2c: tvp5150: use pm_runtime_resume_and_get()
  media: i2c: video-i2c: use pm_runtime_resume_and_get()
  media: i2c: ccs-core: use pm_runtime_resume_and_get()

 drivers/media/i2c/ak7375.c       | 10 +---------
 drivers/media/i2c/ccs/ccs-core.c |  7 ++-----
 drivers/media/i2c/dw9714.c       | 10 +---------
 drivers/media/i2c/dw9768.c       | 10 +---------
 drivers/media/i2c/dw9807-vcm.c   | 10 +---------
 drivers/media/i2c/hi556.c        |  3 +--
 drivers/media/i2c/imx214.c       |  6 ++----
 drivers/media/i2c/imx219.c       |  6 ++----
 drivers/media/i2c/imx258.c       |  6 ++----
 drivers/media/i2c/imx274.c       |  3 +--
 drivers/media/i2c/imx290.c       |  6 ++----
 drivers/media/i2c/imx319.c       |  6 ++----
 drivers/media/i2c/imx355.c       |  6 ++----
 drivers/media/i2c/mt9m001.c      |  9 +++++++--
 drivers/media/i2c/ov02a10.c      |  6 ++----
 drivers/media/i2c/ov13858.c      |  6 ++----
 drivers/media/i2c/ov2659.c       |  6 ++----
 drivers/media/i2c/ov2685.c       |  7 +++----
 drivers/media/i2c/ov2740.c       |  6 ++----
 drivers/media/i2c/ov5647.c       |  9 +++++----
 drivers/media/i2c/ov5648.c       |  6 ++----
 drivers/media/i2c/ov5670.c       |  6 ++----
 drivers/media/i2c/ov5675.c       |  3 +--
 drivers/media/i2c/ov5695.c       |  6 ++----
 drivers/media/i2c/ov7740.c       |  6 ++----
 drivers/media/i2c/ov8856.c       |  3 +--
 drivers/media/i2c/ov8865.c       |  6 ++----
 drivers/media/i2c/ov9734.c       |  3 +--
 drivers/media/i2c/tvp5150.c      | 16 +++-------------
 drivers/media/i2c/video-i2c.c    | 12 ++++--------
 30 files changed, 63 insertions(+), 142 deletions(-)

-- 
2.30.2


