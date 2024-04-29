Return-Path: <linux-media+bounces-10312-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 753728B5279
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 09:39:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3AD7281E0D
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 07:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD77E1427B;
	Mon, 29 Apr 2024 07:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="N+DXmK1Z"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FDB14A98
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 07:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714376372; cv=pass; b=GAtbLj8DzBvywoAyX+HGpICI9ECIo4xWk6p9NDJME/3dw3h9kEipqIDzByn2ErazDPa2+nG9rAq0Kpe24g4zldXL8Fi/sfUGNV+v3SJhw+WgzuZTb6LvCPL7DbQf6pxUm6PdjuQ1V5CarZxxtmcGuVzoKHtLfipADaCk+pA49Is=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714376372; c=relaxed/simple;
	bh=htxDtDpHHznV6SN8Og3E4EQNU3iWSZ1pj26ijVpcX/M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k6QSdI+pC028vJhLv2C/zwQo79JDjJNmZM7/90ue2m6RwoN9bDhUtgKMZcjvxo6JyGgFNLirS6avH2BoSkCQvNwKVJOHcgVNhiobYXbkcRzC88rcZjxa2auQpH1efGCrgUXry5WA65XnAPQKOrNnGtwHjIoUsfcqrfuzwhNmO9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=N+DXmK1Z; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4VSZw764Xxz49Q47;
	Mon, 29 Apr 2024 10:39:19 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1714376360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=cFojl1F6D2PODi96Cx+N2echgKROyuO9F8RVpfOY2iI=;
	b=N+DXmK1ZTQlM9b5juyvwvatiLFrMhT+LAdpTI5QOXx6TvHb8xJar9HYYFgOhvbaLxvGaPw
	M1gz3i35F1oHR3LY4+fuonZ4rDjc4ixW1LlOLARyRqspG/7CEnhA02sC32t1siRBjbFSam
	yFjKXhlbjZPSa2A3rNhcffr7+tchu7eeLovZUW7G297jyyVHtTGAbGgOoj1Jp9E0IkiLv7
	gg1TjAOf4iUXXJNF+tCHyGmfGXrHu9od/gr4zsKD2B4PhMMocFFsUhuXOuf4YRdA7S8xKa
	XB1N+mmZDchCCWeDTLq7rJC2k1ns9Bbpc5bBS5xEefUlD2kfHHKDuBo/uWVnPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1714376360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=cFojl1F6D2PODi96Cx+N2echgKROyuO9F8RVpfOY2iI=;
	b=sJ9gQ3xkdaoad2bsov+/QVJUuaH4qd+LCSyeEcr4JSK5YNvcY/7vcek9y94JJDcJECekjV
	oBJRFnGHuDUHfvuZF1ws//AxPxSLS4YZznUY6aZY6QyVTnng0OE/lyP/meBXuC/q7c2YEO
	hlanvXmp5+qwop4Vo69wJ3Mg8hh3xXMnhzhqMG7oRJuc0N8rgPnPH4Kvko13BG2ek04AJx
	CvWh2mnVUgnW6NrLQym++1snq2mE554OxRFuASNxt3OFWYVRQA6UqGFTEme5VuJZoEq9SJ
	rJgRVhKxtV2EZklXhqKtN1ie9q5cyT3lExGFUuEJ6JEHoM+b1ucj5ARVhu5DQA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1714376360; a=rsa-sha256;
	cv=none;
	b=KJh9P/AJteFGVApJrwOnAmXdjUIvt1gwsngH7ZLEgSl5+gr4VfwfOdet4UDJlAYkhTH+IR
	EJzrG8Gkc3/TLf+8+rna7i0BRI90t+xzllvSUpcPOs4sCQsoQrAsfDOs2mq7qbH32Ho+Zo
	XntxNFD3/q2fwQS9N8zJJ0fGtJiviGUDJHN3AyiDr39Y3b7ZfSXkDk2yN2BGD2H1qvrbr0
	Ev8mwsNz4Lv/0XSwBZr3WOjgIU4wQ5iMuvn3Bi6DPv1DpYidoqPPB1DCcYCmFhqMMOJBo8
	2/6HrKWbdAgmxYaVnpTZqg+2aZLNj+Z+eELsF56BiZPrhSzQtU+/Zf/hU6f+ww==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 1C77D634CA3;
	Mon, 29 Apr 2024 10:39:19 +0300 (EEST)
Date: Mon, 29 Apr 2024 07:39:18 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>, laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org
Subject: [GIT PULL v3 FOR 6.10] Unicam and IPU6 ISYS drivers
Message-ID: <Zi9OpsrV5dBwMObM@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Here are drivers for Unicam and IPU6 ISYS, prepended by the first part of
the metadata series. Both drivers can be used without the ROUTING IOCTL
with partial functionality. The ROUTING IOCTL enablement patch will enable
the rest of the functionality when it is merged later on.

