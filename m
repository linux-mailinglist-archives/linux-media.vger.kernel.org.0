Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE7EC431324
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 11:18:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231515AbhJRJUa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 05:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231516AbhJRJUZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 05:20:25 -0400
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55E94C06161C
        for <linux-media@vger.kernel.org>; Mon, 18 Oct 2021 02:18:14 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id cOmXmthbSk3b0cOmamh9KR; Mon, 18 Oct 2021 11:18:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634548692; bh=mthhmVFyC+GMNPvwjag7+zhFpjkAexqgPlRHa+TrzW4=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=DpUZ+Q3GCUa8Yb5xk+UYH/rpdjwQZG1+qWee2xCAcbZrlQtDaCyChII2YRDnM5Uwp
         wFl00peJSooudYvdqCurm/pfyHfYBmn0lBgqrCFIQY9rlML0ummCqWIFbTvLfcJMEg
         RgKFXDApcPlKvBLsTP1jMdhSp6KYSIirn82tkrCxyjHRGwlcFi4oDeZx47bs/UBhnK
         hMEgwwemgqbeKIYap5Ee4ojAhz+5DIJZ8BTV8Lh5fRLD+SahViT0NPvMsn8t4m+F2R
         CcFGannQ7fZKHgh8N8G/A2GzthnTKpBn0BMcL+DdazMU7m4usOSukc3ZDEI9zoJvSg
         eWcPl+9RMe2kg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Michael Tretter <m.tretter@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.16] v2: Allegro fixes/enhancements
Message-ID: <9792587d-b4f3-27bc-add4-287126ed8eae@xs4all.nl>
Date:   Mon, 18 Oct 2021 11:18:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLI0p6TtKzEetDQJx16lcsF3tCiEtWELhQpeP8HOeCQ8a3SpivEtejB+iVXMFqCmj78843857VlxRzi02qqYWbKUch3KColMgGLvp8PurYRoyfKnWldz
 +WY+DdAQuUlDadREV7fZohfWkMcgmATqICXhOEQchRBoHP9SfVn/UlNtB/aYnBpdfiypkCseqMuxgE0oEYXJQiA+O5Rdw5DyR18Urmgak54Tem8S3ZemNgg/
 tDNUDKS8Q81PzssI10NT1A==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Updated version of the previous 'Allegro fixes/enhancements' PR.

Changes: moved the #include <linux/videodev2.h> additions for nal-h264.h and nal-hevc.h
from patches 11/13 and 12/13 to 10/13, where they are needed. The end result is the
same as for v1 of this PR, but there are now no warnings when compiling after applying
patch 10 and not the following patches.

Regards,

	Hans

The following changes since commit fd2eda71a47b095e81b9170c3f8b7ae82b04e785:

  media: remove myself from dvb media maintainers (2021-10-08 13:56:25 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.16i

for you to fetch changes up to b9e9237724e078efe33aa63a5fb0f219097f8d35:

  media: allegro: write vui parameters for HEVC (2021-10-18 11:13:01 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Michael Tretter (13):
      media: allegro: ignore interrupt if mailbox is not initialized
      media: allegro: fix module removal if initialization failed
      media: allegro: lookup VCU settings
      media: allegro: add pm_runtime support
      media: allegro: add encoder buffer support
      media: allegro: add control to disable encoder buffer
      media: allegro: fix row and column in response message
      media: allegro: remove external QP table
      media: allegro: correctly scale the bit rate in SPS
      media: allegro: extract nal value lookup functions to header
      media: allegro: write correct colorspace into SPS
      media: allegro: nal-hevc: implement generator for vui
      media: allegro: write vui parameters for HEVC

 drivers/media/platform/allegro-dvt/allegro-core.c | 311 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++------
 drivers/media/platform/allegro-dvt/allegro-mail.c |  23 ++---
 drivers/media/platform/allegro-dvt/allegro-mail.h |  10 +-
 drivers/media/platform/allegro-dvt/nal-h264.c     |  74 ---------------
 drivers/media/platform/allegro-dvt/nal-h264.h     | 200 +++++++++++++++++++++++++++++++++++++++-
 drivers/media/platform/allegro-dvt/nal-hevc.c     | 202 ++++++++++++++++++++++++++--------------
 drivers/media/platform/allegro-dvt/nal-hevc.h     | 189 ++++++++++++++++++++++++++++++++++++--
 include/uapi/linux/v4l2-controls.h                |   5 +
 8 files changed, 811 insertions(+), 203 deletions(-)
