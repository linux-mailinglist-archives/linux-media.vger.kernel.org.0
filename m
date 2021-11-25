Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B55F345DE25
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 16:58:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356033AbhKYQCI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 11:02:08 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40628 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232892AbhKYQAH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 11:00:07 -0500
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:2581:f820:804e:edb9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6C9131F464B1;
        Thu, 25 Nov 2021 15:56:53 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637855813; bh=gY+zp9vPvH8Yfyvu4eMVhjohWxix4aAoiT0fFLyuGyc=;
        h=From:To:Cc:Subject:Date:From;
        b=d6EhfGJWltZKcP2P4XEpqUawVG3xWktoaszQ4AwlUA19QRsRO3BK/Yc+N6SJyrfWk
         UCUKbM5abqyzV3BUH1P6dMbc/Zy40Ja9iYInXHWUpO9HCs0+zkJ3Ca/ZSLmIMNLYbp
         Pnj+cKyhWTYffAyh9Da6vx6qcuMutMDgpjZ3WShYMpXCXG6h5x8YNlRbdXLo/PsOmJ
         pN5sN7XeJgSoqXfbZXOPD+5OJcCn+ED3fKcAPevtEJpfKwDuc0a7FA9vxEv+Lcurp+
         GEK9HAss9dbm9kDoK5EJ9qPsm2LeYtVVbkiHaugYEYrjuGZoYbCf4hx3m2/MUGYl8D
         XdhES0Jf0MEsA==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     mchehab@kernel.org, ezequiel@vanguardiasur.com.ar,
        p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-staging@lists.linux.dev, kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v3 0/4] media: HEVC: RPS clean up
Date:   Thu, 25 Nov 2021 16:56:46 +0100
Message-Id: <20211125155650.630977-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series aims to clean up Reference Picture Set usage and flags.

Long term flag was named with RPS prefix while it is not used for RPS
but for mark long term references in DBP. Remane it and remove the two
other useless RPS flags.

Clarify documentation about RPS lists content and make sure that Hantro
driver use them correctly (i.e without look up in DBP).

version 3:
- rebased on top of v5.16-rc1

version 2:
- change DPB field name from rps to flags

Please note that the only purpose of commits 3 and 4 is to allow to test
G2 hardware block for IMX8MQ until a proper solution isuing power domain
can be found. Do not merge them.

GStreamer HEVC plugin merge request can be found here:
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1079

With those piece of code fluster score is 77/147.

Benjamin Gaignard (4):
  media: hevc: Remove RPS named flags
  media: hevc: Embedded indexes in RPS
  media: hantro: Use syscon instead of 'ctrl' register
  arm64: dts: imx8mq: Add node to G2 hardware

 .../media/v4l/ext-ctrls-codec.rst             | 14 +++---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     | 43 +++++++++++++----
 drivers/staging/media/hantro/hantro.h         |  5 +-
 .../staging/media/hantro/hantro_g2_hevc_dec.c | 27 +++--------
 drivers/staging/media/hantro/imx8m_vpu_hw.c   | 48 ++++++++++++-------
 .../staging/media/sunxi/cedrus/cedrus_h265.c  |  2 +-
 include/media/hevc-ctrls.h                    |  6 +--
 7 files changed, 84 insertions(+), 61 deletions(-)

-- 
2.30.2

