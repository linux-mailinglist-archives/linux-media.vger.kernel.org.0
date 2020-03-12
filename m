Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55922182D32
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 11:13:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbgCLKNn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 06:13:43 -0400
Received: from retiisi.org.uk ([95.216.213.190]:50708 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726725AbgCLKNm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 06:13:42 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 32955634C87
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2020 12:12:45 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jCKpZ-0001Xf-G6
        for linux-media@vger.kernel.org; Thu, 12 Mar 2020 12:12:45 +0200
Date:   Thu, 12 Mar 2020 12:12:45 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.7] More sensor driver patches
Message-ID: <20200312101245.GA5730@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here are some more mostly sensor driver fixes for 5.7. Included is also a
Kconfig dependency fix, an ImgU driver patch, as well as MAINTAINERS and
.mailmap changes (smiapp and my e-mail address).

Please pull.


The following changes since commit 00c43088aa680989407b6afbda295f67b3f123f1:

  media: meson: vdec: add VP9 decoder support (2020-03-05 23:05:34 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.7-4-signed

for you to fetch changes up to 06192a565ea488fda1e723d411ff03822398109d:

  media: i2c: ov5695: Fix power on and off sequences (2020-03-11 12:57:05 +0200)

----------------------------------------------------------------
Sensor driver patches for 5.7

----------------------------------------------------------------
Bingbu Cao (1):
      media: staging: imgu: make imgu work on low frequency for low input

Dongchun Zhu (1):
      media: i2c: ov5695: Fix power on and off sequences

Ian Kumlien (1):
      Fix build failure due to missing select REGMAP_I2C

Lad Prabhakar (3):
      media: i2c: imx219: Fix power sequence
      media: i2c: imx219: Add support for RAW8 bit bayer format
      media: i2c: imx219: Add support for cropped 640x480 resolution

Lukas Bulwahn (1):
      MAINTAINERS: adjust entry to refactoring smiapp.h

Sakari Ailus (1):
      mailmap: Add entry for my @iki.fi address

 .mailmap                              |   1 +
 MAINTAINERS                           |   3 +-
 drivers/media/i2c/Kconfig             |   5 +
 drivers/media/i2c/imx219.c            | 235 +++++++++++++++++++++++++++++-----
 drivers/media/i2c/ov5695.c            |  49 ++++---
 drivers/staging/media/ipu3/ipu3-css.c |   6 +-
 drivers/staging/media/ipu3/ipu3-css.h |   3 +-
 drivers/staging/media/ipu3/ipu3.c     |  16 ++-
 8 files changed, 259 insertions(+), 59 deletions(-)

-- 
Sakari Ailus
