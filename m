Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B4A0360BC8
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 16:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233079AbhDOO2S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 10:28:18 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:58913 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230056AbhDOO2S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 10:28:18 -0400
Received: from [192.168.2.10] ([84.202.3.209])
        by smtp.xs4all.nl with ESMTPA
        id X2yFl3tmbsMyaX2yIlUTB1; Thu, 15 Apr 2021 16:27:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618496874; bh=QKGF7N3usnqfIY++/Oh/9sP7mXR174oZ7b2SnCcn//Y=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=XyN9FGtyboTLDhQtPiyT5F2JjydFLTYtFpLfyYXrlCMUJI0yldN8iD4mqsY2psIb7
         lQwaDuxILlBHNUXsqB/fIaDfPH4IYxK8pwWssfElA00wo3vbJl5ovpDfb3N7XORpUx
         oJc54JSIcED79aG3nzTEBvCaIc/oGTxGd+zqGWfXGDEuc9zShk0FoW5LV/lMenUkAp
         uK2b09XwjConCqa14CK+rTmIm9Sm41y2YfthUuGneuPju2DslBoegB7acOd3qRCnoc
         X+OWIT7DvMH2m5nAHYuhjkVcZ57Hs8K7YgRMzuEHz9gaP8Pfq9iWI88d1snksG9A6W
         2d9Yd1RDGgboQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Beatriz Martins de Carvalho 
        <martinsdecarvalhobeatriz@gmail.com>,
        Martiros Shakhzadyan <vrzh@vrzh.net>,
        Mitali Borkar <mitaliborkar810@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.14] Various staging cleanups from the Outreachy
 project
Message-ID: <0db4d232-b345-6c06-5e3d-11504196af3b@xs4all.nl>
Date:   Thu, 15 Apr 2021 16:27:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNV+72Ou/3jIrVH2s6nFX4AfddklpEGGPYAqnM9z7+DPalo/4fmSKVktNb22BgqvIj4Clum/0m6QOjvtn8LYUKRCWv9jGZ42Z2SPzIi5y0IOZxshg6m1
 zS3foGnddTa4pAfQmnF2aMZIe4qn+jTxP3D7q+ETMMsqcRzp7IjNx4dTmHLJMZnqKdogsd78zMREJCKrIvnm3JJLVpJyU/vOVzaK7zmuFG80rNxlXznl7nUl
 X8N50dWCJ0bmqYZnnnzEBr9DA1Iwyn6kf9nWAYk+1fHuGtogKZT1EUFwYnQRTzLDDyxJeIYiZzXGCGJq9LD9aGpE0if2JN3CHWS8hv8feRL+gY1UWVdDRH4p
 Yj5+/J6Z
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 0b276e470a4d43e1365d3eb53c608a3d208cabd4:

  media: coda: fix macroblocks count control usage (2021-04-15 13:23:26 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.13-out2

for you to fetch changes up to bef8455e2730cdcc0f390d87d8a35737ecaeebd0:

  staging: media: atomisp: pci: Format comments according to coding-style in file atomisp_cmd.h (2021-04-15 16:25:38 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Aline Santana Cordeiro (8):
      staging: media: hantro: Align line break to the open parenthesis in file hantro_hw.h
      staging: media: hantro: Align line break to the open parenthesis in file hantro_mpeg2.c
      staging: media: omap4iss: Align line break to the open parenthesis in file iss_video.c
      staging: media: omap4iss: Remove unused macro function
      staging: media: atomisp: pci: Correct identation in block of conditional statements in file atomisp_v4l2.c
      staging: media: atomisp: pci: Correct identation in block of conditional statements in file atomisp_acc.c
      staging: media: atomisp: pci: Format comments according to coding-style in file atomisp_acc.c
      staging: media: atomisp: pci: Format comments according to coding-style in file atomisp_cmd.h

Beatriz Martins de Carvalho (1):
      staging: media: atomisp: i2c: align line break to match with open parenthesis

Martiros Shakhzadyan (2):
      staging: media: atomisp: Removed a superfluous else clause
      staging: media: atomisp: Minor code style changes

Mitali Borkar (5):
      staging: media: intel-ipu3: remove unnecessary blank line
      staging: media: intel-ipu3: reduce length of line
      staging: media: intel-ipu3: remove space before tabs
      staging: media: intel-ipu3: line should not end with '['
      staging: media: zoran: add spaces around '<<' operator

 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c |   4 +-
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c |  18 +++---
 drivers/staging/media/atomisp/pci/atomisp_acc.c    |  12 ++--
 drivers/staging/media/atomisp/pci/atomisp_cmd.h    | 161 +++++++++++++------------------------------------
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |   2 +-
 drivers/staging/media/hantro/hantro_hw.h           |   2 +-
 drivers/staging/media/hantro/hantro_mpeg2.c        |   2 +-
 drivers/staging/media/ipu3/include/intel-ipu3.h    |  13 ++--
 drivers/staging/media/omap4iss/iss.h               |   3 -
 drivers/staging/media/omap4iss/iss_video.c         |   4 +-
 drivers/staging/media/zoran/zr36057.h              |  14 ++---
 11 files changed, 80 insertions(+), 155 deletions(-)
