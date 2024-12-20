Return-Path: <linux-media+bounces-23944-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6799F9592
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 16:40:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FAF4188C9BB
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 15:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C9F218E92;
	Fri, 20 Dec 2024 15:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="FKqpM8Vp"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387E82C190
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 15:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734709193; cv=pass; b=TeEvAlOKIxOrj1b38pI9c17mzQK37krr3ixYu6RJDMbaYtLDDYinrAQTrHl0jTvbdi/Lol5I9aihE35wHpqgEYLJR4rxNL5dHGs2d6C2z6zpwJQltYsq/hWDCzZQ+4vqZDfzk4sBECBnBIGg+S+K41o0lHJnkK9hhPM/osS1tdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734709193; c=relaxed/simple;
	bh=Bo4fuEuSEGfnN7dsIsDLGrzQ7+OsnxvCmXCHpV0h87I=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tagmOs1qp+Gop1gGsafqFEBcdrQImM8fMbPt7k3zz/yGmgwGbl8GDnQfRu6JZhghqBudnOWcwtG3Qn01jHAql3yCGTM5BZ7EODHLQSvbVVcOCLWrPB9sVicfPGHiK4QxN2W0oSuQnEKDserjNPuo4jMAHBQ9+1R1nOseTCcFGeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=FKqpM8Vp; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1734709190; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=a5M6In22D/Tith0FfrGI65MjN9LFibWQdBytiMjMUXpfixmLWEfBA9Fn/7LgLgcJLwEhMaTNAAk8NXswiDmAXGl4nCH5qHe0Bcz5Br+lXw09ot+7+rLIEr/XNQwuaEEuI2s3rXZormbvGXj6pbZoVCXzBgCqH8Zx9ujNxla/plk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1734709190; h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=X7m2VMecz5Bc/ch0QeMAS8whd27HejzU2bK3dWOHZWs=; 
	b=bDZBdTBIp9Z09VztQrUk74JUFOngpdWPwSQHIBCYOofyXlAn1GDiUvLbwL1GyI6+BhiFWSFhD941MrF8lR9Ggf0xADFcGnYvFSbxZsl2DqdWT/+7omQyHbfdmyu6OcAHAVpDom52fhO1dFdOr3FqbonmnH+iFlXU2spHE21+pVc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734709190;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Subject:Subject:Message-ID:MIME-Version:Content-Type:Message-Id:Reply-To:Cc;
	bh=X7m2VMecz5Bc/ch0QeMAS8whd27HejzU2bK3dWOHZWs=;
	b=FKqpM8Vp3/U+XPOWnMCp2rFaNaR/mppjstiKakonRG7hTAx2Lq5974x/MS+OnAQf
	S52mBThEx9ST05wHhLGLM1pPQ/k8FSXagTp8QamMn+8fGfvvnISmB3kZPAaGOxA+KRD
	34/+fPwoRRK9hb+tL0/VcwGUaG5Dn28h6IVIti1g=
Received: by mx.zohomail.com with SMTPS id 1734709189213651.6160021905905;
	Fri, 20 Dec 2024 07:39:49 -0800 (PST)
Date: Fri, 20 Dec 2024 16:39:45 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.14] Qualcomm IRIS decoder
Message-ID: <20241220153945.mbjvw6r23tdw6z5r@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
X-ZohoMailClient: External

Hey Mauro & Hans,

is it still possible to pull this for 6.14?

---

The following changes since commit 40ed9e9b2808beeb835bd0ed971fb364c285d39c:

   media: uvcvideo: Announce the user our deprecation intentions (2024-12-19 14:44:43 +0000)

are available in the Git repository at:

   https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.14-qcom-iris-decoder

for you to fetch changes up to 99ca02aa1dee0b0dbfbaa91b0caceaea7e0d47b7:

   media: MAINTAINERS: add Qualcomm iris video decoder accelerator driver (2024-12-20 14:53:18 +0100)

----------------------------------------------------------------
Iris decoder driver

----------------------------------------------------------------
Dikshita Agarwal (18):
       dt-bindings: media: Add video support for QCOM SM8550 SoC
       media: iris: add platform driver for iris video device
       media: iris: implement iris v4l2 file ops
       media: iris: introduce iris core state management with shared queues
       media: iris: implement video firmware load/unload
       media: iris: implement the boot sequence of the firmware
       media: iris: introduce host firmware interface with necessary hooks
       media: iris: implement power management
       media: iris: implement reqbuf ioctl with vb2_queue_setup
       media: iris: implement iris v4l2_ctrl_ops
       media: iris: implement vb2 streaming ops
       media: iris: allocate, initialize and queue internal buffers
       media: iris: implement vb2 ops for buf_queue and firmware response
       media: iris: add support for dynamic resolution change
       media: iris: handle streamoff/on from client on dynamic resolution change
       media: iris: add support for drain sequence
       media: iris: enable video driver probe of SM8250 SoC
       media: MAINTAINERS: add Qualcomm iris video decoder accelerator driver

