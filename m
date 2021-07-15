Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 803D23CA131
	for <lists+linux-media@lfdr.de>; Thu, 15 Jul 2021 17:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236013AbhGOPPc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jul 2021 11:15:32 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44380 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231771AbhGOPPc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jul 2021 11:15:32 -0400
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:4cb:a870:674e:7061:b49f:bcc0])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0795F1F439FE;
        Thu, 15 Jul 2021 16:12:30 +0100 (BST)
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     hverkuil@xs4all.nl, ezequiel@collabora.com, p.zabel@pengutronix.de,
        mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, jc@kynesim.co.uk,
        jernej.skrabec@gmail.com, nicolas@ndufresne.ca, cphealy@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v1 0/2] Add scaling lists support for HEVC
Date:   Thu, 15 Jul 2021 17:12:21 +0200
Message-Id: <20210715151223.656453-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HEVC scaling lists are used for the scaling process for transform
coefficients. Add structures and controls definitions and documentation
for this feature.
Add scaling lists support in Hantro HEVC driver.

Benjamin

Benjamin Gaignard (2):
  media: hevc: Add scaling matrix control
  media: hantro: Add scaling lists feature

 .../media/v4l/ext-ctrls-codec.rst             | 57 +++++++++++++++++++
 .../media/v4l/vidioc-queryctrl.rst            |  6 ++
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  6 ++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  4 ++
 drivers/staging/media/hantro/hantro_drv.c     |  8 ++-
 .../staging/media/hantro/hantro_g2_hevc_dec.c | 52 +++++++++++++++++
 drivers/staging/media/hantro/hantro_hevc.c    | 21 +++++++
 drivers/staging/media/hantro/hantro_hw.h      |  3 +
 include/media/hevc-ctrls.h                    | 11 ++++
 9 files changed, 165 insertions(+), 3 deletions(-)

-- 
2.25.1

