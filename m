Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E364A373B0D
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 14:24:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232428AbhEEMZC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 08:25:02 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49822 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231129AbhEEMZA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 May 2021 08:25:00 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 57ED41F42E68
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        kernel@collabora.com
Subject: [PATCHv2 0/3] Fix .buf_prepare
Date:   Wed,  5 May 2021 14:23:44 +0200
Message-Id: <20210505122347.7576-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <58791717-b7a9-d057-a998-a4440fcbe783@collabora.com>
References: <58791717-b7a9-d057-a998-a4440fcbe783@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drivers should only set the payload on .buf_prepare if the
buffer is CAPTURE type. If an OUTPUT buffer has a zero bytesused
set by userspace then v4l2-core will set it to buffer length.

If we overwrite bytesused for OUTPUT buffers, too, then
vb2_get_plane_payload() will return incorrect value which might be then
written to hw registers by the driver.

Andrzej Pietrasiewicz (2):
  media: hantro: Fix .buf_prepare
  media: cedrus: Fix .buf_prepare

Ezequiel Garcia (1):
  media: rkvdec: Fix .buf_prepare

 drivers/staging/media/hantro/hantro_v4l2.c        |  9 ++++++++-
 drivers/staging/media/rkvdec/rkvdec.c             | 10 +++++++++-
 drivers/staging/media/sunxi/cedrus/cedrus_video.c |  8 +++++++-
 3 files changed, 24 insertions(+), 3 deletions(-)


base-commit: 0b276e470a4d43e1365d3eb53c608a3d208cabd4
-- 
2.17.1

