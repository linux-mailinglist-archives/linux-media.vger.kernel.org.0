Return-Path: <linux-media+bounces-67683-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EByADveKV2pwWgAAu9opvQ
	(envelope-from <linux-media+bounces-67683-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 15:28:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA8375EAC3
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 15:28:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Ryk2LkDx;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67683-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67683-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6653530449E0
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8271842A7BE;
	Wed, 15 Jul 2026 13:21:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C143E5A1D;
	Wed, 15 Jul 2026 13:20:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784121664; cv=none; b=dE6nkms9AwRiJvFxiNjwPeywkFE0GreJoe8QdgDtq0jifAKBU86DBKIpiEVrewB9Px7vLtQFAMobFYCtl8fqCrL+5I/PiicTaST+2BtAUxEbsZaZxy1qf7Ard/iI7IOcj0RJOWkQmuob55CbRYWiFx/B/0jJFXXiKAF1evRojhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784121664; c=relaxed/simple;
	bh=MWtdMZlN+f0u6zh4SIlfxR6ird2FNtEIup17wVzW3v8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GH4Iw8Eid8bGxkDTHZ/9dGDIrzy5QzNQpxrrbfPWwBYacbVdoCgJHkeSaEqYFnpmKQ33Dy2/17QGSzvg+L+VrKtx0k3EGVV9LdHTHGOyeq2eU0FIFYD+t/svSNAkIrFHT0/wNDofo4cYzLbgSQ2oETELJZp7JVuE1fcDE6K7D1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ryk2LkDx; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014EB1F000E9;
	Wed, 15 Jul 2026 13:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784121653;
	bh=AnJh4ulZ2FDQmjXmLpIokbZz9ArThgRLAhjnD2e/+74=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=Ryk2LkDxXyn3kUcpDL+0fwufrehLYg8miacUpJ3uT6cWYzFCr1oRAQjxpfzYzVrkp
	 2lud+XhSpfDOTtptne/ZiUDz+X4NB+F6xnQVv+Zj7S8x/0Svu5XbqSqQEvP+edxEDT
	 gcyRRQk3QU8SB77ec8Zwjpico2IA+2KzKId+ExYVeRq5iMevl0aJAAhI6phAJf3zGD
	 mcscVZ8q/QORVOrXvevWdMij9SZQZM1BMg8Usw6heKSjiVWp7KjKb5gtmpPsTtAA8r
	 WRqiVRtrquM4W3APc3v1Aa8LBax2ebEI4SeKFIT4oi53xd4g/nErtXGi1IZVReeWEt
	 CxpnQiVx2dm2A==
Message-ID: <04a332fc-2025-4a74-ae4d-1d8f30fe20bf@kernel.org>
Date: Wed, 15 Jul 2026 15:20:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: nuvoton: npcm-video: quiesce VCD IRQ before
 teardown in remove
To: Fan Wu <fanwu01@zju.edu.cn>, kwliu@nuvoton.com, kflin@nuvoton.com
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260714020443.2795883-1-fanwu01@zju.edu.cn>
Content-Language: en-US, nl
In-Reply-To: <20260714020443.2795883-1-fanwu01@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67683-lists,linux-media=lfdr.de,cisco];
	FORGED_RECIPIENTS(0.00)[m:fanwu01@zju.edu.cn,m:kwliu@nuvoton.com,m:kflin@nuvoton.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zju.edu.cn:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2EA8375EAC3
X-Rspamd-Action: no action

On 14/07/2026 04:04, Fan Wu wrote:
> The VCD interrupt is requested with devm_request_threaded_irq() in
> npcm_video_init(), so it stays registered until the devm release that
> follows npcm_video_remove().  remove() itself calls kfree(video), so a
> VCD interrupt delivered between kfree(video) and that devm release
> dereferences freed memory: npcm_video_irq() reads VCD_STAT off
> video->vcd_regmap before the VIDEO_STREAMING flag early-return, so the
> use-after-free is unconditional on delivery, not gated by streaming
> state.
> 
> With streaming active, stop_streaming() (run from vb2_queue_release())
> masks VCD_INTE and resets the VCD, but an in-flight handler can
> re-enable VCD_INTE afterward.  On a DONE or FIFO-overrun/overflow
> interrupt the handler finishes its buffer under buffer_lock and then
> calls npcm_video_start_frame().  start_frame() drops buffer_lock before
> it re-enables VCD_INTE (VCD_INTE_DONE_IE) and starts the next capture
> (npcm_video_command() with VCD_CMD_GO); it can therefore perform those
> operations after stop_streaming() masks and resets the VCD.
> 
> For the re-arm to happen, start_frame() must take buffer_lock, find a
> next queued buffer, and release the lock before stop_streaming() empties
> the list.  Once start_frame() has released the lock, the VCD re-enable
> and capture start that follow are outside buffer_lock, so emptying the
> list afterwards cannot stop them.  buffer_lock protects the buffer list
> only; it is not held for the re-arm and capture start, nor for
> stop_streaming()'s mask and reset, so those VCD writes are not
> serialized with each other.  start_frame() returns without re-arming
> when no next buffer is queued, there is no video signal, or the VCD
> stays busy past its poll timeout.
> 
> That capture can complete and raise VCD_STAT_DONE; with VCD_INTE
> re-armed, a new interrupt can then fire after kfree(video), and the
> handler dereferences the freed per-device structure.
> 
> Unregister the video device, then mask the VCD interrupt source and
> unregister and drain the threaded handler with devm_free_irq() before
> releasing the vb2 buffers, the ECE state and the per-device structure.
> devm_free_irq() also clears the devm action, so the later devm release
> is a no-op and does not double-free.  Gating the re-arm alone would not
> close the window: the handler dereferences the per-device structure
> before any streaming-flag check, so any interrupt delivered after
> kfree(video) is fatal regardless of re-arm.
> 
> This issue was found by an in-house static analysis tool.
> 
> Fixes: 46c15a4ff1f4 ("media: nuvoton: Add driver for NPCM video capture and encoding engine")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
> ---
>  drivers/media/platform/nuvoton/npcm-video.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
> index 52505af35c08..637b1fe54824 100644
> --- a/drivers/media/platform/nuvoton/npcm-video.c
> +++ b/drivers/media/platform/nuvoton/npcm-video.c
> @@ -120,6 +120,7 @@ struct npcm_video {
>  
>  	struct list_head buffers;
>  	struct mutex buffer_lock; /* buffer list lock */
> +	int irq;
>  	unsigned long flags;
>  	unsigned int sequence;
>  
> @@ -1707,6 +1708,7 @@ static int npcm_video_init(struct npcm_video *video)
>  		dev_err(dev, "Failed to find VCD IRQ\n");
>  		return -ENODEV;
>  	}
> +	video->irq = irq;
>  
>  	rc = devm_request_threaded_irq(dev, irq, NULL, npcm_video_irq,
>  				       IRQF_ONESHOT, DEVICE_NAME, video);
> @@ -1808,6 +1810,8 @@ static void npcm_video_remove(struct platform_device *pdev)
>  	struct npcm_video *video = to_npcm_video(v4l2_dev);
>  
>  	video_unregister_device(&video->vdev);
> +	regmap_write(video->vcd_regmap, VCD_INTE, 0);
> +	devm_free_irq(dev, video->irq, video);
>  	vb2_queue_release(&video->queue);
>  	v4l2_ctrl_handler_free(&video->ctrl_handler);
>  	v4l2_device_unregister(v4l2_dev);

I think this can be done easier: in devm_request_threaded_irq add the IRQF_NO_AUTOEN
flag, then just call enable_irq in start_streaming and disable_irq in stop_streaming.

In npcm_video_remove() you should replace video_unregister_device by vb2_video_unregister_device
(as that ensures that stop_streaming is called if streaming is in progress) and drop
vb2_queue_release (since vb2_video_unregister_device calls that).

I think that will be a clean approach.

But nuvoton devs need to test that as well to make sure it doesn't break anything.

Regards,

	Hans

