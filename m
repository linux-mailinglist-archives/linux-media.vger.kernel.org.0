Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 261EB14A615
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2020 15:30:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729137AbgA0OaR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jan 2020 09:30:17 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60494 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgA0OaQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jan 2020 09:30:16 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 49465293978
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     devel@driverdev.osuosl.org
Cc:     linux-media@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH 0/4] Hantro VPU JPEG encoder fixes
Date:   Mon, 27 Jan 2020 15:30:05 +0100
Message-Id: <20200127143009.15677-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series addresses quality issues in encoded JPEG images.

The first patch actually restores the intention of the original submission
of this driver: due to a typo the helper variables were unused and then
have been removed in some cleanup done by Mauro.

The second patch aligns the driver's luma quantization table with
the one in the ITU-T.81 standard.

The third patch changes the order in which quantization tables are
written to the resulting file and to the hardware. The file expects
a zig-zag order, while the hardware wants some special order, neither
linear nor zig-zag. In other words, hardware-wise it rearranges which
parts of quantization tables go into which 4-byte registers - in a hardware
specific order rather than linear or zig-zag. It also affects rk3288 and
hasn't been tested with it.

The fourth patch then rearranges the sequence of register writes.
The whole luma quantization table must be written first, and then the
chroma quantization is written. In other words, while patch 3/4
changes what goes into which register, this patch changes when each
register is written to. It also affects rk3288 and hasn't been
tested with it.

Andrzej Pietrasiewicz (4):
  media: hantro: Read be32 words starting at every fourth byte
  media: hantro: Use standard luma quantization table
  media: hantro: Write the quantization tables in proper order
  media: hantro: Write quantization table registers in increasing
    addresses order

 .../staging/media/hantro/hantro_h1_jpeg_enc.c | 19 ++++-
 drivers/staging/media/hantro/hantro_jpeg.c    | 76 ++++++++++++++-----
 drivers/staging/media/hantro/hantro_jpeg.h    |  2 +-
 .../media/hantro/rk3399_vpu_hw_jpeg_enc.c     | 24 ++++--
 4 files changed, 89 insertions(+), 32 deletions(-)

-- 
2.17.1

