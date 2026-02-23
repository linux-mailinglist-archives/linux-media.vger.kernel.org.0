Return-Path: <linux-media+bounces-53234-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFyGFYHMnGlsKQQAu9opvQ
	(envelope-from <linux-media+bounces-53234-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 22:54:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0715317DD13
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 22:54:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 404DB304A0F7
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 21:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5850C37B3E4;
	Mon, 23 Feb 2026 21:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="itktZGAm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38CE37AA9F;
	Mon, 23 Feb 2026 21:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771883558; cv=none; b=cGtK/XiDfojvsWWW/BiFDHc6alsjkOX2V8uiUaMPDPIs2iYhp5hXZzjTB0atEepxqoFSOk/kJWbFbe5V3TvU4VGbX7vsHppH3zOiemcm6Zw50AKyr1p49stDWLRTyQYq/fAjGnnczPqcXUuI8KHnc9Xpg4ukqzd359INzgnladc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771883558; c=relaxed/simple;
	bh=/stCI5ijiZ7yMnH4o/+LgfD8ysmkT8zvJMlAlRyApjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G07/d6frynxmcJT+W9LGBMwggn6GBo7ml4O8ldNovT7g1nS9miHuGASVuu6UHqIHQ64qfm+yplqHCi2ZO0miXxjFYwsJ9oYcPQKwX6yPT1WMqfPRFwIsXSMfNOpn7nlkDXIEy1gEF9rOxVnaRNswsZOIqdrx7sS/426AGFkxH6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=itktZGAm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D72CC2BC86;
	Mon, 23 Feb 2026 21:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771883558;
	bh=/stCI5ijiZ7yMnH4o/+LgfD8ysmkT8zvJMlAlRyApjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=itktZGAmcWMTx8XokiFfZPKu+31BcdMxHrphcVS9GjKORywe+FScSVJb08hfpx9lz
	 kAGmTJUPF+Rq6Ai3+nsFJn3VW26qLH1GLnotroUIwCo1D+j22+4g3loa99t+M5h3Aw
	 f2GkWVbHzLyZu9ziKMTRmoeLQlQlSrNLSZShGvgbShS/ZA7Q+5xVqohl3vhSsArRRn
	 ielYecXOETCBys8aYMFnZSg2hp/mvDybO7Ww4e8sKiCyNOgVDxFvQeXnclgWWBhuL7
	 9F3rPkqRrV3vgsqQBaDTWDcIQe8G3S0I2ICNjDJsf40h5ODMwYAKAHX48BbEOHvgcC
	 IRCxve5BqB9HA==
Date: Mon, 23 Feb 2026 15:52:34 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bharath Kumar <quic_bkumar@quicinc.com>, 
	Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 02/18] accel/qda: Add Qualcomm DSP accelerator driver
 skeleton
Message-ID: <elu44euja7d7nnnhdmdqgof76646b3m3isjmws5pr274gqhy2a@dbeq4hk74ebo>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-2-fe46a9c1a046@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-qda-firstpost-v1-2-fe46a9c1a046@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53234-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0715317DD13
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 12:38:56AM +0530, Ekansh Gupta wrote:
[..]
> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
> new file mode 100644
> index 000000000000..18b0d3fb1598
> --- /dev/null
> +++ b/drivers/accel/qda/qda_drv.c
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +
> +static int __init qda_core_init(void)
> +{
> +	pr_info("QDA: driver initialization complete\n");

This print is useless as soon as you make the driver do anything, please
don't include developmental debug logs.


In fact, this patch doesn't actually do anything, please squash things a
bit to give it some meat.

Regards,
Bjorn

> +	return 0;
> +}
> +
> +static void __exit qda_core_exit(void)
> +{
> +	pr_info("QDA: driver exit complete\n");
> +}
> +
> +module_init(qda_core_init);
> +module_exit(qda_core_exit);
> +
> +MODULE_AUTHOR("Qualcomm AI Infra Team");
> +MODULE_DESCRIPTION("Qualcomm DSP Accelerator Driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.34.1
> 
> 

