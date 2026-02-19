Return-Path: <linux-media+bounces-53075-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBgnJO/AlmmzlwIAu9opvQ
	(envelope-from <linux-media+bounces-53075-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 08:51:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2611215CCDA
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 08:51:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E2D233010490
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 07:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80BF326D5C;
	Thu, 19 Feb 2026 07:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nf1E8H47"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B37E2D1916;
	Thu, 19 Feb 2026 07:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771487468; cv=none; b=Mq3ui6q7sFo0GruS4iN6NAUOU+KkzTHuLtMGD+XuWcpPthewDubkuz+hgQQeMu6Nl15ir1hDnlEQZiuphLa/FfoMgtd/u/HtwK3EUGWsfDIMsJT9K8vv8kuGtNztkKLbdxXT68KRKZoPoj4YMYIiP/F2w95GL4jkWSIa0Z71jb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771487468; c=relaxed/simple;
	bh=2QcEab+R+H9GWDNlwE8AaXe2qTR/KVWbyzxEXtcuKAI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LTP0TZWJ5VQ5F1EvWth4scN4djPz/6Bt+R8O9ziDtrT8FkUmKeiXMh7o1sOWJ/+AvHspfnTDR+ItiqNxWsacRcfgyjjSk2V3poK1K/OSD3P95ueyqoBu2CU0dCrzP/MCc5r1tS9PuHQl4x9AlU2ZylFQzLNvfZgy5zIZpNdNgmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nf1E8H47; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:320d:fec:f64:f37:a9c9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E115B673;
	Thu, 19 Feb 2026 08:50:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771487405;
	bh=2QcEab+R+H9GWDNlwE8AaXe2qTR/KVWbyzxEXtcuKAI=;
	h=From:Date:Subject:To:Cc:From;
	b=nf1E8H476w2+Ca38cpG+T6h27rjuXGFinK+LqoZu1EzurRSbeRiI5mr00GJnR3Z2a
	 KSqDg2uiOE8p3Dzlav093QWF9UdA+huIVbOizMnSPaJ0oGcv+3KYaIKNB+WKoO1oAE
	 u4eYzmBgJM7vgjb8KrsMsHpb9g1JkAgjVr2YOXT4=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 19 Feb 2026 13:20:50 +0530
Subject: [PATCH] media: Documentation: Fix frame interval calculation for
 raw camera sensors
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-media-fps-docs-v1-1-0387c5c5368c@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIANnAlmkC/x3MSQqAMAxA0atI1gZsBKeriIvSpJqFAw2IIL27x
 eVb/P+CSVIxmKoXktxqeh4Frq4gbP5YBZWLgRrqGnIj7sLqMV6GfAbDyI59TxRCO0CJriRRn38
 4Lzl/YEl6DmAAAAA=
X-Change-ID: 20260219-media-fps-docs-fd1da722cc38
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7513;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=2QcEab+R+H9GWDNlwE8AaXe2qTR/KVWbyzxEXtcuKAI=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBplsDbhcAja9aGvrkWs3qp6JMZ2TZPcVxMQ68Gt
 TJVA7Vx3aaJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaZbA2wAKCRBD3pH5JJpx
 Rc8nD/9TV2u0tzujyWLVVeRbh/cLg08jYDbbp9e9zwk1uuPGgPFq/CckebgfE+uFh7rLIzJmpDO
 8kci3y0eErAUAbQvFpTW6rBfeh49hRjLN6XFK9uMNO2dcU2kVumFE3tuXluqHMPb7J5kq2/GnrO
 7+iS7V43C+u+mNQ3HIJokDc9qgPW6xxNP45H4jMHmLneerBVZVGehMBOTHC6T/TAERJ3Q6MiSB1
 DeSbP5OTdtMk816kmFo9WY2F7CjKgRgEPb1irsGQhEgIFy5DgS1BFsf1pRvCY15ToWflPqm+VWl
 zVg2N0CxyQt4SoTAWpxjXp/asDpEDlU0/K3zKqMQ1cGuBf8DbdYSjEXe0TF16m2h4E2aiZZ2lFl
 IhHgXe5Wgt0V4O/DiUXlUfI/lZyu+4bLwcg45PA6g6kHKfEpnHZSXAzwfXLq3F5UAUQkpN+9T8P
 VoalyqDWnCnglkRNrh2DASlxS3iwDuEP3eNFwO/t31BmtQvkDrZYPgWp22CpTXXa1+gy1isvzgu
 1QYciCtP+WW2WZUvN0MOLmyfnMibZXZh3XaCNA1avkJssKljznZRmD3eoF0Y99E0l96lR+vSgpN
 cAWGTMLeJfexPD7qH+4nyDkLOHM5FKv5TR2yjwuqptFQolqGrjAbZiIweaTK4zPu0Zm1ds9t0vE
 AV3VU1bImXpyFMA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53075-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2611215CCDA
X-Rspamd-Action: no action

The previous frame interval formula used analogue crop dimensions. This
breaks down for some sensors when binning.

For example in imx219 the minimum FLL (frame length in lines) can be
lower than the analogue crop height when binning, which would require a
negative VBLANK to represent the actual timing. Similarly, imx283 allows
a lower minimum HMAX (line length) when doing 2x2 or 3x3 binning than
the analogue crop width of the full resolution mode.

The CCS specification also describes under section "8.2.6 Line Length
and Frame Length" how the horizontal and vertical readout minimums can
be different when binning.

Replace the formula with the underlying hardware concepts of LLP (line
length in pixels) and FLL (frame length in lines). These terms were
chosen to match the CCS specification on raw sensors, as it is a cleaner
reference compared to a typical sensor vendor datasheet.

Finally, define the blanking controls relative to the active pixel
readout (post-binning) rather than the analogue crop size. This matches
what most sensor drivers already do, and also what applications like
libcamera expect. In "Figure 42" of CCS specification too, we see a
similar definition:

  frame interval = (output width + HBLANK) *
                   (output height + VBLANK) / pixel rate

Also add a note in the "Writing camera sensor drivers" guide, to ensure
this formula is followed by new sensor drivers.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 Documentation/driver-api/media/camera-sensor.rst   | 11 ++++
 .../userspace-api/media/drivers/camera-sensor.rst  | 59 +++++++++++++++-------
 2 files changed, 53 insertions(+), 17 deletions(-)

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index 94bd1dae82d5c570b2d11c7faee20dd45d2f4be6..8dcac7551f54ac4ffa71173281ae3bbea331c036 100644
--- a/Documentation/driver-api/media/camera-sensor.rst
+++ b/Documentation/driver-api/media/camera-sensor.rst
@@ -120,6 +120,17 @@ The function returns a non-zero value if it succeeded getting the power count or
 runtime PM was disabled, in either of which cases the driver may proceed to
 access the device.
 
+Frame interval
+--------------
+
+If a sensor supports cropping or binning, it is the sensor driver's
+responsibility to ensure that the frame interval formula (see
+:ref:`media_using_camera_sensor_drivers`) remains valid regardless of the
+pipeline configuration. The driver shall adjust the minimum and maximum allowed
+values of ``V4L2_CID_HBLANK`` and ``V4L2_CID_VBLANK`` as needed when the mode
+changes, so that application developers can always rely on the same formula to
+calculate the frame interval.
+
 Rotation, orientation and flipping
 ----------------------------------
 
diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index 75fd9166383fdbb2dabdb6384ed0904c4e78a3c6..30dddea72a12da264fc9c30e37b561c762c09d29 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -49,35 +49,60 @@ depends on the type of the device.
 Raw camera sensors
 ~~~~~~~~~~~~~~~~~~
 
-Instead of a high level parameter such as frame interval, the frame interval is
-a result of the configuration of a number of camera sensor implementation
-specific parameters. Luckily, these parameters tend to be the same for more or
-less all modern raw camera sensors.
+Instead of a high level parameter such as frame interval, the frame interval on
+a raw camera sensor is determined by a number of sensor-specific parameters.
+These parameters tend to be common across most modern raw camera sensors.
 
-The frame interval is calculated using the following equation::
+The pixel array is the full grid of photosensitive elements on the sensor. A
+subregion of it is selected by the analogue crop. The cropped image may then be
+subject to binning (averaging of a NxN block) or subsampling which
+further reduce the image dimensions. The resulting image is then read out by
+the ADC (analogue-to-digital converter) line by line. After ADC readout,
+optional digital crop or scaling may further reduce the image dimensions, see
+:ref:`VIDIOC_SUBDEV_G_SELECTION <VIDIOC_SUBDEV_G_SELECTION>`.
 
-	frame interval = (analogue crop width + horizontal blanking) *
-			 (analogue crop height + vertical blanking) / pixel rate
+The frame size is determined by two timing parameters: line length in pixels
+(LLP) and frame length in lines (FLL). These are fundamental sensor timing
+registers that control how fast the ADC reads out the image. They may go
+by different names for a particular sensor, like HMAX and VMAX, or HTOTAL and
+VTOTAL, or similar.
 
-The formula is bus independent and is applicable for raw timing parameters on
-large variety of devices beyond camera sensors. Devices that have no analogue
-crop, use the full source image size, i.e. pixel array size.
+LLP is the total number of pixel clock cycles per line, including both the
+active readout width and horizontal blanking. FLL is the total number of lines
+per frame, including both the active readout height and vertical blanking.
+
+The frame interval is::
+
+        frame interval = LLP * FLL / pixel rate
 
 Horizontal and vertical blanking are specified by ``V4L2_CID_HBLANK`` and
 ``V4L2_CID_VBLANK``, respectively. The unit of the ``V4L2_CID_HBLANK`` control
 is pixels and the unit of the ``V4L2_CID_VBLANK`` is lines. The pixel rate in
-the sensor's **pixel array** is specified by ``V4L2_CID_PIXEL_RATE`` in the same
-sub-device. The unit of that control is pixels per second.
+the sensor's **pixel array** is specified by ``V4L2_CID_PIXEL_RATE`` in the
+same sub-device. The unit of that control is pixels per second.
+
+The blanking is defined relative to the size of the image being sent out to the
+host over the bus (like CSI-2)::
+
+        LLP = active width + V4L2_CID_HBLANK
+        FLL = active height + V4L2_CID_VBLANK
+
+The driver shall set the minimum and maximum values of ``V4L2_CID_HBLANK`` and
+``V4L2_CID_VBLANK`` such that the resulting LLP and FLL values correspond to the
+range permitted by the sensor hardware for the current mode. Sensors that
+support binning often define a lower minimum for LLP or FLL registers, which
+can help achieve higher framerates when binning.
+
+Application developers can calculate the frame interval using the output
+dimensions and the blanking controls::
+
+        frame interval = (output width + horizontal blanking) *
+                         (output height + vertical blanking) / pixel rate
 
 Register list-based drivers need to implement read-only sub-device nodes for the
 purpose. Devices that are not register list based need these to configure the
 device's internal processing pipeline.
 
-The first entity in the linear pipeline is the pixel array. The pixel array may
-be followed by other entities that are there to allow configuring binning,
-skipping, scaling or digital crop, see :ref:`VIDIOC_SUBDEV_G_SELECTION
-<VIDIOC_SUBDEV_G_SELECTION>`.
-
 USB cameras etc. devices
 ~~~~~~~~~~~~~~~~~~~~~~~~
 

---
base-commit: 956b9cbd7f156c8672dac94a00de3c6a0939c692
change-id: 20260219-media-fps-docs-fd1da722cc38

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


