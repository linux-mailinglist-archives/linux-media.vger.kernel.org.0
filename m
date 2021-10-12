Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B37E342A752
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 16:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237285AbhJLOiF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Oct 2021 10:38:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236637AbhJLOiE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 10:38:04 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 439A1C061570;
        Tue, 12 Oct 2021 07:36:03 -0700 (PDT)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:4cb:a870:dcd8:9f87:c3be:dc06])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5B5891F43BC6;
        Tue, 12 Oct 2021 15:36:00 +0100 (BST)
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     mchehab@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@gmail.com, hverkuil-cisco@xs4all.nl,
        jc@kynesim.co.uk, ezequiel@vanguardiasur.com.ar
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 0/4]  media: HEVC: RPS clean up
Date:   Tue, 12 Oct 2021 16:35:48 +0200
Message-Id: <20211012143552.661751-1-benjamin.gaignard@collabora.com>
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

These patches are the last in my backlog impacting HEVC uAPI.
From my point of view, once they get merged, you could start talking
about how move HEVC uAPI to stable.

version 2:
- change DPB field name from rps to flags

Please note that the only purpose of commits 3 and 4 is to allow to test
G2 hardware block for IMX8MQ until a proper solution isuing power domain
can be found. Do not merge them.

GStreamer HEVC plugin merge request can be found here:
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1079

With those piece of code fluster score is 77/147.

Benjamin

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

