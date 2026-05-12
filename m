Return-Path: <linux-media+bounces-61275-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PjON7Y+A2qr2AEAu9opvQ
	(envelope-from <linux-media+bounces-61275-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 16:52:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9592522FB5
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 16:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F25973039733
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 14:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 372F936A345;
	Tue, 12 May 2026 14:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PIeSzrjw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9071356A38;
	Tue, 12 May 2026 14:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778597551; cv=none; b=kFzzvHAN8HrASwBpC9wthup4gWGDxX/Wo79YHAvO9n8970pIDf0FfbJJExk8w6nFUys5hVvG8dFBADJF1cMdup3MizV/XBbNrTY738VgUvQXguNBKs0GdsQa1AMY4ejjj1qNn8NvLYlXBlfwAm90WLlAbIFUMrG6FSxjgL64wOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778597551; c=relaxed/simple;
	bh=kWdnMaffzGmwd2i3jfoPP8WjQCLmJ8YBMDM7J4irZfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SnSSJu4tKV/uuY7eQMG1fca92Hrr7/UN5WzgPVC7tAdsGRAjzo8iI0D88ZfPoAX64vN6JHgcMkhinugtEuWaynLJk8vzvpE5+sqZ+O2n6uvqBtdSRxACas2CU7Tf0v9sDKsygqYzG5pRem+XOszDgO6Cq2xarwvGXLpLeNXAZYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PIeSzrjw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45C5256D;
	Tue, 12 May 2026 16:52:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778597539;
	bh=kWdnMaffzGmwd2i3jfoPP8WjQCLmJ8YBMDM7J4irZfQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PIeSzrjw1cPe7s2NHynHIAi5cvJNmCAHn3TkWJFB0yyph1Tseuld3gaJRXD8kwa/3
	 gCb4G4gXtzUSd3/I36FID+pfP+IW/kmprfzxjygLKkL5zDUdkjXm9FixyPNs0bRPcp
	 kZYEdfvWtGve2ihNjb8eaqPV+L4jkNLu0OfhAfgM=
Message-ID: <f946bcf6-abae-4707-ae6e-eadda3cd03c3@ideasonboard.com>
Date: Tue, 12 May 2026 15:52:24 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: rzv2h-ivc: Wait for frame end in stop_streaming
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, stable@vger.kernel.org
References: <20260401-ivc-stop-streaming-v1-1-b7599982c280@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260401-ivc-stop-streaming-v1-1-b7599982c280@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B9592522FB5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61275-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.scally@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[10bit:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim]
X-Rspamd-Action: no action

Hi Jacopo

On 01/04/2026 16:35, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> The rzv2h-ivc driver fails to handle back-2-back streaming sessions that
> do not go through a peripheral reset. As the driver uses an autosuspend
> delay of 2 seconds, it is quite possible that two consecutive streaming
> sessions won't go through a suspend/resume sequence.
> 
> If the peripheral is not reset the second streaming session hangs and no
> frames are delivered to the ISP.
> 
> This is because the stop_streaming() procedure implemented in the driver
> doesn't match what's prescribed by the chip datasheet:
> 
> 1) The chip manual suggests to poll the RZV2H_IVC_FM_INT_STAT_STPEND bit
>     of RZV2H_IVC_REG_FM_INT_STA instead of polling on RZV2H_IVC_REG_FM_STOP
>     and prescribes to clear the bit after polling has completed
> 
> 2) More importantly: the RZV2H_IVC_REG_FM_STOP_FSTOP bit has to be set
>     on RZV2H_IVC_REG_FM_STOP -only- if a frame transfer to the ISP is in
>     progress. Setting the RZV2H_IVC_REG_FM_STOP_FSTOP bit when no frame is
>     being transferred causes the polling routine to timeout and the next
>     streaming session fails to start
> 
> As a frame transfer of an image in 1920x1080@10bi takes 5 milliseconds
> at most, it is quite possible that the frame transfer completion interrupt
> races with the stop procedure.
> 
> Instead of forcing a frame transfer abort, simply wait for the
> in-progress transfer to complete by polling the ivc->vvalid_ifp status
> variable in an hand-rolled loop that allows to inspect the variable
> while holding the spinlock, to allow the irq handler to complete the
> current buffer.
> 
> With this change, streaming back-2-back without suspending the
> peripheral works successfully.
> 
> Cc: stable@vger.kernel.org
> Fixes: f0b3984d821b ("media: platform: Add Renesas Input Video Control block driver")
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---

