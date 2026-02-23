Return-Path: <linux-media+bounces-53243-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMuPNOzTnGkJLAQAu9opvQ
	(envelope-from <linux-media+bounces-53243-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 23:25:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D45D17E4ED
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 23:25:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 87C0C30821F8
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 22:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26BC37AA8A;
	Mon, 23 Feb 2026 22:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XtqRmn6s"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C65F3EBF1F;
	Mon, 23 Feb 2026 22:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771885513; cv=none; b=WA8N4/gjLMowKdwUQ6OTTc90XAOgYbhkDRJUXLmQ69580xNunZ6mxzPBcrUUE8aWEUtC9K2GEVaSOqKJEBSYFrmE9mdrmx6vL/+1fDivvhu2eUeRcP8tAnJVWBsCVCxYsXE7gv3d2E9A6uZBv8WbI2H+anUHM1DSDKCASW1fbis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771885513; c=relaxed/simple;
	bh=wfg4VRQE5OBvnbfLt0WHzLC4rvZAYdoLxo98gn+3YZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FvAgczZqRag2/eKEJ71Z0Q/cMUMmAR6WnkGQgTKR3istygNAXuyG4QEvj0+738Cw15TiqdlHesPvUYBAEDvZZHx9EML8ZtgN+VJLWrPk/y5v/ADeJ7Hgr2lBdBsrK1i82WwyWbpl2AdjODRy4uqaX7xjXOjgPsbIY+8SrzTY0Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XtqRmn6s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EE5BC116C6;
	Mon, 23 Feb 2026 22:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771885512;
	bh=wfg4VRQE5OBvnbfLt0WHzLC4rvZAYdoLxo98gn+3YZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XtqRmn6sXzxFhXP8E1IfC+idVmhuk6RUIOBACSkm8U+6774jsU0QDnOUnd+IxaDbn
	 YUtMJccEZHsa+M/i6Lpr8CyXFcryxYRuwtRBtpNgAEWqIcv1Ec45o3CHJ7qpjfyCzd
	 T+DQp8mMgCp2ELMj037MUXQZbdO8AvpA1Jb5KxKf+ukIMRNAY1/dQhePyW7jSaWNl8
	 Ql9cNguaVf3Q8b/Lw9d8xi52N3OPFD3kAOSKKe0WJa7CqFIymNvuiPUoABLoBIp/ce
	 9Pc1lacSracywRFZSsWniAQ1LIM0cjNqajIIxbnGgU5hwzNuDorYyN8tjmXkewdouL
	 XHI3edGwUpc7Q==
Date: Mon, 23 Feb 2026 16:25:08 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
	Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
	Bharath Kumar <quic_bkumar@quicinc.com>, Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 03/18] accel/qda: Add RPMsg transport for Qualcomm
 DSP accelerator
Message-ID: <oe4ho45dxtwjjjsqj6nd4op3gh7dz2pqwsuuhgqpdbf5hym645@smg3g4evqmge>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-3-fe46a9c1a046@oss.qualcomm.com>
 <tqsdbijgjomrn7fq3sdz7v2axwxqvbccpjh4fmvod4kbrq7pod@af3igw5dx66p>
 <lyco6vkfjlerri55ldyn6fbhihbkhnuolifddcnscevybsztq7@ljhjln2ynmid>
 <r7eko65ua2ofyejqf6ipnh6jm4s76f4mqy6a4msgmlraz4xuec@uymfzc65dbng>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <r7eko65ua2ofyejqf6ipnh6jm4s76f4mqy6a4msgmlraz4xuec@uymfzc65dbng>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53243-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,quicinc.com];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3D45D17E4ED
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 12:12:32AM +0200, Dmitry Baryshkov wrote:
> On Mon, Feb 23, 2026 at 03:50:32PM -0600, Bjorn Andersson wrote:
> > On Mon, Feb 23, 2026 at 11:23:13PM +0200, Dmitry Baryshkov wrote:
> > > On Tue, Feb 24, 2026 at 12:38:57AM +0530, Ekansh Gupta wrote:
> > [..]
> > > > diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
> > [..]
> > > > +/* Error logging - always logs and tracks errors */
> > > > +#define qda_err(qdev, fmt, ...) do { \
> > > > +	struct device *__dev = qda_get_log_device(qdev); \
> > > > +	if (__dev) \
> > > > +		dev_err(__dev, "[%s] " fmt, __func__, ##__VA_ARGS__); \
> > > > +	else \
> > > > +		pr_err(DRIVER_NAME ": [%s] " fmt, __func__, ##__VA_ARGS__); \
> > > 
> > > What /why? You are under drm, so you can use drm_* helpers instead.
> > > 
> > 
> > In particular, rather than rolling our own wrappers around standard
> > functions, just use dev_err() whenever you have a struct device. And for
> > something like fastrpc - life starts at some probe() and ends at some
> > remove() so that should be always.
> 
> I'd say differently. For the DRM devices the life cycle is centered
> around the DRM device (which can outlive platform device for multiple
> reasons). So, please start by registering the DRM accel device and using
> it for all the logging (and btw for private data management too).
> 

There are no platform_devices here, but tomato tomato... What defines
the life cycle of the DRM device then? Might it linger because clients
are holding open handles to it?

Note that the fastrpc service is coming and going, as the remoteproc
starts and stops.

Regards,
Bjorn

> > 
> > Regards,
> > Bjorn
> 
> -- 
> With best wishes
> Dmitry