since v3:

- Rebased on current media-stage master.

- Addressed issues found in build testing in Unicam (Laurent's separate
  patch) and IPU6 drivers (driver patchset v7).

since v2:

- Toss Laurent's patch to disable the metadata format definitions in
  UAPI, on the top.

- Squash Laurent's patch to fix ret assignment in the Unicam driver.

since v1:

- Fix a compile issue in an intermediate patch. The result is unaffected by
  this (no diff).

The diff to v3 is (apart from the rebase):

diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
index 3ed698c44976..b60f02076d8a 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
@@ -156,7 +156,7 @@ enum ipu6_fw_isys_stream_source {
 #define IPU6_FW_ISYS_STREAM_SRC_MIPIGEN_PORT0 IPU6_FW_ISYS_STREAM_SRC_MIPIGEN_0
 #define IPU6_FW_ISYS_STREAM_SRC_MIPIGEN_PORT1 IPU6_FW_ISYS_STREAM_SRC_MIPIGEN_1
 
-/**
+/*
  * enum ipu6_fw_isys_mipi_vc: MIPI csi2 spec
  * supports up to 4 virtual per physical channel
  */
@@ -216,7 +216,7 @@ enum ipu6_fw_isys_pin_type {
 	IPU6_FW_ISYS_PIN_TYPE_RAW_SOC = 3,
 };
 
-/**
+/*
  * enum ipu6_fw_isys_mipi_store_mode. Describes if long MIPI packets reach
  * MIPI SRAM with the long packet header or
  * if not, then only option is to capture it with pin type MIPI.
@@ -274,7 +274,7 @@ struct ipu6_fw_isys_fw_config {
 	u32 num_recv_queues[N_IPU6_FW_ISYS_QUEUE_TYPE];
 };
 
-/**
+/*
  * struct ipu6_fw_isys_resolution_abi: Generic resolution structure.
  */
 struct ipu6_fw_isys_resolution_abi {
@@ -283,7 +283,7 @@ struct ipu6_fw_isys_resolution_abi {
 };
 
 /**
- * struct ipu6_fw_isys_output_pin_payload_abi
+ * struct ipu6_fw_isys_output_pin_payload_abi - ISYS output pin buffer
  * @out_buf_id: Points to output pin buffer - buffer identifier
  * @addr: Points to output pin buffer - CSS Virtual Address
  * @compress: Request frame compression (1), or  not (0)
@@ -295,17 +295,25 @@ struct ipu6_fw_isys_output_pin_payload_abi {
 };
 
 /**
- * struct ipu6_fw_isys_output_pin_info_abi
+ * struct ipu6_fw_isys_output_pin_info_abi - ISYS output pin info
  * @output_res: output pin resolution
  * @stride: output stride in Bytes (not valid for statistics)
  * @watermark_in_lines: pin watermark level in lines
  * @payload_buf_size: minimum size in Bytes of all buffers that will be
  *			supplied for capture on this pin
+ * @ts_offsets: ts_offsets
+ * @s2m_pixel_soc_pixel_remapping: pixel soc remapping (see the definition of
+ *				   S2M_PIXEL_SOC_PIXEL_REMAPPING_FLAG_NO_REMAPPING)
+ * @csi_be_soc_pixel_remapping: see s2m_pixel_soc_pixel_remapping
  * @send_irq: assert if pin event should trigger irq
+ * @input_pin_id: related input pin id
  * @pt: pin type -real format "enum ipu6_fw_isys_pin_type"
  * @ft: frame format type -real format "enum ipu6_fw_isys_frame_format_type"
- * @input_pin_id: related input pin id
+ * @reserved: a reserved field
  * @reserve_compression: reserve compression resources for pin
+ * @snoopable: snoopable
+ * @error_handling_enable: enable error handling
+ * @sensor_type: sensor_type
  */
 struct ipu6_fw_isys_output_pin_info_abi {
 	struct ipu6_fw_isys_resolution_abi output_res;
@@ -327,7 +335,7 @@ struct ipu6_fw_isys_output_pin_info_abi {
 };
 
 /**
- * struct ipu6_fw_isys_input_pin_info_abi
+ * struct ipu6_fw_isys_input_pin_info_abi - ISYS input pin info
  * @input_res: input resolution
  * @dt: mipi data type ((enum ipu6_fw_isys_mipi_data_type)
  * @mipi_store_mode: defines if legacy long packet header will be stored or
@@ -337,11 +345,10 @@ struct ipu6_fw_isys_output_pin_info_abi {
  * @bits_per_pix: native bits per pixel
  * @mapped_dt: actual data type from sensor
  * @mipi_decompression: defines which compression will be in mipi backend
- * @crop_first_and_last_lines    Control whether to crop the
- *                              first and last line of the
- *                              input image. Crop done by HW
- *                              device.
+ * @crop_first_and_last_lines: Control whether to crop the first and last line
+ *			       of the input image. Crop done by HW device.
  * @capture_mode: mode of capture, regular or burst, default value is regular
+ * @reserved: a reserved field
  */
 struct ipu6_fw_isys_input_pin_info_abi {
 	struct ipu6_fw_isys_resolution_abi input_res;
@@ -356,7 +363,11 @@ struct ipu6_fw_isys_input_pin_info_abi {
 };
 
 /**
- * struct ipu6_fw_isys_cropping_abi - cropping coordinates
+ * struct ipu6_fw_isys_cropping_abi - ISYS cropping coordinates
+ * @top_offset: Top offset
+ * @left_offset: Left offset
+ * @bottom_offset: Bottom offset
+ * @right_offset: Right offset
  */
 struct ipu6_fw_isys_cropping_abi {
 	s32 top_offset;
@@ -366,7 +377,7 @@ struct ipu6_fw_isys_cropping_abi {
 };
 
 /**
- * struct ipu6_fw_isys_stream_cfg_data_abi
+ * struct ipu6_fw_isys_stream_cfg_data_abi - ISYS stream configuration data
  * ISYS stream configuration data structure
  * @crop: for extended use and is not used in FW currently
  * @input_pins: input pin descriptors
@@ -392,6 +403,8 @@ struct ipu6_fw_isys_cropping_abi {
  * @vc: MIPI Virtual Channel (up to 4 virtual per physical channel)
  * @isl_use: indicates whether stream requires ISL and how
  * @sensor_type: type of connected sensor, tobii or others, default is 0
+ * @reserved: a reserved field
+ * @reserved2: a reserved field
  */
 struct ipu6_fw_isys_stream_cfg_data_abi {
 	struct ipu6_fw_isys_cropping_abi crop;
@@ -413,7 +426,7 @@ struct ipu6_fw_isys_stream_cfg_data_abi {
 };
 
 /**
- * struct ipu6_fw_isys_frame_buff_set - frame buffer set
+ * struct ipu6_fw_isys_frame_buff_set_abi - ISYS frame buffer set (request)
  * @output_pins: output pin addresses
  * @send_irq_sof: send irq on frame sof response
  *		- if '1' it will override the send_resp_sof and
@@ -425,12 +438,15 @@ struct ipu6_fw_isys_stream_cfg_data_abi {
  *		  send the response
  *		- if '0' the send_resp_eof will determine whether to
  *		  send the response
+ * @send_irq_capture_ack: send irq on capture ack
+ * @send_irq_capture_done: send irq on capture done
  * @send_resp_sof: send response for frame sof detected,
  *		   used only when send_irq_sof is '0'
  * @send_resp_eof: send response for frame eof detected,
  *		   used only when send_irq_eof is '0'
  * @send_resp_capture_ack: send response for capture ack event
  * @send_resp_capture_done: send response for capture done event
+ * @reserved: a reserved field
  */
 struct ipu6_fw_isys_frame_buff_set_abi {
 	struct ipu6_fw_isys_output_pin_payload_abi output_pins[IPU6_MAX_OPINS];
@@ -446,7 +462,7 @@ struct ipu6_fw_isys_frame_buff_set_abi {
 };
 
 /**
- * struct ipu6_fw_isys_error_info_abi
+ * struct ipu6_fw_isys_error_info_abi - ISYS error information
  * @error: error code if something went wrong
  * @error_details: depending on error code, it may contain additional error info
  */
@@ -456,7 +472,8 @@ struct ipu6_fw_isys_error_info_abi {
 };
 
 /**
- * struct ipu6_fw_isys_resp_info_comm
+ * struct ipu6_fw_isys_resp_info_abi - ISYS firmware response
+ * @buf_id: buffer ID
  * @pin: this var is only valid for pin event related responses,
  *     contains pin addresses
  * @error_info: error information from the FW
@@ -464,6 +481,8 @@ struct ipu6_fw_isys_error_info_abi {
  * @stream_handle: stream id the response corresponds to
  * @type: response type (enum ipu6_fw_isys_resp_type)
  * @pin_id: pin id that the pin payload corresponds to
+ * @reserved: a reserved field
+ * @reserved2: a reserved field
  */
 struct ipu6_fw_isys_resp_info_abi {
 	u64 buf_id;
@@ -478,10 +497,9 @@ struct ipu6_fw_isys_resp_info_abi {
 };
 
 /**
- * struct ipu6_fw_isys_proxy_error_info_comm
- * @proxy_error: error code if something went wrong
- * @proxy_error_details: depending on error code, it may contain additional
- *			error info
+ * struct ipu6_fw_isys_proxy_error_info_abi - ISYS proxy error
+ * @error: error code if something went wrong
+ * @error_details: depending on error code, it may contain additional error info
  */
 struct ipu6_fw_isys_proxy_error_info_abi {
 	u32 error;
@@ -494,7 +512,7 @@ struct ipu6_fw_isys_proxy_resp_info_abi {
 };
 
 /**
- * struct ipu6_fw_proxy_write_queue_token
+ * struct ipu6_fw_proxy_write_queue_token - ISYS proxy write queue token
  * @request_id: update id for the specific proxy write request
  * @region_index: Region id for the proxy write request
  * @offset: Offset of the write request according to the base address
@@ -509,14 +527,19 @@ struct ipu6_fw_proxy_write_queue_token {
 };
 
 /**
- * struct ipu6_fw_resp_queue_token
+ * struct ipu6_fw_resp_queue_token - ISYS response queue token
+ * @resp_info: response info
  */
 struct ipu6_fw_resp_queue_token {
 	struct ipu6_fw_isys_resp_info_abi resp_info;
 };
 
 /**
- * struct ipu6_fw_send_queue_token
+ * struct ipu6_fw_send_queue_token - ISYS send queue token
+ * @buf_handle: buffer handle
+ * @payload: payload
+ * @send_type: send_type
+ * @stream_id: stream_id
  */
 struct ipu6_fw_send_queue_token {
 	u64 buf_handle;
@@ -526,14 +549,19 @@ struct ipu6_fw_send_queue_token {
 };
 
 /**
- * struct ipu6_fw_proxy_resp_queue_token
+ * struct ipu6_fw_proxy_resp_queue_token - ISYS proxy response queue token
+ * @proxy_resp_info: proxy response info
  */
 struct ipu6_fw_proxy_resp_queue_token {
 	struct ipu6_fw_isys_proxy_resp_info_abi proxy_resp_info;
 };
 
 /**
- * struct ipu6_fw_proxy_send_queue_token
+ * struct ipu6_fw_proxy_send_queue_token - SYS proxy send queue token
+ * @request_id: request_id
+ * @region_index: region_index
+ * @offset: offset
+ * @value: value
  */
 struct ipu6_fw_proxy_send_queue_token {
 	u32 request_id;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c b/drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c
index 2c85fbe6846f..71aa5009512a 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c
@@ -629,7 +629,7 @@ static int ipu6_isys_mcd_phy_config(struct ipu6_isys *isys)
 	struct sensor_async_sd *s_asd;
 	struct ipu6_isys_csi2_config cfg;
 	struct v4l2_async_connection *asc;
-	u8 phy_port, phy_id;
+	int phy_port, phy_id;
 	unsigned int i;
 	void __iomem *phy_base;
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index f8b5b96b21f0..11cd2c977abe 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -40,7 +40,6 @@ static int queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
 	}
 
 	*num_planes = 1;
-	alloc_devs[0] = aq->dev;
 
 	return 0;
 }
@@ -434,7 +433,7 @@ static int ipu6_isys_link_fmt_validate(struct ipu6_isys_queue *aq)
 		return -EINVAL;
 	}
 
-	code = ipu6_isys_get_isys_format(ipu6_isys_get_format(av))->code;
+	code = ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0)->code;
 	if (format.code != code) {
 		dev_dbg(dev, "wrong mbus code 0x%8.8x (0x%8.8x expected)\n",
 			code, format.code);
@@ -510,7 +509,7 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
 	struct device *dev = &av->isys->adev->auxdev.dev;
 	const struct ipu6_isys_pixelformat *pfmt =
-		ipu6_isys_get_isys_format(ipu6_isys_get_format(av));
+		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
 	struct ipu6_isys_buffer_list __bl, *bl = NULL;
 	struct ipu6_isys_stream *stream;
 	struct media_entity *source_entity = NULL;
@@ -562,8 +561,7 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 	bl = &__bl;
 	ret = buffer_list_get(stream, bl);
 	if (ret < 0) {
-		dev_dbg(dev,
-			"no buffer available, postponing streamon\n");
+		dev_warn(dev, "no buffer available, DRIVER BUG?\n");
 		goto out;
 	}
 
@@ -795,6 +793,7 @@ int ipu6_isys_queue_init(struct ipu6_isys_queue *aq)
 	aq->vbq.lock = &av->mutex;
 	aq->vbq.mem_ops = &vb2_dma_contig_memops;
 	aq->vbq.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	aq->vbq.min_queued_buffers = 1;
 	aq->vbq.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 
 	ret = vb2_queue_init(&aq->vbq);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 37b744a8a0b9..c8a33e1e910c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -113,18 +113,30 @@ static int video_open(struct file *file)
 }
 
 const struct ipu6_isys_pixelformat *
-ipu6_isys_get_isys_format(u32 pixelformat)
+ipu6_isys_get_isys_format(u32 pixelformat, u32 type)
 {
+	const struct ipu6_isys_pixelformat *default_pfmt = NULL;
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(ipu6_isys_pfmts); i++) {
 		const struct ipu6_isys_pixelformat *pfmt = &ipu6_isys_pfmts[i];
 
-		if (pfmt->pixelformat == pixelformat)
-			return pfmt;
+		if (type && ((!pfmt->is_meta &&
+			      type != V4L2_BUF_TYPE_VIDEO_CAPTURE) ||
+			     (pfmt->is_meta &&
+			      type != V4L2_BUF_TYPE_META_CAPTURE)))
+			continue;
+
+		if (!default_pfmt)
+			default_pfmt = pfmt;
+
+		if (pfmt->pixelformat != pixelformat)
+			continue;
+
+		return pfmt;
 	}
 
-	return &ipu6_isys_pfmts[0];
+	return default_pfmt;
 }
 
 static int ipu6_isys_vidioc_querycap(struct file *file, void *fh,
@@ -144,10 +156,10 @@ static int ipu6_isys_vidioc_enum_fmt(struct file *file, void *fh,
 	unsigned int i, num_found;
 
 	for (i = 0, num_found = 0; i < ARRAY_SIZE(ipu6_isys_pfmts); i++) {
-		if ((ipu6_isys_pfmts[i].is_meta ||
-		     f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE) &&
-		    (!ipu6_isys_pfmts[i].is_meta ||
-		     f->type != V4L2_BUF_TYPE_META_CAPTURE))
+		if ((ipu6_isys_pfmts[i].is_meta &&
+		     f->type != V4L2_BUF_TYPE_META_CAPTURE) ||
+		    (!ipu6_isys_pfmts[i].is_meta &&
+		     f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE))
 			continue;
 
 		if (f->mbus_code && f->mbus_code != ipu6_isys_pfmts[i].code)
@@ -218,7 +230,7 @@ static void ipu6_isys_try_fmt_cap(struct ipu6_isys_video *av, u32 type,
 				  u32 *bytesperline, u32 *sizeimage)
 {
 	const struct ipu6_isys_pixelformat *pfmt =
-		ipu6_isys_get_isys_format(*format);
+		ipu6_isys_get_isys_format(*format, type);
 
 	*format = pfmt->pixelformat;
 	*width = clamp(*width, IPU6_ISYS_MIN_WIDTH, IPU6_ISYS_MAX_WIDTH);
@@ -264,6 +276,9 @@ static int ipu6_isys_vidioc_try_fmt_vid_cap(struct file *file, void *fh,
 {
 	struct ipu6_isys_video *av = video_drvdata(file);
 
+	if (vb2_is_busy(&av->aq.vbq))
+		return -EBUSY;
+
 	__ipu6_isys_vidioc_try_fmt_vid_cap(av, f);
 
 	return 0;
@@ -306,6 +321,9 @@ static int ipu6_isys_vidioc_s_fmt_meta_cap(struct file *file, void *fh,
 {
 	struct ipu6_isys_video *av = video_drvdata(file);
 
+	if (vb2_is_busy(&av->aq.vbq))
+		return -EBUSY;
+
 	ipu6_isys_vidioc_try_fmt_meta_cap(file, fh, f);
 	av->meta_fmt = f->fmt.meta;
 
@@ -379,7 +397,7 @@ static int link_validate(struct media_link *link)
 		goto unlock;
 	}
 
-	code = ipu6_isys_get_isys_format(ipu6_isys_get_format(av))->code;
+	code = ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0)->code;
 
 	if (s_fmt->width != ipu6_isys_get_frame_width(av) ||
 	    s_fmt->height != ipu6_isys_get_frame_height(av) ||
@@ -429,7 +447,7 @@ static int ipu6_isys_fw_pin_cfg(struct ipu6_isys_video *av,
 	struct ipu6_isys_queue *aq = &av->aq;
 	struct v4l2_mbus_framefmt fmt;
 	const struct ipu6_isys_pixelformat *pfmt =
-		ipu6_isys_get_isys_format(ipu6_isys_get_format(av));
+		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
 	struct v4l2_rect v4l2_crop;
 	struct ipu6_isys *isys = av->isys;
 	struct device *dev = &isys->adev->auxdev.dev;
@@ -781,7 +799,7 @@ static void calculate_stream_datarate(struct ipu6_isys_video *av)
 {
 	struct video_stream_watermark *watermark = &av->watermark;
 	const struct ipu6_isys_pixelformat *pfmt =
-		ipu6_isys_get_isys_format(ipu6_isys_get_format(av));
+		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
 	u32 pages_per_line, pb_bytes_per_line, pixels_per_line, bytes_per_line;
 	u64 line_time_ns, stream_data_rate;
 	u16 shift, size;
@@ -826,15 +844,17 @@ void ipu6_isys_update_stream_watermark(struct ipu6_isys_video *av, bool state)
 
 void ipu6_isys_put_stream(struct ipu6_isys_stream *stream)
 {
-	struct device *dev = &stream->isys->adev->auxdev.dev;
+	struct device *dev;
 	unsigned int i;
 	unsigned long flags;
 
 	if (!stream) {
-		dev_err(dev, "no available stream\n");
+		pr_err("ipu6-isys: no available stream\n");
 		return;
 	}
 
+	dev = &stream->isys->adev->auxdev.dev;
+
 	spin_lock_irqsave(&stream->isys->streams_lock, flags);
 	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++) {
 		if (&stream->isys->streams[i] == stream) {
@@ -1069,6 +1089,7 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
 static const struct v4l2_ioctl_ops ipu6_v4l2_ioctl_ops = {
 	.vidioc_querycap = ipu6_isys_vidioc_querycap,
 	.vidioc_enum_fmt_vid_cap = ipu6_isys_vidioc_enum_fmt,
+	.vidioc_enum_fmt_meta_cap = ipu6_isys_vidioc_enum_fmt,
 	.vidioc_enum_framesizes = ipu6_isys_vidioc_enum_framesizes,
 	.vidioc_g_fmt_vid_cap = ipu6_isys_vidioc_g_fmt_vid_cap,
 	.vidioc_s_fmt_vid_cap = ipu6_isys_vidioc_s_fmt_vid_cap,
@@ -1177,7 +1198,7 @@ int ipu6_isys_setup_video(struct ipu6_isys_video *av,
 			  struct media_entity **source_entity, int *nr_queues)
 {
 	const struct ipu6_isys_pixelformat *pfmt =
-		ipu6_isys_get_isys_format(ipu6_isys_get_format(av));
+		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
 	struct device *dev = &av->isys->adev->auxdev.dev;
 	struct v4l2_mbus_frame_desc_entry entry;
 	struct v4l2_subdev_route *route = NULL;
@@ -1279,7 +1300,7 @@ int ipu6_isys_video_init(struct ipu6_isys_video *av)
 	};
 	struct v4l2_format format_meta = {
 		.type = V4L2_BUF_TYPE_META_CAPTURE,
-		.fmt.pix = {
+		.fmt.meta = {
 			.width = 1920,
 			.height = 4,
 		},
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
index fbc3c54da473..1d945be2b879 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
@@ -110,7 +110,7 @@ extern const struct ipu6_isys_pixelformat ipu6_isys_pfmts[];
 extern const struct ipu6_isys_pixelformat ipu6_isys_pfmts_packed[];
 
 const struct ipu6_isys_pixelformat *
-ipu6_isys_get_isys_format(u32 pixelformat);
+ipu6_isys_get_isys_format(u32 pixelformat, u32 code);
 int ipu6_isys_video_prepare_stream(struct ipu6_isys_video *av,
 				   struct media_entity *source_entity,
 				   int nr_queues);
diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index b669a48ddacb..4b1f69d14d71 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -399,7 +399,7 @@ ipu6_isys_init(struct pci_dev *pdev, struct device *parent,
 	isys_adev->mmu = ipu6_mmu_init(dev, base, ISYS_MMID,
 				       &ipdata->hw_variant);
 	if (IS_ERR(isys_adev->mmu)) {
-		dev_err_probe(dev, PTR_ERR(isys_adev),
+		dev_err_probe(dev, PTR_ERR(isys_adev->mmu),
 			      "ipu6_mmu_init(isys_adev->mmu) failed\n");
 		put_device(&isys_adev->auxdev.dev);
 		kfree(pdata);
@@ -445,7 +445,7 @@ ipu6_psys_init(struct pci_dev *pdev, struct device *parent,
 	psys_adev->mmu = ipu6_mmu_init(&pdev->dev, base, PSYS_MMID,
 				       &ipdata->hw_variant);
 	if (IS_ERR(psys_adev->mmu)) {
-		dev_err_probe(&pdev->dev, PTR_ERR(psys_adev),
+		dev_err_probe(&pdev->dev, PTR_ERR(psys_adev->mmu),
 			      "ipu6_mmu_init(psys_adev->mmu) failed\n");
 		put_device(&psys_adev->auxdev.dev);
 		kfree(pdata);
diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 6ac4ea8efb1a..bd2bbb53070e 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -2544,6 +2544,7 @@ static int unicam_async_nf_init(struct unicam_device *unicam)
 	default:
 		/* Unsupported bus type */
 		dev_err(unicam->dev, "Unsupported bus type %u\n", ep.bus_type);
+		ret = -EINVAL;
 		goto error;
 	}
 
Please pull.


The following changes since commit c28d4921a1e3ce0a0374b7e9d68593be8802c42a:

  media: mediatek: vcodec: fix possible unbalanced PM counter (2024-04-27 10:04:30 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.10-metadata-6-no-fmts-signed

for you to fetch changes up to 12e3384b874e9f67c3e98ce501561fe5a54a0add:

  media: uapi: v4l: Don't expose generic metadata formats to userspace (2024-04-29 00:11:29 +0300)

----------------------------------------------------------------
Unicam and IPU6 ISYS drivers, with metadata formats but in-kernel only

----------------------------------------------------------------
Bingbu Cao (16):
      media: intel/ipu6: add Intel IPU6 PCI device driver
      media: intel/ipu6: add IPU auxiliary devices
      media: intel/ipu6: add IPU6 buttress interface driver
      media: intel/ipu6: CPD parsing for get firmware components
      media: intel/ipu6: add IPU6 DMA mapping API and MMU table
      media: intel/ipu6: add syscom interfaces between firmware and driver
      media: intel/ipu6: input system ABI between firmware and driver
      media: intel/ipu6: add IPU6 CSI2 receiver v4l2 sub-device
      media: intel/ipu6: add the CSI2 DPHY implementation
      media: intel/ipu6: input system video nodes and buffer queues
      media: intel/ipu6: add the main input system driver
      media: intel/ipu6: add Kconfig and Makefile
      media: MAINTAINERS: add maintainers for Intel IPU6 input system driver
      media: intel/ipu6: support line-based metadata capture support
      media: Documentation: add Intel IPU6 ISYS driver admin-guide doc
      media: Documentation: add documentation of Intel IPU6 driver and hardware overview

Dave Stevenson (2):
      dt-bindings: media: Add bindings for bcm2835-unicam
      media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface

Jean-Michel Hautbois (2):
      media: v4l: Add V4L2-PIX-FMT-Y12P format
      media: v4l: Add V4L2-PIX-FMT-Y14P format

Laurent Pinchart (2):
      media: v4l2-subdev: Clearly document that the crop API won't be extended
      media: uapi: v4l: Don't expose generic metadata formats to userspace

Sakari Ailus (15):
      media: Documentation: Add "stream" into glossary
      media: uapi: Add generic serial metadata mbus formats
      media: uapi: Document which mbus format fields are valid for metadata
      media: uapi: v4l: Add generic 8-bit metadata format definitions
      media: v4l: Support line-based metadata capture
      media: v4l: Set line based metadata flag in V4L2 core
      media: Documentation: Additional streams generally don't harm capture
      media: Documentation: Document S_ROUTING behaviour
      media: v4l: subdev: Add a function to lock two sub-device states, use it
      media: v4l: subdev: Copy argument back to user also for S_ROUTING
      media: v4l: subdev: Add len_routes field to struct v4l2_subdev_routing
      media: v4l: subdev: Return routes set using S_ROUTING
      media: v4l: subdev: Add trivial set_routing support
      media: ipu6: Add PCI device table header
      media: ivsc: csi: Use IPU bridge

 Documentation/admin-guide/media/ipu6-isys.rst      |  161 ++
 .../admin-guide/media/ipu6_isys_graph.svg          |  548 ++++
 Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
 .../bindings/media/brcm,bcm2835-unicam.yaml        |  127 +
 Documentation/driver-api/media/drivers/index.rst   |    1 +
 Documentation/driver-api/media/drivers/ipu6.rst    |  205 ++
 Documentation/userspace-api/media/glossary.rst     |   12 +
 Documentation/userspace-api/media/v4l/dev-meta.rst |   21 +
 .../userspace-api/media/v4l/dev-subdev.rst         |   31 +-
 .../userspace-api/media/v4l/meta-formats.rst       |    3 +-
 .../userspace-api/media/v4l/metafmt-generic.rst    |  340 +++
 .../userspace-api/media/v4l/pixfmt-yuv-luma.rst    |   48 +
 .../userspace-api/media/v4l/subdev-formats.rst     |  269 +-
 .../userspace-api/media/v4l/vidioc-enum-fmt.rst    |    7 +
 .../media/v4l/vidioc-subdev-g-crop.rst             |    6 +-
 .../media/v4l/vidioc-subdev-g-routing.rst          |   51 +-
 .../userspace-api/media/videodev2.h.rst.exceptions |    1 +
 MAINTAINERS                                        |   17 +
 drivers/media/pci/intel/Kconfig                    |    1 +
 drivers/media/pci/intel/Makefile                   |    1 +
 drivers/media/pci/intel/ipu6/Kconfig               |   18 +
 drivers/media/pci/intel/ipu6/Makefile              |   23 +
 drivers/media/pci/intel/ipu6/ipu6-bus.c            |  165 ++
 drivers/media/pci/intel/ipu6/ipu6-bus.h            |   58 +
 drivers/media/pci/intel/ipu6/ipu6-buttress.c       |  912 +++++++
 drivers/media/pci/intel/ipu6/ipu6-buttress.h       |   92 +
 drivers/media/pci/intel/ipu6/ipu6-cpd.c            |  362 +++
 drivers/media/pci/intel/ipu6/ipu6-cpd.h            |  105 +
 drivers/media/pci/intel/ipu6/ipu6-dma.c            |  502 ++++
 drivers/media/pci/intel/ipu6/ipu6-dma.h            |   19 +
 drivers/media/pci/intel/ipu6/ipu6-fw-com.c         |  413 +++
 drivers/media/pci/intel/ipu6/ipu6-fw-com.h         |   47 +
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c        |  487 ++++
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h        |  596 +++++
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c      |  663 +++++
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h      |   82 +
 drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c   |  536 ++++
 drivers/media/pci/intel/ipu6/ipu6-isys-jsl-phy.c   |  242 ++
 drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c   |  720 +++++
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c     |  810 ++++++
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.h     |   78 +
 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c    |  403 +++
 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h    |   59 +
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c     | 1420 ++++++++++
 drivers/media/pci/intel/ipu6/ipu6-isys-video.h     |  141 +
 drivers/media/pci/intel/ipu6/ipu6-isys.c           | 1367 ++++++++++
 drivers/media/pci/intel/ipu6/ipu6-isys.h           |  206 ++
 drivers/media/pci/intel/ipu6/ipu6-mmu.c            |  845 ++++++
 drivers/media/pci/intel/ipu6/ipu6-mmu.h            |   73 +
 .../pci/intel/ipu6/ipu6-platform-buttress-regs.h   |  226 ++
 .../pci/intel/ipu6/ipu6-platform-isys-csi2-reg.h   |  172 ++
 drivers/media/pci/intel/ipu6/ipu6-platform-regs.h  |  179 ++
 drivers/media/pci/intel/ipu6/ipu6.c                |  895 +++++++
 drivers/media/pci/intel/ipu6/ipu6.h                |  342 +++
 drivers/media/pci/intel/ivsc/mei_csi.c             |   20 +-
 drivers/media/platform/Kconfig                     |    1 +
 drivers/media/platform/Makefile                    |    1 +
 drivers/media/platform/broadcom/Kconfig            |   23 +
 drivers/media/platform/broadcom/Makefile           |    3 +
 .../media/platform/broadcom/bcm2835-unicam-regs.h  |  246 ++
 drivers/media/platform/broadcom/bcm2835-unicam.c   | 2744 ++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c               |   43 +-
 drivers/media/v4l2-core/v4l2-subdev.c              |   50 +-
 include/media/ipu6-pci-table.h                     |   28 +
 include/media/v4l2-subdev.h                        |   42 +
 include/uapi/linux/media-bus-format.h              |    9 +
 include/uapi/linux/v4l2-mediabus.h                 |   18 +-
 include/uapi/linux/v4l2-subdev.h                   |   14 +-
 include/uapi/linux/videodev2.h                     |   26 +
 69 files changed, 18312 insertions(+), 65 deletions(-)
 create mode 100644 Documentation/admin-guide/media/ipu6-isys.rst
 create mode 100644 Documentation/admin-guide/media/ipu6_isys_graph.svg
 create mode 100644 Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
 create mode 100644 Documentation/driver-api/media/drivers/ipu6.rst
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-generic.rst
 create mode 100644 drivers/media/pci/intel/ipu6/Kconfig
 create mode 100644 drivers/media/pci/intel/ipu6/Makefile
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-bus.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-bus.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-buttress.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-buttress.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-cpd.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-cpd.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-dma.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-dma.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-com.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-com.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-fw-isys.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-jsl-phy.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-video.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys-video.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-mmu.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-mmu.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-buttress-regs.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-isys-csi2-reg.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6-platform-regs.h
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6.c
 create mode 100644 drivers/media/pci/intel/ipu6/ipu6.h
 create mode 100644 drivers/media/platform/broadcom/Kconfig
 create mode 100644 drivers/media/platform/broadcom/Makefile
 create mode 100644 drivers/media/platform/broadcom/bcm2835-unicam-regs.h
 create mode 100644 drivers/media/platform/broadcom/bcm2835-unicam.c
 create mode 100644 include/media/ipu6-pci-table.h

-- 
Kind regards,

Sakari Ailus

