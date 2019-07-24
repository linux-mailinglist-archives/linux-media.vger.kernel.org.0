Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61CAA72CD2
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 13:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727381AbfGXLFc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 07:05:32 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:50873 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726981AbfGXLFb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 07:05:31 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id qF5Hh3g5kLqASqF5NhNDzF; Wed, 24 Jul 2019 13:05:29 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Maxime Jourdan <mjourdan@baylibre.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 01/14] v4l2-ioctl.c: OR flags in v4l_fill_fmtdesc(), not don't overwrite
Date:   Wed, 24 Jul 2019 13:05:10 +0200
Message-Id: <20190724110523.29248-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190724110523.29248-1-hverkuil-cisco@xs4all.nl>
References: <20190724110523.29248-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfHTcspy1VwrGjmYaMDxR3AkHmgn15EpEQjJ1j2p9LkdB2nm4eYTMHFDYl6OB/gC5Bk4jfET5vEgS9mrUPR85F+qerV6BMmjM42wJDeBre/x5atvuPnk5
 2ouyYkAHMtDVlcQhzVry9/Hohr29so5AR0hMEuRaMLzmpBRCdrZOl3J+ra78vjSN7zcvPBmEFq1hRAEv5iVeMh+1n/bT/0Kfgr6jw/rwViBuFPO+1HyNNNz/
 jdD/M0/h7MnZuj4kFsJi39k5Fsw5MT7uQHDyRpk7oUHNmXpuc/A+Y9/2uOhzDMeyd7Q2VC2GdRIaAdTlVXQtk0CAIO4mcfID3GU5D/tMyo7RXM2Xr3Gw/D63
 C4/64EJdTFL/SfrOVyzcxlvkZpECmtJB2sReLv97XJbWeUThtLFud+IFoRNxC8btgkiCWL/F3hRH51g3KKMvjFdKHzI+3rP3wg8UB00fcaV3C9u4wJUfadvt
 /v9n9Ni1UmrgNG9Cc77t5mcTeDSpaRO0vETMiOvypCg7ozv8tb2N2C5d3fMHfsDVa4JbbPitLC4ML8XeWqNPaThj9rwEMOcXkGXjFbf8rrYlQJWTR+ikUEdt
 g+4112MNLhMoWidNnjgOTpmJMcsH9mzpW3K0pcoDXf8M5g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If a driver sets a FMT flag in the enum_fmt op, then that will be
ignored since v4l_fill_fmtdesc() overwrites it again.

v4l_fill_fmtdesc() should OR its flag, not overwrite it.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 80efc581e3f9..911a20f915c5 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1390,7 +1390,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 
 	if (descr)
 		WARN_ON(strscpy(fmt->description, descr, sz) < 0);
-	fmt->flags = flags;
+	fmt->flags |= flags;
 }
 
 static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
-- 
2.20.1

