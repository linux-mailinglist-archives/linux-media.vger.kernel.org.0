Return-Path: <linux-media+bounces-62208-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOroDCZcDWrBwQUAu9opvQ
	(envelope-from <linux-media+bounces-62208-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 09:00:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FE858894D
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 09:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A3E4C303E0C3
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 06:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88672367B63;
	Wed, 20 May 2026 06:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g3la4JHZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC67325742F;
	Wed, 20 May 2026 06:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779260259; cv=none; b=OHnTw0vuVg1RfYvkSFC2wbk6TnSBkcLrhZzwbj8dxbW6GVwlHWWRzuxbfemzX4aeGb5LPNtR+M6SMHdiI3BwBpK9iGGkRtDPZRdR7+JYqqfzy34EBBejPIOYa548vF9bHjTvLdFJS5M7dkWk47wX+1j7C41qfKtn9cSCw2goH3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779260259; c=relaxed/simple;
	bh=1RftdqEDanCNcGRn7uep4DjhhgkSgW1Pfa0PIoZHE6k=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=mAgVksd4aoBbmFeco33bxoYRf5yjZ6Oy5ihWbmPogKkxcWntF1sHhcRCzNAMEWnmBlCZ9oOfSXGj7mMuPPmZRkL3PKa5dCSw3vxaOLr/K4GN+kX2TSrefGsp+3Ybmzx1BJCFWBiFbq+RXVih/+ioOblEEfKgDDQIiKuo0tPffNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g3la4JHZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 792B01F000E9;
	Wed, 20 May 2026 06:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779260257;
	bh=r5UT/v/jwP+5XTbMh1trVgtULaJMxPVMpC6kN5XpHRQ=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=g3la4JHZgVqmxgse1VG9x40JyjNuLk/M5BcUVOJUiMYlUXZ/2Mb/21pReOVt5rMd0
	 avv4n3i0o7TyvD7Aeo+1DzFyyVOLzoTQsdH7iGRvBKKtqLb+1Z4mAxWVTZ3KqEx/Md
	 SKnMWrJEWg0ZnEnPbsR9f7CSeQs1oas0W3HZtn2Cy1bbJDZYtx1Xe6PCelaT24TD9j
	 lpTrwY00ujNLJHVvqv3FzeNR1ofl1czy+Nl4EC7KoC/fZ0BJZdRPNA3vhZuL79ipph
	 dPyJvp7M6JoPZ+blnb4cZ0poMoGS5D/JtRWIu/BFX04kAw9HZtc+TKhwUpNWHx79Zf
	 4h+ao0s3EePGg==
Message-ID: <f202c8ae-554f-49de-a9d1-add337e28515@kernel.org>
Date: Wed, 20 May 2026 08:57:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: airspy: Guard stop_streaming() against
 disconnected device
To: Valery Borovsky <vebohr@gmail.com>, linux-media@vger.kernel.org,
 mchehab@kernel.org
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20260513052617.140688-1-vebohr@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260513052617.140688-1-vebohr@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62208-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	RSPAMD_EMAILBL_FAIL(0.00)[stable.vger.kernel.org:query timed out];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,sashiko.dev:url]
X-Rspamd-Queue-Id: A7FE858894D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/05/2026 07:26, Valery Borovsky wrote:
> airspy_disconnect() clears s->udev under v4l2_lock, but
> airspy_stop_streaming() unconditionally calls airspy_ctrl_msg() and
> airspy_free_stream_bufs() afterwards. If a streaming user closes the
> device after disconnect, stop_streaming() runs and dereferences the
> NULL s->udev:
> 
>   airspy_stop_streaming()
>     airspy_ctrl_msg(s, CMD_RECEIVER_MODE, 0, 0, NULL, 0)
>       usb_sndctrlpipe(s->udev, 0)         /* NULL deref */
>     airspy_free_stream_bufs(s)
>       usb_free_coherent(s->udev, ...)     /* NULL deref */
> 
> Mirror the precedent set by sibling SDR drivers msi2500 and pwc, which
> already guard their hardware teardown block with an "if (udev)" check.
> The queued-buffer drain via airspy_cleanup_queued_bufs() must still
> run unconditionally so vb2 sees its buffers returned.
> 
> Issue identified by automated review of the INV-003 series at
> https://sashiko.dev/
> 
> Fixes: 634fe5033951 ("[media] airspy: AirSpy SDR driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Valery Borovsky <vebohr@gmail.com>
> ---
>  drivers/media/usb/airspy/airspy.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/usb/airspy/airspy.c b/drivers/media/usb/airspy/airspy.c
> index 8f6b721ba107..50db02d35213 100644
> --- a/drivers/media/usb/airspy/airspy.c
> +++ b/drivers/media/usb/airspy/airspy.c
> @@ -584,12 +584,14 @@ static void airspy_stop_streaming(struct vb2_queue *vq)
>  
>  	mutex_lock(&s->v4l2_lock);
>  
> -	/* stop hardware streaming */
> -	airspy_ctrl_msg(s, CMD_RECEIVER_MODE, 0, 0, NULL, 0);
> +	if (s->udev) {
> +		/* stop hardware streaming */
> +		airspy_ctrl_msg(s, CMD_RECEIVER_MODE, 0, 0, NULL, 0);
>  
> -	airspy_kill_urbs(s);
> -	airspy_free_urbs(s);
> -	airspy_free_stream_bufs(s);
> +		airspy_kill_urbs(s);
> +		airspy_free_urbs(s);
> +		airspy_free_stream_bufs(s);
> +	}
>  
>  	airspy_cleanup_queued_bufs(s);
>  

Here too it is better to replace video_unregister_device(&dev->vdev);
by vb2_video_unregister_device(&dev->vdev);

Similar to what I suggested for rtl2832_sdr.

Regards,

	Hans

