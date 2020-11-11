Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3E92AF069
	for <lists+linux-media@lfdr.de>; Wed, 11 Nov 2020 13:18:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgKKMSe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Nov 2020 07:18:34 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:47395 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726554AbgKKMRn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 07:17:43 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id cp3xkn037RiwVcp43kaHqP; Wed, 11 Nov 2020 13:17:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1605097056; bh=OCfUI1dIxxgMYtYx1GNR3eRvdiQRLIsTm24Upmk5vlY=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=fO0j8AFmSw5WAhudcMl2MePaLRbSVwD4BNeUiEYBRNyhRRyltvDb7J8KQY9816b5f
         D9iJ/heVAFRRMU5GnR+NjlJuHn/R5Zpp8mMV+sAIqbpaCZhXZ8HnI5nZgV0MnFycxn
         DVAwFTDpUkHo6IpHkKI/Dql46ReBazpC+G610/8P4KKVsY9XczUYJJpKO/v9wPgRMd
         PvjUYKR/NsaCMhl3B0hawy47Fh0BswsadoAaN2Ks2ZTcCZEKDwPX/SJlkLdXCHqEXA
         9hqNegnxgMHJ47W9HSR7Vtd80EbgQzz96qMGXIOXFIGo/zgm+3rLO2VoLkVLGMr5Ok
         8ngeaTQYAQuAQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.11] Various fixes
Message-ID: <98f214b8-f017-4fa2-28ea-cbad2812833d@xs4all.nl>
Date:   Wed, 11 Nov 2020 13:17:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBYjn03nG60iu/MPiDYZ1Fvw3E40SYzbGBIE4ykeyroKCuywj15AZfQOe0+LM5wFG38/huq2dDfCP/OeHc/UumhRzPU9tHNBfWIIvPatudXJ2XVCEb+U
 GdqyeuHKFStchzJvo2b4DREVH8ZplBJX/1QaYReY6zvHDGSMIc8RS7ejnswlwZD/FcIErEmAkQus18UvQznzT7qtSHeqq1A82o4=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 0ab4f9087ea94ff92dc2ae68180faaf6bd443021:

  media: platform: add missing put_device() call in mtk_jpeg_probe() and mtk_jpeg_remove() (2020-11-05 18:03:11 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.11g

for you to fetch changes up to 8b1bad443e65afcd03657b01aec8722f2d7fa61e:

  media: solo6x10: fix missing snd_card_free in error handling case (2020-11-11 12:18:08 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Dikshita Agarwal (1):
      v4l2-ctrls: allow V4L2_CTRL_TYPE_BUTTON with request api

Hans Verkuil (2):
      v4l2-compat-ioctl32.c: add missing #ifdef CONFIG_COMPAT_32BIT_TIMEs
      saa7134: improve f->fmt.win.clips NULL check

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
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c |  4 ++++
 drivers/media/v4l2-core/v4l2-ctrls.c          |  6 +-----
 6 files changed, 22 insertions(+), 18 deletions(-)
