Return-Path: <linux-media+bounces-31511-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F94AA6275
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 19:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A2F93B641A
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 17:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE72B21A94F;
	Thu,  1 May 2025 17:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="hxQwEFJ7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9EB2144D5
	for <linux-media@vger.kernel.org>; Thu,  1 May 2025 17:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746121378; cv=none; b=RutkQ0Hee0sSVoN/1JyLjY6QK89ca5QbsV/47+TEwO1tvHoQzxKi4eWoL4RSTBzQM0D/pW7vDI2/CH0Jm51W89MT2Be2QzFZZHgAzGsVFDF8Ka+zXGzi3XiVvS9bLtS5bYhDywKNfCV4jX99QlBvv2in4G0wJ5DsyXapHfkUGv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746121378; c=relaxed/simple;
	bh=1UpXBzf3i5ff6P/Y3vva+uI2Ufu5cP5EuIFSltb/l/U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZkJTgCYkT6Rf2dgnRDXiiAMV8GW+Dhaey3u3c/Nfx6nsiuRbARf3nhaapDGpqUlTBHY7Lqsoc/ZOzg55US0A7hSdcRXBISm1CGoxq3k9wE/gv225Wyxrpx/slVdhzNakfERWsY/W1WF7RsRCx3bT6ubqIbPkl4eNIoNhSyNTgVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=hxQwEFJ7; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-476ae781d21so15422261cf.3
        for <linux-media@vger.kernel.org>; Thu, 01 May 2025 10:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1746121368; x=1746726168; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a0TkR8Q8dKeI910w6TDtW8pelKBKG4+7EVXlhonsXzk=;
        b=hxQwEFJ7xEGhcibmFK2GvjeDBeZlF1yP68BPbvDeTmKU7RQxYdhMnRp1ogjzSva4YH
         jh8IzdjVNhOpnO4/Usbmsd5sjsGWYqMRfr5iMdYMNNpVPlS/+avoqHAb/EqnFjF0DLGr
         w8Ty1RJI7e1dE3fIDk2eiyukfSQLGZSSCqZzPFwmEFTK3sap78r8kNopBDBHhziKAqWw
         tayFKjZTsnCl14v+/hmzPa38D77HKgJ8e7SfgEmkpEFh7rGz7hRw2NJd0R16ypOLEEDw
         M/HUZKFi/DhRrK/GAws7uYxp7DCyGaucJRrpWxjrX0W94KlF5mnqsVKSs8f2HrwcCThR
         VxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746121368; x=1746726168;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a0TkR8Q8dKeI910w6TDtW8pelKBKG4+7EVXlhonsXzk=;
        b=wY/BHdRy3c94qFgMraL2105n45nIyBv6pSbUCMNo/QM4cKfUnItIDtIHNrcPb7aXnR
         LTSi1Ino9DdrQKiPx9UbQW91YZo8AX1bfq2bQfP6FssQ4o0bko+JBJQmP14SZ1hHh/f4
         3EApZ40CIQIUN353GAZX3GjznbaJoff2k8V4QMdDRIvnlY91tYmFUEC0D0d6pmYhdusz
         Ep+bwyd8cNoM2ZBraNjLGE7dzvouDaOQ9LVQhsmCEt/QtGgvZ3+QGc697p8gx7dB1qdB
         QOmvqI7yI5h4d0R52FL9coCpp0w9u+JerOm98n1TOA97p2Q9Gvnadp/ovbI1f72o2P+x
         PQag==
X-Gm-Message-State: AOJu0YyqRcYqiGp6L0c/uOj9TMcFrmtpUUVWYiu8H0qxicAbszzexJm0
	CMyM1jaXKdLI8NKP30doRXRuEsCLRknR34Tbjh8qrz06E/srBR0GWR8LechJ1T4=
X-Gm-Gg: ASbGncsj56PVzDtR2UA/lpVY2YMLtJvB0CRBqALngJdniRC5Rh8EP0o+2ZOQ7CF2str
	bSD+25PIXQkOISYOoeXL1XqyLyrG3mPaPtAtA1cbshnAQp8YAf+j1vFPvDZUxe8mydlTVXeT/0U
	9GUqT5uyARF5NlmeSGIbwc03D4cYxA8choF/JODk/R0JnVVwQBzIgIZg+S8vdsan/zwJXXbEhvQ
	hPxeoELrtVYdKrw2BOa43Vw6BVW52q5ByfY1ycqCXjw+/fuNaWhGnj093aL2Vzfoq+URafJz/Q5
	J/5G2OvwiImRIErwb+2iWzkzmXSJ8VcwWS1b+NTD0TraLllx6zbuX3hi
