Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2348417172C
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2020 13:27:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728976AbgB0M1z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Feb 2020 07:27:55 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:35015 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728962AbgB0M1z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Feb 2020 07:27:55 -0500
Received: from [IPv6:2001:420:44c1:2577:70b8:9d46:3264:f0c0]
 ([IPv6:2001:420:44c1:2577:70b8:9d46:3264:f0c0])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 7IGbjDvewjmHT7IGfjiaXk; Thu, 27 Feb 2020 13:27:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582806473; bh=58WclXyQGiPrY2BRRtcP2cydYOjbhVF1WqqVhTWZUxs=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=fX92NQUceeZTK+NnevQiTxdFwPfR/PCEAT7zeDUNnHTMJ/NG9C8+qf2i9h8IAj0pe
         BikN4378kgJuEI56gJIQYsmHT7kImBy0gb09i/eOpoFiTQHxIpACbbmvVFqRxPCZRg
         ZrOrUeuQWdyQ6LXvRYJ0gK1+zfgaElM/fQmmRy5Lnl6QIbHlwheTxph3bqGzxK9+Qm
         Ls9f5MnF1Rkmkgyi+i8LrzVWwF4ulgVsbb6PB4miJjQImU2guh1BDwQHQsk4zotSkn
         T3r+Ld2VYtiafmKkoGapCBO1HkXw+Qzlx5k1U03TzpL5k5JpTdX44UIcSww887oNUu
         S0PUoWKY8IT7g==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.7] Various fixes
Message-ID: <fb6dde22-ab34-72e8-64e9-4c612de7363c@xs4all.nl>
Date:   Thu, 27 Feb 2020 13:27:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfO6JGze7gS6+6b40zUCWjumw/Xf/BORwDdLD4HftGJDP2atrX0L+htQlbD991vuWDaeqHnYtjS318t9fI1gVLNeEyDm/9uXN9qubxAMJ+C/xnXAKHUNF
 bohdnNJhS26uVwD0g5l9SIs7Aj7iFawNm1bcn5ofwReZNcoM1hKsLqmHWp0EURv2boVTyju1FIes+jgKTduxK2z3JSAd0bRUgz+cDBuoXZuA7dVM6Vs5N9II
 k6LNOouLF9bnbfRxnXd/EcK3cRBS5fWUgUr0EsctI4agtpHBOGleSG2NLGKkJHOJ
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit ef0ed05dcef8a74178a8b480cce23a377b1de2b8:

  media: staging/imx: Missing assignment in imx_media_capture_device_register() (2020-02-24 17:53:22 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.7d

for you to fetch changes up to 4dcff79bc3cdf38e45d5adbd93c3d39bbeec105f:

  media: Documentation:media:v4l-drivers: Update vivid documentation. (2020-02-27 10:51:01 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Jae Hyun Yoo (1):
      media: aspeed: add AST2600 support

Peter Ujfalusi (1):
      media: rcar_drif: Do not print error in case of EPROBE_DEFER for dma channel

Vandana BN (1):
      media: Documentation:media:v4l-drivers: Update vivid documentation.

 Documentation/media/v4l-drivers/vivid.rst | 63 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---
 drivers/media/platform/aspeed-video.c     | 15 +++++++++++----
 drivers/media/platform/rcar_drif.c        |  6 +++++-
 3 files changed, 76 insertions(+), 8 deletions(-)
