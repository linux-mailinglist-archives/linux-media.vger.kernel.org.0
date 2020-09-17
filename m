Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBC9F26E005
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 17:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728240AbgIQPt3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 11:49:29 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:40155 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727457AbgIQPsJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 11:48:09 -0400
Received: from threadripper.lan ([149.172.98.151]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MOAFl-1k7klU2K4X-00OXa8; Thu, 17 Sep 2020 17:28:25 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     linux-media@vger.kernel.org, mchehab@kernel.org, hverkuil@xs4all.nl
Cc:     hch@lst.de, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 0/8] media: v4l2: simplify compat ioctl handling
Date:   Thu, 17 Sep 2020 17:28:15 +0200
Message-Id: <20200917152823.1241599-1-arnd@arndb.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:FguSgiNJ4aWc+kW5QZOgRIPkQbvvC7vfswN0wtTQW8jWPvxsyNM
 xnz1BIZWj+1CMSttGTvG9camB3KITe+3S5QMBfqhwZ1Bhyy8IOs4qq6ottkyVpvsvntYwfw
 Zyq53Z6iApYo/0Y5+ts784x9r4vjRpgm4UgZHEwz5z8S7Rs8wC57/UYc/4jjc9t8KgJvzWh
 dY9TYc/+OQZ1KqaPXliMA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:C9DuMQ1gut0=:jFtdSP+Yev6L0fqA0Y51iG
 IJ6Gh8PdJOFp3l4bkZjX5Qqhai2OUMqnb4N7BAUHSwfPToLEb+M17bppxY2SqHW14gYA/1a9k
 v077vArnF3RG7yt98/aPRmaJUaJN2V46pKNjyaTKfhzqilhc2NZJc01MEIVty/GhZF3MmQxbu
 fleOpJOHWFPNR/sx7sklCB+PmbnHck/7u/aRRWZtB1X6jPKOMo5n9mDiLLdZhbHn+Vr30B/Hq
 kq4b/JMTQ9C6uzGZfxOyUC5HVttKaFG1ugbx5r0SZOEWPpeEDF+W3I35Wao1nI9UWeENDs+4K
 lbhq/ZAGD6wl1J82vbq5Vx+fjWD1FY2sUAzlZ3dCflwZ3JvIIEXmr8f4uK0c75sIBmhgQkydT
 Wy8mThXA0PW46oK61m9MS2QPDKDlLCD5pGQVDWIm+5ILnR/3tKMZXb6WHgL9g0BVyp2DXMW33
 EXkdtpwfh0kKuJCznJnKNoy0D05NoxKncML4bvnrdAe8qYuVwxHbonbe5lcu5+ZZNyTLbFVBr
 oRDZ2uO9YhFVK9NWW2TisoQW225w+Wqrk1KDMeDNCLFl7bkE7WOLjdFMICv06gU3egH0bnfxL
 ae3gEVI0/mp62Ss77rcYbZpA4NRAe0ZGVHUsE5kB/kz1/QmYXBOSARmy6ilPdYSJID0wIixIl
 tkWKLHfjYJTr/tPfXKVQYg9NIpL061xTtcY3/qLaRfS2I6mn/3WtdRDzM9ia6Hjxl9eb8l+xE
 5eg5Y/zrYJiEYiB+kJbib7n+oMBue79jLTevUu9SpgHDg4fErbumJRQWgCZkS6nyyN5mmH+UW
 hCKE7Jxsd9TsC8vxx942v5NFuu5ZN/vuT4gt7rKRIcJId+ZXpd2+ka6FPVhInbLz7kS5kgo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I have a series to remove all uses of compat_alloc_user_space()
and copy_in_user() from the kernel, this is the part of it that
involves the v4l2 compat code.

The resulting code is significantly shorter and arguably more
readable, but I have not done any testing beyond compilation on
it, so at the minimum this first needs to pass the test suite
for both native and compat users space.

Given the complexity of the code, I am fairly sure that there
are bugs I missed.

Please review and test if possible.

    Arnd

Arnd Bergmann (8):
  media: v4l2: prepare compat-ioctl rework
  media: v4l2: remove unneeded compat ioctl handlers
  media: v4l2: move v4l2_ext_controls conversion
  media: v4l2: move compat handling for v4l2_buffer
  media: v4l2: allocate v4l2_clip objects early
  media: v4l2: convert v4l2_format compat ioctls
  media: v4l2: remaining compat handlers
  media: v4l2: remove remaining compat_ioctl

 drivers/media/common/saa7146/saa7146_video.c  |    6 +-
 drivers/media/pci/bt8xx/bttv-driver.c         |    8 +-
 drivers/media/pci/saa7134/saa7134-video.c     |   19 +-
 .../media/test-drivers/vivid/vivid-vid-cap.c  |   18 +-
 .../media/test-drivers/vivid/vivid-vid-out.c  |   18 +-
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 1774 ++++++-----------
 drivers/media/v4l2-core/v4l2-ioctl.c          |  120 +-
 include/media/v4l2-ioctl.h                    |   11 +
 include/uapi/linux/videodev2.h                |    2 +-
 9 files changed, 729 insertions(+), 1247 deletions(-)

-- 
2.27.0

