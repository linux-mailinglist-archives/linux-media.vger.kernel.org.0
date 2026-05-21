Return-Path: <linux-media+bounces-62435-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDjOOOzWDmr2CQYAu9opvQ
	(envelope-from <linux-media+bounces-62435-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:57:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5004C5A2C9C
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5CD131C79F3
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCA9B376BEF;
	Thu, 21 May 2026 09:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EicbDHoN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6C5352010
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 09:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779355504; cv=none; b=p52V6R1VV+lIvOXTVPZHAjdpO7hF5pWBsYeqsQXx7T0H5gdNRvorqcIxzYxXxOHF5gId2JHjqIRKUVCKLXKO4rV5ZI5dSG4pwzFV6YTf3saFPnphMrm4qP1TOsBBqVvfWB+80j82MkZBLqmH+/mLO3ClOl4aPW8CyBeKD3crLgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779355504; c=relaxed/simple;
	bh=UrKzJZyVuS7OMSe4A2xQwaz4d6xdF/RDIk9affmKoM8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e7bfYQTfGVRonAHILtTyysAtRCjqAwfFs01MHhlMQ/QyW/WsSFWQqEfgmf2vaL28w7+U8Rga1dWsSrKk3YYm4sSZ9IHG5iFCbXMiBF6i8xWq90qONOL9j00tIHf/GXm5cByNj4dO9XycEqlbNPtNOVlSRUNS5YryJZmH9hpkBTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EicbDHoN; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48d146705b4so65298405e9.3
        for <linux-media@vger.kernel.org>; Thu, 21 May 2026 02:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779355500; x=1779960300; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K9G1Frv6heZP5sdNjxpwKXBej9hW46A9UFkdAM//WeA=;
        b=EicbDHoN1u/igzr2oM0cS6Xn6kwoQo9LtEqEF9AXS5Sd5zltI6A7/pXzGhk/KIvliC
         l5ojO6GvNyntZDPOb15iX7SwC6V11IatHZW+AVr5Te/B0mOoKHLBFxjL/oMFbtK1SPMn
         wxqljBbFDXzd6tcdCg1DvnmrjiZjAWHPGLiXcOKthM0McTtqPaRKNYTJH9qlbAHL9Im9
         6mdeU7N+mqwOXXMMF25jfokllh0na6fQH6xisR21xd7HPyKKrnOoruj3h3qZiIPjBg2T
         2sTpZoKoL26dm7+onimuAuSymDsTYJt3By5iGc7jItWUA5OsXgMR26FCz+ZtAZ0Yytt3
         o3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779355500; x=1779960300;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9G1Frv6heZP5sdNjxpwKXBej9hW46A9UFkdAM//WeA=;
        b=oj4J7/pPQ1vOk8geui1RBnhCDTlNsnNwzJncY/C7gz5wjnrd9Z+ZqHs9lpS0vDa/as
         olK0RLCsi5pnX5ByH+pycvtDBw1J8+4LT7ghZZtTfAyKHrz64KvGvczE5PrBGtCUqtZ+
         19v1ZhET0bETashqlEWMemqf214pJNS2wtAU4ovKHKgAE1fvzJ+Bc75uI9MA9W4H5oOH
         251shXX0udaJX9Kmn3Ya/GOrBNZef60TAgal9iV/ZGoczayKZTFUfspf8VIbEJyC4zAT
         q5YGLcsM0LEHvUIANPyvmqmQszW4pggjYHYA8iUteBLfTlLz7JPT/Ts6y/VaOhTutLNU
         1lUQ==
X-Gm-Message-State: AOJu0Yyc9skwPW1MaiPXz3FVFNy5kdVvyXCOwzTFERdyPhtikQP21QJD
	xC4JLHKZuqQOmPiXeTTJwxJYzvMJ5YsmSwZHduxZ7CPl4rovcnfDnX1Dg7I23Hpl09Y=
X-Gm-Gg: Acq92OGJT4+zG1rUDYukCyWkP1L41qhMFIpDqmhMN22S0Wfwx7u3EqjVH2wEx00dttJ
	ss3jS01rwJQMnUztzSRnPZH/+AbBdet6yboJHVtg6DzsXuuHjl8b+sUrwBEj1MBdSYIpiyUXblO
	Aa5iH9YfhXJFKy8p1+YMIsDQSGwuuefGe/lJgDnDNk/+VKG5Wd7Hd/DgMFqdZ3gWUCzVjFfZstx
	WIfAmxwZqrlkkzeQZyIS5bB+oWah0GKvj3gdtPebT/xBkevOYiCaEar6l5ORW8QYYXPRC+pzZ0v
	igsaM3pGkOJiHio5E2ZjbBt7Lj7OwpxDRqVsp7CGKBm29W4l80/MgIZudojVfx8U8as85oFjYgs
	lH757EZ4pw5ZCVngehVomv15ljiEXU3iQV+Ne+qES+3r2Wmj23IXfQUZgr24YdarIOgxjEAiL6U
	A/1Do36nYCrRw4kJ+QOtaUoyeHaB8+JRYy7PcqFe2DLilvkXf4MMdxQOo=
X-Received: by 2002:a05:600c:8585:b0:490:3890:605b with SMTP id 5b1f17b1804b1-49038906125mr16989805e9.31.1779355500334;
        Thu, 21 May 2026 02:25:00 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d8e25bsm54945595e9.11.2026.05.21.02.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 02:24:59 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 0/6] media: qcom: iris: add support for decoding 10bit
 formats
