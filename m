Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA0B0E58FE
	for <lists+linux-media@lfdr.de>; Sat, 26 Oct 2019 09:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbfJZH2y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Oct 2019 03:28:54 -0400
Received: from mailoutvs8.siol.net ([185.57.226.199]:47051 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726066AbfJZH2x (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Oct 2019 03:28:53 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id A285A523619;
        Sat, 26 Oct 2019 09:28:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id mq1P5yCeIwmJ; Sat, 26 Oct 2019 09:28:50 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 5B50952363D;
        Sat, 26 Oct 2019 09:28:50 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 111E6523619;
        Sat, 26 Oct 2019 09:28:49 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, paul.kocialkowski@bootlin.com
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: [PATCH v3 0/2] media: cedrus: improvements
Date:   Sat, 26 Oct 2019 09:27:50 +0200
Message-Id: <20191026072752.1072711-1-jernej.skrabec@siol.net>
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

Patch 2 replaces direct accesses to capture queue from m2m contex with
helpers which was designed exactly for that. It's also safer since
helpers do some checks.

Best regards,
Jernej

Changes from v2.
- Removed patch 2, because Paul plans to take different approach
- Rebased patch 1

Jernej Skrabec (2):
  media: cedrus: Fix decoding for some H264 videos
  media: cedrus: Use helpers to access capture queue

 drivers/staging/media/sunxi/cedrus/cedrus.h   |  8 +++-
 .../staging/media/sunxi/cedrus/cedrus_h264.c  | 38 ++++++++++++++++---
 .../staging/media/sunxi/cedrus/cedrus_regs.h  |  3 ++
 3 files changed, 42 insertions(+), 7 deletions(-)

--=20
2.23.0