X-Google-Smtp-Source: AGHT+IG8gI4fRZ0N2zxYxXU7su9ChnPh0sK8KTnTVXtShX+3xhwYmPsLLGX3xmedfcIb2d2kbukCBA==
X-Received: by 2002:a05:6214:130f:b0:6e4:3eb1:2bde with SMTP id 6a1803df08f44-6f515489671mr2805636d6.19.1746121367737;
        Thu, 01 May 2025 10:42:47 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:8242::5ac? ([2606:6d00:17:8242::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f44f58asm7346876d6.71.2025.05.01.10.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 10:42:47 -0700 (PDT)
Message-ID: <3d36655906c21b9dfc39dd5c28de6a77ce9a318a.camel@ndufresne.ca>
Subject: Re: [PATCH v2 5/8] media: chips-media: wave6: Add Wave6 VPU
 interface
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Nas Chung <nas.chung@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil@xs4all.nl, sebastian.fricke@collabora.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-imx@nxp.com, marex@denx.de, 
	jackson.lee@chipsnmedia.com, lafley.kim@chipsnmedia.com, Ming Qian
	 <ming.qian@oss.nxp.com>
Date: Thu, 01 May 2025 13:42:45 -0400
In-Reply-To: <20250422093119.595-6-nas.chung@chipsnmedia.com>
References: <20250422093119.595-1-nas.chung@chipsnmedia.com>
	 <20250422093119.595-6-nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Nas,

Le mardi 22 avril 2025 =C3=A0 18:31 +0900, Nas Chung a =C3=A9crit=C2=A0:
> This adds the interface layer to manage hardware register configuration
> and communication with the Chips&Media Wave6 video codec IP.
>=20
> The interface provides low-level helper functions used by the
> Wave6 core driver to implement video encoding and decoding operations.
> It handles command submission to the firmware via MMIO registers,
> and waits for a response by polling the firmware busy flag.

Haven't fully reviewed yet, but wanted to give some early feedback. First t=
hing
that is extremely hard is to check if your locking is sufficient and adequa=
te.
Until this patch, there was only ioctl call, which are protected by the dev=
ice
lock I believe, but this patch introduce the m2m worker thread and one more
thread of your own.

I think in you instance/vpu structure it would help me if you can document =
which
bits are protected by which other bit, and why some memory pointers don't n=
eed
protection (which I often fail to see). One way to verify that your
expectations are met is by adding lockdep_assert_held() in places locking i=
s
needed.

Another thing I notice, is that you have a state machine, but nothing to ve=
rify
if the state transition are valid. Please document which transitions are
expected, and implement proper validation.

I'm also not particularly fan of give_command() calls, why don't you modern=
ize
this code and simply add setter function with a nice name ?

Nicolas

>=20
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> Tested-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
> =C2=A0.../platform/chips-media/wave6/wave6-hw.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
 3108 +++++++++++++++++
> =C2=A0.../platform/chips-media/wave6/wave6-hw.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 69 +
> =C2=A0.../platform/chips-media/wave6/wave6-vdi.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 49 +
> =C2=A0.../platform/chips-media/wave6/wave6-vdi.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 45 +
> =C2=A0.../platform/chips-media/wave6/wave6-vpuapi.c |=C2=A0 998 ++++++
> =C2=A0.../platform/chips-media/wave6/wave6-vpuapi.h |=C2=A0 987 ++++++
> =C2=A0.../chips-media/wave6/wave6-vpuerror.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 262 ++
> =C2=A07 files changed, 5518 insertions(+)
> =C2=A0create mode 100644 drivers/media/platform/chips-media/wave6/wave6-h=
w.c
> =C2=A0create mode 100644 drivers/media/platform/chips-media/wave6/wave6-h=
w.h
> =C2=A0create mode 100644 drivers/media/platform/chips-media/wave6/wave6-v=
di.c
> =C2=A0create mode 100644 drivers/media/platform/chips-media/wave6/wave6-v=
di.h
> =C2=A0create mode 100644 drivers/media/platform/chips-media/wave6/wave6-v=
puapi.c
> =C2=A0create mode 100644 drivers/media/platform/chips-media/wave6/wave6-v=
puapi.h
> =C2=A0create mode 100644 drivers/media/platform/chips-media/wave6/wave6-v=
puerror.h
>=20
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-hw.c b/driver=
s/media/platform/chips-media/wave6/wave6-hw.c
> new file mode 100644
> index 000000000000..d202a42aa4f7
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-hw.c
> @@ -0,0 +1,3108 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> +/*
> + * Wave6 series multi-standard codec IP - wave6 backend interface
> + *
> + * Copyright (C) 2025 CHIPS&MEDIA INC
> + */
> +
> +#include <linux/iopoll.h>
> +#include "wave6-vpu-core.h"
> +#include "wave6-hw.h"
> +#include "wave6-regdefine.h"
> +#include "wave6-trace.h"
> +
> +static void wave6_print_reg_err(struct vpu_core_device *vpu_dev, u32 reg=
_fail_reason)
> +{
> +	char *caller =3D __builtin_return_address(0);
> +	struct device *dev =3D vpu_dev->dev;
> +
> +	switch (reg_fail_reason) {
> +	case WAVE6_SYSERR_QUEUEING_FAIL:
> +		dev_dbg(dev, "%s: queueing failure 0x%x\n", caller, reg_fail_reason);
> +		break;
> +	case WAVE6_SYSERR_RESULT_NOT_READY:
> +		dev_err(dev, "%s: result not ready 0x%x\n", caller, reg_fail_reason);
> +		break;
> +	case WAVE6_SYSERR_ACCESS_VIOLATION_HW:
> +		dev_err(dev, "%s: access violation 0x%x\n", caller, reg_fail_reason);
> +		break;
> +	case WAVE6_SYSERR_WATCHDOG_TIMEOUT:
> +		dev_err(dev, "%s: watchdog timeout 0x%x\n", caller, reg_fail_reason);
> +		break;
> +	case WAVE6_SYSERR_BUS_ERROR:
> +		dev_err(dev, "%s: bus error 0x%x\n", caller, reg_fail_reason);
> +		break;
> +	case WAVE6_SYSERR_DOUBLE_FAULT:
> +		dev_err(dev, "%s: double fault 0x%x\n", caller, reg_fail_reason);
> +		break;
> +	case WAVE6_SYSERR_VPU_STILL_RUNNING:
> +		dev_err(dev, "%s: still running 0x%x\n", caller, reg_fail_reason);
> +		break;
> +	default:
> +		dev_err(dev, "%s: failure: 0x%x\n", caller, reg_fail_reason);
> +		break;
> +	}
> +}
> +
> +static void wave6_dec_set_display_buffer(struct vpu_instance *inst, stru=
ct frame_buffer fb)
> +{
> +	struct dec_info *p_dec_info =3D &inst->codec_info->dec_info;
> +	int index;
> +
> +	for (index =3D 0; index < WAVE6_MAX_FBS; index++) {
> +		if (!p_dec_info->disp_buf[index].buf_y) {
> +			p_dec_info->disp_buf[index] =3D fb;
> +			p_dec_info->disp_buf[index].index =3D index;
> +			break;
> +		}
> +	}
> +}
> +
> +static struct frame_buffer wave6_dec_get_display_buffer(struct vpu_insta=
nce *inst,
> +							dma_addr_t addr)
> +{
> +	struct dec_info *p_dec_info =3D &inst->codec_info->dec_info;
> +	int i;
> +	struct frame_buffer fb;
> +
> +	memset(&fb, 0, sizeof(struct frame_buffer));
> +
> +	for (i =3D 0; i < WAVE6_MAX_FBS; i++) {
> +		if (p_dec_info->disp_buf[i].buf_y =3D=3D addr) {
> +			fb =3D p_dec_info->disp_buf[i];
> +			break;
> +		}
> +	}
> +
> +	return fb;
> +}
> +
> +static void wave6_dec_remove_display_buffer(struct vpu_instance *inst,
> +					=C2=A0=C2=A0=C2=A0 dma_addr_t addr)
> +{
> +	struct dec_info *p_dec_info =3D &inst->codec_info->dec_info;
> +	int i;
> +
> +	for (i =3D 0; i < WAVE6_MAX_FBS; i++) {
> +		if (p_dec_info->disp_buf[i].buf_y =3D=3D addr) {
> +			memset(&p_dec_info->disp_buf[i], 0, sizeof(struct frame_buffer));
> +			break;
> +		}
> +	}
> +}
> +
> +static int wave6_wait_vpu_busy(struct vpu_core_device *vpu_dev, unsigned=
 int addr)
> +{
> +	u32 data;
> +
> +	return read_poll_timeout(wave6_vdi_readl, data, !data,
> +				 W6_VPU_POLL_DELAY_US, W6_VPU_POLL_TIMEOUT,
> +				 false, vpu_dev, addr);
> +}
> +
> +void wave6_vpu_enable_interrupt(struct vpu_core_device *vpu_dev)
> +{
> +	u32 data;
> +
> +	data =3D BIT(W6_INT_BIT_ENC_SET_PARAM);
> +	data |=3D BIT(W6_INT_BIT_ENC_PIC);
> +	data |=3D BIT(W6_INT_BIT_INIT_SEQ);
> +	data |=3D BIT(W6_INT_BIT_DEC_PIC);
> +	data |=3D BIT(W6_INT_BIT_BSBUF_ERROR);
> +	data |=3D BIT(W6_INT_BIT_REQ_WORK_BUF);
> +
> +	vpu_write_reg(vpu_dev, W6_VPU_VINT_ENABLE, data);
> +}
> +
> +void wave6_vpu_check_state(struct vpu_core_device *vpu_dev)
> +{
> +	u32 val;
> +	int ret;
> +
> +	ret =3D read_poll_timeout(vpu_read_reg, val, val !=3D 0,
> +				W6_VPU_POLL_DELAY_US, W6_VPU_POLL_TIMEOUT,
> +				false, vpu_dev, W6_VPU_VCPU_CUR_PC);
> +	if (!ret)
> +		vpu_dev->entity.on_boot(vpu_dev->dev);
> +}
> +
> +bool wave6_vpu_is_init(struct vpu_core_device *vpu_dev)
> +{
> +	return vpu_read_reg(vpu_dev, W6_VPU_VCPU_CUR_PC) !=3D 0;
> +}
> +
> +static int32_t wave6_vpu_get_product_id(struct vpu_core_device *vpu_dev)
> +{
> +	u32 product_id =3D PRODUCT_ID_NONE;
> +	u32 val;
> +
> +	val =3D vpu_read_reg(vpu_dev, W6_VPU_RET_PRODUCT_VERSION);
> +
> +	switch (val) {
> +	case WAVE617_CODE:
> +		product_id =3D PRODUCT_ID_617; break;
> +	case WAVE627_CODE:
> +		product_id =3D PRODUCT_ID_627; break;
> +	case WAVE633_CODE:
> +	case WAVE637_CODE:
> +	case WAVE663_CODE:
> +	case WAVE677_CODE:
> +		product_id =3D PRODUCT_ID_637; break;
> +	default:
> +		dev_err(vpu_dev->dev, "Invalid product (%x)\n", val);
> +		break;
> +	}
> +
> +	return product_id;
> +}
> +
> +static void wave6_send_command(struct vpu_core_device *vpu_dev, u32 id, =
u32 std, u32 cmd)
> +{
> +	if (cmd =3D=3D W6_CMD_CREATE_INSTANCE) {
> +		vpu_write_reg(vpu_dev, W6_CMD_INSTANCE_INFO, (std << 16));
> +
> +		vpu_write_reg(vpu_dev, W6_VPU_BUSY_STATUS, 1);
> +		vpu_write_reg(vpu_dev, W6_COMMAND, cmd);
> +
> +		vpu_write_reg(vpu_dev, W6_VPU_HOST_INT_REQ, 1);
> +	} else {
> +		vpu_write_reg(vpu_dev, W6_CMD_INSTANCE_INFO, (std << 16) | (id & 0xfff=
f));
> +
> +		vpu_write_reg(vpu_dev, W6_VPU_BUSY_STATUS, 1);
> +		vpu_write_reg(vpu_dev, W6_COMMAND, cmd);
> +
> +		vpu_write_reg(vpu_dev, W6_VPU_HOST_INT_REQ, 1);
> +	}
> +
> +	trace_send_command(vpu_dev, id, std, cmd);
> +}
> +
> +static int wave6_send_query(struct vpu_core_device *vpu_dev, u32 id, u32=
 std,
> +			=C2=A0=C2=A0=C2=A0 enum wave6_query_option query_opt)
> +{
> +	int ret;
> +	u32 reg_val;
> +
> +	vpu_write_reg(vpu_dev, W6_QUERY_OPTION, query_opt);
> +	wave6_send_command(vpu_dev, id, std, W6_CMD_QUERY);
> +
> +	ret =3D wave6_wait_vpu_busy(vpu_dev, W6_VPU_BUSY_STATUS);
> +	if (ret) {
> +		dev_err(vpu_dev->dev, "query timed out opt=3D0x%x\n", query_opt);
> +		return ret;
> +	}
> +
> +	if (!vpu_read_reg(vpu_dev, W6_RET_SUCCESS)) {
> +		reg_val =3D vpu_read_reg(vpu_dev, W6_RET_FAIL_REASON);
> +		wave6_print_reg_err(vpu_dev, reg_val);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +int wave6_vpu_get_version(struct vpu_core_device *vpu_dev, uint32_t *ver=
sion_info,
> +			=C2=A0 uint32_t *revision)
> +{
> +	struct vpu_attr *attr =3D &vpu_dev->attr;
> +	u32 reg_val;
> +	u8 *str;
> +	int ret;
> +	u32 hw_config_def1, hw_config_feature;
> +
> +	ret =3D wave6_send_query(vpu_dev, 0, 0, W6_QUERY_OPT_GET_VPU_INFO);
> +	if (ret)
> +		return ret;
> +
> +	reg_val =3D vpu_read_reg(vpu_dev, W6_RET_PRODUCT_NAME);
> +	str =3D (u8 *)&reg_val;
> +	attr->product_name[0] =3D str[3];
> +	attr->product_name[1] =3D str[2];
> +	attr->product_name[2] =3D str[1];
> +	attr->product_name[3] =3D str[0];
> +	attr->product_name[4] =3D 0;
> +
> +	attr->product_id =3D wave6_vpu_get_product_id(vpu_dev);
> +	attr->product_version =3D vpu_read_reg(vpu_dev, W6_RET_PRODUCT_VERSION)=
;
> +	attr->fw_version =3D vpu_read_reg(vpu_dev, W6_RET_FW_API_VERSION);
> +	attr->fw_revision =3D vpu_read_reg(vpu_dev, W6_RET_FW_VERSION);
> +	hw_config_def1 =3D vpu_read_reg(vpu_dev, W6_RET_STD_DEF1);
> +	hw_config_feature =3D vpu_read_reg(vpu_dev, W6_RET_CONF_FEATURE);
> +
> +	attr->support_hevc10bit_enc =3D (hw_config_feature >> 3) & 1;
> +	attr->support_avc10bit_enc =3D (hw_config_feature >> 11) & 1;
> +
> +	attr->support_decoders =3D 0;
> +	attr->support_encoders =3D 0;
> +	if (attr->product_id =3D=3D PRODUCT_ID_617) {
> +		attr->support_decoders =3D (((hw_config_def1 >> 2) & 0x01) << STD_HEVC=
);
> +		attr->support_decoders |=3D (((hw_config_def1 >> 3) & 0x01) << STD_AVC=
);
> +	} else if (attr->product_id =3D=3D PRODUCT_ID_627) {
> +		attr->support_encoders =3D (((hw_config_def1 >> 0) & 0x01) << STD_HEVC=
);
> +		attr->support_encoders |=3D (((hw_config_def1 >> 1) & 0x01) << STD_AVC=
);
> +	} else if (attr->product_id =3D=3D PRODUCT_ID_637) {
> +		attr->support_decoders =3D (((hw_config_def1 >> 2) & 0x01) << STD_HEVC=
);
> +		attr->support_decoders |=3D (((hw_config_def1 >> 3) & 0x01) << STD_AVC=
);
> +		attr->support_encoders =3D (((hw_config_def1 >> 0) & 0x01) << STD_HEVC=
);
> +		attr->support_encoders |=3D (((hw_config_def1 >> 1) & 0x01) << STD_AVC=
);
> +	}
> +
> +	attr->support_dual_core =3D (hw_config_def1 >> 26) & 0x01;
> +	attr->support_bitstream_mode =3D BS_MODE_PIC_END;
> +
> +	if (version_info)
> +		*version_info =3D attr->fw_version;
> +	if (revision)
> +		*revision =3D attr->fw_revision;
> +
> +	return 0;
> +}
> +
> +int wave6_vpu_build_up_dec_param(struct vpu_instance *inst,
> +				 struct dec_open_param *param)
> +{
> +	struct dec_info *p_dec_info =3D &inst->codec_info->dec_info;
> +	u32 reg_val;
> +	int ret;
> +
> +	p_dec_info->cycle_per_tick =3D 256;
> +	p_dec_info->sec_axi_info.use_dec_ip =3D true;
> +	p_dec_info->sec_axi_info.use_dec_lf_row =3D true;
> +	switch (inst->std) {
> +	case W_HEVC_DEC:
> +		p_dec_info->seq_change_mask =3D SEQ_CHANGE_ENABLE_ALL_HEVC;
> +		break;
> +	case W_AVC_DEC:
> +		p_dec_info->seq_change_mask =3D SEQ_CHANGE_ENABLE_ALL_AVC;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_CREATE_INST_TEMP_BASE, param->inst_=
buffer.temp_base);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_CREATE_INST_TEMP_SIZE, param->inst_=
buffer.temp_size);
> +
> +	reg_val =3D wave6_vdi_convert_endian(param->stream_endian);
> +	reg_val =3D (~reg_val & VDI_128BIT_ENDIAN_MASK);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_CREATE_INST_BS_PARAM, reg_val);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_CREATE_INST_ADDR_EXT, param->ext_ad=
dr_vcpu);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_CREATE_INST_DISP_MODE, param->disp_=
mode);
> +
> +	reg_val =3D (COMMAND_QUEUE_DEPTH << 8) | (1 << 4) | 1;
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_CREATE_INST_CORE_INFO, reg_val);
> +
> +	reg_val =3D (param->is_secure_inst << 8) | (param->inst_priority);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_CREATE_INST_PRIORITY, reg_val);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_CREATE_INST_TIMEOUT_CYCLE_COUNT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W6_VPU_TIMEOUT_CYCLE_COUNT);
> +
> +	wave6_send_command(inst->dev, 0, inst->std, W6_CMD_CREATE_INSTANCE);
> +	ret =3D wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
> +	if (ret) {
> +		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
> +		return ret;
> +	}
> +
> +	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
> +		u32 reason_code =3D vpu_read_reg(inst->dev, W6_RET_FAIL_REASON);
> +
> +		wave6_print_reg_err(inst->dev, reason_code);
> +		return -EIO;
> +	}
> +
> +	inst->id =3D vpu_read_reg(inst->dev, W6_RET_INSTANCE_ID);
> +
> +	return 0;
> +}
> +
> +int wave6_vpu_dec_init_seq(struct vpu_instance *inst)
> +{
> +	struct dec_info *p_dec_info;
> +	u32 bs_option =3D 0;
> +	int ret;
> +
> +	if (!inst->codec_info)
> +		return -EINVAL;
> +
> +	p_dec_info =3D &inst->codec_info->dec_info;
> +
> +	switch (p_dec_info->open_param.bs_mode) {
> +	case BS_MODE_INTERRUPT:
> +		bs_option =3D 0;
> +		break;
> +	case BS_MODE_PIC_END:
> +		bs_option =3D BSOPTION_ENABLE_EXPLICIT_END;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_INIT_SEQ_BS_RD_PTR, p_dec_info->str=
eam_rd_ptr);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_INIT_SEQ_BS_WR_PTR, p_dec_info->str=
eam_wr_ptr);
> +
> +	if (p_dec_info->stream_end)
> +		bs_option =3D 3;
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_INIT_SEQ_BS_OPTION, bs_option);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_INIT_SEQ_OPTION, W6_INIT_SEQ_OPT_NO=
RMAL);
> +
> +	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_INIT_SEQ);
> +	ret =3D wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
> +	if (ret) {
> +		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
> +		return ret;
> +	}
> +
> +	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
> +		u32 reason_code =3D vpu_read_reg(inst->dev, W6_RET_FAIL_REASON);
> +
> +		wave6_print_reg_err(inst->dev, reason_code);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static void wave6_get_dec_seq_result(struct vpu_instance *inst, struct d=
ec_initial_info *info)
> +{
> +	u32 reg_val;
> +	u32 profile_compatibility;
> +	u32 left, right, top, bottom;
> +
> +	info->rd_ptr =3D wave6_vpu_dec_get_rd_ptr(inst);
> +
> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_PIC_SIZE);
> +	info->pic_width =3D ((reg_val >> 16) & 0xffff);
> +	info->pic_height =3D (reg_val & 0xffff);
> +	info->min_frame_buffer_count =3D vpu_read_reg(inst->dev, W6_RET_DEC_NUM=
_REQUIRED_FBC_FB);
> +	info->frame_buf_delay =3D vpu_read_reg(inst->dev, W6_RET_DEC_NUM_REORDE=
R_DELAY);
> +	info->req_mv_buffer_count =3D vpu_read_reg(inst->dev, W6_RET_DEC_NUM_RE=
QUIRED_COL_BUF);
> +
> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_CROP_LEFT_RIGHT);
> +	left =3D (reg_val >> 16) & 0xffff;
> +	right =3D reg_val & 0xffff;
> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_CROP_TOP_BOTTOM);
> +	top =3D (reg_val >> 16) & 0xffff;
> +	bottom =3D reg_val & 0xffff;
> +
> +	info->pic_crop_rect.left =3D left;
> +	info->pic_crop_rect.right =3D info->pic_width - right;
> +	info->pic_crop_rect.top =3D top;
> +	info->pic_crop_rect.bottom =3D info->pic_height - bottom;
> +
> +	info->f_rate_numerator =3D vpu_read_reg(inst->dev, W6_RET_DEC_FRAME_RAT=
E_NR);
> +	info->f_rate_denominator =3D vpu_read_reg(inst->dev, W6_RET_DEC_FRAME_R=
ATE_DR);
> +
> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_COLOR_SAMPLE_INFO);
> +	info->luma_bitdepth =3D (reg_val >> 0) & 0x0f;
> +	info->chroma_bitdepth =3D (reg_val >> 4) & 0x0f;
> +	info->chroma_format_idc =3D (reg_val >> 8) & 0x0f;
> +	info->aspect_rate_info =3D (reg_val >> 16) & 0xff;
> +	info->is_ext_sar =3D (info->aspect_rate_info =3D=3D H264_VUI_SAR_IDC_EX=
TENDED ? true : false);
> +	if (info->is_ext_sar)
> +		info->aspect_rate_info =3D vpu_read_reg(inst->dev, W6_RET_DEC_ASPECT_R=
ATIO);
> +	info->bitrate =3D vpu_read_reg(inst->dev, W6_RET_DEC_BIT_RATE);
> +
> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_SEQ_PARAM);
> +	info->level =3D reg_val & 0xff;
> +	profile_compatibility =3D (reg_val >> 12) & 0xff;
> +	info->profile =3D (reg_val >> 24) & 0x1f;
> +	info->tier =3D (reg_val >> 29) & 0x01;
> +
> +	if (inst->std =3D=3D W_HEVC_DEC) {
> +		if (!info->profile) {
> +			if ((profile_compatibility & 0x06) =3D=3D 0x06)
> +				info->profile =3D HEVC_PROFILE_MAIN;
> +			else if ((profile_compatibility & 0x04) =3D=3D 0x04)
> +				info->profile =3D HEVC_PROFILE_MAIN10;
> +			else if ((profile_compatibility & 0x08) =3D=3D 0x08)
> +				info->profile =3D HEVC_PROFILE_STILLPICTURE;
> +			else
> +				info->profile =3D HEVC_PROFILE_MAIN;
> +		}
> +	} else if (inst->std =3D=3D W_AVC_DEC) {
> +		info->profile =3D (reg_val >> 24) & 0x7f;
> +	}
> +
> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_COLOR_CONFIG);
> +	if (reg_val) {
> +		info->color.video_signal_type_present =3D true;
> +		info->color.color_description_present =3D reg_val & 0x1;
> +		info->color.color_primaries =3D (reg_val >> 1) & 0xFF;
> +		info->color.transfer_characteristics =3D (reg_val >> 9) & 0xFF;
> +		info->color.matrix_coefficients =3D (reg_val >> 17) & 0xFF;
> +		info->color.color_range =3D (reg_val >> 25) & 0x1;
> +		info->color.chroma_sample_position =3D (reg_val >> 26) & 0x3;
> +	} else {
> +		info->color.video_signal_type_present =3D false;
> +	}
> +}
> +
> +int wave6_vpu_dec_get_seq_info(struct vpu_instance *inst, struct dec_ini=
tial_info *info)
> +{
> +	int ret;
> +
> +	ret =3D wave6_send_query(inst->dev, inst->id, inst->std, W6_QUERY_OPT_G=
ET_RESULT);
> +	if (ret)
> +		return ret;
> +
> +	if (vpu_read_reg(inst->dev, W6_RET_DEC_DECODING_SUCCESS) !=3D 1) {
> +		info->err_reason =3D vpu_read_reg(inst->dev, W6_RET_DEC_ERR_INFO);
> +		ret =3D -EIO;
> +	} else {
> +		info->warn_info =3D vpu_read_reg(inst->dev, W6_RET_DEC_WARN_INFO);
> +	}
> +
> +	wave6_get_dec_seq_result(inst, info);
> +
> +	return ret;
> +}
> +
> +int wave6_vpu_dec_register_frame_buffer(struct vpu_instance *inst,
> +					struct frame_buffer *fb_arr,
> +					enum tiled_map_type map_type, u32 count)
> +{
> +	struct dec_info *p_dec_info =3D &inst->codec_info->dec_info;
> +	size_t fbc_remain, mv_remain, fbc_idx =3D 0, mv_idx =3D 0;
> +	size_t i, k, group_num, mv_count;
> +	dma_addr_t fbc_cr_tbl_addr;
> +	u32 reg_val;
> +	u32 endian;
> +	int ret;
> +
> +	mv_count =3D p_dec_info->initial_info.req_mv_buffer_count;
> +
> +	for (i =3D 0; i < count; i++) {
> +		if (!p_dec_info->vb_fbc_y_tbl[i].daddr)
> +			return -EINVAL;
> +		if (!p_dec_info->vb_fbc_c_tbl[i].daddr)
> +			return -EINVAL;
> +	}
> +	for (i =3D 0; i < mv_count; i++) {
> +		if (!p_dec_info->vb_mv[i].daddr)
> +			return -EINVAL;
> +	}
> +
> +	endian =3D wave6_vdi_convert_endian(p_dec_info->open_param.frame_endian=
);
> +
> +	reg_val =3D (p_dec_info->initial_info.pic_width << 16) |
> +		=C2=A0 (p_dec_info->initial_info.pic_height);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_FB_PIC_SIZE, reg_val);
> +	reg_val =3D (p_dec_info->initial_info.chroma_format_idc << 25) |
> +		=C2=A0 (p_dec_info->initial_info.luma_bitdepth << 21) |
> +		=C2=A0 (p_dec_info->initial_info.chroma_bitdepth << 17);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_FB_COMMON_PIC_INFO, reg_val);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_FB_DEFAULT_CDF, 0);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_FB_SEGMAP, 0);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_FB_MV_COL_PRE_ENT, 0);
> +
> +	fbc_remain =3D count;
> +	mv_remain =3D mv_count;
> +	group_num =3D (count > mv_count) ? ((ALIGN(count, 16) / 16) - 1) :
> +					 ((ALIGN(mv_count, 16) / 16) - 1);
> +	for (i =3D 0; i <=3D group_num; i++) {
> +		bool first_group =3D (i =3D=3D 0) ? true : false;
> +		bool last_group =3D (i =3D=3D group_num) ? true : false;
> +		u32 set_fbc_num =3D (fbc_remain >=3D 16) ? 16 : fbc_remain;
> +		u32 set_mv_num =3D (mv_remain >=3D 16) ? 16 : mv_remain;
> +		u32 fbc_start_no =3D i * 16;
> +		u32 fbc_end_no =3D fbc_start_no + set_fbc_num - 1;
> +		u32 mv_start_no =3D i * 16;
> +		u32 mv_end_no =3D mv_start_no + set_mv_num - 1;
> +
> +		reg_val =3D (p_dec_info->open_param.enable_non_ref_fbc_write << 26) |
> +			=C2=A0 (endian << 16) |
> +			=C2=A0 (last_group << 4) |
> +			=C2=A0 (first_group << 3);
> +		vpu_write_reg(inst->dev, W6_CMD_DEC_SET_FB_OPTION, reg_val);
> +
> +		reg_val =3D (fbc_start_no << 24) | (fbc_end_no << 16) |
> +			=C2=A0 (mv_start_no << 5) | mv_end_no;
> +		vpu_write_reg(inst->dev, W6_CMD_DEC_SET_FB_NUM, reg_val);
> +
> +		for (k =3D 0; k < set_fbc_num; k++) {
> +			vpu_write_reg(inst->dev, W6_CMD_DEC_SET_FB_FBC_Y0 + (k * 24),
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fb_arr[fbc_idx].buf_y);
> +			vpu_write_reg(inst->dev, W6_CMD_DEC_SET_FB_FBC_C0 + (k * 24),
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fb_arr[fbc_idx].buf_cb);
> +			vpu_write_reg(inst->dev, W6_CMD_DEC_SET_FB_FBC_CR0 + (k * 8),
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fb_arr[fbc_idx].buf_cr);
> +			vpu_write_reg(inst->dev, W6_CMD_DEC_SET_FB_FBC_Y_OFFSET0 + (k * 24),
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p_dec_info->vb_fbc_y_tbl[fbc_idx].dad=
dr);
> +			vpu_write_reg(inst->dev, W6_CMD_DEC_SET_FB_FBC_C_OFFSET0 + (k * 24),
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p_dec_info->vb_fbc_c_tbl[fbc_idx].dad=
dr);
> +			fbc_cr_tbl_addr =3D p_dec_info->vb_fbc_c_tbl[fbc_idx].daddr +
> +						(p_dec_info->vb_fbc_c_tbl[fbc_idx].size >> 1);
> +			vpu_write_reg(inst->dev, W6_CMD_DEC_SET_FB_FBC_CR_OFFSET0 + (k * 8),
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fbc_cr_tbl_addr);
> +			fbc_idx++;
> +		}
> +		fbc_remain -=3D k;
> +
> +		for (k =3D 0; k < set_mv_num; k++) {
> +			vpu_write_reg(inst->dev, W6_CMD_DEC_SET_FB_MV_COL0 + (k * 24),
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p_dec_info->vb_mv[mv_idx].daddr);
> +			mv_idx++;
> +		}
> +		mv_remain -=3D k;
> +
> +		wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_SET_FB);
> +		ret =3D wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
> +		if (ret) {
> +			dev_err(inst->dev->dev, "%s: timeout\n", __func__);
> +			return ret;
> +		}
> +	}
> +
> +	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS))
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +int wave6_vpu_dec_register_display_buffer(struct vpu_instance *inst, str=
uct frame_buffer fb)
> +{
> +	int ret;
> +	struct dec_info *p_dec_info =3D &inst->codec_info->dec_info;
> +	u32 reg_val, cbcr_interleave, nv21;
> +	u32 endian;
> +	u32 addr_y, addr_cb, addr_cr;
> +	u32 color_format;
> +	u32 justified =3D WTL_RIGHT_JUSTIFIED;
> +	u32 format_no =3D WTL_PIXEL_8BIT;
> +
> +	cbcr_interleave =3D inst->cbcr_interleave;
> +	nv21 =3D inst->nv21;
> +
> +	endian =3D wave6_vdi_convert_endian(p_dec_info->open_param.frame_endian=
);
> +
> +	switch (p_dec_info->wtl_format) {
> +	case FORMAT_420:
> +	case FORMAT_420_P10_16BIT_MSB:
> +	case FORMAT_420_P10_16BIT_LSB:
> +	case FORMAT_420_P10_32BIT_MSB:
> +	case FORMAT_420_P10_32BIT_LSB:
> +		color_format =3D 1;
> +		break;
> +	case FORMAT_422:
> +	case FORMAT_422_P10_16BIT_MSB:
> +	case FORMAT_422_P10_16BIT_LSB:
> +	case FORMAT_422_P10_32BIT_MSB:
> +	case FORMAT_422_P10_32BIT_LSB:
> +		color_format =3D 2;
> +		break;
> +	case FORMAT_444:
> +	case FORMAT_444_P10_16BIT_MSB:
> +	case FORMAT_444_P10_16BIT_LSB:
> +	case FORMAT_444_P10_32BIT_MSB:
> +	case FORMAT_444_P10_32BIT_LSB:
> +		color_format =3D 3;
> +		break;
> +	case FORMAT_400:
> +	case FORMAT_400_P10_16BIT_MSB:
> +	case FORMAT_400_P10_16BIT_LSB:
> +	case FORMAT_400_P10_32BIT_MSB:
> +	case FORMAT_400_P10_32BIT_LSB:
> +		color_format =3D 0;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	reg_val =3D (color_format << 3) |
> +		=C2=A0 (inst->scaler_info.scale_mode << 1) |
> +		=C2=A0 (inst->scaler_info.enable);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_SCL_PARAM, reg_val);
> +	reg_val =3D (inst->scaler_info.width << 16) |
> +		=C2=A0 (inst->scaler_info.height);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_SCL_PIC_SIZE, reg_val);
> +	reg_val =3D (p_dec_info->initial_info.pic_width << 16) |
> +		=C2=A0 (p_dec_info->initial_info.pic_height);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_PIC_SIZE, reg_val);
> +
> +	switch (p_dec_info->wtl_format) {
> +	case FORMAT_420_P10_16BIT_MSB:
> +	case FORMAT_422_P10_16BIT_MSB:
> +	case FORMAT_444_P10_16BIT_MSB:
> +	case FORMAT_400_P10_16BIT_MSB:
> +		justified =3D WTL_RIGHT_JUSTIFIED;
> +		format_no =3D WTL_PIXEL_16BIT;
> +		break;
> +	case FORMAT_420_P10_16BIT_LSB:
> +	case FORMAT_422_P10_16BIT_LSB:
> +	case FORMAT_444_P10_16BIT_LSB:
> +	case FORMAT_400_P10_16BIT_LSB:
> +		justified =3D WTL_LEFT_JUSTIFIED;
> +		format_no =3D WTL_PIXEL_16BIT;
> +		break;
> +	case FORMAT_420_P10_32BIT_MSB:
> +	case FORMAT_422_P10_32BIT_MSB:
> +	case FORMAT_444_P10_32BIT_MSB:
> +	case FORMAT_400_P10_32BIT_MSB:
> +		justified =3D WTL_RIGHT_JUSTIFIED;
> +		format_no =3D WTL_PIXEL_32BIT;
> +		break;
> +	case FORMAT_420_P10_32BIT_LSB:
> +	case FORMAT_422_P10_32BIT_LSB:
> +	case FORMAT_444_P10_32BIT_LSB:
> +	case FORMAT_400_P10_32BIT_LSB:
> +		justified =3D WTL_LEFT_JUSTIFIED;
> +		format_no =3D WTL_PIXEL_32BIT;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	reg_val =3D (REGISTER_DISPLAY_BUFFER << 28) | (color_format << 24) |
> +		=C2=A0 (DEFAULT_PIXEL_ORDER << 23) | (justified << 22) | (format_no <<=
 20) |
> +		=C2=A0 (nv21 << 17) | (cbcr_interleave << 16) | (fb.stride);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_COMMON_PIC_INFO, reg_val);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_OPTION, (endian << 16));
> +	reg_val =3D (fb.luma_bitdepth << 22) |
> +		=C2=A0 (fb.chroma_bitdepth << 18) |
> +		=C2=A0 (fb.chroma_format_idc << 16);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_PIC_INFO, reg_val);
> +
> +	if (p_dec_info->open_param.cbcr_order =3D=3D CBCR_ORDER_REVERSED) {
> +		addr_y =3D fb.buf_y;
> +		addr_cb =3D fb.buf_cr;
> +		addr_cr =3D fb.buf_cb;
> +	} else {
> +		addr_y =3D fb.buf_y;
> +		addr_cb =3D fb.buf_cb;
> +		addr_cr =3D fb.buf_cr;
> +	}
> +
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_Y_BASE, addr_y);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_CB_BASE, addr_cb);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_CR_BASE, addr_cr);
> +
> +	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_DEC_SET_DISP)=
;
> +	ret =3D wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
> +	if (ret) {
> +		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
> +		return ret;
> +	}
> +
> +	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS))
> +		return -EIO;
> +
> +	wave6_dec_set_display_buffer(inst, fb);
> +
> +	return 0;
> +}
> +
> +int wave6_vpu_decode(struct vpu_instance *inst, struct dec_param *option=
, u32 *fail_res)
> +{
> +	struct dec_info *p_dec_info =3D &inst->codec_info->dec_info;
> +	struct dec_open_param *p_open_param =3D &p_dec_info->open_param;
> +	u32 mode_option =3D W6_DEC_PIC_OPT_NORMAL, bs_option, reg_val;
> +	int ret;
> +
> +	if (option->skipframe_mode) {
> +		switch (option->skipframe_mode) {
> +		case WAVE_SKIPMODE_NON_IRAP:
> +			mode_option =3D W6_DEC_PIC_OPT_SKIP_NON_IRAP;
> +			break;
> +		case WAVE_SKIPMODE_NON_REF:
> +			mode_option =3D W6_DEC_PIC_OPT_SKIP_NON_REF_PIC;
> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +
> +	bs_option =3D 0;
> +	switch (p_open_param->bs_mode) {
> +	case BS_MODE_INTERRUPT:
> +		bs_option =3D 0;
> +		break;
> +	case BS_MODE_PIC_END:
> +		bs_option =3D BSOPTION_ENABLE_EXPLICIT_END;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_PIC_BS_RD_PTR, p_dec_info->stream_r=
d_ptr);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_PIC_BS_WR_PTR, p_dec_info->stream_w=
r_ptr);
> +	if (p_dec_info->stream_end)
> +		bs_option =3D 3;
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_PIC_BS_OPTION, bs_option);
> +
> +	reg_val =3D (p_dec_info->sec_axi_info.use_dec_ip << 1) |
> +		=C2=A0 p_dec_info->sec_axi_info.use_dec_lf_row;
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_PIC_USE_SEC_AXI, reg_val);
> +
> +	reg_val =3D (option->disable_film_grain << 6) |
> +		=C2=A0 (option->decode_cra_as_bla << 5) |
> +		=C2=A0 mode_option;
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_PIC_OPTION, reg_val);
> +	reg_val =3D (DECODE_ALL_SPATIAL_LAYERS << 9) |
> +		=C2=A0 (TEMPORAL_ID_MODE_ABSOLUTE << 8) |
> +		=C2=A0 DECODE_ALL_TEMPORAL_LAYERS;
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_PIC_TEMPORAL_ID_PLUS1, reg_val);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_PIC_SEQ_CHANGE_ENABLE_FLAG,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p_dec_info->seq_change_mask);
> +	reg_val =3D ((option->timestamp.hour & 0x1F) << 26) |
> +		=C2=A0 ((option->timestamp.min & 0x3F) << 20) |
> +		=C2=A0 ((option->timestamp.sec & 0x3F) << 14) |
> +		=C2=A0 (option->timestamp.ms & 0x3FFF);
> +	vpu_write_reg(inst->dev, W6_CMD_DEC_PIC_TIMESTAMP, reg_val);
> +
> +	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_DEC_PIC);
> +	ret =3D wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
> +	if (ret) {
> +		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
> +		return ret;
> +	}
> +
> +	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
> +		*fail_res =3D vpu_read_reg(inst->dev, W6_RET_FAIL_REASON);
> +		wave6_print_reg_err(inst->dev, *fail_res);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +int wave6_vpu_dec_get_result(struct vpu_instance *inst, struct dec_outpu=
t_info *result)
> +{
> +	struct dec_info *p_dec_info =3D &inst->codec_info->dec_info;
> +	u32 reg_val, nal_unit_type, i;
> +	int decoded_index =3D -1, display_index =3D -1;
> +	int ret;
> +
> +	ret =3D wave6_send_query(inst->dev, inst->id, inst->std, W6_QUERY_OPT_G=
ET_RESULT);
> +	if (ret)
> +		return ret;
> +
> +	result->decoding_success =3D vpu_read_reg(inst->dev, W6_RET_DEC_DECODIN=
G_SUCCESS);
> +	if (!result->decoding_success)
> +		result->error_reason =3D vpu_read_reg(inst->dev, W6_RET_DEC_ERR_INFO);
> +	else
> +		result->warn_info =3D vpu_read_reg(inst->dev, W6_RET_DEC_WARN_INFO);
> +
> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_PIC_TYPE);
> +	nal_unit_type =3D (reg_val & 0x3f0) >> 4;
> +	result->nal_type =3D nal_unit_type;
> +
> +	if (inst->std =3D=3D W_HEVC_DEC) {
> +		if (reg_val & 0x04)
> +			result->pic_type =3D PIC_TYPE_B;
> +		else if (reg_val & 0x02)
> +			result->pic_type =3D PIC_TYPE_P;
> +		else if (reg_val & 0x01)
> +			result->pic_type =3D PIC_TYPE_I;
> +		else
> +			result->pic_type =3D PIC_TYPE_MAX;
> +		if ((nal_unit_type =3D=3D 19 || nal_unit_type =3D=3D 20) && result->pi=
c_type =3D=3D PIC_TYPE_I)
> +			result->pic_type =3D PIC_TYPE_IDR;
> +	} else if (inst->std =3D=3D W_AVC_DEC) {
> +		if (reg_val & 0x04)
> +			result->pic_type =3D PIC_TYPE_B;
> +		else if (reg_val & 0x02)
> +			result->pic_type =3D PIC_TYPE_P;
> +		else if (reg_val & 0x01)
> +			result->pic_type =3D PIC_TYPE_I;
> +		else
> +			result->pic_type =3D PIC_TYPE_MAX;
> +		if (nal_unit_type =3D=3D 5 && result->pic_type =3D=3D PIC_TYPE_I)
> +			result->pic_type =3D PIC_TYPE_IDR;
> +	}
> +	result->ctu_size =3D 16 << ((reg_val >> 10) & 0x3);
> +
> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_DECODED_FLAG);
> +	if (reg_val) {
> +		struct frame_buffer fb;
> +		dma_addr_t addr =3D vpu_read_reg(inst->dev, W6_RET_DEC_DECODED_ADDR);
> +
> +		fb =3D wave6_dec_get_display_buffer(inst, addr);
> +		result->frame_decoded_addr =3D addr;
> +		result->frame_decoded =3D true;
> +		decoded_index =3D fb.index;
> +	}
> +
> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_DISPLAY_FLAG);
> +	if (reg_val) {
> +		struct frame_buffer fb;
> +		dma_addr_t addr =3D vpu_read_reg(inst->dev, W6_RET_DEC_DISPLAY_ADDR);
> +
> +		fb =3D wave6_dec_get_display_buffer(inst, addr);
> +		result->frame_display_addr =3D addr;
> +		result->frame_display =3D true;
> +		display_index =3D fb.index;
> +	}
> +
> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_DISP_IDC);
> +	for (i =3D 0; i < WAVE6_MAX_FBS; i++) {
> +		if (reg_val & (1 << i)) {
> +			dma_addr_t addr =3D vpu_read_reg(inst->dev,
> +						W6_RET_DEC_DISP_LINEAR_ADDR_0 + i * 4);
> +
> +			result->disp_frame_addr[result->disp_frame_num] =3D addr;
> +			result->disp_frame_num++;
> +		}
> +	}
> +
> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_RELEASE_IDC);
> +	for (i =3D 0; i < WAVE6_MAX_FBS; i++) {
> +		if (reg_val & (1 << i)) {
> +			dma_addr_t addr =3D vpu_read_reg(inst->dev,
> +						W6_RET_DEC_DISP_LINEAR_ADDR_0 + i * 4);
> +
> +			wave6_dec_remove_display_buffer(inst, addr);
> +			result->release_disp_frame_addr[result->release_disp_frame_num] =3D a=
ddr;
> +			result->release_disp_frame_num++;
> +		}
> +	}
> +
> +	result->stream_end =3D vpu_read_reg(inst->dev, W6_RET_DEC_STREAM_END);
> +	result->notification_flags =3D vpu_read_reg(inst->dev, W6_RET_DEC_NOTIF=
ICATION);
> +
> +	if (inst->std =3D=3D W_HEVC_DEC) {
> +		result->decoded_poc =3D -1;
> +		result->display_poc =3D -1;
> +		if (decoded_index >=3D 0)
> +			result->decoded_poc =3D vpu_read_reg(inst->dev, W6_RET_DEC_PIC_POC);
> +	} else if (inst->std =3D=3D W_AVC_DEC) {
> +		result->decoded_poc =3D -1;
> +		result->display_poc =3D -1;
> +		if (decoded_index >=3D 0)
> +			result->decoded_poc =3D vpu_read_reg(inst->dev, W6_RET_DEC_PIC_POC);
> +	}
> +
> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_PIC_SIZE);
> +	result->dec_pic_width =3D reg_val >> 16;
> +	result->dec_pic_height =3D reg_val & 0xffff;
> +
> +	result->num_of_err_m_bs =3D vpu_read_reg(inst->dev, W6_RET_DEC_ERR_CTB_=
NUM) >> 16;
> +	result->num_of_tot_m_bs =3D vpu_read_reg(inst->dev, W6_RET_DEC_ERR_CTB_=
NUM) & 0xffff;
> +	result->byte_pos_frame_start =3D vpu_read_reg(inst->dev, W6_RET_DEC_AU_=
START_POS);
> +	result->byte_pos_frame_end =3D vpu_read_reg(inst->dev, W6_RET_DEC_AU_EN=
D_POS);
> +
> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_RECOVERY_POINT);
> +	result->h265_rp_sei.recovery_poc_cnt =3D reg_val & 0xFFFF;
> +	result->h265_rp_sei.exact_match =3D (reg_val >> 16) & 0x01;
> +	result->h265_rp_sei.broken_link =3D (reg_val >> 17) & 0x01;
> +	result->h265_rp_sei.exist =3D (reg_val >> 18) & 0x01;
> +	if (!result->h265_rp_sei.exist) {
> +		result->h265_rp_sei.recovery_poc_cnt =3D 0;
> +		result->h265_rp_sei.exact_match =3D false;
> +		result->h265_rp_sei.broken_link =3D false;
> +	}
> +
> +	result->last_frame_in_au =3D vpu_read_reg(inst->dev, W6_RET_DEC_LAST_FR=
AME_FLAG);
> +
> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_DEC_TIMESTAMP);
> +	result->timestamp.hour =3D (reg_val >> 26) & 0x1F;
> +	result->timestamp.min =3D (reg_val >> 20) & 0x3F;
> +	result->timestamp.sec =3D (reg_val >> 14) & 0x3F;
> +	result->timestamp.ms =3D reg_val & 0x3FFF;
> +
> +	result->cycle.host_cmd_s =3D vpu_read_reg(inst->dev, W6_RET_CQ_IN_TICK)=
;
> +	result->cycle.host_cmd_e =3D vpu_read_reg(inst->dev, W6_RET_RQ_OUT_TICK=
);
> +	result->cycle.proc_s =3D vpu_read_reg(inst->dev, W6_RET_HW_RUN_TICK);
> +	result->cycle.proc_e =3D vpu_read_reg(inst->dev, W6_RET_HW_DONE_TICK);
> +	result->cycle.vpu_s =3D vpu_read_reg(inst->dev, W6_RET_FW_RUN_TICK);
> +	result->cycle.vpu_e =3D vpu_read_reg(inst->dev, W6_RET_FW_DONE_TICK);
> +	result->cycle.frame_cycle =3D (result->cycle.vpu_e - result->cycle.host=
_cmd_s) *
> +				=C2=A0=C2=A0=C2=A0 p_dec_info->cycle_per_tick;
> +	result->cycle.proc_cycle =3D (result->cycle.proc_e - result->cycle.proc=
_s) *
> +				=C2=A0=C2=A0 p_dec_info->cycle_per_tick;
> +	result->cycle.vpu_cycle =3D ((result->cycle.vpu_e - result->cycle.vpu_s=
) -
> +				=C2=A0=C2=A0 (result->cycle.proc_e - result->cycle.proc_s)) *
> +				=C2=A0 p_dec_info->cycle_per_tick;
> +
> +	if (decoded_index >=3D 0 && decoded_index < WAVE6_MAX_FBS) {
> +		if (inst->std =3D=3D W_HEVC_DEC || inst->std =3D=3D W_AVC_DEC)
> +			p_dec_info->dec_out_info[decoded_index].decoded_poc =3D result->decod=
ed_poc;
> +	}
> +
> +	if (display_index >=3D 0 && display_index < WAVE6_MAX_FBS) {
> +		if (inst->std =3D=3D W_HEVC_DEC || inst->std =3D=3D W_AVC_DEC)
> +			result->display_poc =3D p_dec_info->dec_out_info[display_index].decod=
ed_poc;
> +
> +		result->disp_pic_width =3D p_dec_info->dec_out_info[display_index].dec=
_pic_width;
> +		result->disp_pic_height =3D p_dec_info->dec_out_info[display_index].de=
c_pic_height;
> +	}
> +
> +	result->rd_ptr =3D wave6_vpu_dec_get_rd_ptr(inst);
> +	result->wr_ptr =3D p_dec_info->stream_wr_ptr;
> +
> +	result->sequence_no =3D p_dec_info->initial_info.sequence_no;
> +	if (decoded_index >=3D 0 && decoded_index < WAVE6_MAX_FBS)
> +		p_dec_info->dec_out_info[decoded_index] =3D *result;
> +
> +	if (display_index >=3D 0 && display_index < WAVE6_MAX_FBS) {
> +		result->num_of_tot_m_bs_in_disp =3D
> +			p_dec_info->dec_out_info[display_index].num_of_tot_m_bs;
> +		result->num_of_err_m_bs_in_disp =3D
> +			p_dec_info->dec_out_info[display_index].num_of_err_m_bs;
> +	} else {
> +		result->num_of_tot_m_bs_in_disp =3D 0;
> +		result->num_of_err_m_bs_in_disp =3D 0;
> +	}
> +
> +	if (result->notification_flags & DEC_NOTI_FLAG_SEQ_CHANGE) {
> +		wave6_get_dec_seq_result(inst, &p_dec_info->initial_info);
> +		p_dec_info->initial_info.sequence_no++;
> +	}
> +
> +	return 0;
> +}
> +
> +int wave6_vpu_dec_fini_seq(struct vpu_instance *inst, u32 *fail_res)
> +{
> +	int ret;
> +
> +	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_DESTROY_INSTA=
NCE);
> +	ret =3D wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
> +	if (ret)
> +		return -ETIMEDOUT;
> +
> +	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
> +		*fail_res =3D vpu_read_reg(inst->dev, W6_RET_FAIL_REASON);
> +		wave6_print_reg_err(inst->dev, *fail_res);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +void wave6_vpu_dec_set_bitstream_end(struct vpu_instance *inst, bool eos=
)
> +{
> +	struct dec_info *p_dec_info =3D &inst->codec_info->dec_info;
> +
> +	p_dec_info->stream_end =3D eos ? true : false;
> +}
> +
> +dma_addr_t wave6_vpu_dec_get_rd_ptr(struct vpu_instance *inst)
> +{
> +	return vpu_read_reg(inst->dev, W6_RET_DEC_BS_RD_PTR);
> +}
> +
> +int wave6_vpu_dec_flush(struct vpu_instance *inst)
> +{
> +	int ret, index;
> +	u32 unused_idc;
> +	u32 used_idc;
> +	u32 using_idc;
> +
> +	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_FLUSH_INSTANC=
E);
> +	ret =3D wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
> +	if (ret)
> +		return -ETIMEDOUT;
> +
> +	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
> +		u32 reg_val;
> +
> +		reg_val =3D vpu_read_reg(inst->dev, W6_RET_FAIL_REASON);
> +		wave6_print_reg_err(inst->dev, reg_val);
> +		return -EIO;
> +	}
> +
> +	ret =3D wave6_send_query(inst->dev, inst->id, inst->std, W6_QUERY_OPT_G=
ET_FLUSH_CMD_INFO);
> +	if (ret)
> +		return ret;
> +
> +	unused_idc =3D vpu_read_reg(inst->dev, W6_RET_DEC_FLUSH_CMD_BUF_STATE_U=
NUSED_IDC);
> +	if (unused_idc)
> +		dev_dbg(inst->dev->dev, "%s: unused_idc %d\n", __func__, unused_idc);
> +
> +	used_idc =3D vpu_read_reg(inst->dev, W6_RET_DEC_FLUSH_CMD_BUF_STATE_USE=
D_IDC);
> +	if (used_idc)
> +		dev_dbg(inst->dev->dev, "%s: used_idc %d\n", __func__, used_idc);
> +
> +	using_idc =3D vpu_read_reg(inst->dev, W6_RET_DEC_FLUSH_CMD_BUF_STATE_US=
ING_IDC);
> +	if (using_idc)
> +		dev_err(inst->dev->dev, "%s: using_idc %d\n", __func__, using_idc);
> +
> +	for (index =3D 0; index < WAVE6_MAX_FBS; index++) {
> +		dma_addr_t addr =3D vpu_read_reg(inst->dev,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W6_RET_DEC_FLUSH_CMD_DISP_ADDR=
_0 + index * 4);
> +
> +		if ((unused_idc >> index) & 0x1)
> +			wave6_dec_remove_display_buffer(inst, addr);
> +		if ((used_idc >> index) & 0x1)
> +			wave6_dec_remove_display_buffer(inst, addr);
> +	}
> +
> +	return 0;
> +}
> +
> +struct enc_cmd_set_param_reg {
> +	u32 enable;
> +	u32 src_size;
> +	u32 custom_map_endian;
> +	u32 sps_param;
> +	u32 pps_param;
> +	u32 gop_param;
> +	u32 intra_param;
> +	u32 conf_win_top_bot;
> +	u32 conf_win_left_right;
> +	u32 rdo_param;
> +	u32 slice_param;
> +	u32 intra_refresh;
> +	u32 intra_min_max_qp;
> +	u32 rc_frame_rate;
> +	u32 rc_target_rate;
> +	u32 rc_param;
> +	u32 hvs_param;
> +	u32 rc_max_bitrate;
> +	u32 rc_vbv_buffer_size;
> +	u32 inter_min_max_qp;
> +	u32 rot_param;
> +	u32 num_units_in_tick;
> +	u32 time_scale;
> +	u32 num_ticks_poc_diff_one;
> +	u32 max_intra_pic_bit;
> +	u32 max_inter_pic_bit;
> +	u32 bg_param;
> +	u32 non_vcl_param;
> +	u32 vui_rbsp_addr;
> +	u32 hrd_rbsp_addr;
> +	u32 qround_offset;
> +	u32 quant_param_1;
> +	u32 quant_param_2;
> +	u32 custom_gop_param;
> +	u32 custom_gop_pic_param[MAX_GOP_NUM];
> +	u32 tile_param;
> +	u32 custom_lambda[MAX_CUSTOM_LAMBDA_NUM];
> +	u32 temporal_layer_qp[MAX_NUM_CHANGEABLE_TEMPORAL_LAYER];
> +	u32 scl_src_size;
> +	u32 scl_param;
> +	u32 color_param;
> +	u32 sar_param;
> +	u32 sar_extended;
> +};
> +
> +struct enc_cmd_change_param_reg {
> +	u32 enable;
> +	u32 rc_target_rate;
> +};
> +
> +int wave6_vpu_build_up_enc_param(struct device *dev, struct vpu_instance=
 *inst,
> +				 struct enc_open_param *param)
> +{
> +	struct enc_info *p_enc_info =3D &inst->codec_info->enc_info;
> +	u32 reg_val;
> +	int ret;
> +
> +	p_enc_info->cycle_per_tick =3D 256;
> +	p_enc_info->line_buf_int_en =3D param->line_buf_int_en;
> +	p_enc_info->stride =3D 0;
> +	p_enc_info->initial_info_obtained =3D false;
> +	p_enc_info->sec_axi_info.use_enc_rdo =3D true;
> +	p_enc_info->sec_axi_info.use_enc_lf =3D true;
> +
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_CREATE_INST_TEMP_BASE, param->inst_=
buffer.temp_base);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_CREATE_INST_TEMP_SIZE, param->inst_=
buffer.temp_size);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_CREATE_INST_AR_TABLE_BASE, param->i=
nst_buffer.ar_base);
> +
> +	reg_val =3D wave6_vdi_convert_endian(param->stream_endian);
> +	reg_val =3D (~reg_val & VDI_128BIT_ENDIAN_MASK);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_CREATE_INST_BS_PARAM, reg_val);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_CREATE_INST_SRC_OPT, 0);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_CREATE_INST_ADDR_EXT, param->ext_ad=
dr_vcpu);
> +
> +	reg_val =3D (COMMAND_QUEUE_DEPTH << 8) | (1 << 4) | 1;
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_CREATE_INST_CORE_INFO, reg_val);
> +
> +	reg_val =3D (param->is_secure_inst << 8) | (param->inst_priority);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_CREATE_INST_PRIORITY, reg_val);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_CREATE_INST_TIMEOUT_CYCLE_COUNT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W6_VPU_TIMEOUT_CYCLE_COUNT);
> +
> +	wave6_send_command(inst->dev, 0, inst->std, W6_CMD_CREATE_INSTANCE);
> +	ret =3D wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
> +	if (ret) {
> +		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
> +		return ret;
> +	}
> +
> +	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
> +		u32 reason_code =3D vpu_read_reg(inst->dev, W6_RET_FAIL_REASON);
> +
> +		wave6_print_reg_err(inst->dev, reason_code);
> +		return -EIO;
> +	}
> +
> +	inst->id =3D vpu_read_reg(inst->dev, W6_RET_INSTANCE_ID);
> +
> +	return 0;
> +}
> +
> +static int wave6_set_enc_crop_info(u32 codec, struct enc_codec_param *pa=
ram, int rot_mode,
> +				=C2=A0=C2=A0 int width, int height)
> +{
> +	int aligned_width =3D (codec =3D=3D W_HEVC_ENC) ? ALIGN(width, 32) : AL=
IGN(width, 16);
> +	int aligned_height =3D (codec =3D=3D W_HEVC_ENC) ? ALIGN(height, 32) : =
ALIGN(height, 16);
> +	int pad_right, pad_bot;
> +	int crop_right, crop_left, crop_top, crop_bot;
> +	int prp_mode =3D rot_mode >> 1;
> +
> +	if (codec =3D=3D W_HEVC_ENC &&
> +	=C2=A0=C2=A0=C2=A0 (!rot_mode || prp_mode =3D=3D 14))
> +		return 0;
> +
> +	pad_right =3D aligned_width - width;
> +	pad_bot =3D aligned_height - height;
> +
> +	if (param->conf_win.right > 0)
> +		crop_right =3D param->conf_win.right + pad_right;
> +	else
> +		crop_right =3D pad_right;
> +
> +	if (param->conf_win.bottom > 0)
> +		crop_bot =3D param->conf_win.bottom + pad_bot;
> +	else
> +		crop_bot =3D pad_bot;
> +
> +	crop_top =3D param->conf_win.top;
> +	crop_left =3D param->conf_win.left;
> +
> +	param->conf_win.top =3D crop_top;
> +	param->conf_win.left =3D crop_left;
> +	param->conf_win.bottom =3D crop_bot;
> +	param->conf_win.right =3D crop_right;
> +
> +	if (prp_mode =3D=3D 1 || prp_mode =3D=3D 15) {
> +		param->conf_win.top =3D crop_right;
> +		param->conf_win.left =3D crop_top;
> +		param->conf_win.bottom =3D crop_left;
> +		param->conf_win.right =3D crop_bot;
> +	} else if (prp_mode =3D=3D 2 || prp_mode =3D=3D 12) {
> +		param->conf_win.top =3D crop_bot;
> +		param->conf_win.left =3D crop_right;
> +		param->conf_win.bottom =3D crop_top;
> +		param->conf_win.right =3D crop_left;
> +	} else if (prp_mode =3D=3D 3 || prp_mode =3D=3D 13) {
> +		param->conf_win.top =3D crop_left;
> +		param->conf_win.left =3D crop_bot;
> +		param->conf_win.bottom =3D crop_right;
> +		param->conf_win.right =3D crop_top;
> +	} else if (prp_mode =3D=3D 4 || prp_mode =3D=3D 10) {
> +		param->conf_win.top =3D crop_bot;
> +		param->conf_win.bottom =3D crop_top;
> +	} else if (prp_mode =3D=3D 8 || prp_mode =3D=3D 6) {
> +		param->conf_win.left =3D crop_right;
> +		param->conf_win.right =3D crop_left;
> +	} else if (prp_mode =3D=3D 5 || prp_mode =3D=3D 11) {
> +		param->conf_win.top =3D crop_left;
> +		param->conf_win.left =3D crop_top;
> +		param->conf_win.bottom =3D crop_right;
> +		param->conf_win.right =3D crop_bot;
> +	} else if (prp_mode =3D=3D 7 || prp_mode =3D=3D 9) {
> +		param->conf_win.top =3D crop_right;
> +		param->conf_win.left =3D crop_bot;
> +		param->conf_win.bottom =3D crop_left;
> +		param->conf_win.right =3D crop_top;
> +	}
> +
> +	return 0;
> +}
> +
> +static bool wave6_update_enc_info(struct enc_info *p_enc_info)
> +{
> +	struct enc_open_param open_param =3D p_enc_info->open_param;
> +
> +	p_enc_info->width =3D open_param.pic_width;
> +	p_enc_info->height =3D open_param.pic_height;
> +
> +	switch (open_param.output_format) {
> +	case FORMAT_420:
> +	case FORMAT_420_P10_16BIT_MSB:
> +	case FORMAT_420_P10_16BIT_LSB:
> +	case FORMAT_420_P10_32BIT_MSB:
> +	case FORMAT_420_P10_32BIT_LSB:
> +		p_enc_info->color_format =3D 1;
> +		break;
> +	case FORMAT_422:
> +	case FORMAT_422_P10_16BIT_MSB:
> +	case FORMAT_422_P10_16BIT_LSB:
> +	case FORMAT_422_P10_32BIT_MSB:
> +	case FORMAT_422_P10_32BIT_LSB:
> +		p_enc_info->color_format =3D 2;
> +		break;
> +	case FORMAT_444:
> +	case FORMAT_444_P10_16BIT_MSB:
> +	case FORMAT_444_P10_16BIT_LSB:
> +	case FORMAT_444_P10_32BIT_MSB:
> +	case FORMAT_444_P10_32BIT_LSB:
> +		p_enc_info->color_format =3D 3;
> +		break;
> +	case FORMAT_400:
> +	case FORMAT_400_P10_16BIT_MSB:
> +	case FORMAT_400_P10_16BIT_LSB:
> +	case FORMAT_400_P10_32BIT_MSB:
> +	case FORMAT_400_P10_32BIT_LSB:
> +		p_enc_info->color_format =3D 0;
> +		break;
> +	default:
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +static void wave6_gen_set_param_reg_common(struct enc_info *p_enc_info, =
enum codec_std std,
> +					=C2=A0=C2=A0 struct enc_cmd_set_param_reg *reg)
> +{
> +	struct enc_open_param *p_open_param =3D &p_enc_info->open_param;
> +	struct enc_codec_param *p_param =3D &p_open_param->codec_param;
> +	unsigned int i, endian;
> +	u32 rot_mir_mode =3D 0;
> +
> +	endian =3D wave6_vdi_convert_endian(p_param->custom_map_endian);
> +	endian =3D (~endian & VDI_128BIT_ENDIAN_MASK);
> +
> +	if (p_enc_info->rotation_enable) {
> +		switch (p_enc_info->rotation_angle) {
> +		case 0:
> +			rot_mir_mode |=3D 0x0; break;
> +		case 90:
> +			rot_mir_mode |=3D 0x3; break;
> +		case 180:
> +			rot_mir_mode |=3D 0x5; break;
> +		case 270:
> +			rot_mir_mode |=3D 0x7; break;
> +		}
> +	}
> +
> +	if (p_enc_info->mirror_enable) {
> +		switch (p_enc_info->mirror_direction) {
> +		case MIRDIR_NONE:
> +			rot_mir_mode |=3D 0x0; break;
> +		case MIRDIR_VER:
> +			rot_mir_mode |=3D 0x9; break;
> +		case MIRDIR_HOR:
> +			rot_mir_mode |=3D 0x11; break;
> +		case MIRDIR_HOR_VER:
> +			rot_mir_mode |=3D 0x19; break;
> +		}
> +	}
> +
> +	wave6_set_enc_crop_info(std, p_param, rot_mir_mode, p_enc_info->width, =
p_enc_info->height);
> +
> +	reg->src_size =3D (p_enc_info->height << 16) | p_enc_info->width;
> +	reg->custom_map_endian =3D endian;
> +	reg->gop_param =3D (p_param->temp_layer_cnt << 16) |
> +			 (p_param->temp_layer[3].change_qp << 11) |
> +			 (p_param->temp_layer[2].change_qp << 10) |
> +			 (p_param->temp_layer[1].change_qp << 9) |
> +			 (p_param->temp_layer[0].change_qp << 8) |
> +			 p_param->gop_preset_idx;
> +	reg->intra_refresh =3D (p_param->intra_refresh_arg << 16) | p_param->in=
tra_refresh_mode;
> +	reg->intra_min_max_qp =3D (p_param->max_qp_i << 6) | p_param->min_qp_i;
> +	reg->rc_frame_rate =3D p_param->frame_rate;
> +	reg->rc_target_rate =3D p_param->bitrate;
> +	reg->rc_param =3D (p_param->rc_update_speed << 24) |
> +			(p_param->rc_initial_level << 20) |
> +			((p_param->rc_initial_qp & 0x3f) << 14) |
> +			(p_param->rc_mode << 13) |
> +			(p_param->pic_rc_max_dqp << 7) |
> +			(p_param->en_vbv_overflow_drop_frame << 3) |
> +			(p_param->en_cu_level_rate_control << 1) |
> +			p_param->en_rate_control;
> +	reg->hvs_param =3D (p_param->max_delta_qp << 12) | p_param->hvs_qp_scal=
e_div2;
> +	reg->rc_max_bitrate =3D p_param->max_bitrate;
> +	reg->rc_vbv_buffer_size =3D p_param->cpb_size;
> +	reg->inter_min_max_qp =3D (p_param->max_qp_b << 18) |
> +				(p_param->min_qp_b << 12) |
> +				(p_param->max_qp_p << 6) |
> +				p_param->min_qp_p;
> +	reg->rot_param =3D rot_mir_mode;
> +	reg->conf_win_top_bot =3D (p_param->conf_win.bottom << 16) | p_param->c=
onf_win.top;
> +	reg->conf_win_left_right =3D (p_param->conf_win.right << 16) | p_param-=
>conf_win.left;
> +	reg->num_units_in_tick =3D p_param->num_units_in_tick;
> +	reg->time_scale =3D p_param->time_scale;
> +	reg->num_ticks_poc_diff_one =3D p_param->num_ticks_poc_diff_one;
> +	reg->max_intra_pic_bit =3D p_param->max_intra_pic_bit;
> +	reg->max_inter_pic_bit =3D p_param->max_inter_pic_bit;
> +	reg->bg_param =3D ((p_param->bg_delta_qp & 0x3F) << 24) |
> +			(p_param->bg_th_mean_diff << 10) |
> +			(p_param->bg_th_diff << 1) |
> +			p_param->en_bg_detect;
> +	reg->qround_offset =3D (p_param->q_round_inter << 13) |
> +			=C2=A0=C2=A0=C2=A0=C2=A0 (p_param->q_round_intra << 2);
> +	reg->custom_gop_param =3D p_param->gop_param.custom_gop_size;
> +	for (i =3D 0; i < p_param->gop_param.custom_gop_size; i++) {
> +		struct custom_gop_pic_param pic_param =3D p_param->gop_param.pic_param=
[i];
> +
> +		reg->custom_gop_pic_param[i] =3D (pic_param.temporal_id << 26) |
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((pic_param.ref_poc_l1 & 0x3F)=
 << 20) |
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((pic_param.ref_poc_l0 & 0x3F)=
 << 14) |
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (pic_param.use_multi_ref_p << =
13) |
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (pic_param.pic_qp << 7) |
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (pic_param.poc_offset << 2) |
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pic_param.pic_type;
> +	}
> +	for (i =3D 0; i < MAX_CUSTOM_LAMBDA_NUM; i++) {
> +		reg->custom_lambda[i] =3D (p_param->custom_lambda_ssd[i] << 7) |
> +					p_param->custom_lambda_sad[i];
> +	}
> +	for (i =3D 0; i < MAX_NUM_CHANGEABLE_TEMPORAL_LAYER; i++) {
> +		reg->temporal_layer_qp[i] =3D (p_param->temp_layer[i].qp_b << 12) |
> +					=C2=A0=C2=A0=C2=A0 (p_param->temp_layer[i].qp_p << 6) |
> +					=C2=A0=C2=A0=C2=A0 p_param->temp_layer[i].qp_i;
> +	}
> +	reg->scl_src_size =3D (p_open_param->pic_height << 16) | p_open_param->=
pic_width;
> +	reg->scl_param =3D (p_enc_info->scaler_info.coef_mode << 1) | p_enc_inf=
o->scaler_info.enable;
> +	reg->color_param =3D ((p_param->color.chroma_sample_position & 0x3) << =
26) |
> +			=C2=A0=C2=A0 (p_param->color.color_range << 25) |
> +			=C2=A0=C2=A0 ((p_param->color.matrix_coefficients & 0xFF) << 17) |
> +			=C2=A0=C2=A0 ((p_param->color.transfer_characteristics & 0xFF) << 9) =
|
> +			=C2=A0=C2=A0 ((p_param->color.color_primaries & 0xFF) << 1) |
> +			=C2=A0=C2=A0 p_param->color.color_description_present;
> +	reg->sar_param =3D ((p_param->sar.idc & 0xFF) << 1) |
> +			 (p_param->sar.enable & 0x1);
> +	reg->sar_extended =3D ((p_param->sar.height & 0xFFFF) << 16) |
> +			=C2=A0=C2=A0=C2=A0 (p_param->sar.width & 0xFFFF);
> +}
> +
> +static void wave6_gen_set_param_reg_hevc(struct enc_info *p_enc_info,
> +					 struct enc_cmd_set_param_reg *reg)
> +{
> +	struct enc_open_param *p_open_param =3D &p_enc_info->open_param;
> +	struct enc_codec_param *p_param =3D &p_open_param->codec_param;
> +
> +	reg->sps_param =3D (p_param->en_scaling_list << 31) |
> +			 (p_param->en_still_picture << 30) |
> +			 (p_param->en_auto_level_adjusting << 28) |
> +			 (p_param->en_strong_intra_smoothing << 27) |
> +			 (p_param->en_intra_trans_skip << 25) |
> +			 (p_param->en_sao << 24) |
> +			 (p_param->en_temporal_mvp << 23) |
> +			 (p_param->en_long_term << 21) |
> +			 (p_enc_info->color_format << 19) |
> +			 (p_param->internal_bit_depth << 14) |
> +			 (p_param->tier << 12) |
> +			 (p_param->level << 3) |
> +			 p_param->profile;
> +	reg->pps_param =3D ((p_param->cr_qp_offset & 0x1F) << 19) |
> +			 ((p_param->cb_qp_offset & 0x1F) << 14) |
> +			 ((p_param->tc_offset_div2 & 0xF) << 10) |
> +			 ((p_param->beta_offset_div2 & 0xF) << 6)=C2=A0 |
> +			 ((!p_param->en_dbk) << 5)=C2=A0 |
> +			 (p_param->en_lf_cross_slice_boundary << 2) |
> +			 (p_param->en_constrained_intra_pred << 1);
> +	reg->intra_param =3D (p_param->intra_period << 16) |
> +			=C2=A0=C2=A0 (p_param->forced_idr_header << 9) |
> +			=C2=A0=C2=A0 (p_param->qp << 3) |
> +			=C2=A0=C2=A0 p_param->decoding_refresh_type;
> +	reg->rdo_param =3D (p_param->en_custom_lambda << 22) |
> +			 (p_param->en_me_center << 21) |
> +			 (p_param->en_qp_map << 20) |
> +			 (p_param->en_mode_map << 19) |
> +			 (p_param->en_q_round_offset << 17) |
> +			 (p_param->dis_coef_clear << 4) |
> +			 (p_param->en_adaptive_round << 3) |
> +			 (p_param->en_hvs_qp << 2);
> +	reg->slice_param =3D (p_param->slice_arg << 3) | p_param->slice_mode;
> +	reg->quant_param_2 =3D ((p_param->lambda_dqp_inter & 0x3F) << 14) |
> +			=C2=A0=C2=A0=C2=A0=C2=A0 ((p_param->lambda_dqp_intra & 0x3F) << 8);
> +	reg->non_vcl_param =3D (p_open_param->hrd_rbsp_data_size << 18) |
> +			=C2=A0=C2=A0=C2=A0=C2=A0 (p_open_param->enc_hrd_rbsp_in_vps << 2) |
> +			=C2=A0=C2=A0=C2=A0=C2=A0 (NON_VCL_PARAM_ENCODE_VUI) |
> +			=C2=A0=C2=A0=C2=A0=C2=A0 p_open_param->enc_aud;
> +	reg->hrd_rbsp_addr =3D p_open_param->hrd_rbsp_data_addr;
> +}
> +
> +static void wave6_gen_set_param_reg_avc(struct enc_info *p_enc_info,
> +					struct enc_cmd_set_param_reg *reg)
> +{
> +	struct enc_open_param *p_open_param =3D &p_enc_info->open_param;
> +	struct enc_codec_param *p_param =3D &p_open_param->codec_param;
> +
> +	reg->sps_param =3D (p_param->en_scaling_list << 31) |
> +			 (p_param->en_auto_level_adjusting << 28) |
> +			 (p_param->en_long_term << 21) |
> +			 (p_enc_info->color_format << 19) |
> +			 (p_param->internal_bit_depth << 14) |
> +			 (p_param->level << 3) |
> +			 p_param->profile;
> +	reg->pps_param =3D (p_param->en_cabac << 30) |
> +			 (p_param->en_transform8x8 << 29) |
> +			 ((p_param->cr_qp_offset & 0x1F) << 19) |
> +			 ((p_param->cb_qp_offset & 0x1F) << 14) |
> +			 ((p_param->tc_offset_div2 & 0xF) << 10) |
> +			 ((p_param->beta_offset_div2 & 0xF) << 6) |
> +			 ((!p_param->en_dbk) << 5) |
> +			 (p_param->en_lf_cross_slice_boundary << 2) |
> +			 (p_param->en_constrained_intra_pred << 1);
> +	reg->intra_param =3D (p_param->forced_idr_header << 28) |
> +			=C2=A0=C2=A0 (p_param->idr_period << 17) |
> +			=C2=A0=C2=A0 (p_param->intra_period << 6) |
> +			=C2=A0=C2=A0 p_param->qp;
> +	reg->rdo_param =3D (p_param->en_custom_lambda << 22) |
> +			 (p_param->en_me_center << 21) |
> +			 (p_param->en_qp_map << 20) |
> +			 (p_param->en_mode_map << 19) |
> +			 (p_param->en_q_round_offset << 17) |
> +			 (p_param->dis_coef_clear << 4) |
> +			 (p_param->en_adaptive_round << 3) |
> +			 (p_param->en_hvs_qp << 2);
> +	reg->slice_param =3D (p_param->slice_arg << 3) | p_param->slice_mode;
> +	reg->quant_param_2 =3D ((p_param->lambda_dqp_inter & 0x3F) << 14) |
> +			=C2=A0=C2=A0=C2=A0=C2=A0 ((p_param->lambda_dqp_intra & 0x3F) << 8);
> +	reg->non_vcl_param =3D (p_open_param->hrd_rbsp_data_size << 18) |
> +			=C2=A0=C2=A0=C2=A0=C2=A0 (p_open_param->enc_hrd_rbsp_in_vps << 2) |
> +			=C2=A0=C2=A0=C2=A0=C2=A0 (NON_VCL_PARAM_ENCODE_VUI) |
> +			=C2=A0=C2=A0=C2=A0=C2=A0 p_open_param->enc_aud;
> +	reg->hrd_rbsp_addr =3D p_open_param->hrd_rbsp_data_addr;
> +}
> +
> +static void wave6_gen_change_param_reg_common(struct vpu_instance *inst,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct enc_info *p_enc_info,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct enc_cmd_change_param_reg *reg=
)
> +{
> +	if (p_enc_info->open_param.codec_param.bitrate !=3D inst->enc_ctrls.bit=
rate) {
> +		reg->enable |=3D BIT(W6_PARAM_CHANGE_ENABLE_BIT_RC_TARGET_RATE);
> +		reg->rc_target_rate =3D inst->enc_ctrls.bitrate;
> +		p_enc_info->open_param.codec_param.bitrate =3D inst->enc_ctrls.bitrate=
;
> +	}
> +}
> +
> +int wave6_vpu_enc_init_seq(struct vpu_instance *inst)
> +{
> +	struct enc_cmd_set_param_reg reg;
> +	struct enc_info *p_enc_info =3D &inst->codec_info->enc_info;
> +	u32 i;
> +	int ret;
> +
> +	memset(&reg, 0, sizeof(struct enc_cmd_set_param_reg));
> +
> +	if (!wave6_update_enc_info(p_enc_info))
> +		return -EINVAL;
> +
> +	wave6_gen_set_param_reg_common(p_enc_info, inst->std, &reg);
> +	if (inst->std =3D=3D W_HEVC_ENC)
> +		wave6_gen_set_param_reg_hevc(p_enc_info, &reg);
> +	else if (inst->std =3D=3D W_AVC_ENC)
> +		wave6_gen_set_param_reg_avc(p_enc_info, &reg);
> +
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_OPTION, W6_SET_PARAM_OPT_=
COMMON);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_ENABLE, reg.enable);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_SRC_SIZE, reg.src_size);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_CUSTOM_MAP_ENDIAN, reg.cu=
stom_map_endian);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_SPS_PARAM, reg.sps_param)=
;
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_PPS_PARAM, reg.pps_param)=
;
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_GOP_PARAM, reg.gop_param)=
;
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_INTRA_PARAM, reg.intra_pa=
ram);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_CONF_WIN_TOP_BOT, reg.con=
f_win_top_bot);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_CONF_WIN_LEFT_RIGHT, reg.=
conf_win_left_right);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_RDO_PARAM, reg.rdo_param)=
;
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_SLICE_PARAM, reg.slice_pa=
ram);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_INTRA_REFRESH, reg.intra_=
refresh);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_INTRA_MIN_MAX_QP, reg.int=
ra_min_max_qp);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_RC_FRAME_RATE, reg.rc_fra=
me_rate);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_RC_TARGET_RATE, reg.rc_ta=
rget_rate);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_RC_PARAM, reg.rc_param);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_HVS_PARAM, reg.hvs_param)=
;
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_RC_MAX_BITRATE, reg.rc_ma=
x_bitrate);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_RC_VBV_BUFFER_SIZE, reg.r=
c_vbv_buffer_size);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_INTER_MIN_MAX_QP, reg.int=
er_min_max_qp);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_ROT_PARAM, reg.rot_param)=
;
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_NUM_UNITS_IN_TICK, reg.nu=
m_units_in_tick);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_TIME_SCALE, reg.time_scal=
e);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_NUM_TICKS_POC_DIFF_ONE,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg.num_ticks_poc_diff_one);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_MAX_INTRA_PIC_BIT, reg.ma=
x_intra_pic_bit);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_MAX_INTER_PIC_BIT, reg.ma=
x_inter_pic_bit);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_BG_PARAM, reg.bg_param);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_NON_VCL_PARAM, reg.non_vc=
l_param);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_VUI_RBSP_ADDR, reg.vui_rb=
sp_addr);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_HRD_RBSP_ADDR, reg.hrd_rb=
sp_addr);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_QROUND_OFFSET, reg.qround=
_offset);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_QUANT_PARAM_1, reg.quant_=
param_1);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_QUANT_PARAM_2, reg.quant_=
param_2);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_CUSTOM_GOP_PARAM, reg.cus=
tom_gop_param);
> +	for (i =3D 0; i < MAX_GOP_NUM; i++)
> +		vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_CUSTOM_GOP_PIC_PARAM_0 +=
 (i * 4),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg.custom_gop_pic_param[i]);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_TILE_PARAM, reg.tile_para=
