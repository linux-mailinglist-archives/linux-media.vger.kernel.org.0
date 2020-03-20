Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC64618D4E1
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 17:51:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727546AbgCTQvT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Mar 2020 12:51:19 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:38175 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbgCTQvT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Mar 2020 12:51:19 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MjSHa-1jiK2G0LM2-00ktPG for <linux-media@vger.kernel.org>; Fri, 20 Mar
 2020 17:51:18 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id D19DB64FB26
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2020 16:51:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id wxWVLusRGkSr for <linux-media@vger.kernel.org>;
        Fri, 20 Mar 2020 17:51:17 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 828D664D62D
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2020 17:51:17 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.41) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 20 Mar 2020 17:51:17 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 86EAC80509; Fri, 20 Mar 2020 17:12:06 +0100 (CET)
Date:   Fri, 20 Mar 2020 17:12:06 +0100
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
Subject: [PATCH v3 11/11] media: adv748x: allow the HDMI sub-device to accept
 EDID
Message-ID: <4fce566b68bbe4f85cf92cd80a455b575a5d95d1.1584720678.git.alexander.riesen@cetitec.com>
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
References: <cover.1584720678.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1584720678.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.41]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7660
X-Provags-ID: V03:K1:kmxSu3XQAVB7Gl5PCCmRsvwr91dwWE511EXQREeJxA5jeHtnVdC
 gaUo2YoXhI4rQcsUIb9syBR9oZVDKLZ/EETjzfmDaVwN5vAyXKGR9Inf7tDTY+3gDLEu595
 1G/hADVPntpo1r8O1zICBpIaA3A4h1LukxR/eO1xQZLxGwBzNlyEXihMMOmV3RA1OBWnSvt
 pvFGNUGVrwZdpXvowG5sg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZBzJeD9Rrrc=:0ZsSP28H9EvPzLf1y+x2zx
 0eR0aACCNN2ATPuc4chitUN8UzHrK/znaiJQha1nuZT5om1zmed3d8DIkv9MYbISqrq9DOnxT
 bV8hLOtFiV4cANPR5dOSexBV//9kU1RZfpX3HM1NF2j1mS+R+km07s0kTjtqpgcTcdRyMRidE
 /M8EEwAgxgFQJWkK0X/K4BrZmQMRrC9Z/FXHktw6b6W6X8m5Q1wggbRwN0QSdzZ2+W454+rgk
 xht00XaPUZ49Pn8CJccKBi1hOks/GcJhfP/NDxxAHbNwF4QHkTr7HDfNsUSL1SqZz00j1mlDT
 BDomGs3sbXufGT01FUYKf0PDewxnvwCqXYgMMzsj8yDNXxeHhkq9Tj8EboSF2LNOzJ1oHkpz5
 SGmVjk+jh64I6yji8+oK/VOM4EJ5ti/Ha5/8l+C/2n8EweUQkZ4L3rz/EOyB3B3iYMK/VfV6G
 qVO6gX305mgH79pbW+IUhV5xM+HwZSb6O6xc40Atvt/JOSsaQ0B82EuywVEwG1Q1paiW1GxYF
 e4L7OaCk5kM9e4/LAZYCP6wR/4JVpXG41rIpycprk2gJBD/EelMeU5E0VTsL5ydvsHjJXWjsV
 AD9tOQw8h1YyLEhZxrcgn/tK0lU2xTimBG9BHrASPoS+hL884QLh6eReguDCcdHWVuVLwYulV
 brU4NNfa/IRkT+y+CP+ETd/lJz5sYiiGBd9dfv0JNDFH8e5NV7UHOg1YuEG6GicRJ9/aS2R94
 5IWJMsjr8gzBebu9nyJTwoaqeQo9bQAQOO+lymadBFSMVy3x5kiXbtldST+xOwpkfvXeMapPY
 shFLZv8+LtfUprr0jv95d/fI2U5PWTPfNfu2iI7jcgPeQEEVNByyVe3vw8jBzd9ct5lSipU3o
 /FvH/bivlT0ClYw5HdK3BhnmQzVmQVnijDmu5OrEP7D2emioakB9uC6HbXpX16s8vU9BVplkx
 5SPS/Eej/T7tziB/VTJQdWtj7xDQK8cU=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This makes it possible to load a EDID reported by the device
with v4l2-ctl utility:

  vdev=/dev/$(grep -l '^adv748x.*hdmi$' /sys/class/video4linux/v4l-subdev*/name |cut -d/ -f5-5)
  v4l2-ctl -d $vdev --set-edid=pad=0,file=/etc/adv7482.edid

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>

--

I would like to avoid doing that, but found no other way yet.
Suggestions very welcome.
---
 drivers/media/i2c/adv748x/adv748x-hdmi.c | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x-hdmi.c b/drivers/media/i2c/adv748x/adv748x-hdmi.c
index 664930e55baf..fea133472911 100644
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