Vedang Nagar (10):
       media: iris: implement s_fmt, g_fmt and try_fmt ioctls
       media: iris: implement g_selection ioctl
       media: iris: implement enum_fmt and enum_framesizes ioctls
       media: iris: implement subscribe_event and unsubscribe_event ioctls
       media: iris: implement query_cap ioctl
       media: iris: implement set properties to firmware during streamon
       media: iris: subscribe parameters and properties on the firmware for hfi_gen2
       media: iris: add check whether the video session is supported
       media: iris: implement power scaling for vpu2 and vpu3
       media: iris: add sub state transition checks

  .../bindings/media/qcom,sm8550-iris.yaml           | 158 ++++
  MAINTAINERS                                        |  10 +
  drivers/media/platform/qcom/Kconfig                |   1 +
  drivers/media/platform/qcom/Makefile               |   1 +
  drivers/media/platform/qcom/iris/Kconfig           |  13 +
  drivers/media/platform/qcom/iris/Makefile          |  27 +
  drivers/media/platform/qcom/iris/iris_buffer.c     | 623 ++++++++++++++
  drivers/media/platform/qcom/iris/iris_buffer.h     | 117 +++
  drivers/media/platform/qcom/iris/iris_core.c       |  96 +++
  drivers/media/platform/qcom/iris/iris_core.h       | 111 +++
  drivers/media/platform/qcom/iris/iris_ctrls.c      | 259 ++++++
  drivers/media/platform/qcom/iris/iris_ctrls.h      |  22 +
  drivers/media/platform/qcom/iris/iris_firmware.c   | 116 +++
  drivers/media/platform/qcom/iris/iris_firmware.h   |  15 +
  drivers/media/platform/qcom/iris/iris_hfi_common.c | 176 ++++
  drivers/media/platform/qcom/iris/iris_hfi_common.h | 155 ++++
  drivers/media/platform/qcom/iris/iris_hfi_gen1.h   |  16 +
  .../platform/qcom/iris/iris_hfi_gen1_command.c     | 826 ++++++++++++++++++
  .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 448 ++++++++++
  .../platform/qcom/iris/iris_hfi_gen1_response.c    | 666 ++++++++++++++
  drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |  41 +
  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 957 +++++++++++++++++++++
  .../platform/qcom/iris/iris_hfi_gen2_defines.h     | 161 ++++
  .../platform/qcom/iris/iris_hfi_gen2_packet.c      | 292 +++++++
  .../platform/qcom/iris/iris_hfi_gen2_packet.h      | 125 +++
  .../platform/qcom/iris/iris_hfi_gen2_response.c    | 934 ++++++++++++++++++++
  drivers/media/platform/qcom/iris/iris_hfi_queue.c  | 314 +++++++
  drivers/media/platform/qcom/iris/iris_hfi_queue.h  | 182 ++++
  drivers/media/platform/qcom/iris/iris_instance.h   |  77 ++
  .../platform/qcom/iris/iris_platform_common.h      | 186 ++++
  .../platform/qcom/iris/iris_platform_sm8250.c      | 148 ++++
  .../platform/qcom/iris/iris_platform_sm8550.c      | 265 ++++++
  drivers/media/platform/qcom/iris/iris_power.c      | 140 +++
  drivers/media/platform/qcom/iris/iris_power.h      |  13 +
  drivers/media/platform/qcom/iris/iris_probe.c      | 378 ++++++++
  drivers/media/platform/qcom/iris/iris_resources.c  | 131 +++
  drivers/media/platform/qcom/iris/iris_resources.h  |  18 +
  drivers/media/platform/qcom/iris/iris_state.c      | 276 ++++++
  drivers/media/platform/qcom/iris/iris_state.h      | 144 ++++
  drivers/media/platform/qcom/iris/iris_utils.c      |  90 ++
  drivers/media/platform/qcom/iris/iris_utils.h      |  53 ++
  drivers/media/platform/qcom/iris/iris_vb2.c        | 335 ++++++++
  drivers/media/platform/qcom/iris/iris_vb2.h        |  19 +
  drivers/media/platform/qcom/iris/iris_vdec.c       | 659 ++++++++++++++
  drivers/media/platform/qcom/iris/iris_vdec.h       |  25 +
  drivers/media/platform/qcom/iris/iris_vidc.c       | 453 ++++++++++
  drivers/media/platform/qcom/iris/iris_vidc.h       |  15 +
  drivers/media/platform/qcom/iris/iris_vpu2.c       |  38 +
  drivers/media/platform/qcom/iris/iris_vpu3.c       | 122 +++
  drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 270 ++++++
  drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  91 ++
  drivers/media/platform/qcom/iris/iris_vpu_common.c | 369 ++++++++
  drivers/media/platform/qcom/iris/iris_vpu_common.h |  28 +
  .../platform/qcom/iris/iris_vpu_register_defines.h |  17 +
  54 files changed, 11222 insertions(+)
  create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
  create mode 100644 drivers/media/platform/qcom/iris/Kconfig
  create mode 100644 drivers/media/platform/qcom/iris/Makefile
  create mode 100644 drivers/media/platform/qcom/iris/iris_buffer.c
  create mode 100644 drivers/media/platform/qcom/iris/iris_buffer.h
  create mode 100644 drivers/media/platform/qcom/iris/iris_core.c
  create mode 100644 drivers/media/platform/qcom/iris/iris_core.h
  create mode 100644 drivers/media/platform/qcom/iris/iris_ctrls.c
  create mode 100644 drivers/media/platform/qcom/iris/iris_ctrls.h
  create mode 100644 drivers/media/platform/qcom/iris/iris_firmware.c
  create mode 100644 drivers/media/platform/qcom/iris/iris_firmware.h
  create mode 100644 drivers/media/platform/qcom/iris/iris_hfi_common.c
  create mode 100644 drivers/media/platform/qcom/iris/iris_hfi_common.h
  create mode 100644 drivers/media/platform/qcom/iris/iris_hfi_gen1.h
  create mode 100644 drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
  create mode 100644 drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
  create mode 100644 drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
  create mode 100644 drivers/media/platform/qcom/iris/iris_hfi_gen2.h
  create mode 100644 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
  create mode 100644 drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
  create mode 100644 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
  create mode 100644 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
  create mode 100644 drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
  create mode 100644 drivers/media/platform/qcom/iris/iris_hfi_queue.c
  create mode 100644 drivers/media/platform/qcom/iris/iris_hfi_queue.h
  create mode 100644 drivers/media/platform/qcom/iris/iris_instance.h
  create mode 100644 drivers/media/platform/qcom/iris/iris_platform_common.h
  create mode 100644 drivers/media/platform/qcom/iris/iris_platform_sm8250.c
  create mode 100644 drivers/media/platform/qcom/iris/iris_platform_sm8550.c
  create mode 100644 drivers/media/platform/qcom/iris/iris_power.c
  create mode 100644 drivers/media/platform/qcom/iris/iris_power.h
  create mode 100644 drivers/media/platform/qcom/iris/iris_probe.c
  create mode 100644 drivers/media/platform/qcom/iris/iris_resources.c
  create mode 100644 drivers/media/platform/qcom/iris/iris_resources.h
  create mode 100644 drivers/media/platform/qcom/iris/iris_state.c
  create mode 100644 drivers/media/platform/qcom/iris/iris_state.h
  create mode 100644 drivers/media/platform/qcom/iris/iris_utils.c
  create mode 100644 drivers/media/platform/qcom/iris/iris_utils.h
  create mode 100644 drivers/media/platform/qcom/iris/iris_vb2.c
  create mode 100644 drivers/media/platform/qcom/iris/iris_vb2.h
  create mode 100644 drivers/media/platform/qcom/iris/iris_vdec.c
  create mode 100644 drivers/media/platform/qcom/iris/iris_vdec.h
  create mode 100644 drivers/media/platform/qcom/iris/iris_vidc.c
  create mode 100644 drivers/media/platform/qcom/iris/iris_vidc.h
  create mode 100644 drivers/media/platform/qcom/iris/iris_vpu2.c
  create mode 100644 drivers/media/platform/qcom/iris/iris_vpu3.c
  create mode 100644 drivers/media/platform/qcom/iris/iris_vpu_buffer.c
  create mode 100644 drivers/media/platform/qcom/iris/iris_vpu_buffer.h
  create mode 100644 drivers/media/platform/qcom/iris/iris_vpu_common.c
  create mode 100644 drivers/media/platform/qcom/iris/iris_vpu_common.h
  create mode 100644 drivers/media/platform/qcom/iris/iris_vpu_register_defines.h

Regards,
Sebastian Fricke

