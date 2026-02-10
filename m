Return-Path: <linux-media+bounces-52495-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLqRFS3rimlEOwAAu9opvQ
	(envelope-from <linux-media+bounces-52495-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 09:24:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5278A1183A5
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 09:24:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBF11304C96D
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 08:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D44233D4E2;
	Tue, 10 Feb 2026 08:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XJZTn7XP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8C933D4FD
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 08:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770711777; cv=none; b=GwdbJXHUXavhnEbaGbkp2kywwiR/ayIjZntV7J8Llb/vIdmCvlb5yiZWE6pFdGbyAwSXrGQ5VUZEWKZ6uNiE8wqW7KP4fTQ/smZlvQNozeuNStIIS0b10lgnDa0OW/1nW+u4E2za+pa403kuO0tUADNYuvB1liCHj1S83CVHfEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770711777; c=relaxed/simple;
	bh=XIrC/8lLWBkP5KY4f2+9rXHyZyzLZas39Pb/4Jjrcvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pCD9aELlofNIgVG1z0lTBKnsKxn6ok18LSLquiVz8ZcbN1SJ2ndyfaEvu1kdf+PMdCCtdOsg0TKlELIfQih8TMUUvs560d1xOhrGr3hIqqAgT1/dRWCJzUOONT+oAMp6tvWHMdAqJe7V8UEQAjF+OH4anVz8PZBe3mtJ/AR1KUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XJZTn7XP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:2edd:807a:f3c0:8d1b:28a])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A0FF713BE;
	Tue, 10 Feb 2026 09:22:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770711724;
	bh=XIrC/8lLWBkP5KY4f2+9rXHyZyzLZas39Pb/4Jjrcvs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XJZTn7XPokzv8DOP2f/doCvX56u6EF7RGLEFoRpv5DzJJZAliHtcZ/m120z0cyMBC
	 pnuktwhbP1cEhbBkBIGzc6bs5DgseZzLnAx8HS9OMGzLMgZoqm/niazqxcpzRUdlZx
	 EWGhxtcbEQExwRY7ULreeGFUnOR5GVSzL6Egup+Y=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 10 Feb 2026 13:51:24 +0530
Subject: [PATCH v2 7/8] media: platform: broadcom: Add bcm2835-isp driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260210-b4-vchiq-isp-v2-7-4403944152fe@ideasonboard.com>
References: <20260210-b4-vchiq-isp-v2-0-4403944152fe@ideasonboard.com>
In-Reply-To: <20260210-b4-vchiq-isp-v2-0-4403944152fe@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=118589;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=laQfSzpCXa5RQzAaPUyFRm1wLTjq86JKMWz6Vucr7A8=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpiuqsHs0n/EPwqbKdOBEk+oOYj52ct1XMoQQ6z
 hix8T0tH8KJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaYrqrAAKCRBD3pH5JJpx
 RZqSD/4gMFHoc12kV47C4msZU+1TpTL7V6viYVwR9ctWvy0ln0Xwe9pNrgAoHy6eNAJdV6fCzdl
 SsXSRqQwzkenkPgPMcChAHu91AsBGLq4KDDKh+phqZOzi39ESqmjyg9x3wXnAz2by/GoeLw0DPW
 /Zcd00WFAV6hxBsHte0Xv73XnPQbmxmRcWqYvsqGtG6B9K0aUVQpta2BE7lW64MLmn91/aNIl0q
 wBh6C4f5ytGUf/54Eg6LxF6JEhM8zA5EBelxKeoc7awYq0EkY2VHstb8tLQVTRHx1qJB1pmu4pa
 SSSwU7sHgbgmBzZiVd+xJ8FOftJMkYgxvlbz8tTdkvF6cWlvhp46bXteZbvWLLqEcmCUqgKWieX
 11+DECaAFX+mdm3awVVYYdFqW/cvueEhaW6d5vT6rgnRP6FVD7QgU1rm7M+U37Zp85zzBHUrYEt
 dZk4KYQKJlNKLSZ4YNV4e/BAEO3sm/NCbov2+j07sIti6Pb5HPUB5SHlv83+PhtEliZBgE3znbI
 eF+oCIAc/mKFRzaLDP1Kr9uSDtokd1VeaN32hzow12EEw0sQacT7TtivplcZoqpQbmdl3UM0FyF
 kzrGFUYmKJOMNugOQhi3DyFMxAm9B5t38rbEm0KTzaokNktyinq4KxHKh/MQunuO3Fy/oo+Q4E2
 Jp+qyI6WMrKEMcQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52495-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,raspberrypi.com,gmx.net,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email,hauke-m.de:email,raspberrypi.com:email,block.data:url,bcm2835-isp.dot:url]
X-Rspamd-Queue-Id: 5278A1183A5
X-Rspamd-Action: no action

From: Naushir Patuck <naush@raspberrypi.com>

The BCM2835 ISP is a fixed-function hardware block that performs image
processing on Bayer, RGB, and YUV frames. It produces two processed
video outputs at different resolutions and can generate statistics for
Bayer inputs. The hardware is not accessible directly, so this driver
programs it through the VCHIQ MMAL interface.

As the topology cannot be represented as a simple V4L2 M2M device, we
register a media device with 5 video nodes: one output (sink), two
capture (processed frames), one metadata capture (statistics), and one
metadata output (config parameters). The VCHIQ firmware supports two
concurrent users, so instantiate two identical media graphs.

ISP configuration uses the V4L2 extensible parameters framework through
the dedicated params node, allowing userspace to batch multiple
parameter blocks (black level, gamma, CCM, lens shading, etc.) in a
single buffer that is applied on the next frame boundary.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Co-developed-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v2:
- Replace custom V4L2 controls (V4L2_CID_USER_BCM2835_ISP_*) with the
  V4L2 extensible parameters framework via a dedicated metadata output
  node (bcm2835-isp-params). Split params handling into new file
  bcm2835-isp-params.c.
- Add AWB gains and digital gain as extensible parameter block types
  instead of standard V4L2 integer controls.
- Use MEDIA_ENT_F_PROC_VIDEO_ISP instead of MEDIA_ENT_F_PROC_VIDEO_SCALER
  for the media entity function.
- Rework media controller registration: let video device nodes handle
  their own entity registration, removing the manual entity/interface
  creation in media_controller_register_node().
- Propagate colorspace, ycbcr_enc, xfer_func, and quantization properly
  through g_fmt/s_fmt.
- Fold the stats/params FourCC additions (previously a separate commit)
  into this patch.
- Drop the custom CID base commit (no longer needed).
- Update documentation.
---
 Documentation/admin-guide/media/bcm2835-isp.dot    |   14 +
 Documentation/admin-guide/media/bcm2835-isp.rst    |   78 +
 Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
 .../userspace-api/media/v4l/meta-formats.rst       |    1 +
 .../media/v4l/metafmt-bcm2835-isp.rst              |  101 ++
 MAINTAINERS                                        |    9 +
 drivers/media/platform/broadcom/Kconfig            |    1 +
 drivers/media/platform/broadcom/Makefile           |    1 +
 .../media/platform/broadcom/bcm2835-isp/Kconfig    |   15 +
 .../media/platform/broadcom/bcm2835-isp/Makefile   |    4 +
 .../broadcom/bcm2835-isp/bcm2835-isp-common.h      |   56 +
 .../broadcom/bcm2835-isp/bcm2835-isp-fmts.h        |  558 ++++++++
 .../broadcom/bcm2835-isp/bcm2835-isp-params.c      |  500 +++++++
 .../broadcom/bcm2835-isp/bcm2835-v4l2-isp.c        | 1512 ++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
 include/uapi/linux/bcm2835-isp.h                   |  530 +++++++
 include/uapi/linux/videodev2.h                     |    2 +
 17 files changed, 3385 insertions(+)

diff --git a/Documentation/admin-guide/media/bcm2835-isp.dot b/Documentation/admin-guide/media/bcm2835-isp.dot
new file mode 100644
index 0000000000000000000000000000000000000000..cda3defe2d9934994f177ba29dd1df4fbb3e8f42
--- /dev/null
+++ b/Documentation/admin-guide/media/bcm2835-isp.dot
@@ -0,0 +1,14 @@
+digraph board {
+	rankdir=TB
+	n00000001 [label="bcm2835-isp-output0\n/dev/video13", shape=box, style=filled, fillcolor=yellow]
+	n00000001 -> n00000015 [style=bold]
+	n00000005 [label="bcm2835-isp-capture0\n/dev/video14", shape=box, style=filled, fillcolor=yellow]
+	n00000009 [label="bcm2835-isp-capture1\n/dev/video15", shape=box, style=filled, fillcolor=yellow]
+	n0000000d [label="bcm2835-isp-stats2\n/dev/video16", shape=box, style=filled, fillcolor=yellow]
+	n00000011 [label="bcm2835-isp-params\n/dev/video17", shape=box, style=filled, fillcolor=yellow]
+	n00000011 -> n00000015 [style=bold]
+	n00000015 [label="bcm2835-isp\n", shape=box, style=filled, fillcolor=yellow]
+	n00000015 -> n00000005 [style=bold]
+	n00000015 -> n00000009 [style=bold]
+	n00000015 -> n0000000d [style=bold]
+}
diff --git a/Documentation/admin-guide/media/bcm2835-isp.rst b/Documentation/admin-guide/media/bcm2835-isp.rst
new file mode 100644
index 0000000000000000000000000000000000000000..6384cc7b3eb0cb952ad79c7506349686ca031b0d
--- /dev/null
+++ b/Documentation/admin-guide/media/bcm2835-isp.rst
@@ -0,0 +1,78 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=============================================
+Broadcom BCM2835 Image Signal Processor (ISP)
+=============================================
+
+The BCM2835 ISP
+===============
+
+The BCM2835 Image Signal Processor (ISP) is a fixed function hardware pipeline
+that performs image processing on frames stored in memory. Frames can be Bayer,
+RGB, or YUV and are submitted to the ISP through a V4L2 output node. The ISP
+produces two processed image outputs at different resolutions and can generate
+statistics for Bayer inputs.
+
+The bcm2835-isp driver
+======================
+
+The bcm2835-isp driver lives under
+`drivers/media/platform/broadcom/bcm2835-isp` and registers a set of V4L2 video
+nodes connected through a media graph. The pipeline is configured through the
+V4L2 extensible parameters framework using a dedicated params node.
+
+The media topology registered by the driver is represented below:
+
+.. _bcm2835-isp-topology:
+
+.. kernel-figure:: bcm2835-isp.dot
+    :alt:   Diagram of the default media pipeline topology
+    :align: center
+
+The media graph registers the following video device nodes:
+
+- bcm2835-isp-output0: output device that queues frames to the ISP input.
+- bcm2835-isp-capture0: capture device for the main processed output.
+- bcm2835-isp-capture1: capture device for the secondary processed output.
+- bcm2835-isp-stats2: metadata capture device for ISP statistics.
+- bcm2835-isp-params: metadata output device for ISP configuration parameters.
+
+bcm2835-isp-output0
+-------------------
+
+Frames to be processed by the ISP are queued to `bcm2835-isp-output0`. Supported
+input formats include Bayer, RGB, and YUV.
+
+bcm2835-isp-capture0, bcm2835-isp-capture1
+------------------------------------------
+
+The two capture devices return processed images in YUV or RGB formats. The
+secondary output is typically used for a lower-resolution stream.
+
+bcm2835-isp-stats2
+------------------
+
+The `bcm2835-isp-stats2` node provides per-frame statistics for Bayer inputs as
+metadata buffers. The metadata format is described at
+:ref:`v4l2-meta-fmt-bcm2835-isp-stats`.
+
+bcm2835-isp-params
+------------------
+
+The `bcm2835-isp-params` node accepts configuration buffers that define the ISP
+processing parameters to apply on the next frame boundary. The metadata format
+is described at :ref:`v4l2-meta-fmt-bcm2835-isp-params`.
+
+ISP configuration
+=================
+
+The ISP configuration is described solely by the contents of the parameters
+buffer queued to `bcm2835-isp-params`. Each buffer uses the V4L2 extensible
+parameters format described in :ref:`v4l2-isp`, with block types defined in
+``include/uapi/linux/bcm2835-isp.h``.
+
+Userspace must populate a :c:type:`v4l2_isp_params_buffer` and append one or
+more block structs, each of which embeds a
+:c:type:`v4l2_isp_params_block_header` as its first member. The driver applies
+those parameters on a frame boundary once the buffer is queued. Parameter
+structure is defined at :ref:`v4l2-meta-fmt-bcm2835-isp-params`.
diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
index 393f83e8dc4dd86fc73d8a4f23c535bdc886c308..a9ba2ea15321a68c44c5d83e7492559b4057a881 100644
--- a/Documentation/admin-guide/media/v4l-drivers.rst
+++ b/Documentation/admin-guide/media/v4l-drivers.rst
@@ -9,6 +9,7 @@ Video4Linux (V4L) driver-specific documentation
 .. toctree::
 	:maxdepth: 2
 
+	bcm2835-isp
 	bttv
 	c3-isp
 	cafe_ccic
diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index 3e0cab153f0ac5e6d76696c5b78eebb0db43b354..d8104a212e9c69772e843f8296eb8b3b2c5142e2 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -14,6 +14,7 @@ These formats are used for the :ref:`metadata` interface only.
     :maxdepth: 1
 
     metafmt-arm-mali-c55
+    metafmt-bcm2835-isp
     metafmt-c3-isp
     metafmt-d4xx
     metafmt-generic
