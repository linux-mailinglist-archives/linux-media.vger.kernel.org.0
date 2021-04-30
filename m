Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7726036F852
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 12:11:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbhD3KMP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 06:12:15 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:40785 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229543AbhD3KMO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 06:12:14 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id cQ7GlzCediDzScQ7JlpVTF; Fri, 30 Apr 2021 12:11:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619777485; bh=9lzRsfCcHy/qm5SD4tObnyXefwSdu4bMqUpGENDt88E=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ldxuWB/Boh7OZAPXHeuwmOHyxBF5tX5wgBJ+sirkTMBzFbKVBf8TrdTN+O6U2qIV0
         dpVzjExcQVmZ2/Dk32oQucFSRrB04MT4fmq3enCXLcJ9O0gzoAtY2coWMstqqt3jrs
         Ztj5eWdJd3b5lIHr6vbUeeKqwH7jrIhrQB54O8rbSJuM9oUErDtUr+iRku1/esiL02
         3v5Z9fk1eKFEy6Ii/f8pZ27c1jdv56ILDJdTuIRs+HXaBc019LJPi5MpRjUa57LxCB
         7OEDbzzQbaa/25ftbwsK8T86usMAKqNx2/es+DXIS5oQg+YS5ZxBaGhzGpxYmAVI/u
         85kR3DbD2PBlw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Deepak R Varma <mh12gx2825@gmail.com>,
        Martiros Shakhzadyan <vrzh@vrzh.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.14] More Outreachy cleanups (v2)
Message-ID: <706ba93e-fa1c-34ce-8c54-d8a1c442811e@xs4all.nl>
Date:   Fri, 30 Apr 2021 12:11:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMxN032xgmt3xrIGrH3KKwt/DmAoIbdWC/UwheBZHTpGRQx3Xqg2cMKtw3BsUhugCBGUSZK39M2vX7YQ2K65qosfQtwaYqBwON0Bz6IMw5CzxAPSMbQp
 PAOIRSH+mpE/whJXR43MKltkW4r31UfdWq+8ZyVZhuB2x0hp+sRblAo/Xurdk25mEuyqUhom0pRpbh7rqM633+iCxP6F2NLiOfdBPEF/lSEA3/fQD4d3VLt/
 OeiFglayZHwQQY6nbTbmr7BC+PQiLo4+rLkdkJd++Pw3yMNoQ2bd576ZT04lGg7l
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This supersedes an earlier PR. This v2 adds more patches from Martiros and
Deepak.

Regards,

	Hans

The following changes since commit 6756ae29420f849de4dc5c41f9fe948450b09285:

  media: staging: media: atomisp: pci: Format comments according to coding-style in file atomisp_cmd.h (2021-04-21 14:07:01 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.14-out1

for you to fetch changes up to 68dc2d762b637dd980f8dcc9e762da8cb788b57e:

  staging: media: atomisp: remove unwanted dev_*() calls (2021-04-30 11:49:40 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Aline Santana Cordeiro (5):
      staging: media: atomisp: pci: Balance braces around conditional statements in file atomisp_cmd.c
      staging: media: atomisp: pci: Balance braces around conditional statements in file atomisp_compat_css20.c
      staging: media: atomisp: pci: Balance braces around conditional statements in file atomisp_subdev.c
      staging: media: atomisp: pci: Balance braces around conditional statements in file atomisp_v4l2.c
      staging: media: tegra-video: Align line break to match with the open parenthesis in file vi.c

Deepak R Varma (8):
      staging: media: atomisp: balance braces around if...else block
      staging: media: atomisp: remove unnecessary braces
      staging: media: atomisp: use __func__ over function names
      staging: media: atomisp: reformat code comment blocks
      staging: media: atomisp: fix CamelCase variable naming
      staging: media: atomisp: replace raw pr_*() by dev_dbg()
      staging: media: atomisp: remove unnecessary pr_info calls
      staging: media: atomisp: remove unwanted dev_*() calls

Martiros Shakhzadyan (9):
      staging: media: atomisp: Fix sh_css.c brace coding style issues
      staging: media: atomisp: Remove redundant assertions in sh_css.c
      staging: media: atomisp: Fix the rest of sh_css.c brace issues
      staging: media: atomisp: Remove all redundant assertions in sh_css.c
      staging: media: atomisp: Remove a superfluous else clause in sh_css.c
      staging: media: atomisp: Replace if else clause with a ternary
      staging: media: atomisp: Fix alignment and line length issues
      staging: media: atomisp: Refactor ia_css_stream_load()
      staging: media: atomisp: Fix line split style issues

 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c           |   49 +-
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c           |   25 +-
 drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c |    6 +-
 drivers/staging/media/atomisp/i2c/atomisp-lm3554.c           |    2 +-
 drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c          |  108 +-
 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c           |   41 +-
 drivers/staging/media/atomisp/i2c/mt9m114.h                  |    6 +-
 drivers/staging/media/atomisp/i2c/ov2680.h                   |   10 +-
 drivers/staging/media/atomisp/pci/atomisp_cmd.c              |   19 +-
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c     |    4 +-
 drivers/staging/media/atomisp/pci/atomisp_subdev.c           |    4 +-
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c             |    4 +-
 drivers/staging/media/atomisp/pci/sh_css.c                   | 2089 ++++++++++++++++++--------------------
 drivers/staging/media/tegra-video/vi.c                       |    4 +-
 14 files changed, 1100 insertions(+), 1271 deletions(-)