Sorry for missing this before. Kudos on the detailed investigation, and thanks for the fix...seems 
like a reasonable approach to me.

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> As detailed in the commit message, re-starting a streaming session
> without going through a peripheral reset doesn't currently work.
> 
> I initially thought this is because the stop_streaming() procedure
> implemented in the rzv2h-ivc driver does not comply with what is
> prescribed by the chip manual.
> 
> So I went and modified it according to the manual.
> 
> Unfortunately, even by following the suggested procedure, once
> RZV2H_IVC_REG_FM_STOP is set and a forceful frame transfer abort is
> started, the RZV2H_IVC_FM_INT_STAT_STPEND bit takes a long time to
> clear, during which is most often times the case the current in-progress
> transfer completes by itself. If this happen, then a peripheral
> reset is required to restart streaming regardless if I forcefully clear
> the RZV2H_IVC_REG_FM_STOP_FSTOP and RZV2H_IVC_FM_INT_STAT_STPEND bits.
> 
> I have tried several strategies to properly forcefully stop an
> in-progress transfer and handle the potential race betwee the
> transfer-complete irq and the polling the RZV2H_IVC_REG_FM_INT_STA
> register (which could potentially sleep), but it's still quite easy to
> get races between frame completion and the forced stop procedure unless
> I hold on to the ivc->spinlock preventing the irq handler to run.
> 
> Once I timed the transfer time for a 1920x1080@10bit frame to 5 milli-seconds
> at most I decided to simply wait for the current in-progress transfer to
> complete, as this seems the most reliable way to be able to re-start
> streaming without resetting the peripheral.
> ---
>   .../platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c   | 31 ++++++++++++++++++----
>   1 file changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> index b167f1bab7ef..932fed38cf3f 100644
> --- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> @@ -297,12 +297,33 @@ static int rzv2h_ivc_start_streaming(struct vb2_queue *q, unsigned int count)
>   static void rzv2h_ivc_stop_streaming(struct vb2_queue *q)
>   {
>   	struct rzv2h_ivc *ivc = vb2_get_drv_priv(q);
> -	u32 val = 0;
> +	unsigned int loop = 5;
>   
> -	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_FM_STOP, RZV2H_IVC_REG_FM_STOP_FSTOP);
> -	readl_poll_timeout(ivc->base + RZV2H_IVC_REG_FM_STOP,
> -			   val, !(val & RZV2H_IVC_REG_FM_STOP_FSTOP),
> -			   10 * USEC_PER_MSEC, 250 * USEC_PER_MSEC);
> +	/*
> +	 * If no frame transfer is in progress, we're done, otherwise, wait for
> +	 * the transfer to complete.
> +	 *
> +	 * Transferring a 1920x1080@10bit frame to the ISP takes less than 5
> +	 * msec so sleep for 2.5 msec (+- 25%) and give up after 5 attempts.
> +	 */
> +	for (; loop > 0; loop--) {
> +		unsigned int vvalid_ifp;
> +
> +		/*
> +		 * Inspect the ivc->vvalid_ifp variable holding the spinlock not
> +		 * to the race with the rzv2h_ivc_buffer_done() call in the irq
> +		 * handler.
> +		 */
> +		scoped_guard(spinlock_irq, &ivc->spinlock) {
> +			vvalid_ifp = ivc->vvalid_ifp;
> +		}
> +		if (vvalid_ifp < 2)
> +			break;
> +
> +		fsleep(2500);
> +	}
> +	if (!loop)
> +		dev_err(ivc->dev, "Failed to stop streaming\n");
>   
>   	rzv2h_ivc_return_buffers(ivc, VB2_BUF_STATE_ERROR);
>   	video_device_pipeline_stop(&ivc->vdev.dev);
> 
> ---
> base-commit: 4fbeef21f5387234111b5d52924e77757626faa5
> change-id: 20260331-ivc-stop-streaming-2c992277b050
> 
> Best regards,


