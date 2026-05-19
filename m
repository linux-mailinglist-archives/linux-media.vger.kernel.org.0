Return-Path: <linux-media+bounces-62120-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LZmB6o/DGqqawUAu9opvQ
	(envelope-from <linux-media+bounces-62120-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 12:47:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FAC57CBF1
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 12:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 419EB3126440
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 10:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633E2352028;
	Tue, 19 May 2026 10:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NkAGI4eI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFB54D9902;
	Tue, 19 May 2026 10:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779186299; cv=none; b=Yw5ewcSQb/KqHnypk6PjxetTpjW38TGkWhIyo2fLqa6/tEHh0iEAMrttQinWBAZYZBuw5lr2tfjTeGWCstCPWRRsZRS2ZZYdHApvp0AC3WXmZWOcWyQf0mOU/8d59HlbqvYJoe+ws2bfJrC9FxW/QWIB4Rk5eg3kbrHBteaiWd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779186299; c=relaxed/simple;
	bh=sKJYf3HQdsLdF6J/FcNTKXsWoqBJyWsFUyib5GQ4Hww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FXVCt+xIflV+gutt37wX8P0AAAR5w6hUoSoygNv+3i2fQwSzbS6cVYW0Z8LwWxzpX8u06EyY5H9P4NXtljWIZ3xuWBtMKipaWO7vESOKgbS5XUARYaktjO6QqK6HiXyVsVrg9srjfiI1uKTQaynBwk9b9Cwjx8DaMhRfLQDOwcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NkAGI4eI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:ad48:920a:da6f:a034])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC665296;
	Tue, 19 May 2026 12:24:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779186282;
	bh=sKJYf3HQdsLdF6J/FcNTKXsWoqBJyWsFUyib5GQ4Hww=;
	h=From:Date:Subject:To:Cc:From;
	b=NkAGI4eItoJQESlZau7r+yp846apBSRSS81To5imLhU8mihOGqeDIo0i4aiTlbcqZ
	 gS6lK48wcptIpNqmX4oFe+6zIIW9BEOhwJf3BMu94UdN6C11o03gSv6aN1rMWwBAnO
	 +k+Nt0+0Z1SmUuulem541A7yxsK4bKofKdbfe53g=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 19 May 2026 12:24:39 +0200
Subject: [PATCH v3] media: Documentation: Fix frame interval calculation
 for raw camera sensors
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-media-fps-docs-v3-1-bb5658ddd075@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XMQQ6CMBCF4auQrq2hUwroynsYF2VmkC6gpDWNh
 nB3CysTdfm/5H2LiBwcR3EuFhE4uej8lEMfCoGDne4sHeUWUEJdgjrJkclZ2c9Rkscoe1JkGwB
 E3Yp8mgP37rmD11vuwcWHD6/dT2pb/1JJSSVL3TZo0Oi6xYsjttFPnbeBjuhHsYkJPhQwXwpkx
 WAHAFQpruiHsq7rG0/SgzX5AAAA
X-Change-ID: 20260219-media-fps-docs-fd1da722cc38
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9362;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=sKJYf3HQdsLdF6J/FcNTKXsWoqBJyWsFUyib5GQ4Hww=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqDDpyvv5tTnEMeCsd+llK5krgVO5EbgG+H3Xq7
 7r7Ks3VnN2JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCagw6cgAKCRBD3pH5JJpx
 RSWcD/9uI8vbyF+hbKKf0RiWDXsrx8/M3Z7Iin7cxY12RhwQdlxroGrApAGUnbdsKN7DqpDDmIz
 wzDx9GZ7Nal1nrYIF5wOLRRzzhirxmKPm1j4V+TeQnGuYQCIjy2TfobUK4hHpF7XHsAnS8RR7Ex
 9m5WM4wEOzqikNONyqKD/4MapqHjVpjSG0+AxCMWFXi83wtoLAVK/+f80Y1szrk6B8owv/ZJsLy
 Xtwac6wMjxlDa+VSr1CcDQmbnMSuypggGLDwFe+1js6RtY+978miHlWaNnQQ4iA4CUoLm/wN8UU
 P4MYUmwKMSPn5EiHZ3SottPwiKGmS4e7EtiZS5ZwAQ3J4Z3GcX33YHetXCTbboqa7CSKhDIQivU
 Yk+3jHn/yzBUcDhxYo9ALz+l7X0idDlUrYQLXL9Q1U8532MOA2K4Dv9MdVZICwN4l4iFf01GZ2a
 wnkSNEI/rFbfvEhF5Wo0U1qDSfwijRsuDRaCQUc1QKWydoyKPScSKzjN1QZ2QXCdQrEiBikl9de
 rqbPuqJTfJhw/w7F8kIXAsOAnPP51+2Jh0R5xJ99SFh7j2kcqtyge229WsABBl6nzSrEhELsd5C
 Y29FjOyGQolhP1XOL01J1aWd4ihUmMJWXkf52eOI0f5aZuQSvSoySOHvg1r10lL9omSTJPC1OWR
 iNDwz5O3ewvOzZw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62120-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 95FAC57CBF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The previous frame interval formula used analogue crop dimensions. This
