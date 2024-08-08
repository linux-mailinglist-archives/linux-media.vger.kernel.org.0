Return-Path: <linux-media+bounces-15976-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B0194B938
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 10:48:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9844A1C21390
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 08:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4895189B84;
	Thu,  8 Aug 2024 08:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="LLdDRSK/";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="sEZqwcAu"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB25925634;
	Thu,  8 Aug 2024 08:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723106894; cv=none; b=oZn0pvToXvaN8wKsT0DNyrFso+wVVuYkQ0Ki4o2ZwGdqvlwLEpQGlg/ZtakmSPfhUFFzZS8jlosFwx34YtXOLJsVDos8hFSFHTX14mV56bN7IBtCTcBV/pzEQ1o6l3pS5U008TD6+s40Atn4PDm7/Yu58XId7HzxyWuXKeg42Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723106894; c=relaxed/simple;
	bh=uRH/ciiHycNXip9jjHyyUFJfgnUsV443g3yhFyDelNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CG4ywN/1cxnO4GWxN+ZX+9XmJ9j6GU3WNTXLZ9lpf9yHEQquoh90SD+DFsd0aZ4Ptn9+T6lGQQuUA1Jl0j+YTVdedSgj3sbyMfXgxJDov8zacvWBX2TblU62VYFRyOgLZ0VdbfK+qL5xp63BKKwS4evR63Ocvw9Gc2pdBVZyWo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=LLdDRSK/; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=sEZqwcAu; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1723106890; bh=uRH/ciiHycNXip9jjHyyUFJfgnUsV443g3yhFyDelNY=;
	h=From:To:Cc:Subject:Date:From;
	b=LLdDRSK/UKmCKanuLW49XqVQ8szl4DmFV9uyRWJ+hM0lb0SwBpAJynIlsI7bOsb1p
	 IdSh6rqDF0VI4p400+QTNw8T7DbMzn2axD4LbPmAgc61kyr76BVFLjMj20ZyMRLUtc
	 XIoBwDJrMUMSuikmEVcj3xDl32aVtSVGtXYssnDn/0jZXBZqYJFfPq7zwTUQmrNQR5
	 a5o6KAA6irrj/rEABhkAYH2XyF8jAzSdZQdkZir7jT0Ow4xcv3M525xdmmKA1z3ADr
	 zprEEFH/JnJ05cIEcsr7HNQYhE5ndWwKvktMXVC5Ps0DcM2lBxuSTuW+m5Q4Adwyla
	 lw224SUzIK3kw==
Received: by gofer.mess.org (Postfix, from userid 501)
	id D07A4100105; Thu,  8 Aug 2024 09:48:10 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1723106888; bh=uRH/ciiHycNXip9jjHyyUFJfgnUsV443g3yhFyDelNY=;
	h=From:To:Cc:Subject:Date:From;
	b=sEZqwcAuz1JmMJHEundW0lrxice1lJTwMjbN1H6EqyQe48jUf3TBbaNEyZ/sAs2C9
	 lBQMWmlmNKGvsiUe8GloMhmaZb5Aq085WrE3LGPYVIE8q9CD2TR8lRvlFAqpnDOR8T
	 ZzSBKqjoqhUtnUhwIBb0+jGDCQzJ8BhJMOMKErY+z4FjQ0d4JL6f1NTt9Y7QuWqngr
	 AjY5e2hOi0NOPGpoHjG5oihte7HNSSjSK3JjERZy5q2tH+dzEUQXq28Bmda/yandhb
	 v7AtPFrbLEl8PAvVk33M5GBbFKOOIFACACej6qkoSmxv1edHHxZC3xNN59F8y8A3um
	 3hgimU52UkumQ==
