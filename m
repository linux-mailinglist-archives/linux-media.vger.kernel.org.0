Return-Path: <linux-media+bounces-57493-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBMgF1nIyGlRqgUAu9opvQ
	(envelope-from <linux-media+bounces-57493-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 08:36:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FD3350F28
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 08:36:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C94C8301ECE6
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 06:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063812C11E1;
	Sun, 29 Mar 2026 06:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FWCPNX1n"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3E2288530;
	Sun, 29 Mar 2026 06:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774766139; cv=none; b=TiMiaFEKX5KDmuP+Y0f6XPcCF4qi6E65QHpzLU84w50v5EWjDtEHFsHWqt7RYOZ+mRJr3oTX6DNQ9ngZWrfvV4zDroWNC84EuH0Xa74dMKyN8d0YIRTygcMaevTWth06IlLUxi51thJgiiFzBX888esCn/a6KUoqfsTMy3tazq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774766139; c=relaxed/simple;
	bh=rW+ND+3JbUkWM3lXVcAkjV7CsU2FDSrrp5aDczXqKFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJxpEBn+GajZPeQTRQlUGRry66wvOdSJWi1TGW6WIN1YE1v2AysskZ+Bpir6WcTWmJE+PTmqUTFsHt+D9mPOuMxVY2evyhaUWsbl6vdbEx0Kp22YOQtJoGl1RsoHLUFfhrM/Uckbh1PXGJaar4rvGFfLAQ/GMvHlwXvXFQreah0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FWCPNX1n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8BDAC116C6;
	Sun, 29 Mar 2026 06:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774766139;
	bh=rW+ND+3JbUkWM3lXVcAkjV7CsU2FDSrrp5aDczXqKFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FWCPNX1njz1LpAyMDmFTGlpVYZD5kkGOkpzjLQZnvwJfjUxlSjhr+v44XoREwNiZQ
	 T9hoJbIVjnEApr1ysxFKuBGU+qr+ZXI4OzU7QH372Qzesk7KsK2t3h+2iw3FR+Ddi/
	 /SYwUt0FnLRASMLAOgrrcmFgKrNdrwz4BXW1MhG4=
Date: Sun, 29 Mar 2026 08:35:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com
Subject: Re: [PATCH 1/4] staging: vc04_services: vchiq-mmal: fix OOB array
 access in event_to_host_cb()
Message-ID: <2026032936-deniable-visa-2459@gregkh>
References: <20260329062229.493430-1-sebasjosue84@gmail.com>
 <20260329062229.493430-2-sebasjosue84@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260329062229.493430-2-sebasjosue84@gmail.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57493-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D0FD3350F28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 29, 2026 at 12:21:11AM -0600, Sebastian Josue Alba Vives wrote:
> From: Sebastián Alba Vives <sebasjosue84@gmail.com>
> 
> event_to_host_cb() uses msg->u.event_to_host.client_component as an
> index into the instance->component[] array (size VCHIQ_MMAL_MAX_COMPONENTS
> = 64) without any bounds validation. The client_component value comes
> from the VideoCore GPU firmware via VCHIQ message passing.
> 
> A malicious or buggy GPU firmware could send a crafted
> MMAL_MSG_TYPE_EVENT_TO_HOST message with client_component >= 64 (or
> negative), causing an out-of-bounds array access in kernel memory. This
> results in reading/dereferencing a bogus vchiq_mmal_component structure
> from memory beyond the array, which can lead to kernel crashes or
> potentially arbitrary kernel memory access.

The kernel trusts the hardware the driver is bound to, so this shouldn't
be happening ever, right?

> 
> Add a bounds check on comp_idx before using it as an array index.
> Move the component pointer assignment after the validation.
> 
> Fixes: b18ee53ad297 ("staging: bcm2835: Break MMAL support out from camera")
> Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>

No cc: stable?

> ---
>  drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> index d36ad71cc..4772126d7 100644
> --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> @@ -477,12 +477,19 @@ static void event_to_host_cb(struct vchiq_mmal_instance *instance,
>  			     struct mmal_msg *msg, u32 msg_len)
>  {
>  	int comp_idx = msg->u.event_to_host.client_component;
> -	struct vchiq_mmal_component *component =
> -					&instance->component[comp_idx];
> +	struct vchiq_mmal_component *component;
>  	struct vchiq_mmal_port *port = NULL;
>  	struct mmal_msg_context *msg_context;
>  	u32 port_num = msg->u.event_to_host.port_num;
>  
> +	if (comp_idx < 0 || comp_idx >= VCHIQ_MMAL_MAX_COMPONENTS) {
> +		pr_err("%s: component index %d out of range\n",
> +		       __func__, comp_idx);

dev_err() is best, right?

And are you going to allow a malicious hardware device to spam the
kernel log?  :)

thanks,

greg k-h

