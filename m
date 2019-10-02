Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5070CC926E
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 21:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728894AbfJBTgD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 15:36:03 -0400
Received: from mailoutvs9.siol.net ([185.57.226.200]:42297 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727594AbfJBTgD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Oct 2019 15:36:03 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 7B6BF523B24;
        Wed,  2 Oct 2019 21:36:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 5fuv00fu8Dpe; Wed,  2 Oct 2019 21:36:00 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 1AC3B523B2B;
        Wed,  2 Oct 2019 21:36:00 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 8EC87523B24;
        Wed,  2 Oct 2019 21:35:58 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, paul.kocialkowski@bootlin.com
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] media: cedrus: improvements
Date:   Wed,  2 Oct 2019 21:35:50 +0200
Message-Id: <20191002193553.1633467-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is continuation of https://lkml.org/lkml/2019/5/30/1459 with several
patches removed (2 merged, others needs redesign) and one added.

Patch 1 fixes h264 playback issue which happens in rare cases.

Patch 2 sets PPS default reference index count in register from PPS
control. Currently it was set to values from slice control.

Patch 3 replaces direct accesses to capture queue from m2m contex with
helpers which was designed exactly for that. It's also safer since
helpers do some checks.

Best regards,
Jernej

Jernej Skrabec (3):
  media: cedrus: Fix decoding for some H264 videos
  media: cedrus: Fix H264 default reference index count
  media: cedrus: Use helpers to access capture queue

 drivers/staging/media/sunxi/cedrus/cedrus.h   |  8 +++-
 .../staging/media/sunxi/cedrus/cedrus_h264.c  | 46 ++++++++++++++-----
 .../staging/media/sunxi/cedrus/cedrus_regs.h  |  3 ++
 3 files changed, 44 insertions(+), 13 deletions(-)

--=20
2.23.0

