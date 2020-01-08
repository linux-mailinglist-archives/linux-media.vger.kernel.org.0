Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06B34133CBF
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 09:12:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgAHIMh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 03:12:37 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:40343 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726210AbgAHIMh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Jan 2020 03:12:37 -0500
Received: from [192.168.2.10] ([62.249.185.68])
        by smtp-cloud9.xs4all.net with ESMTPA
        id p6S7iZivST6sRp6SBiGmZG; Wed, 08 Jan 2020 09:12:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578471155; bh=MRsCPLqUx0U6XquyzuoCx/+j3uFFxbzQFPKp/UPSf2Y=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=bD17dxJM45eegGeCgeAJTCmyzlyxGry5MZHCqyRKz8GpfZeppmFR8wg9MQQmQ6kkk
         UWwEFWR7+lrydJFsdrDXuZui2RWbKAVbHImUJCXPx+GIGYaxWDif2DQrtOF9P9nVMj
         UsRJNtAZqg9cwTYV1jUhbc5WwJOwrHcctL+DIipEYf7TuWlEwuSqlEG3yHv2TCnOpn
         jPAmgn0Ey+1/TWtD16PnG9b4DRuMrVZ5aLGFguPNacvX0FrAMfwwXtZ51nHA9baEwu
         2zSic0iZeAUCLC8qNZ1PIXhHN+iD4rxCdTyn1ze08o1bjptgXIptE9Z9d5EcTdr/YI
         9oeLKETrooA2w==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@siol.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.6] hevc fixes, various other fixes
Message-ID: <b6b0321c-5f12-a41f-4959-00e728cbd61b@xs4all.nl>
Date:   Wed, 8 Jan 2020 09:12:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfINzcOmwOzo5bfF+WNSQozkFBP6dCmnTf8ZqmAqtNGz141kLa/x8JLNuMey1BLM7H7KO/2b6iHUtU2ECniidNEQSauTCxpaokQnQsBAEpIvF6Vdw92ZK
 sFRkI2Em8aybeoYdvgABi+S4VIVr8aQSxS8mCHrB4SgTRza0tFZ85+AkguTtoudjLiRwcS2cVf8H4gM55+aATWugjwBCe5u5n+0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 51e40a0dbe53cebe1f4b85bb47e250dc5a89b254:

  media: sun4i-csi: Add support for A10 CSI1 camera sensor interface (2020-01-04 08:21:35 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.6i

for you to fetch changes up to a79cf7ac3a4830399c53f90677dc5958a210a746:

  media: hantro: remove a pointless NULL check (2020-01-08 09:04:17 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Aditya Pakki (1):
      media: davinci/vpfe_capture.c: Avoid BUG_ON for register failure

Alexandre Courbot (1):
      media: mtk-vcodec: use v4l2_m2m_buffer where appropriate

Colin Ian King (1):
      media: v4l2-core: fix uninitialized structure fields being returned to userspace

Dan Carpenter (1):
      media: hantro: remove a pointless NULL check

Jernej Skrabec (6):
      media: uapi: hevc: Add scaling matrix control
      media: cedrus: hevc: Add support for scaling matrix
      media: uapi: hevc: Add segment address field
      media: cedrus: hevc: Add support for multiple slices
      media: cedrus: Fix decoding for some HEVC videos
      media: cedrus: hevc: Add luma bit depth

 Documentation/media/uapi/v4l/ext-ctrls-codec.rst       |  46 ++++++++++++++++-
 Documentation/media/uapi/v4l/pixfmt-compressed.rst     |   1 +
 drivers/media/platform/davinci/vpfe_capture.c          |  31 ++++++------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c     |  66 +++++++++++++-----------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h     |   7 ++-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c |   2 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c     |  14 +++---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.h     |   8 +--
 drivers/media/v4l2-core/v4l2-ctrls.c                   |  10 ++++
 drivers/media/v4l2-core/v4l2-subdev.c                  |   2 +-
 drivers/staging/media/hantro/hantro_v4l2.c             |   2 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c            |   7 +++
 drivers/staging/media/sunxi/cedrus/cedrus.h            |   1 +
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c        |   2 +
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c       | 122 +++++++++++++++++++++++++++++++++++++++------
 drivers/staging/media/sunxi/cedrus/cedrus_regs.h       |   3 ++
 drivers/staging/media/sunxi/cedrus/cedrus_video.c      |   1 +
 include/media/hevc-ctrls.h                             |  16 +++++-
 18 files changed, 263 insertions(+), 78 deletions(-)
