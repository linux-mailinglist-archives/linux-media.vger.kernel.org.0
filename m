Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49DA418BE8A
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 18:43:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728747AbgCSRnZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 13:43:25 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:38713 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727253AbgCSRnY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 13:43:24 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MK3a4-1j0Btp0v5q-00LWgz; Thu, 19 Mar 2020 18:43:11 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 9CA6865021B;
        Thu, 19 Mar 2020 17:43:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id p8hR5X3iJEyc; Thu, 19 Mar 2020 18:43:10 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 4936364FD07;
        Thu, 19 Mar 2020 18:43:10 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.52) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 19 Mar 2020 18:43:10 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id A7F9A8051E; Thu, 19 Mar 2020 18:43:09 +0100 (CET)
Date:   Thu, 19 Mar 2020 18:43:09 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v2 10/10] media: adv748x: allow the HDMI sub-device to accept
 EDID
Message-ID: <f7387c96eee7f434cd5b86707b386015878ba9b7.1584639664.git.alexander.riesen@cetitec.com>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1584639664.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1584639664.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.52]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7762
X-Provags-ID: V03:K1:vr4OYoDjE9YrB9RjEXN80k6NQqQMP6ayMOLmGmMd2czOi/8NORG
 QhXwNDMbeIpUTsh/cqAfcVH0MtX10uqhqfYv0usEthLSrClXXxwHR+aCYFrK7iFxY9ruW2l
 uUyeC8j99rXpyqcCQ52/fHkY2UxVaXlZQoBCEb86BkAkAjUYmFROO0mVBjHpb2ZIkAWmyc1
 hGIstBqGANg/b7AdL6aBA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:I28fkQ/FN/M=:g6yKcXLfdT0TQAiIY/F69V
 TCD6zrM0+g8dkqtcjye84MGHpt+HuF6B9iAzayBA3QUmQNXPxAhE4CdTUK3DMRiBIrXTzoyJL
 Lyt30EXhRkOn1U+VsMYj8DR+kUNxX0C3rKl0uYMMmDttuGkBoVQkgvX4KC5ax4PKhktClS7qo
 Vknpv4q7kUPOhwlvnKlHyAlLrJoFh4XRzPvsXbGt9bWCwjE5Yg4ea655A3ZyUEbd0kfvQCcNP
 vdmfrrWVZ04iEQ9Rl5Qo951OdGm5qiHufch0UYEr1MnJ+mtu+pcTLZ4bruDd14CwDauP/cPL2
 8fsbYrCbSYsm4YDH25ZokuJA0prJ0QuDQ0v98utyDgMAmHQADkA5DYKeq68qBUJqpzvQ1YRRv
 IDU3sTlU4ltw0F+g3guBogtpYv95AbbmZO2TeehI9WPYdAIoSm30UNUQryCZHz3LieyGo9w4W
 KU80AWvHo7vwv2pCQrqitJkEPsPla2v6Y6fTRbqSu4aeFJ/FTeN/ciVvSG0pYfLFZaGnL9VvY
 YteXeZpahCIaId2bLNg4XH8DHGGlf0fXWHkpbPGjsKx6m5g/RE4d+pObXlzvpEwbcxh+Tg6PD
 tomKb6bJVZ7HeKzwkIX1Bod2/gaXLfIOHKTDxAmTK3eW9ggPb7tGa2iPwniLrYWV+zK9C47qa
 PqLGhuMFlGUloJmyUa0UgqIolAooc7CUGow75XX9uKhzi6ObeVuUjLXnuknNAcFbK73+0ubcn
 XZcxOVmttSSKnlRDnSu3uVgDo71pvASEk/BgG9Pjo5F/lnA+MHAc/69sk4lp8z4xYZ3sQ/eTj
 9uQYAGP8AAYBWV/3BYY5o0H0Mg59XBeYAkYKsjMJG4qtPL8o0atK3wvQe7aZTGULKuKiaLy
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This makes it possible to load a EDID reported by the device
with v4l2-ctl utility:

  vdev=/dev/$(grep -l '^adv748x.*hdmi$' /sys/class/video4linux/v4l-subdev*/name |cut -d/ -f5-5)
  v4l2-ctl -d $vdev --set-edid=pad=0,file=/etc/adv7482.edid

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
---
 drivers/media/i2c/adv748x/adv748x-hdmi.c | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x-hdmi.c b/drivers/media/i2c/adv748x/adv748x-hdmi.c
index 7655d817ceb6..88e309de3d56 100644
--- a/drivers/media/i2c/adv748x/adv748x-hdmi.c
+++ b/drivers/media/i2c/adv748x/adv748x-hdmi.c
@@ -775,7 +775,34 @@ static int adv748x_hdmi_log_status(struct v4l2_subdev *sd)
 	return 0;
 }
 
+static long adv748x_hdmi_querycap(struct adv748x_hdmi *hdmi,
+				  struct v4l2_capability *cap)
+{
+	struct adv748x_state *state = adv748x_hdmi_to_state(hdmi);
+
+	cap->version = LINUX_VERSION_CODE;
+	strlcpy(cap->driver, state->dev->driver->name, sizeof(cap->driver));
+	strlcpy(cap->card, "hdmi", sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "i2c:%d-%04x",
+		 i2c_adapter_id(state->client->adapter),
+		 state->client->addr);
+	cap->device_caps = V4L2_CAP_AUDIO | V4L2_CAP_VIDEO_CAPTURE;
+	cap->capabilities = V4L2_CAP_DEVICE_CAPS;
+	return 0;
+}
+
+static long adv748x_hdmi_ioctl(struct v4l2_subdev *sd,
+			       unsigned int cmd, void *arg)
+{
+	struct adv748x_hdmi *hdmi = adv748x_sd_to_hdmi(sd);
+
+	if (cmd == VIDIOC_QUERYCAP)
+		return adv748x_hdmi_querycap(hdmi, arg);
+	return -ENOTTY;
+}
+
 static const struct v4l2_subdev_core_ops adv748x_core_ops_hdmi = {
+	.ioctl = adv748x_hdmi_ioctl,
 	.log_status = adv748x_hdmi_log_status,
 };
 
-- 
2.25.1.25.g9ecbe7eb18

