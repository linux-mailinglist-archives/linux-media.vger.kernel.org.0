Return-Path: <linux-media+bounces-59104-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFUkLj705Gn3cQEAu9opvQ
	(envelope-from <linux-media+bounces-59104-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 17:26:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB77424765
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 17:26:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C204830182B4
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 15:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BC9237F739;
	Sun, 19 Apr 2026 15:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zonnet.nl header.i=@zonnet.nl header.b="Y6M19lSD";
	dkim=pass (2048-bit key) header.d=zonnet.nl header.i=@zonnet.nl header.b="Y6M19lSD"
X-Original-To: linux-media@vger.kernel.org
Received: from out13-47.antispamcloud.com (out13-47.antispamcloud.com [185.201.17.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56601AAE17;
	Sun, 19 Apr 2026 15:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.201.17.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776612383; cv=none; b=ko5txMvZWvV/nRcw7PDXbI/jgAlY50feZ0bcYTdkpHpldX8Ir2jinixIs0Essf8Drm4DD3VniwK8IY3RoTjwbf6XW8KRzh8Vs6bfqa3Eo0cSTTKOPZ45zdbLhcAnPN7K6rYQmzA4xP52jZ5IPadE+8cxf5mMZF9zfrntJsW7SSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776612383; c=relaxed/simple;
	bh=34h/JTrNEaDgZHllG8HkJ/agbyMW+6OFHWvbwdQ2byc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n1uvuTQRZB7peHo3UNM3eRAajeetRyiyHkIj8dKHa6vCQu9lxI8XIoNLoq9HRK7lAAClj7vVhECwr3PpqX7r7Ob1yeSNFE8s3y9yvy2jQZ/jmAhWGtGYcNyVn5BVmceX8mzJIb+f0HZV+CQwW1j928eJJHKWe8rKfLbWXF0zxgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zonnet.nl; spf=pass smtp.mailfrom=zonnet.nl; dkim=pass (2048-bit key) header.d=zonnet.nl header.i=@zonnet.nl header.b=Y6M19lSD; dkim=pass (2048-bit key) header.d=zonnet.nl header.i=@zonnet.nl header.b=Y6M19lSD; arc=none smtp.client-ip=185.201.17.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zonnet.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zonnet.nl
Received: from mailout2.c3.isp-net.nl ([77.95.250.14])
	by mx298.antispamcloud.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rn.mast@zonnet.nl>)
	id 1wEU2l-00GnJs-Dz; Sun, 19 Apr 2026 17:26:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zonnet.nl;
	s=mailout2; t=1776612361;
	bh=VSza7nkbOredyfPaDNZL/O51PB+OdnuKEFZJIZpKjUk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y6M19lSDXhQVrncqQcnTjD37CyNGmGWgBfvgOQ3PJZ2Wm18c/B5E0rnss2gmKMc/r
	 3ZCyvBb2upDPMxuAncghaw6zNDOkBiPyHZwe9uWFU4Qrm7luHyWM2ju1j96MB01YdE
	 mqcfbnlkK9gwjzN3dPovXJctJ+TYCkzd4jalqvcLjYXUzJ8qF9Z5mguB9mbHyBE8Ib
	 3K/OBhry9lUWxEZOPNuLGg0OrThpvZBc1WsLPd2LOeh30NAC5BFtFwE+2wURwxNlHo
	 l918dbQHpNFQxeMIsZo/5i3dYx56Uwjo7OL3OGDtP+SlyW7Z3ZPL85BYElxpG77Dej
	 I6vwof4kljZ9A==
Received: from localhost (localhost [127.0.0.1])
	by mailout2.c3.isp-net.nl (Postfix) with ESMTP id 60B6E800C2;
	Sun, 19 Apr 2026 17:26:01 +0200 (CEST)
X-Virus-Scanned: Debian amavis at mailout2.c3.isp-net.nl
Received: from mailout2.c3.isp-net.nl ([127.0.0.1])
 by localhost (mailout2.c3.isp-net.nl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id SyDoYKUHXPkD; Sun, 19 Apr 2026 17:26:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zonnet.nl;
	s=mailout2; t=1776612361;
	bh=VSza7nkbOredyfPaDNZL/O51PB+OdnuKEFZJIZpKjUk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y6M19lSDXhQVrncqQcnTjD37CyNGmGWgBfvgOQ3PJZ2Wm18c/B5E0rnss2gmKMc/r
	 3ZCyvBb2upDPMxuAncghaw6zNDOkBiPyHZwe9uWFU4Qrm7luHyWM2ju1j96MB01YdE
	 mqcfbnlkK9gwjzN3dPovXJctJ+TYCkzd4jalqvcLjYXUzJ8qF9Z5mguB9mbHyBE8Ib
	 3K/OBhry9lUWxEZOPNuLGg0OrThpvZBc1WsLPd2LOeh30NAC5BFtFwE+2wURwxNlHo
	 l918dbQHpNFQxeMIsZo/5i3dYx56Uwjo7OL3OGDtP+SlyW7Z3ZPL85BYElxpG77Dej
	 I6vwof4kljZ9A==
Received: from 2001-1c04-390f-9300-d19d-7a59-d56b-16f7.dynamic.ziggo.nl (unknown [10.120.0.246])
	(Authenticated sender: rn.mast@zonnet.nl)
	by mailout2.c3.isp-net.nl (Postfix) with ESMTPSA id CB4C2800BF;
	Sun, 19 Apr 2026 17:26:00 +0200 (CEST)
From: Robert Mast <rn.mast@zonnet.nl>
To: hansg@kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	Robert Mast <rn.mast@zonnet.nl>
Subject: [PATCH v3 1/1] media: atomisp: mt9m114: graceful teardown and reprobe fixes
Date: Sun, 19 Apr 2026 17:25:14 +0200
Message-ID: <20260419152546.78513-2-rn.mast@zonnet.nl>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260419152546.78513-1-rn.mast@zonnet.nl>
References: <20260419152546.78513-1-rn.mast@zonnet.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spampanel-Domain: zonnet.nl
X-Spampanel-Username: 77.95.250.14
Authentication-Results: antispamcloud.com; auth=pass smtp.auth=77.95.250.14@zonnet.nl
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: SB/global_tokens (0.00630294386835)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuWT8fe82p5Fn47igbhn6EHZrI3GgFTuBmZx
 slC6DK8VUiu2SmbhJN1U9FKs8X3+Nt2LTcqLh1fYYSBrpo52T+cL08LSf6AHMaTqrYEKhfhw6xA+
 4w86H9/QaYH/0wQ3415Ako1Vy3Ear2FVL3NoIVpfCtmoQhY2xrBb8C+tWUvqrqBKsSdhvd/J5sX5
 daZjkYtD4nv5HHMIoTrfn8R52ZPvMK4JHKgLAcgeoG73EzSF9JLN8EqOrj2jEKT+woaXpsWWSPpc
 XGZyIXbjKlxA1QmXzO11BRKqT8B4uLrn7iz8ujemlCquzrJ0YZ1VzniO/xNwFnDSg8Na/uzow/Qd
 /TXu3FtekKBuIoGwD4N2LqZrB81WEz3zuqka4Leqo6VkfdEs9H9vRWZELOiK/O0f2DQLVURjAmVc
 O7GPdl1MHRX7SLy07hBcWj0BKGqBpIonq+x1zq/8OljXKf12zCteRMx4rUiU5DLmoujrRyxe6yL1
 HrD/Viznr+DWxbe2jqCMjcBkVs1h+FJrAu2cFW0hUrw5MKb6JdDC2k2MzLaE7kddU4NEZnR6lzOE
 xXxSTs//DW10PjWyZUEiqFvrqVA0ZWgStTXrA0o7E62mv6ZvYO5b7Txt8MmCYadzNSsexjCyaX1q
 dc5NP1XcjvXv9qqgVwF49D5FOv1ThVBZ2+6LWH6mNcZB14E0iQtvqvjtp9rD8IdOsUWxvtJg4ulz
 bGSEr96iBm3U2UtwRO06Xf+KSztJsRPwPjqT5sX/nb46NB1qFi50xyjc13GOLgZCV/LfnjQLE00o
 4HcXiVlmqq7rjtmnPPvgN0j5Zjdo7lug1QoDSvrYNiHnrwo3MxFvlFv7ce8SPnoPV4oiiR3ji56D
 ULygRDaVxo8uvMBjbuQvf6VNVyYoAi8Uc2oZx8hUUuy5epJAJTBivmuTWFpVYNhpSn7kRHMcN6qo
 XPjenLhIOF1oeRYHAZJmyuzrMk+rCpGAHBGobkxzJOnSHfNvIlnuWiVcUlH+cqC3QlHjQrji8pLP
 ZtoO0xQCazITRFgD4Ip5qw4AHVIAtPd98WimZkrm3gbOUuyA57CSb208gROQkqWbxa3bn2huOKJk
 zZ5Nvh/Ky8B7w6LLRFBRGPpfBiJg4xs3CV+SWj7p4TkWBeONYIdfQ1W+c3sFHlI/hq8KIfz67mhK
 NeKoRL8Ph88TFM79J3EABxh6TacNbiKDfJTFDlF+ixs8a5bAUuOQ2LHp8/NoGz+E647lNwN4qOsS
 Zg+fYhVZGwrjus5vpp5bDSRt87pXep9ZZFt8XvOvdtJuNQZzWfaqZxSRdm1Pmg6CYqqhSYvYlWvD
 K3PKrieG7T6bf9hS7hSBbEtJesPeFxUIWDjN30ntAXdVHuGpYXCQy7g+i7nJqiagXUKuvVDT1iqL
 ytStreM=
X-Report-Abuse-To: spam@quarantine14.antispamcloud.com
X-Complaints-To: abuse@master.antispamcloud.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[zonnet.nl,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[zonnet.nl:s=mailout2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,lists.linux.dev,linuxfoundation.org,ideasonboard.com,zonnet.nl];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59104-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[zonnet.nl:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[zonnet.nl];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rn.mast@zonnet.nl,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,zonnet.nl:email,zonnet.nl:dkim,zonnet.nl:mid];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2DB77424765
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Repeated modprobe -r/modprobe cycles of atomisp and mt9m114 could leave
stale async state behind and trigger unstable reprobe behavior on ACPI
Bay Trail systems.

The failure modes observed during stress loops included notifier lifecycle
issues during atomisp teardown, ordering races between mt9m114 async
unregister callback and remove cleanup, and unreliable probe behavior when
endpoint link-frequency data is unavailable.

Harden both drivers by:
- explicitly unregistering and cleaning atomisp async notifier state in
	normal teardown and CSI2 parse error paths
- synchronizing mt9m114 remove with async-unregister completion before
	tearing down dependent subdev state
- adding a shutdown callback to ensure stream/power state is clean at
	shutdown/reboot
- guarding LINK_FREQ control creation and validating parsed frequency menus
- using default PLL clocking when no link-frequencies are available,
	instead of taking an unsuitable bypass path

This makes unload/reload cycles stable and avoids the reprobe failures that
were seen after repeated module teardown.

Signed-off-by: Robert Mast <rn.mast@zonnet.nl>
---
 drivers/media/i2c/mt9m114.c                   | 118 ++++++++++++++++--
 .../media/atomisp/pci/atomisp_csi2_bridge.c   |   1 +
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |   3 +
 3 files changed, 110 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 16b0ace15813..27432a9c683d 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -10,6 +10,8 @@
  */
 
 #include <linux/clk.h>
+#include <linux/acpi.h>
+#include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/gpio/consumer.h>
@@ -416,6 +418,7 @@ struct mt9m114 {
 		unsigned int frame_rate;
 
 		struct v4l2_ctrl *tpg[4];
+		struct completion unregistered;
 	} ifp;
 };
 
@@ -1467,6 +1470,8 @@ static int mt9m114_pa_init(struct mt9m114 *sensor)
 
 	sd->ctrl_handler = hdl;
 
+	init_completion(&sensor->ifp.unregistered);
+
 	return 0;
 
 error:
@@ -2056,8 +2061,13 @@ static int mt9m114_ifp_set_selection(struct v4l2_subdev *sd,
 static void mt9m114_ifp_unregistered(struct v4l2_subdev *sd)
 {
 	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
+	struct device *dev = &sensor->client->dev;
+
+	dev_dbg(dev, "ifp unregistered callback (ifp.v4l2_dev=%p, pa.v4l2_dev=%p)\n",
+		sensor->ifp.sd.v4l2_dev, sensor->pa.sd.v4l2_dev);
 
 	v4l2_device_unregister_subdev(&sensor->pa.sd);
+	complete(&sensor->ifp.unregistered);
 }
 
 static int mt9m114_ifp_registered(struct v4l2_subdev *sd)
@@ -2149,12 +2159,15 @@ static int mt9m114_ifp_init(struct mt9m114 *sensor)
 			       V4L2_EXPOSURE_MANUAL, 0,
 			       V4L2_EXPOSURE_AUTO);
 
-	link_freq = v4l2_ctrl_new_int_menu(hdl, &mt9m114_ifp_ctrl_ops,
-					   V4L2_CID_LINK_FREQ,
-					   sensor->bus_cfg.nr_of_link_frequencies - 1,
-					   0, sensor->bus_cfg.link_frequencies);
-	if (link_freq)
-		link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	if (sensor->bus_cfg.nr_of_link_frequencies) {
+		link_freq = v4l2_ctrl_new_int_menu(hdl, &mt9m114_ifp_ctrl_ops,
+						   V4L2_CID_LINK_FREQ,
+						   sensor->bus_cfg.nr_of_link_frequencies - 1,
+						   0,
+						   sensor->bus_cfg.link_frequencies);
+		if (link_freq)
+			link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	}
 
 	v4l2_ctrl_new_std(hdl, &mt9m114_ifp_ctrl_ops,
 			  V4L2_CID_PIXEL_RATE,
@@ -2339,14 +2352,19 @@ static const struct dev_pm_ops mt9m114_pm_ops = {
 static int mt9m114_verify_link_frequency(struct mt9m114 *sensor,
 					 unsigned int pixrate)
 {
+	u32 i;
 	unsigned int link_freq = sensor->bus_cfg.bus_type == V4L2_MBUS_CSI2_DPHY
 			       ? pixrate * 8 : pixrate * 2;
 
-	if (sensor->bus_cfg.nr_of_link_frequencies != 1 ||
-	    sensor->bus_cfg.link_frequencies[0] != link_freq)
+	if (!sensor->bus_cfg.nr_of_link_frequencies)
 		return -EINVAL;
 
-	return 0;
+	for (i = 0; i < sensor->bus_cfg.nr_of_link_frequencies; i++) {
+		if (sensor->bus_cfg.link_frequencies[i] == link_freq)
+			return 0;
+	}
+
+	return -EINVAL;
 }
 
 /*
@@ -2383,6 +2401,29 @@ static int mt9m114_clk_init(struct mt9m114 *sensor)
 	unsigned int pixrate;
 	int ret;
 
+	if (!sensor->bus_cfg.nr_of_link_frequencies) {
+		/*
+		 * ACPI fallback path: no reliable endpoint link frequency available.
+		 * Use the default PLL target instead of EXTCLK bypass to avoid
+		 * under-clocking the sensor and getting blank/timeout streams.
+		 */
+		sensor->pll.ext_clock = clk_get_rate(sensor->clk);
+		sensor->pll.pix_clock = MT9M114_DEF_PIXCLOCK;
+
+		ret = aptina_pll_calculate(&sensor->client->dev, &limits,
+					  &sensor->pll);
+		if (ret)
+			return ret;
+
+		sensor->pixrate = sensor->pll.ext_clock * sensor->pll.m
+			/ (sensor->pll.n * sensor->pll.p1);
+		sensor->bypass_pll = false;
+
+		dev_warn(&sensor->client->dev,
+			 "no link-frequencies provided, using default PLL clocking\n");
+		return 0;
+	}
+
 	/*
 	 * Calculate the pixel rate and link frequency. The CSI-2 bus is clocked
 	 * for 16-bit per pixel, transmitted in DDR over a single lane. For
@@ -2456,10 +2497,25 @@ static int mt9m114_identify(struct mt9m114 *sensor)
 
 static int mt9m114_parse_dt(struct mt9m114 *sensor)
 {
-	struct fwnode_handle *fwnode = dev_fwnode(&sensor->client->dev);
+	struct fwnode_handle *fwnode;
 	struct fwnode_handle *ep;
 	int ret;
 
+#if IS_ENABLED(CONFIG_ACPI)
+	if (has_acpi_companion(&sensor->client->dev)) {
+		/*
+		 * On some reload sequences a stale software-node graph can be
+		 * observed for this ACPI-enumerated sensor. Use the known safe
+		 * default bus configuration and skip endpoint graph parsing.
+		 */
+		memset(&sensor->bus_cfg, 0, sizeof(sensor->bus_cfg));
+		sensor->bus_cfg.bus_type = V4L2_MBUS_CSI2_DPHY;
+		sensor->bus_cfg.bus.mipi_csi2.num_data_lanes = 1;
+		goto read_slew_rate;
+	}
+#endif
+	fwnode = dev_fwnode(&sensor->client->dev);
+
 	/*
 	 * On ACPI systems the fwnode graph can be initialized by a bridge
 	 * driver, which may not have probed yet. Wait for this.
@@ -2468,6 +2524,9 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
 	 * to the ACPI core.
 	 */
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
+	if (IS_ERR(ep))
+		return dev_err_probe(&sensor->client->dev, PTR_ERR(ep),
+				     "failed to get fwnode graph endpoint\n");
 	if (!ep)
 		return dev_err_probe(&sensor->client->dev, -EPROBE_DEFER,
 				     "waiting for fwnode graph endpoint\n");
@@ -2492,6 +2551,7 @@ static int mt9m114_parse_dt(struct mt9m114 *sensor)
 		goto error;
 	}
 
+read_slew_rate:
 	sensor->pad_slew_rate = MT9M114_PAD_SLEW_DEFAULT;
 	device_property_read_u32(&sensor->client->dev, "slew-rate",
 				 &sensor->pad_slew_rate);
@@ -2629,8 +2689,22 @@ static void mt9m114_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
 	struct device *dev = &client->dev;
-
-	v4l2_async_unregister_subdev(&sensor->ifp.sd);
+	bool ifp_async_registered = sensor->ifp.sd.async_list.next;
+	bool ifp_bound = sensor->ifp.sd.v4l2_dev;
+
+	dev_dbg(dev,
+		"remove start (ifp_bound=%u ifp_async_registered=%u ifp.v4l2_dev=%p pa.v4l2_dev=%p)\n",
+		ifp_bound, ifp_async_registered,
+		sensor->ifp.sd.v4l2_dev, sensor->pa.sd.v4l2_dev);
+
+	if (ifp_async_registered) {
+		reinit_completion(&sensor->ifp.unregistered);
+		v4l2_async_unregister_subdev(&sensor->ifp.sd);
+		if (ifp_bound)
+			wait_for_completion(&sensor->ifp.unregistered);
+	} else {
+		dev_warn(dev, "ifp async subdev already unregistered, skipping\n");
+	}
 
 	mt9m114_ifp_cleanup(sensor);
 	mt9m114_pa_cleanup(sensor);
@@ -2646,6 +2720,25 @@ static void mt9m114_remove(struct i2c_client *client)
 	pm_runtime_set_suspended(dev);
 }
 
+static void mt9m114_shutdown(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct mt9m114 *sensor;
+
+	if (!sd)
+		return;
+
+	sensor = ifp_to_mt9m114(sd);
+
+	if (sensor->streaming)
+		mt9m114_stop_streaming(sensor);
+
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		mt9m114_power_off(sensor);
+	pm_runtime_set_suspended(&client->dev);
+}
+
 static const struct of_device_id mt9m114_of_ids[] = {
 	{ .compatible = "onnn,mt9m114" },
 	{ /* sentinel */ },
@@ -2667,6 +2760,7 @@ static struct i2c_driver mt9m114_driver = {
 	},
 	.probe		= mt9m114_probe,
 	.remove		= mt9m114_remove,
+	.shutdown	= mt9m114_shutdown,
 };
 
 module_i2c_driver(mt9m114_driver);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index 2a90f86e515f..87f8ddcd6651 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -547,6 +547,7 @@ int atomisp_csi2_bridge_parse_firmware(struct atomisp_device *isp)
 
 err_parse:
 		fwnode_handle_put(ep);
+		v4l2_async_nf_cleanup(&isp->notifier);
 		return ret;
 	}
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 900a67552d6a..32a1f85ab598 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -805,6 +805,9 @@ static void atomisp_unregister_entities(struct atomisp_device *isp)
 	unsigned int i;
 	struct v4l2_subdev *sd, *next;
 
+	v4l2_async_nf_unregister(&isp->notifier);
+	v4l2_async_nf_cleanup(&isp->notifier);
+
 	atomisp_subdev_unregister_entities(&isp->asd);
 	for (i = 0; i < ATOMISP_CAMERA_NR_PORTS; i++)
 		atomisp_mipi_csi2_unregister_entities(&isp->csi2_port[i]);
-- 
2.53.0


