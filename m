Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDCE5227C5B
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 12:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729026AbgGUKAt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 06:00:49 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:59987 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728006AbgGUKAt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 06:00:49 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id xp4ojgRupNPeYxp4pjtEuX; Tue, 21 Jul 2020 12:00:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1595325648; bh=lRd/mrpoXU+dHuJSLnSnM9C/kc9j+3u6sTBltirbrKk=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Phu5t9nHBhT+jZlvimRPoivsOX9pS3MOlQB/PsnsIbePRgghwPvTLjoRWYEy9Gefx
         R7Vr516XS6S3A8AL2nHn//Wt02HGOmNiJQvbeCm616TrC1jYn3UWNkkS4NkoEVpaST
         7ZD9qllteorSzpn2qy4BKwZFDrKyXgUK78ku33tMpydEi7vntig3K4mFWWdhMWFXQO
         oHXcyPwqg1k6zzQd1bLHmWKSQrCgcvvLSFpYSRg+1rq4prtiLZld7sfhTLEObJHgZO
         AjtEjExJmYpVIU7FBt2meUrZ73+Dt+RIE9y98CuU569cAk2s0hH3NvSe1I7JCQqFMJ
         SE6/BZN6aaN6w==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.9] Introduce [get|set]_mbus_config pad ops
Message-ID: <b7a7ab4d-4477-b52f-c7d6-980bc367ddf5@xs4all.nl>
Date:   Tue, 21 Jul 2020 12:00:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCFkpmc7ukW0eQiA6/aIN9xjO28b73O0V5Jp1nMkeCFfcY7+kM7AoDea5dmdMhWfa/qFrwFWgupg5wo6dd3/x25PbfSd5c1QwJjb7MGufEm4O2QXt/bn
 pptX2x9Nepey6vt0VzjD+D4/IpWmJBD0LDE5liPwPDbt6ovMiycCp2grtplshotYxyKN+/2lCO6Kh8/PctI5SVDDSGbjr9XhS7ARSBFnckTT3kIiM1QmY3ce
 gBOLQcUWoot+L3heR5SLbG/heSguYWxH3+xGQZKX9bnuq+ojMB3mhViRGACQv4E9SUrC9uB4531oCL64ReOghA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series replaces the old g/s_mbus_config with get/set_mbus_config.

The new ops just get and set the mbus configuration. The set_mbus_config
is primarily used to change the number of lanes in use.

The old g_mbus_config would report *all* possible configurations instead of
the current config, but this was a last left-over from soc-camera.

Today this configuration information comes from the device tree or the
platform data.

Regards,

	Hans

The following changes since commit 8f2a4a9d5ff5202d0b3e3a144ebb9b67aabadd29:

  media: dvbdev.h: keep * together with the type (2020-07-19 14:26:25 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.9j

for you to fetch changes up to 1d300587ed86a7ed92662b2f309048d4fa4e3a97:

  media: rcar-csi2: Negotiate data lanes number (2020-07-21 11:40:46 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Jacopo Mondi (10):
      media: v4l2-subdev: Introduce [get|set]_mbus_config pad ops
      media: i2c: Use the new get_mbus_config pad op
      media: i2c: ov6650: Use new [get|set]_mbus_config ops
      media: pxa_camera: Use the new set_mbus_config op
      media: v4l2-subdev: Remove [s|g]_mbus_config video ops
      media: v4l2- mediabus: Add usage note for V4L2_MBUS_*
      staging: media: imx: Update TODO entry
      media: i2c: adv748x: Adjust TXA data lanes number
      media: i2c: adv748x: Implement get_mbus_config
      media: rcar-csi2: Negotiate data lanes number

 drivers/media/i2c/adv7180.c                 |   7 ++-
 drivers/media/i2c/adv748x/adv748x-core.c    |  31 +++++++---
 drivers/media/i2c/adv748x/adv748x-csi2.c    |  31 ++++++++++
 drivers/media/i2c/adv748x/adv748x.h         |   1 +
 drivers/media/i2c/ml86v7667.c               |   7 ++-
 drivers/media/i2c/mt9m001.c                 |   7 ++-
 drivers/media/i2c/mt9m111.c                 |   7 ++-
 drivers/media/i2c/ov6650.c                  |  53 ++++++++++++-----
 drivers/media/i2c/ov9640.c                  |   7 ++-
 drivers/media/i2c/tc358743.c                |   7 ++-
 drivers/media/i2c/tvp5150.c                 |   7 ++-
 drivers/media/platform/pxa_camera.c         | 189 ++++++++++++++++--------------------------------------------
 drivers/media/platform/rcar-vin/rcar-csi2.c |  75 +++++++++++++++++++++---
 drivers/media/v4l2-core/v4l2-subdev.c       |  16 +++++
 drivers/staging/media/imx/TODO              |   4 ++
 include/media/v4l2-mediabus.h               |  33 +++++++++--
 include/media/v4l2-subdev.h                 |  38 ++++++++----
 17 files changed, 317 insertions(+), 203 deletions(-)