Date: Thu, 21 May 2026 11:24:53 +0200
Message-Id: <20260521-topic-sm8x50-iris-10bit-decoding-v4-0-8ff8fce3f904@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGXPDmoC/5XOzW7CMBAE4FdBPner9R9Oeup7VBySzSZs1cbIT
 iMQyrvXgQOtuMBxpNE3c1aZk3BWb5uzSjxLljiW4F42ivbNODBIV7IyaLbosIIpHoQgf1dHjyB
 JMmhsZYKOKXYyDoDBkW0o1MGTKswhcS/Hy8TH7przT/vJNK3u2thLnmI6XT7Meu09MTdrQHCmI
 s1k2Pb2/UvGJsXXmAa17s3mj6jDA6IpItVVaLe+sbrzd6K9iV7rB0RbxNATurqtLTrzT1yW5Rd
 IvNUZhwEAAA==
X-Change-ID: 20260408-topic-sm8x50-iris-10bit-decoding-074c3ac7975c
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=11043;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=UrKzJZyVuS7OMSe4A2xQwaz4d6xdF/RDIk9affmKoM8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqDs9oDFX2D4Cd4IJFHuhqa4GaZSx6PrQ/YX2dtoTh
 4Lajh1iJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCag7PaAAKCRB33NvayMhJ0dkDD/
 sFnXRmAx4pspYEjJqSgcnU8QerfPhIUDtp3OdOWn6QMGKBBR58+Y6sDrcYW7H7xAYAlYZR9G5Mwfcn
 B0vNOWXh4TiTMSEjQIh4hzahny+eaiAHwC+N/FFcPfziqTsKF57rKsuXDTIzgB4ad2F83uqMsMrK9D
 ngxIbKj7G4Hz6oCYlnNuC2kz+KjcphDCowlVt3g04AtG6TjR0r+x7Aw+nJUvtpLzYACuWFygRzizcE
 o/PoTWldTRQ5bnkLKNop95VE1m6MB8dM1sB8R7CT+PmmC9YDbAXya3gCBFHjK7KNPTCjVdvuHINUR4
 SAETvU43bh8XliRZuZt7j1UAsmeRlufuW9M+pRUNHrJEfS16fmhZgMkD+UGDqwQtm7mbuH8WjGq6kW
 40dwDadO+ez8yfCYpcGSGEgiwGQsmPoixiPD7qT92+P9Yo1D6IyMkGnxseRc4WFBkWrhjOAd+lBZO2
 F4+dpZ6dJc2D9TgCJZHmyAoxXL+AeW8pHHi0+sWmmQr12ESfiYx995TEa60o5l7c22+z81+HJxNyRK
 njrLxjMzwfKaZiPv4nwdJpVBD13hHwAOL9uOV91Q37p4o23XG6vZoy7iguHKsDD/1frSxvq1DAipHD
 w3ojUGc6Vag14dgnC0PV3z3JmlVp1oIRUrEDOzpijSdVsENFttECBvxlNMBQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62435-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,msgid.link:url,linaro.org:email,linaro.org:mid,linaro.org:dkim,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 5004C5A2C9C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This adds the plumbing to support decoding HEVC, VP9 and AV1
streams into 10bit pixel formats, linear and compressed.

This has only been tested on SM8550 & SM8650 with HEVC, and was
inspired by Venus, DRM MSM and the downstream vidc driver for the
buffer calculations and HFI messages.

Gstreamer support for QC08 and QC10 need the MR at [1] to be applied,
but NV12 and P010 works out of the box with mainline Gstreamer.

Fluster HEVC results on SM8650 using Gstreamer:

./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2-Gst1.0 - 141/147
The failing test case:
- Pixel Format mismatch
 - TSUNEQBD_A_MAIN10_Technicolor_2 - Gstreamer waits NV12 but decoder returns P010
- Unsupported resolution
 - PICSIZE_A_Bossen_1 - resolution is higher than max supported
 - PICSIZE_B_Bossen_1 - resolution is higher than max supported
 - WPP_D_ericsson_MAIN_2 - resolution is lower than min supported
 - WPP_D_ericsson_MAIN10_2 - resolution is lower than min supported
- CRC mismatch
 - RAP_A_docomo_6

v4l2-compliance results on SM8550 & SM8650:

$ v4l2-compliance -d /dev/video1 -s
v4l2-compliance 1.33.0-5456, 64 bits, 64-bit time_t
v4l2-compliance SHA: 8aa593bda182 2026-04-11 10:54:25