diverges from what most (non-CCS) raw camera sensor drivers do and what
most applications expect.

The CCS specification describes under section "8.2.6 Line Length and
Frame Length" how the horizontal and vertical readout minimums can be
different when binning.

We see the same thing in non-CCS sensor drivers, for example in imx219
the minimum FLL (frame length in lines) can be lower than the analogue
crop height when doing 2x2 or 4x4 binning. Similarly in imx283 HMAX
(line length) can be lower compared to the analogue crop width when
doing 2x2 or 3x3 binning.

While the CCS driver defines the HBLANK/VBLANK controls with respect to
the analogue crop rectangle, with possibly negative values for blanking,
most other raw sensor drivers instead define them with respect to the
output dimensions (width and height of the source pad format) sent on
the bus.

So fix the frame interval calculation described in the documentation to
match the reality of existing drivers, separating out the CCS and
non-CCS cases. In future, with the common raw sensor model, this may
need further updates.

While at it, also clarify the order of operations in the sensor pipeline
and give the "hardware" definition for frame interval using the pixel
readout rate, LLP (line length in pixels) and FLL (frame length in
lines). Also link to the definitions of PIXEL_RATE, HBLANK and VBLANK
controls.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v3:
- Include suggestions from Jacopo (linking to VBLANK/HBLANK/PIXEL_RATE
  controls, rewording a couple of lines)
- Include suggestions from Dave (clarifying LLP/HMAX can be in scaled
  units compared to the pixel rate)
- Reword the whole section again so it makes sense (thus not taking the
  Review tag from Jacopo on v2)
- Link to v2: https://lore.kernel.org/r/20260225-media-fps-docs-v2-1-5cb222d41e4d@ideasonboard.com

Changes in v2:
- Use reStructureText note box for describing the
  HBLANK/VBLANK/PIXEL_RATE controls
- Document the blanking formula for both CCS and non-CCS raw
  sensor drivers
- Drop driver-api documentation as common raw sensor model is coming
  soon
- Link to v1: https://lore.kernel.org/r/20260219-media-fps-docs-v1-1-0387c5c5368c@ideasonboard.com
---
 .../userspace-api/media/drivers/camera-sensor.rst  | 99 ++++++++++++++++------
 .../media/v4l/ext-ctrls-image-source.rst           |  4 +
 2 files changed, 75 insertions(+), 28 deletions(-)

diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
index 75fd9166383f..07a679525f0c 100644
--- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
+++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
@@ -49,34 +49,77 @@ depends on the type of the device.
 Raw camera sensors
 ~~~~~~~~~~~~~~~~~~
 
