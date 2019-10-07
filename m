Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACC5BCDC84
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 09:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbfJGHnA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 03:43:00 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:52425 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726202AbfJGHnA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Oct 2019 03:43:00 -0400
Received: from [IPv6:2001:983:e9a7:1:3d61:cdd2:8085:cc8] ([IPv6:2001:983:e9a7:1:3d61:cdd2:8085:cc8])
        by smtp-cloud7.xs4all.net with ESMTPA
        id HNfViKC4UjZ8vHNfWi52hQ; Mon, 07 Oct 2019 09:42:58 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Neil Armstrong <narmstrong@baylibre.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR v5.4] Regression fix for meson CEC drivers
Message-ID: <19c02424-d128-2f56-8e4e-04f11e9e381c@xs4all.nl>
Date:   Mon, 7 Oct 2019 09:42:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFR95dzZG+UtIW+bks6aL/AAXBj9azGK9cbRx3GN1BqwCCfyYFHxHz4wOWQcKk717E3ns3VgLuOd4eWKpCmcdFBqLy4dgLKsAZ6QaLhzTR3vQT0AxDai
 im6pIVopz/A11xs+kBZAohjfF0jubKsFrMRZSEg4kQs0FSdzx7+02DE1XmH6afTo8aqbzfSA2iwhwvCBIRbPb2z/WPBDEu/8ZTCqtgI0uxmgZjHj7xJohQvM
 IcBTxmJiav6pU8a0eoNV5kf1DeRkqEsjTZoIJ2LyBKcbCVFGtWj6zgMG5WkxrY6M/s11115oB8ikpCsb047e4Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 503e59365dd134b2c63864f14e2de0476284b003:

  media: i2c: ov2659: Switch to SPDX Licensing (2019-10-01 17:39:16 -0300)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/fix-v5.4a

for you to fetch changes up to 9b99475a1b930856b9a15ef2b83aad0fed74b889:

  media: meson/ao-cec: move cec_notifier_cec_adap_register after hw setup (2019-10-07 09:34:05 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Neil Armstrong (1):
      media: meson/ao-cec: move cec_notifier_cec_adap_register after hw setup

 drivers/media/platform/meson/ao-cec-g12a.c | 36 ++++++++++++++++++------------------
 drivers/media/platform/meson/ao-cec.c      | 30 +++++++++++++++---------------
 2 files changed, 33 insertions(+), 33 deletions(-)
