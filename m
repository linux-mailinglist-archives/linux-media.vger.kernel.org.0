Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD2A818A26E
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 19:36:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbgCRSfy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 14:35:54 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:42151 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbgCRSfy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 14:35:54 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jEdXk-00011Z-V8; Wed, 18 Mar 2020 19:35:52 +0100
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>, kernel@pengutronix.de,
        Adrian Ratiu <adrian.ratiu@collabora.com>,
        Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH v2 0/6] v4l2 JPEG helpers and CODA960 JPEG decoder
Date:   Wed, 18 Mar 2020 19:35:30 +0100
Message-Id: <20200318183536.15779-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

the JPEG header parser is updated to accept up to four components,
baseline and extended-sequential DCT encoded images, 8-bit and 12-bit
precision, as well as 8-bit and 16-bit quantization tables. As a
consequence, all drivers will have to check the number of components,
precision, and quantization table lengths.

I have not yet added support parsing the Adobe APP14 headers to
determine the color encoding, as it is unclear to me how it could be
used to signal RGBA components - for 4-component images it is defined
to disambiguate between CMYK and YCCK encodings. This is implemented
in libjpeg.
Patching the header data in place to normalize the component identifiers
is not part of the parser and will be added in a separate patch.

For now the rcar_jpu, s5p-jpeg and mtk-jpeg conversions are dropped.
Instead, a few CODA fixes were added that should avoid alignment issues
with odd-sized JPEG images and that stop tricking GStreamer into
negotiating NV12 and then switching to YUV420 instead in S_FMT.

regards
Philipp

Philipp Zabel (6):
  media: coda: round up decoded buffer size for all codecs
  media: add v4l2 JPEG helpers
  media: coda: jpeg: add CODA960 JPEG decoder support
  media: coda: split marking last meta into helper function
  media: coda: mark last capture buffer
  media: coda: lock capture queue wakeup against decoder stop command

 drivers/media/platform/Kconfig            |   1 +
 drivers/media/platform/coda/coda-common.c | 188 ++++++-
 drivers/media/platform/coda/coda-jpeg.c   | 572 ++++++++++++++++++++
 drivers/media/platform/coda/coda.h        |  10 +-
 drivers/media/v4l2-core/Kconfig           |   4 +
 drivers/media/v4l2-core/Makefile          |   2 +
 drivers/media/v4l2-core/v4l2-jpeg.c       | 632 ++++++++++++++++++++++
 include/media/v4l2-jpeg.h                 | 135 +++++
 8 files changed, 1519 insertions(+), 25 deletions(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-jpeg.c
 create mode 100644 include/media/v4l2-jpeg.h

-- 
2.20.1

