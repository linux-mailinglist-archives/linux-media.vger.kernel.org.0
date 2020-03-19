Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D90018B55C
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 14:18:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729706AbgCSNRr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 09:17:47 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:55771 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729358AbgCSNRr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 09:17:47 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Ev3NjtbmYfHuvEv3RjeIKv; Thu, 19 Mar 2020 14:17:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1584623865; bh=DYeG87S0e9kWbXJpsYCM9KeihxOmQ8Ox3PNkelkYPOo=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=naTPHj68nJnfEgowg5dfiT0YtPrxyNJtjCzltAEQRls1NSx9Bykg7tDtUX32Z5f4n
         AvSE4K8K0mGEVgAHDyNXPVxgdeRhyfjUX+i/miKMMJl/VQkGP7V3vYjBvNTFkiaDMw
         kMf+ooKTpS49SrAPhKNgA/RN1ILT1nSIcdn6oyMeOhQXK/Cz6L2Og4eK7InhFqiE3i
         Lom74WqlCuqCB1+sUv5PrH0nPlVSn5IN6APCPzu6SlkW/9H91ZGpyPjgQxthd38odx
         827BAb0gOlEAFmVD6hisDmJvlunZySWHWaT7T9NyEo9Iyu28Fyren8zjwifGkwB5Gf
         6HWJ5AZkkicXg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Michael Tretter <m.tretter@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.7] Various allegro fixes
Message-ID: <95ec6bae-4c7e-c9ee-6633-17357fa0e42a@xs4all.nl>
Date:   Thu, 19 Mar 2020 14:17:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfL8zJXbcNtf2SjnkKUqKO31NmI1/JVSZugiebjHUidIi14EsRnH6atUY9CilTS4I9Ig1hTcFJUWnQshe54+c3mLyFloVG4P2/6adATDVPPkGOuniN9xv
 tN8brZgQm+BEKiYyii7Cpa5Qu39s/vc6hwR1nFD2JiiZdFmwdnGUPCoHgpt4VGy998agrBvWLDQTltk0d6PRjUQx8iO20owscZI=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 6fafbbe8d4140e44e0a64d6c914d628bdb2902ed:

  device property: Export fwnode_get_name() (2020-03-16 07:47:58 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.7l

for you to fetch changes up to 5a9067e844aa9fd4df1d9d1b0299987bcff9f5aa:

  media: allegro: create new struct for channel parameters (2020-03-19 14:11:43 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Michael Tretter (19):
      media: staging: allegro: fix broken registration of controls
      media: allegro: print message on mcu error
      media: allegro: fail encoding only on actual errors
      media: allegro: fix type of gop_length in channel_create message
      media: allegro: remove unknown39 field from create_channel
      media: allegro: start a GOP with an IDR frame
      media: allegro: fix calculation of CPB size
      media: allegro: fix reset if WAKEUP has not been set properly
      media: allegro: extract mcu and codec address calculation
      media: allegro: warn if response message has an unexpected size
      media: allegro: skip filler data if possible
      media: allegro: make frame rate configurable
      media: allegro: make QP configurable
      media: allegro: read bitrate mode directly from control
      media: allegro: handle dependency of bitrate and bitrate_peak
      media: allegro: verify source and destination buffer in VCU response
      media: allegro: pass buffers through firmware
      media: allegro: move mail definitions to separate file
      media: allegro: create new struct for channel parameters

 drivers/staging/media/allegro-dvt/Makefile       |   2 +-
 drivers/staging/media/allegro-dvt/allegro-core.c | 908 ++++++++++++++++++++++++++++++----------------------
 drivers/staging/media/allegro-dvt/allegro-mail.c |  37 +++
 drivers/staging/media/allegro-dvt/allegro-mail.h | 267 +++++++++++++++
 4 files changed, 826 insertions(+), 388 deletions(-)
 create mode 100644 drivers/staging/media/allegro-dvt/allegro-mail.c
 create mode 100644 drivers/staging/media/allegro-dvt/allegro-mail.h
