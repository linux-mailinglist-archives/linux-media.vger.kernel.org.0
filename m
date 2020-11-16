Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B20122B3E9D
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 09:29:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbgKPI1Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 03:27:25 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:54225 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726374AbgKPI1Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 03:27:25 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id eZr5kmPYYfkEdeZr8kVKqj; Mon, 16 Nov 2020 09:27:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1605515243; bh=EuxCpc8ZptNYbJj/hN23RAHUXpNVSF3vjZQhDocK+CE=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=LGSTGfqjCz6v/ZyXwgK/9fK8P8ukL0FnV5UT4wwlh+X+yPZEWEIvxve23hKs4AyDE
         ZGrUqiBWJiGI9GRel8RQaXV1eovlQWuUHEHDqbDGHAslb40cTa31pK2DEvNAmPO7lu
         wMOTCT0P2qOw2unEj22TmRIJl3vXZ4FtbucMj5ioaGckN/o2ERP0IWVPYq2+wVeX0p
         LVXz1zGnDdseAFOIQe+XwUbfNUrmyTnwgDSG6c/UwaHg8LyyjhqsTH8vGzSNGlL8Wj
         zRMUfKuii7hMlSZIfG6A8uYC7rGoaoBag/InOXqZjFAZuDxke6q4iIMrGVWEwrX/qv
         U5Mq5hZ/CDvxw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.11] (v2) Various fixes
Message-ID: <37dc5127-56e3-868a-4925-412f3ff0fd7f@xs4all.nl>
Date:   Mon, 16 Nov 2020 09:27:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNp5XPzAQ9881wRMAuiV5btR3bSqf2Y9xxuWorjxUN+g4GrFrPxqz0tAkBOvKvSK8QqCDc2mXbyDYHj/S2T0Jn69zPhPSCEiSKz9lskewB3LI+fLDdv1
 0baspGUwoYAg4ygXYOxlUmgdU5kDPnshxCv0M6v2eqngFDSggPt5fK+hya2mx85k/dHiAoKVaxoDzg2gJ2xgO5IFxdAFJUevF/g=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Changes since v1:

Updated v4l2-compat-ioctl32.c with v2: the original version failed to compile
if CONFIG_COMPAT_32BIT_TIME was not set. Updated the daily build to have two
64-bit architectures where this config option is unset to capture such issues
in the future.

Regards,

	Hans

The following changes since commit 0ab4f9087ea94ff92dc2ae68180faaf6bd443021:

  media: platform: add missing put_device() call in mtk_jpeg_probe() and mtk_jpeg_remove() (2020-11-05 18:03:11 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.11g

for you to fetch changes up to 05ef6d1b6e956edeccd73a7d8fc1b92dad26c25e:

  v4l2-compat-ioctl32.c: add missing #ifdef CONFIG_COMPAT_32BIT_TIMEs (2020-11-16 09:24:22 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Dikshita Agarwal (1):
      v4l2-ctrls: allow V4L2_CTRL_TYPE_BUTTON with request api

Hans Verkuil (2):
      saa7134: improve f->fmt.win.clips NULL check
      v4l2-compat-ioctl32.c: add missing #ifdef CONFIG_COMPAT_32BIT_TIMEs

Qinglang Miao (1):
      media: solo6x10: fix missing snd_card_free in error handling case

Sakari Ailus (1):
      vim2m: Register video device after setting up internals

Zebediah Figura (1):
      media: cx231xx: Use snd_card_free_when_closed() instead of snd_card_free().

 drivers/media/pci/saa7134/saa7134-video.c     |  6 ++++--
 drivers/media/pci/solo6x10/solo6x10-g723.c    |  2 +-
 drivers/media/test-drivers/vim2m.c            | 20 +++++++++++---------
 drivers/media/usb/cx231xx/cx231xx-audio.c     |  2 +-
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 23 ++++++++++++++++++-----
 drivers/media/v4l2-core/v4l2-ctrls.c          |  6 +-----
 6 files changed, 36 insertions(+), 23 deletions(-)
