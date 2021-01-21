Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35BB02FEADF
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 13:59:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729465AbhAUKcm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 05:32:42 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:49243 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729139AbhAUKc1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 05:32:27 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 2XFalaeDjyutM2XFelgmgx; Thu, 21 Jan 2021 11:31:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611225102; bh=xVkjGcpxGSM83vonioKnujRFoyjs79T5J1H0IPxugMU=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=JJ0z+nlVjkZu0itqu2B3IwxnZFuui6Bi+6CYYf38GNd4RANMLr5lM1O34CzcrvJ+0
         bRVI0w+OyoP8Y+ers3XCEORdH3L3Fmw3uW60NuVcDLHJhRhF8O3Ft9TBa3GvXEg93c
         767o1WeHPgZexoEXqqwOXBQYSPkzTzKiY1aLgsHWwnr4gG+35Pj9/KvLiveaEw/SEc
         KAxmNZwd03KxXP5v1uvh01iYssRqbitpi/f99cTk7UuWDRhnrWbSkL0qO3zWKLyLnk
         F0QE0KmhhLinxlU9DhtuNIJPrv9/XpYl2i2lCwf/OccNLM2g9YYUtfXwSGTfhOyELi
         0D1C3jyZSC5RQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR v5.11] Fixes for 5.11
Message-ID: <87ea4873-bad1-6575-c104-4be6ba59dfc4@xs4all.nl>
Date:   Thu, 21 Jan 2021 11:31:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJ9rfofsHjYMdiN4b+THTN1tERu/yd//3bEbe0gd+r21bA2rOBw06HUMSpMI4zAm2eETO71Vzuf64pFMtrlWdt3rIwQccga1FQn7jLFB5uD47yWCCgRZ
 cq6wiI/e7e4D/NDU//j9+cU0xdQN3r6lDuv/dfcMEqFnLIcnUfRqReEb6maI5fNu6gD+C0sMQHRwJkJO1/8CY6h+vzGpdn4O5OU=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 321af22a3d2f6ed1fb1737c8588c01f6fec8a7b8:

  media: atomisp: convert comma to semicolon (2021-01-14 13:59:46 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.11b

for you to fetch changes up to 0792e86517a21079dac2883fc2021848610d7de9:

  media: hantro: Fix reset_raw_fmt initialization (2021-01-21 11:21:56 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (1):
      v4l2-subdev.h: BIT() is not available in userspace

Jernej Skrabec (1):
      media: cedrus: Fix H264 decoding

Ricardo Ribalda (1):
      media: hantro: Fix reset_raw_fmt initialization

Yannick Fertre (1):
      media: cec: add stm32 driver

 drivers/media/cec/platform/Makefile              | 1 +
 drivers/staging/media/hantro/hantro_v4l2.c       | 2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 2 +-
 include/uapi/linux/v4l2-subdev.h                 | 2 +-
 4 files changed, 4 insertions(+), 3 deletions(-)
