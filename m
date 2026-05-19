Return-Path: <linux-media+bounces-62140-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNKvC8BgDGpXggUAu9opvQ
	(envelope-from <linux-media+bounces-62140-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 15:08:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF4257F4E7
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 15:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A79530FD566
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 13:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07F34E3764;
	Tue, 19 May 2026 13:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T/c5x7jt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659EB2EC0A6;
	Tue, 19 May 2026 13:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779195647; cv=none; b=K5Xnj8uacSRpo7+qZ99Dnt09G7d1UaSyhvxiwPEMig5qcGajq3XCIPI+H4ql1EJqGnC28dI9dRmGtgFucPR2EXL6cMnoJ0lxy9F1TiEz2vPjb5NCEWMzHIWw+wQQ0NScz3zatSqndCvP7gRF2m1ALJ9FeFonJ211rY2LZp7mEFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779195647; c=relaxed/simple;
	bh=G7DyZT3dlR4zO4cefE8u7kwfC7CVQ6M9t9+5pfvz10M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=U53/0ly0w53BhYk2D3J+qMf+XbrevPcpQdMVR+JegvmlqX3F1L+vrrgZZGrB8Jn6nIoHr8PqeL/KYzOD3AztABDikySqwM6/4ouyLfezYAvgzMAqME0mNrStNay0oAHCrWI/dAwql2E9en1d5V35iwbJYnev/pRwdARc0wZfyGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T/c5x7jt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B6D9C2BCB3;
	Tue, 19 May 2026 13:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779195647;
	bh=G7DyZT3dlR4zO4cefE8u7kwfC7CVQ6M9t9+5pfvz10M=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=T/c5x7jtwmZGMuS0jcpDYZWCqlxIbMie9LS5EgY7tLc4wx7+QLXPNzYpfA42YHbwf
	 t10OF2f/bTCi8Ab3CsiujMFBS9+Rj4UPHp7utJSjE8MqMTnYnTdAdqfXadkwCT4Hna
	 XTySqk8UpLo1Sa8nZEjsh/Uz85uFvkLqPCeUtJjQ123J/SoM/SG8RqXN10ZWQcSzue
	 uhELdEgvnymY1aiW03hlVpsf3/Sa4Uv6KytUt66WYYo3ALkXgnoZbl8RWGas27IrLI
	 bnaub7Bxu9JJayosZt53dWkJ6voQh8ck4CAElP2uPJoNJ2CnhPAWpUATPU92W0Y+LU
	 kcaVlXDoHBNEQ==
Message-ID: <dd77b328-f792-48ac-a427-fc70c0e2c987@kernel.org>
Date: Tue, 19 May 2026 15:00:44 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hverkuil+cisco@kernel.org
Subject: Re: [PATCH v7] media: pci: add AVMatrix HWS capture driver
To: Ben Hoff <hoff.benjamin.k@gmail.com>, linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, mchehab@kernel.org,
 kernel test robot <lkp@intel.com>
References: <20260510235037.24876-1-hoff.benjamin.k@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260510235037.24876-1-hoff.benjamin.k@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62140-lists,linux-media=lfdr.de,cisco];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9DF4257F4E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ben,

On 11/05/2026 01:50, Ben Hoff wrote:

<snip>

While looking for something else, I stumbled on this:

> diff --git a/drivers/media/pci/hws/hws_v4l2_ioctl.h b/drivers/media/pci/hws/hws_v4l2_ioctl.h
> new file mode 100644
> index 000000000000..53044f78d6fa
> --- /dev/null
> +++ b/drivers/media/pci/hws/hws_v4l2_ioctl.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef HWS_V4L2_IOCTL_H
> +#define HWS_V4L2_IOCTL_H
> +
> +#include <media/v4l2-ctrls.h>
> +#include <linux/fs.h>
> +
> +extern const struct v4l2_ctrl_ops hws_ctrl_ops;
> +
> +int hws_vidioc_querycap(struct file *file, void *priv, struct v4l2_capability *cap);
> +int hws_vidioc_enum_fmt_vid_cap(struct file *file, void *priv_fh, struct v4l2_fmtdesc *f);
> +int hws_vidioc_g_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *fmt);
> +int hws_vidioc_try_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *f);
> +int hws_vidioc_g_std(struct file *file, void *priv, v4l2_std_id *tvnorms);
> +int hws_vidioc_s_std(struct file *file, void *priv, v4l2_std_id tvnorms);
> +int hws_vidioc_g_parm(struct file *file, void *fh, struct v4l2_streamparm *setfps);
> +int hws_vidioc_enum_input(struct file *file, void *priv, struct v4l2_input *i);
> +int hws_vidioc_g_input(struct file *file, void *priv, unsigned int *i);
> +int hws_vidioc_s_input(struct file *file, void *priv, unsigned int i);
> +int hws_vidioc_g_ctrl(struct file *file, void *fh, struct v4l2_control *a);
> +int hws_vidioc_s_ctrl(struct file *file, void *fh, struct v4l2_control *a);

These two functions are unused.

> +int hws_vidioc_dv_timings_cap(struct file *file, void *fh,
> +			      struct v4l2_dv_timings_cap *cap);
> +int hws_vidioc_s_dv_timings(struct file *file, void *fh,
> +			    struct v4l2_dv_timings *timings);
> +
> +int hws_vidioc_queryctrl(struct file *file, void *fh, struct v4l2_queryctrl *a);

Ditto for this one.

> +int hws_vidioc_g_dv_timings(struct file *file, void *fh,
> +			    struct v4l2_dv_timings *timings);
> +int hws_vidioc_enum_dv_timings(struct file *file, void *fh,
> +			       struct v4l2_enum_dv_timings *edv);
> +int hws_vidioc_query_dv_timings(struct file *file, void *fh,
> +				struct v4l2_dv_timings *timings);
> +int hws_vidioc_s_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f);
> +
> +#endif

Can you make a follow-up patch to drop these?

Regards,

	Hans

