Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 493AD1802CB
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 17:06:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbgCJQGn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 12:06:43 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55120 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbgCJQGm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 12:06:42 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8D7A8580;
        Tue, 10 Mar 2020 17:06:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1583856400;
        bh=CvQ1gjp4Q8xTZ/5RZSFeYsWlgifcm4JozA1PNNjp/8I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Hf827eF33usGlNYKWfLF8QLICfzofMIeTUUwRzp3qREmcwahH4aTaVaUsTPzObzWC
         EIl7Lv9VBeOl9GEREWCafaPJisL+2NUXbioMBAOe01i2r8tqqioyoSVOs6T82tBLGp
         U7o1ikkbITlrQneNYjX2HlE9Jqo37pT4QDr3kU5o=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH v2 01/10] media: imx: imx7_mipi_csis: Power off the source when stopping streaming
Date:   Tue, 10 Mar 2020 18:06:24 +0200
Message-Id: <20200310160633.950-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200310160633.950-1-laurent.pinchart@ideasonboard.com>
References: <20200310160633.950-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The .s_stream() implementation incorrectly powers on the source when
stopping the stream. Power it off instead.

Fixes: 7807063b862b ("media: staging/imx7: add MIPI CSI-2 receiver subdev for i.MX7")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
Changes since v1:

- Added Fixes: tag
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 383abecb3bec..0053e8b0b88e 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -577,7 +577,7 @@ static int mipi_csis_s_stream(struct v4l2_subdev *mipi_sd, int enable)
 		state->flags |= ST_STREAMING;
 	} else {
 		v4l2_subdev_call(state->src_sd, video, s_stream, 0);
-		ret = v4l2_subdev_call(state->src_sd, core, s_power, 1);
+		ret = v4l2_subdev_call(state->src_sd, core, s_power, 0);
 		mipi_csis_stop_stream(state);
 		state->flags &= ~ST_STREAMING;
 		if (state->debug)
-- 
Regards,

Laurent Pinchart