Compliance test for iris_driver device /dev/video1:

Driver Info:
	Driver name      : iris_driver
	Card type        : Iris Encoder
	Bus info         : platform:aa00000.video-codec
	Driver version   : 7.0.0
	Capabilities     : 0x84204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
	Detected Stateful Encoder

Required ioctls:
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video1 open: OK
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
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

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

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 43 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)
	test blocking wait: OK

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)
	Video Capture Multiplanar: Captured 61 buffers    
	test MMAP (select, REQBUFS): OK
	Video Capture Multiplanar: Captured 61 buffers    
	test MMAP (epoll, REQBUFS): OK
	Video Capture Multiplanar: Captured 61 buffers    
	test MMAP (select, CREATE_BUFS): OK
	Video Capture Multiplanar: Captured 61 buffers    
	test MMAP (epoll, CREATE_BUFS): OK
	test USERPTR (select): OK (Not Supported)
	test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video1: 54, Succeeded: 54, Failed: 0, Warnings: 0

$ v4l2-compliance -d /dev/video0 -s5 --stream-from=test_video_10s.h264
v4l2-compliance 1.33.0-5456, 64 bits, 64-bit time_t
v4l2-compliance SHA: 8aa593bda182 2026-04-11 10:54:25

Compliance test for iris_driver device /dev/video0:

Driver Info:
	Driver name      : iris_driver
	Card type        : Iris Decoder
	Bus info         : platform:aa00000.video-codec
	Driver version   : 7.0.0
	Capabilities     : 0x84204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
	Detected Stateful Decoder

Required ioctls:
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
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

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

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 12 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK
	test Composing: OK
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)
	test blocking wait: OK

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)
the input file is smaller than 7077888 bytes
	Video Capture Multiplanar: Captured 601 buffers   
	test MMAP (select, REQBUFS): OK
the input file is smaller than 7077888 bytes
	Video Capture Multiplanar: Captured 601 buffers   
	test MMAP (epoll, REQBUFS): OK
the input file is smaller than 7077888 bytes
	Video Capture Multiplanar: Captured 601 buffers   
	test MMAP (select, CREATE_BUFS): OK
the input file is smaller than 7077888 bytes
	Video Capture Multiplanar: Captured 601 buffers   
	test MMAP (epoll, CREATE_BUFS): OK
	test USERPTR (select): OK (Not Supported)
	test DMABUF: Cannot test, specify --expbuf-device

Total for iris_driver device /dev/video0: 54, Succeeded: 54, Failed: 0, Warnings: 0

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8195

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v4:
- Picked review tags
- Use u32 instead of __u32
- Explicit DPB
- Drop NULL and use >>1 in q10c buffer calc
- Drop selicolon after switch statementr
- Correctly align HFI_PROP_UBWC_STRIDE_SCANLINE entry
- Rebase on media next tree after the file split
- Link to v3: https://patch.msgid.link/20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org

Changes in v3:
- Added review tag on patch 1
- Limited stride command to AV1 decoding only
- Link to v2: https://patch.msgid.link/20260417-topic-sm8x50-iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org

Changes in v2:
- Fixed bug breaking 8bit decoding
- Dropped filtering on G_FMT while waiting for soure change
- Dropped format filtering on ENUMFMT
- Switched ALIGN(x, 192) to roundup(x, 192) because ALIGN works only with Power Of Two numbers
- Cleaned and refactors the width/height/stride calculations
- Cleaned and redesigned the buffer calculations functions with proper comments and var names
- Passed fluster and v4l2-compliance to check for non regression
- Tested on SM8550
- Added missing V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10 with made gstreamer fail decoding
- Link to v1: https://patch.msgid.link/20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org

---
Neil Armstrong (6):
      media: qcom: iris: add helpers for 8bit and 10bit formats
      media: qcom: iris: add QC10C & P010 buffer size calculations
      media: qcom: iris: gen2: add support for 10bit decoding
      media: qcom: iris: vdec: update size and stride calculations for 10bit formats
      media: qcom: iris: vdec: update find_format to handle 8bit and 10bit formats
      media: qcom: iris: vdec: allow GEN2 decoding into 10bit format

 drivers/media/platform/qcom/iris/iris_buffer.c     | 195 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |   8 +-
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  75 +++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   1 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  37 +++-
 drivers/media/platform/qcom/iris/iris_instance.h   |   2 +
 .../platform/qcom/iris/iris_platform_common.h      |   1 +
 drivers/media/platform/qcom/iris/iris_utils.c      |  16 +-
 drivers/media/platform/qcom/iris/iris_utils.h      |   2 +
 drivers/media/platform/qcom/iris/iris_vdec.c       |  42 ++++-
 10 files changed, 364 insertions(+), 15 deletions(-)
---
base-commit: 86693e86019a7466be961fd4f45d407cc0b0ba0a
change-id: 20260408-topic-sm8x50-iris-10bit-decoding-074c3ac7975c

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


