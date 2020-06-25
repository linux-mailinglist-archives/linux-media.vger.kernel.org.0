Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48DB220A312
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 18:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404106AbgFYQgQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 12:36:16 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38396 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404064AbgFYQgP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 12:36:15 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 6C0BE2A572E
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 0/6] Hantro low-hanging cleanups
Date:   Thu, 25 Jun 2020 13:35:19 -0300
Message-Id: <20200625163525.5119-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.26.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tackle some low hanging items. There's not much to say here,
see the patches for details.

We'll be soon posting more interesting changes :)

Thanks,
Ezequiel

Ezequiel Garcia (6):
  hantro: h264: Remove unused macro definition
  hantro: h264: Rename scaling list handling function
  hantro: Rework how encoder and decoder are identified
  hantro: Move hantro_enc_buf_finish to JPEG codec_ops.done
  hantro: Remove unused bytesused argument
  hantro: Make sure we don't use post-processor on an encoder

 drivers/staging/media/hantro/hantro.h         |  9 +--
 drivers/staging/media/hantro/hantro_drv.c     | 60 ++++++-------------
 .../staging/media/hantro/hantro_h1_jpeg_enc.c | 17 ++++++
 drivers/staging/media/hantro/hantro_h264.c    |  6 +-
 drivers/staging/media/hantro/hantro_hw.h      |  5 +-
 drivers/staging/media/hantro/imx8m_vpu_hw.c   |  2 +-
 drivers/staging/media/hantro/rk3288_vpu_hw.c  |  8 +--
 drivers/staging/media/hantro/rk3399_vpu_hw.c  |  7 +--
 8 files changed, 49 insertions(+), 65 deletions(-)

-- 
2.26.0.rc2

