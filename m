Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA502A3FBA
	for <lists+linux-media@lfdr.de>; Tue,  3 Nov 2020 10:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbgKCJKG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Nov 2020 04:10:06 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:36349 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726690AbgKCJKF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Nov 2020 04:10:05 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ZsKGkF9LslQTrZsKJk8AEZ; Tue, 03 Nov 2020 10:10:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604394603; bh=HN1ZjkS4nFl6wiXTxiQ9HoAgSKvHX5oZ4SMh1u6nZPo=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=lgq5gyKB1G1WQvcoH9wdCNRT3gXnl0BCyOUwliTI8l4ox2I9mRQJV5R2CXtitbApK
         7qdVPanL1nyueGHVlLVAviN8X1JZscRuPhtTOVrCDMFRGq4jP0M+apMQAC1vwCOl8V
         Dij1t2mOYTxhExCsQzLN28QtZIfqzjFL7s9SZHAV4j7VhqrO2isxrB1NIK+FKcW43X
         aIy9l3Fih5MHbFSHQa+skygLbHcsWPfcLTMJtVEQ8MAn7+ud9Uz11CBgMa53fjj/jF
         Tr67iSaYWoYl7uoGwSBK9WM1fXxojE2OJQxAVgXFVtUVUrlJaCa4rfiYhTyePgow5C
         ribWq50vb+Bug==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.11] media: v4l2: simplify compat ioctl handling
Message-ID: <b16da527-86f2-e28b-0116-997094042142@xs4all.nl>
Date:   Tue, 3 Nov 2020 10:10:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGuVbnPoPzZ/Xl6jmKODXPpW6SS4UNbx3cyxOMlJWp9vA5OeYPigC2M53FQML8bhYZGkMwn7N8bLlIOhjuPFPHzufJFEEbaQbMXLAo/eJrqp6RzKwfAf
 1SWF9SdHF0jToXTYRm6n7akNYBd1gOp38SkSAmnlLYFSVazOptdJO+IKJL3tgIsXUEJIqGvR4aRuvMBbvIzh/rrzjOEvEO7gusngL0ofjUvXvdUHvMSvRDJZ
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This simplifies compat32 ioctl handling and removes compat_alloc_user_space()
and copy_in_user() from the kernel.

Tested this with the contrib/test/test-media script and both the 64 and 32 bit
versions of v4l2-ctl and v4l2-compliance ('sudo test-media mc' and
'sudo test-media -32 mc').

Arnd, thank you for your work on this!

Regards,

	Hans

The following changes since commit dfe3d19bd092cefb184c6e65b881602c793edd33:

  Merge tag 'v5.10-rc1' into patchwork (2020-10-29 09:03:21 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-compat32

for you to fetch changes up to 2a911f2d907aa6a5d5bd3996ddb6d45479e5d0df:

  media: v4l2: remove remaining compat_ioctl (2020-11-03 09:18:32 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Arnd Bergmann (8):
      media: v4l2: prepare compat-ioctl rework
      media: v4l2: remove unneeded compat ioctl handlers
      media: v4l2: move v4l2_ext_controls conversion
      media: v4l2: move compat handling for v4l2_buffer
      media: v4l2: allocate v4l2_clip objects early
      media: v4l2: convert v4l2_format compat ioctls
      media: v4l2: remaining compat handlers
      media: v4l2: remove remaining compat_ioctl

 drivers/media/common/saa7146/saa7146_video.c     |    6 +-
 drivers/media/pci/bt8xx/bttv-driver.c            |    8 +-
 drivers/media/pci/saa7134/saa7134-video.c        |   19 +-
 drivers/media/test-drivers/vivid/vivid-vid-cap.c |   18 +-
 drivers/media/test-drivers/vivid/vivid-vid-out.c |   18 +-
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c    | 1772 +++++++++++++++++---------------------------------
 drivers/media/v4l2-core/v4l2-ioctl.c             |  182 ++++--
 include/media/v4l2-ioctl.h                       |   10 +
 include/uapi/linux/videodev2.h                   |    2 +-
 9 files changed, 759 insertions(+), 1276 deletions(-)
