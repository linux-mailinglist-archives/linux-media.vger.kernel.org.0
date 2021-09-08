Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEF82403A42
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 15:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244451AbhIHNFI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 09:05:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243111AbhIHNFG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Sep 2021 09:05:06 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BC71C061575
        for <linux-media@vger.kernel.org>; Wed,  8 Sep 2021 06:03:57 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxF6-00053s-3c; Wed, 08 Sep 2021 15:03:56 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxF5-0004T1-IO; Wed, 08 Sep 2021 15:03:55 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxF5-00DpIQ-FO; Wed, 08 Sep 2021 15:03:55 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     kernel@pengutronix.de, m.tretter@pengutronix.de
Subject: [PATCH 0/7] media: allegro: fix and extend non-VCL NAL units
Date:   Wed,  8 Sep 2021 15:03:48 +0200
Message-Id: <20210908130355.3295403-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This series fixes and extends the non-VCL NAL units in the encoded video data
of the Allegro DVT video encoder.

Patches 1 and 2 fix and cleanup the handling of the ENCODE_FRAME firmware
message and response.

Patch 3 improves the SPS of the h.264 encoded video data by correctly scaling
the bit rate.

Patches 4 and 5 fix the color space that is written into the SPS of the h.264
encoded video data.

Patches 6 and 7 add support for writing vui parameters to the hevc encoded
video data. This allows to to specify the color space in the coded video for
hevc, too.

This series is independent of my other series regarding the encoder buffer.

Michael

Michael Tretter (7):
  media: allegro: fix row and column in response message
  media: allegro: remove external QP table
  media: allegro: correctly scale the bit rate in SPS
  media: allegro: extract nal value lookup functions to header
  media: allegro: write correct colorspace into SPS
  media: allegro: nal-hevc: implement generator for vui
  media: allegro: write vui parameters for HEVC

 .../media/platform/allegro-dvt/allegro-core.c |  82 +++++--
 .../media/platform/allegro-dvt/allegro-mail.c |   4 +-
 drivers/media/platform/allegro-dvt/nal-h264.c |  74 -------
 drivers/media/platform/allegro-dvt/nal-h264.h | 200 ++++++++++++++++-
 drivers/media/platform/allegro-dvt/nal-hevc.c | 202 ++++++++++++------
 drivers/media/platform/allegro-dvt/nal-hevc.h | 189 +++++++++++++++-
 6 files changed, 576 insertions(+), 175 deletions(-)

-- 
2.30.2