Received: from localhost.localdomain (bigcore.local [IPv6:2a02:8011:d000:212:bc3c:1b4a:a6fa:362f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gofer.mess.org (Postfix) with ESMTPSA id 69724100074;
	Thu,  8 Aug 2024 09:48:08 +0100 (BST)
From: Sean Young <sean@mess.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sean Young <sean@mess.org>,
	Stefan Lippers-Hollmann <s.l-h@gmx.de>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "media: dvb-usb: Fix unexpected infinite loop in dvb_usb_read_remote_control()"
Date: Thu,  8 Aug 2024 09:47:57 +0100
Message-ID: <20240808084757.18084-1-sean@mess.org>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 2052138b7da52ad5ccaf74f736d00f39a1c9198c.

This breaks the TeVii s480 dual DVB-S2 S660. The device has a bulk in
endpoint but no corresponding out endpoint, so the device does not pass
the "has both receive and send bulk endpoint" test.

Seemingly this device does not use dvb_usb_generic_rw() so I have tried
removing the generic_bulk_ctrl_endpoint entry, but this resulted in
different problems.

As we have no explanation yet, revert.

$ dmesg | grep -i -e dvb -e dw21 -e usb\ 4
[    0.999122] usb 1-1: new high-speed USB device number 2 using ehci-pci
[    1.023123] usb 4-1: new high-speed USB device number 2 using ehci-pci
[    1.130247] usb 1-1: New USB device found, idVendor=9022, idProduct=d482,
+bcdDevice= 0.01
[    1.130257] usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    1.152323] usb 4-1: New USB device found, idVendor=9022, idProduct=d481,
+bcdDevice= 0.01
[    1.152329] usb 4-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    6.701033] dvb-usb: found a 'TeVii S480.2 USB' in cold state, will try to
+load a firmware
[    6.701178] dvb-usb: downloading firmware from file 'dvb-usb-s660.fw'
[    6.701179] dw2102: start downloading DW210X firmware
[    6.703715] dvb-usb: found a 'Microsoft Xbox One Digital TV Tuner' in cold
+state, will try to load a firmware
[    6.703974] dvb-usb: downloading firmware from file 'dvb-usb-dib0700-1.20.fw'
[    6.756432] usb 1-1: USB disconnect, device number 2
[    6.862119] dvb-usb: found a 'TeVii S480.2 USB' in warm state.
[    6.862194] dvb-usb: TeVii S480.2 USB error while loading driver (-22)
[    6.862209] dvb-usb: found a 'TeVii S480.1 USB' in cold state, will try to
+load a firmware
[    6.862244] dvb-usb: downloading firmware from file 'dvb-usb-s660.fw'
[    6.862245] dw2102: start downloading DW210X firmware
[    6.914811] usb 4-1: USB disconnect, device number 2
[    7.014131] dvb-usb: found a 'TeVii S480.1 USB' in warm state.
[    7.014487] dvb-usb: TeVii S480.1 USB error while loading driver (-22)
[    7.014538] usbcore: registered new interface driver dw2102

Closes: https://lore.kernel.org/stable/20240801165146.38991f60@mir/
Reported-by: Stefan Lippers-Hollmann <s.l-h@gmx.de>
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/usb/dvb-usb/dvb-usb-init.c | 35 +++---------------------
 1 file changed, 4 insertions(+), 31 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/dvb-usb-init.c b/drivers/media/usb/dvb-usb/dvb-usb-init.c
index 22d83ac18eb7..fbf58012becd 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb-init.c
+++ b/drivers/media/usb/dvb-usb/dvb-usb-init.c
@@ -23,40 +23,11 @@ static int dvb_usb_force_pid_filter_usage;
 module_param_named(force_pid_filter_usage, dvb_usb_force_pid_filter_usage, int, 0444);
 MODULE_PARM_DESC(force_pid_filter_usage, "force all dvb-usb-devices to use a PID filter, if any (default: 0).");
 
-static int dvb_usb_check_bulk_endpoint(struct dvb_usb_device *d, u8 endpoint)
-{
-	if (endpoint) {
-		int ret;
-
-		ret = usb_pipe_type_check(d->udev, usb_sndbulkpipe(d->udev, endpoint));
-		if (ret)
-			return ret;
-		ret = usb_pipe_type_check(d->udev, usb_rcvbulkpipe(d->udev, endpoint));
-		if (ret)
-			return ret;
-	}
-	return 0;
-}
-
-static void dvb_usb_clear_halt(struct dvb_usb_device *d, u8 endpoint)
-{
-	if (endpoint) {
-		usb_clear_halt(d->udev, usb_sndbulkpipe(d->udev, endpoint));
-		usb_clear_halt(d->udev, usb_rcvbulkpipe(d->udev, endpoint));
-	}
-}
-
 static int dvb_usb_adapter_init(struct dvb_usb_device *d, short *adapter_nrs)
 {
 	struct dvb_usb_adapter *adap;
 	int ret, n, o;
 
-	ret = dvb_usb_check_bulk_endpoint(d, d->props.generic_bulk_ctrl_endpoint);
-	if (ret)
-		return ret;
-	ret = dvb_usb_check_bulk_endpoint(d, d->props.generic_bulk_ctrl_endpoint_response);
-	if (ret)
-		return ret;
 	for (n = 0; n < d->props.num_adapters; n++) {
 		adap = &d->adapter[n];
 		adap->dev = d;
@@ -132,8 +103,10 @@ static int dvb_usb_adapter_init(struct dvb_usb_device *d, short *adapter_nrs)
 	 * when reloading the driver w/o replugging the device
 	 * sometimes a timeout occurs, this helps
 	 */
-	dvb_usb_clear_halt(d, d->props.generic_bulk_ctrl_endpoint);
-	dvb_usb_clear_halt(d, d->props.generic_bulk_ctrl_endpoint_response);
+	if (d->props.generic_bulk_ctrl_endpoint != 0) {
+		usb_clear_halt(d->udev, usb_sndbulkpipe(d->udev, d->props.generic_bulk_ctrl_endpoint));
+		usb_clear_halt(d->udev, usb_rcvbulkpipe(d->udev, d->props.generic_bulk_ctrl_endpoint));
+	}
 
 	return 0;
 
-- 
2.46.0


