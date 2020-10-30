Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10B182A0554
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 13:27:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbgJ3M1Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 08:27:25 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:43935 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726226AbgJ3M1A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 08:27:00 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id YTUOkoQpNWvjMYTURkHPsT; Fri, 30 Oct 2020 13:26:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604060803; bh=QbOF5NfCRBryAnrrvOFQqQmLkXdyY4fXZjATfHWerSI=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=X0gC6evmj3hOH3Vz4F6/wbjBFfvHIv2eebGh3sEgJabJR5bZUXHjV8sy/YtGbQxPe
         nWJhQu3Of4DePbRDTnVVBtMC1sJws4dUovn3nm7M4SGyK+ooAm9QHaS5nALs6egFDb
         WAUi98Osp1XVSV5WxbuUtj0WhrBrWzXxazco/+CjWYFaMRSj2T+O03ZnJFNchEs4v3
         yN8RaE2PrSdHEenh0L26TWsTNyVyTzZ/NGGXIdxdUrtlk0KHU/IuWRaZtQTGY0j4A8
         mMNkUJDnyz5+BkAy8jMtSbaf+1WHB4f0q6pGZLw+UsB0hQBwGpdI77FHvn5gzi0wMS
         MCXFUKjqYfT6Q==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.11] More fixes
Message-ID: <7f665b32-c800-abed-b874-8083c55f1c5e@xs4all.nl>
Date:   Fri, 30 Oct 2020 13:26:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfI4qXOUr68RDIlG6x0w6vQORrTb5EDAGFwCYWmCg6SahHAhnVTb8gm/J1GZm5vjFL5TcQ7Sc8ggSfg9gPCAqOu1wSBYRZXw84ajM8qrXmS3VgQ81lqMh
 nRFgswCk5ynxIj2obUGcpKGP65fsXGygxpS+F/DF539uQnPqJk3TvuRC8ETdYW1B28+/Byl+GPNNLee4h/sGxwWo7nU1Q+P8wXzrjmuUZ3v5Bx2DrTKeo/Xy
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit dfe3d19bd092cefb184c6e65b881602c793edd33:

  Merge tag 'v5.10-rc1' into patchwork (2020-10-29 09:03:21 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.11d

for you to fetch changes up to 45fed6c32cf3df24c69c1b49e87408ca770e5021:

  coda: Clarify interrupt registered name (2020-10-30 12:21:07 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Evgeny Novikov (1):
      media: zr364xx: propagate errors from zr364xx_start_readpipe()

Ezequiel Garcia (4):
      coda: Remove redundant ctx->initialized setting
      coda: Simplify H.264 small buffer padding logic
      coda: Clarify device registered log
      coda: Clarify interrupt registered name

Liu Shixin (1):
      media: saa7164: convert to use DEFINE_SEQ_ATTRIBUTE macro

YueHaibing (1):
      media: rkvdec: Remove redundant platform_get_irq error message

 drivers/media/pci/saa7164/saa7164-core.c  | 17 +++--------------
 drivers/media/platform/coda/coda-bit.c    | 21 ++++++---------------
 drivers/media/platform/coda/coda-common.c | 15 +++++++--------
 drivers/media/usb/zr364xx/zr364xx.c       | 31 ++++++++++++++++++++++++-------
 drivers/staging/media/rkvdec/rkvdec.c     |  4 +---
 5 files changed, 41 insertions(+), 47 deletions(-)
