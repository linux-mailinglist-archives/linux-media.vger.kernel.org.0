Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8228428921
	for <lists+linux-media@lfdr.de>; Mon, 11 Oct 2021 10:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235302AbhJKIvV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Oct 2021 04:51:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235276AbhJKIvU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Oct 2021 04:51:20 -0400
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B41AAC061570
        for <linux-media@vger.kernel.org>; Mon, 11 Oct 2021 01:49:20 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Zqzimx8DYk3b0ZqzlmLjRU; Mon, 11 Oct 2021 10:49:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1633942158; bh=qr6r+Go4l+7HOHqf8iAnuiUvXOWkzCNrgjlzVgUbCYU=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=E1jyLCkIIX/GaQqZiUcacfsioH9eXSl2Tv73X4teLYdDsT1Bi+VEsjmgJwwCFIlmT
         YsJEf5vDVFesd0asRDje/vm1TtdSjzJyZMxcZaiEnksNJN3CmuZuF6DOY0ANLqmNEb
         ZJOA4urrRsFSp9f5KahfAdtCoiePlfrjjSzyI4i4HZ6J7e/d7A7bPMobzDvxA1guHR
         s2+1SlSIsrx3zHG9QrbAutJVdHvTSanexb0+Zn5iaCn9ILDBUKVeu+6BWhg9cqjGSs
         lZcSTBZFrJSNlFBXoNXrbhtNqCUvH2seeahcQQsh741HYx5inLInJGyLLf4szwMkz/
         Qsz6xsk7w1i8Q==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Michael Tretter <m.tretter@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.16] Allegro fixes/enhancements
Message-ID: <710cddfc-e3c3-0cf3-d2f9-c38ef6ca8b1a@xs4all.nl>
Date:   Mon, 11 Oct 2021 10:49:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKB0tj69B9Hd4QPoVoqnHLXMDvWraGlc06LuEGnLrwhQWox0a1dxvCNz22ENqd+4J6DkEgrGIVUVLODJyQ0NUX6hjrAT+ra7i4DhKJ9vgkJUwqrLKn1o
 uFKwN/fl65/3oKgsaWHplV+nE2mC73yYleqQQ73M/PuxswZMjFu8NUe1p+Zp1vL/pNAM+4iOr4TaT4mt0Ffwy06H1v2vR56LEhzufqVKJtZbzYZ6B8UHO1jI
 U2xJFCMIGYy5CxrEj20ifw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit fd2eda71a47b095e81b9170c3f8b7ae82b04e785:

  media: remove myself from dvb media maintainers (2021-10-08 13:56:25 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.16i

for you to fetch changes up to 8f472ea73758255b366fae57bde772396231efcd:

  media: allegro: write vui parameters for HEVC (2021-10-11 10:18:33 +0200)

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

 drivers/media/platform/allegro-dvt/allegro-core.c | 311 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------
 drivers/media/platform/allegro-dvt/allegro-mail.c |  23 +++---
 drivers/media/platform/allegro-dvt/allegro-mail.h |  10 ++-
 drivers/media/platform/allegro-dvt/nal-h264.c     |  74 -----------------
 drivers/media/platform/allegro-dvt/nal-h264.h     | 200 +++++++++++++++++++++++++++++++++++++++++++-
 drivers/media/platform/allegro-dvt/nal-hevc.c     | 202 +++++++++++++++++++++++++++++----------------
 drivers/media/platform/allegro-dvt/nal-hevc.h     | 189 +++++++++++++++++++++++++++++++++++++++---
 include/uapi/linux/v4l2-controls.h                |   5 ++
 8 files changed, 811 insertions(+), 203 deletions(-)
