Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B05CC2E1B72
	for <lists+linux-media@lfdr.de>; Wed, 23 Dec 2020 12:08:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728591AbgLWLHv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Dec 2020 06:07:51 -0500
Received: from mailoutvs28.siol.net ([185.57.226.219]:43174 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728348AbgLWLHv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Dec 2020 06:07:51 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id C49B8522473;
        Wed, 23 Dec 2020 12:07:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 20V28MG6a4SF; Wed, 23 Dec 2020 12:07:08 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 6C31A5224AF;
        Wed, 23 Dec 2020 12:07:08 +0100 (CET)
Received: from localhost.localdomain (89-212-178-211.dynamic.t-2.net [89.212.178.211])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id DF1C5522473;
        Wed, 23 Dec 2020 12:07:05 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, paul.kocialkowski@bootlin.com
Cc:     mchehab@kernel.org, wens@csie.org, jernej.skrabec@siol.net,
        hans.verkuil@cisco.com, nicolas.dufresne@collabora.com,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-sunxi@googlegroups.com
Subject: [PATCH 0/2] media: cedrus: a couple of fixes
Date:   Wed, 23 Dec 2020 12:06:57 +0100
Message-Id: <20201223110659.2631255-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This short series fixes two issues:
1. conformance to v4l2 request api specifications
2. regression in h264 video decoding introduced during h264 api rework

Please take a look.

Best regards,
Jernej

Jernej Skrabec (2):
  media: cedrus: Remove checking for required controls
  media: cedrus: Fix H264 decoding

 drivers/staging/media/sunxi/cedrus/cedrus.c   | 49 -------------------
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  1 -
 .../staging/media/sunxi/cedrus/cedrus_h264.c  |  2 +-
 3 files changed, 1 insertion(+), 51 deletions(-)

--=20
2.29.2