m);
> +	for (i =3D 0; i < MAX_CUSTOM_LAMBDA_NUM; i++)
> +		vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA_0 + (i * 4=
),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg.custom_lambda[i]);
> +	for (i =3D 0; i < MAX_NUM_CHANGEABLE_TEMPORAL_LAYER; i++)
> +		vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_TEMPORAL_LAYER_0_QP + (i=
 * 4),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg.temporal_layer_qp[i]);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_SCL_SRC_SIZE, reg.scl_src=
_size);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_SCL_PARAM, reg.scl_param)=
;
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_COLOR_PARAM, reg.color_pa=
ram);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_SAR_PARAM, reg.sar_param)=
;
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_SAR_EXTENDED, reg.sar_ext=
ended);
> +
> +	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_ENC_SET_PARAM=
);
> +	ret =3D wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
> +	if (ret) {
> +		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
> +		return ret;
> +	}
> +
> +	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
> +		u32 reason_code =3D vpu_read_reg(inst->dev, W6_RET_FAIL_REASON);
> +
> +		wave6_print_reg_err(inst->dev, reason_code);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +int wave6_vpu_enc_get_seq_info(struct vpu_instance *inst, struct enc_ini=
tial_info *info)
> +{
> +	int ret;
> +
> +	ret =3D wave6_send_query(inst->dev, inst->id, inst->std, W6_QUERY_OPT_G=
ET_RESULT);
> +	if (ret)
> +		return ret;
> +
> +	if (vpu_read_reg(inst->dev, W6_RET_ENC_ENCODING_SUCCESS) !=3D 1) {
> +		info->err_reason =3D vpu_read_reg(inst->dev, W6_RET_ENC_ERR_INFO);
> +		ret =3D -EIO;
> +	} else {
> +		info->warn_info =3D vpu_read_reg(inst->dev, W6_RET_ENC_WARN_INFO);
> +	}
> +
> +	info->min_frame_buffer_count =3D vpu_read_reg(inst->dev, W6_RET_ENC_NUM=
_REQUIRED_FBC_FB);
> +	info->min_src_frame_count =3D vpu_read_reg(inst->dev, W6_RET_ENC_MIN_SR=
C_BUF_NUM);
> +	info->max_latency_pictures =3D vpu_read_reg(inst->dev, W6_RET_ENC_PIC_M=
AX_LATENCY_PICTURES);
> +	info->req_mv_buffer_count =3D vpu_read_reg(inst->dev, W6_RET_ENC_NUM_RE=
QUIRED_COL_BUF);
> +
> +	return ret;
> +}
> +
> +int wave6_vpu_enc_change_seq(struct vpu_instance *inst, bool *changed)
> +{
> +	struct enc_cmd_change_param_reg reg;
> +	struct enc_info *p_enc_info =3D &inst->codec_info->enc_info;
> +	int ret;
> +
> +	memset(&reg, 0, sizeof(struct enc_cmd_change_param_reg));
> +
> +	wave6_gen_change_param_reg_common(inst, p_enc_info, &reg);
> +
> +	if (!reg.enable)
> +		return 0;
> +
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_OPTION, W6_SET_PARAM_OPT_=
CHANGE_PARAM);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_ENABLE, reg.enable);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_RC_TARGET_RATE, reg.rc_ta=
rget_rate);
> +
> +	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_ENC_SET_PARAM=
);
> +	ret =3D wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
> +	if (ret) {
> +		dev_warn(inst->dev->dev, "enc set param timed out\n");
> +		return ret;
> +	}
> +
> +	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
> +		u32 reason_code =3D vpu_read_reg(inst->dev, W6_RET_FAIL_REASON);
> +
> +		wave6_print_reg_err(inst->dev, reason_code);
> +		return -EIO;
> +	}
> +
> +	*changed =3D true;
> +
> +	return 0;
> +}
> +
> +struct enc_cmd_set_fb_reg {
> +	u32 option;
> +	u32 pic_info;
> +	u32 pic_size;
> +	u32 num_fb;
> +	u32 fbc_stride;
> +	u32 fbc_y[WAVE6_MAX_FBS];
> +	u32 fbc_c[WAVE6_MAX_FBS];
> +	u32 fbc_cr[WAVE6_MAX_FBS];
> +	u32 fbc_y_offset[WAVE6_MAX_FBS];
> +	u32 fbc_c_offset[WAVE6_MAX_FBS];
> +	u32 fbc_cr_offset[WAVE6_MAX_FBS];
> +	u32 mv_col[WAVE6_MAX_FBS];
> +	u32 sub_sampled[WAVE6_MAX_FBS];
> +	u32 default_cdf;
> +};
> +
> +static void wave6_gen_set_fb_reg(struct enc_info *p_enc_info, enum codec=
_std std,
> +				 struct frame_buffer *fb_arr, struct enc_cmd_set_fb_reg *reg)
> +{
> +	struct enc_open_param *p_open_param =3D &p_enc_info->open_param;
> +	u32 mv_count =3D p_enc_info->initial_info.req_mv_buffer_count;
> +	u32 buf_width, buf_height;
> +	u32 stride_l, stride_c, i;
> +
> +	if (std =3D=3D W_AVC_ENC) {
> +		buf_width =3D ALIGN(p_enc_info->width, 16);
> +		buf_height =3D ALIGN(p_enc_info->height, 16);
> +		if (p_enc_info->rotation_angle =3D=3D 90 || p_enc_info->rotation_angle=
 =3D=3D 270) {
> +			buf_width =3D ALIGN(p_enc_info->height, 16);
> +			buf_height =3D ALIGN(p_enc_info->width, 16);
> +		}
> +	} else {
> +		buf_width =3D ALIGN(p_enc_info->width, 8);
> +		buf_height =3D ALIGN(p_enc_info->height, 8);
> +		if ((p_enc_info->rotation_angle !=3D 0 || p_enc_info->mirror_direction=
 !=3D 0) &&
> +		=C2=A0=C2=A0=C2=A0 !(p_enc_info->rotation_angle =3D=3D 180 &&
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p_enc_info->mirror_direction =3D=3D MIR=
DIR_HOR_VER)) {
> +			buf_width =3D ALIGN(p_enc_info->width, 32);
> +			buf_height =3D ALIGN(p_enc_info->height, 32);
> +		}
> +		if (p_enc_info->rotation_angle =3D=3D 90 || p_enc_info->rotation_angle=
 =3D=3D 270) {
> +			buf_width =3D ALIGN(p_enc_info->height, 32);
> +			buf_height =3D ALIGN(p_enc_info->width, 32);
> +		}
> +	}
> +
> +	if ((p_enc_info->rotation_angle !=3D 0 || p_enc_info->mirror_direction =
!=3D 0) &&
> +	=C2=A0=C2=A0=C2=A0 !(p_enc_info->rotation_angle =3D=3D 180 &&
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p_enc_info->mirror_direction =3D=3D MIRD=
IR_HOR_VER)) {
> +		stride_l =3D ALIGN((buf_width + 63), 64);
> +		stride_c =3D ALIGN((buf_width + 31), 32) / 2;
> +	} else {
> +		stride_l =3D ALIGN((p_enc_info->width) + 63, 64);
> +		stride_c =3D ALIGN((p_enc_info->width) + 31, 32) / 2;
> +	}
> +
> +	reg->option =3D (p_open_param->enable_non_ref_fbc_write << 26) | (1 << =
4) | (1 << 3);
> +	reg->pic_info =3D p_enc_info->stride;
> +	reg->pic_size =3D (buf_width << 16) | buf_height;
> +	reg->num_fb =3D ((p_enc_info->num_frame_buffers - 1) << 16) | (mv_count=
 - 1);
> +	reg->fbc_stride =3D (stride_l << 16) | stride_c;
> +	reg->default_cdf =3D 0;
> +
> +	for (i =3D 0; i < p_enc_info->num_frame_buffers; i++) {
> +		reg->fbc_y[i] =3D fb_arr[i].buf_y;
> +		reg->fbc_c[i] =3D fb_arr[i].buf_cb;
> +		reg->fbc_cr[i] =3D fb_arr[i].buf_cr;
> +		reg->fbc_y_offset[i] =3D p_enc_info->vb_fbc_y_tbl[i].daddr;
> +		reg->fbc_c_offset[i] =3D p_enc_info->vb_fbc_c_tbl[i].daddr;
> +		reg->fbc_cr_offset[i] =3D p_enc_info->vb_fbc_c_tbl[i].daddr +
> +						(p_enc_info->vb_fbc_c_tbl[i].size >> 1);
> +		reg->sub_sampled[i] =3D p_enc_info->vb_sub_sam_buf[i].daddr;
> +	}
> +	for (i =3D 0; i < mv_count; i++)
> +		reg->mv_col[i] =3D p_enc_info->vb_mv[i].daddr;
> +}
> +
> +int wave6_vpu_enc_register_frame_buffer(struct vpu_instance *inst, struc=
t frame_buffer *fb_arr)
> +{
> +	struct enc_cmd_set_fb_reg *reg;
> +	struct enc_info *p_enc_info =3D &inst->codec_info->enc_info;
> +	u32 mv_count =3D p_enc_info->initial_info.req_mv_buffer_count;
> +	int ret;
> +	u32 idx;
> +
> +	for (idx =3D 0; idx < p_enc_info->num_frame_buffers; idx++) {
> +		if (!p_enc_info->vb_fbc_y_tbl[idx].daddr)
> +			return -EINVAL;
> +		if (!p_enc_info->vb_fbc_c_tbl[idx].daddr)
> +			return -EINVAL;
> +		if (!p_enc_info->vb_sub_sam_buf[idx].daddr)
> +			return -EINVAL;
> +	}
> +	for (idx =3D 0; idx < mv_count; idx++) {
> +		if (!p_enc_info->vb_mv[idx].daddr)
> +			return -EINVAL;
> +	}
> +
> +	reg =3D kzalloc(sizeof(*reg), GFP_KERNEL);
> +	if (!reg)
> +		return -ENOMEM;
> +
> +	wave6_gen_set_fb_reg(p_enc_info, inst->std, fb_arr, reg);
> +
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_FB_OPTION, reg->option);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_FB_PIC_INFO, reg->pic_info);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_FB_PIC_SIZE, reg->pic_size);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_FB_NUM, reg->num_fb);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_FB_FBC_STRIDE, reg->fbc_stride)=
;
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_FB_DEFAULT_CDF, reg->default_cd=
f);
> +	for (idx =3D 0; idx < p_enc_info->num_frame_buffers; idx++) {
> +		vpu_write_reg(inst->dev, W6_CMD_ENC_SET_FB_FBC_Y0 + (idx * 24), reg->f=
bc_y[idx]);
> +		vpu_write_reg(inst->dev, W6_CMD_ENC_SET_FB_FBC_C0 + (idx * 24), reg->f=
bc_c[idx]);
> +		vpu_write_reg(inst->dev, W6_CMD_ENC_SET_FB_FBC_CR0 + (idx * 8), reg->f=
bc_cr[idx]);
> +		vpu_write_reg(inst->dev, W6_CMD_ENC_SET_FB_FBC_Y_OFFSET0 + (idx * 24),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg->fbc_y_offset[idx]);
> +		vpu_write_reg(inst->dev, W6_CMD_ENC_SET_FB_FBC_C_OFFSET0 + (idx * 24),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg->fbc_c_offset[idx]);
> +		vpu_write_reg(inst->dev, W6_CMD_ENC_SET_FB_FBC_CR_OFFSET0 + (idx * 8),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg->fbc_cr_offset[idx]);
> +		vpu_write_reg(inst->dev, W6_CMD_ENC_SET_FB_SUB_SAMPLED0 + (idx * 24),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg->sub_sampled[idx]);
> +	}
> +	for (idx =3D 0; idx < mv_count; idx++)
> +		vpu_write_reg(inst->dev, W6_CMD_ENC_SET_FB_MV_COL0 + (idx * 24), reg->=
mv_col[idx]);
> +
> +	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_SET_FB);
> +	ret =3D wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
> +	if (ret) {
> +		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
> +		kfree(reg);
> +		return ret;
> +	}
> +
> +	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
> +		kfree(reg);
> +		return -EIO;
> +	}
> +
> +	kfree(reg);
> +	return 0;
> +}
> +
> +struct enc_cmd_enc_pic_reg {
> +	u32 bs_start;
> +	u32 bs_size;
> +	u32 bs_option;
> +	u32 use_sec_axi;
> +	u32 report_param;
> +	u32 mv_histo_class0;
> +	u32 mv_histo_class1;
> +	u32 custom_map_param;
> +	u32 custom_map_addr;
> +	u32 src_pic_idx;
> +	u32 src_addr_y;
> +	u32 src_addr_u;
> +	u32 src_addr_v;
> +	u32 src_stride;
> +	u32 src_format;
> +	u32 src_axi_sel;
> +	u32 code_option;
> +	u32 pic_param;
> +	u32 longterm_pic;
> +	u32 prefix_sei_nal_addr;
> +	u32 prefix_sei_info;
> +	u32 suffix_sei_nal_addr;
> +	u32 suffix_sei_info;
> +	u32 timestamp;
> +	u32 csc_coeff[MAX_CSC_COEFF_NUM];
> +};
> +
> +static bool is_format_conv(enum frame_buffer_format in_fmt,
> +			=C2=A0=C2=A0 enum frame_buffer_format out_fmt)
> +{
> +	if (in_fmt =3D=3D FORMAT_420 ||
> +	=C2=A0=C2=A0=C2=A0 in_fmt =3D=3D FORMAT_420_P10_16BIT_MSB ||
> +	=C2=A0=C2=A0=C2=A0 in_fmt =3D=3D FORMAT_420_P10_16BIT_LSB ||
> +	=C2=A0=C2=A0=C2=A0 in_fmt =3D=3D FORMAT_420_P10_32BIT_MSB ||
> +	=C2=A0=C2=A0=C2=A0 in_fmt =3D=3D FORMAT_420_P10_32BIT_LSB) {
> +		if (out_fmt !=3D FORMAT_420 &&
> +		=C2=A0=C2=A0=C2=A0 out_fmt !=3D FORMAT_420_P10_16BIT_MSB &&
> +		=C2=A0=C2=A0=C2=A0 out_fmt !=3D FORMAT_420_P10_16BIT_LSB &&
> +		=C2=A0=C2=A0=C2=A0 out_fmt !=3D FORMAT_420_P10_32BIT_MSB &&
> +		=C2=A0=C2=A0=C2=A0 out_fmt !=3D FORMAT_420_P10_32BIT_LSB)
> +			return true;
> +	} else if (in_fmt =3D=3D FORMAT_422 ||
> +		=C2=A0=C2=A0 in_fmt =3D=3D FORMAT_422_P10_16BIT_MSB ||
> +		=C2=A0=C2=A0 in_fmt =3D=3D FORMAT_422_P10_16BIT_LSB ||
> +		=C2=A0=C2=A0 in_fmt =3D=3D FORMAT_422_P10_32BIT_MSB ||
> +		=C2=A0=C2=A0 in_fmt =3D=3D FORMAT_422_P10_32BIT_LSB) {
> +		if (out_fmt !=3D FORMAT_422 &&
> +		=C2=A0=C2=A0=C2=A0 out_fmt !=3D FORMAT_422_P10_16BIT_MSB &&
> +		=C2=A0=C2=A0=C2=A0 out_fmt !=3D FORMAT_422_P10_16BIT_LSB &&
> +		=C2=A0=C2=A0=C2=A0 out_fmt !=3D FORMAT_422_P10_32BIT_MSB &&
> +		=C2=A0=C2=A0=C2=A0 out_fmt !=3D FORMAT_422_P10_32BIT_LSB)
> +			return true;
> +	} else if (in_fmt =3D=3D FORMAT_444 ||
> +		=C2=A0=C2=A0 in_fmt =3D=3D FORMAT_444_P10_16BIT_MSB ||
> +		=C2=A0=C2=A0 in_fmt =3D=3D FORMAT_444_P10_16BIT_LSB ||
> +		=C2=A0=C2=A0 in_fmt =3D=3D FORMAT_444_P10_32BIT_MSB ||
> +		=C2=A0=C2=A0 in_fmt =3D=3D FORMAT_444_P10_32BIT_LSB) {
> +		if (out_fmt !=3D FORMAT_444 &&
> +		=C2=A0=C2=A0=C2=A0 out_fmt !=3D FORMAT_444_P10_16BIT_MSB &&
> +		=C2=A0=C2=A0=C2=A0 out_fmt !=3D FORMAT_444_P10_16BIT_LSB &&
> +		=C2=A0=C2=A0=C2=A0 out_fmt !=3D FORMAT_444_P10_32BIT_MSB &&
> +		=C2=A0=C2=A0=C2=A0 out_fmt !=3D FORMAT_444_P10_32BIT_LSB)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static void wave6_gen_enc_pic_reg(struct enc_info *p_enc_info, bool cbcr=
_interleave, bool nv21,
> +				=C2=A0 struct enc_param *opt, struct enc_cmd_enc_pic_reg *reg)
> +{
> +	struct enc_open_param open =3D p_enc_info->open_param;
> +	struct enc_codec_param param =3D open.codec_param;
> +	bool is_lsb =3D false;
> +	bool is_10bit =3D false;
> +	bool is_3p4b =3D false;
> +	u32 stride_c;
> +	u32 src_frame_format;
> +	u32 endian;
> +	u32 color_format;
> +	bool is_ayuv =3D false;
> +	bool is_csc_format =3D false;
> +	bool is_24bit =3D false;
> +	bool format_conv;
> +
> +	endian =3D wave6_vdi_convert_endian(open.source_endian);
> +	endian =3D (~endian & VDI_128BIT_ENDIAN_MASK);
> +	format_conv =3D is_format_conv(open.src_format, open.output_format);
> +
> +	switch (open.src_format) {
> +	case FORMAT_420:
> +	case FORMAT_420_P10_16BIT_MSB:
> +	case FORMAT_420_P10_16BIT_LSB:
> +		color_format =3D 1;
> +		stride_c =3D (cbcr_interleave) ? opt->source_frame->stride :
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (opt->source_frame->stride / 2=
);
> +		break;
> +	case FORMAT_420_P10_32BIT_MSB:
> +	case FORMAT_420_P10_32BIT_LSB:
> +		color_format =3D 1;
> +		stride_c =3D (cbcr_interleave) ? opt->source_frame->stride :
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ALIGN((opt->source_frame->stri=
de / 2), 16);
> +		break;
> +	case FORMAT_422:
> +	case FORMAT_422_P10_16BIT_MSB:
> +	case FORMAT_422_P10_16BIT_LSB:
> +		color_format =3D 2;
> +		stride_c =3D (cbcr_interleave) ? opt->source_frame->stride :
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (opt->source_frame->stride / 2=
);
> +		stride_c =3D (format_conv) ? (stride_c * 2) : stride_c;
> +		break;
> +	case FORMAT_422_P10_32BIT_MSB:
> +	case FORMAT_422_P10_32BIT_LSB:
> +		color_format =3D 2;
> +		stride_c =3D (cbcr_interleave) ? opt->source_frame->stride :
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ALIGN((opt->source_frame->stri=
de / 2), 16);
> +		stride_c =3D (format_conv) ? (stride_c * 2) : stride_c;
> +		break;
> +	case FORMAT_444:
> +	case FORMAT_444_P10_16BIT_MSB:
> +	case FORMAT_444_P10_16BIT_LSB:
> +		color_format =3D 3;
> +		stride_c =3D (cbcr_interleave) ? (opt->source_frame->stride * 2) :
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opt->source_frame->stride;
> +		stride_c =3D (format_conv) ? (stride_c * 2) : stride_c;
> +		break;
> +	case FORMAT_444_P10_32BIT_MSB:
> +	case FORMAT_444_P10_32BIT_LSB:
> +		color_format =3D 3;
> +		stride_c =3D (cbcr_interleave) ? ALIGN((opt->source_frame->stride * 2)=
, 16) :
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opt->source_frame->stride;
> +		stride_c =3D (format_conv) ? (stride_c * 2) : stride_c;
> +		break;
> +	case FORMAT_YUV444_24BIT:
> +		color_format =3D 0;
> +		stride_c =3D ALIGN((opt->source_frame->stride * 2), 16);
> +		break;
> +	case FORMAT_RGB_24BIT_PACKED:
> +	case FORMAT_YUV444_24BIT_PACKED:
> +	case FORMAT_RGB_32BIT_PACKED:
> +	case FORMAT_RGB_P10_32BIT_PACKED:
> +	case FORMAT_YUV444_32BIT_PACKED:
> +	case FORMAT_YUV444_P10_32BIT_PACKED:
> +		color_format =3D 4;
> +		stride_c =3D 0;
> +		break;
> +	case FORMAT_YUYV:
> +	case FORMAT_YVYU:
> +	case FORMAT_UYVY:
> +	case FORMAT_VYUY:
> +	case FORMAT_YUYV_P10_16BIT_MSB:
> +	case FORMAT_YVYU_P10_16BIT_MSB:
> +	case FORMAT_UYVY_P10_16BIT_MSB:
> +	case FORMAT_VYUY_P10_16BIT_MSB:
> +	case FORMAT_YUYV_P10_16BIT_LSB:
> +	case FORMAT_YVYU_P10_16BIT_LSB:
> +	case FORMAT_UYVY_P10_16BIT_LSB:
> +	case FORMAT_VYUY_P10_16BIT_LSB:
> +	case FORMAT_YUYV_P10_32BIT_MSB:
> +	case FORMAT_YVYU_P10_32BIT_MSB:
> +	case FORMAT_UYVY_P10_32BIT_MSB:
> +	case FORMAT_VYUY_P10_32BIT_MSB:
> +	case FORMAT_YUYV_P10_32BIT_LSB:
> +	case FORMAT_YVYU_P10_32BIT_LSB:
> +	case FORMAT_UYVY_P10_32BIT_LSB:
> +	case FORMAT_VYUY_P10_32BIT_LSB:
> +		color_format =3D 2;
> +		stride_c =3D 0;
> +		break;
> +	default:
> +		color_format =3D 0;
> +		stride_c =3D 0;
> +		break;
> +	}
> +
> +	switch (open.src_format) {
> +	case FORMAT_420:
> +	case FORMAT_422:
> +	case FORMAT_444:
> +	case FORMAT_400:
> +	case FORMAT_YUYV:
> +	case FORMAT_YVYU:
> +	case FORMAT_UYVY:
> +	case FORMAT_VYUY:
> +		is_lsb =3D false;
> +		is_3p4b =3D false;
> +		break;
> +	case FORMAT_420_P10_16BIT_MSB:
> +	case FORMAT_422_P10_16BIT_MSB:
> +	case FORMAT_444_P10_16BIT_MSB:
> +	case FORMAT_400_P10_16BIT_MSB:
> +	case FORMAT_YUYV_P10_16BIT_MSB:
> +	case FORMAT_YVYU_P10_16BIT_MSB:
> +	case FORMAT_UYVY_P10_16BIT_MSB:
> +	case FORMAT_VYUY_P10_16BIT_MSB:
> +		is_lsb =3D false;
> +		is_10bit =3D true;
> +		is_3p4b =3D false;
> +		break;
> +	case FORMAT_420_P10_16BIT_LSB:
> +	case FORMAT_422_P10_16BIT_LSB:
> +	case FORMAT_444_P10_16BIT_LSB:
> +	case FORMAT_400_P10_16BIT_LSB:
> +	case FORMAT_YUYV_P10_16BIT_LSB:
> +	case FORMAT_YVYU_P10_16BIT_LSB:
> +	case FORMAT_UYVY_P10_16BIT_LSB:
> +	case FORMAT_VYUY_P10_16BIT_LSB:
> +		is_lsb =3D true;
> +		is_10bit =3D true;
> +		is_3p4b =3D false;
> +		break;
> +	case FORMAT_420_P10_32BIT_MSB:
> +	case FORMAT_422_P10_32BIT_MSB:
> +	case FORMAT_444_P10_32BIT_MSB:
> +	case FORMAT_400_P10_32BIT_MSB:
> +	case FORMAT_YUYV_P10_32BIT_MSB:
> +	case FORMAT_YVYU_P10_32BIT_MSB:
> +	case FORMAT_UYVY_P10_32BIT_MSB:
> +	case FORMAT_VYUY_P10_32BIT_MSB:
> +		is_lsb =3D false;
> +		is_10bit =3D true;
> +		is_3p4b =3D true;
> +		break;
> +	case FORMAT_420_P10_32BIT_LSB:
> +	case FORMAT_422_P10_32BIT_LSB:
> +	case FORMAT_444_P10_32BIT_LSB:
> +	case FORMAT_400_P10_32BIT_LSB:
> +	case FORMAT_YUYV_P10_32BIT_LSB:
> +	case FORMAT_YVYU_P10_32BIT_LSB:
> +	case FORMAT_UYVY_P10_32BIT_LSB:
> +	case FORMAT_VYUY_P10_32BIT_LSB:
> +		is_lsb =3D true;
> +		is_10bit =3D true;
> +		is_3p4b =3D true;
> +		break;
> +	case FORMAT_RGB_32BIT_PACKED:
> +		is_ayuv =3D false;
> +		is_csc_format =3D true;
> +		break;
> +	case FORMAT_RGB_P10_32BIT_PACKED:
> +		is_ayuv =3D false;
> +		is_csc_format =3D true;
> +		is_10bit =3D true;
> +		break;
> +	case FORMAT_YUV444_32BIT_PACKED:
> +		is_ayuv =3D true;
> +		is_csc_format =3D true;
> +		break;
> +	case FORMAT_YUV444_P10_32BIT_PACKED:
> +		is_ayuv =3D true;
> +		is_csc_format =3D true;
> +		is_10bit =3D true;
> +		break;
> +	case FORMAT_RGB_24BIT_PACKED:
> +		is_ayuv =3D false;
> +		is_csc_format =3D true;
> +		is_24bit =3D true;
> +		break;
> +	case FORMAT_YUV444_24BIT_PACKED:
> +		is_ayuv =3D true;
> +		is_csc_format =3D true;
> +		is_24bit =3D true;
> +		break;
> +	case FORMAT_YUV444_24BIT:
> +		is_ayuv =3D true;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	src_frame_format =3D (nv21 << 2) | (cbcr_interleave << 1);
> +	switch (open.packed_format) {
> +	case PACKED_YUYV:
> +		src_frame_format =3D 1; break;
> +	case PACKED_YVYU:
> +		src_frame_format =3D 5; break;
> +	case PACKED_UYVY:
> +		src_frame_format =3D 9; break;
> +	case PACKED_VYUY:
> +		src_frame_format =3D 13; break;
> +	default:
> +		break;
> +	}
> +
> +	reg->bs_start =3D opt->pic_stream_buffer_addr;
> +	reg->bs_size =3D opt->pic_stream_buffer_size;
> +	reg->bs_option =3D (p_enc_info->line_buf_int_en << 6);
> +	reg->use_sec_axi =3D (p_enc_info->sec_axi_info.use_enc_rdo << 1) |
> +			=C2=A0=C2=A0 p_enc_info->sec_axi_info.use_enc_lf;
> +	reg->report_param =3D (param.en_report_mv_histo << 1);
> +	reg->mv_histo_class0 =3D (param.report_mv_histo_threshold0 << 16) |
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 param.report_mv_histo_threshold1=
;
> +	reg->mv_histo_class1 =3D (param.report_mv_histo_threshold2 << 16) |
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 param.report_mv_histo_threshold3=
;
> +
> +	reg->src_pic_idx =3D opt->src_idx;
> +	if (opt->src_end)
> +		reg->src_pic_idx =3D 0xFFFFFFFF;
> +
> +	reg->src_addr_y =3D opt->source_frame->buf_y;
> +	if (open.cbcr_order =3D=3D CBCR_ORDER_NORMAL) {
> +		reg->src_addr_u =3D opt->source_frame->buf_cb;
> +		reg->src_addr_v =3D opt->source_frame->buf_cr;
> +	} else {
> +		reg->src_addr_u =3D opt->source_frame->buf_cr;
> +		reg->src_addr_v =3D opt->source_frame->buf_cb;
> +	}
> +	reg->src_stride =3D (opt->source_frame->stride << 16) | stride_c;
> +	reg->src_format =3D (color_format << 28) |
> +			=C2=A0 (is_24bit << 25) |
> +			=C2=A0 (is_ayuv << 24) |
> +			=C2=A0 (is_csc_format << 20) |
> +			=C2=A0 (opt->csc.format_order << 16) |
> +			=C2=A0 (endian << 12) |
> +			=C2=A0 (is_lsb << 6) |
> +			=C2=A0 (is_3p4b << 5) |
> +			=C2=A0 (is_10bit << 4) |
> +			=C2=A0 src_frame_format;
> +	reg->src_axi_sel =3D DEFAULT_SRC_AXI;
> +	reg->code_option =3D (opt->src_end << 10) |
> +			=C2=A0=C2=A0 (W6_ENC_PIC_OPT_VCL) |
> +			=C2=A0=C2=A0 (W6_ENC_PIC_OPT_HEADER_IMPLICIT);
> +	reg->pic_param =3D (param.intra_4x4 << 28) |
> +			 (opt->force_pic_type << 21) |
> +			 (opt->force_pic_type_enable << 20) |
> +			 (opt->force_pic_qp_b << 14) |
> +			 (opt->force_pic_qp_p << 8) |
> +			 (opt->force_pic_qp_i << 2) |
> +			 (opt->force_pic_qp_enable << 1) |
> +			 opt->skip_picture;
> +	reg->timestamp =3D ((opt->timestamp.hour & 0x1F) << 26) |
> +			 ((opt->timestamp.min & 0x3F) << 20) |
> +			 ((opt->timestamp.sec & 0x3F) << 14) |
> +			 ((opt->timestamp.ms & 0x3FFF));
> +	reg->csc_coeff[0] =3D ((opt->csc.coef_ry & 0x3FF) << 20) |
> +			=C2=A0=C2=A0=C2=A0 ((opt->csc.coef_gy & 0x3FF) << 10) |
> +			=C2=A0=C2=A0=C2=A0 (opt->csc.coef_by & 0x3FF);
> +	reg->csc_coeff[1] =3D ((opt->csc.coef_rcb & 0x3FF) << 20) |
> +			=C2=A0=C2=A0=C2=A0 ((opt->csc.coef_gcb & 0x3FF) << 10) |
> +			=C2=A0=C2=A0=C2=A0 (opt->csc.coef_bcb & 0x3FF);
> +	reg->csc_coeff[2] =3D ((opt->csc.coef_rcr & 0x3FF) << 20) |
> +			=C2=A0=C2=A0=C2=A0 ((opt->csc.coef_gcr & 0x3FF) << 10) |
> +			=C2=A0=C2=A0=C2=A0 (opt->csc.coef_bcr & 0x3FF);
> +	reg->csc_coeff[3] =3D ((opt->csc.offset_y & 0x3FF) << 20) |
> +			=C2=A0=C2=A0=C2=A0 ((opt->csc.offset_cb & 0x3FF) << 10) |
> +			=C2=A0=C2=A0=C2=A0 (opt->csc.offset_cr & 0x3FF);
> +}
> +
> +int wave6_vpu_encode(struct vpu_instance *inst, struct enc_param *option=
, u32 *fail_res)
> +{
> +	struct enc_cmd_enc_pic_reg reg;
> +	struct enc_info *p_enc_info =3D &inst->codec_info->enc_info;
> +	int ret;
> +
> +	memset(&reg, 0, sizeof(struct enc_cmd_enc_pic_reg));
> +
> +	wave6_gen_enc_pic_reg(p_enc_info, inst->cbcr_interleave,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inst->nv21, option, &reg);
> +
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_BS_START, reg.bs_start);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_BS_SIZE, reg.bs_size);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_BS_OPTION, reg.bs_option);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_USE_SEC_AXI, reg.use_sec_axi);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_REPORT_PARAM, reg.report_param)=
;
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_MV_HISTO_CLASS0, reg.mv_histo_c=
lass0);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_MV_HISTO_CLASS1, reg.mv_histo_c=
lass1);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CUSTOM_MAP_OPTION_PARAM, reg.cu=
stom_map_param);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CUSTOM_MAP_OPTION_ADDR, reg.cus=
tom_map_addr);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_PIC_IDX, reg.src_pic_idx);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_ADDR_Y, reg.src_addr_y);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_ADDR_U, reg.src_addr_u);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_ADDR_V, reg.src_addr_v);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_STRIDE, reg.src_stride);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_FORMAT, reg.src_format);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_AXI_SEL, reg.src_axi_sel);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CODE_OPTION, reg.code_option);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_PIC_PARAM, reg.pic_param);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_LONGTERM_PIC, reg.longterm_pic)=
;
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_PREFIX_SEI_NAL_ADDR, reg.prefix=
_sei_nal_addr);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_PREFIX_SEI_INFO, reg.prefix_sei=
_info);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SUFFIX_SEI_NAL_ADDR, reg.suffix=
_sei_nal_addr);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SUFFIX_SEI_INFO, reg.suffix_sei=
_info);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_TIMESTAMP, reg.timestamp);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CSC_COEFF_0, reg.csc_coeff[0]);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CSC_COEFF_1, reg.csc_coeff[1]);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CSC_COEFF_2, reg.csc_coeff[2]);
> +	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CSC_COEFF_3, reg.csc_coeff[3]);
> +
> +	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_ENC_PIC);
> +	ret =3D wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
> +	if (ret) {
> +		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
> +		return -ETIMEDOUT;
> +	}
> +
> +	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
> +		*fail_res =3D vpu_read_reg(inst->dev, W6_RET_FAIL_REASON);
> +		wave6_print_reg_err(inst->dev, *fail_res);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +int wave6_vpu_enc_get_result(struct vpu_instance *inst, struct enc_outpu=
t_info *result)
> +{
> +	struct enc_info *p_enc_info =3D &inst->codec_info->enc_info;
> +	u32 reg_val;
> +	int ret;
> +
> +	ret =3D wave6_send_query(inst->dev, inst->id, inst->std, W6_QUERY_OPT_G=
ET_RESULT);
> +	if (ret)
> +		return ret;
> +
> +	result->encoding_success =3D vpu_read_reg(inst->dev, W6_RET_ENC_ENCODIN=
G_SUCCESS);
> +	if (!result->encoding_success)
> +		result->error_reason =3D vpu_read_reg(inst->dev, W6_RET_ENC_ERR_INFO);
> +	else
> +		result->warn_info =3D vpu_read_reg(inst->dev, W6_RET_DEC_WARN_INFO);
> +
> +	result->enc_pic_cnt =3D vpu_read_reg(inst->dev, W6_RET_ENC_PIC_NUM);
> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_ENC_PIC_TYPE);
> +	result->pic_type =3D reg_val & 0xFFFF;
> +
> +	result->enc_vcl_nut =3D vpu_read_reg(inst->dev, W6_RET_ENC_VCL_NUT);
> +	result->recon_frame_index =3D vpu_read_reg(inst->dev, W6_RET_ENC_PIC_ID=
X);
> +	if (result->recon_frame_index >=3D 0)
> +		result->recon_frame =3D inst->frame_buf[result->recon_frame_index];
> +
> +	result->non_ref_pic =3D vpu_read_reg(inst->dev, W6_RET_ENC_PIC_NON_REF_=
PIC_FLAG);
> +	result->num_of_slices =3D vpu_read_reg(inst->dev, W6_RET_ENC_PIC_SLICE_=
NUM);
> +	result->pic_skipped =3D vpu_read_reg(inst->dev, W6_RET_ENC_PIC_SKIP);
> +	result->num_of_intra =3D vpu_read_reg(inst->dev, W6_RET_ENC_PIC_NUM_INT=
RA);
> +	result->num_of_merge =3D vpu_read_reg(inst->dev, W6_RET_ENC_PIC_NUM_MER=
GE);
> +	result->num_of_skip_block =3D vpu_read_reg(inst->dev, W6_RET_ENC_PIC_NU=
M_SKIP);
> +	result->bitstream_wrap_around =3D 0;
> +
> +	result->avg_ctu_qp =3D vpu_read_reg(inst->dev, W6_RET_ENC_PIC_AVG_CTU_Q=
P);
> +	result->enc_pic_byte =3D vpu_read_reg(inst->dev, W6_RET_ENC_PIC_BYTE);
> +
> +	result->enc_gop_pic_idx =3D vpu_read_reg(inst->dev, W6_RET_ENC_GOP_PIC_=
IDX);
> +	result->enc_pic_poc =3D vpu_read_reg(inst->dev, W6_RET_ENC_PIC_POC);
> +	result->enc_src_idx =3D vpu_read_reg(inst->dev, W6_RET_ENC_USED_SRC_IDX=
);
> +	result->wr_ptr =3D vpu_read_reg(inst->dev, W6_RET_ENC_WR_PTR);
> +	result->rd_ptr =3D vpu_read_reg(inst->dev, W6_RET_ENC_RD_PTR);
> +
> +	result->pic_distortion_low =3D vpu_read_reg(inst->dev, W6_RET_ENC_PIC_D=
IST_LOW);
> +	result->pic_distortion_high =3D vpu_read_reg(inst->dev, W6_RET_ENC_PIC_=
DIST_HIGH);
> +
> +	result->mv_histo.cnt0 =3D vpu_read_reg(inst->dev, W6_RET_ENC_HISTO_CNT_=
0);
> +	result->mv_histo.cnt1 =3D vpu_read_reg(inst->dev, W6_RET_ENC_HISTO_CNT_=
1);
> +	result->mv_histo.cnt2 =3D vpu_read_reg(inst->dev, W6_RET_ENC_HISTO_CNT_=
2);
> +	result->mv_histo.cnt3 =3D vpu_read_reg(inst->dev, W6_RET_ENC_HISTO_CNT_=
3);
> +	result->mv_histo.cnt4 =3D vpu_read_reg(inst->dev, W6_RET_ENC_HISTO_CNT_=
4);
> +
> +	result->fme_sum.lower_x0 =3D vpu_read_reg(inst->dev, W6_RET_ENC_SUM_ME0=
_X_DIR_LOWER);
> +	result->fme_sum.higher_x0 =3D vpu_read_reg(inst->dev, W6_RET_ENC_SUM_ME=
0_X_DIR_HIGHER);
> +	result->fme_sum.lower_y0 =3D vpu_read_reg(inst->dev, W6_RET_ENC_SUM_ME0=
_Y_DIR_LOWER);
> +	result->fme_sum.higher_y0 =3D vpu_read_reg(inst->dev, W6_RET_ENC_SUM_ME=
0_Y_DIR_HIGHER);
> +	result->fme_sum.lower_x1 =3D vpu_read_reg(inst->dev, W6_RET_ENC_SUM_ME1=
_X_DIR_LOWER);
> +	result->fme_sum.higher_x1 =3D vpu_read_reg(inst->dev, W6_RET_ENC_SUM_ME=
1_X_DIR_HIGHER);
> +	result->fme_sum.lower_y1 =3D vpu_read_reg(inst->dev, W6_RET_ENC_SUM_ME1=
_Y_DIR_LOWER);
> +	result->fme_sum.higher_y1 =3D vpu_read_reg(inst->dev, W6_RET_ENC_SUM_ME=
1_Y_DIR_HIGHER);
> +
> +	result->src_y_addr =3D vpu_read_reg(inst->dev, W6_RET_ENC_SRC_Y_ADDR);
> +	result->custom_map_addr =3D vpu_read_reg(inst->dev, W6_RET_ENC_CUSTOM_M=
AP_OPTION_ADDR);
> +	result->prefix_sei_nal_addr =3D vpu_read_reg(inst->dev, W6_RET_ENC_PREF=
IX_SEI_NAL_ADDR);
> +	result->suffix_sei_nal_addr =3D vpu_read_reg(inst->dev, W6_RET_ENC_SUFF=
IX_SEI_NAL_ADDR);
> +
> +	reg_val =3D vpu_read_reg(inst->dev, W6_RET_ENC_TIMESTAMP);
> +	result->timestamp.hour =3D (reg_val >> 26) & 0x1F;
> +	result->timestamp.min =3D (reg_val >> 20) & 0x3F;
> +	result->timestamp.sec =3D (reg_val >> 14) & 0x3F;
> +	result->timestamp.ms =3D reg_val & 0x3FFF;
> +
> +	result->bitstream_buffer =3D vpu_read_reg(inst->dev, W6_RET_ENC_RD_PTR)=
;
> +
> +	if (result->recon_frame_index =3D=3D RECON_IDX_FLAG_HEADER_ONLY)
> +		result->bitstream_size =3D result->enc_pic_byte;
> +	else if (result->recon_frame_index < 0)
> +		result->bitstream_size =3D 0;
> +	else
> +		result->bitstream_size =3D result->enc_pic_byte;
> +
> +	result->cycle.host_cmd_s =3D vpu_read_reg(inst->dev, W6_RET_CQ_IN_TICK)=
;
> +	result->cycle.host_cmd_e =3D vpu_read_reg(inst->dev, W6_RET_RQ_OUT_TICK=
);
> +	result->cycle.proc_s =3D vpu_read_reg(inst->dev, W6_RET_HW_RUN_TICK);
> +	result->cycle.proc_e =3D vpu_read_reg(inst->dev, W6_RET_HW_DONE_TICK);
> +	result->cycle.vpu_s =3D vpu_read_reg(inst->dev, W6_RET_FW_RUN_TICK);
> +	result->cycle.vpu_e =3D vpu_read_reg(inst->dev, W6_RET_FW_DONE_TICK);
> +	result->cycle.frame_cycle =3D (result->cycle.vpu_e - result->cycle.host=
_cmd_s) *
> +				=C2=A0=C2=A0=C2=A0 p_enc_info->cycle_per_tick;
> +	result->cycle.proc_cycle =3D (result->cycle.proc_e - result->cycle.proc=
_s) *
> +				=C2=A0=C2=A0 p_enc_info->cycle_per_tick;
> +	result->cycle.vpu_cycle =3D ((result->cycle.vpu_e - result->cycle.vpu_s=
) -
> +				=C2=A0=C2=A0 (result->cycle.proc_e - result->cycle.proc_s)) *
> +				=C2=A0 p_enc_info->cycle_per_tick;
> +
> +	return 0;
> +}
> +
> +int wave6_vpu_enc_fini_seq(struct vpu_instance *inst, u32 *fail_res)
> +{
> +	int ret;
> +
> +	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_DESTROY_INSTA=
NCE);
> +	ret =3D wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
> +	if (ret)
> +		return -ETIMEDOUT;
> +
> +	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
> +		*fail_res =3D vpu_read_reg(inst->dev, W6_RET_FAIL_REASON);
> +		wave6_print_reg_err(inst->dev, *fail_res);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static int wave6_vpu_enc_check_gop_param(struct vpu_instance *inst, stru=
ct enc_codec_param *p_param)
> +{
> +	struct vpu_core_device *vpu_dev =3D inst->dev;
> +	struct device *dev =3D vpu_dev->dev;
> +	int i;
> +	bool low_delay =3D true;
> +
> +	if (p_param->gop_preset_idx =3D=3D PRESET_IDX_CUSTOM_GOP) {
> +		if (p_param->gop_param.custom_gop_size > 1) {
> +			int min_val =3D p_param->gop_param.pic_param[0].poc_offset;
> +
> +			for (i =3D 1; i < p_param->gop_param.custom_gop_size; i++) {
> +				if (min_val > p_param->gop_param.pic_param[i].poc_offset) {
> +					low_delay =3D false;
> +					break;
> +				}
> +				min_val =3D p_param->gop_param.pic_param[i].poc_offset;
> +			}
> +		}
> +	} else if (p_param->gop_preset_idx =3D=3D PRESET_IDX_ALL_I ||
> +		=C2=A0=C2=A0 p_param->gop_preset_idx =3D=3D PRESET_IDX_IPP ||
> +		=C2=A0=C2=A0 p_param->gop_preset_idx =3D=3D PRESET_IDX_IBBB ||
> +		=C2=A0=C2=A0 p_param->gop_preset_idx =3D=3D PRESET_IDX_IPPPP ||
> +		=C2=A0=C2=A0 p_param->gop_preset_idx =3D=3D PRESET_IDX_IBBBB ||
> +		=C2=A0=C2=A0 p_param->gop_preset_idx =3D=3D PRESET_IDX_IPP_SINGLE) {
> +	}
> +
> +	if (p_param->gop_preset_idx >=3D PRESET_IDX_MAX) {
> +		dev_err(dev, "gop_preset_idx: %d\n", p_param->gop_preset_idx);
> +		return -EINVAL;
> +	}
> +
> +	if (p_param->gop_preset_idx =3D=3D PRESET_IDX_CUSTOM_GOP) {
> +		if (p_param->gop_param.custom_gop_size < 1 ||
> +		=C2=A0=C2=A0=C2=A0 p_param->gop_param.custom_gop_size > MAX_GOP_NUM) {
> +			dev_err(dev, "custom_gop_size: %d\n", p_param->gop_param.custom_gop_s=
ize);
> +			return -EINVAL;
> +		}
> +		for (i =3D 0; i < p_param->gop_param.custom_gop_size; i++) {
> +			struct custom_gop_pic_param pic_param =3D p_param->gop_param.pic_para=
m[i];
> +
> +			if (pic_param.pic_type !=3D PIC_TYPE_I &&
> +			=C2=A0=C2=A0=C2=A0 pic_param.pic_type !=3D PIC_TYPE_P &&
> +			=C2=A0=C2=A0=C2=A0 pic_param.pic_type !=3D PIC_TYPE_B) {
> +				dev_err(dev, "pic_param[%d].pic_type: %d\n", i, pic_param.pic_type);
> +				return -EINVAL;
> +			}
> +			if (pic_param.poc_offset < 1 ||
> +			=C2=A0=C2=A0=C2=A0 pic_param.poc_offset > p_param->gop_param.custom_g=
op_size) {
> +				dev_err(dev, "pic_param[%d].poc_offset: %d\n",
> +					i, pic_param.poc_offset);
> +				return -EINVAL;
> +			}
> +			if (pic_param.use_multi_ref_p < 0 || pic_param.use_multi_ref_p > 1) {
> +				dev_err(dev, "pic_param[%d].use_multi_ref_p: %d\n",
> +					i, pic_param.use_multi_ref_p);
> +				return -EINVAL;
> +			}
> +			if (pic_param.temporal_id < 0 || pic_param.temporal_id > 3) {
> +				dev_err(dev, "pic_param[%d].temporal_id: %d\n",
> +					i, pic_param.temporal_id);
> +				return -EINVAL;
> +			}
> +		}
> +		if (inst->std =3D=3D W_AVC_ENC && !low_delay) {
> +			for (i =3D 0; i < p_param->gop_param.custom_gop_size; i++) {
> +				if (p_param->gop_param.pic_param[i].temporal_id > 0) {
> +					dev_err(dev, "std: %d, pic_param[%d].temporal_id: %d\n",
> +						inst->std, i,
> +						p_param->gop_param.pic_param[i].temporal_id);
> +					return -EINVAL;
> +				}
> +			}
> +		}
> +	}
> +
> +	if (inst->std =3D=3D W_HEVC_ENC) {
> +		if (p_param->decoding_refresh_type > DEC_REFRESH_TYPE_IDR) {
> +			dev_err(dev, "decoding_refresh_type: %d\n", p_param->decoding_refresh=
_type);
> +			return -EINVAL;
> +		}
> +	} else {
> +		if (p_param->decoding_refresh_type !=3D DEC_REFRESH_TYPE_NON_IRAP) {
> +			dev_err(dev, "decoding_refresh_type: %d\n", p_param->decoding_refresh=
_type);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int wave6_vpu_enc_check_tile_slice_param(struct vpu_instance *ins=
t,
> +						int width, int height,
> +						struct enc_codec_param *p_param)
> +{
> +	struct vpu_core_device *vpu_dev =3D inst->dev;
> +	struct device *dev =3D vpu_dev->dev;
> +
> +	if (p_param->slice_mode > 2) {
> +		dev_err(dev, "slice_mode: %d\n", p_param->slice_mode);
> +		return -EINVAL;
> +	}
> +	if (p_param->slice_mode =3D=3D 1) {
> +		unsigned int ctu_size =3D (inst->std =3D=3D W_AVC_ENC) ? 16 : 64;
> +		unsigned int mb_num =3D ((width + ctu_size - 1) / ctu_size) *
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((height + ctu_size - 1) / ctu_size);
> +
> +		if (p_param->slice_arg < 1 || p_param->slice_arg > 0x3FFFF) {
> +			dev_err(dev, "slice_arg: %d\n", p_param->slice_arg);
> +			return -EINVAL;
> +		}
> +		if (p_param->slice_arg > mb_num) {
> +			dev_info(dev, "slice_arg: %d, mb_num: %d\n",
> +				 p_param->slice_arg, mb_num);
> +			p_param->slice_arg =3D mb_num;
> +		}
> +		if (inst->std =3D=3D W_AVC_ENC && p_param->slice_arg < 4) {
> +			dev_info(dev, "std: %d, slice_arg: %d\n",
> +				 inst->std, p_param->slice_arg);
> +			p_param->slice_arg =3D 4;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int wave6_vpu_enc_check_rc_param(struct vpu_instance *inst, struc=
t enc_codec_param *p_param)
> +{
> +	struct vpu_core_device *vpu_dev =3D inst->dev;
> +	struct device *dev =3D vpu_dev->dev;
> +
> +	if (p_param->frame_rate < 1 || p_param->frame_rate > 960) {
> +		dev_err(dev, "frame_rate: %d\n", p_param->frame_rate);
> +		return -EINVAL;
> +	}
> +	if (p_param->bitrate > 1500000000) {
> +		dev_err(dev, "bitrate: %d\n", p_param->bitrate);
> +		return -EINVAL;
> +	}
> +	if (p_param->qp > 51) {
> +		dev_err(dev, "qp: %d\n", p_param->qp);
> +		return -EINVAL;
> +	}
> +	if (p_param->min_qp_i > 51 || p_param->min_qp_p > 51 || p_param->min_qp=
_b > 51) {
> +		dev_err(dev, "min_qp_i: %d, min_qp_p: %d, min_qp_b: %d\n",
> +			p_param->min_qp_i, p_param->min_qp_p, p_param->min_qp_b);
> +		return -EINVAL;
> +	}
> +	if (p_param->max_qp_i > 51 || p_param->max_qp_p > 51 || p_param->max_qp=
_b > 51) {
> +		dev_err(dev, "max_qp_i: %d, max_qp_p: %d, max_qp_b: %d\n",
> +			p_param->max_qp_i, p_param->max_qp_p, p_param->max_qp_b);
> +		return -EINVAL;
> +	}
> +	if (p_param->min_qp_i > p_param->max_qp_i) {
> +		dev_err(dev, "min_qp_i: %d, max_qp_i: %d\n", p_param->min_qp_i, p_para=
m->max_qp_i);
> +		return -EINVAL;
> +	}
> +	if (p_param->min_qp_p > p_param->max_qp_p) {
> +		dev_err(dev, "min_qp_p: %d, max_qp_p: %d\n", p_param->min_qp_p, p_para=
m->max_qp_p);
> +		return -EINVAL;
> +	}
> +	if (p_param->min_qp_b > p_param->max_qp_b) {
> +		dev_err(dev, "min_qp_b: %d, max_qp_b: %d\n", p_param->min_qp_b, p_para=
m->max_qp_b);
> +		return -EINVAL;
> +	}
> +	if (p_param->rc_initial_qp < -1 || p_param->rc_initial_qp > 51) {
> +		dev_err(dev, "rc_initial_qp: %d\n", p_param->rc_initial_qp);
> +		return -EINVAL;
> +	}
> +	if (p_param->en_rate_control !=3D 1 && p_param->en_rate_control !=3D 0)=
 {
> +		dev_err(dev, "en_rate_control: %d\n", p_param->en_rate_control);
> +		return -EINVAL;
> +	}
> +	if (p_param->rc_mode > 1) {
> +		dev_err(dev, "rc_mode: %d\n", p_param->rc_mode);
> +		return -EINVAL;
> +	}
> +	if (p_param->en_rate_control) {
> +		if (p_param->bitrate <=3D p_param->frame_rate) {
> +			dev_err(dev, "bitrate: %d, frame_rate: %d\n",
> +				p_param->bitrate, p_param->frame_rate);
> +			return -EINVAL;
> +		}
> +		if (p_param->rc_initial_qp !=3D -1) {
> +			if (p_param->rc_initial_qp < p_param->min_qp_i) {
> +				dev_err(dev, "rc_initial_qp: %d, min_qp_i: %d\n",
> +					p_param->rc_initial_qp, p_param->min_qp_i);
> +				return -EINVAL;
> +			}
> +			if (p_param->rc_initial_qp > p_param->max_qp_i) {
> +				dev_err(dev, "rc_initial_qp: %d, max_qp_i: %d\n",
> +					p_param->rc_initial_qp, p_param->max_qp_i);
> +				return -EINVAL;
> +			}
> +		}
> +	} else {
> +		if (p_param->qp < p_param->min_qp_i) {
> +			dev_err(dev, "qp: %d, min_qp_i: %d\n", p_param->qp, p_param->min_qp_i=
);
> +			return -EINVAL;
> +		}
> +		if (p_param->qp < p_param->min_qp_p) {
> +			dev_err(dev, "qp: %d, min_qp_p: %d\n", p_param->qp, p_param->min_qp_p=
);
> +			return -EINVAL;
> +		}
> +		if (p_param->qp < p_param->min_qp_b) {
> +			dev_err(dev, "qp: %d, min_qp_b: %d\n", p_param->qp, p_param->min_qp_b=
);
> +			return -EINVAL;
> +		}
> +		if (p_param->qp > p_param->max_qp_i) {
> +			dev_err(dev, "qp: %d, max_qp_i: %d\n", p_param->qp, p_param->max_qp_i=
);
> +			return -EINVAL;
> +		}
> +		if (p_param->qp > p_param->max_qp_p) {
> +			dev_err(dev, "qp: %d, max_qp_p: %d\n", p_param->qp, p_param->max_qp_p=
);
> +			return -EINVAL;
> +		}
> +		if (p_param->qp > p_param->max_qp_b) {
> +			dev_err(dev, "qp: %d, max_qp_b: %d\n", p_param->qp, p_param->max_qp_b=
);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int wave6_vpu_enc_check_intra_param(struct vpu_instance *inst,
> +					=C2=A0=C2=A0 int width, int height,
> +					=C2=A0=C2=A0 struct enc_codec_param *p_param)
> +{
> +	struct vpu_core_device *vpu_dev =3D inst->dev;
> +	struct device *dev =3D vpu_dev->dev;
> +	unsigned int ctu_size =3D (inst->std =3D=3D W_AVC_ENC) ? 16 : 64;
> +	unsigned int num_ctu_col =3D (width + ctu_size - 1) / ctu_size;
> +	unsigned int num_ctu_row =3D (height + ctu_size - 1) / ctu_size;
> +
> +	if (p_param->intra_refresh_mode > INTRA_REFRESH_COLUMN) {
> +		dev_err(dev, "intra_refresh_mode: %d\n", p_param->intra_refresh_mode);
> +		return -EINVAL;
> +	}
> +	if (p_param->intra_refresh_mode !=3D INTRA_REFRESH_NONE) {
> +		if (p_param->intra_refresh_arg < 1 || p_param->intra_refresh_arg > 511=
) {
> +			dev_err(dev, "intra_refresh_arg: %d\n", p_param->intra_refresh_arg);
> +			return -EINVAL;
> +		}
> +	}
> +	if (p_param->intra_refresh_mode =3D=3D INTRA_REFRESH_ROW &&
> +	=C2=A0=C2=A0=C2=A0 p_param->intra_refresh_arg > num_ctu_row) {
> +		dev_err(dev, "intra_refresh_mode: %d, intra_refresh_arg: %d\n",
> +			p_param->intra_refresh_mode, p_param->intra_refresh_arg);
> +		return -EINVAL;
> +	}
> +	if (p_param->intra_refresh_mode =3D=3D INTRA_REFRESH_COLUMN &&
> +	=C2=A0=C2=A0=C2=A0 p_param->intra_refresh_arg > num_ctu_col) {
> +		dev_err(dev, "intra_refresh_mode: %d, intra_refresh_arg: %d\n",
> +			p_param->intra_refresh_mode, p_param->intra_refresh_arg);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int wave6_vpu_enc_check_custom_param(struct vpu_instance *inst,
> +					=C2=A0=C2=A0=C2=A0 struct enc_codec_param *p_param)
> +{
> +	struct vpu_core_device *vpu_dev =3D inst->dev;
> +	struct device *dev =3D vpu_dev->dev;
> +	int i;
> +
> +	if (p_param->en_qp_map !=3D 1 && p_param->en_qp_map !=3D 0) {
> +		dev_err(dev, "en_qp_map: %d\n", p_param->en_qp_map);
> +		return -EINVAL;
> +	}
> +	if (p_param->en_mode_map !=3D 1 && p_param->en_mode_map !=3D 0) {
> +		dev_err(dev, "en_mode_map: %d\n", p_param->en_mode_map);
> +		return -EINVAL;
> +	}
> +	if (p_param->en_custom_lambda !=3D 1 && p_param->en_custom_lambda !=3D =
0) {
> +		dev_err(dev, "en_custom_lambda: %d\n", p_param->en_custom_lambda);
> +		return -EINVAL;
> +	}
> +	for (i =3D 0; i < MAX_CUSTOM_LAMBDA_NUM; i++) {
> +		if (p_param->custom_lambda_ssd[i] > 16383) {
> +			dev_err(dev, "custom_lambda_ssd[%d]: %d\n",
> +				i, p_param->custom_lambda_ssd[i]);
> +			return -EINVAL;
> +		}
> +		if (p_param->custom_lambda_sad[i] > 127) {
> +			dev_err(dev, "custom_lambda_sad[%d]: %d\n",
> +				i, p_param->custom_lambda_sad[i]);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int wave6_vpu_enc_check_conf_win_size_param(struct vpu_instance *=
inst,
> +						=C2=A0=C2=A0 int width, int height,
> +						=C2=A0=C2=A0 struct vpu_rect conf_win)
> +{
> +	struct vpu_core_device *vpu_dev =3D inst->dev;
> +	struct device *dev =3D vpu_dev->dev;
> +
> +	if (conf_win.left % 2 || conf_win.top % 2 || conf_win.right % 2 || conf=
_win.bottom % 2) {
> +		dev_err(dev, "conf_win left: %d, top: %d, right: %d, bottom: %d\n",
> +			conf_win.left, conf_win.top, conf_win.right, conf_win.bottom);
> +		return -EINVAL;
> +	}
> +	if (conf_win.left > 8192 || conf_win.top > 8192 ||
> +	=C2=A0=C2=A0=C2=A0 conf_win.right > 8192 || conf_win.bottom > 8192) {
> +		dev_err(dev, "conf_win left: %d, top: %d, right: %d, bottom: %d\n",
> +			conf_win.left, conf_win.top, conf_win.right, conf_win.bottom);
> +		return -EINVAL;
> +	}
> +	if ((conf_win.right + conf_win.left) > width) {
> +		dev_err(dev, "conf_win.left: %d, conf_win.right: %d, width: %d\n",
> +			conf_win.left, conf_win.right, width);
> +		return -EINVAL;
> +	}
> +	if ((conf_win.bottom + conf_win.top) > height) {
> +		dev_err(dev, "conf_win.top: %d, conf_win.bottom: %d, height: %d\n",
> +			conf_win.top, conf_win.bottom, height);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int wave6_vpu_enc_check_temporal_layer_param(struct vpu_instance =
*inst,
> +						=C2=A0=C2=A0=C2=A0 struct enc_codec_param *p_param)
> +{
> +	struct vpu_core_device *vpu_dev =3D inst->dev;
> +	struct device *dev =3D vpu_dev->dev;
> +	int i;
> +
> +	if (p_param->temp_layer_cnt < 1 || p_param->temp_layer_cnt > 4) {
> +		dev_err(dev, "temp_layer_cnt: %d\n", p_param->temp_layer_cnt);
> +		return -EINVAL;
> +	}
> +	if (p_param->temp_layer_cnt > 1) {
> +		if (p_param->gop_preset_idx =3D=3D PRESET_IDX_CUSTOM_GOP ||
> +		=C2=A0=C2=A0=C2=A0 p_param->gop_preset_idx =3D=3D PRESET_IDX_ALL_I) {
> +			dev_err(dev, "temp_layer_cnt: %d, gop_preset_idx: %d\n",
> +				p_param->temp_layer_cnt, p_param->gop_preset_idx);
> +			return -EINVAL;
> +		}
> +	}
> +	for (i =3D 0; i < MAX_NUM_CHANGEABLE_TEMPORAL_LAYER; i++) {
> +		if (p_param->temp_layer[i].change_qp !=3D 1 &&
> +		=C2=A0=C2=A0=C2=A0 p_param->temp_layer[i].change_qp !=3D 0) {
> +			dev_err(dev, "temp_layer[%d].change_qp: %d\n",
> +				i, p_param->temp_layer[i].change_qp);
> +			return -EINVAL;
> +		}
> +		if (p_param->temp_layer[i].qp_b > 51) {
> +			dev_err(dev, "temp_layer[%d].qp_b: %d\n", i, p_param->temp_layer[i].q=
p_b);
> +			return -EINVAL;
> +		}
> +		if (p_param->temp_layer[i].qp_p > 51) {
> +			dev_err(dev, "temp_layer[%d].qp_p: %d\n", i, p_param->temp_layer[i].q=
p_p);
> +			return -EINVAL;
> +		}
> +		if (p_param->temp_layer[i].qp_i > 51) {
> +			dev_err(dev, "temp_layer[%d].qp_i: %d\n", i, p_param->temp_layer[i].q=
p_i);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +int wave6_vpu_enc_check_open_param(struct vpu_instance *inst, struct enc=
_open_param *pop)
> +{
> +	struct vpu_core_device *vpu_dev =3D inst->dev;
> +	struct device *dev =3D vpu_dev->dev;
> +	struct vpu_attr *attr =3D &inst->dev->attr;
> +	struct enc_codec_param *p_param =3D &pop->codec_param;
> +
> +	if (inst->std !=3D W_HEVC_ENC && inst->std !=3D W_AVC_ENC) {
> +		dev_err(dev, "std %d\n", inst->std);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (pop->pic_width % W6_ENC_PIC_SIZE_STEP || pop->pic_height % W6_ENC_P=
IC_SIZE_STEP) {
> +		dev_err(dev, "pic_width: %d | pic_height: %d\n", pop->pic_width, pop->=
pic_height);
> +		return -EINVAL;
> +	}
> +	if (pop->pic_width < W6_MIN_ENC_PIC_WIDTH || pop->pic_width > W6_MAX_EN=
C_PIC_WIDTH) {
> +		dev_err(dev, "pic_width: %d\n", pop->pic_width);
> +		return -EINVAL;
> +	}
> +	if (pop->pic_height < W6_MIN_ENC_PIC_HEIGHT || pop->pic_height > W6_MAX=
_ENC_PIC_HEIGHT) {
> +		dev_err(dev, "pic_height: %d\n", pop->pic_height);
> +		return -EINVAL;
> +	}
> +
> +	if (pop->packed_format && inst->cbcr_interleave =3D=3D 1) {
> +		dev_err(dev, "packed_format: %d, cbcr_interleave: %d\n",
> +			pop->packed_format, inst->cbcr_interleave);
> +		return -EINVAL;
> +	}
> +	if (pop->packed_format && inst->nv21 =3D=3D 1) {
> +		dev_err(dev, "packed_format: %d, nv21: %d\n", pop->packed_format, inst=
->nv21);
> +		return -EINVAL;
> +	}
> +	if (pop->src_format =3D=3D FORMAT_RGB_32BIT_PACKED ||
> +	=C2=A0=C2=A0=C2=A0 pop->src_format =3D=3D FORMAT_YUV444_32BIT_PACKED ||
> +	=C2=A0=C2=A0=C2=A0 pop->src_format =3D=3D FORMAT_RGB_P10_32BIT_PACKED |=
|
> +	=C2=A0=C2=A0=C2=A0 pop->src_format =3D=3D FORMAT_YUV444_P10_32BIT_PACKE=
D) {
> +		if (!inst->cbcr_interleave) {
> +			dev_err(dev, "src_format: %d, cbcr_interleave: %d\n",
> +				pop->src_format, inst->cbcr_interleave);
> +			return -EINVAL;
> +		}
> +		if (inst->nv21 =3D=3D 1) {
> +			dev_err(dev, "src_format: %d, nv21: %d\n", pop->src_format, inst->nv2=
1);
> +			return -EINVAL;
> +		}
> +	}
> +	if (pop->src_format =3D=3D FORMAT_RGB_24BIT_PACKED ||
> +	=C2=A0=C2=A0=C2=A0 pop->src_format =3D=3D FORMAT_YUV444_24BIT_PACKED) {
> +		if (!inst->cbcr_interleave || inst->nv21 =3D=3D 1) {
> +			dev_err(dev, "src_format: %d, cbcr_interleave: %d, nv21: %d\n",
> +				pop->src_format, inst->cbcr_interleave, inst->nv21);
> +			return -EINVAL;
> +		}
> +	}
> +	if (pop->src_format =3D=3D FORMAT_YUV444_24BIT) {
> +		if (!inst->cbcr_interleave) {
> +			dev_err(dev, "src_format: %d, cbcr_interleave: %d\n",
> +				pop->src_format, inst->cbcr_interleave);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	if (wave6_vpu_enc_check_gop_param(inst, p_param)) {
> +		dev_err(dev, "failed wave6_vpu_enc_check_gop_param()\n");
> +		return -EINVAL;
> +	}
> +	if (wave6_vpu_enc_check_tile_slice_param(inst, pop->pic_width, pop->pic=
_height, p_param)) {
> +		dev_err(dev, "failed wave6_vpu_enc_check_tile_slice_param()\n");
> +		return -EINVAL;
> +	}
> +	if (wave6_vpu_enc_check_rc_param(inst, p_param)) {
> +		dev_err(dev, "failed wave6_vpu_enc_check_rc_param()\n");
> +		return -EINVAL;
> +	}
> +	if (wave6_vpu_enc_check_intra_param(inst, pop->pic_width, pop->pic_heig=
ht, p_param)) {
> +		dev_err(dev, "failed wave6_vpu_enc_check_intra_param()\n");
> +		return -EINVAL;
> +	}
> +	if (wave6_vpu_enc_check_custom_param(inst, p_param)) {
> +		dev_err(dev, "failed wave6_vpu_enc_check_custom_param()\n");
> +		return -EINVAL;
> +	}
> +	if (wave6_vpu_enc_check_conf_win_size_param(inst, pop->pic_width, pop->=
pic_height,
> +						=C2=A0=C2=A0=C2=A0 p_param->conf_win)) {
> +		dev_err(dev, "failed wave6_vpu_enc_check_conf_win_size_param()\n");
> +		return -EINVAL;
> +	}
> +	if (wave6_vpu_enc_check_temporal_layer_param(inst, p_param)) {
> +		dev_err(dev, "failed wave6_vpu_enc_check_temporal_layer_param()\n");
> +		return -EINVAL;
> +	}
> +
> +	if (p_param->internal_bit_depth !=3D 8 && p_param->internal_bit_depth !=
=3D 10) {
> +		dev_err(dev, "internal_bit_depth: %d\n", p_param->internal_bit_depth);
> +		return -EINVAL;
> +	}
> +	if (p_param->intra_period > 2047) {
> +		dev_err(dev, "intra_period: %d\n", p_param->intra_period);
> +		return -EINVAL;
> +	}
> +	if (p_param->intra_period =3D=3D 1 && p_param->gop_preset_idx =3D=3D PR=
ESET_IDX_ALL_I) {
> +		dev_err(dev, "intra_period: %d, gop_preset_idx: %d\n",
> +			p_param->intra_period, p_param->gop_preset_idx);
> +		return -EINVAL;
> +	}
> +	if (p_param->en_long_term !=3D 1 && p_param->en_long_term !=3D 0) {
> +		dev_err(dev, "en_long_term: %d\n", p_param->en_long_term);
> +		return -EINVAL;
> +	}
> +	if (p_param->cpb_size < 10 || p_param->cpb_size > 100000) {
> +		dev_err(dev, "cpb_size: %d\n", p_param->cpb_size);
> +		return -EINVAL;
> +	}
> +	if (p_param->en_cu_level_rate_control !=3D 1 && p_param->en_cu_level_ra=
te_control !=3D 0) {
> +		dev_err(dev, "en_cu_level_rate_control: %d\n", p_param->en_cu_level_ra=
te_control);
> +		return -EINVAL;
> +	}
> +	if (p_param->en_vbv_overflow_drop_frame !=3D 1 && p_param->en_vbv_overf=
low_drop_frame !=3D 0) {
> +		dev_err(dev, "en_vbv_overflow_drop_frame: %d\n",
> +			p_param->en_vbv_overflow_drop_frame);
> +		return -EINVAL;
> +	}
> +	if (p_param->en_hvs_qp !=3D 1 && p_param->en_hvs_qp !=3D 0) {
> +		dev_err(dev, "en_hvs_qp: %d\n", p_param->en_hvs_qp);
> +		return -EINVAL;
> +	}
> +	if (p_param->en_hvs_qp) {
> +		if (p_param->hvs_qp_scale_div2 < 1 || p_param->hvs_qp_scale_div2 > 4) =
{
> +			dev_err(dev, "hvs_qp_scale_div2: %d\n", p_param->hvs_qp_scale_div2);
> +			return -EINVAL;
> +		}
> +	}
> +	if (p_param->max_delta_qp > 12) {
> +		dev_err(dev, "max_delta_qp: %d\n", p_param->max_delta_qp);
> +		return -EINVAL;
> +	}
> +	if (p_param->rc_update_speed > 255) {
> +		dev_err(dev, "rc_update_speed: %d\n", p_param->rc_update_speed);
> +		return -EINVAL;
> +	}
> +	if (p_param->max_bitrate > 1500000000) {
> +		dev_err(dev, "max_bitrate: %d\n", p_param->max_bitrate);
> +		return -EINVAL;
> +	}
> +	if (p_param->rc_initial_level > 15) {
> +		dev_err(dev, "rc_initial_level: %d\n", p_param->rc_initial_level);
> +		return -EINVAL;
> +	}
> +	if (p_param->pic_rc_max_dqp > 51) {
> +		dev_err(dev, "pic_rc_max_dqp: %d\n", p_param->pic_rc_max_dqp);
> +		return -EINVAL;
> +	}
> +	if (p_param->en_bg_detect !=3D 1 && p_param->en_bg_detect !=3D 0) {
> +		dev_err(dev, "en_bg_detect: %d\n", p_param->en_bg_detect);
> +		return -EINVAL;
> +	}
> +	if (p_param->bg_th_diff > 255) {
> +		dev_err(dev, "bg_th_diff: %d\n", p_param->bg_th_diff);
> +		return -EINVAL;
> +	}
> +	if (p_param->bg_th_mean_diff > 255) {
> +		dev_err(dev, "bg_th_mean_diff: %d\n", p_param->bg_th_mean_diff);
> +		return -EINVAL;
> +	}
> +	if (p_param->bg_delta_qp < -16 || p_param->bg_delta_qp > 15) {
> +		dev_err(dev, "bg_delta_qp: %d\n", p_param->bg_delta_qp);
> +		return -EINVAL;
> +	}
> +	if (p_param->en_me_center !=3D 1 && p_param->en_me_center !=3D 0) {
> +		dev_err(dev, "en_me_center: %d\n", p_param->en_me_center);
> +		return -EINVAL;
> +	}
> +	if (p_param->en_dbk !=3D 1 && p_param->en_dbk !=3D 0) {
> +		dev_err(dev, "en_dbk: %d\n", p_param->en_dbk);
> +		return -EINVAL;
> +	}
> +	if (p_param->en_scaling_list !=3D 1 && p_param->en_scaling_list !=3D 0)=
 {
> +		dev_err(dev, "en_scaling_list: %d\n", p_param->en_scaling_list);
> +		return -EINVAL;
> +	}
> +	if (p_param->en_adaptive_round !=3D 1 && p_param->en_adaptive_round !=
=3D 0) {
> +		dev_err(dev, "en_adaptive_round: %d\n", p_param->en_adaptive_round);
> +		return -EINVAL;
> +	}
> +	if (p_param->q_round_intra > 255) {
> +		dev_err(dev, "q_round_intra: %d\n", p_param->q_round_intra);
> +		return -EINVAL;
> +	}
> +	if (p_param->q_round_inter > 255) {
> +		dev_err(dev, "q_round_inter: %d\n", p_param->q_round_inter);
> +		return -EINVAL;
> +	}
> +	if (p_param->dis_coef_clear !=3D 1 && p_param->dis_coef_clear !=3D 0) {
> +		dev_err(dev, "dis_coef_clear: %d\n", p_param->dis_coef_clear);
> +		return -EINVAL;
> +	}
> +	if (p_param->lambda_dqp_intra < -32 || p_param->lambda_dqp_intra > 31) =
{
> +		dev_err(dev, "lambda_dqp_intra: %d\n", p_param->lambda_dqp_intra);
> +		return -EINVAL;
> +	}
> +	if (p_param->lambda_dqp_inter < -32 || p_param->lambda_dqp_inter > 31) =
{
> +		dev_err(dev, "lambda_dqp_inter: %d\n", p_param->lambda_dqp_inter);
> +		return -EINVAL;
> +	}
> +	if (p_param->en_q_round_offset !=3D 1 && p_param->en_q_round_offset !=
=3D 0) {
> +		dev_err(dev, "en_q_round_offset: %d\n", p_param->en_q_round_offset);
> +		return -EINVAL;
> +	}
> +	if (p_param->forced_idr_header > 2) {
> +		dev_err(dev, "forced_idr_header: %d\n", p_param->forced_idr_header);
> +		return -EINVAL;
> +	}
> +	if (p_param->num_units_in_tick > INT_MAX) {
> +		dev_err(dev, "num_units_in_tick: %d\n", p_param->num_units_in_tick);
> +		return -EINVAL;
> +	}
> +	if (p_param->time_scale > INT_MAX) {
> +		dev_err(dev, "time_scale: %d\n", p_param->time_scale);
> +		return -EINVAL;
> +	}
> +	if (p_param->max_intra_pic_bit > 1500000000) {
> +		dev_err(dev, "max_intra_pic_bit: %d\n", p_param->max_intra_pic_bit);
> +		return -EINVAL;
> +	}
> +	if (p_param->max_inter_pic_bit > 1500000000) {
> +		dev_err(dev, "max_inter_pic_bit: %d\n", p_param->max_inter_pic_bit);
> +		return -EINVAL;
> +	}
> +
> +	if (p_param->color.color_range > 1) {
> +		dev_err(dev, "color_range: %d\n", p_param->color.color_range);
> +		return -EINVAL;
> +	}
> +	if (p_param->color.matrix_coefficients > 255) {
> +		dev_err(dev, "matrix_coefficients: %d\n", p_param->color.matrix_coeffi=
cients);
> +		return -EINVAL;
> +	}
> +	if (p_param->color.transfer_characteristics > 255) {
> +		dev_err(dev, "transfer_characteristics: %d\n",
> +			p_param->color.transfer_characteristics);
> +		return -EINVAL;
> +	}
> +	if (p_param->color.color_primaries > 255) {
> +		dev_err(dev, "color_primaries: %d\n", p_param->color.color_primaries);
> +		return -EINVAL;
> +	}
> +	if (inst->std =3D=3D W_HEVC_ENC) {
> +		if (p_param->internal_bit_depth =3D=3D 10 && !attr->support_hevc10bit_=
enc) {
> +			dev_err(dev, "internal_bit_depth: %d, support_hevc10bit_enc: %d\n",
> +				p_param->internal_bit_depth, attr->support_hevc10bit_enc);
> +			return -EOPNOTSUPP;
> +		}
> +		if (p_param->idr_period !=3D 0) {
> +			dev_err(dev, "idr_period: %d\n", p_param->idr_period);
> +			return -EINVAL;
> +		}
> +		if (p_param->en_strong_intra_smoothing !=3D 1 &&
> +		=C2=A0=C2=A0=C2=A0 p_param->en_strong_intra_smoothing !=3D 0) {
> +			dev_err(dev, "en_strong_intra_smoothing: %d\n",
> +				p_param->en_strong_intra_smoothing);
> +			return -EINVAL;
> +		}
> +		if (p_param->en_constrained_intra_pred !=3D 1 &&
> +		=C2=A0=C2=A0=C2=A0 p_param->en_constrained_intra_pred !=3D 0) {
> +			dev_err(dev, "en_constrained_intra_pred: %d\n",
> +				p_param->en_constrained_intra_pred);
> +			return -EINVAL;
> +		}
> +		if (p_param->en_intra_trans_skip !=3D 1 && p_param->en_intra_trans_ski=
p !=3D 0) {
> +			dev_err(dev, "en_intra_trans_skip: %d\n", p_param->en_intra_trans_ski=
p);
> +			return -EINVAL;
> +		}
> +		if (p_param->en_temporal_mvp !=3D 1 && p_param->en_temporal_mvp !=3D 0=
) {
> +			dev_err(dev, "en_temporal_mvp: %d\n", p_param->en_temporal_mvp);
> +			return -EINVAL;
> +		}
> +		if (p_param->en_cabac !=3D 0) {
> +			dev_err(dev, "en_cabac: %d\n", p_param->en_cabac);
> +			return -EINVAL;
> +		}
> +		if (p_param->en_transform8x8 !=3D 0) {
> +			dev_err(dev, "en_transform8x8: %d\n", p_param->en_transform8x8);
> +			return -EINVAL;
> +		}
> +		if (p_param->en_lf_cross_slice_boundary !=3D 1 &&
> +		=C2=A0=C2=A0=C2=A0 p_param->en_lf_cross_slice_boundary !=3D 0) {
> +			dev_err(dev, "en_lf_cross_slice_boundary: %d\n",
> +				p_param->en_lf_cross_slice_boundary);
> +			return -EINVAL;
> +		}
> +		if (p_param->beta_offset_div2 < -6 || p_param->beta_offset_div2 > 6) {
> +			dev_err(dev, "beta_offset_div2: %d\n", p_param->beta_offset_div2);
> +			return -EINVAL;
> +		}
> +		if (p_param->tc_offset_div2 < -6 || p_param->tc_offset_div2 > 6) {
> +			dev_err(dev, "tc_offset_div2: %d\n", p_param->tc_offset_div2);
> +			return -EINVAL;
> +		}
> +		if (p_param->en_sao !=3D 1 && p_param->en_sao !=3D 0) {
> +			dev_err(dev, "en_sao: %d\n", p_param->en_sao);
> +			return -EINVAL;
> +		}
> +		if (p_param->cb_qp_offset < -12 || p_param->cb_qp_offset > 12) {
> +			dev_err(dev, "cb_qp_offset: %d\n", p_param->cb_qp_offset);
> +			return -EINVAL;
> +		}
> +		if (p_param->cr_qp_offset < -12 || p_param->cr_qp_offset > 12) {
> +			dev_err(dev, "cr_qp_offset: %d\n", p_param->cr_qp_offset);
> +			return -EINVAL;
> +		}
> +		if (p_param->en_still_picture !=3D 1 && p_param->en_still_picture !=3D=
 0) {
> +			dev_err(dev, "en_still_picture: %d\n", p_param->en_still_picture);
> +			return -EINVAL;
> +		}
> +		if (p_param->en_auto_level_adjusting !=3D 1 &&
> +		=C2=A0=C2=A0=C2=A0 p_param->en_auto_level_adjusting !=3D 0) {
> +			dev_err(dev, "en_auto_level_adjusting: %d\n",
> +				p_param->en_auto_level_adjusting);
> +			return -EINVAL;
> +		}
> +		if (p_param->tier > 1) {
> +			dev_err(dev, "tier: %d\n", p_param->tier);
> +			return -EINVAL;
> +		}
> +		if (p_param->profile > HEVC_PROFILE_STILLPICTURE) {
> +			dev_err(dev, "profile: %d\n", p_param->profile);
> +			return -EINVAL;
> +		}
> +		if (p_param->internal_bit_depth =3D=3D 10 && p_param->profile =3D=3D H=
EVC_PROFILE_MAIN) {
> +			dev_err(dev, "internal_bit_depth: %d, profile: %d\n",
> +				p_param->internal_bit_depth, p_param->profile);
> +			return -EINVAL;
> +		}
> +		if (p_param->num_ticks_poc_diff_one < 1 ||
> +		=C2=A0=C2=A0=C2=A0 p_param->num_ticks_poc_diff_one > 65535) {
> +			dev_err(dev, "num_ticks_poc_diff_one: %d\n",
> +				p_param->num_ticks_poc_diff_one);
> +			return -EINVAL;
> +		}
> +		if (p_param->color.chroma_sample_position !=3D 0) {
> +			dev_err(dev, "chroma_sample_position: %d\n",
> +				p_param->color.chroma_sample_position);
> +			return -EINVAL;
> +		}
> +		if (p_param->intra_4x4 > 3 || p_param->intra_4x4 =3D=3D 1) {
> +			dev_err(dev, "intra_4x4: %d\n", p_param->intra_4x4);
> +			return -EINVAL;
> +		}
> +	} else if (inst->std =3D=3D W_AVC_ENC) {
> +		if (p_param->internal_bit_depth =3D=3D 10 && !attr->support_avc10bit_e=
nc) {
> +			dev_err(dev, "internal_bit_depth: %d, support_avc10bit_enc: %d\n",
> +				p_param->internal_bit_depth, attr->support_avc10bit_enc);
> +			return -EOPNOTSUPP;
> +		}
> +		if (p_param->idr_period > 2047) {
> +			dev_err(dev, "idr_period: %d\n", p_param->idr_period);
> +			return -EINVAL;
> +		}
> +		if (p_param->idr_period =3D=3D 1 && p_param->gop_preset_idx =3D=3D PRE=
SET_IDX_ALL_I) {
> +			dev_err(dev, "idr_period: %d, gop_preset_idx: %d\n",
> +				p_param->idr_period, p_param->gop_preset_idx);
> +			return -EINVAL;
> +		}
> +		if (p_param->en_strong_intra_smoothing !=3D 0) {
> +			dev_err(dev, "en_strong_intra_smoothing: %d\n",
> +				p_param->en_strong_intra_smoothing);
> +			return -EINVAL;
> +		}
> +		if (p_param->en_constrained_intra_pred !=3D 1 &&
> +		=C2=A0=C2=A0=C2=A0 p_param->en_constrained_intra_pred !=3D 0) {
> +			dev_err(dev, "en_constrained_intra_pred: %d\n",
> +				p_param->en_constrained_intra_pred);
> +			return -EINVAL;
> +		}
> +		if (p_param->en_intra_trans_skip !=3D 0) {
> +			dev_err(dev, "en_intra_trans_skip: %d\n", p_param->en_intra_trans_ski=
p);
> +			return -EINVAL;
> +		}
> +		if (p_param->en_temporal_mvp !=3D 0) {
> +			dev_err(dev, "en_temporal_mvp: %d\n", p_param->en_temporal_mvp);
> +			return -EINVAL;
> +		}
> +		if (p_param->en_cabac !=3D 1 && p_param->en_cabac !=3D 0) {
> +			dev_err(dev, "en_cabac: %d\n", p_param->en_cabac);
> +			return -EINVAL;
> +		}
> +		if (p_param->en_transform8x8 !=3D 1 && p_param->en_transform8x8 !=3D 0=
) {
> +			dev_err(dev, "en_transform8x8: %d\n", p_param->en_transform8x8);
> +			return -EINVAL;
> +		}
> +		if (p_param->en_lf_cross_slice_boundary !=3D 1 &&
> +		=C2=A0=C2=A0=C2=A0 p_param->en_lf_cross_slice_boundary !=3D 0) {
> +			dev_err(dev, "en_lf_cross_slice_boundary: %d\n",
> +				p_param->en_lf_cross_slice_boundary);
> +			return -EINVAL;
> +		}
> +		if (p_param->beta_offset_div2 < -6 || p_param->beta_offset_div2 > 6) {
> +			dev_err(dev, "beta_offset_div2: %d\n", p_param->beta_offset_div2);
> +			return -EINVAL;
> +		}
> +		if (p_param->tc_offset_div2 < -6 || p_param->tc_offset_div2 > 6) {
> +			dev_err(dev, "tc_offset_div2: %d\n", p_param->tc_offset_div2);
> +			return -EINVAL;
> +		}
> +		if (p_param->en_sao !=3D 0) {
> +			dev_err(dev, "en_sao: %d\n", p_param->en_sao);
> +			return -EINVAL;
> +		}
> +		if (p_param->cb_qp_offset < -12 || p_param->cb_qp_offset > 12) {
> +			dev_err(dev, "cb_qp_offset: %d\n", p_param->cb_qp_offset);
> +			return -EINVAL;
> +		}
> +		if (p_param->cr_qp_offset < -12 || p_param->cr_qp_offset > 12) {
> +			dev_err(dev, "cr_qp_offset: %d\n", p_param->cr_qp_offset);
> +			return -EINVAL;
> +		}
> +		if (p_param->en_still_picture !=3D 0) {
> +			dev_err(dev, "en_still_picture: %d\n", p_param->en_still_picture);
> +			return -EINVAL;
> +		}
> +		if (p_param->en_auto_level_adjusting !=3D 1 &&
> +		=C2=A0=C2=A0=C2=A0 p_param->en_auto_level_adjusting !=3D 0) {
> +			dev_err(dev, "en_auto_level_adjusting: %d\n",
> +				p_param->en_auto_level_adjusting);
> +			return -EINVAL;
> +		}
> +		if (p_param->tier !=3D 0) {
> +			dev_err(dev, "tier: %d\n", p_param->tier);
> +			return -EINVAL;
> +		}
> +		if (p_param->profile > H264_PROFILE_HIGH10) {
> +			dev_err(dev, "profile: %d\n", p_param->profile);
> +			return -EINVAL;
> +		}
> +		if (p_param->profile) {
> +			if (p_param->internal_bit_depth =3D=3D 10 &&
> +			=C2=A0=C2=A0=C2=A0 p_param->profile !=3D H264_PROFILE_HIGH10) {
> +				dev_err(dev, "internal_bit_depth: %d, profile: %d\n",
> +					p_param->internal_bit_depth, p_param->profile);
> +				return -EINVAL;
> +			}
> +		}
> +		if (p_param->num_ticks_poc_diff_one !=3D 0) {
> +			dev_err(dev, "num_ticks_poc_diff_one: %d\n",
> +				p_param->num_ticks_poc_diff_one);
> +			return -EINVAL;
> +		}
> +		if (p_param->color.chroma_sample_position !=3D 0) {
> +			dev_err(dev, "chroma_sample_position: %d\n",
> +				p_param->color.chroma_sample_position);
> +			return -EINVAL;
> +		}
> +		if (p_param->intra_4x4 !=3D 0) {
> +			dev_err(dev, "intra_4x4: %d\n", p_param->intra_4x4);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-hw.h b/driver=
s/media/platform/chips-media/wave6/wave6-hw.h
> new file mode 100644
> index 000000000000..c27a364e8163
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-hw.h
> @@ -0,0 +1,69 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
> +/*
> + * Wave6 series multi-standard codec IP - wave6 backend interface
> + *
> + * Copyright (C) 2025 CHIPS&MEDIA INC
> + */
> +
> +#ifndef __WAVE6_HW_H__
> +#define __WAVE6_HW_H__
> +
> +#define STD_AVC		0
> +#define STD_HEVC	12
> +
> +enum product_id {
> +	PRODUCT_ID_617,
> +	PRODUCT_ID_627,
> +	PRODUCT_ID_637,
> +	PRODUCT_ID_NONE,
> +};
> +
> +#define BSOPTION_ENABLE_EXPLICIT_END	BIT(0)
> +#define NON_VCL_PARAM_ENCODE_VUI	BIT(1)
> +
> +#define DECODE_ALL_TEMPORAL_LAYERS	0
> +#define DECODE_ALL_SPATIAL_LAYERS	0
> +
> +#define REGISTER_DISPLAY_BUFFER	1
> +#define DEFAULT_PIXEL_ORDER	1
> +
> +#define WTL_RIGHT_JUSTIFIED	0
> +#define WTL_LEFT_JUSTIFIED	1
> +#define WTL_PIXEL_8BIT		0
> +#define WTL_PIXEL_16BIT		1
> +#define WTL_PIXEL_32BIT		2
> +
> +#define MAX_CSC_COEFF_NUM	4
> +
> +bool wave6_vpu_is_init(struct vpu_core_device *vpu_dev);
> +void wave6_vpu_check_state(struct vpu_core_device *vpu_dev);
> +int wave6_vpu_get_version(struct vpu_core_device *vpu_dev, u32 *version_=
info, uint32_t *revision);
> +void wave6_vpu_enable_interrupt(struct vpu_core_device *vpu_dev);
> +int wave6_vpu_build_up_dec_param(struct vpu_instance *inst, struct dec_o=
pen_param *param);
> +
> +void wave6_vpu_dec_set_bitstream_end(struct vpu_instance *inst, bool eos=
);
> +int wave6_vpu_dec_register_frame_buffer(struct vpu_instance *inst,
> +					struct frame_buffer *fb_arr, enum tiled_map_type map_type,
> +					uint32_t count);
> +int wave6_vpu_dec_register_display_buffer(struct vpu_instance *inst, str=
uct frame_buffer fb);
> +int wave6_vpu_dec_init_seq(struct vpu_instance *inst);
> +int wave6_vpu_dec_get_seq_info(struct vpu_instance *inst, struct dec_ini=
tial_info *info);
> +int wave6_vpu_decode(struct vpu_instance *inst, struct dec_param *option=
, u32 *fail_res);
> +int wave6_vpu_dec_get_result(struct vpu_instance *inst, struct dec_outpu=
t_info *result);
> +int wave6_vpu_dec_fini_seq(struct vpu_instance *inst, u32 *fail_res);
> +dma_addr_t wave6_vpu_dec_get_rd_ptr(struct vpu_instance *inst);
> +int wave6_vpu_dec_flush(struct vpu_instance *inst);
> +
> +int wave6_vpu_build_up_enc_param(struct device *dev, struct vpu_instance=
 *inst,
> +				 struct enc_open_param *param);
> +int wave6_vpu_enc_init_seq(struct vpu_instance *inst);
> +int wave6_vpu_enc_change_seq(struct vpu_instance *inst, bool *changed);
> +int wave6_vpu_enc_get_seq_info(struct vpu_instance *inst, struct enc_ini=
tial_info *info);
> +int wave6_vpu_enc_register_frame_buffer(struct vpu_instance *inst,
> +					struct frame_buffer *fb_arr);
> +int wave6_vpu_encode(struct vpu_instance *inst, struct enc_param *option=
, u32 *fail_res);
> +int wave6_vpu_enc_get_result(struct vpu_instance *inst, struct enc_outpu=
t_info *result);
> +int wave6_vpu_enc_fini_seq(struct vpu_instance *inst, u32 *fail_res);
> +int wave6_vpu_enc_check_open_param(struct vpu_instance *inst, struct enc=
_open_param *pop);
> +
> +#endif /* __WAVE6_HW_H__ */
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vdi.c b/drive=
rs/media/platform/chips-media/wave6/wave6-
> vdi.c
> new file mode 100644
> index 000000000000..aea82c9e087a
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vdi.c
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> +/*
> + * Wave6 series multi-standard codec IP - low level access interface
> + *
> + * Copyright (C) 2025 CHIPS&MEDIA INC
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/bug.h>
> +#include "wave6-vdi.h"
> +#include "wave6-vpu-core.h"
> +#include "wave6-regdefine.h"
> +#include "wave6-trace.h"
> +
> +void wave6_vdi_writel(struct vpu_core_device *vpu_dev, unsigned int addr=
, unsigned int data)
> +{
> +	writel(data, vpu_dev->reg_base + addr);
> +	trace_writel(vpu_dev->dev, addr, data);
> +}
> +
> +unsigned int wave6_vdi_readl(struct vpu_core_device *vpu_dev, u32 addr)
> +{
> +	unsigned int data;
> +
> +	data =3D readl(vpu_dev->reg_base + addr);
> +	trace_readl(vpu_dev->dev, addr, data);
> +
> +	return data;
> +}
> +
> +unsigned int wave6_vdi_convert_endian(unsigned int endian)
> +{
> +	switch (endian) {
> +	case VDI_LITTLE_ENDIAN:
> +		endian =3D 0x00;
> +		break;
> +	case VDI_BIG_ENDIAN:
> +		endian =3D 0x0f;
> +		break;
> +	case VDI_32BIT_LITTLE_ENDIAN:
> +		endian =3D 0x04;
> +		break;
> +	case VDI_32BIT_BIG_ENDIAN:
> +		endian =3D 0x03;
> +		break;
> +	}
> +
> +	return (endian & 0x0f);
> +}
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vdi.h b/drive=
rs/media/platform/chips-media/wave6/wave6-
> vdi.h
> new file mode 100644
> index 000000000000..549472f1bc8b
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vdi.h
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
> +/*
> + * Wave6 series multi-standard codec IP - low level access interface
> + *
> + * Copyright (C) 2025 CHIPS&MEDIA INC
> + */
> +
> +#ifndef __WAVE6_VDI_H__
> +#define __WAVE6_VDI_H__
> +
> +#include <linux/string.h>
> +#include <linux/slab.h>
> +#include <linux/device.h>
> +#include "wave6-vpuconfig.h"
> +
> +#define vpu_write_reg(VPU_DEV, ADDR, DATA) wave6_vdi_writel(VPU_DEV, ADD=
R, DATA)
> +#define vpu_read_reg(VPU_DEV, ADDR) wave6_vdi_readl(VPU_DEV, ADDR)
> +
> +enum endian_mode {
> +	VDI_LITTLE_ENDIAN =3D 0,
> +	VDI_BIG_ENDIAN,
> +	VDI_32BIT_LITTLE_ENDIAN,
> +	VDI_32BIT_BIG_ENDIAN,
> +	VDI_128BIT_LITTLE_ENDIAN =3D 16,
> +	VDI_128BIT_LE_BYTE_SWAP,
> +	VDI_128BIT_LE_WORD_SWAP,
> +	VDI_128BIT_LE_WORD_BYTE_SWAP,
> +	VDI_128BIT_LE_DWORD_SWAP,
> +	VDI_128BIT_LE_DWORD_BYTE_SWAP,
> +	VDI_128BIT_LE_DWORD_WORD_SWAP,
> +	VDI_128BIT_LE_DWORD_WORD_BYTE_SWAP,
> +	VDI_128BIT_BE_DWORD_WORD_BYTE_SWAP,
> +	VDI_128BIT_BE_DWORD_WORD_SWAP,
> +	VDI_128BIT_BE_DWORD_BYTE_SWAP,
> +	VDI_128BIT_BE_DWORD_SWAP,
> +	VDI_128BIT_BE_WORD_BYTE_SWAP,
> +	VDI_128BIT_BE_WORD_SWAP,
> +	VDI_128BIT_BE_BYTE_SWAP,
> +	VDI_128BIT_BIG_ENDIAN =3D 31,
> +	VDI_ENDIAN_MAX
> +};
> +
> +#define VDI_128BIT_ENDIAN_MASK 0xf
> +
> +#endif /* __WAVE6_VDI_H__ */
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuapi.c b/dr=
ivers/media/platform/chips-media/wave6/wave6-
> vpuapi.c
> new file mode 100644
> index 000000000000..2006a474aa0e
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpuapi.c
> @@ -0,0 +1,998 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> +/*
> + * Wave6 series multi-standard codec IP - wave6 helper interface
> + *
> + * Copyright (C) 2025 CHIPS&MEDIA INC
> + */
> +
> +#include <linux/bug.h>
> +#include "wave6-vpuapi.h"
> +#include "wave6-regdefine.h"
> +#include "wave6-hw.h"
> +#include "wave6-vpu-dbg.h"
> +#include "wave6-trace.h"
> +
> +static int wave6_check_dec_open_param(struct vpu_instance *inst, struct =
dec_open_param *param)
> +{
> +	struct vpu_attr *attr =3D &inst->dev->attr;
> +
> +	if (param->bs_mode !=3D attr->support_bitstream_mode)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +int wave6_vpu_dec_open(struct vpu_instance *inst, struct dec_open_param =
*pop)
> +{
> +	struct dec_info *p_dec_info;
> +	int ret;
> +	struct vpu_core_device *vpu_dev =3D inst->dev;
> +
> +	ret =3D wave6_check_dec_open_param(inst, pop);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
> +	if (ret)
> +		return ret;
> +
> +	if (!wave6_vpu_is_init(vpu_dev)) {
> +		mutex_unlock(&vpu_dev->hw_lock);
> +		return -ENODEV;
> +	}
> +
> +	inst->codec_info =3D kzalloc(sizeof(*inst->codec_info), GFP_KERNEL);
> +	if (!inst->codec_info) {
> +		mutex_unlock(&vpu_dev->hw_lock);
> +		return -ENOMEM;
> +	}
> +
> +	p_dec_info =3D &inst->codec_info->dec_info;
> +	memcpy(&p_dec_info->open_param, pop, sizeof(struct dec_open_param));
> +
> +	ret =3D wave6_vpu_build_up_dec_param(inst, pop);
> +	if (ret)
> +		goto free_codec_info;
> +
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return 0;
> +
> +free_codec_info:
> +	kfree(inst->codec_info);
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return ret;
> +}
> +
> +int wave6_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
> +{
> +	int ret;
> +	struct vpu_core_device *vpu_dev =3D inst->dev;
> +
> +	*fail_res =3D 0;
> +	if (!inst->codec_info)
> +		return -EINVAL;
> +
> +	ret =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D wave6_vpu_dec_fini_seq(inst, fail_res);
> +	if (ret) {
> +		dev_warn(inst->dev->dev, "dec seq end timed out\n");
> +
> +		if (*fail_res =3D=3D WAVE6_SYSERR_VPU_STILL_RUNNING) {
> +			mutex_unlock(&vpu_dev->hw_lock);
> +			return ret;
> +		}
> +	}
> +
> +	dev_dbg(inst->dev->dev, "dec seq end complete\n");
> +
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	kfree(inst->codec_info);
> +
> +	return 0;
> +}
> +
> +int wave6_vpu_dec_issue_seq_init(struct vpu_instance *inst)
> +{
> +	int ret;
> +	struct vpu_core_device *vpu_dev =3D inst->dev;
> +
> +	ret =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D wave6_vpu_dec_init_seq(inst);
> +
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return ret;
> +}
> +
> +int wave6_vpu_dec_complete_seq_init(struct vpu_instance *inst, struct de=
c_initial_info *info)
> +{
> +	struct dec_info *p_dec_info =3D &inst->codec_info->dec_info;
> +	int ret;
> +	struct vpu_core_device *vpu_dev =3D inst->dev;
> +
> +	ret =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D wave6_vpu_dec_get_seq_info(inst, info);
> +	if (!ret)
> +		p_dec_info->initial_info_obtained =3D true;
> +
> +	info->rd_ptr =3D wave6_vpu_dec_get_rd_ptr(inst);
> +	info->wr_ptr =3D p_dec_info->stream_wr_ptr;
> +
> +	p_dec_info->initial_info =3D *info;
> +
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return ret;
> +}
> +
> +int wave6_vpu_dec_get_aux_buffer_size(struct vpu_instance *inst,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dec_aux_buffer_size_info info,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t *size)
> +{
> +	struct dec_info *p_dec_info =3D &inst->codec_info->dec_info;
> +	int width =3D info.width;
> +	int height =3D info.height;
> +	int buf_size, twice;
> +
> +	if (info.type =3D=3D AUX_BUF_FBC_Y_TBL) {
> +		switch (inst->std) {
> +		case W_HEVC_DEC:
> +			buf_size =3D WAVE6_FBC_LUMA_TABLE_SIZE(width, height);
> +			break;
> +		case W_AVC_DEC:
> +			buf_size =3D WAVE6_FBC_LUMA_TABLE_SIZE(width, height);
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +		buf_size =3D ALIGN(buf_size, 16);
> +	} else if (info.type =3D=3D AUX_BUF_FBC_C_TBL) {
> +		if (p_dec_info->initial_info.chroma_format_idc =3D=3D 2)
> +			twice =3D 2;
> +		else if (p_dec_info->initial_info.chroma_format_idc =3D=3D 3)
> +			twice =3D 4;
> +		else
> +			twice =3D 1;
> +
> +		switch (inst->std) {
> +		case W_HEVC_DEC:
> +			buf_size =3D WAVE6_FBC_CHROMA_TABLE_SIZE(width, height);
> +			break;
> +		case W_AVC_DEC:
> +			buf_size =3D WAVE6_FBC_CHROMA_TABLE_SIZE(width, height);
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +		buf_size =3D buf_size * twice;
> +		buf_size =3D ALIGN(buf_size, 16);
> +	} else if (info.type =3D=3D AUX_BUF_MV_COL) {
> +		switch (inst->std) {
> +		case W_HEVC_DEC:
> +			buf_size =3D WAVE6_DEC_HEVC_MVCOL_BUF_SIZE(width, height);
> +			break;
> +		case W_AVC_DEC:
> +			buf_size =3D WAVE6_DEC_AVC_MVCOL_BUF_SIZE(width, height);
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +		buf_size =3D ALIGN(buf_size, 16);
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	*size =3D buf_size;
> +
> +	return 0;
> +}
> +
> +int wave6_vpu_dec_register_aux_buffer(struct vpu_instance *inst,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct aux_buffer_info info)
> +{
> +	struct dec_info *p_dec_info;
> +	struct aux_buffer *aux_bufs =3D info.buf_array;
> +	struct dec_aux_buffer_size_info size_info;
> +	unsigned int expected_size;
> +	unsigned int i;
> +	int ret;
> +
> +	p_dec_info =3D &inst->codec_info->dec_info;
> +
> +	size_info.width =3D p_dec_info->initial_info.pic_width;
> +	size_info.height =3D p_dec_info->initial_info.pic_height;
> +	size_info.type =3D info.type;
> +
> +	ret =3D wave6_vpu_dec_get_aux_buffer_size(inst, size_info, &expected_si=
ze);
> +	if (ret)
> +		return ret;
> +
> +	switch (info.type) {
> +	case AUX_BUF_FBC_Y_TBL:
> +		for (i =3D 0; i < info.num; i++) {
> +			if (expected_size > aux_bufs[i].size)
> +				return -EINVAL;
> +
> +			p_dec_info->vb_fbc_y_tbl[aux_bufs[i].index].daddr =3D aux_bufs[i].add=
r;
> +			p_dec_info->vb_fbc_y_tbl[aux_bufs[i].index].size =3D aux_bufs[i].size=
;
> +		}
> +		break;
> +	case AUX_BUF_FBC_C_TBL:
> +		for (i =3D 0; i < info.num; i++) {
> +			if (expected_size > aux_bufs[i].size)
> +				return -EINVAL;
> +
> +			p_dec_info->vb_fbc_c_tbl[aux_bufs[i].index].daddr =3D aux_bufs[i].add=
r;
> +			p_dec_info->vb_fbc_c_tbl[aux_bufs[i].index].size =3D aux_bufs[i].size=
;
> +		}
> +		break;
> +	case AUX_BUF_MV_COL:
> +		for (i =3D 0; i < info.num; i++) {
> +			if (expected_size > aux_bufs[i].size)
> +				return -EINVAL;
> +
> +			p_dec_info->vb_mv[aux_bufs[i].index].daddr =3D aux_bufs[i].addr;
> +			p_dec_info->vb_mv[aux_bufs[i].index].size =3D aux_bufs[i].size;
> +		}
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +int wave6_vpu_dec_register_frame_buffer_ex(struct vpu_instance *inst,
> +					=C2=A0=C2=A0 int num_of_dec_fbs, int stride,
> +					=C2=A0=C2=A0 int height, int map_type)
> +{
> +	struct dec_info *p_dec_info;
> +	int ret;
> +	struct vpu_core_device *vpu_dev =3D inst->dev;
> +	struct frame_buffer *fb;
> +
> +	if (num_of_dec_fbs > WAVE6_MAX_FBS)
> +		return -EINVAL;
> +
> +	p_dec_info =3D &inst->codec_info->dec_info;
> +	p_dec_info->stride =3D stride;
> +
> +	if (!p_dec_info->initial_info_obtained)
> +		return -EINVAL;
> +
> +	if (stride < p_dec_info->initial_info.pic_width || (stride % 8) ||
> +	=C2=A0=C2=A0=C2=A0 height < p_dec_info->initial_info.pic_height)
> +		return -EINVAL;
> +
> +	ret =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
> +	if (ret)
> +		return ret;
> +
> +	fb =3D inst->frame_buf;
> +	ret =3D wave6_vpu_dec_register_frame_buffer(inst, &fb[0], COMPRESSED_FR=
AME_MAP,
> +						=C2=A0 num_of_dec_fbs);
> +
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return ret;
> +}
> +
> +int wave6_vpu_dec_register_display_buffer_ex(struct vpu_instance *inst, =
struct frame_buffer fb)
> +{
> +	struct dec_info *p_dec_info;
> +	int ret;
> +	struct vpu_core_device *vpu_dev =3D inst->dev;
> +
> +	p_dec_info =3D &inst->codec_info->dec_info;
> +
> +	if (!p_dec_info->initial_info_obtained)
> +		return -EINVAL;
> +
> +	ret =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D wave6_vpu_dec_register_display_buffer(inst, fb);
> +
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return ret;
> +}
> +
> +int wave6_vpu_dec_get_bitstream_buffer(struct vpu_instance *inst, dma_ad=
dr_t *p_rd_ptr,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_addr_t *p_wr_ptr)
> +{
> +	struct dec_info *p_dec_info;
> +	dma_addr_t rd_ptr;
> +	dma_addr_t wr_ptr;
> +	struct vpu_core_device *vpu_dev =3D inst->dev;
> +	int ret;
> +
> +	p_dec_info =3D &inst->codec_info->dec_info;
> +
> +	ret =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
> +	if (ret)
> +		return ret;
> +
> +	rd_ptr =3D wave6_vpu_dec_get_rd_ptr(inst);
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	wr_ptr =3D p_dec_info->stream_wr_ptr;
> +
> +	if (p_rd_ptr)
> +		*p_rd_ptr =3D rd_ptr;
> +	if (p_wr_ptr)
> +		*p_wr_ptr =3D wr_ptr;
> +
> +	return 0;
> +}
> +
> +int wave6_vpu_dec_update_bitstream_buffer(struct vpu_instance *inst, int=
 size)
> +{
> +	struct dec_info *p_dec_info;
> +	dma_addr_t wr_ptr;
> +	dma_addr_t rd_ptr;
> +	int ret;
> +	struct vpu_core_device *vpu_dev =3D inst->dev;
> +
> +	if (!inst->codec_info)
> +		return -EINVAL;
> +
> +	p_dec_info =3D &inst->codec_info->dec_info;
> +	wr_ptr =3D p_dec_info->stream_wr_ptr;
> +	rd_ptr =3D p_dec_info->stream_rd_ptr;
> +
> +	if (size > 0) {
> +		if (wr_ptr < rd_ptr && rd_ptr <=3D wr_ptr + size)
> +			return -EINVAL;
> +
> +		wr_ptr +=3D size;
> +
> +		p_dec_info->stream_wr_ptr =3D wr_ptr;
> +		p_dec_info->stream_rd_ptr =3D rd_ptr;
> +	}
> +
> +	ret =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
> +	if (ret)
> +		return ret;
> +
> +	wave6_vpu_dec_set_bitstream_end(inst, (size =3D=3D 0));
> +
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return ret;
> +}
> +
> +int wave6_vpu_dec_start_one_frame(struct vpu_instance *inst, struct dec_=
param *param, u32 *res_fail)
> +{
> +	struct dec_info *p_dec_info =3D &inst->codec_info->dec_info;
> +	int ret;
> +	struct vpu_core_device *vpu_dev =3D inst->dev;
> +
> +	if (!p_dec_info->stride)
> +		return -EINVAL;
> +
> +	ret =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D wave6_vpu_decode(inst, param, res_fail);
> +
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return ret;
> +}
> +
> +int wave6_vpu_dec_set_rd_ptr(struct vpu_instance *inst, dma_addr_t addr,=
 bool update_wr_ptr)
> +{
> +	struct dec_info *p_dec_info =3D &inst->codec_info->dec_info;
> +	int ret;
> +	struct vpu_core_device *vpu_dev =3D inst->dev;
> +
> +	ret =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
> +	if (ret)
> +		return ret;
> +
> +	p_dec_info->stream_rd_ptr =3D addr;
> +	if (update_wr_ptr)
> +		p_dec_info->stream_wr_ptr =3D addr;
> +
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return ret;
> +}
> +
> +int wave6_vpu_dec_get_output_info(struct vpu_instance *inst, struct dec_=
output_info *info)
> +{
> +	struct dec_info *p_dec_info;
> +	int ret;
> +	struct vpu_core_device *vpu_dev =3D inst->dev;
> +
> +	if (!info)
> +		return -EINVAL;
> +
> +	p_dec_info =3D &inst->codec_info->dec_info;
> +
> +	ret =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
> +	if (ret)
> +		return ret;
> +
> +	memset(info, 0, sizeof(*info));
> +
> +	ret =3D wave6_vpu_dec_get_result(inst, info);
> +	if (ret) {
> +		info->rd_ptr =3D p_dec_info->stream_rd_ptr;
> +		info->wr_ptr =3D p_dec_info->stream_wr_ptr;
> +		goto err_out;
> +	}
> +
> +err_out:
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return ret;
> +}
> +
> +int wave6_vpu_dec_give_command(struct vpu_instance *inst, enum codec_com=
mand cmd, void *param)
> +{
> +	struct dec_info *p_dec_info;
> +
> +	if (!inst || !inst->codec_info)
> +		return -EINVAL;
> +
> +	p_dec_info =3D &inst->codec_info->dec_info;
> +
> +	switch (cmd) {
> +	case DEC_RESET_FRAMEBUF_INFO: {
> +		int i;
> +
> +		for (i =3D 0; i < WAVE6_MAX_FBS; i++) {
> +			wave6_free_dma(&inst->frame_vbuf[i]);
> +			memset(&inst->frame_buf[i], 0, sizeof(struct frame_buffer));
> +			memset(&p_dec_info->disp_buf[i], 0, sizeof(struct frame_buffer));
> +
> +			wave6_free_dma(&inst->aux_vbuf[AUX_BUF_MV_COL][i]);
> +			memset(&p_dec_info->vb_mv[i], 0, sizeof(struct vpu_buf));
> +
> +			wave6_free_dma(&inst->aux_vbuf[AUX_BUF_FBC_Y_TBL][i]);
> +			memset(&p_dec_info->vb_fbc_y_tbl[i], 0, sizeof(struct vpu_buf));
> +
> +			wave6_free_dma(&inst->aux_vbuf[AUX_BUF_FBC_C_TBL][i]);
> +			memset(&p_dec_info->vb_fbc_c_tbl[i], 0, sizeof(struct vpu_buf));
> +		}
> +		break;
> +	}
> +	case DEC_GET_SEQ_INFO: {
> +		struct dec_initial_info *seq_info =3D param;
> +
> +		*seq_info =3D p_dec_info->initial_info;
> +		break;
> +	}
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +int wave6_vpu_dec_flush_instance(struct vpu_instance *inst)
> +{
> +	struct vpu_core_device *vpu_dev =3D inst->dev;
> +	int ret;
> +
> +	ret =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D wave6_vpu_dec_flush(inst);
> +
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return ret;
> +}
> +
> +int wave6_vpu_enc_open(struct vpu_instance *inst, struct enc_open_param =
*pop)
> +{
> +	struct enc_info *p_enc_info;
> +	int ret;
> +	struct vpu_core_device *vpu_dev =3D inst->dev;
> +
> +	ret =3D wave6_vpu_enc_check_open_param(inst, pop);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
> +	if (ret)
> +		return ret;
> +
> +	if (!wave6_vpu_is_init(vpu_dev)) {
> +		mutex_unlock(&vpu_dev->hw_lock);
> +		return -ENODEV;
> +	}
> +
> +	inst->codec_info =3D kzalloc(sizeof(*inst->codec_info), GFP_KERNEL);
> +	if (!inst->codec_info) {
> +		mutex_unlock(&vpu_dev->hw_lock);
> +		return -ENOMEM;
> +	}
> +
> +	p_enc_info =3D &inst->codec_info->enc_info;
> +	p_enc_info->open_param =3D *pop;
> +
> +	ret =3D wave6_vpu_build_up_enc_param(vpu_dev->dev, inst, pop);
> +	if (ret)
> +		goto free_codec_info;
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return 0;
> +
> +free_codec_info:
> +	kfree(inst->codec_info);
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return ret;
> +}
> +
> +int wave6_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
> +{
> +	int ret;
> +	struct vpu_core_device *vpu_dev =3D inst->dev;
> +
> +	*fail_res =3D 0;
> +	if (!inst->codec_info)
> +		return -EINVAL;
> +
> +	ret =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D wave6_vpu_enc_fini_seq(inst, fail_res);
> +	if (ret) {
> +		dev_warn(inst->dev->dev, "enc seq end timed out\n");
> +
> +		if (*fail_res =3D=3D WAVE6_SYSERR_VPU_STILL_RUNNING) {
> +			mutex_unlock(&vpu_dev->hw_lock);
> +			return ret;
> +		}
> +	}
> +
> +	dev_dbg(inst->dev->dev, "enc seq end timed out\n");
> +
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	kfree(inst->codec_info);
> +
> +	return 0;
> +}
> +
> +int wave6_vpu_enc_get_aux_buffer_size(struct vpu_instance *inst,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct enc_aux_buffer_size_info info,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t *size)
> +{
> +	struct enc_info *p_enc_info =3D &inst->codec_info->enc_info;
> +	int width, height, buf_size, twice;
> +
> +	if (inst->std =3D=3D W_AVC_ENC) {
> +		width =3D ALIGN(info.width, 16);
> +		height =3D ALIGN(info.height, 16);
> +		if (info.rotation_angle =3D=3D 90 || info.rotation_angle =3D=3D 270) {
> +			width =3D ALIGN(info.height, 16);
> +			height =3D ALIGN(info.width, 16);
> +		}
> +	} else {
> +		width =3D ALIGN(info.width, 8);
> +		height =3D ALIGN(info.height, 8);
> +		if ((info.rotation_angle || info.mirror_direction) &&
> +		=C2=A0=C2=A0=C2=A0 !(info.rotation_angle =3D=3D 180 && info.mirror_dir=
ection =3D=3D MIRDIR_HOR_VER)) {
> +			width =3D ALIGN(info.width, 32);
> +			height =3D ALIGN(info.height, 32);
> +		}
> +		if (info.rotation_angle =3D=3D 90 || info.rotation_angle =3D=3D 270) {
> +			width =3D ALIGN(info.height, 32);
> +			height =3D ALIGN(info.width, 32);
> +		}
> +	}
> +
> +	if (info.type =3D=3D AUX_BUF_FBC_Y_TBL) {
> +		switch (inst->std) {
> +		case W_HEVC_ENC:
> +			buf_size =3D WAVE6_FBC_LUMA_TABLE_SIZE(width, height);
> +			break;
> +		case W_AVC_ENC:
> +			buf_size =3D WAVE6_FBC_LUMA_TABLE_SIZE(width, height);
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	} else if (info.type =3D=3D AUX_BUF_FBC_C_TBL) {
> +		switch (p_enc_info->open_param.output_format) {
> +		case FORMAT_422:
> +		case FORMAT_422_P10_16BIT_MSB:
> +		case FORMAT_422_P10_16BIT_LSB:
> +		case FORMAT_422_P10_32BIT_MSB:
> +		case FORMAT_422_P10_32BIT_LSB:
> +			twice =3D 2;
> +			break;
> +		case FORMAT_444:
> +		case FORMAT_444_P10_16BIT_MSB:
> +		case FORMAT_444_P10_16BIT_LSB:
> +		case FORMAT_444_P10_32BIT_MSB:
> +		case FORMAT_444_P10_32BIT_LSB:
> +			twice =3D 4;
> +			break;
> +		default:
> +			twice =3D 1;
> +			break;
> +		}
> +		switch (inst->std) {
> +		case W_HEVC_ENC:
> +			buf_size =3D WAVE6_FBC_CHROMA_TABLE_SIZE(width, height);
> +			break;
> +		case W_AVC_ENC:
> +			buf_size =3D WAVE6_FBC_CHROMA_TABLE_SIZE(width, height);
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +		buf_size =3D buf_size * twice;
> +	} else if (info.type =3D=3D AUX_BUF_MV_COL) {
> +		switch (inst->std) {
> +		case W_HEVC_ENC:
> +			buf_size =3D WAVE6_ENC_HEVC_MVCOL_BUF_SIZE(width, height);
> +			break;
> +		case W_AVC_ENC:
> +			buf_size =3D WAVE6_ENC_AVC_MVCOL_BUF_SIZE(width, height);
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	} else if (info.type =3D=3D AUX_BUF_SUB_SAMPLE) {
> +		switch (inst->std) {
> +		case W_HEVC_ENC:
> +		case W_AVC_ENC:
> +			buf_size =3D WAVE6_ENC_SUBSAMPLED_SIZE(width, height);
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	*size =3D buf_size;
> +
> +	return 0;
> +}
> +
> +int wave6_vpu_enc_register_aux_buffer(struct vpu_instance *inst,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct aux_buffer_info info)
> +{
> +	struct enc_info *p_enc_info;
> +	struct aux_buffer *aux_bufs =3D info.buf_array;
> +	struct enc_aux_buffer_size_info size_info;
> +	unsigned int expected_size;
> +	unsigned int i;
> +	int ret;
> +
> +	p_enc_info =3D &inst->codec_info->enc_info;
> +
> +	size_info.width =3D p_enc_info->width;
> +	size_info.height =3D p_enc_info->height;
> +	size_info.type =3D info.type;
> +	size_info.rotation_angle =3D p_enc_info->rotation_angle;
> +	size_info.mirror_direction =3D p_enc_info->mirror_direction;
> +
> +	ret =3D wave6_vpu_enc_get_aux_buffer_size(inst, size_info, &expected_si=
ze);
> +	if (ret)
> +		return ret;
> +
> +	switch (info.type) {
> +	case AUX_BUF_FBC_Y_TBL:
> +		for (i =3D 0; i < info.num; i++) {
> +			if (expected_size > aux_bufs[i].size)
> +				return -EINVAL;
> +
> +			p_enc_info->vb_fbc_y_tbl[aux_bufs[i].index].daddr =3D aux_bufs[i].add=
r;
> +			p_enc_info->vb_fbc_y_tbl[aux_bufs[i].index].size =3D aux_bufs[i].size=
;
> +		}
> +		break;
> +	case AUX_BUF_FBC_C_TBL:
> +		for (i =3D 0; i < info.num; i++) {
> +			if (expected_size > aux_bufs[i].size)
> +				return -EINVAL;
> +
> +			p_enc_info->vb_fbc_c_tbl[aux_bufs[i].index].daddr =3D aux_bufs[i].add=
r;
> +			p_enc_info->vb_fbc_c_tbl[aux_bufs[i].index].size =3D aux_bufs[i].size=
;
> +		}
> +		break;
> +	case AUX_BUF_MV_COL:
> +		for (i =3D 0; i < info.num; i++) {
> +			if (expected_size > aux_bufs[i].size)
> +				return -EINVAL;
> +
> +			p_enc_info->vb_mv[aux_bufs[i].index].daddr =3D aux_bufs[i].addr;
> +			p_enc_info->vb_mv[aux_bufs[i].index].size =3D aux_bufs[i].size;
> +		}
> +		break;
> +	case AUX_BUF_SUB_SAMPLE:
> +		for (i =3D 0; i < info.num; i++) {
> +			if (expected_size > aux_bufs[i].size)
> +				return -EINVAL;
> +
> +			p_enc_info->vb_sub_sam_buf[aux_bufs[i].index].daddr =3D aux_bufs[i].a=
ddr;
> +			p_enc_info->vb_sub_sam_buf[aux_bufs[i].index].size =3D aux_bufs[i].si=
ze;
> +		}
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +int wave6_vpu_enc_register_frame_buffer_ex(struct vpu_instance *inst, in=
t num, unsigned int stride,
> +					=C2=A0=C2=A0 int height, enum tiled_map_type map_type)
> +{
> +	struct enc_info *p_enc_info =3D &inst->codec_info->enc_info;
> +	int ret;
> +	struct vpu_core_device *vpu_dev =3D inst->dev;
> +
> +	if (p_enc_info->stride)
> +		return -EINVAL;
> +
> +	if (!p_enc_info->initial_info_obtained)
> +		return -EINVAL;
> +
> +	if (num < p_enc_info->initial_info.min_frame_buffer_count)
> +		return -EINVAL;
> +
> +	if (!stride || stride % 8)
> +		return -EINVAL;
> +
> +	if (height < 0)
> +		return -EINVAL;
> +
> +	ret =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
> +	if (ret)
> +		return ret;
> +
> +	p_enc_info->num_frame_buffers =3D num;
> +	p_enc_info->stride =3D stride;
> +
> +	ret =3D wave6_vpu_enc_register_frame_buffer(inst, &inst->frame_buf[0]);
> +
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return ret;
> +}
> +
> +static int wave6_check_enc_param(struct vpu_instance *inst, struct enc_p=
aram *param)
> +{
> +	struct enc_info *p_enc_info =3D &inst->codec_info->enc_info;
> +	bool is_rgb_format =3D false;
> +
> +	if (!param)
> +		return -EINVAL;
> +
> +	if (!param->skip_picture && !param->source_frame)
> +		return -EINVAL;
> +
> +	if (!p_enc_info->open_param.codec_param.bitrate && inst->std =3D=3D W_H=
EVC_ENC) {
> +		if (param->force_pic_qp_enable) {
> +			if (param->force_pic_qp_i < 0 || param->force_pic_qp_i > 63)
> +				return -EINVAL;
> +
> +			if (param->force_pic_qp_p < 0 || param->force_pic_qp_p > 63)
> +				return -EINVAL;
> +
> +			if (param->force_pic_qp_b < 0 || param->force_pic_qp_b > 63)
> +				return -EINVAL;
> +		}
> +		if ((param->pic_stream_buffer_addr % 16 || !param->pic_stream_buffer_s=
ize))
> +			return -EINVAL;
> +	}
> +
> +	if ((param->pic_stream_buffer_addr % 8 || !param->pic_stream_buffer_siz=
e))
> +		return -EINVAL;
> +
> +	if (p_enc_info->open_param.src_format =3D=3D FORMAT_RGB_32BIT_PACKED ||
> +	=C2=A0=C2=A0=C2=A0 p_enc_info->open_param.src_format =3D=3D FORMAT_RGB_=
P10_32BIT_PACKED ||
> +	=C2=A0=C2=A0=C2=A0 p_enc_info->open_param.src_format =3D=3D FORMAT_RGB_=
24BIT_PACKED)
> +		is_rgb_format =3D true;
> +
> +	if (is_rgb_format) {
> +		if (param->csc.coef_ry > 1023)
> +			return -EINVAL;
> +		if (param->csc.coef_gy > 1023)
> +			return -EINVAL;
> +		if (param->csc.coef_by > 1023)
> +			return -EINVAL;
> +		if (param->csc.coef_rcb > 1023)
> +			return -EINVAL;
> +		if (param->csc.coef_gcb > 1023)
> +			return -EINVAL;
> +		if (param->csc.coef_bcb > 1023)
> +			return -EINVAL;
> +		if (param->csc.coef_rcr > 1023)
> +			return -EINVAL;
> +		if (param->csc.coef_gcr > 1023)
> +			return -EINVAL;
> +		if (param->csc.coef_bcr > 1023)
> +			return -EINVAL;
> +		if (param->csc.offset_y > 1023)
> +			return -EINVAL;
> +		if (param->csc.offset_cb > 1023)
> +			return -EINVAL;
> +		if (param->csc.offset_cr > 1023)
> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +int wave6_vpu_enc_start_one_frame(struct vpu_instance *inst, struct enc_=
param *param, u32 *fail_res)
> +{
> +	struct enc_info *p_enc_info =3D &inst->codec_info->enc_info;
> +	int ret;
> +	struct vpu_core_device *vpu_dev =3D inst->dev;
> +
> +	*fail_res =3D 0;
> +
> +	if (!p_enc_info->stride)
> +		return -EINVAL;
> +
> +	ret =3D wave6_check_enc_param(inst, param);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D wave6_vpu_encode(inst, param, fail_res);
> +
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return ret;
> +}
> +
> +int wave6_vpu_enc_get_output_info(struct vpu_instance *inst, struct enc_=
output_info *info)
> +{
> +	int ret;
> +	struct vpu_core_device *vpu_dev =3D inst->dev;
> +
> +	if (!info)
> +		return -EINVAL;
> +
> +	ret =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
> +	if (ret)
> +		return ret;
> +
> +	memset(info, 0, sizeof(*info));
> +
> +	ret =3D wave6_vpu_enc_get_result(inst, info);
> +	if (ret)
> +		goto unlock;
> +
> +unlock:
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return ret;
> +}
> +
> +int wave6_vpu_enc_give_command(struct vpu_instance *inst, enum codec_com=
mand cmd, void *param)
> +{
> +	struct enc_info *p_enc_info;
> +
> +	if (!inst || !inst->codec_info)
> +		return -EINVAL;
> +
> +	p_enc_info =3D &inst->codec_info->enc_info;
> +
> +	switch (cmd) {
> +	case ENABLE_ROTATION:
> +		p_enc_info->rotation_enable =3D true;
> +		break;
> +	case ENABLE_MIRRORING:
> +		p_enc_info->mirror_enable =3D true;
> +		break;
> +	case SET_MIRROR_DIRECTION: {
> +		enum mirror_direction mir_dir;
> +
> +		mir_dir =3D *(enum mirror_direction *)param;
> +		if (mir_dir !=3D MIRDIR_NONE && mir_dir !=3D MIRDIR_HOR &&
> +		=C2=A0=C2=A0=C2=A0 mir_dir !=3D MIRDIR_VER && mir_dir !=3D MIRDIR_HOR_=
VER)
> +			return -EINVAL;
> +		p_enc_info->mirror_direction =3D mir_dir;
> +		break;
> +	}
> +	case SET_ROTATION_ANGLE: {
> +		int angle;
> +
> +		angle =3D *(int *)param;
> +		if (angle && angle !=3D 90 && angle !=3D 180 && angle !=3D 270)
> +			return -EINVAL;
> +		if (p_enc_info->initial_info_obtained && (angle =3D=3D 90 || angle =3D=
=3D 270))
> +			return -EINVAL;
> +		p_enc_info->rotation_angle =3D angle;
> +		break;
> +	}
> +	default:
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +int wave6_vpu_enc_issue_seq_init(struct vpu_instance *inst)
> +{
> +	int ret;
> +	struct vpu_core_device *vpu_dev =3D inst->dev;
> +
> +	ret =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D wave6_vpu_enc_init_seq(inst);
> +
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return ret;
> +}
> +
> +int wave6_vpu_enc_issue_seq_change(struct vpu_instance *inst, bool *chan=
ged)
> +{
> +	int ret;
> +	struct vpu_core_device *vpu_dev =3D inst->dev;
> +
> +	ret =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D wave6_vpu_enc_change_seq(inst, changed);
> +
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return ret;
> +}
> +
> +int wave6_vpu_enc_complete_seq_init(struct vpu_instance *inst, struct en=
c_initial_info *info)
> +{
> +	struct enc_info *p_enc_info =3D &inst->codec_info->enc_info;
> +	int ret;
> +	struct vpu_core_device *vpu_dev =3D inst->dev;
> +
> +	if (!info)
> +		return -EINVAL;
> +
> +	ret =3D mutex_lock_interruptible(&vpu_dev->hw_lock);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D wave6_vpu_enc_get_seq_info(inst, info);
> +	if (ret) {
> +		p_enc_info->initial_info_obtained =3D false;
> +		mutex_unlock(&vpu_dev->hw_lock);
> +		return ret;
> +	}
> +
> +	if (!p_enc_info->initial_info_obtained) {
> +		p_enc_info->initial_info_obtained =3D true;
> +		p_enc_info->initial_info =3D *info;
> +	}
> +
> +	mutex_unlock(&vpu_dev->hw_lock);
> +
> +	return 0;
> +}
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h b/dr=
ivers/media/platform/chips-media/wave6/wave6-
> vpuapi.h
> new file mode 100644
> index 000000000000..17170dff3dde
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
> @@ -0,0 +1,987 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
> +/*
> + * Wave6 series multi-standard codec IP - wave6 helper interface
> + *
> + * Copyright (C) 2025 CHIPS&MEDIA INC
> + */
> +
> +#ifndef __WAVE6_VPUAPI_H__
> +#define __WAVE6_VPUAPI_H__
> +
> +#include <linux/kfifo.h>
> +#include <linux/idr.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/v4l2-ctrls.h>
> +#include "wave6-vpuerror.h"
> +#include "wave6-vpuconfig.h"
> +#include "wave6-vdi.h"
> +#include "wave6-vpu.h"
> +
> +struct vpu_attr;
> +
> +enum vpu_instance_type {
> +	VPU_INST_TYPE_DEC	=3D 0,
> +	VPU_INST_TYPE_ENC	=3D 1
> +};
> +
> +enum vpu_instance_state {
> +	VPU_INST_STATE_NONE	=3D 0,
> +	VPU_INST_STATE_OPEN	=3D 1,
> +	VPU_INST_STATE_INIT_SEQ	=3D 2,
> +	VPU_INST_STATE_PIC_RUN	=3D 3,
> +	VPU_INST_STATE_SEEK	=3D 4,
> +	VPU_INST_STATE_STOP	=3D 5
> +};
> +
> +#define WAVE6_MAX_FBS 31
> +
> +#define WAVE6_DEC_HEVC_MVCOL_BUF_SIZE(_w, _h) \
> +	((ALIGN((_w), 256) / 16) * (ALIGN((_h), 64) / 16) * 1 * 16)
> +#define WAVE6_DEC_AVC_MVCOL_BUF_SIZE(_w, _h) \
> +	((ALIGN((_w), 64) / 16) * (ALIGN((_h), 16) / 16) * 5 * 16)
> +#define WAVE6_FBC_LUMA_TABLE_SIZE(_w, _h) \
> +	(ALIGN((_w), 256) * ALIGN((_h), 64) / 32)
> +#define WAVE6_FBC_CHROMA_TABLE_SIZE(_w, _h) \
> +	(ALIGN(((_w) / 2), 256) * ALIGN((_h), 64) / 32)
> +#define WAVE6_ENC_AVC_MVCOL_BUF_SIZE(_w, _h) \
> +	((ALIGN((_w), 512) / 512) * (ALIGN((_h), 16) / 16) * 16)
> +#define WAVE6_ENC_HEVC_MVCOL_BUF_SIZE(_w, _h) \
> +	((ALIGN((_w), 64) / 64) * (ALIGN((_h), 64) / 64) * 128)
> +#define WAVE6_ENC_SUBSAMPLED_SIZE(_w, _h) \
> +	(ALIGN(((_w) / 4), 16) * ALIGN(((_h) / 4), 32))
> +
> +enum codec_std {
> +	W_HEVC_DEC	=3D 0x00,
> +	W_HEVC_ENC	=3D 0x01,
> +	W_AVC_DEC	=3D 0x02,
> +	W_AVC_ENC	=3D 0x03,
> +	STD_UNKNOWN	=3D 0xFF
> +};
> +
> +#define HEVC_PROFILE_MAIN 1
> +#define HEVC_PROFILE_MAIN10 2
> +#define HEVC_PROFILE_STILLPICTURE 3
> +#define HEVC_PROFILE_MAIN10_STILLPICTURE 2
> +
> +#define H264_PROFILE_BP 1
> +#define H264_PROFILE_MP 2
> +#define H264_PROFILE_EXTENDED 3
> +#define H264_PROFILE_HP 4
> +#define H264_PROFILE_HIGH10 5
> +
> +#define H264_VUI_SAR_IDC_EXTENDED 255
> +
> +#define DEC_REFRESH_TYPE_NON_IRAP 0
> +#define DEC_REFRESH_TYPE_IDR 2
> +
> +#define DEFAULT_TEMP_LAYER_CNT 1
> +#define DEFAULT_RC_INITIAL_LEVEL 8
> +#define DEFAULT_RC_INITIAL_QP -1
> +#define DEFAULT_PIC_RC_MAX_DQP 3
> +#define DEFAULT_EN_ADAPTIVE_ROUND 1
> +#define DEFAULT_Q_ROUND_INTER 85
> +#define DEFAULT_Q_ROUND_INTRA 171
> +#define DEFAULT_EN_INTRA_TRANS_SKIP 1
> +#define DEFAULT_EN_ME_CENTER 1
> +#define DEFAULT_INTRA_4X4 3
> +#define DEFAULT_EN_AUTO_LEVEL_ADJUSTING 1
> +#define DEFAULT_NUM_TICKS_POC_DIFF 100
> +#define DEFAULT_RC_UPDATE_SPEED_CBR 64
> +#define DEFAULT_RC_UPDATE_SPEED_VBR 16
> +#define DEFAULT_VUI_VIDEO_SIGNAL_TYPE_PRESENT_FLAG 1
> +#define DEFAULT_VUI_COLOR_DESCRIPTION_PRESENT_FLAG 1
> +
> +#define SEQ_CHANGE_ENABLE_PROFILE BIT(5)
> +#define SEQ_CHANGE_ENABLE_SIZE BIT(16)
> +#define SEQ_CHANGE_ENABLE_BITDEPTH BIT(18)
> +#define SEQ_CHANGE_ENABLE_DPB_COUNT BIT(19)
> +
> +#define SEQ_CHANGE_ENABLE_ALL_HEVC (SEQ_CHANGE_ENABLE_PROFILE | \
> +		SEQ_CHANGE_ENABLE_SIZE | \
> +		SEQ_CHANGE_ENABLE_BITDEPTH | \
> +		SEQ_CHANGE_ENABLE_DPB_COUNT)
> +
> +#define SEQ_CHANGE_ENABLE_ALL_AVC (SEQ_CHANGE_ENABLE_SIZE | \
> +		SEQ_CHANGE_ENABLE_BITDEPTH | \
> +		SEQ_CHANGE_ENABLE_DPB_COUNT)
> +
> +#define DEC_NOTI_FLAG_NO_FB 0x2
> +#define DEC_NOTI_FLAG_SEQ_CHANGE 0x1
> +
> +#define RECON_IDX_FLAG_ENC_END -1
> +#define RECON_IDX_FLAG_ENC_DELAY -2
> +#define RECON_IDX_FLAG_HEADER_ONLY -3
> +#define RECON_IDX_FLAG_CHANGE_PARAM -4
> +
> +enum codec_command {
> +	ENABLE_ROTATION,
> +	ENABLE_MIRRORING,
> +	SET_MIRROR_DIRECTION,
> +	SET_ROTATION_ANGLE,
> +	DEC_RESET_FRAMEBUF_INFO,
> +	DEC_GET_SEQ_INFO,
> +};
> +
> +enum cb_cr_order {
> +	CBCR_ORDER_NORMAL,
> +	CBCR_ORDER_REVERSED
> +};
> +
> +enum mirror_direction {
> +	MIRDIR_NONE,
> +	MIRDIR_VER,
> +	MIRDIR_HOR,
> +	MIRDIR_HOR_VER
> +};
> +
> +enum chroma_format {
> +	YUV400,
> +	YUV420,
> +	YUV422,
> +	YUV444,
> +};
> +
> +enum frame_buffer_format {
> +	FORMAT_ERR =3D -1,
> +
> +	FORMAT_420 =3D 0,
> +	FORMAT_422,
> +	FORMAT_224,
> +	FORMAT_444,
> +	FORMAT_400,
> +
> +	FORMAT_420_P10_16BIT_MSB =3D 5,
> +	FORMAT_420_P10_16BIT_LSB,
> +	FORMAT_420_P10_32BIT_MSB,
> +	FORMAT_420_P10_32BIT_LSB,
> +
> +	FORMAT_422_P10_16BIT_MSB,
> +	FORMAT_422_P10_16BIT_LSB,
> +	FORMAT_422_P10_32BIT_MSB,
> +	FORMAT_422_P10_32BIT_LSB,
> +
> +	FORMAT_444_P10_16BIT_MSB,
> +	FORMAT_444_P10_16BIT_LSB,
> +	FORMAT_444_P10_32BIT_MSB,
> +	FORMAT_444_P10_32BIT_LSB,
> +
> +	FORMAT_400_P10_16BIT_MSB,
> +	FORMAT_400_P10_16BIT_LSB,
> +	FORMAT_400_P10_32BIT_MSB,
> +	FORMAT_400_P10_32BIT_LSB,
> +
> +	FORMAT_YUYV,
> +	FORMAT_YUYV_P10_16BIT_MSB,
> +	FORMAT_YUYV_P10_16BIT_LSB,
> +	FORMAT_YUYV_P10_32BIT_MSB,
> +	FORMAT_YUYV_P10_32BIT_LSB,
> +
> +	FORMAT_YVYU,
> +	FORMAT_YVYU_P10_16BIT_MSB,
> +	FORMAT_YVYU_P10_16BIT_LSB,
> +	FORMAT_YVYU_P10_32BIT_MSB,
> +	FORMAT_YVYU_P10_32BIT_LSB,
> +
> +	FORMAT_UYVY,
> +	FORMAT_UYVY_P10_16BIT_MSB,
> +	FORMAT_UYVY_P10_16BIT_LSB,
> +	FORMAT_UYVY_P10_32BIT_MSB,
> +	FORMAT_UYVY_P10_32BIT_LSB,
> +
> +	FORMAT_VYUY,
> +	FORMAT_VYUY_P10_16BIT_MSB,
> +	FORMAT_VYUY_P10_16BIT_LSB,
> +	FORMAT_VYUY_P10_32BIT_MSB,
> +	FORMAT_VYUY_P10_32BIT_LSB,
> +
> +	FORMAT_RGB_32BIT_PACKED =3D 90,
> +	FORMAT_YUV444_32BIT_PACKED,
> +	FORMAT_RGB_P10_32BIT_PACKED,
> +	FORMAT_YUV444_P10_32BIT_PACKED,
> +
> +	FORMAT_RGB_24BIT_PACKED =3D 95,
> +	FORMAT_YUV444_24BIT_PACKED,
> +	FORMAT_YUV444_24BIT,
> +
> +	FORMAT_MAX,
> +};
> +
> +enum packed_format_num {
> +	NOT_PACKED =3D 0,
> +	PACKED_YUYV,
> +	PACKED_YVYU,
> +	PACKED_UYVY,
> +	PACKED_VYUY,
> +};
> +
> +enum pic_type {
> +	PIC_TYPE_I =3D 0,
> +	PIC_TYPE_P =3D 1,
> +	PIC_TYPE_B =3D 2,
> +	PIC_TYPE_IDR =3D 5,
> +	PIC_TYPE_MAX
> +};
> +
> +enum enc_force_pic_type {
> +	ENC_FORCE_PIC_TYPE_I =3D 0,
> +	ENC_FORCE_PIC_TYPE_P =3D 1,
> +	ENC_FORCE_PIC_TYPE_B =3D 2,
> +	ENC_FORCE_PIC_TYPE_IDR =3D 3,
> +	ENC_FORCE_PIC_TYPE_DISABLED =3D 4,
> +};
> +
> +enum bitstream_mode {
> +	BS_MODE_INTERRUPT,
> +	BS_MODE_RESERVED,
> +	BS_MODE_PIC_END,
> +};
> +
> +enum display_mode {
> +	DISP_MODE_DISP_ORDER,
> +	DISP_MODE_DEC_ORDER,
> +};
> +
> +enum sw_reset_mode {
> +	SW_RESET_SAFETY,
> +	SW_RESET_FORCE,
> +	SW_RESET_ON_BOOT
> +};
> +
> +enum tiled_map_type {
> +	LINEAR_FRAME_MAP =3D 0,
> +	COMPRESSED_FRAME_MAP =3D 17,
> +};
> +
> +enum temporal_id_mode {
> +	TEMPORAL_ID_MODE_ABSOLUTE,
> +	TEMPORAL_ID_MODE_RELATIVE,
> +};
> +
> +enum aux_buffer_type {
> +	AUX_BUF_FBC_Y_TBL,
> +	AUX_BUF_FBC_C_TBL,
> +	AUX_BUF_MV_COL,
> +	AUX_BUF_SUB_SAMPLE,
> +	AUX_BUF_TYPE_MAX,
> +};
> +
> +enum intra_refresh_mode {
> +	INTRA_REFRESH_NONE =3D 0,
> +	INTRA_REFRESH_ROW =3D 1,
> +	INTRA_REFRESH_COLUMN =3D 2,
> +};
> +
> +struct vpu_attr {
> +	u32 product_id;
> +	char product_name[8];
> +	u32 product_version;
> +	u32 fw_version;
> +	u32 fw_revision;
> +	u32 support_decoders;
> +	u32 support_encoders;
> +	u32 support_bitstream_mode;
> +	bool support_avc10bit_enc;
> +	bool support_hevc10bit_enc;
> +	bool support_dual_core;
> +};
> +
> +struct frame_buffer {
> +	dma_addr_t buf_y;
> +	dma_addr_t buf_cb;
> +	dma_addr_t buf_cr;
> +	enum tiled_map_type map_type;
> +	unsigned int stride;
> +	unsigned int width;
> +	unsigned int height;
> +	int index;
> +	u32 luma_bitdepth: 4;
> +	u32 chroma_bitdepth: 4;
> +	u32 chroma_format_idc: 2;
> +};
> +
> +struct vpu_rect {
> +	u32 left;
> +	u32 top;
> +	u32 right;
> +	u32 bottom;
> +};
> +
> +struct timestamp_info {
> +	u32 hour;
> +	u32 min;
> +	u32 sec;
> +	u32 ms;
> +};
> +
> +struct sar_info {
> +	u32 enable;
> +	u32 idc;
> +	u32 width;
> +	u32 height;
> +};
> +
> +struct aux_buffer {
> +	int index;
> +	int size;
> +	dma_addr_t addr;
> +};
> +
> +struct aux_buffer_info {
> +	int num;
> +	struct aux_buffer *buf_array;
> +	enum aux_buffer_type type;
> +};
> +
> +struct instance_buffer {
> +	dma_addr_t temp_base;
> +	u32 temp_size;
> +	dma_addr_t ar_base;
> +};
> +
> +struct report_cycle {
> +	u32 host_cmd_s;
> +	u32 host_cmd_e;
> +	u32 proc_s;
> +	u32 proc_e;
> +	u32 vpu_s;
> +	u32 vpu_e;
> +	u32 frame_cycle;
> +	u32 proc_cycle;
> +	u32 vpu_cycle;
> +};
> +
> +struct color_param {
> +	u32 chroma_sample_position;
> +	u32 color_range;
> +	u32 matrix_coefficients;
> +	u32 transfer_characteristics;
> +	u32 color_primaries;
> +	bool color_description_present;
> +	bool video_signal_type_present;
> +};
> +
> +struct sec_axi_info {
> +	bool use_dec_ip;
> +	bool use_dec_lf_row;
> +	bool use_enc_rdo;
> +	bool use_enc_lf;
> +};
> +
> +struct dec_aux_buffer_size_info {
> +	int width;
> +	int height;
> +	enum aux_buffer_type type;
> +};
> +
> +struct dec_scaler_info {
> +	bool enable;
> +	int width;
> +	int height;
> +	u32 scale_mode;
> +};
> +
> +struct dec_open_param {
> +	enum cb_cr_order cbcr_order;
> +	enum endian_mode frame_endian;
> +	enum endian_mode stream_endian;
> +	enum bitstream_mode bs_mode;
> +	enum display_mode disp_mode;
> +	bool enable_non_ref_fbc_write;
> +	u32 ext_addr_vcpu: 8;
> +	bool is_secure_inst;
> +	u32 inst_priority: 5;
> +	struct instance_buffer inst_buffer;
> +};
> +
> +struct dec_initial_info {
> +	u32 pic_width;
> +	u32 pic_height;
> +	u32 f_rate_numerator;
> +	u32 f_rate_denominator;
> +	struct vpu_rect pic_crop_rect;
> +	u32 min_frame_buffer_count;
> +	u32 req_mv_buffer_count;
> +	u32 frame_buf_delay;
> +	u32 profile;
> +	u32 level;
> +	u32 tier;
> +	bool is_ext_sar;
> +	u32 aspect_rate_info;
> +	u32 bitrate;
> +	u32 chroma_format_idc;
> +	u32 luma_bitdepth;
> +	u32 chroma_bitdepth;
> +	u32 err_reason;
> +	int warn_info;
> +	dma_addr_t rd_ptr;
> +	dma_addr_t wr_ptr;
> +	unsigned int sequence_no;
> +	struct color_param color;
> +};
> +
> +#define WAVE_SKIPMODE_WAVE_NONE 0
> +#define WAVE_SKIPMODE_NON_IRAP 1
> +#define WAVE_SKIPMODE_NON_REF 2
> +
> +struct dec_param {
> +	int skipframe_mode;
> +	bool decode_cra_as_bla;
> +	bool disable_film_grain;
> +	struct timestamp_info timestamp;
> +};
> +
> +struct h265_rp_sei {
> +	unsigned int exist;
> +	int recovery_poc_cnt;
> +	bool exact_match;
> +	bool broken_link;
> +};
> +
> +struct dec_output_info {
> +	int nal_type;
> +	int pic_type;
> +	int num_of_err_m_bs;
> +	int num_of_tot_m_bs;
> +	int num_of_err_m_bs_in_disp;
> +	int num_of_tot_m_bs_in_disp;
> +	int disp_pic_width;
> +	int disp_pic_height;
> +	int dec_pic_width;
> +	int dec_pic_height;
> +	int decoded_poc;
> +	int display_poc;
> +	struct h265_rp_sei h265_rp_sei;
> +	dma_addr_t rd_ptr;
> +	dma_addr_t wr_ptr;
> +	dma_addr_t byte_pos_frame_start;
> +	dma_addr_t byte_pos_frame_end;
> +	dma_addr_t frame_decoded_addr;
> +	dma_addr_t frame_display_addr;
> +	int error_reason;
> +	int warn_info;
> +	unsigned int sequence_no;
> +	struct report_cycle cycle;
> +	dma_addr_t release_disp_frame_addr[WAVE6_MAX_FBS];
> +	dma_addr_t disp_frame_addr[WAVE6_MAX_FBS];
> +	struct timestamp_info timestamp;
> +	u32 notification_flags;
> +	u32 release_disp_frame_num: 5;
> +	u32 disp_frame_num: 5;
> +	u32 ctu_size: 2;
> +	bool frame_display;
> +	bool frame_decoded;
> +	bool stream_end;
> +	bool last_frame_in_au;
> +	bool decoding_success;
> +};
> +
> +struct dec_info {
> +	struct dec_open_param open_param;
> +	struct dec_initial_info initial_info;
> +	dma_addr_t stream_wr_ptr;
> +	dma_addr_t stream_rd_ptr;
> +	bool stream_end;
> +	struct vpu_buf vb_mv[WAVE6_MAX_FBS];
> +	struct vpu_buf vb_fbc_y_tbl[WAVE6_MAX_FBS];
> +	struct vpu_buf vb_fbc_c_tbl[WAVE6_MAX_FBS];
> +	struct frame_buffer disp_buf[WAVE6_MAX_FBS];
> +	int stride;
> +	bool initial_info_obtained;
> +	struct sec_axi_info sec_axi_info;
> +	struct dec_output_info dec_out_info[WAVE6_MAX_FBS];
> +	int seq_change_mask;
> +	u32 cycle_per_tick;
> +	enum frame_buffer_format wtl_format;
> +};
> +
> +#define MAX_CUSTOM_LAMBDA_NUM 52
> +#define MAX_NUM_TEMPORAL_LAYER 7
> +#define MAX_GOP_NUM 8
> +#define MAX_NUM_CHANGEABLE_TEMPORAL_LAYER 4
> +
> +struct custom_gop_pic_param {
> +	int pic_type;
> +	int poc_offset;
> +	int pic_qp;
> +	int use_multi_ref_p;
> +	int ref_poc_l0;
> +	int ref_poc_l1;
> +	int temporal_id;
> +};
> +
> +struct custom_gop_param {
> +	int custom_gop_size;
> +	struct custom_gop_pic_param pic_param[MAX_GOP_NUM];
> +};
> +
> +struct temporal_layer_param {
> +	bool change_qp;
> +	u32 qp_i;
> +	u32 qp_p;
> +	u32 qp_b;
> +};
> +
> +struct enc_aux_buffer_size_info {
> +	int width;
> +	int height;
> +	enum aux_buffer_type type;
> +	enum mirror_direction mirror_direction;
> +	int rotation_angle;
> +};
> +
> +struct enc_scaler_info {
> +	bool enable;
> +	int width;
> +	int height;
> +	int coef_mode;
> +};
> +
> +struct enc_codec_param {
> +	u32 internal_bit_depth;
> +	u32 decoding_refresh_type;
> +	u32 idr_period;
> +	u32 intra_period;
> +	u32 gop_preset_idx;
> +	u32 frame_rate;
> +	u32 bitrate;
> +	u32 cpb_size;
> +	u32 hvs_qp_scale_div2;
> +	u32 max_delta_qp;
> +	int rc_initial_qp;
> +	u32 rc_update_speed;
> +	u32 max_bitrate;
> +	u32 rc_mode;
> +	u32 rc_initial_level;
> +	u32 pic_rc_max_dqp;
> +	u32 bg_th_diff;
> +	u32 bg_th_mean_diff;
> +	int bg_delta_qp;
> +	u32 intra_refresh_mode;
> +	u32 intra_refresh_arg;
> +	int beta_offset_div2;
> +	int tc_offset_div2;
> +	u32 qp;
> +	u32 min_qp_i;
> +	u32 max_qp_i;
> +	u32 min_qp_p;
> +	u32 max_qp_p;
> +	u32 min_qp_b;
> +	u32 max_qp_b;
> +	int cb_qp_offset;
> +	int cr_qp_offset;
> +	u32 q_round_intra;
> +	u32 q_round_inter;
> +	int lambda_dqp_intra;
> +	int lambda_dqp_inter;
> +	u32 slice_mode;
> +	u32 slice_arg;
> +	u32 level;
> +	u32 tier;
> +	u32 profile;
> +	struct vpu_rect conf_win;
> +	u32 forced_idr_header;
> +	u16 custom_lambda_ssd[MAX_CUSTOM_LAMBDA_NUM];
> +	u16 custom_lambda_sad[MAX_CUSTOM_LAMBDA_NUM];
> +	struct custom_gop_param gop_param;
> +	struct temporal_layer_param temp_layer[MAX_NUM_CHANGEABLE_TEMPORAL_LAYE=
R];
> +	u32 temp_layer_cnt;
> +	u32 report_mv_histo_threshold0;
> +	u32 report_mv_histo_threshold1;
> +	u32 report_mv_histo_threshold2;
> +	u32 report_mv_histo_threshold3;
> +	enum endian_mode custom_map_endian;
> +	u32 num_units_in_tick;
> +	u32 time_scale;
> +	u32 num_ticks_poc_diff_one;
> +	struct color_param color;
> +	struct sar_info sar;
> +	u32 max_intra_pic_bit;
> +	u32 max_inter_pic_bit;
> +	u32 intra_4x4;
> +
> +	u32 en_constrained_intra_pred: 1;
> +	u32 en_long_term: 1;
> +	u32 en_intra_trans_skip: 1;
> +	u32 en_me_center: 1;
> +	u32 en_rate_control: 1;
> +	u32 en_transform8x8: 1;
> +	u32 en_hvs_qp: 1;
> +	u32 en_bg_detect: 1;
> +	u32 en_temporal_mvp: 1;
> +	u32 en_cabac: 1;
> +	u32 en_dbk: 1;
> +	u32 en_sao: 1;
> +	u32 en_lf_cross_slice_boundary: 1;
> +	u32 en_scaling_list: 1;
> +	u32 en_adaptive_round: 1;
> +	u32 en_qp_map: 1;
> +	u32 en_mode_map: 1;
> +	u32 en_q_round_offset: 1;
> +	u32 en_still_picture: 1;
> +	u32 en_strong_intra_smoothing: 1;
> +	u32 en_custom_lambda: 1;
> +	u32 en_report_mv_histo: 1;
> +	u32 dis_coef_clear: 1;
> +	u32 en_cu_level_rate_control: 1;
> +	u32 en_vbv_overflow_drop_frame: 1;
> +	u32 en_auto_level_adjusting: 1;
> +};
> +
> +struct enc_open_param {
> +	int pic_width;
> +	int pic_height;
> +	struct enc_codec_param codec_param;
> +	enum cb_cr_order cbcr_order;
> +	enum endian_mode stream_endian;
> +	enum endian_mode source_endian;
> +	bool line_buf_int_en;
> +	enum packed_format_num packed_format;
> +	enum frame_buffer_format src_format;
> +	enum frame_buffer_format output_format;
> +	bool enable_non_ref_fbc_write;
> +	bool enc_hrd_rbsp_in_vps;
> +	u32 hrd_rbsp_data_size;
> +	dma_addr_t hrd_rbsp_data_addr;
> +	u32 ext_addr_vcpu: 8;
> +	bool is_secure_inst;
> +	u32 inst_priority: 5;
> +	struct instance_buffer inst_buffer;
> +	bool enc_aud;
> +};
> +
> +struct enc_initial_info {
> +	u32 min_frame_buffer_count;
> +	u32 min_src_frame_count;
> +	u32 req_mv_buffer_count;
> +	int max_latency_pictures;
> +	int err_reason;
> +	int warn_info;
> +};
> +
> +struct enc_csc_param {
> +	u32 format_order;
> +	u32 coef_ry;
> +	u32 coef_gy;
> +	u32 coef_by;
> +	u32 coef_rcb;
> +	u32 coef_gcb;
> +	u32 coef_bcb;
> +	u32 coef_rcr;
> +	u32 coef_gcr;
> +	u32 coef_bcr;
> +	u32 offset_y;
> +	u32 offset_cb;
> +	u32 offset_cr;
> +};
> +
> +struct enc_param {
> +	struct frame_buffer *source_frame;
> +	bool skip_picture;
> +	dma_addr_t pic_stream_buffer_addr;
> +	int pic_stream_buffer_size;
> +	bool force_pic_qp_enable;
> +	int force_pic_qp_i;
> +	int force_pic_qp_p;
> +	int force_pic_qp_b;
> +	bool force_pic_type_enable;
> +	int force_pic_type;
> +	int src_idx;
> +	bool src_end;
> +	u32 bitrate;
> +	struct enc_csc_param csc;
> +	struct timestamp_info timestamp;
> +};
> +
> +struct enc_report_fme_sum {
> +	u32 lower_x0;
> +	u32 higher_x0;
> +	u32 lower_y0;
> +	u32 higher_y0;
> +	u32 lower_x1;
> +	u32 higher_x1;
> +	u32 lower_y1;
> +	u32 higher_y1;
> +};
> +
> +struct enc_report_mv_histo {
> +	u32 cnt0;
> +	u32 cnt1;
> +	u32 cnt2;
> +	u32 cnt3;
> +	u32 cnt4;
> +};
> +
> +struct enc_output_info {
> +	dma_addr_t bitstream_buffer;
> +	u32 bitstream_size;
> +	int bitstream_wrap_around;
> +	int pic_type;
> +	int num_of_slices;
> +	int recon_frame_index;
> +	struct frame_buffer recon_frame;
> +	dma_addr_t rd_ptr;
> +	dma_addr_t wr_ptr;
> +	int pic_skipped;
> +	int num_of_intra;
> +	int num_of_merge;
> +	int num_of_skip_block;
> +	int avg_ctu_qp;
> +	int enc_pic_byte;
> +	int enc_gop_pic_idx;
> +	int enc_pic_poc;
> +	int enc_src_idx;
> +	int enc_vcl_nut;
> +	int enc_pic_cnt;
> +	int error_reason;
> +	int warn_info;
> +	u32 pic_distortion_low;
> +	u32 pic_distortion_high;
> +	bool non_ref_pic;
> +	bool encoding_success;
> +	struct enc_report_fme_sum fme_sum;
> +	struct enc_report_mv_histo mv_histo;
> +	struct report_cycle cycle;
> +	struct timestamp_info timestamp;
> +	dma_addr_t src_y_addr;
> +	dma_addr_t custom_map_addr;
> +	dma_addr_t prefix_sei_nal_addr;
> +	dma_addr_t suffix_sei_nal_addr;
> +};
> +
> +enum gop_preset_idx {
> +	PRESET_IDX_CUSTOM_GOP =3D 0,
> +	PRESET_IDX_ALL_I =3D 1,
> +	PRESET_IDX_IPP =3D 2,
> +	PRESET_IDX_IBBB =3D 3,
> +	PRESET_IDX_IBPBP =3D 4,
> +	PRESET_IDX_IBBBP =3D 5,
> +	PRESET_IDX_IPPPP =3D 6,
> +	PRESET_IDX_IBBBB =3D 7,
> +	PRESET_IDX_RA_IB =3D 8,
> +	PRESET_IDX_IPP_SINGLE =3D 9,
> +	PRESET_IDX_MAX,
> +};
> +
> +struct enc_info {
> +	struct enc_open_param open_param;
> +	struct enc_initial_info initial_info;
> +	int num_frame_buffers;
> +	int stride;
> +	bool rotation_enable;
> +	bool mirror_enable;
> +	enum mirror_direction mirror_direction;
> +	int rotation_angle;
> +	bool initial_info_obtained;
> +	struct sec_axi_info sec_axi_info;
> +	bool line_buf_int_en;
> +	struct vpu_buf vb_mv[WAVE6_MAX_FBS];
> +	struct vpu_buf vb_fbc_y_tbl[WAVE6_MAX_FBS];
> +	struct vpu_buf vb_fbc_c_tbl[WAVE6_MAX_FBS];
> +	struct vpu_buf vb_sub_sam_buf[WAVE6_MAX_FBS];
> +	u32 cycle_per_tick;
> +	u32 width;
> +	u32 height;
> +	struct enc_scaler_info scaler_info;
> +	int color_format;
> +};
> +
> +struct h264_enc_controls {
> +	u32 profile;
> +	u32 level;
> +	u32 min_qp;
> +	u32 max_qp;
> +	u32 i_frame_qp;
> +	u32 p_frame_qp;
> +	u32 b_frame_qp;
> +	u32 loop_filter_mode;
> +	u32 loop_filter_beta;
> +	u32 loop_filter_alpha;
> +	u32 _8x8_transform;
> +	u32 constrained_intra_prediction;
> +	u32 chroma_qp_index_offset;
> +	u32 entropy_mode;
> +	u32 i_period;
> +	u32 vui_sar_enable;
> +	u32 vui_sar_idc;
> +	u32 vui_ext_sar_width;
> +	u32 vui_ext_sar_height;
> +	u32 cpb_size;
> +};
> +
> +struct hevc_enc_controls {
> +	u32 profile;
> +	u32 level;
> +	u32 min_qp;
> +	u32 max_qp;
> +	u32 i_frame_qp;
> +	u32 p_frame_qp;
> +	u32 b_frame_qp;
> +	u32 loop_filter_mode;
> +	u32 lf_beta_offset_div2;
> +	u32 lf_tc_offset_div2;
> +	u32 refresh_type;
> +	u32 refresh_period;
> +	u32 const_intra_pred;
> +	u32 strong_smoothing;
> +	u32 tmv_prediction;
> +};
> +
> +struct enc_controls {
> +	u32 rot_angle;
> +	u32 mirror_direction;
> +	u32 bitrate;
> +	u32 bitrate_mode;
> +	u32 gop_size;
> +	u32 frame_rc_enable;
> +	u32 mb_rc_enable;
> +	u32 slice_mode;
> +	u32 slice_max_mb;
> +	u32 prepend_spspps_to_idr;
> +	u32 intra_refresh_period;
> +	struct h264_enc_controls h264;
> +	struct hevc_enc_controls hevc;
> +	u32 force_key_frame;
> +	u32 frame_skip_mode;
> +};
> +
> +struct vpu_core_device {
> +	struct device *dev;
> +	struct v4l2_device v4l2_dev;
> +	struct v4l2_m2m_dev *m2m_dev;
> +	struct video_device *video_dev_dec;
> +	struct video_device *video_dev_enc;
> +	struct mutex dev_lock; /* the lock for the src,dst v4l2 queues */
> +	struct mutex hw_lock; /* the lock hw configurations */
> +	int irq;
> +	u32 fw_version;
> +	u32 fw_revision;
> +	u32 hw_version;
> +	struct vpu_attr	attr;
> +	u32 last_performance_cycles;
> +	void __iomem *reg_base;
> +	int product_code;
> +	struct vpu_buf temp_vbuf;
> +	struct clk_bulk_data *clks;
> +	int num_clks;
> +	struct completion irq_done;
> +	struct kfifo irq_status;
> +	struct delayed_work task_timer;
> +	struct wave6_vpu_entity entity;
> +	int pause_request;
> +	struct mutex pause_lock; /* the lock for the pause/resume m2m job. */
> +	const struct wave6_match_data *res;
> +	struct dentry *debugfs;
> +};
> +
> +struct vpu_instance;
> +
> +struct vpu_instance_ops {
> +	int (*start_process)(struct vpu_instance *inst);
> +	void (*finish_process)(struct vpu_instance *inst, bool error);
> +};
> +
> +struct vpu_performance_info {
> +	ktime_t ts_first;
> +	ktime_t ts_last;
> +	s64 latency_first;
> +	s64 latency_max;
> +	s64 min_process_time;
> +	s64 max_process_time;
> +	u64 total_sw_time;
> +	u64 total_hw_time;
> +};
> +
> +struct vpu_instance {
> +	struct v4l2_fh v4l2_fh;
> +	struct v4l2_ctrl_handler v4l2_ctrl_hdl;
> +	struct vpu_core_device *dev;
> +
> +	struct v4l2_pix_format_mplane src_fmt;
> +	struct v4l2_pix_format_mplane dst_fmt;
> +	struct v4l2_rect crop;
> +	struct v4l2_rect codec_rect;
> +	enum v4l2_colorspace colorspace;
> +	enum v4l2_xfer_func xfer_func;
> +	enum v4l2_ycbcr_encoding ycbcr_enc;
> +	enum v4l2_quantization quantization;
> +
> +	enum vpu_instance_state state;
> +	enum vpu_instance_state state_in_seek;
> +	enum vpu_instance_type type;
> +	const struct vpu_instance_ops *ops;
> +
> +	enum codec_std std;
> +	u32 id;
> +	union {
> +		struct enc_info enc_info;
> +		struct dec_info dec_info;
> +	} *codec_info;
> +	struct frame_buffer frame_buf[WAVE6_MAX_FBS];
> +	struct vpu_buf frame_vbuf[WAVE6_MAX_FBS];
> +	u32 queued_src_buf_num;
> +	u32 queued_dst_buf_num;
> +	u32 processed_buf_num;
> +	u32 error_buf_num;
> +	u32 sequence;
> +	bool next_buf_last;
> +	bool cbcr_interleave;
> +	bool nv21;
> +	bool eos;
> +
> +	struct vpu_buf aux_vbuf[AUX_BUF_TYPE_MAX][WAVE6_MAX_FBS];
> +	struct vpu_buf ar_vbuf;
> +	enum display_mode disp_mode;
> +
> +	unsigned int frame_rate;
> +	struct enc_controls enc_ctrls;
> +	struct dec_scaler_info scaler_info;
> +	bool error_recovery;
> +
> +	struct vpu_performance_info performance;
> +
> +	struct dentry *debugfs;
> +};
> +
> +void wave6_vdi_writel(struct vpu_core_device *vpu_dev, unsigned int addr=
, unsigned int data);
> +unsigned int wave6_vdi_readl(struct vpu_core_device *vpu_dev, unsigned i=
nt addr);
> +unsigned int wave6_vdi_convert_endian(unsigned int endian);
> +
> +int wave6_vpu_dec_open(struct vpu_instance *inst, struct dec_open_param =
*pop);
> +int wave6_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res);
> +int wave6_vpu_dec_issue_seq_init(struct vpu_instance *inst);
> +int wave6_vpu_dec_complete_seq_init(struct vpu_instance *inst, struct de=
c_initial_info *info);
> +int wave6_vpu_dec_get_aux_buffer_size(struct vpu_instance *inst,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dec_aux_buffer_size_info info,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t *size);
> +int wave6_vpu_dec_register_aux_buffer(struct vpu_instance *inst, struct =
aux_buffer_info info);
> +int wave6_vpu_dec_register_frame_buffer_ex(struct vpu_instance *inst, in=
t num_of_dec_fbs,
> +					=C2=A0=C2=A0 int stride, int height, int map_type);
> +int wave6_vpu_dec_register_display_buffer_ex(struct vpu_instance *inst, =
struct frame_buffer fb);
> +int wave6_vpu_dec_start_one_frame(struct vpu_instance *inst, struct dec_=
param *param,
> +				=C2=A0 u32 *res_fail);
> +int wave6_vpu_dec_get_output_info(struct vpu_instance *inst, struct dec_=
output_info *info);
> +int wave6_vpu_dec_set_rd_ptr(struct vpu_instance *inst, dma_addr_t addr,=
 bool update_wr_ptr);
> +int wave6_vpu_dec_give_command(struct vpu_instance *inst, enum codec_com=
mand cmd, void *parameter);
> +int wave6_vpu_dec_get_bitstream_buffer(struct vpu_instance *inst, dma_ad=
dr_t *p_rd_ptr,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_addr_t *p_wr_ptr);
> +int wave6_vpu_dec_update_bitstream_buffer(struct vpu_instance *inst, int=
 size);
> +int wave6_vpu_dec_flush_instance(struct vpu_instance *inst);
> +
> +int wave6_vpu_enc_open(struct vpu_instance *inst, struct enc_open_param =
*enc_op_param);
> +int wave6_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res);
> +int wave6_vpu_enc_issue_seq_init(struct vpu_instance *inst);
> +int wave6_vpu_enc_issue_seq_change(struct vpu_instance *inst, bool *chan=
ged);
> +int wave6_vpu_enc_complete_seq_init(struct vpu_instance *inst, struct en=
c_initial_info *info);
> +int wave6_vpu_enc_get_aux_buffer_size(struct vpu_instance *inst,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct enc_aux_buffer_size_info info,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t *size);
> +int wave6_vpu_enc_register_aux_buffer(struct vpu_instance *inst, struct =
aux_buffer_info info);
> +int wave6_vpu_enc_register_frame_buffer_ex(struct vpu_instance *inst, in=
t num, unsigned int stride,
> +					=C2=A0=C2=A0 int height, enum tiled_map_type map_type);
> +int wave6_vpu_enc_start_one_frame(struct vpu_instance *inst, struct enc_=
param *param,
> +				=C2=A0 u32 *fail_res);
> +int wave6_vpu_enc_get_output_info(struct vpu_instance *inst, struct enc_=
output_info *info);
> +int wave6_vpu_enc_give_command(struct vpu_instance *inst, enum codec_com=
mand cmd, void *parameter);
> +
> +#endif /* __WAVE6_VPUAPI_H__ */
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuerror.h b/=
drivers/media/platform/chips-
> media/wave6/wave6-vpuerror.h
> new file mode 100644
> index 000000000000..8bf2e1e9522d
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpuerror.h
> @@ -0,0 +1,262 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
> +/*
> + * Wave6 series multi-standard codec IP - wave6 vpu error values
> + *
> + * Copyright (C) 2025 CHIPS&MEDIA INC
> + */
> +
> +#ifndef __WAVE6_VPUERROR_H__
> +#define __WAVE6_VPUERROR_H__
> +
> +/* WAVE6 COMMON SYSTEM ERROR (FAIL_REASON) */
> +#define WAVE6_SYSERR_QUEUEING_FAIL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000001
> +#define WAVE6_SYSERR_DECODER_FUSE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000002
> +#define WAVE6_SYSERR_INSTRUCTION_ACCESS_VIOLATION=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000004
> +#define WAVE6_SYSERR_PRIVILEDGE_VIOLATION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x000=
00008
> +#define WAVE6_SYSERR_DATA_ADDR_ALIGNMENT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x00000010
> +#define WAVE6_SYSERR_DATA_ACCESS_VIOLATION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000020
> +#define WAVE6_SYSERR_ACCESS_VIOLATION_HW=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x00000040
> +#define WAVE6_SYSERR_INSTRUCTION_ADDR_ALIGNMENT=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000080
> +#define WAVE6_SYSERR_UNKNOWN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000100
> +#define WAVE6_SYSERR_BUS_ERROR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000200
> +#define WAVE6_SYSERR_DOUBLE_FAULT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000400
> +#define WAVE6_SYSERR_RESULT_NOT_READY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0x00000800
> +#define WAVE6_SYSERR_VPU_STILL_RUNNING=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x00001000
> +#define WAVE6_SYSERR_UNKNOWN_CMD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00002000
> +#define WAVE6_SYSERR_UNKNOWN_CODEC_STD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x00004000
> +#define WAVE6_SYSERR_UNKNOWN_QUERY_OPTION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x000=
08000
> +#define WAVE6_SYSERR_WATCHDOG_TIMEOUT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0x00020000
> +#define WAVE6_SYSERR_NOT_SUPPORT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00100000
> +#define WAVE6_SYSERR_TEMP_SEC_BUF_OVERFLOW=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00200000
> +#define WAVE6_SYSERR_NOT_SUPPORT_PROFILE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x00400000
> +#define WAVE6_SYSERR_TIMEOUT_CODEC_FW=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0x40000000
> +#define WAVE6_SYSERR_FATAL_VPU_HANGUP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0xf0000000
> +
> +/* WAVE6 COMMAND QUEUE ERROR (FAIL_REASON) */
> +#define WAVE6_CMDQ_ERR_NOT_QUEABLE_CMD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x00000001
> +#define WAVE6_CMDQ_ERR_SKIP_MODE_ENABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x00000002
> +#define WAVE6_CMDQ_ERR_INST_FLUSHING=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x00000003
> +#define WAVE6_CMDQ_ERR_INST_INACTIVE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x00000004
> +#define WAVE6_CMDQ_ERR_QUEUE_FAIL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000005
> +#define WAVE6_CMDQ_ERR_CMD_BUF_FULL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x00000006
> +
> +/* WAVE6 ERROR ON DECODER (ERR_INFO) */
> +#define HEVC_SPSERR_SEQ_PARAMETER_SET_ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x00001000
> +#define HEVC_SPSERR_CHROMA_FORMAT_IDC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0x00001001
> +#define HEVC_SPSERR_PIC_WIDTH_IN_LUMA_SAMPLES=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00001002
> +#define HEVC_SPSERR_PIC_HEIGHT_IN_LUMA_SAMPLES=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00001003
> +#define HEVC_SPSERR_CONF_WIN_LEFT_OFFSET=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x00001004
> +#define HEVC_SPSERR_CONF_WIN_RIGHT_OFFSET=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x000=
01005
> +#define HEVC_SPSERR_CONF_WIN_TOP_OFFSET=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x00001006
> +#define HEVC_SPSERR_CONF_WIN_BOTTOM_OFFSET=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00001007
> +#define HEVC_SPSERR_BIT_DEPTH_LUMA_MINUS8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x000=
01008
> +#define HEVC_SPSERR_BIT_DEPTH_CHROMA_MINUS8=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00001009
> +#define HEVC_SPSERR_LOG2_MAX_PIC_ORDER_CNT_LSB_MINUS4=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x0000100A
> +#define HEVC_SPSERR_SPS_MAX_DEC_PIC_BUFFERING=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0000100B
> +#define HEVC_SPSERR_SPS_MAX_NUM_REORDER_PICS=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0000100C
> +#define HEVC_SPSERR_SPS_MAX_LATENCY_INCREASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0000100D
> +#define HEVC_SPSERR_LOG2_MIN_LUMA_CODING_BLOCK_SIZE_MINUS3=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0000100E
> +#define HEVC_SPSERR_LOG2_DIFF_MAX_MIN_LUMA_CODING_BLOCK_SIZE=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0000100F
> +#define HEVC_SPSERR_LOG2_MIN_TRANSFORM_BLOCK_SIZE_MINUS2=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x000=
01010
> +#define HEVC_SPSERR_LOG2_DIFF_MAX_MIN_TRANSFORM_BLOCK_SIZE=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00001011
> +#define HEVC_SPSERR_MAX_TRANSFORM_HIERARCHY_DEPTH_INTER=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x00001012
> +#define HEVC_SPSERR_MAX_TRANSFORM_HIERARCHY_DEPTH_INTRA=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x00001013
> +#define HEVC_SPSERR_SCALING_LIST=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00001014
> +#define HEVC_SPSERR_LOG2_DIFF_MIN_PCM_LUMA_CODING_BLOCK_SIZE_MINUS3=C2=
=A0=C2=A0=C2=A0 0x00001015
> +#define HEVC_SPSERR_LOG2_DIFF_MAX_MIN_PCM_LUMA_CODING_BLOCK_SIZE=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00001016
> +#define HEVC_SPSERR_NUM_SHORT_TERM_REF_PIC_SETS=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00001017
> +#define HEVC_SPSERR_NUM_LONG_TERM_REF_PICS_SPS=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00001018
> +#define HEVC_SPSERR_GBU_PARSING_ERROR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0x00001019
> +#define HEVC_SPSERR_EXTENSION_FLAG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0000101A
> +#define HEVC_SPSERR_VUI_ERROR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0000101B
> +#define HEVC_SPSERR_ACTIVATE_SPS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0000101C
> +#define HEVC_SPSERR_PROFILE_SPACE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0000101D
> +#define HEVC_PPSERR_PPS_PIC_PARAMETER_SET_ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00002000
> +#define HEVC_PPSERR_PPS_SEQ_PARAMETER_SET_ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00002001
> +#define HEVC_PPSERR_NUM_REF_IDX_L0_DEFAULT_ACTIVE_MINUS1=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x000=
02002
> +#define HEVC_PPSERR_NUM_REF_IDX_L1_DEFAULT_ACTIVE_MINUS1=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x000=
02003
> +#define HEVC_PPSERR_INIT_QP_MINUS26=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x00002004
> +#define HEVC_PPSERR_DIFF_CU_QP_DELTA_DEPTH=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00002005
> +#define HEVC_PPSERR_PPS_CB_QP_OFFSET=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x00002006
> +#define HEVC_PPSERR_PPS_CR_QP_OFFSET=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x00002007
> +#define HEVC_PPSERR_NUM_TILE_COLUMNS_MINUS1=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00002008
> +#define HEVC_PPSERR_NUM_TILE_ROWS_MINUS1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x00002009
> +#define HEVC_PPSERR_COLUMN_WIDTH_MINUS1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x0000200A
> +#define HEVC_PPSERR_ROW_HEIGHT_MINUS1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0x0000200B
> +#define HEVC_PPSERR_PPS_BETA_OFFSET_DIV2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x0000200C
> +#define HEVC_PPSERR_PPS_TC_OFFSET_DIV2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x0000200D
> +#define HEVC_PPSERR_SCALING_LIST=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0000200E
> +#define HEVC_PPSERR_LOG2_PARALLEL_MERGE_LEVEL_MINUS2=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0x0000200F
> +#define HEVC_PPSERR_NUM_TILE_COLUMNS_RANGE_OUT=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00002010
> +#define HEVC_PPSERR_NUM_TILE_ROWS_RANGE_OUT=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00002011
> +#define HEVC_PPSERR_MORE_RBSP_DATA_ERROR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x00002012
> +#define HEVC_PPSERR_PPS_PIC_PARAMETER_SET_ID_RANGE_OUT=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x00002013
> +#define HEVC_PPSERR_PPS_SEQ_PARAMETER_SET_ID_RANGE_OUT=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x00002014
> +#define HEVC_PPSERR_NUM_REF_IDX_L0_DEFAULT_ACTIVE_MINUS1_RANGE_OUT=C2=A0=
=C2=A0=C2=A0=C2=A0 0x00002015
> +#define HEVC_PPSERR_NUM_REF_IDX_L1_DEFAULT_ACTIVE_MINUS1_RANGE_OUT=C2=A0=
=C2=A0=C2=A0=C2=A0 0x00002016
> +#define HEVC_PPSERR_PPS_CB_QP_OFFSET_RANGE_OUT=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00002017
> +#define HEVC_PPSERR_PPS_CR_QP_OFFSET_RANGE_OUT=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00002018
> +#define HEVC_PPSERR_COLUMN_WIDTH_MINUS1_RANGE_OUT=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00002019
> +#define HEVC_PPSERR_ROW_HEIGHT_MINUS1_RANGE_OUT=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00002020
> +#define HEVC_PPSERR_PPS_BETA_OFFSET_DIV2_RANGE_OUT=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x00002021
> +#define HEVC_PPSERR_PPS_TC_OFFSET_DIV2_RANGE_OUT=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00002022
> +#define HEVC_SHERR_SLICE_PIC_PARAMETER_SET_ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00003000
> +#define HEVC_SHERR_ACTIVATE_PPS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00003001
> +#define HEVC_SHERR_ACTIVATE_SPS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00003002
> +#define HEVC_SHERR_SLICE_TYPE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00003003
> +#define HEVC_SHERR_FIRST_SLICE_IS_DEPENDENT_SLICE=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00003004
> +#define HEVC_SHERR_SHORT_TERM_REF_PIC_SET_SPS_FLAG=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x00003005
> +#define HEVC_SHERR_SHORT_TERM_REF_PIC_SET=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x000=
03006
> +#define HEVC_SHERR_SHORT_TERM_REF_PIC_SET_IDX=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00003007
> +#define HEVC_SHERR_NUM_LONG_TERM_SPS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x00003008
> +#define HEVC_SHERR_NUM_LONG_TERM_PICS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0x00003009
> +#define HEVC_SHERR_LT_IDX_SPS_IS_OUT_OF_RANGE=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0000300A
> +#define HEVC_SHERR_DELTA_POC_MSB_CYCLE_LT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x000=
0300B
> +#define HEVC_SHERR_NUM_REF_IDX_L0_ACTIVE_MINUS1=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0000300C
> +#define HEVC_SHERR_NUM_REF_IDX_L1_ACTIVE_MINUS1=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0000300D
> +#define HEVC_SHERR_COLLOCATED_REF_IDX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0x0000300E
> +#define HEVC_SHERR_PRED_WEIGHT_TABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x0000300F
> +#define HEVC_SHERR_FIVE_MINUS_MAX_NUM_MERGE_CAND=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00003010
> +#define HEVC_SHERR_SLICE_QP_DELTA=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00003011
> +#define HEVC_SHERR_SLICE_QP_DELTA_IS_OUT_OF_RANGE=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00003012
> +#define HEVC_SHERR_SLICE_CB_QP_OFFSET=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0x00003013
> +#define HEVC_SHERR_SLICE_CR_QP_OFFSET=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0x00003014
> +#define HEVC_SHERR_SLICE_BETA_OFFSET_DIV2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x000=
03015
> +#define HEVC_SHERR_SLICE_TC_OFFSET_DIV2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x00003016
> +#define HEVC_SHERR_NUM_ENTRY_POINT_OFFSETS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00003017
> +#define HEVC_SHERR_OFFSET_LEN_MINUS1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x00003018
> +#define HEVC_SHERR_SLICE_SEGMENT_HEADER_EXTENSION_LENGTH=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x000=
03019
> +#define HEVC_SHERR_WRONG_POC_IN_STILL_PICTURE_PROFILE=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x0000301A
> +#define HEVC_SHERR_SLICE_TYPE_ERROR_IN_STILL_PICTURE_PROFILE=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0000301B
> +#define HEVC_SHERR_PPS_ID_NOT_EQUAL_PREV_VALUE=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0000301C
> +#define HEVC_SPECERR_OVER_PICTURE_WIDTH_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00004000
> +#define HEVC_SPECERR_OVER_PICTURE_HEIGHT_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00004001
> +#define HEVC_SPECERR_OVER_CHROMA_FORMAT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x00004002
> +#define HEVC_SPECERR_OVER_BIT_DEPTH=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x00004003
> +#define HEVC_SPECERR_OVER_BUFFER_OVER_FLOW=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00004004
> +#define HEVC_SPECERR_OVER_WRONG_BUFFER_ACCESS=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00004005
> +#define HEVC_ETCERR_INIT_SEQ_SPS_NOT_FOUND=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00005000
> +#define HEVC_ETCERR_DEC_PIC_VCL_NOT_FOUND=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x000=
05001
> +#define HEVC_ETCERR_NO_VALID_SLICE_IN_AU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x00005002
> +#define HEVC_ETCERR_INPLACE_V=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0000500F
> +
> +#define AVC_SPSERR_SEQ_PARAMETER_SET_ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x00001000
> +#define AVC_SPSERR_CHROMA_FORMAT_IDC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x00001001
> +#define AVC_SPSERR_PIC_WIDTH_IN_LUMA_SAMPLES=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00001002
> +#define AVC_SPSERR_PIC_HEIGHT_IN_LUMA_SAMPLES=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00001003
> +#define AVC_SPSERR_CONF_WIN_LEFT_OFFSET=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x00001004
> +#define AVC_SPSERR_CONF_WIN_RIGHT_OFFSET=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x00001005
> +#define AVC_SPSERR_CONF_WIN_TOP_OFFSET=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x00001006
> +#define AVC_SPSERR_CONF_WIN_BOTTOM_OFFSET=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x000=
01007
> +#define AVC_SPSERR_BIT_DEPTH_LUMA_MINUS8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x00001008
> +#define AVC_SPSERR_BIT_DEPTH_CHROMA_MINUS8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00001009
> +#define AVC_SPSERR_SPS_MAX_DEC_PIC_BUFFERING=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0000100B
> +#define AVC_SPSERR_SPS_MAX_NUM_REORDER_PICS=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0000100C
> +#define AVC_SPSERR_SCALING_LIST=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00001014
> +#define AVC_SPSERR_GBU_PARSING_ERROR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x00001019
> +#define AVC_SPSERR_VUI_ERROR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0000101B
> +#define AVC_SPSERR_ACTIVATE_SPS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0000101C
> +#define AVC_PPSERR_PPS_PIC_PARAMETER_SET_ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00002000
> +#define AVC_PPSERR_PPS_SEQ_PARAMETER_SET_ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00002001
> +#define AVC_PPSERR_NUM_REF_IDX_L0_DEFAULT_ACTIVE_MINUS1=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x00002002
> +#define AVC_PPSERR_NUM_REF_IDX_L1_DEFAULT_ACTIVE_MINUS1=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x00002003
> +#define AVC_PPSERR_INIT_QP_MINUS26=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00002004
> +#define AVC_PPSERR_PPS_CB_QP_OFFSET=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x00002006
> +#define AVC_PPSERR_PPS_CR_QP_OFFSET=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x00002007
> +#define AVC_PPSERR_SCALING_LIST=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0000200E
> +#define AVC_PPSERR_MORE_RBSP_DATA_ERROR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x00002012
> +#define AVC_PPSERR_PPS_PIC_PARAMETER_SET_ID_RANGE_OUT=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x00002013
> +#define AVC_PPSERR_PPS_SEQ_PARAMETER_SET_ID_RANGE_OUT=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x00002014
> +#define AVC_PPSERR_NUM_REF_IDX_L0_DEFAULT_ACTIVE_MINUS1_RANGE_OUT=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x00002015
> +#define AVC_PPSERR_NUM_REF_IDX_L1_DEFAULT_ACTIVE_MINUS1_RANGE_OUT=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x00002016
> +#define AVC_PPSERR_PPS_CB_QP_OFFSET_RANGE_OUT=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00002017
> +#define AVC_PPSERR_PPS_CR_QP_OFFSET_RANGE_OUT=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00002018
> +#define AVC_SHERR_SLICE_PIC_PARAMETER_SET_ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00003000
> +#define AVC_SHERR_ACTIVATE_PPS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00003001
> +#define AVC_SHERR_ACTIVATE_SPS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00003002
> +#define AVC_SHERR_SLICE_TYPE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00003003
> +#define AVC_SHERR_FIRST_MB_IN_SLICE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x00003004
> +#define AVC_SHERR_RPLM=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0x00003006
> +#define AVC_SHERR_LT_IDX_SPS_IS_OUT_OF_RANGE=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0000300A
> +#define AVC_SHERR_NUM_REF_IDX_L0_ACTIVE_MINUS1=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0000300C
> +#define AVC_SHERR_NUM_REF_IDX_L1_ACTIVE_MINUS1=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0000300D
> +#define AVC_SHERR_PRED_WEIGHT_TABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x0000300F
> +#define AVC_SHERR_SLICE_QP_DELTA=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00003011
> +#define AVC_SHERR_SLICE_BETA_OFFSET_DIV2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x00003015
> +#define AVC_SHERR_SLICE_TC_OFFSET_DIV2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x00003016
> +#define AVC_SHERR_DISABLE_DEBLOCK_FILTER_IDC=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00003017
> +#define AVC_SPECERR_OVER_PICTURE_WIDTH_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00004000
> +#define AVC_SPECERR_OVER_PICTURE_HEIGHT_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00004001
> +#define AVC_SPECERR_OVER_CHROMA_FORMAT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x00004002
> +#define AVC_SPECERR_OVER_BIT_DEPTH=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00004003
> +#define AVC_SPECERR_OVER_BUFFER_OVER_FLOW=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x000=
04004
> +#define AVC_SPECERR_OVER_WRONG_BUFFER_ACCESS=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00004005
> +#define AVC_ETCERR_INIT_SEQ_SPS_NOT_FOUND=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x000=
05000
> +#define AVC_ETCERR_DEC_PIC_VCL_NOT_FOUND=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x00005001
> +#define AVC_ETCERR_NO_VALID_SLICE_IN_AU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x00005002
> +#define AVC_ETCERR_ASO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0x00005004
> +#define AVC_ETCERR_FMO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0x00005005
> +#define AVC_ETCERR_INPLACE_V=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0000500F
> +
> +/* WAVE6 WARNING ON DECODER (WARN_INFO) */
> +#define HEVC_SPSWARN_MAX_SUB_LAYERS_MINUS1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000001
> +#define HEVC_SPSWARN_GENERAL_RESERVED_ZERO_44BITS=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000002
> +#define HEVC_SPSWARN_RESERVED_ZERO_2BITS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x00000004
> +#define HEVC_SPSWARN_SUB_LAYER_RESERVED_ZERO_44BITS=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x00000008
> +#define HEVC_SPSWARN_GENERAL_LEVEL_IDC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x00000010
> +#define HEVC_SPSWARN_SPS_MAX_DEC_PIC_BUFFERING_VALUE_OVER=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000020
> +#define HEVC_SPSWARN_RBSP_TRAILING_BITS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x00000040
> +#define HEVC_SPSWARN_ST_RPS_UE_ERROR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x00000080
> +#define HEVC_SPSWARN_EXTENSION_FLAG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x01000000
> +#define HEVC_SPSWARN_REPLACED_WITH_PREV_SPS=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x02000000
> +#define HEVC_PPSWARN_RBSP_TRAILING_BITS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x00000100
> +#define HEVC_PPSWARN_REPLACED_WITH_PREV_PPS=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00000200
> +#define HEVC_SHWARN_FIRST_SLICE_SEGMENT_IN_PIC_FLAG=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x00001000
> +#define HEVC_SHWARN_NO_OUTPUT_OF_PRIOR_PICS_FLAG=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00002000
> +#define HEVC_SHWARN_PIC_OUTPUT_FLAG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x00004000
> +#define HEVC_SHWARN_DUPLICATED_SLICE_SEGMENT=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00008000
> +#define HEVC_ETCWARN_INIT_SEQ_VCL_NOT_FOUND=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00010000
> +#define HEVC_ETCWARN_MISSING_REFERENCE_PICTURE=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00020000
> +#define HEVC_ETCWARN_WRONG_TEMPORAL_ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x00040000
> +#define HEVC_ETCWARN_ERROR_PICTURE_IS_REFERENCED=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00080000
> +#define HEVC_SPECWARN_OVER_PROFILE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00100000
> +#define HEVC_SPECWARN_OVER_LEVEL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00200000
> +#define HEVC_PRESWARN_PARSING_ERR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x04000000
> +#define HEVC_PRESWARN_MVD_OUT_OF_RANGE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x08000000
> +#define HEVC_PRESWARN_CU_QP_DELTA_VAL_OUT_OF_RANGE=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x09000000
> +#define HEVC_PRESWARN_COEFF_LEVEL_REMAINING_OUT_OF_RANGE=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0A0=
00000
> +#define HEVC_PRESWARN_PCM_ERR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0B000000
> +#define HEVC_PRESWARN_OVERCONSUME=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0C000000
> +#define HEVC_PRESWARN_END_OF_SUBSET_ONE_BIT_ERR=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x10000000
> +#define HEVC_PRESWARN_END_OF_SLICE_SEGMENT_FLAG=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x20000000
> +
> +#define AVC_SPSWARN_RESERVED_ZERO_2BITS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x00000004
> +#define AVC_SPSWARN_GENERAL_LEVEL_IDC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0x00000010
> +#define AVC_SPSWARN_RBSP_TRAILING_BITS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x00000040
> +#define AVC_PPSWARN_RBSP_TRAILING_BITS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x00000100
> +#define AVC_SHWARN_NO_OUTPUT_OF_PRIOR_PICS_FLAG=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00002000
> +#define AVC_ETCWARN_INIT_SEQ_VCL_NOT_FOUND=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00010000
> +#define AVC_ETCWARN_MISSING_REFERENCE_PICTURE=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00020000
> +#define AVC_ETCWARN_ERROR_PICTURE_IS_REFERENCED=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00080000
> +#define AVC_SPECWARN_OVER_PROFILE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00100000
> +#define AVC_SPECWARN_OVER_LEVEL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00200000
> +#define AVC_PRESWARN_MVD_RANGE_OUT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00400000
> +#define AVC_PRESWARN_MB_QPD_RANGE_OUT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0x00500000
> +#define AVC_PRESWARN_COEFF_RANGE_OUT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x00600000
> +#define AVC_PRESWARN_MV_RANGE_OUT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00700000
> +#define AVC_PRESWARN_MB_SKIP_RUN_RANGE_OUT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00800000
> +#define AVC_PRESWARN_MB_TYPE_RANGE_OUT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x00900000
> +#define AVC_PRESWARN_SUB_MB_TYPE_RANGE_OUT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00A00000
> +#define AVC_PRESWARN_CBP_RANGE_OUT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00B00000
> +#define AVC_PRESWARN_INTRA_CHROMA_PRED_MODE_RANGE_OUT=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x00C00000
> +#define AVC_PRESWARN_REF_IDX_RANGE_OUT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x00D00000
> +#define AVC_PRESWARN_COEFF_TOKEN_RANGE_OUT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00E00000
> +#define AVC_PRESWARN_TOTAL_ZERO_RANGE_OUT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x00F=
00000
> +#define AVC_PRESWARN_RUN_BEFORE_RANGE_OUT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x010=
00000
> +#define AVC_PRESWARN_OVERCONSUME=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x01100000
> +#define AVC_PRESWARN_MISSING_SLICE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x01200000
> +
> +/* WAVE6 WARNING ON ENCODER (WARN_INFO) */
> +#define WAVE6_ETCWARN_FORCED_SPLIT_BY_CU8X8=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x000000001
> +
> +#endif /* __WAVE6_VPUERROR_H__ */

