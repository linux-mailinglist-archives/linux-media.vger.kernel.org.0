Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 680E82F7C62
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 14:20:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732821AbhAONUM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 08:20:12 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:48019 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725946AbhAONUM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 08:20:12 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 0P0xlMZ5kaiWp0P11lUYBC; Fri, 15 Jan 2021 14:19:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1610716787; bh=ps/g1ngMt8065PdHBs/mt44QLGWknpCa5piLpYCRiV8=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=LmsrvGeo5jwMpFPFGQ3iECOMoPXIqYNjIyeoIbbBQi5RGAWc/v41VkCEEtoIILJvt
         ozFB+AdUqpWwpMuW+PpDqF1qf84a0Jezhxe1JoYAcEIyw5JubkrObEnn9oboQ50IT1
         ZG67jD/yxZkSib6EZCmqWPPf7KM1KGW62UxH2kExMG/QHqnhz0V9piG0l8w5EZdSPF
         p6iu/gvVuExbTErGqN1oDQcl5RXTRxNkY5mJjEFmcjRgKDQCF18kwd7AlSpcuzBFUg
         jng78adXq9L2Yz1JLclkNC3cNwvmSlyj5qah8J7BT7liaCCC3yM8NxTvZFakBbDjD8
         +4pAS4ZvIhpEQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Michael Tretter <m.tretter@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.12] allegro: add HEVC support
Message-ID: <6918c2b2-d559-8024-add6-88cc25547b13@xs4all.nl>
Date:   Fri, 15 Jan 2021 14:19:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNxpR3wQPWTHBPtMvwasxJA0bASnvJQJIZvt8ro3TiztFGG9WFwW6YePxXYOYtD2odomQw7kJW2TWDpUWr13LmEsDWpUDjU8Ch8K0Zk9V+Ux+lWiEX+R
 Jtxp2d9ft43QWYckIpxrvIMYNS/ExTKEoNDoUZa3m7pveCBq3kvYMi5B3qbL22VEuFmA933yBoIVTGX4QcUBb1W8TBR8giBwTHFXfb9pkF6D46Brv5fh9knw
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 321af22a3d2f6ed1fb1737c8588c01f6fec8a7b8:

  media: atomisp: convert comma to semicolon (2021-01-14 13:59:46 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.12d

for you to fetch changes up to 073a8a67a52ea51adf26dd450d9cec6cb64134c0:

  media: allegro: add support for HEVC encoding (2021-01-15 14:08:15 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Michael Tretter (18):
      media: allegro: extract RBSP handler from H.264 NAL generator
      media: allegro: add helper to report unsupported fields
      media: allegro: add HEVC NAL unit generator
      media: allegro: implement S_FMT for CAPTURE
      media: allegro: adjust channel after format change
      media: allegro: move encoding options to channel
      media: allegro: fix log2_max_poc in firmware 2019.1
      media: allegro: use handler_setup to configure channel
      media: allegro: initialize bitrate using v4l2_ctrl
      media: allegro: implement scaling of cpb size in SPS
      media: allegro: remove cpb_size and gop_size from channel
      media: allegro: remove profile and level from channel
      media: allegro: use accessor functions for QP values
      media: allegro: add helper to get entropy mode
      media: allegro: rename codec specific functions
      media: allegro: increase offset in CAPTURE buffer
      media: allegro: activate v4l2-ctrls only for current codec
      media: allegro: add support for HEVC encoding

 drivers/media/platform/allegro-dvt/Makefile       |   3 +-
 drivers/media/platform/allegro-dvt/allegro-core.c | 817 +++++++++++++++++++++++++++++++++++++++++++------
 drivers/media/platform/allegro-dvt/allegro-mail.c |  13 +-
 drivers/media/platform/allegro-dvt/allegro-mail.h |   1 +
 drivers/media/platform/allegro-dvt/nal-h264.c     | 336 +-------------------
 drivers/media/platform/allegro-dvt/nal-hevc.c     | 824 ++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/allegro-dvt/nal-hevc.h     | 350 +++++++++++++++++++++
 drivers/media/platform/allegro-dvt/nal-rbsp.c     | 310 +++++++++++++++++++
 drivers/media/platform/allegro-dvt/nal-rbsp.h     |  61 ++++
 9 files changed, 2290 insertions(+), 425 deletions(-)
 create mode 100644 drivers/media/platform/allegro-dvt/nal-hevc.c
 create mode 100644 drivers/media/platform/allegro-dvt/nal-hevc.h
 create mode 100644 drivers/media/platform/allegro-dvt/nal-rbsp.c
 create mode 100644 drivers/media/platform/allegro-dvt/nal-rbsp.h