diff --git a/Documentation/userspace-api/media/v4l/metafmt-bcm2835-isp.rst b/Documentation/userspace-api/media/v4l/metafmt-bcm2835-isp.rst
new file mode 100644
index 0000000000000000000000000000000000000000..6ed1d1e7890f7311fc0c371285671034894bdd29
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/metafmt-bcm2835-isp.rst
@@ -0,0 +1,101 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. c:namespace:: V4L
+
+***********************************************************************************
+V4L2_META_FMT_BCM2835_ISP_STATS ('BSTA'), V4L2_META_FMT_BCM2835_ISP_PARAMS ('BCMP')
+***********************************************************************************
+
+.. _v4l2-meta-fmt-bcm2835-isp-stats:
+
+BCM2835 ISP Statistics
+======================
+
+The BCM2835 ISP hardware calculate image statistics for an input Bayer frame.
+These statistics are obtained from the "bcm2835-isp0-capture3" device node
+using the :c:type:`v4l2_meta_format` interface. They are formatted as described
+by the :c:type:`bcm2835_isp_stats` structure below.
+
+.. code-block:: c
+
+	#define DEFAULT_AWB_REGIONS_X 16
+	#define DEFAULT_AWB_REGIONS_Y 12
+
+	#define NUM_HISTOGRAMS 2
+	#define NUM_HISTOGRAM_BINS 128
+	#define AWB_REGIONS (DEFAULT_AWB_REGIONS_X * DEFAULT_AWB_REGIONS_Y)
+	#define FLOATING_REGIONS 16
+	#define AGC_REGIONS 16
+	#define FOCUS_REGIONS 12
+
+.. kernel-doc:: include/uapi/linux/bcm2835-isp.h
+   :functions: bcm2835_isp_stats_hist bcm2835_isp_stats_region
+	             bcm2835_isp_stats_focus bcm2835_isp_stats
+
+.. _v4l2-meta-fmt-bcm2835-isp-params:
+
+BCM2835 ISP parameters
+======================
+
+The ISP parameters are configured by queuing buffers to the "bcm2835-isp-params"
+metadata output node. Parameter buffers use the V4L2 extensible parameters
+format described in :ref:`v4l2-isp`. Userspace assembles one or more parameter
+blocks in the data area of :c:type:`v4l2_isp_params_buffer` and submits the
+buffer to the driver.
+
+Each block begins with a :c:type:`v4l2_isp_params_block_header` and embeds the
+block-specific payload. The header ``type`` must be set to a value from
+:c:type:`bcm2835_isp_param_block_type`, ``size`` must match the block size, and
+``flags`` can be used to enable or disable the block.
+
+Example: enqueue two parameter blocks (black level and gamma)
+-------------------------------------------------------------
+
+.. code-block:: c
+
+	struct v4l2_isp_params_buffer *params =
+		(struct v4l2_isp_params_buffer *)buffer;
+
+	params->version = BCM2835_ISP_PARAM_BUFFER_V1;
+	params->data_size = 0;
+
+	void *data = (void *)params->data;
+
+	struct bcm2835_isp_params_black_level *black =
+		(struct bcm2835_isp_params_black_level *)data;
+
+	black->header.type = BCM2835_ISP_PARAM_BLOCK_BLACK_LEVEL;
+	black->header.flags |= V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+	black->header.size = sizeof(*black);
+
+	black->black_level.enabled = 1;
+	black->black_level.black_level_r = 64;
+	black->black_level.black_level_g = 64;
+	black->black_level.black_level_b = 64;
+
+	data += sizeof(*black);
+	params->data_size += sizeof(*black);
+
+	struct bcm2835_isp_params_gamma *gamma =
+		(struct bcm2835_isp_params_gamma *)data;
+
+	gamma->header.type = BCM2835_ISP_PARAM_BLOCK_GAMMA;
+	gamma->header.flags |= V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+	gamma->header.size = sizeof(*gamma);
+
+	gamma->gamma.enabled = 1;
+	/* Fill gamma->gamma.x[] and gamma->gamma.y[] here */
+
+	params->data_size += sizeof(*gamma);
+
+The total payload size must not exceed :c:macro:`BCM2835_ISP_PARAMS_MAX_SIZE`.
+The driver applies parameter buffers on the next frame boundary.
+
+BCM2835 ISP uAPI data types
+===========================
+
+.. kernel-doc:: include/uapi/linux/bcm2835-isp.h
+   :functions: bcm2835_isp_awb_gains bcm2835_isp_ccm bcm2835_isp_gain_format
+                bcm2835_isp_digital_gain bcm2835_isp_lens_shading
+                bcm2835_isp_black_level bcm2835_isp_geq bcm2835_isp_gamma
+                bcm2835_isp_denoise bcm2835_isp_sharpen bcm2835_isp_dpc_mode
+                bcm2835_isp_dpc bcm2835_isp_rational bcm2835_isp_cdn
diff --git a/MAINTAINERS b/MAINTAINERS
index e9e8e735ecb2057581345fb7faad6608849fc3bf..3fbdbe989a70a2e3784b1d20b27643beff4fef3a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4958,6 +4958,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
 F:	drivers/media/platform/broadcom/bcm2835-unicam/*
 
+BROADCOM BCM2835 ISP DRIVER
+M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/admin-guide/media/bcm2835-isp.rst
+F:	Documentation/userspace-api/media/v4l/metafmt-bcm2835-isp.rst
+F:	drivers/media/platform/broadcom/bcm2835-isp/*
+F:	include/uapi/linux/bcm2835-isp.h
+
 BROADCOM BCM47XX MIPS ARCHITECTURE
 M:	Hauke Mehrtens <hauke@hauke-m.de>
 M:	Rafał Miłecki <zajec5@gmail.com>
diff --git a/drivers/media/platform/broadcom/Kconfig b/drivers/media/platform/broadcom/Kconfig
index cab44885182ce658fa136e31485913b1f0547968..0da6c83e97ed176ef70255e8365a1e40a58867cb 100644
--- a/drivers/media/platform/broadcom/Kconfig
+++ b/drivers/media/platform/broadcom/Kconfig
@@ -3,3 +3,4 @@
 comment "Broadcom BCM283x/BCM271x media platform drivers"
 
 source "drivers/media/platform/broadcom/bcm2835-unicam/Kconfig"
+source "drivers/media/platform/broadcom/bcm2835-isp/Kconfig"
diff --git a/drivers/media/platform/broadcom/Makefile b/drivers/media/platform/broadcom/Makefile
index 33a89bdb0029bc67d90d16bc0910a681b7675ad7..1d49e586f492fa42f12f55c030c4d621e0a4ecde 100644
--- a/drivers/media/platform/broadcom/Makefile
+++ b/drivers/media/platform/broadcom/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-y += bcm2835-unicam/
+obj-y += bcm2835-isp/
diff --git a/drivers/media/platform/broadcom/bcm2835-isp/Kconfig b/drivers/media/platform/broadcom/bcm2835-isp/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..3a4db5bf61a1f988ee0ccc9d0012ad6d7c6f9255
--- /dev/null
+++ b/drivers/media/platform/broadcom/bcm2835-isp/Kconfig
@@ -0,0 +1,15 @@
+config VIDEO_ISP_BCM2835
+	tristate "BCM2835 ISP support"
+	depends on MEDIA_SUPPORT
+	depends on VIDEO_DEV && (ARCH_BCM2835 || COMPILE_TEST)
+	depends on MEDIA_CONTROLLER
+	select BCM2835_VCHIQ_MMAL
+	select V4L2_ISP
+	select VIDEOBUF2_DMA_CONTIG
+	help
+	  This is the V4L2 driver for the Broadcom BCM2835 ISP hardware.
+	  This operates over the VCHIQ interface to a service running on
+	  VideoCore.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called bcm2835-isp.
diff --git a/drivers/media/platform/broadcom/bcm2835-isp/Makefile b/drivers/media/platform/broadcom/bcm2835-isp/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..21224cb85d5fbaced8ee1c951f8d40cd7bd320eb
--- /dev/null
+++ b/drivers/media/platform/broadcom/bcm2835-isp/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+bcm2835-isp-objs := bcm2835-v4l2-isp.o bcm2835-isp-params.o
+
+obj-$(CONFIG_VIDEO_ISP_BCM2835) += bcm2835-isp.o
diff --git a/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-isp-common.h b/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-isp-common.h
new file mode 100644
index 0000000000000000000000000000000000000000..b88241e6fd0d03945f9790436127bcd6f484a280
--- /dev/null
+++ b/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-isp-common.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Broadcom BCM2835 ISP driver - common header
+ *
+ * Copyright (c) 2026 Raspberry Pi (Trading) Ltd.
+ * Copyright (c) 2026 Ideas On Board Oy
+ */
+
+#ifndef BCM2835_ISP_COMMON_H
+#define BCM2835_ISP_COMMON_H
+
+#include <linux/mutex.h>
+#include <linux/spinlock.h>
+#include <linux/raspberrypi/mmal-parameters.h>
+#include <linux/raspberrypi/mmal-vchiq.h>
+
+#include <media/media-entity.h>
+#include <media/v4l2-device.h>
+#include <media/videobuf2-core.h>
+
+struct dma_buf;
+
+struct bcm2835_isp_params {
+	struct device *dev;
+	struct v4l2_device *v4l2_dev;
+	struct vchiq_mmal_instance *mmal_instance;
+	struct vchiq_mmal_port *port;
+
+	struct video_device vdev;
+	struct media_pad pad;
+	struct vb2_queue queue;
+	struct mutex lock; /* params node vdev lock */
+
+	struct {
+		struct list_head queue;
+		spinlock_t lock; /* spinlock for params buffer queue */
+	} buffers;
+
+	/* Lens shading state */
+	struct dma_buf *last_ls_dmabuf;
+	struct mmal_parameter_lens_shading_v2 ls;
+};
+
+struct bcm2835_isp_params *
+bcm2835_isp_params_register(struct v4l2_device *v4l2_dev, struct device *dev,
+			    struct vchiq_mmal_instance *mmal_instance,
+			    struct vchiq_mmal_port *port, int video_nr);
+
+void bcm2835_isp_params_unregister(struct bcm2835_isp_params *params);
+
+void bcm2835_isp_params_drop_ls_ref(struct bcm2835_isp_params *params);
+
+int bcm2835_isp_node_querycap(struct file *file, void *priv,
+			      struct v4l2_capability *cap);
+
+#endif /* BCM2835_ISP_COMMON_H */
diff --git a/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-isp-fmts.h b/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-isp-fmts.h
new file mode 100644
index 0000000000000000000000000000000000000000..6f3333d33c4fd52dceb5bd0f9ae17d83b38b2b19
--- /dev/null
+++ b/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-isp-fmts.h
@@ -0,0 +1,558 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Broadcom BCM2835 ISP driver
+ *
+ * Copyright © 2019-2026 Raspberry Pi (Trading) Ltd.
+ *
+ * Author: Naushir Patuck (naush@raspberrypi.com)
+ *
+ */
+
+#ifndef BCM2835_ISP_FMTS
+#define BCM2835_ISP_FMTS
+
+#include <linux/videodev2.h>
+#include <linux/raspberrypi/mmal-encodings.h>
+
+struct bcm2835_isp_fmt {
+	u32 fourcc;
+	int depth;
+	int bytesperline_align;
+	u32 mmal_fmt;
+	int size_multiplier_x2;
+	u32 colorspace_mask;
+	enum v4l2_colorspace colorspace_default;
+	unsigned int step_size;
+};
+
+#define V4L2_COLORSPACE_MASK(colorspace) BIT(colorspace)
+
+#define V4L2_COLORSPACE_MASK_JPEG V4L2_COLORSPACE_MASK(V4L2_COLORSPACE_JPEG)
+#define V4L2_COLORSPACE_MASK_SMPTE170M V4L2_COLORSPACE_MASK(V4L2_COLORSPACE_SMPTE170M)
+#define V4L2_COLORSPACE_MASK_REC709 V4L2_COLORSPACE_MASK(V4L2_COLORSPACE_REC709)
+#define V4L2_COLORSPACE_MASK_SRGB V4L2_COLORSPACE_MASK(V4L2_COLORSPACE_SRGB)
+#define V4L2_COLORSPACE_MASK_RAW V4L2_COLORSPACE_MASK(V4L2_COLORSPACE_RAW)
+
+/*
+ * All three colour spaces JPEG, SMPTE170M and REC709 are fundamentally sRGB
+ * underneath (as near as makes no difference to us), just with different YCbCr
+ * encodings. Therefore the ISP can generate sRGB on its main output and any of
+ * the others on its low resolution output. Applications should, when using both
+ * outputs, program the colour spaces on them to be the same, matching whatever
+ * is requested for the low resolution output, even if the main output is
+ * producing an RGB format. In turn this requires us to allow all these colour
+ * spaces for every YUV/RGB output format.
+ */
+#define V4L2_COLORSPACE_MASK_ALL_SRGB (V4L2_COLORSPACE_MASK_JPEG |	\
+				       V4L2_COLORSPACE_MASK_SRGB |	\
+				       V4L2_COLORSPACE_MASK_SMPTE170M |	\
+				       V4L2_COLORSPACE_MASK_REC709)
+
+static const struct bcm2835_isp_fmt supported_formats[] = {
+	{
+		/* YUV formats */
+		.fourcc		    = V4L2_PIX_FMT_YUV420,
+		.depth		    = 8,
+		.bytesperline_align = 64,
+		.mmal_fmt	    = MMAL_ENCODING_I420,
+		.size_multiplier_x2 = 3,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_JPEG,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_YVU420,
+		.depth		    = 8,
+		.bytesperline_align = 64,
+		.mmal_fmt	    = MMAL_ENCODING_YV12,
+		.size_multiplier_x2 = 3,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_NV12,
+		.depth		    = 8,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_NV12,
+		.size_multiplier_x2 = 3,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_NV21,
+		.depth		    = 8,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_NV21,
+		.size_multiplier_x2 = 3,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_YUYV,
+		.depth		    = 16,
+		.bytesperline_align = 64,
+		.mmal_fmt	    = MMAL_ENCODING_YUYV,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_UYVY,
+		.depth		    = 16,
+		.bytesperline_align = 64,
+		.mmal_fmt	    = MMAL_ENCODING_UYVY,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_YVYU,
+		.depth		    = 16,
+		.bytesperline_align = 64,
+		.mmal_fmt	    = MMAL_ENCODING_YVYU,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_VYUY,
+		.depth		    = 16,
+		.bytesperline_align = 64,
+		.mmal_fmt	    = MMAL_ENCODING_VYUY,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SMPTE170M,
+		.step_size	    = 2,
+	}, {
+		/* RGB formats */
+		.fourcc		    = V4L2_PIX_FMT_RGB24,
+		.depth		    = 24,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_RGB24,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SRGB,
+		.step_size	    = 1,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_RGB565,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_RGB16,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SRGB,
+		.step_size	    = 1,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_BGR24,
+		.depth		    = 24,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BGR24,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SRGB,
+		.step_size	    = 1,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_XBGR32,
+		.depth		    = 32,
+		.bytesperline_align = 64,
+		.mmal_fmt	    = MMAL_ENCODING_BGRA,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SRGB,
+		.step_size	    = 1,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_RGBX32,
+		.depth		    = 32,
+		.bytesperline_align = 64,
+		.mmal_fmt	    = MMAL_ENCODING_RGBA,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_ALL_SRGB,
+		.colorspace_default = V4L2_COLORSPACE_SRGB,
+		.step_size	    = 1,
+	}, {
+		/* Bayer formats */
+		/* 8 bit */
+		.fourcc		    = V4L2_PIX_FMT_SRGGB8,
+		.depth		    = 8,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB8,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SBGGR8,
+		.depth		    = 8,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR8,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SGRBG8,
+		.depth		    = 8,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG8,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SGBRG8,
+		.depth		    = 8,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG8,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		/* 10 bit */
+		.fourcc		    = V4L2_PIX_FMT_SRGGB10P,
+		.depth		    = 10,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB10P,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SBGGR10P,
+		.depth		    = 10,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR10P,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SGRBG10P,
+		.depth		    = 10,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG10P,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SGBRG10P,
+		.depth		    = 10,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG10P,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		/* 12 bit */
+		.fourcc		    = V4L2_PIX_FMT_SRGGB12P,
+		.depth		    = 12,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB12P,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SBGGR12P,
+		.depth		    = 12,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR12P,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SGRBG12P,
+		.depth		    = 12,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG12P,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SGBRG12P,
+		.depth		    = 12,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG12P,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		/* 14 bit */
+		.fourcc		    = V4L2_PIX_FMT_SRGGB14P,
+		.depth		    = 14,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB14P,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SBGGR14P,
+		.depth		    = 14,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR14P,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SGRBG14P,
+		.depth		    = 14,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG14P,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SGBRG14P,
+		.depth		    = 14,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG14P,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		/* 16 bit */
+		.fourcc		    = V4L2_PIX_FMT_SRGGB16,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB16,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SBGGR16,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR16,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SGRBG16,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG16,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SGBRG16,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG16,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		/* Bayer formats unpacked to 16bpp */
+		/* 10 bit */
+		.fourcc		    = V4L2_PIX_FMT_SRGGB10,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB10,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SBGGR10,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR10,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SGRBG10,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG10,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SGBRG10,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG10,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		/* 12 bit */
+		.fourcc		    = V4L2_PIX_FMT_SRGGB12,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB12,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SBGGR12,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR12,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SGRBG12,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG12,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SGBRG12,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG12,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		/* 14 bit */
+		.fourcc		    = V4L2_PIX_FMT_SRGGB14,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SRGGB14,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SBGGR14,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SBGGR14,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SGRBG14,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGRBG14,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_PIX_FMT_SGBRG14,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_BAYER_SGBRG14,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		/* Monochrome MIPI formats */
+		/* 8 bit */
+		.fourcc		    = V4L2_PIX_FMT_GREY,
+		.depth		    = 8,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_GREY,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		/* 10 bit */
+		.fourcc		    = V4L2_PIX_FMT_Y10P,
+		.depth		    = 10,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_Y10P,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		/* 12 bit */
+		.fourcc		    = V4L2_PIX_FMT_Y12P,
+		.depth		    = 12,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_Y12P,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		/* 14 bit */
+		.fourcc		    = V4L2_PIX_FMT_Y14P,
+		.depth		    = 14,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_Y14P,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		/* 16 bit */
+		.fourcc		    = V4L2_PIX_FMT_Y16,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_Y16,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		/* 10 bit as 16bpp */
+		.fourcc		    = V4L2_PIX_FMT_Y10,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_Y10,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		/* 12 bit as 16bpp */
+		.fourcc		    = V4L2_PIX_FMT_Y12,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_Y12,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		/* 14 bit as 16bpp */
+		.fourcc		    = V4L2_PIX_FMT_Y14,
+		.depth		    = 16,
+		.bytesperline_align = 32,
+		.mmal_fmt	    = MMAL_ENCODING_Y14,
+		.size_multiplier_x2 = 2,
+		.colorspace_mask    = V4L2_COLORSPACE_MASK_RAW,
+		.colorspace_default = V4L2_COLORSPACE_RAW,
+		.step_size	    = 2,
+	}, {
+		.fourcc		    = V4L2_META_FMT_BCM2835_ISP_STATS,
+		.depth		    = 8,
+		.mmal_fmt	    = MMAL_ENCODING_BRCM_STATS,
+		/* The rest are not valid fields for stats. */
+	}
+};
+
+#endif
diff --git a/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-isp-params.c b/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-isp-params.c
new file mode 100644
index 0000000000000000000000000000000000000000..f749e8c0e7af313c099e497cdc4ec8f62301a164
--- /dev/null
+++ b/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-isp-params.c
@@ -0,0 +1,500 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Broadcom BCM2835 ISP driver - extensible parameters node
+ *
+ * Copyright (c) 2026 Raspberry Pi Ltd.
+ * Copyright (c) 2026 Ideas On Board Oy
+ *
+ * Author: Jai Luthra <jai.luthra@ideasonboard.com>
+ */
+
+#include <linux/dma-buf.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/raspberrypi/mmal-parameters.h>
+#include <linux/raspberrypi/vc_sm_knl.h>
+
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-isp.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include <uapi/linux/bcm2835-isp.h>
+
+#include "bcm2835-isp-common.h"
+
+MODULE_IMPORT_NS("DMA_BUF");
+
+#define BCM2835_ISP_PARAMS_NAME "bcm2835-isp-params"
+
+#define BCM2835_ISP_PARAMS_BUF_SIZE \
+	v4l2_isp_params_buffer_size(BCM2835_ISP_PARAMS_MAX_SIZE)
+
+/**
+ * union bcm2835_isp_params_block - Generalisation of a parameter block
+ *
+ * @header:	Block header pointer for type checking
+ * @black_level: Black level configuration block
+ * @geq:	Green equalisation configuration block
+ * @gamma:	Gamma curve configuration block
+ * @denoise:	Denoise configuration block
+ * @sharpen:	Sharpen configuration block
+ * @dpc:	Defective pixel correction configuration block
+ * @cdn:	Colour denoise configuration block
+ * @ccm:	Colour correction matrix configuration block
+ * @ls:		Lens shading configuration block
+ * @awb_gains:	AWB gains configuration block
+ * @digital_gain: Digital gain configuration block
+ * @data:	Raw pointer for block iteration
+ */
+union bcm2835_isp_params_block {
+	const struct v4l2_isp_params_block_header *header;
+	const struct bcm2835_isp_params_black_level *black_level;
+	const struct bcm2835_isp_params_geq *geq;
+	const struct bcm2835_isp_params_gamma *gamma;
+	const struct bcm2835_isp_params_denoise *denoise;
+	const struct bcm2835_isp_params_sharpen *sharpen;
+	const struct bcm2835_isp_params_dpc *dpc;
+	const struct bcm2835_isp_params_cdn *cdn;
+	const struct bcm2835_isp_params_cc_matrix *ccm;
+	const struct bcm2835_isp_params_lens_shading *ls;
+	const struct bcm2835_isp_params_awb_gains *awb_gains;
+	const struct bcm2835_isp_params_digital_gain *digital_gain;
+	const __u8 *data;
+};
+
+typedef void (*bcm2835_isp_params_handler)(struct bcm2835_isp_params *params,
+					   union bcm2835_isp_params_block block);
+
+struct bcm2835_isp_params_buffer {
+	struct vb2_v4l2_buffer vb;
+	struct list_head list;
+	void *config;
+};
+
+#define to_bcm2835_isp_params_buf(vbuf) \
+	container_of(vbuf, struct bcm2835_isp_params_buffer, vb)
+
+static int isp_set_param(struct bcm2835_isp_params *params, u32 parameter, void
+			 *value, u32 value_size)
+{
+	return vchiq_mmal_port_parameter_set(params->mmal_instance, params->port,
+					     parameter, value, value_size);
+}
+
+static int map_ls_table(struct bcm2835_isp_params *params,
+			struct dma_buf *dmabuf,
+			const struct bcm2835_isp_lens_shading *v4l2_ls)
+{
+	void *vcsm_handle;
+	int ret;
+
+	if (IS_ERR_OR_NULL(dmabuf))
+		return -EINVAL;
+
+	/*
+	 * struct bcm2835_isp_lens_shading and struct
+	 * mmal_parameter_lens_shading_v2 match so that we can do a
+	 * simple memcpy here.
+	 * Only the dmabuf to the actual table needs any manipulation.
+	 */
+	memcpy(&params->ls, v4l2_ls, sizeof(params->ls));
+	ret = vc_sm_cma_import_dmabuf(dmabuf, &vcsm_handle);
+	if (ret) {
+		dma_buf_put(dmabuf);
+		return ret;
+	}
+
+	params->ls.mem_handle_table = vc_sm_cma_int_handle(vcsm_handle);
+	params->last_ls_dmabuf = dmabuf;
+
+	vc_sm_cma_free(vcsm_handle);
+
+	return 0;
+}
+
+/* Block handlers */
+
+#define BCM2835_ISP_PARAMS_HANDLER(_name, _mmal_param, _field)			\
+static void bcm2835_isp_params_##_name(struct bcm2835_isp_params *params,	\
+				       union bcm2835_isp_params_block block)	\
+{										\
+	isp_set_param(params, _mmal_param,					\
+		      (void *)&block._field->_field,				\
+		      sizeof(block._field->_field));				\
+}
+
+BCM2835_ISP_PARAMS_HANDLER(black_level, MMAL_PARAMETER_BLACK_LEVEL, black_level)
+BCM2835_ISP_PARAMS_HANDLER(geq, MMAL_PARAMETER_GEQ, geq)
+BCM2835_ISP_PARAMS_HANDLER(gamma, MMAL_PARAMETER_GAMMA, gamma)
+BCM2835_ISP_PARAMS_HANDLER(denoise, MMAL_PARAMETER_DENOISE, denoise)
+BCM2835_ISP_PARAMS_HANDLER(sharpen, MMAL_PARAMETER_SHARPEN, sharpen)
+BCM2835_ISP_PARAMS_HANDLER(dpc, MMAL_PARAMETER_DPC, dpc)
+BCM2835_ISP_PARAMS_HANDLER(cdn, MMAL_PARAMETER_CDN, cdn)
+BCM2835_ISP_PARAMS_HANDLER(cc_matrix, MMAL_PARAMETER_CUSTOM_CCM, ccm)
+BCM2835_ISP_PARAMS_HANDLER(awb_gains, MMAL_PARAMETER_CUSTOM_AWB_GAINS, awb_gains)
+BCM2835_ISP_PARAMS_HANDLER(digital_gain, MMAL_PARAMETER_DIGITAL_GAIN, digital_gain)
+
+static void bcm2835_isp_params_lens_shading(struct bcm2835_isp_params *params,
+					    union bcm2835_isp_params_block block)
+{
+	struct dma_buf *dmabuf;
+	int ret = 0;
+
+	dmabuf = dma_buf_get(block.ls->ls.dmabuf);
+	if (IS_ERR(dmabuf))
+		return;
+
+	if (dmabuf != params->last_ls_dmabuf)
+		ret = map_ls_table(params, dmabuf, &block.ls->ls);
+	if (!ret && params->ls.mem_handle_table)
+		isp_set_param(params, MMAL_PARAMETER_LENS_SHADING_OVERRIDE,
+			      &params->ls, sizeof(params->ls));
+
+	dma_buf_put(dmabuf);
+}
+
+static const bcm2835_isp_params_handler bcm2835_isp_params_handlers[] = {
+	[BCM2835_ISP_PARAM_BLOCK_BLACK_LEVEL] = bcm2835_isp_params_black_level,
+	[BCM2835_ISP_PARAM_BLOCK_GEQ] = bcm2835_isp_params_geq,
+	[BCM2835_ISP_PARAM_BLOCK_GAMMA] = bcm2835_isp_params_gamma,
+	[BCM2835_ISP_PARAM_BLOCK_DENOISE] = bcm2835_isp_params_denoise,
+	[BCM2835_ISP_PARAM_BLOCK_SHARPEN] = bcm2835_isp_params_sharpen,
+	[BCM2835_ISP_PARAM_BLOCK_DPC] = bcm2835_isp_params_dpc,
+	[BCM2835_ISP_PARAM_BLOCK_CDN] = bcm2835_isp_params_cdn,
+	[BCM2835_ISP_PARAM_BLOCK_CC_MATRIX] = bcm2835_isp_params_cc_matrix,
+	[BCM2835_ISP_PARAM_BLOCK_LENS_SHADING] = bcm2835_isp_params_lens_shading,
+	[BCM2835_ISP_PARAM_BLOCK_AWB_GAINS] = bcm2835_isp_params_awb_gains,
+	[BCM2835_ISP_PARAM_BLOCK_DIGITAL_GAIN] = bcm2835_isp_params_digital_gain,
+};
+
+static const struct v4l2_isp_params_block_type_info
+bcm2835_isp_params_block_types_info[] = {
+	[BCM2835_ISP_PARAM_BLOCK_BLACK_LEVEL] = {
+		.size = sizeof(struct bcm2835_isp_params_black_level),
+	},
+	[BCM2835_ISP_PARAM_BLOCK_GEQ] = {
+		.size = sizeof(struct bcm2835_isp_params_geq),
+	},
+	[BCM2835_ISP_PARAM_BLOCK_GAMMA] = {
+		.size = sizeof(struct bcm2835_isp_params_gamma),
+	},
+	[BCM2835_ISP_PARAM_BLOCK_DENOISE] = {
+		.size = sizeof(struct bcm2835_isp_params_denoise),
+	},
+	[BCM2835_ISP_PARAM_BLOCK_SHARPEN] = {
+		.size = sizeof(struct bcm2835_isp_params_sharpen),
+	},
+	[BCM2835_ISP_PARAM_BLOCK_DPC] = {
+		.size = sizeof(struct bcm2835_isp_params_dpc),
+	},
+	[BCM2835_ISP_PARAM_BLOCK_CDN] = {
+		.size = sizeof(struct bcm2835_isp_params_cdn),
+	},
+	[BCM2835_ISP_PARAM_BLOCK_CC_MATRIX] = {
+		.size = sizeof(struct bcm2835_isp_params_cc_matrix),
+	},
+	[BCM2835_ISP_PARAM_BLOCK_LENS_SHADING] = {
+		.size = sizeof(struct bcm2835_isp_params_lens_shading),
+	},
+	[BCM2835_ISP_PARAM_BLOCK_AWB_GAINS] = {
+		.size = sizeof(struct bcm2835_isp_params_awb_gains),
+	},
+	[BCM2835_ISP_PARAM_BLOCK_DIGITAL_GAIN] = {
+		.size = sizeof(struct bcm2835_isp_params_digital_gain),
+	},
+};
+
+static_assert(ARRAY_SIZE(bcm2835_isp_params_handlers) ==
+	      ARRAY_SIZE(bcm2835_isp_params_block_types_info));
+
+static void bcm2835_isp_params_apply(struct bcm2835_isp_params *params,
+				     struct bcm2835_isp_params_buffer *buf)
+{
+	const struct v4l2_isp_params_buffer *config = buf->config;
+	size_t block_offset = 0;
+	size_t max_offset = config->data_size;
+
+	while (block_offset < max_offset) {
+		union bcm2835_isp_params_block block;
+		bcm2835_isp_params_handler handler;
+
+		block.data = &config->data[block_offset];
+		handler = bcm2835_isp_params_handlers[block.header->type];
+		handler(params, block);
+
+		block_offset += block.header->size;
+	}
+
+	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+}
+
+/* vb2 operations */
+
+static int bcm2835_isp_params_queue_setup(struct vb2_queue *q,
+					  unsigned int *num_buffers,
+					  unsigned int *num_planes,
+					  unsigned int sizes[],
+					  struct device *alloc_devs[])
+{
+	if (*num_planes && *num_planes > 1)
+		return -EINVAL;
+
+	if (sizes[0] && sizes[0] < BCM2835_ISP_PARAMS_BUF_SIZE)
+		return -EINVAL;
+
+	*num_planes = 1;
+
+	if (!sizes[0])
+		sizes[0] = BCM2835_ISP_PARAMS_BUF_SIZE;
+
+	return 0;
+}
+
+static int bcm2835_isp_params_buf_init(struct vb2_buffer *vb)
+{
+	struct bcm2835_isp_params_buffer *buf =
+		to_bcm2835_isp_params_buf(to_vb2_v4l2_buffer(vb));
+
+	buf->config = kvmalloc(BCM2835_ISP_PARAMS_BUF_SIZE, GFP_KERNEL);
+	if (!buf->config)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static void bcm2835_isp_params_buf_cleanup(struct vb2_buffer *vb)
+{
+	struct bcm2835_isp_params_buffer *buf =
+		to_bcm2835_isp_params_buf(to_vb2_v4l2_buffer(vb));
+
+	kvfree(buf->config);
+	buf->config = NULL;
+}
+
+static int bcm2835_isp_params_buf_prepare(struct vb2_buffer *vb)
+{
+	struct bcm2835_isp_params *params = vb2_get_drv_priv(vb->vb2_queue);
+	struct bcm2835_isp_params_buffer *buf =
+		to_bcm2835_isp_params_buf(to_vb2_v4l2_buffer(vb));
+	const struct v4l2_isp_params_buffer *config;
+	int ret;
+
+	ret = v4l2_isp_params_validate_buffer_size(params->dev, vb,
+						   BCM2835_ISP_PARAMS_BUF_SIZE);
+	if (ret)
+		return ret;
+
+	config = vb2_plane_vaddr(vb, 0);
+	if (config->version != BCM2835_ISP_PARAM_BUFFER_V1)
+		return -EINVAL;
+
+	/* Copy into scratch buffer */
+	memcpy(buf->config, config, BCM2835_ISP_PARAMS_BUF_SIZE);
+
+	return v4l2_isp_params_validate_buffer(params->dev, vb, buf->config,
+					       bcm2835_isp_params_block_types_info,
+					       ARRAY_SIZE(bcm2835_isp_params_block_types_info));
+}
+
+static void bcm2835_isp_params_buf_queue(struct vb2_buffer *vb)
+{
+	struct bcm2835_isp_params *params = vb2_get_drv_priv(vb->vb2_queue);
+	struct bcm2835_isp_params_buffer *buf =
+		to_bcm2835_isp_params_buf(to_vb2_v4l2_buffer(vb));
+
+	/*
+	 * Apply params immediately - the firmware will apply them on the
+	 * next frame boundary.
+	 */
+	spin_lock(&params->buffers.lock);
+	list_add_tail(&buf->list, &params->buffers.queue);
+	buf = list_first_entry(&params->buffers.queue,
+			       struct bcm2835_isp_params_buffer, list);
+	list_del(&buf->list);
+	spin_unlock(&params->buffers.lock);
+
+	bcm2835_isp_params_apply(params, buf);
+}
+
+static void bcm2835_isp_params_return_buffers(struct bcm2835_isp_params *params,
+					      enum vb2_buffer_state state)
+{
+	struct bcm2835_isp_params_buffer *buf, *tmp;
+
+	guard(spinlock)(&params->buffers.lock);
+
+	list_for_each_entry_safe(buf, tmp, &params->buffers.queue, list) {
+		list_del(&buf->list);
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+	}
+}
+
+static void bcm2835_isp_params_stop_streaming(struct vb2_queue *q)
+{
+	struct bcm2835_isp_params *params = vb2_get_drv_priv(q);
+
+	bcm2835_isp_params_return_buffers(params, VB2_BUF_STATE_ERROR);
+}
+
+static const struct vb2_ops bcm2835_isp_params_vb2_ops = {
+	.queue_setup = bcm2835_isp_params_queue_setup,
+	.buf_init = bcm2835_isp_params_buf_init,
+	.buf_cleanup = bcm2835_isp_params_buf_cleanup,
+	.buf_prepare = bcm2835_isp_params_buf_prepare,
+	.buf_queue = bcm2835_isp_params_buf_queue,
+	.stop_streaming = bcm2835_isp_params_stop_streaming,
+};
+
+/* V4L2 ioctls */
+
+static int bcm2835_isp_params_enum_fmt(struct file *file, void *fh,
+				       struct v4l2_fmtdesc *f)
+{
+	if (f->index)
+		return -EINVAL;
+
+	f->pixelformat = V4L2_META_FMT_BCM2835_ISP_PARAMS;
+
+	return 0;
+}
+
+static int bcm2835_isp_params_g_fmt(struct file *file, void *fh,
+				    struct v4l2_format *f)
+{
+	f->fmt.meta.dataformat = V4L2_META_FMT_BCM2835_ISP_PARAMS;
+	f->fmt.meta.buffersize = BCM2835_ISP_PARAMS_BUF_SIZE;
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops bcm2835_isp_params_ioctl_ops = {
+	.vidioc_querycap = bcm2835_isp_node_querycap,
+	.vidioc_enum_fmt_meta_out = bcm2835_isp_params_enum_fmt,
+	.vidioc_g_fmt_meta_out = bcm2835_isp_params_g_fmt,
+	.vidioc_s_fmt_meta_out = bcm2835_isp_params_g_fmt,
+	.vidioc_try_fmt_meta_out = bcm2835_isp_params_g_fmt,
+
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+};
+
+static const struct v4l2_file_operations bcm2835_isp_params_fops = {
+	.owner = THIS_MODULE,
+	.open = v4l2_fh_open,
+	.release = vb2_fop_release,
+	.poll = vb2_fop_poll,
+	.unlocked_ioctl = video_ioctl2,
+	.mmap = vb2_fop_mmap,
+};
+
+struct bcm2835_isp_params *
+bcm2835_isp_params_register(struct v4l2_device *v4l2_dev, struct device *dev,
+			    struct vchiq_mmal_instance *mmal_instance,
+			    struct vchiq_mmal_port *port, int video_nr)
+{
+	struct bcm2835_isp_params *params;
+	struct video_device *vdev;
+	struct vb2_queue *q;
+	int ret;
+
+	params = devm_kzalloc(dev, sizeof(*params), GFP_KERNEL);
+	if (!params)
+		return ERR_PTR(-ENOMEM);
+
+	params->dev = dev;
+	params->v4l2_dev = v4l2_dev;
+	params->mmal_instance = mmal_instance;
+	params->port = port;
+
+	mutex_init(&params->lock);
+	INIT_LIST_HEAD(&params->buffers.queue);
+	spin_lock_init(&params->buffers.lock);
+
+	/* Initialize vb2 queue */
+	q = &params->queue;
+	q->type = V4L2_BUF_TYPE_META_OUTPUT;
+	q->io_modes = VB2_MMAP | VB2_DMABUF;
+	q->drv_priv = params;
+	q->ops = &bcm2835_isp_params_vb2_ops;
+	q->mem_ops = &vb2_dma_contig_memops;
+	q->buf_struct_size = sizeof(struct bcm2835_isp_params_buffer);
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	q->dev = dev;
+	q->lock = &params->lock;
+
+	ret = vb2_queue_init(q);
+	if (ret) {
+		dev_err(dev, "Failed to init params vb2 queue\n");
+		return ERR_PTR(ret);
+	}
+
+	/* Initialize video device */
+	vdev = &params->vdev;
+	vdev->device_caps = V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAMING;
+	vdev->fops = &bcm2835_isp_params_fops;
+	vdev->ioctl_ops = &bcm2835_isp_params_ioctl_ops;
+	vdev->minor = -1;
+	vdev->release = video_device_release_empty;
+	vdev->queue = q;
+	vdev->lock = &params->lock;
+	vdev->v4l2_dev = v4l2_dev;
+	vdev->vfl_dir = VFL_DIR_TX;
+	snprintf(vdev->name, sizeof(vdev->name), "%s", BCM2835_ISP_PARAMS_NAME);
+
+	params->pad.flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&vdev->entity, 1, &params->pad);
+	if (ret) {
+		vb2_queue_release(q);
+		return ERR_PTR(ret);
+	}
+
+	video_set_drvdata(vdev, params);
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, video_nr);
+	if (ret) {
+		dev_err(dev, "Failed to register params device node\n");
+		media_entity_cleanup(&vdev->entity);
+		vb2_queue_release(q);
+		return ERR_PTR(ret);
+	}
+
+	v4l2_info(v4l2_dev, "Params device node registered as /dev/video%d\n",
+		  vdev->num);
+
+	return params;
+}
+
+void bcm2835_isp_params_unregister(struct bcm2835_isp_params *params)
+{
+	if (!video_is_registered(&params->vdev))
+		return;
+
+	v4l2_info(params->v4l2_dev, "Unregistering params device node\n");
+
+	vb2_video_unregister_device(&params->vdev);
+	media_entity_cleanup(&params->vdev.entity);
+	mutex_destroy(&params->lock);
+}
+
+/*
+ * The ISP component on the firmware has a reference to the dmabuf handle for
+ * the lens shading table.
+ * Pass a null handle to remove that reference.
+ */
+void bcm2835_isp_params_drop_ls_ref(struct bcm2835_isp_params *params)
+{
+	memset(&params->ls, 0, sizeof(params->ls));
+	/* Must set a valid grid size for the FW */
+	params->ls.grid_cell_size = 16;
+	isp_set_param(params, MMAL_PARAMETER_LENS_SHADING_OVERRIDE,
+		      &params->ls, sizeof(params->ls));
+	params->last_ls_dmabuf = NULL;
+}
diff --git a/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-v4l2-isp.c b/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-v4l2-isp.c
new file mode 100644
index 0000000000000000000000000000000000000000..ed318ab83b65ace7f1ef1c08fcfca47ad77cff05
--- /dev/null
+++ b/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-v4l2-isp.c
@@ -0,0 +1,1512 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Broadcom BCM2835 ISP driver
+ *
+ * Copyright (c) 2019-2026 Raspberry Pi (Trading) Ltd.
+ * Copyright (c) 2026 Ideas On Board Oy
+ *
+ * Author: Naushir Patuck (naush@raspberrypi.com)
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/raspberrypi/mmal-msg.h>
+#include <linux/raspberrypi/mmal-parameters.h>
+#include <linux/raspberrypi/mmal-vchiq.h>
+#include <linux/raspberrypi/vchiq_bus.h>
+
+#include <media/v4l2-device.h>
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "bcm2835-isp-fmts.h"
+#include "bcm2835-isp-common.h"
+
+/*
+ * We want to instantiate 2 independent instances allowing 2 simultaneous users
+ * of the ISP hardware.
+ */
+#define BCM2835_ISP_NUM_INSTANCES 2
+
+MODULE_IMPORT_NS("DMA_BUF");
+
+static unsigned int debug;
+module_param(debug, uint, 0644);
+MODULE_PARM_DESC(debug, "activates debug info");
+
+static unsigned int video_nr[BCM2835_ISP_NUM_INSTANCES] = { 13, 20 };
+module_param_array(video_nr, uint, NULL, 0644);
+MODULE_PARM_DESC(video_nr, "base video device numbers");
+
+#define BCM2835_ISP_NAME "bcm2835-isp"
+#define BCM2835_ISP_ENTITY_NAME_LEN 32
+
+#define BCM2835_ISP_NUM_OUTPUTS 1
+#define BCM2835_ISP_NUM_CAPTURES 2
+#define BCM2835_ISP_NUM_METADATA 1
+#define BCM2835_ISP_NUM_PARAMS 1
+
+#define BCM2835_ISP_NUM_NODES						\
+		(BCM2835_ISP_NUM_OUTPUTS + BCM2835_ISP_NUM_CAPTURES +	\
+		 BCM2835_ISP_NUM_METADATA)
+#define BCM2835_ISP_PARAMS_PAD BCM2835_ISP_NUM_NODES
+#define BCM2835_ISP_NUM_ENTITY_PADS					\
+		(BCM2835_ISP_NUM_NODES + BCM2835_ISP_NUM_PARAMS)
+
+/* Default frame dimension of 1280 pixels. */
+#define DEFAULT_DIM 1280U
+/*
+ * Maximum frame dimension of 16384 pixels.  Even though the ISP runs in tiles,
+ * have a sensible limit so that we do not create an excessive number of tiles
+ * to process.
+ */
+#define MAX_DIM 16384U
+/*
+ * Minimum frame dimension of 64 pixels.  Anything lower, and the tiling
+ * algorithm may not be able to cope when applying filter context.
+ */
+#define MIN_DIM 64U
+
+/* Timeout for stop_streaming to allow all buffers to return */
+#define COMPLETE_TIMEOUT (2 * HZ)
+
+/* Per-queue, driver-specific private data */
+struct bcm2835_isp_q_data {
+	/*
+	 * These parameters should be treated as gospel, with everything else
+	 * being determined from them.
+	 */
+	unsigned int bytesperline;
+	unsigned int width;
+	unsigned int height;
+	unsigned int sizeimage;
+	enum v4l2_colorspace colorspace;
+	enum v4l2_ycbcr_encoding ycbcr_enc;
+	enum v4l2_xfer_func xfer_func;
+	enum v4l2_quantization quantization;
+	const struct bcm2835_isp_fmt *fmt;
+};
+
+/*
+ * Structure to describe a single node /dev/video<N> which represents a single
+ * input or output queue to the ISP device.
+ */
+struct bcm2835_isp_node {
+	int vfl_dir;
+	unsigned int id;
+	const char *name;
+	struct vchiq_mmal_port *port;
+	struct video_device vfd;
+	struct media_pad pad;
+	struct mutex lock; /* top level device node lock */
+	struct mutex queue_lock;
+
+	struct vb2_queue queue;
+	unsigned int sequence;
+
+	/* The list of formats supported on the node. */
+	struct bcm2835_isp_fmt const **supported_fmts;
+	unsigned int num_supported_fmts;
+
+	struct bcm2835_isp_q_data q_data;
+
+	/* Parent device structure */
+	struct bcm2835_isp_dev *dev;
+
+	bool registered;
+};
+
+/*
+ * Structure representing the entire ISP device, comprising several input and
+ * output nodes /dev/video<N>.
+ */
+struct bcm2835_isp_dev {
+	struct v4l2_device v4l2_dev;
+	struct device *dev;
+	struct media_device mdev;
+	struct media_entity entity;
+	bool media_device_registered;
+	bool media_entity_registered;
+	struct vchiq_mmal_instance *mmal_instance;
+	struct vchiq_mmal_component *component;
+	struct completion frame_cmplt;
+
+	struct bcm2835_isp_node node[BCM2835_ISP_NUM_NODES];
+	struct media_pad pad[BCM2835_ISP_NUM_ENTITY_PADS];
+	atomic_t num_streaming;
+
+	/* Extensible params node */
+	struct bcm2835_isp_params *params;
+};
+
+struct bcm2835_isp_buffer {
+	struct vb2_v4l2_buffer vb;
+	struct mmal_buffer mmal;
+};
+
+static
+inline struct bcm2835_isp_dev *node_get_dev(struct bcm2835_isp_node *node)
+{
+	return node->dev;
+}
+
+static inline bool node_is_output(struct bcm2835_isp_node *node)
+{
+	return node->queue.type == V4L2_BUF_TYPE_VIDEO_OUTPUT;
+}
+
+static inline bool node_is_capture(struct bcm2835_isp_node *node)
+{
+	return node->queue.type == V4L2_BUF_TYPE_VIDEO_CAPTURE;
+}
+
+static inline bool node_is_stats(struct bcm2835_isp_node *node)
+{
+	return node->queue.type == V4L2_BUF_TYPE_META_CAPTURE;
+}
+
+static inline enum v4l2_buf_type index_to_queue_type(int index)
+{
+	if (index < BCM2835_ISP_NUM_OUTPUTS)
+		return V4L2_BUF_TYPE_VIDEO_OUTPUT;
+	else if (index < BCM2835_ISP_NUM_OUTPUTS + BCM2835_ISP_NUM_CAPTURES)
+		return V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	else
+		return V4L2_BUF_TYPE_META_CAPTURE;
+}
+
+static const struct bcm2835_isp_fmt *get_fmt(u32 mmal_fmt)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(supported_formats); i++) {
+		if (supported_formats[i].mmal_fmt == mmal_fmt)
+			return &supported_formats[i];
+	}
+	return NULL;
+}
+
+static const
+struct bcm2835_isp_fmt *find_format_by_fourcc(unsigned int fourcc,
+					      struct bcm2835_isp_node *node)
+{
+	const struct bcm2835_isp_fmt *fmt;
+	unsigned int i;
+
+	for (i = 0; i < node->num_supported_fmts; i++) {
+		fmt = node->supported_fmts[i];
+		if (fmt->fourcc == fourcc)
+			return fmt;
+	}
+
+	return NULL;
+}
+
+static const
+struct bcm2835_isp_fmt *find_format(struct v4l2_format *f,
+				    struct bcm2835_isp_node *node)
+{
+	return find_format_by_fourcc(node_is_stats(node) ?
+				     f->fmt.meta.dataformat :
+				     f->fmt.pix.pixelformat,
+				     node);
+}
+
+/* vb2_to_mmal_buffer() - converts vb2 buffer header to MMAL
+ *
+ * Copies all the required fields from a VB2 buffer to the MMAL buffer header,
+ * ready for sending to the VPU.
+ */
+static void vb2_to_mmal_buffer(struct mmal_buffer *buf,
+			       struct vb2_v4l2_buffer *vb2)
+{
+	u64 pts;
+
+	buf->mmal_flags = 0;
+	if (vb2->flags & V4L2_BUF_FLAG_KEYFRAME)
+		buf->mmal_flags |= MMAL_BUFFER_HEADER_FLAG_KEYFRAME;
+
+	/* Data must be framed correctly as one frame per buffer. */
+	buf->mmal_flags |= MMAL_BUFFER_HEADER_FLAG_FRAME_END;
+
+	buf->length = vb2->vb2_buf.planes[0].bytesused;
+	/*
+	 * Minor ambiguity in the V4L2 spec as to whether passing in a 0 length
+	 * buffer, or one with V4L2_BUF_FLAG_LAST set denotes end of stream.
+	 * Handle either.
+	 */
+	if (!buf->length || vb2->flags & V4L2_BUF_FLAG_LAST)
+		buf->mmal_flags |= MMAL_BUFFER_HEADER_FLAG_EOS;
+
+	/* vb2 timestamps in nsecs, mmal in usecs */
+	pts = vb2->vb2_buf.timestamp;
+	do_div(pts, 1000);
+	buf->pts = pts;
+	buf->dts = MMAL_TIME_UNKNOWN;
+}
+
+static void mmal_buffer_cb(struct vchiq_mmal_instance *instance,
+			   struct vchiq_mmal_port *port, int status,
+			   struct mmal_buffer *mmal_buf)
+{
+	struct bcm2835_isp_buffer *q_buf;
+	struct bcm2835_isp_node *node = port->cb_ctx;
+	struct bcm2835_isp_dev *dev = node_get_dev(node);
+	struct vb2_v4l2_buffer *vb2;
+
+	q_buf = container_of(mmal_buf, struct bcm2835_isp_buffer, mmal);
+	vb2 = &q_buf->vb;
+	v4l2_dbg(2, debug, &dev->v4l2_dev,
+		 "%s: port:%s[%d], status:%d, buf:%p, dmabuf:%p, length:%lu, flags %u, pts %lld\n",
+		 __func__, node_is_output(node) ? "input" : "output", node->id,
+		 status, mmal_buf, mmal_buf->dma_buf, mmal_buf->length,
+		 mmal_buf->mmal_flags, mmal_buf->pts);
+
+	if (status) {
+		/* error in transfer */
+		if (vb2) {
+			/* there was a buffer with the error so return it */
+			vb2_buffer_done(&vb2->vb2_buf, VB2_BUF_STATE_ERROR);
+		}
+		return;
+	}
+
+	/* vb2 timestamps in nsecs, mmal in usecs */
+	vb2->vb2_buf.timestamp = mmal_buf->pts * 1000;
+	vb2->sequence = node->sequence++;
+	vb2_set_plane_payload(&vb2->vb2_buf, 0, mmal_buf->length);
+	vb2_buffer_done(&vb2->vb2_buf, VB2_BUF_STATE_DONE);
+
+	if (!port->enabled)
+		complete(&dev->frame_cmplt);
+}
+
+struct colorspace_translation {
+	enum v4l2_colorspace v4l2_value;
+	u32 mmal_value;
+};
+
+static u32 translate_color_space(enum v4l2_colorspace color_space)
+{
+	static const struct colorspace_translation translations[] = {
+		{ V4L2_COLORSPACE_DEFAULT, MMAL_COLOR_SPACE_UNKNOWN },
+		{ V4L2_COLORSPACE_SMPTE170M, MMAL_COLOR_SPACE_ITUR_BT601 },
+		{ V4L2_COLORSPACE_SMPTE240M, MMAL_COLOR_SPACE_SMPTE240M },
+		{ V4L2_COLORSPACE_REC709, MMAL_COLOR_SPACE_ITUR_BT709 },
+		/* V4L2_COLORSPACE_BT878 unavailable */
+		{ V4L2_COLORSPACE_470_SYSTEM_M, MMAL_COLOR_SPACE_BT470_2_M },
+		{ V4L2_COLORSPACE_470_SYSTEM_BG, MMAL_COLOR_SPACE_BT470_2_BG },
+		{ V4L2_COLORSPACE_JPEG, MMAL_COLOR_SPACE_JPEG_JFIF },
+		/*
+		 * We don't have an encoding for SRGB as such, but VideoCore
+		 * will do the right thing if it gets "unknown".
+		 */
+		{ V4L2_COLORSPACE_SRGB, MMAL_COLOR_SPACE_UNKNOWN },
+		/* V4L2_COLORSPACE_OPRGB unavailable */
+		/* V4L2_COLORSPACE_BT2020 unavailable */
+		/* V4L2_COLORSPACE_RAW unavailable */
+		/* V4L2_COLORSPACE_DCI_P3 unavailable */
+	};
+
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(translations); i++) {
+		if (color_space == translations[i].v4l2_value)
+			return translations[i].mmal_value;
+	}
+
+	return MMAL_COLOR_SPACE_UNKNOWN;
+}
+
+static void setup_mmal_port_format(struct bcm2835_isp_node *node,
+				   struct vchiq_mmal_port *port)
+{
+	struct bcm2835_isp_q_data *q_data = &node->q_data;
+
+	port->format.encoding = q_data->fmt->mmal_fmt;
+	/* Raw image format - set width/height */
+	port->es.video.width = (q_data->bytesperline << 3) / q_data->fmt->depth;
+	port->es.video.height = q_data->height;
+	port->es.video.crop.width = q_data->width;
+	port->es.video.crop.height = q_data->height;
+	port->es.video.crop.x = 0;
+	port->es.video.crop.y = 0;
+	port->es.video.color_space = translate_color_space(q_data->colorspace);
+};
+
+static int setup_mmal_port(struct bcm2835_isp_node *node)
+{
+	struct bcm2835_isp_dev *dev = node_get_dev(node);
+	unsigned int enable = 1;
+	int ret;
+
+	v4l2_dbg(2, debug, &dev->v4l2_dev, "%s: setup %s[%d]\n", __func__,
+		 node->name, node->id);
+
+	vchiq_mmal_port_parameter_set(dev->mmal_instance, node->port,
+				      MMAL_PARAMETER_ZERO_COPY, &enable,
+				      sizeof(enable));
+	setup_mmal_port_format(node, node->port);
+	ret = vchiq_mmal_port_set_format(dev->mmal_instance, node->port);
+	if (ret < 0) {
+		v4l2_dbg(1, debug, &dev->v4l2_dev,
+			 "%s: vchiq_mmal_port_set_format failed\n",
+			 __func__);
+		return ret;
+	}
+
+	if (node->q_data.sizeimage < node->port->minimum_buffer.size) {
+		v4l2_err(&dev->v4l2_dev,
+			 "buffer size mismatch sizeimage %u < min size %u\n",
+			 node->q_data.sizeimage,
+			 node->port->minimum_buffer.size);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int bcm2835_isp_mmal_buf_cleanup(struct mmal_buffer *mmal_buf)
+{
+	mmal_vchi_buffer_cleanup(mmal_buf);
+
+	if (mmal_buf->dma_buf) {
+		dma_buf_put(mmal_buf->dma_buf);
+		mmal_buf->dma_buf = NULL;
+	}
+
+	return 0;
+}
+
+static int bcm2835_isp_node_queue_setup(struct vb2_queue *q,
+					unsigned int *nbuffers,
+					unsigned int *nplanes,
+					unsigned int sizes[],
+					struct device *alloc_devs[])
+{
+	struct bcm2835_isp_node *node = vb2_get_drv_priv(q);
+	unsigned int size;
+
+	if (setup_mmal_port(node))
+		return -EINVAL;
+
+	size = node->q_data.sizeimage;
+	if (size == 0) {
+		v4l2_info(&node_get_dev(node)->v4l2_dev,
+			  "%s: Image size unset in queue_setup for node %s[%d]\n",
+			  __func__, node->name, node->id);
+		return -EINVAL;
+	}
+
+	if (*nplanes)
+		return sizes[0] < size ? -EINVAL : 0;
+
+	*nplanes = 1;
+	sizes[0] = size;
+
+	node->port->current_buffer.size = size;
+
+	if (*nbuffers < node->port->minimum_buffer.num)
+		*nbuffers = node->port->minimum_buffer.num;
+
+	node->port->current_buffer.num = *nbuffers;
+
+	v4l2_dbg(2, debug, &node_get_dev(node)->v4l2_dev,
+		 "%s: Image size %u, nbuffers %u for node %s[%d]\n",
+		 __func__, sizes[0], *nbuffers, node->name, node->id);
+	return 0;
+}
+
+static int bcm2835_isp_buf_init(struct vb2_buffer *vb)
+{
+	struct bcm2835_isp_node *node = vb2_get_drv_priv(vb->vb2_queue);
+	struct bcm2835_isp_dev *dev = node_get_dev(node);
+	struct vb2_v4l2_buffer *vb2 = to_vb2_v4l2_buffer(vb);
+	struct bcm2835_isp_buffer *buf =
+		container_of(vb2, struct bcm2835_isp_buffer, vb);
+
+	v4l2_dbg(3, debug, &dev->v4l2_dev, "%s: vb %p\n", __func__, vb);
+
+	buf->mmal.buffer = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
+	buf->mmal.buffer_size = vb2_plane_size(&buf->vb.vb2_buf, 0);
+	mmal_vchi_buffer_init(dev->mmal_instance, &buf->mmal);
+	return 0;
+}
+
+static int bcm2835_isp_buf_prepare(struct vb2_buffer *vb)
+{
+	struct bcm2835_isp_node *node = vb2_get_drv_priv(vb->vb2_queue);
+	struct bcm2835_isp_dev *dev = node_get_dev(node);
+	struct vb2_v4l2_buffer *vb2 = to_vb2_v4l2_buffer(vb);
+	struct bcm2835_isp_buffer *buf =
+		container_of(vb2, struct bcm2835_isp_buffer, vb);
+	struct dma_buf *dma_buf;
+	int ret;
+
+	v4l2_dbg(3, debug, &dev->v4l2_dev, "%s: type: %d ptr %p\n",
+		 __func__, vb->vb2_queue->type, vb);
+
+	if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
+		if (vb2->field == V4L2_FIELD_ANY)
+			vb2->field = V4L2_FIELD_NONE;
+		if (vb2->field != V4L2_FIELD_NONE) {
+			v4l2_err(&dev->v4l2_dev,
+				 "%s field isn't supported\n", __func__);
+			return -EINVAL;
+		}
+	}
+
+	if (vb2_plane_size(vb, 0) < node->q_data.sizeimage) {
+		v4l2_err(&dev->v4l2_dev,
+			 "%s data will not fit into plane (%lu < %lu)\n",
+			 __func__, vb2_plane_size(vb, 0),
+			 (long)node->q_data.sizeimage);
+		return -EINVAL;
+	}
+
+	if (!V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type))
+		vb2_set_plane_payload(vb, 0, node->q_data.sizeimage);
+
+	switch (vb->memory) {
+	case VB2_MEMORY_DMABUF:
+		dma_buf = dma_buf_get(vb->planes[0].m.fd);
+
+		if (dma_buf != buf->mmal.dma_buf) {
+			/*
+			 * dmabuf either hasn't already been mapped, or it has
+			 * changed.
+			 */
+			if (buf->mmal.dma_buf) {
+				v4l2_err(&dev->v4l2_dev,
+					 "%s Buffer changed - why did the core not call cleanup?\n",
+					 __func__);
+				bcm2835_isp_mmal_buf_cleanup(&buf->mmal);
+			}
+
+			buf->mmal.dma_buf = dma_buf;
+		} else {
+			/*
+			 * Already have a reference to the buffer, so release it
+			 * here.
+			 */
+			dma_buf_put(dma_buf);
+		}
+		ret = 0;
+		break;
+	case VB2_MEMORY_MMAP:
+		/*
+		 * We want to do this at init, but vb2_core_expbuf checks that
+		 * the index < q->num_buffers, and q->num_buffers only gets
+		 * updated once all the buffers are allocated.
+		 */
+		if (!buf->mmal.dma_buf) {
+			ret = vb2_core_expbuf_dmabuf(vb->vb2_queue,
+						     vb->vb2_queue->type,
+						     vb, 0, O_CLOEXEC,
+						     &buf->mmal.dma_buf);
+			v4l2_dbg(3, debug, &dev->v4l2_dev,
+				 "%s: exporting ptr %p to dmabuf %p\n",
+				 __func__, vb, buf->mmal.dma_buf);
+			if (ret)
+				v4l2_err(&dev->v4l2_dev,
+					 "%s: Failed to expbuf idx %d, ret %d\n",
+					 __func__, vb->index, ret);
+		} else {
+			ret = 0;
+		}
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static void bcm2835_isp_node_buffer_queue(struct vb2_buffer *buf)
+{
+	struct bcm2835_isp_node *node = vb2_get_drv_priv(buf->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf =
+		container_of(buf, struct vb2_v4l2_buffer, vb2_buf);
+	struct bcm2835_isp_buffer *buffer =
+		container_of(vbuf, struct bcm2835_isp_buffer, vb);
+	struct bcm2835_isp_dev *dev = node_get_dev(node);
+
+	v4l2_dbg(3, debug, &dev->v4l2_dev, "%s: node %s[%d], buffer %p\n",
+		 __func__, node->name, node->id, buffer);
+
+	vb2_to_mmal_buffer(&buffer->mmal, &buffer->vb);
+	v4l2_dbg(3, debug, &dev->v4l2_dev,
+		 "%s: node %s[%d] - submitting  mmal dmabuf %p\n", __func__,
+		 node->name, node->id, buffer->mmal.dma_buf);
+	vchiq_mmal_submit_buffer(dev->mmal_instance, node->port, &buffer->mmal);
+}
+
+static void bcm2835_isp_buffer_cleanup(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vb2 = to_vb2_v4l2_buffer(vb);
+	struct bcm2835_isp_buffer *buffer =
+		container_of(vb2, struct bcm2835_isp_buffer, vb);
+
+	bcm2835_isp_mmal_buf_cleanup(&buffer->mmal);
+}
+
+static int bcm2835_isp_node_start_streaming(struct vb2_queue *q,
+					    unsigned int count)
+{
+	struct bcm2835_isp_node *node = vb2_get_drv_priv(q);
+	struct bcm2835_isp_dev *dev = node_get_dev(node);
+	int ret;
+
+	v4l2_dbg(1, debug, &dev->v4l2_dev, "%s: node %s[%d] (count %u)\n",
+		 __func__, node->name, node->id, count);
+
+	ret = vchiq_mmal_component_enable(dev->mmal_instance, dev->component);
+	if (ret) {
+		v4l2_err(&dev->v4l2_dev, "%s: Failed enabling component, ret %d\n",
+			 __func__, ret);
+		return -EIO;
+	}
+
+	node->sequence = 0;
+	node->port->cb_ctx = node;
+	ret = vchiq_mmal_port_enable(dev->mmal_instance, node->port,
+				     mmal_buffer_cb);
+	if (!ret)
+		atomic_inc(&dev->num_streaming);
+	else
+		v4l2_err(&dev->v4l2_dev,
+			 "%s: Failed enabling port, ret %d\n", __func__, ret);
+
+	return ret;
+}
+
+static void bcm2835_isp_node_stop_streaming(struct vb2_queue *q)
+{
+	struct bcm2835_isp_node *node = vb2_get_drv_priv(q);
+	struct bcm2835_isp_dev *dev = node_get_dev(node);
+	int ret;
+
+	v4l2_dbg(1, debug, &dev->v4l2_dev, "%s: node %s[%d], mmal port %p\n",
+		 __func__, node->name, node->id, node->port);
+
+	init_completion(&dev->frame_cmplt);
+
+	/* Disable MMAL port - this will flush buffers back */
+	ret = vchiq_mmal_port_disable(dev->mmal_instance, node->port);
+	if (ret)
+		v4l2_err(&dev->v4l2_dev,
+			 "%s: Failed disabling %s port, ret %d\n", __func__,
+			 node_is_output(node) ? "i/p" : "o/p",
+			 ret);
+
+	while (atomic_read(&node->port->buffers_with_vpu)) {
+		v4l2_dbg(1, debug, &dev->v4l2_dev,
+			 "%s: Waiting for buffers to be returned - %d outstanding\n",
+			 __func__, atomic_read(&node->port->buffers_with_vpu));
+		ret = wait_for_completion_timeout(&dev->frame_cmplt,
+						  COMPLETE_TIMEOUT);
+		if (ret <= 0) {
+			v4l2_err(&dev->v4l2_dev,
+				 "%s: Timeout waiting for buffers to be returned - %d outstanding\n",
+				 __func__,
+				 atomic_read(&node->port->buffers_with_vpu));
+			break;
+		}
+	}
+
+	atomic_dec(&dev->num_streaming);
+	/* If all ports disabled, then disable the component */
+	if (atomic_read(&dev->num_streaming) == 0) {
+		bcm2835_isp_params_drop_ls_ref(dev->params);
+		ret = vchiq_mmal_component_disable(dev->mmal_instance,
+						   dev->component);
+		if (ret) {
+			v4l2_err(&dev->v4l2_dev,
+				 "%s: Failed disabling component, ret %d\n",
+				 __func__, ret);
+		}
+	}
+
+	/*
+	 * Simply wait for any vb2 buffers to finish. We could take steps to
+	 * make them complete more quickly if we care, or even return them
+	 * ourselves.
+	 */
+	vb2_wait_for_all_buffers(&node->queue);
+}
+
+static const struct vb2_ops bcm2835_isp_node_queue_ops = {
+	.queue_setup		= bcm2835_isp_node_queue_setup,
+	.buf_init		= bcm2835_isp_buf_init,
+	.buf_prepare		= bcm2835_isp_buf_prepare,
+	.buf_queue		= bcm2835_isp_node_buffer_queue,
+	.buf_cleanup		= bcm2835_isp_buffer_cleanup,
+	.start_streaming	= bcm2835_isp_node_start_streaming,
+	.stop_streaming		= bcm2835_isp_node_stop_streaming,
+};
+
+static const
+struct bcm2835_isp_fmt *get_default_format(struct bcm2835_isp_node *node)
+{
+	return node->supported_fmts[0];
+}
+
+static inline unsigned int get_bytesperline(int width,
+					    const struct bcm2835_isp_fmt *fmt)
+{
+	/* GPU aligns 24bpp images to a multiple of 32 pixels (not bytes). */
+	if (fmt->depth == 24)
+		return ALIGN(width, 32) * 3;
+	else
+		return ALIGN((width * fmt->depth) >> 3, fmt->bytesperline_align);
+}
+
+static inline unsigned int get_sizeimage(int bpl, int width, int height,
+					 const struct bcm2835_isp_fmt *fmt)
+{
+	return (bpl * height * fmt->size_multiplier_x2) >> 1;
+}
+
+static const struct v4l2_file_operations bcm2835_isp_fops = {
+	.owner		= THIS_MODULE,
+	.open		= v4l2_fh_open,
+	.release	= vb2_fop_release,
+	.poll		= vb2_fop_poll,
+	.unlocked_ioctl = video_ioctl2,
+	.mmap		= vb2_fop_mmap
+};
+
+static int populate_qdata_fmt(struct v4l2_format *f,
+			      struct bcm2835_isp_node *node)
+{
+	struct bcm2835_isp_dev *dev = node_get_dev(node);
+	struct bcm2835_isp_q_data *q_data = &node->q_data;
+	int ret;
+
+	if (!node_is_stats(node)) {
+		v4l2_dbg(1, debug, &dev->v4l2_dev,
+			 "%s: Setting pix format for type %d, wxh: %ux%u, fmt: %08x, size %u\n",
+			 __func__, f->type, f->fmt.pix.width, f->fmt.pix.height,
+			 f->fmt.pix.pixelformat, f->fmt.pix.sizeimage);
+
+		q_data->fmt = find_format(f, node);
+		q_data->width = f->fmt.pix.width;
+		q_data->height = f->fmt.pix.height;
+		q_data->height = f->fmt.pix.height;
+
+		/* All parameters should have been set correctly by try_fmt */
+		q_data->bytesperline = f->fmt.pix.bytesperline;
+		q_data->sizeimage = f->fmt.pix.sizeimage;
+		q_data->ycbcr_enc = f->fmt.pix.ycbcr_enc;
+		q_data->xfer_func = f->fmt.pix.xfer_func;
+		q_data->quantization = f->fmt.pix.quantization;
+
+		/* We must indicate which of the allowed colour spaces we have. */
+		q_data->colorspace = f->fmt.pix.colorspace;
+	} else {
+		v4l2_dbg(1, debug, &dev->v4l2_dev,
+			 "%s: Setting meta format for fmt: %08x, size %u\n",
+			 __func__, f->fmt.meta.dataformat,
+			 f->fmt.meta.buffersize);
+
+		q_data->fmt = find_format(f, node);
+		q_data->width = 0;
+		q_data->height = 0;
+		q_data->bytesperline = 0;
+		q_data->sizeimage = f->fmt.meta.buffersize;
+
+		/* This won't mean anything for metadata, but may as well fill it in. */
+		q_data->colorspace = V4L2_COLORSPACE_DEFAULT;
+	}
+
+	v4l2_dbg(1, debug, &dev->v4l2_dev,
+		 "%s: Calculated bpl as %u, size %u\n", __func__,
+		 q_data->bytesperline, q_data->sizeimage);
+
+	setup_mmal_port_format(node, node->port);
+	ret = vchiq_mmal_port_set_format(dev->mmal_instance, node->port);
+	if (ret) {
+		v4l2_err(&dev->v4l2_dev,
+			 "%s: Failed vchiq_mmal_port_set_format on port, ret %d\n",
+			 __func__, ret);
+		ret = -EINVAL;
+	}
+
+	if (q_data->sizeimage < node->port->minimum_buffer.size) {
+		v4l2_err(&dev->v4l2_dev,
+			 "%s: Current buffer size of %u < min buf size %u - driver mismatch to MMAL\n",
+			 __func__,
+			 q_data->sizeimage,
+			 node->port->minimum_buffer.size);
+	}
+
+	v4l2_dbg(1, debug, &dev->v4l2_dev,
+		 "%s: Set format for type %d, wxh: %dx%d, fmt: %08x, size %u\n",
+		 __func__, f->type, q_data->width, q_data->height,
+		 q_data->fmt->fourcc, q_data->sizeimage);
+
+	return ret;
+}
+
+int bcm2835_isp_node_querycap(struct file *file, void *priv,
+			      struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, BCM2835_ISP_NAME, sizeof(cap->driver));
+	strscpy(cap->card, BCM2835_ISP_NAME, sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
+		 BCM2835_ISP_NAME);
+
+	return 0;
+}
+
+static int bcm2835_isp_node_g_fmt(struct file *file, void *priv,
+				  struct v4l2_format *f)
+{
+	struct bcm2835_isp_node *node = video_drvdata(file);
+
+	if (f->type != node->queue.type)
+		return -EINVAL;
+
+	if (node_is_stats(node)) {
+		f->fmt.meta.dataformat = V4L2_META_FMT_BCM2835_ISP_STATS;
+		f->fmt.meta.buffersize =
+			node->port->minimum_buffer.size;
+	} else {
+		struct bcm2835_isp_q_data *q_data = &node->q_data;
+
+		f->fmt.pix.width = q_data->width;
+		f->fmt.pix.height = q_data->height;
+		f->fmt.pix.field = V4L2_FIELD_NONE;
+		f->fmt.pix.pixelformat = q_data->fmt->fourcc;
+		f->fmt.pix.bytesperline = q_data->bytesperline;
+		f->fmt.pix.sizeimage = q_data->sizeimage;
+		f->fmt.pix.colorspace = q_data->colorspace;
+		f->fmt.pix.ycbcr_enc = q_data->ycbcr_enc;
+		f->fmt.pix.xfer_func = q_data->xfer_func;
+		f->fmt.pix.quantization = q_data->quantization;
+	}
+
+	return 0;
+}
+
+static int bcm2835_isp_node_enum_fmt(struct file *file, void  *priv,
+				     struct v4l2_fmtdesc *f)
+{
+	struct bcm2835_isp_node *node = video_drvdata(file);
+
+	if (f->type != node->queue.type)
+		return -EINVAL;
+
+	if (f->index < node->num_supported_fmts) {
+		/* Format found */
+		f->pixelformat = node->supported_fmts[f->index]->fourcc;
+		f->flags = 0;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int bcm2835_isp_enum_framesizes(struct file *file, void *priv,
+				       struct v4l2_frmsizeenum *fsize)
+{
+	struct bcm2835_isp_node *node = video_drvdata(file);
+	struct bcm2835_isp_dev *dev = node_get_dev(node);
+	const struct bcm2835_isp_fmt *fmt;
+
+	if (node_is_stats(node) || fsize->index)
+		return -EINVAL;
+
+	fmt = find_format_by_fourcc(fsize->pixel_format, node);
+	if (!fmt) {
+		v4l2_err(&dev->v4l2_dev, "Invalid pixel code: %x\n",
+			 fsize->pixel_format);
+		return -EINVAL;
+	}
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise.min_width = MIN_DIM;
+	fsize->stepwise.max_width = MAX_DIM;
+	fsize->stepwise.step_width = fmt->step_size;
+
+	fsize->stepwise.min_height = MIN_DIM;
+	fsize->stepwise.max_height = MAX_DIM;
+	fsize->stepwise.step_height = fmt->step_size;
+
+	return 0;
+}
+
+static int bcm2835_isp_node_try_fmt(struct file *file, void *priv,
+				    struct v4l2_format *f)
+{
+	struct bcm2835_isp_node *node = video_drvdata(file);
+	const struct bcm2835_isp_fmt *fmt;
+
+	if (f->type != node->queue.type)
+		return -EINVAL;
+
+	fmt = find_format(f, node);
+	if (!fmt)
+		fmt = get_default_format(node);
+
+	if (!node_is_stats(node)) {
+		bool is_rgb;
+
+		f->fmt.pix.width = max(min(f->fmt.pix.width, MAX_DIM),
+				       MIN_DIM);
+		f->fmt.pix.height = max(min(f->fmt.pix.height, MAX_DIM),
+					MIN_DIM);
+
+		f->fmt.pix.pixelformat = fmt->fourcc;
+
+		/*
+		 * Fill in the actual colour space when the requested one was
+		 * not supported. This also catches the case when the "default"
+		 * colour space was requested (as that's never in the mask).
+		 */
+		if (!(V4L2_COLORSPACE_MASK(f->fmt.pix.colorspace) & fmt->colorspace_mask))
+			f->fmt.pix.colorspace = fmt->colorspace_default;
+		/* In all cases, we only support the defaults for these: */
+		f->fmt.pix.ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(f->fmt.pix.colorspace);
+		f->fmt.pix.xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(f->fmt.pix.colorspace);
+		/* RAW counts as sRGB here so that we get full range. */
+		is_rgb = f->fmt.pix.colorspace == V4L2_COLORSPACE_SRGB ||
+			f->fmt.pix.colorspace == V4L2_COLORSPACE_RAW;
+		f->fmt.pix.quantization = V4L2_MAP_QUANTIZATION_DEFAULT(is_rgb,
+									f->fmt.pix.colorspace,
+									f->fmt.pix.ycbcr_enc);
+
+		/* Respect any stride value (suitably aligned) that was requested. */
+		f->fmt.pix.bytesperline = max(get_bytesperline(f->fmt.pix.width, fmt),
+					      ALIGN(f->fmt.pix.bytesperline,
+						    fmt->bytesperline_align));
+		f->fmt.pix.field = V4L2_FIELD_NONE;
+		f->fmt.pix.sizeimage =
+			get_sizeimage(f->fmt.pix.bytesperline, f->fmt.pix.width,
+				      f->fmt.pix.height, fmt);
+	} else {
+		f->fmt.meta.dataformat = fmt->fourcc;
+		f->fmt.meta.buffersize = node->port->minimum_buffer.size;
+	}
+
+	return 0;
+}
+
+static int bcm2835_isp_node_s_fmt(struct file *file, void *priv,
+				  struct v4l2_format *f)
+{
+	struct bcm2835_isp_node *node = video_drvdata(file);
+	int ret;
+
+	if (f->type != node->queue.type)
+		return -EINVAL;
+
+	ret = bcm2835_isp_node_try_fmt(file, priv, f);
+	if (ret)
+		return ret;
+
+	v4l2_dbg(1, debug, &node_get_dev(node)->v4l2_dev,
+		 "%s: Set format for node %s[%d]\n",
+		 __func__, node->name, node->id);
+
+	return populate_qdata_fmt(f, node);
+}
+
+static int bcm2835_isp_node_s_selection(struct file *file, void *fh,
+					struct v4l2_selection *s)
+{
+	struct mmal_parameter_crop crop;
+	struct bcm2835_isp_node *node = video_drvdata(file);
+	struct bcm2835_isp_dev *dev = node_get_dev(node);
+
+	if (!node_is_output(node))
+		return -EINVAL;
+
+	if (!s->r.width || !s->r.height)
+		return -EINVAL;
+
+	/* We can only set crop on the input. */
+	switch (s->target) {
+	case V4L2_SEL_TGT_CROP:
+		/*
+		 * Adjust the crop window if it goes outside of the frame
+		 * dimensions.
+		 */
+		s->r.left = min((unsigned int)max(s->r.left, 0),
+				node->q_data.width - MIN_DIM);
+		s->r.top = min((unsigned int)max(s->r.top, 0),
+			       node->q_data.height - MIN_DIM);
+		s->r.width = max(min(s->r.width,
+				     node->q_data.width - s->r.left), MIN_DIM);
+		s->r.height = max(min(s->r.height,
+				      node->q_data.height - s->r.top), MIN_DIM);
+		break;
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		/* Default (i.e. no) crop window. */
+		s->r.left = 0;
+		s->r.top = 0;
+		s->r.width = node->q_data.width;
+		s->r.height = node->q_data.height;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	crop.rect.x = s->r.left;
+	crop.rect.y = s->r.top;
+	crop.rect.width = s->r.width;
+	crop.rect.height = s->r.height;
+
+	return vchiq_mmal_port_parameter_set(dev->mmal_instance, node->port,
+					     MMAL_PARAMETER_CROP,
+					     &crop, sizeof(crop));
+}
+
+static int bcm2835_isp_node_g_selection(struct file *file, void *fh,
+					struct v4l2_selection *s)
+{
+	struct mmal_parameter_crop crop;
+	struct bcm2835_isp_node *node = video_drvdata(file);
+	struct bcm2835_isp_dev *dev = node_get_dev(node);
+	u32 crop_size = sizeof(crop);
+	int ret;
+
+	if (!node_is_output(node))
+		return -EINVAL;
+
+	/* We can only return out an input crop. */
+	switch (s->target) {
+	case V4L2_SEL_TGT_CROP:
+		ret = vchiq_mmal_port_parameter_get(dev->mmal_instance,
+						    node->port,
+						    MMAL_PARAMETER_CROP,
+						    &crop, &crop_size);
+		if (!ret) {
+			s->r.left = crop.rect.x;
+			s->r.top = crop.rect.y;
+			s->r.width = crop.rect.width;
+			s->r.height = crop.rect.height;
+		}
+		break;
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		/* Default (i.e. no) crop window. */
+		s->r.left = 0;
+		s->r.top = 0;
+		s->r.width = node->q_data.width;
+		s->r.height = node->q_data.height;
+		ret = 0;
+		break;
+	default:
+		ret =  -EINVAL;
+	}
+
+	return ret;
+}
+
+static const struct v4l2_ioctl_ops bcm2835_isp_node_ioctl_ops = {
+	.vidioc_querycap		= bcm2835_isp_node_querycap,
+	.vidioc_g_fmt_vid_cap		= bcm2835_isp_node_g_fmt,
+	.vidioc_g_fmt_vid_out		= bcm2835_isp_node_g_fmt,
+	.vidioc_g_fmt_meta_cap		= bcm2835_isp_node_g_fmt,
+	.vidioc_s_fmt_vid_cap		= bcm2835_isp_node_s_fmt,
+	.vidioc_s_fmt_vid_out		= bcm2835_isp_node_s_fmt,
+	.vidioc_s_fmt_meta_cap		= bcm2835_isp_node_s_fmt,
+	.vidioc_try_fmt_vid_cap		= bcm2835_isp_node_try_fmt,
+	.vidioc_try_fmt_vid_out		= bcm2835_isp_node_try_fmt,
+	.vidioc_try_fmt_meta_cap	= bcm2835_isp_node_try_fmt,
+	.vidioc_s_selection		= bcm2835_isp_node_s_selection,
+	.vidioc_g_selection		= bcm2835_isp_node_g_selection,
+
+	.vidioc_enum_fmt_vid_cap	= bcm2835_isp_node_enum_fmt,
+	.vidioc_enum_fmt_vid_out	= bcm2835_isp_node_enum_fmt,
+	.vidioc_enum_fmt_meta_cap	= bcm2835_isp_node_enum_fmt,
+	.vidioc_enum_framesizes		= bcm2835_isp_enum_framesizes,
+
+	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
+	.vidioc_querybuf		= vb2_ioctl_querybuf,
+	.vidioc_qbuf			= vb2_ioctl_qbuf,
+	.vidioc_dqbuf			= vb2_ioctl_dqbuf,
+	.vidioc_expbuf			= vb2_ioctl_expbuf,
+	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
+
+	.vidioc_streamon		= vb2_ioctl_streamon,
+	.vidioc_streamoff		= vb2_ioctl_streamoff,
+};
+
+/*
+ * Size of the array to provide to the VPU when asking for the list of supported
+ * formats.
+ *
+ * The ISP component currently advertises 62 input formats, so add a small
+ * overhead on that. Should the component advertise more formats then the excess
+ * will be dropped and a warning logged.
+ */
+#define MAX_SUPPORTED_ENCODINGS 70
+
+/* Populate node->supported_fmts with the formats supported by those ports. */
+static int bcm2835_isp_get_supported_fmts(struct bcm2835_isp_node *node)
+{
+	struct bcm2835_isp_dev *dev = node_get_dev(node);
+	struct bcm2835_isp_fmt const **list;
+	unsigned int i, j, num_encodings;
+	u32 fourccs[MAX_SUPPORTED_ENCODINGS];
+	u32 param_size = sizeof(fourccs);
+	int ret;
+
+	ret = vchiq_mmal_port_parameter_get(dev->mmal_instance, node->port,
+					    MMAL_PARAMETER_SUPPORTED_ENCODINGS,
+					    &fourccs, &param_size);
+
+	if (ret) {
+		if (ret == MMAL_MSG_STATUS_ENOSPC) {
+			v4l2_err(&dev->v4l2_dev,
+				 "%s: port has more encodings than we provided space for. Some are dropped (%zu vs %u).\n",
+				 __func__, param_size / sizeof(u32),
+				 MAX_SUPPORTED_ENCODINGS);
+			num_encodings = MAX_SUPPORTED_ENCODINGS;
+		} else {
+			v4l2_err(&dev->v4l2_dev, "%s: get_param ret %u.\n",
+				 __func__, ret);
+			return -EINVAL;
+		}
+	} else {
+		num_encodings = param_size / sizeof(u32);
+	}
+
+	/*
+	 * Assume at this stage that all encodings will be supported in V4L2.
+	 * Any that aren't supported will waste a very small amount of memory.
+	 */
+	list = devm_kzalloc(dev->dev,
+			    sizeof(struct bcm2835_isp_fmt *) * num_encodings,
+			    GFP_KERNEL);
+	if (!list)
+		return -ENOMEM;
+	node->supported_fmts = list;
+
+	for (i = 0, j = 0; i < num_encodings; i++) {
+		const struct bcm2835_isp_fmt *fmt = get_fmt(fourccs[i]);
+
+		if (fmt) {
+			list[j] = fmt;
+			j++;
+		}
+	}
+	node->num_supported_fmts = j;
+
+	return 0;
+}
+
+/*
+ * Register a device node /dev/video<N> to go along with one of the ISP's input
+ * or output nodes.
+ */
+static int bcm2835_isp_register_node(struct bcm2835_isp_dev *dev,
+				     unsigned int instance,
+				     struct bcm2835_isp_node *node, int index)
+{
+	struct video_device *vfd;
+	struct vb2_queue *queue;
+	bool is_rgb;
+	int ret;
+
+	mutex_init(&node->lock);
+	mutex_init(&node->queue_lock);
+
+	node->dev = dev;
+	vfd = &node->vfd;
+	queue = &node->queue;
+	queue->type = index_to_queue_type(index);
+	/*
+	 * Setup the node type-specific params.
+	 */
+	switch (queue->type) {
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
+		vfd->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
+		node->id = index;
+		node->vfl_dir = VFL_DIR_TX;
+		node->name = "output";
+		node->port = &dev->component->input[node->id];
+		break;
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
+		vfd->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+		/* First Capture node starts at id 0, etc. */
+		node->id = index - BCM2835_ISP_NUM_OUTPUTS;
+		node->vfl_dir = VFL_DIR_RX;
+		node->name = "capture";
+		node->port = &dev->component->output[node->id];
+		break;
+	case V4L2_BUF_TYPE_META_CAPTURE:
+		vfd->device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;
+		node->id = index - BCM2835_ISP_NUM_OUTPUTS;
+		node->vfl_dir = VFL_DIR_RX;
+		node->name = "stats";
+		node->port = &dev->component->output[node->id];
+		break;
+	}
+
+	ret = bcm2835_isp_get_supported_fmts(node);
+	if (ret)
+		return ret;
+
+	/* Initialise the video node. */
+	vfd->vfl_type	= VFL_TYPE_VIDEO;
+	vfd->fops	= &bcm2835_isp_fops,
+	vfd->ioctl_ops	= &bcm2835_isp_node_ioctl_ops,
+	vfd->minor	= -1,
+	vfd->release	= video_device_release_empty,
+	vfd->queue	= &node->queue;
+	vfd->lock	= &node->lock;
+	vfd->v4l2_dev	= &dev->v4l2_dev;
+	vfd->vfl_dir	= node->vfl_dir;
+
+	node->q_data.fmt = get_default_format(node);
+	node->q_data.width = DEFAULT_DIM;
+	node->q_data.height = DEFAULT_DIM;
+	node->q_data.bytesperline =
+		get_bytesperline(DEFAULT_DIM, node->q_data.fmt);
+	node->q_data.sizeimage = node_is_stats(node) ?
+				 node->port->recommended_buffer.size :
+				 get_sizeimage(node->q_data.bytesperline,
+					       node->q_data.width,
+					       node->q_data.height,
+					       node->q_data.fmt);
+	node->q_data.colorspace = node->q_data.fmt->colorspace_default;
+	node->q_data.ycbcr_enc =
+		V4L2_MAP_YCBCR_ENC_DEFAULT(node->q_data.colorspace);
+	node->q_data.xfer_func =
+		V4L2_MAP_XFER_FUNC_DEFAULT(node->q_data.colorspace);
+	is_rgb = node->q_data.colorspace == V4L2_COLORSPACE_SRGB ||
+		node->q_data.colorspace == V4L2_COLORSPACE_RAW;
+	node->q_data.quantization = V4L2_MAP_QUANTIZATION_DEFAULT(is_rgb,
+								  node->q_data.colorspace,
+								  node->q_data.ycbcr_enc);
+
+	queue->io_modes = VB2_MMAP | VB2_DMABUF;
+	queue->drv_priv = node;
+	queue->ops = &bcm2835_isp_node_queue_ops;
+	queue->mem_ops = &vb2_dma_contig_memops;
+	queue->buf_struct_size = sizeof(struct bcm2835_isp_buffer);
+	queue->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	queue->dev = dev->dev;
+	queue->lock = &node->queue_lock;
+
+	ret = vb2_queue_init(queue);
+	if (ret < 0) {
+		v4l2_info(&dev->v4l2_dev, "vb2_queue_init failed\n");
+		return ret;
+	}
+
+	/* Define the device names */
+	snprintf(vfd->name, sizeof(node->vfd.name), "%s-%s%d", BCM2835_ISP_NAME,
+		 node->name, node->id);
+
+	node->pad.flags = node_is_output(node) ? MEDIA_PAD_FL_SOURCE : MEDIA_PAD_FL_SINK;
+	ret = media_entity_pads_init(&node->vfd.entity, 1, &node->pad);
+	if (ret)
+		goto queue_cleanup;
+
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, video_nr[instance]);
+	if (ret) {
+		v4l2_err(&dev->v4l2_dev,
+			 "Failed to register video %s[%d] device node\n",
+			 node->name, node->id);
+		goto queue_cleanup;
+	}
+
+	node->registered = true;
+	video_set_drvdata(vfd, node);
+
+	v4l2_info(&dev->v4l2_dev,
+		  "Device node %s[%d] registered as /dev/video%d\n",
+		  node->name, node->id, vfd->num);
+
+	return 0;
+
+queue_cleanup:
+	vb2_queue_release(&node->queue);
+	return ret;
+}
+
+/* Unregister one of the /dev/video<N> nodes associated with the ISP. */
+static void bcm2835_unregister_node(struct bcm2835_isp_node *node)
+{
+	struct bcm2835_isp_dev *dev = node_get_dev(node);
+
+	v4l2_info(&dev->v4l2_dev,
+		  "Unregistering node %s[%d] device node /dev/video%d\n",
+		  node->name, node->id, node->vfd.num);
+
+	if (node->registered) {
+		video_unregister_device(&node->vfd);
+		vb2_queue_release(&node->queue);
+	}
+
+	/*
+	 * node->supported_fmts.list is free'd automatically
+	 * as a managed resource.
+	 */
+	node->supported_fmts = NULL;
+	node->num_supported_fmts = 0;
+	node->registered = false;
+}
+
+static void media_controller_unregister(struct bcm2835_isp_dev *dev)
+{
+	v4l2_info(&dev->v4l2_dev, "Unregister from media controller\n");
+
+	if (dev->media_device_registered) {
+		media_device_unregister(&dev->mdev);
+		media_device_cleanup(&dev->mdev);
+		dev->media_device_registered = false;
+	}
+
+	kfree(dev->entity.name);
+	dev->entity.name = NULL;
+
+	if (dev->media_entity_registered) {
+		media_device_unregister_entity(&dev->entity);
+		dev->media_entity_registered = false;
+	}
+
+	dev->v4l2_dev.mdev = NULL;
+}
+
+static int media_controller_register(struct bcm2835_isp_dev *dev)
+{
+	struct media_entity *entity;
+	char *name;
+	unsigned int i;
+	int ret;
+
+	v4l2_dbg(2, debug, &dev->v4l2_dev, "Registering with media controller\n");
+
+	name = kmalloc(BCM2835_ISP_ENTITY_NAME_LEN, GFP_KERNEL);
+	if (!name) {
+		ret = -ENOMEM;
+		goto done;
+	}
+	snprintf(name, BCM2835_ISP_ENTITY_NAME_LEN, "bcm2835-isp");
+	dev->entity.name = name;
+	dev->entity.obj_type = MEDIA_ENTITY_TYPE_BASE;
+	dev->entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
+
+	for (i = 0; i < BCM2835_ISP_NUM_NODES; i++) {
+		dev->pad[i].flags = node_is_output(&dev->node[i]) ?
+					MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
+	}
+	dev->pad[BCM2835_ISP_PARAMS_PAD].flags = MEDIA_PAD_FL_SINK;
+
+	ret = media_entity_pads_init(&dev->entity, BCM2835_ISP_NUM_ENTITY_PADS,
+				     dev->pad);
+	if (ret)
+		goto done;
+
+	ret = media_device_register_entity(&dev->mdev, &dev->entity);
+	if (ret)
+		goto done;
+
+	dev->media_entity_registered = true;
+
+	for (i = 0; i < BCM2835_ISP_NUM_NODES; i++) {
+		entity = &dev->node[i].vfd.entity;
+		int output = node_is_output(&dev->node[i]);
+
+		if (output)
+			ret = media_create_pad_link(entity, 0,
+						    &dev->entity, i,
+						    MEDIA_LNK_FL_IMMUTABLE |
+						    MEDIA_LNK_FL_ENABLED);
+		else
+			ret = media_create_pad_link(&dev->entity, i,
+						    entity, 0,
+						    MEDIA_LNK_FL_IMMUTABLE |
+						    MEDIA_LNK_FL_ENABLED);
+		if (ret)
+			goto done;
+	}
+
+	entity = &dev->params->vdev.entity;
+	ret = media_create_pad_link(entity, 0, &dev->entity, BCM2835_ISP_PARAMS_PAD,
+				    MEDIA_LNK_FL_IMMUTABLE |
+				    MEDIA_LNK_FL_ENABLED);
+	if (ret)
+		goto done;
+
+	ret = media_device_register(&dev->mdev);
+	if (!ret)
+		dev->media_device_registered = true;
+done:
+	return ret;
+}
+
+static void bcm2835_isp_remove_instance(struct bcm2835_isp_dev *dev)
+{
+	unsigned int i;
+
+	bcm2835_isp_params_unregister(dev->params);
+
+	for (i = 0; i < BCM2835_ISP_NUM_NODES; i++)
+		bcm2835_unregister_node(&dev->node[i]);
+
+	v4l2_device_unregister(&dev->v4l2_dev);
+	media_controller_unregister(dev);
+
+	if (dev->component)
+		vchiq_mmal_component_finalise(dev->mmal_instance,
+					      dev->component);
+
+	vchiq_mmal_finalise(dev->mmal_instance);
+}
+
+static int bcm2835_isp_probe_instance(struct vchiq_device *device,
+				      struct bcm2835_isp_dev **dev_int,
+				      unsigned int instance)
+{
+	struct bcm2835_isp_dev *dev;
+	unsigned int i;
+	int ret;
+
+	dev = devm_kzalloc(&device->dev, sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
+	*dev_int = dev;
+	dev->dev = &device->dev;
+	dev->mdev.dev = &device->dev;
+
+	strscpy(dev->mdev.model, BCM2835_ISP_NAME, sizeof(dev->mdev.model));
+	snprintf(dev->mdev.bus_info, sizeof(dev->mdev.bus_info), "platform:%s",
+		 BCM2835_ISP_NAME);
+	media_device_init(&dev->mdev);
+
+	dev->v4l2_dev.mdev = &dev->mdev;
+
+	ret = v4l2_device_register(&device->dev, &dev->v4l2_dev);
+	if (ret)
+		return ret;
+
+	ret = vchiq_mmal_init(&device->dev, &dev->mmal_instance);
+	if (ret) {
+		v4l2_device_unregister(&dev->v4l2_dev);
+		return ret;
+	}
+
+	ret = vchiq_mmal_component_init(dev->mmal_instance, "ril.isp",
+					&dev->component);
+	if (ret) {
+		v4l2_err(&dev->v4l2_dev,
+			 "%s: failed to create ril.isp component\n", __func__);
+		return ret;
+	}
+
+	if (dev->component->inputs < BCM2835_ISP_NUM_OUTPUTS ||
+	    dev->component->outputs < BCM2835_ISP_NUM_CAPTURES +
+					BCM2835_ISP_NUM_METADATA) {
+		v4l2_err(&dev->v4l2_dev,
+			 "%s: ril.isp returned %d i/p (%d expected), %d o/p (%d expected) ports\n",
+			  __func__, dev->component->inputs,
+			  BCM2835_ISP_NUM_OUTPUTS,
+			  dev->component->outputs,
+			  BCM2835_ISP_NUM_CAPTURES + BCM2835_ISP_NUM_METADATA);
+		return -EINVAL;
+	}
+
+	atomic_set(&dev->num_streaming, 0);
+
+	for (i = 0; i < BCM2835_ISP_NUM_NODES; i++) {
+		struct bcm2835_isp_node *node = &dev->node[i];
+
+		ret = bcm2835_isp_register_node(dev, instance, node, i);
+		if (ret)
+			return ret;
+	}
+
+	/* Register extensible params node */
+	dev->params = bcm2835_isp_params_register(&dev->v4l2_dev, dev->dev,
+						  dev->mmal_instance,
+						  &dev->component->input[0],
+						  video_nr[instance] + BCM2835_ISP_NUM_NODES);
+	if (IS_ERR(dev->params))
+		return PTR_ERR(dev->params);
+
+	ret = media_controller_register(dev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void bcm2835_isp_remove(struct vchiq_device *device)
+{
+	struct bcm2835_isp_dev **bcm2835_isp_instances;
+	unsigned int i;
+
+	bcm2835_isp_instances = vchiq_get_drvdata(device);
+	for (i = 0; i < BCM2835_ISP_NUM_INSTANCES; i++) {
+		if (bcm2835_isp_instances[i])
+			bcm2835_isp_remove_instance(bcm2835_isp_instances[i]);
+	}
+}
+
+static int bcm2835_isp_probe(struct vchiq_device *device)
+{
+	struct bcm2835_isp_dev **bcm2835_isp_instances;
+	unsigned int i;
+	int ret;
+
+	ret = dma_set_mask_and_coherent(&device->dev, DMA_BIT_MASK(32));
+	if (ret) {
+		dev_err(&device->dev, "dma_set_mask_and_coherent failed: %d\n",
+			ret);
+		return ret;
+	}
+
+	bcm2835_isp_instances = devm_kzalloc(&device->dev,
+					     sizeof(bcm2835_isp_instances) *
+						      BCM2835_ISP_NUM_INSTANCES,
+					     GFP_KERNEL);
+	if (!bcm2835_isp_instances)
+		return -ENOMEM;
+
+	vchiq_set_drvdata(device, bcm2835_isp_instances);
+
+	for (i = 0; i < BCM2835_ISP_NUM_INSTANCES; i++) {
+		ret = bcm2835_isp_probe_instance(device,
+						 &bcm2835_isp_instances[i], i);
+		if (ret)
+			goto error;
+	}
+
+	dev_info(&device->dev, "Loaded V4L2 %s\n", BCM2835_ISP_NAME);
+	return 0;
+
+error:
+	bcm2835_isp_remove(device);
+
+	return ret;
+}
+
+static struct vchiq_device_id device_id_table[] = {
+	{ .name = "bcm2835-isp" },
+	{}
+};
+MODULE_DEVICE_TABLE(vchiq, device_id_table);
+
+static struct vchiq_driver bcm2835_isp_drv = {
+	.probe = bcm2835_isp_probe,
+	.remove = bcm2835_isp_remove,
+	.id_table = device_id_table,
+	.driver = {
+		.name = BCM2835_ISP_NAME,
+	},
+};
+
+module_vchiq_driver(bcm2835_isp_drv);
+
+MODULE_DESCRIPTION("BCM2835 ISP driver");
+MODULE_AUTHOR("Naushir Patuck <naush@raspberrypi.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 98512ea4cc5b9d725e1851af2ed38df85bb4fa8c..57288d25161fc37c94df5a1a6b21c2452ca65374 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1488,6 +1488,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_GENERIC_CSI2_16:	descr = "8-bit Generic Meta, 16b CSI-2"; break;
 	case V4L2_META_FMT_GENERIC_CSI2_20:	descr = "8-bit Generic Meta, 20b CSI-2"; break;
 	case V4L2_META_FMT_GENERIC_CSI2_24:	descr = "8-bit Generic Meta, 24b CSI-2"; break;
+	case V4L2_META_FMT_BCM2835_ISP_STATS: descr = "BCM2835 ISP Image Statistics"; break;
+	case V4L2_META_FMT_BCM2835_ISP_PARAMS: descr = "BCM2835 ISP Config Parameters"; break;
 
 	default:
 		/* Compressed formats */
diff --git a/include/uapi/linux/bcm2835-isp.h b/include/uapi/linux/bcm2835-isp.h
new file mode 100644
index 0000000000000000000000000000000000000000..85b7f56edf5a20bdca5749aa085331aae5818e2f
--- /dev/null
+++ b/include/uapi/linux/bcm2835-isp.h
@@ -0,0 +1,530 @@
+/* SPDX-License-Identifier: ((GPL-2.0+ WITH Linux-syscall-note) OR BSD-3-Clause) */
+/*
+ * bcm2835-isp.h
+ *
+ * BCM2835 ISP driver - user space header file.
+ *
+ * Copyright © 2019-2026 Raspberry Pi (Trading) Ltd.
+ *
+ * Author: Naushir Patuck (naush@raspberrypi.com)
+ *
+ */
+
+#ifndef __BCM2835_ISP_H_
+#define __BCM2835_ISP_H_
+
+#include <linux/media/v4l2-isp.h>
+
+/*
+ * All structs below are directly mapped onto the equivalent structs in
+ * drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
+ * for convenience.
+ */
+
+/**
+ * struct bcm2835_isp_rational - Rational value type.
+ *
+ * @num:	Numerator.
+ * @den:	Denominator.
+ */
+struct bcm2835_isp_rational {
+	__s32 num;
+	__u32 den;
+};
+
+/**
+ * struct bcm2835_isp_ccm - Colour correction matrix.
+ *
+ * @ccm:	3x3 correction matrix coefficients.
+ * @offsets:	1x3 correction offsets.
+ */
+struct bcm2835_isp_ccm {
+	struct bcm2835_isp_rational ccm[3][3];
+	__s32 offsets[3];
+};
+
+/**
+ * struct bcm2835_isp_custom_ccm - Custom CCM configuration.
+ *
+ * @enabled:	Enable custom CCM.
+ * @ccm:	Custom CCM coefficients and offsets.
+ */
+struct bcm2835_isp_custom_ccm {
+	__u32 enabled;
+	struct bcm2835_isp_ccm ccm;
+};
+
+/**
+ * enum bcm2835_isp_gain_format - format of the gains in the lens shading
+ *				  tables.
+ *
+ * @GAIN_FORMAT_U0P8_1:		Gains are u0.8 format, starting at 1.0
+ * @GAIN_FORMAT_U1P7_0:		Gains are u1.7 format, starting at 0.0
+ * @GAIN_FORMAT_U1P7_1:		Gains are u1.7 format, starting at 1.0
+ * @GAIN_FORMAT_U2P6_0:		Gains are u2.6 format, starting at 0.0
+ * @GAIN_FORMAT_U2P6_1:		Gains are u2.6 format, starting at 1.0
+ * @GAIN_FORMAT_U3P5_0:		Gains are u3.5 format, starting at 0.0
+ * @GAIN_FORMAT_U3P5_1:		Gains are u3.5 format, starting at 1.0
+ * @GAIN_FORMAT_U4P10:		Gains are u4.10 format, starting at 0.0
+ */
+enum bcm2835_isp_gain_format {
+	GAIN_FORMAT_U0P8_1 = 0,
+	GAIN_FORMAT_U1P7_0 = 1,
+	GAIN_FORMAT_U1P7_1 = 2,
+	GAIN_FORMAT_U2P6_0 = 3,
+	GAIN_FORMAT_U2P6_1 = 4,
+	GAIN_FORMAT_U3P5_0 = 5,
+	GAIN_FORMAT_U3P5_1 = 6,
+	GAIN_FORMAT_U4P10  = 7,
+};
+
+/**
+ * struct bcm2835_isp_lens_shading - Lens shading tables.
+ *
+ * @enabled:		Enable lens shading.
+ * @grid_cell_size:	Size of grid cells in samples (16, 32, 64, 128 or 256).
+ * @grid_width:		Width of lens shading tables in grid cells.
+ * @grid_stride:	Row to row distance (in grid cells) between grid cells
+ *			in the same horizontal location.
+ * @grid_height:	Height of lens shading tables in grid cells.
+ * @dmabuf:		dmabuf file handle containing the table.
+ * @ref_transform:	Reference transform - unsupported, please pass zero.
+ * @corner_sampled:	Whether the gains are sampled at the corner points
+ *			of the grid cells or in the cell centres.
+ * @gain_format:	Format of the gains (see enum &bcm2835_isp_gain_format).
+ */
+struct bcm2835_isp_lens_shading {
+	__u32 enabled;
+	__u32 grid_cell_size;
+	__u32 grid_width;
+	__u32 grid_stride;
+	__u32 grid_height;
+	__s32 dmabuf;
+	__u32 ref_transform;
+	__u32 corner_sampled;
+	__u32 gain_format;
+};
+
+/**
+ * struct bcm2835_isp_black_level - Sensor black level configuration.
+ *
+ * @enabled:		Enable black level.
+ * @black_level_r:	Black level for red channel.
+ * @black_level_g:	Black level for green channels.
+ * @black_level_b:	Black level for blue channel.
+ * @padding:		Unused padding.
+ */
+struct bcm2835_isp_black_level {
+	__u32 enabled;
+	__u16 black_level_r;
+	__u16 black_level_g;
+	__u16 black_level_b;
+	__u8 padding[2]; /* Unused */
+};
+
+/**
+ * struct bcm2835_isp_geq - Green equalisation parameters.
+ *
+ * @enabled:	Enable green equalisation.
+ * @offset:	Fixed offset of the green equalisation threshold.
+ * @slope:	Slope of the green equalisation threshold.
+ */
+struct bcm2835_isp_geq {
+	__u32 enabled;
+	__u32 offset;
+	struct bcm2835_isp_rational slope;
+};
+
+#define BCM2835_NUM_GAMMA_PTS 33
+
+/**
+ * struct bcm2835_isp_gamma - Gamma parameters.
+ *
+ * @enabled:	Enable gamma adjustment.
+ * @x:		X values of the points defining the gamma curve.
+ *		Values should be scaled to 16 bits.
+ * @y:		Y values of the points defining the gamma curve.
+ *		Values should be scaled to 16 bits.
+ */
+struct bcm2835_isp_gamma {
+	__u32 enabled;
+	__u16 x[BCM2835_NUM_GAMMA_PTS];
+	__u16 y[BCM2835_NUM_GAMMA_PTS];
+};
+
+/**
+ * enum bcm2835_isp_cdn_mode - Mode of operation for colour denoise.
+ *
+ * @CDN_MODE_FAST:		Fast (but lower quality) colour denoise
+ *				algorithm, typically used for video recording.
+ * @CDN_MODE_HIGH_QUALITY:	High quality (but slower) colour denoise
+ *				algorithm, typically used for stills capture.
+ */
+enum bcm2835_isp_cdn_mode {
+	CDN_MODE_FAST = 0,
+	CDN_MODE_HIGH_QUALITY = 1,
+};
+
+/**
+ * struct bcm2835_isp_cdn - Colour denoise parameters.
+ *
+ * @enabled:	Enable colour denoise.
+ * @mode:	Colour denoise operating mode (see enum &bcm2835_isp_cdn_mode)
+ */
+struct bcm2835_isp_cdn {
+	__u32 enabled;
+	__u32 mode;
+};
+
+/**
+ * struct bcm2835_isp_denoise - Denoise parameters.
+ *
+ * @enabled:	Enable denoise.
+ * @constant:	Fixed offset of the noise threshold.
+ * @slope:	Slope of the noise threshold.
+ * @strength:	Denoise strength between 0.0 (off) and 1.0 (maximum).
+ */
+struct bcm2835_isp_denoise {
+	__u32 enabled;
+	__u32 constant;
+	struct bcm2835_isp_rational slope;
+	struct bcm2835_isp_rational strength;
+};
+
+/**
+ * struct bcm2835_isp_sharpen - Sharpen parameters.
+ *
+ * @enabled:	Enable sharpening.
+ * @threshold:	Threshold at which to start sharpening pixels.
+ * @strength:	Strength with which pixel sharpening increases.
+ * @limit:	Limit to the amount of sharpening applied.
+ */
+struct bcm2835_isp_sharpen {
+	__u32 enabled;
+	struct bcm2835_isp_rational threshold;
+	struct bcm2835_isp_rational strength;
+	struct bcm2835_isp_rational limit;
+};
+
+/**
+ * enum bcm2835_isp_dpc_mode - defective pixel correction (DPC) strength.
+ *
+ * @DPC_MODE_OFF:		No DPC.
+ * @DPC_MODE_NORMAL:		Normal DPC.
+ * @DPC_MODE_STRONG:		Strong DPC.
+ */
+enum bcm2835_isp_dpc_mode {
+	DPC_MODE_OFF = 0,
+	DPC_MODE_NORMAL = 1,
+	DPC_MODE_STRONG = 2,
+};
+
+/**
+ * struct bcm2835_isp_dpc - Defective pixel correction (DPC) parameters.
+ *
+ * @enabled:	Enable DPC.
+ * @strength:	DPC strength (see enum &bcm2835_isp_dpc_mode).
+ */
+struct bcm2835_isp_dpc {
+	__u32 enabled;
+	__u32 strength;
+};
+
+/**
+ * struct bcm2835_isp_awb_gains - AWB gains configuration.
+ *
+ * @r_gain:	Red channel AWB gain.
+ * @b_gain:	Blue channel AWB gain.
+ */
+struct bcm2835_isp_awb_gains {
+	struct bcm2835_isp_rational r_gain;
+	struct bcm2835_isp_rational b_gain;
+};
+
+/**
+ * struct bcm2835_isp_digital_gain - Digital gain configuration.
+ *
+ * @gain:	Digital gain value.
+ */
+struct bcm2835_isp_digital_gain {
+	struct bcm2835_isp_rational gain;
+};
+
+/*
+ * BCM2835 ISP extensible parameters buffer definitions.
+ *
+ * The extensible parameters mechanism allows userspace to submit ISP
+ * configuration parameters as a buffer containing a series of tagged
+ * blocks rather than individual V4L2 controls. This enables atomic
+ * application of multiple parameters in a single operation.
+ */
+
+/**
+ * enum bcm2835_isp_param_buffer_version - BCM2835 ISP parameters buffer version
+ *
+ * @BCM2835_ISP_PARAM_BUFFER_V1: First version of parameters buffer format
+ */
+enum bcm2835_isp_param_buffer_version {
+	BCM2835_ISP_PARAM_BUFFER_V1 = V4L2_ISP_PARAMS_VERSION_V1,
+};
+
+/**
+ * enum bcm2835_isp_param_block_type - BCM2835 ISP parameter block types
+ *
+ * This enumeration defines the types of parameters blocks that can be
+ * included in the extensible parameters buffer. Each block type corresponds
+ * to a specific ISP processing block configuration.
+ *
+ * @BCM2835_ISP_PARAM_BLOCK_BLACK_LEVEL: Black level configuration
+ * @BCM2835_ISP_PARAM_BLOCK_GEQ: Green equalisation configuration
+ * @BCM2835_ISP_PARAM_BLOCK_GAMMA: Gamma curve configuration
+ * @BCM2835_ISP_PARAM_BLOCK_DENOISE: Denoise configuration
+ * @BCM2835_ISP_PARAM_BLOCK_SHARPEN: Sharpening configuration
+ * @BCM2835_ISP_PARAM_BLOCK_DPC: Defective pixel correction configuration
+ * @BCM2835_ISP_PARAM_BLOCK_CDN: Colour denoise configuration
+ * @BCM2835_ISP_PARAM_BLOCK_CC_MATRIX: Colour correction matrix configuration
+ * @BCM2835_ISP_PARAM_BLOCK_LENS_SHADING: Lens shading table configuration
+ * @BCM2835_ISP_PARAM_BLOCK_AWB_GAINS: AWB gains configuration
+ * @BCM2835_ISP_PARAM_BLOCK_DIGITAL_GAIN: Digital gain configuration
+ */
+enum bcm2835_isp_param_block_type {
+	BCM2835_ISP_PARAM_BLOCK_BLACK_LEVEL,
+	BCM2835_ISP_PARAM_BLOCK_GEQ,
+	BCM2835_ISP_PARAM_BLOCK_GAMMA,
+	BCM2835_ISP_PARAM_BLOCK_DENOISE,
+	BCM2835_ISP_PARAM_BLOCK_SHARPEN,
+	BCM2835_ISP_PARAM_BLOCK_DPC,
+	BCM2835_ISP_PARAM_BLOCK_CDN,
+	BCM2835_ISP_PARAM_BLOCK_CC_MATRIX,
+	BCM2835_ISP_PARAM_BLOCK_LENS_SHADING,
+	BCM2835_ISP_PARAM_BLOCK_AWB_GAINS,
+	BCM2835_ISP_PARAM_BLOCK_DIGITAL_GAIN,
+};
+
+/**
+ * struct bcm2835_isp_params_black_level - Black level parameters block
+ *
+ * @header: Block header (type = BCM2835_ISP_PARAM_BLOCK_BLACK_LEVEL)
+ * @black_level: Black level configuration
+ */
+struct bcm2835_isp_params_black_level {
+	struct v4l2_isp_params_block_header header;
+	struct bcm2835_isp_black_level black_level;
+} __attribute__((aligned(8)));
+
+/**
+ * struct bcm2835_isp_params_geq - Green equalisation parameters block
+ *
+ * @header: Block header (type = BCM2835_ISP_PARAM_BLOCK_GEQ)
+ * @geq: Green equalisation configuration
+ */
+struct bcm2835_isp_params_geq {
+	struct v4l2_isp_params_block_header header;
+	struct bcm2835_isp_geq geq;
+} __attribute__((aligned(8)));
+
+/**
+ * struct bcm2835_isp_params_gamma - Gamma parameters block
+ *
+ * @header: Block header (type = BCM2835_ISP_PARAM_BLOCK_GAMMA)
+ * @gamma: Gamma curve configuration
+ */
+struct bcm2835_isp_params_gamma {
+	struct v4l2_isp_params_block_header header;
+	struct bcm2835_isp_gamma gamma;
+} __attribute__((aligned(8)));
+
+/**
+ * struct bcm2835_isp_params_denoise - Denoise parameters block
+ *
+ * @header: Block header (type = BCM2835_ISP_PARAM_BLOCK_DENOISE)
+ * @denoise: Denoise configuration
+ */
+struct bcm2835_isp_params_denoise {
+	struct v4l2_isp_params_block_header header;
+	struct bcm2835_isp_denoise denoise;
+} __attribute__((aligned(8)));
+
+/**
+ * struct bcm2835_isp_params_sharpen - Sharpen parameters block
+ *
+ * @header: Block header (type = BCM2835_ISP_PARAM_BLOCK_SHARPEN)
+ * @sharpen: Sharpening configuration
+ */
+struct bcm2835_isp_params_sharpen {
+	struct v4l2_isp_params_block_header header;
+	struct bcm2835_isp_sharpen sharpen;
+} __attribute__((aligned(8)));
+
+/**
+ * struct bcm2835_isp_params_dpc - Defective pixel correction parameters block
+ *
+ * @header: Block header (type = BCM2835_ISP_PARAM_BLOCK_DPC)
+ * @dpc: DPC configuration
+ */
+struct bcm2835_isp_params_dpc {
+	struct v4l2_isp_params_block_header header;
+	struct bcm2835_isp_dpc dpc;
+} __attribute__((aligned(8)));
+
+/**
+ * struct bcm2835_isp_params_cdn - Colour denoise parameters block
+ *
+ * @header: Block header (type = BCM2835_ISP_PARAM_BLOCK_CDN)
+ * @cdn: Colour denoise configuration
+ */
+struct bcm2835_isp_params_cdn {
+	struct v4l2_isp_params_block_header header;
+	struct bcm2835_isp_cdn cdn;
+} __attribute__((aligned(8)));
+
+/**
+ * struct bcm2835_isp_params_cc_matrix - Colour correction matrix parameters block
+ *
+ * @header: Block header (type = BCM2835_ISP_PARAM_BLOCK_CC_MATRIX)
+ * @ccm: Colour correction matrix configuration
+ */
+struct bcm2835_isp_params_cc_matrix {
+	struct v4l2_isp_params_block_header header;
+	struct bcm2835_isp_custom_ccm ccm;
+} __attribute__((aligned(8)));
+
+/**
+ * struct bcm2835_isp_params_lens_shading - Lens shading parameters block
+ *
+ * @header: Block header (type = BCM2835_ISP_PARAM_BLOCK_LENS_SHADING)
+ * @ls: Lens shading configuration (includes dmabuf fd for table data)
+ */
+struct bcm2835_isp_params_lens_shading {
+	struct v4l2_isp_params_block_header header;
+	struct bcm2835_isp_lens_shading ls;
+} __attribute__((aligned(8)));
+
+/**
+ * struct bcm2835_isp_params_awb_gains - AWB gains parameters block
+ *
+ * @header: Block header (type = BCM2835_ISP_PARAM_BLOCK_AWB_GAINS)
+ * @awb_gains: AWB gains configuration
+ */
+struct bcm2835_isp_params_awb_gains {
+	struct v4l2_isp_params_block_header header;
+	struct bcm2835_isp_awb_gains awb_gains;
+} __attribute__((aligned(8)));
+
+/**
+ * struct bcm2835_isp_params_digital_gain - Digital gain parameters block
+ *
+ * @header: Block header (type = BCM2835_ISP_PARAM_BLOCK_DIGITAL_GAIN)
+ * @digital_gain: Digital gain configuration
+ */
+struct bcm2835_isp_params_digital_gain {
+	struct v4l2_isp_params_block_header header;
+	struct bcm2835_isp_digital_gain digital_gain;
+} __attribute__((aligned(8)));
+
+/**
+ * define BCM2835_ISP_PARAMS_MAX_SIZE - Maximum size of all ISP parameters
+ *
+ * This defines the maximum size needed to accommodate all possible parameter
+ * blocks in a single buffer. Drivers use this to allocate appropriately
+ * sized buffers.
+ */
+#define BCM2835_ISP_PARAMS_MAX_SIZE					\
+	(sizeof(struct bcm2835_isp_params_black_level) +		\
+	 sizeof(struct bcm2835_isp_params_geq) +			\
+	 sizeof(struct bcm2835_isp_params_gamma) +			\
+	 sizeof(struct bcm2835_isp_params_denoise) +			\
+	 sizeof(struct bcm2835_isp_params_sharpen) +			\
+	 sizeof(struct bcm2835_isp_params_dpc) +			\
+	 sizeof(struct bcm2835_isp_params_cdn) +			\
+	 sizeof(struct bcm2835_isp_params_cc_matrix) +			\
+	 sizeof(struct bcm2835_isp_params_lens_shading) +		\
+	 sizeof(struct bcm2835_isp_params_awb_gains) +			\
+	 sizeof(struct bcm2835_isp_params_digital_gain))
+
+/*
+ * ISP statistics structures.
+ *
+ * The bcm2835_isp_stats structure is generated at the output of the
+ * statistics node.  Note that this does not directly map onto the statistics
+ * output of the ISP HW.  Instead, the MMAL firmware code maps the HW statistics
+ * to the bcm2835_isp_stats structure.
+ */
+#define DEFAULT_AWB_REGIONS_X 16
+#define DEFAULT_AWB_REGIONS_Y 12
+
+#define NUM_HISTOGRAMS 2
+#define NUM_HISTOGRAM_BINS 128
+#define AWB_REGIONS (DEFAULT_AWB_REGIONS_X * DEFAULT_AWB_REGIONS_Y)
+#define FLOATING_REGIONS 16
+#define AGC_REGIONS 16
+#define FOCUS_REGIONS 12
+
+/**
+ * struct bcm2835_isp_stats_hist - Histogram statistics
+ *
+ * @r_hist:	Red channel histogram.
+ * @g_hist:	Combined green channel histogram.
+ * @b_hist:	Blue channel histogram.
+ */
+struct bcm2835_isp_stats_hist {
+	__u32 r_hist[NUM_HISTOGRAM_BINS];
+	__u32 g_hist[NUM_HISTOGRAM_BINS];
+	__u32 b_hist[NUM_HISTOGRAM_BINS];
+};
+
+/**
+ * struct bcm2835_isp_stats_region - Region sums.
+ *
+ * @counted:	The number of 2x2 bayer tiles accumulated.
+ * @notcounted:	The number of 2x2 bayer tiles not accumulated.
+ * @r_sum:	Total sum of counted pixels in the red channel for a region.
+ * @g_sum:	Total sum of counted pixels in the green channel for a region.
+ * @b_sum:	Total sum of counted pixels in the blue channel for a region.
+ */
+struct bcm2835_isp_stats_region {
+	__u32 counted;
+	__u32 notcounted;
+	__u64 r_sum;
+	__u64 g_sum;
+	__u64 b_sum;
+};
+
+/**
+ * struct bcm2835_isp_stats_focus - Focus statistics.
+ *
+ * @contrast_val:	Focus measure - accumulated output of the focus filter.
+ *			In the first dimension, index [0] counts pixels below a
+ *			preset threshold, and index [1] counts pixels above the
+ *			threshold.  In the second dimension, index [0] uses the
+ *			first predefined filter, and index [1] uses the second
+ *			predefined filter.
+ * @contrast_val_num:	The number of counted pixels in the above accumulation.
+ */
+struct bcm2835_isp_stats_focus {
+	__u64 contrast_val[2][2];
+	__u32 contrast_val_num[2][2];
+};
+
+/**
+ * struct bcm2835_isp_stats - ISP statistics.
+ *
+ * @version:		Version of the bcm2835_isp_stats structure.
+ * @size:		Size of the bcm2835_isp_stats structure.
+ * @hist:		Histogram statistics for the entire image.
+ * @awb_stats:		Statistics for the regions defined for AWB calculations.
+ * @floating_stats:	Statistics for arbitrarily placed (floating) regions.
+ * @agc_stats:		Statistics for the regions defined for AGC calculations.
+ * @focus_stats:	Focus filter statistics for the focus regions.
+ */
+struct bcm2835_isp_stats {
+	__u32 version;
+	__u32 size;
+	struct bcm2835_isp_stats_hist hist[NUM_HISTOGRAMS];
+	struct bcm2835_isp_stats_region awb_stats[AWB_REGIONS];
+	struct bcm2835_isp_stats_region floating_stats[FLOATING_REGIONS];
+	struct bcm2835_isp_stats_region agc_stats[AGC_REGIONS];
+	struct bcm2835_isp_stats_focus focus_stats[FOCUS_REGIONS];
+};
+
+#endif /* __BCM2835_ISP_H_ */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index add08188f06890182a5c399a223c1ab0a546cae1..d9d15f2133e6b03a3e657f5a9b5c29491afcc7b4 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -869,6 +869,8 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
 #define V4L2_META_FMT_UVC_MSXU_1_5  v4l2_fourcc('U', 'V', 'C', 'M') /* UVC MSXU metadata */
 #define V4L2_META_FMT_VIVID	  v4l2_fourcc('V', 'I', 'V', 'D') /* Vivid Metadata */
+#define V4L2_META_FMT_BCM2835_ISP_STATS v4l2_fourcc('B', 'S', 'T', 'A') /* BCM2835 ISP stats */
+#define V4L2_META_FMT_BCM2835_ISP_PARAMS v4l2_fourcc('B', 'C', 'M', 'P') /* BCM2835 ISP params */
 
 /* Vendor specific - used for RK_ISP1 camera sub-system */
 #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */

-- 
2.52.0


