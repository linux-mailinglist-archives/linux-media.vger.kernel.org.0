Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2876511E7DD
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 17:16:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728036AbfLMQPZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 11:15:25 -0500
Received: from mailoutvs51.siol.net ([185.57.226.242]:33399 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726404AbfLMQPY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 11:15:24 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id CDC705245A4;
        Fri, 13 Dec 2019 17:15:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id FVEEviERtmZv; Fri, 13 Dec 2019 17:15:22 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 7DFA75245AA;
        Fri, 13 Dec 2019 17:15:22 +0100 (CET)
Received: from localhost.localdomain (cpe-86-58-102-7.static.triera.net [86.58.102.7])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 19BF9524592;
        Fri, 13 Dec 2019 17:15:22 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mchehab@kernel.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, hverkuil@xs4all.nl
Cc:     gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] media: cedrus: hevc: Minor fixes
Date:   Fri, 13 Dec 2019 17:15:14 +0100
Message-Id: <20191213161516.54688-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I noticed that some HEVC videos are not decoded correctly. It turns out
that same workaround which works for H264 also works for HEVC. Crash is
in HEVC more noticable. Any HEVC video decoding afterwards produces only
green screen.

Second patch just adds missing luma bit depth which was probably
overlooked in initial HEVC driver.

This was developed on top of:
https://patchwork.linuxtv.org/cover/60729/

Best regards,
Jernej

Jernej Skrabec (2):
  media: cedrus: Fix decoding for some HEVC videos
  media: cedrus: hevc: Add luma bit depth

 .../staging/media/sunxi/cedrus/cedrus_h265.c  | 26 ++++++++++++++++---
 .../staging/media/sunxi/cedrus/cedrus_regs.h  |  1 +
 2 files changed, 24 insertions(+), 3 deletions(-)

--=20
2.24.0