-Instead of a high level parameter such as frame interval, the frame interval is
-a result of the configuration of a number of camera sensor implementation
-specific parameters. Luckily, these parameters tend to be the same for more or
-less all modern raw camera sensors.
-
-The frame interval is calculated using the following equation::
-
-	frame interval = (analogue crop width + horizontal blanking) *
-			 (analogue crop height + vertical blanking) / pixel rate
-
-The formula is bus independent and is applicable for raw timing parameters on
-large variety of devices beyond camera sensors. Devices that have no analogue
-crop, use the full source image size, i.e. pixel array size.
-
-Horizontal and vertical blanking are specified by ``V4L2_CID_HBLANK`` and
-``V4L2_CID_VBLANK``, respectively. The unit of the ``V4L2_CID_HBLANK`` control
-is pixels and the unit of the ``V4L2_CID_VBLANK`` is lines. The pixel rate in
-the sensor's **pixel array** is specified by ``V4L2_CID_PIXEL_RATE`` in the same
-sub-device. The unit of that control is pixels per second.
-
-Register list-based drivers need to implement read-only sub-device nodes for the
-purpose. Devices that are not register list based need these to configure the
-device's internal processing pipeline.
-
-The first entity in the linear pipeline is the pixel array. The pixel array may
-be followed by other entities that are there to allow configuring binning,
-skipping, scaling or digital crop, see :ref:`VIDIOC_SUBDEV_G_SELECTION
-<VIDIOC_SUBDEV_G_SELECTION>`.
+Instead of a high level parameter such as frame interval, the frame interval on
+a raw camera sensor is determined by a number of sensor-specific parameters.
+These parameters tend to be common across most modern raw camera sensors.
+
+The pixel array is the full grid of photosensitive elements on the camera
+sensor. A subregion of it is selected by the analogue crop. The cropped image
+may then be subject to binning (averaging of an NxN block) and subsampling
+which further reduce the image dimensions. The resulting image is then read out
+by the ADC (analogue-to-digital converter) line by line. After ADC readout,
+optional digital crop or scaling may further reduce the image dimensions, see
+:ref:`VIDIOC_SUBDEV_G_SELECTION <VIDIOC_SUBDEV_G_SELECTION>`.
+
+The sensor scales the input clock to a (usually) fixed pixel readout rate. Thus
+the frame interval is determined by two fundamental timing registers: **line
+length in pixels (LLP)** and **frame length in lines (FLL)**.
+
+LLP is the total number of pixels per line, including both the active readout
+width and horizontal blanking. FLL is the total number of lines per frame,
+including both the active readout height and vertical blanking. These two
+parameters allow controlling the total time taken to read out an image by
+adjusting the blanking intervals.
+
+These registers may go by other names for different sensors, like HMAX and
+VMAX, or HTOTAL and VTOTAL, or similar. They are exposed to userspace
+applications through the horizontal and vertical blanking controls.
+
+For some sensors the value for the horizontal timing (LLP/HMAX/HTOTAL) may be
+in cycles of an internal clock, where multiple pixels are read out per cycle.
+In such cases the driver should handle this scaling internally, ensuring the
+userspace control for the horizontal blanking is always in units of pixels.
+
+So the frame interval can be calculated as::
+
+        frame interval = (LLP * FLL) / pixel rate
+
+See the note below on how applications can map this to the blanking and pixel
+rate controls:
+
+.. note::
+
+	Horizontal and vertical blanking are specified by :ref:`V4L2_CID_HBLANK
+	<v4l2-cid-hblank>` and :ref:`V4L2_CID_VBLANK <v4l2-cid-vblank>`,
+	respectively. The unit of ``HBLANK`` is pixels, and the unit of
+	``VBLANK`` is lines.
+
+	The pixel rate in the sensor's pixel array is specified by
+	:ref:`V4L2_CID_PIXEL_RATE <v4l2-cid-pixel-rate>`, in units of pixels
+	per second.
+
+	Sensor drivers are required to implement sub-device nodes that expose
+	these controls. They can be read-only or configurable depending on the
+	device.
+
+	For most raw sensors the blanking is defined relative to the size of
+	the image being sent out to the host over the bus (source pad format)::
+
+                LLP = output width + horizontal blanking
+                FLL = output height + vertical blanking
+
+        For CCS-compliant raw sensors (that use the CCS driver), the blanking
+        controls are defined relative to the analogue crop rectangle::
+
+                LLP = analogue crop width + horizontal blanking
+                FLL = analogue crop height + vertical blanking
+
+Some sensors may lower the minimum allowed values for LLP and/or FLL when
+binning or subsampling, thus increasing the effective frame rate.
+
+The driver shall update the minimum and maximum values of the blanking controls
+so that the resulting LLP and FLL registers are programmed within the range
+permitted by the sensor hardware for the current mode.
 
 USB cameras etc. devices
 ~~~~~~~~~~~~~~~~~~~~~~~~
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index f9c0b7ad3b4e..1a61acb0bb1a 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -21,6 +21,8 @@ Image Source Control IDs
 ``V4L2_CID_IMAGE_SOURCE_CLASS (class)``
     The IMAGE_SOURCE class descriptor.
 
+.. _v4l2-cid-vblank:
+
 ``V4L2_CID_VBLANK (integer)``
     Vertical blanking. The idle period after every frame during which no
     image data is produced. The unit of vertical blanking is a line.
@@ -28,6 +30,8 @@ Image Source Control IDs
     the pixel rate defined by ``V4L2_CID_PIXEL_RATE`` control in the
     same sub-device.
 
+.. _v4l2-cid-hblank:
+
 ``V4L2_CID_HBLANK (integer)``
     Horizontal blanking. The idle period after every line of image data
     during which no image data is produced. The unit of horizontal

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260219-media-fps-docs-fd1da722cc38

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


