Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85E51371B03
	for <lists+linux-media@lfdr.de>; Mon,  3 May 2021 18:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232326AbhECQnI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 May 2021 12:43:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:37666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232371AbhECQkl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 May 2021 12:40:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 397B4611CD;
        Mon,  3 May 2021 16:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620059863;
        bh=8xW11yx65LCj4/dPIjgckIblW+bhn6N20VnQPTGV54c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qKJ3uvrHqaxVW8/ihQLS0/df/HAXLu3LxrHe1H/aXutup3YXbCj2LanMjcoTvtnCV
         rjAvAAifSNqRRcAVg7RN1xlqQNsAzkEFXZ1t9fQTK6eRJUKmKjICLROGVXIzCiUULb
         KVF7wXrn0tYkAPUuHUzLDj5WiQNXX2X7qcem16xYwMTarjpsPTEscNkLN9ThBipKsg
         Hs8zWKfUAQfSQIbMaL96VOKkjTS4VYzFcXpmMk6ZOdjO95mad2t7EgJpIC4uQbhlfp
         NizJy+2yAQtcWSbY5wIpYdOH5Yns/GSDfXrAi3vm1TrIftLGhCEVEQwf/KJ/yGX3L0
         eodwNdI75qgsQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.11 028/115] media: imx: capture: Return -EPIPE from __capture_legacy_try_fmt()
Date:   Mon,  3 May 2021 12:35:32 -0400
Message-Id: <20210503163700.2852194-28-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503163700.2852194-1-sashal@kernel.org>
References: <20210503163700.2852194-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

[ Upstream commit cc271b6754691af74d710b761eaf027e3743e243 ]

The correct return code to report an invalid pipeline configuration is
-EPIPE. Return it instead of -EINVAL from __capture_legacy_try_fmt()
when the capture format doesn't match the media bus format of the
connected subdev.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/media/imx/imx-media-capture.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index c1931eb2540e..b2f2cb3d6a60 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -557,7 +557,7 @@ static int capture_validate_fmt(struct capture_priv *priv)
 		priv->vdev.fmt.fmt.pix.height != f.fmt.pix.height ||
 		priv->vdev.cc->cs != cc->cs ||
 		priv->vdev.compose.width != compose.width ||
-		priv->vdev.compose.height != compose.height) ? -EINVAL : 0;
+		priv->vdev.compose.height != compose.height) ? -EPIPE : 0;
 }
 
 static int capture_start_streaming(struct vb2_queue *vq, unsigned int count)
-- 
2.30.2

