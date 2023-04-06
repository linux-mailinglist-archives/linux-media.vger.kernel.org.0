Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEE006D98C3
	for <lists+linux-media@lfdr.de>; Thu,  6 Apr 2023 15:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238850AbjDFN5R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Apr 2023 09:57:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238854AbjDFN5P (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Apr 2023 09:57:15 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BC3AAD03
        for <linux-media@vger.kernel.org>; Thu,  6 Apr 2023 06:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1680789404; x=1712325404;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DCBM5qgaJqrAiLml973kMkTtNEpC42AQ7hJXwQsB3Gs=;
  b=Uncvr8fDB+sTcvQSru4nBsxe26vXRqnr1LDZJWk2vN15KirHPmXDgYAu
   WGGt98WgzPYXtRjGitCrknv6WW1q9+omlvDeTDcEmFT79LShiefi3uCvC
   GgCDVEkyab93PWKlPsXLk+mS30kMKF3CEVZf4Zg4ipmngPMAGDw7Gki3m
   0IcIu+a3mgnVoIGgA7vJKKctAK5+LNwI5IHrxmZFVlubv+C7tb2xNvykx
   rYxvlkHoXVUDETJPXwFyyXrs7qEBsVM0mldfcVYtTLA+6knwn8fR8dXWw
   NGDBxFNFS03GubOXbSRTXuWnieTCPru4kbYEXdU37yWamJUEWwjb+8EjP
   g==;
X-IronPort-AV: E=Sophos;i="5.98,323,1673910000"; 
   d="scan'208";a="30197209"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 06 Apr 2023 15:56:42 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 06 Apr 2023 15:56:42 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 06 Apr 2023 15:56:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1680789402; x=1712325402;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DCBM5qgaJqrAiLml973kMkTtNEpC42AQ7hJXwQsB3Gs=;
  b=kSB+Ihd/KHcOnfl0u2VT0LU2oTkPRWr8jgZil3ldxhCEQECQ0TnxwRqs
   +An5Lauo/9LtOSms6YPrCMeyAgI32reUhAkNZ3iXMrrWZ9UsL/S8/OUnA
   eTC90UlbVJIAzNeqFS3ISas+AiMDd/q3E03sGhkGF2FDmgQKz+1Kazh28
   DDfOIh0WV/i0ESE8P733qbz39Iu77zPL1qCFmfNSeUNwdOiWaBGpGiFBI
   sKDSPotvV0MJDBVO+2DOxMfQe3KebPD3FrQxpnuBtfrSTMHtVesICkXzv
   uMZeB7M+2BafXhrRM3/CKK5nVMwgwthraqplBrruXusjD0MIMBFLYS7pl
   w==;
X-IronPort-AV: E=Sophos;i="5.98,323,1673910000"; 
   d="scan'208";a="30197207"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 06 Apr 2023 15:56:42 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 63B63280056;
        Thu,  6 Apr 2023 15:56:42 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/1] media: imx: imx7-media-csi: Set pixfmt field, width, height & sizeimage
Date:   Thu,  6 Apr 2023 15:56:37 +0200
Message-Id: <20230406135637.257580-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following v4l2-comliance errors for VIDIOC_TRY_FMT:
* !pix.width || !pix.height
* !pix.sizeimage
* pix.field == V4L2_FIELD_ANY

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
This patch is based on [1] and fixes the last v4l2-compliance errors and
a 'WARN_ON(!plane_sizes[i])' in vb2_core_reqbufs().
My platform: TQMa8MQML (imx8mm) + imx327lqr. 

The v4l2-compliance output:
--8<--
v4l2-compliance 1.24.1-5010, 64 bits, 64-bit time_t
v4l2-compliance SHA: 8799081b1436 2023-02-24 17:03:58

Compliance test for imx-capture device /dev/video0:

Driver Info:
        Driver name      : imx-capture
        Card type        : imx-capture
        Bus info         : platform:32e20000.csi
        Driver version   : 6.3.0
        Capabilities     : 0xa4200001
                Video Capture
                I/O MC
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x24200001
                Video Capture
                I/O MC
                Streaming
                Extended Pix Format
Media Driver Info:
        Driver name      : imx7-csi
        Model            : imx-media
        Serial           : 
        Bus info         : platform:32e20000.csi
        Media version    : 6.3.0
        Hardware revision: 0x00000000 (0)
        Driver version   : 6.3.0
Interface Info:
        ID               : 0x03000006
        Type             : V4L Video
Entity Info:
        ID               : 0x00000004 (4)
        Name             : csi capture
        Function         : V4L2 I/O
        Pad 0x01000005   : 0: Sink
          Link 0x02000008: from remote pad 0x1000003 of entity 'csi' (Video Interface Bridge): Data, Enabled, Immutable

Required ioctls:
        test MC information (see 'Media Driver Info' above): OK
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
        test VIDIOC_QUERYCTRL: OK (Not Supported)
        test VIDIOC_G/S_CTRL: OK (Not Supported)
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 0 Private Controls: 0

Format ioctls (Input 0):
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
                fail: v4l2-test-formats.cpp(468): !pix.width || !pix.height
        test VIDIOC_TRY_FMT: FAIL
                fail: v4l2-test-formats.cpp(468): !pix.width || !pix.height
        test VIDIOC_S_FMT: FAIL
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
                fail: v4l2-test-formats.cpp(1726): !sel_padded.r.width || !sel_padded.r.height
                fail: v4l2-test-formats.cpp(1778): testBasicCompose(node, V4L2_BUF_TYPE_VIDEO_CAPTURE)
        test Composing: FAIL
        test Scaling: OK

Codec ioctls (Input 0):
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
                fail: v4l2-test-buffers.cpp(607): q.reqbufs(node, 1)
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL
                fail: v4l2-test-buffers.cpp(783): VIDIOC_EXPBUF is supported, but the V4L2_MEMORY_MMAP support is missing or malfunctioning.
                fail: v4l2-test-buffers.cpp(784): VIDIOC_EXPBUF is supported, but the V4L2_MEMORY_MMAP support is missing, probably due to earlier failing format tests.
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)

Total for imx-capture device /dev/video0: 46, Succeeded: 42, Failed: 4, Warnings: 0
--8<--

Best regards,
Alexander

[1] https://lore.kernel.org/all/20230321072707.678039-1-alexander.stein@ew.tq-group.com/

 drivers/media/platform/nxp/imx7-media-csi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 389d7d88b341..1888559a6531 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1147,6 +1147,7 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
 {
 	struct v4l2_mbus_framefmt fmt_src;
 	const struct imx7_csi_pixfmt *cc;
+	unsigned int walign;
 
 	/*
 	 * Find the pixel format, default to the first supported format if not
@@ -1175,6 +1176,17 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixfmt,
 	v4l2_fill_mbus_format(&fmt_src, pixfmt, 0);
 	imx7_csi_mbus_fmt_to_pix_fmt(pixfmt, &fmt_src, cc);
 
+	if (cc->bpp == 8)
+		walign = 8;
+	else
+		walign = 4;
+
+	v4l_bound_align_image(&pixfmt->width, 1, 0xffff / (cc->bpp / 8), walign,
+			      &pixfmt->height, 1, 0xffff, 1, 0);
+
+	pixfmt->sizeimage = (cc->bpp * pixfmt->width * pixfmt->height) / BITS_PER_BYTE;
+	pixfmt->field = V4L2_FIELD_NONE;
+
 	if (compose) {
 		compose->width = fmt_src.width;
 		compose->height = fmt_src.height;
-- 
2.34.1

