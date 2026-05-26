Return-Path: <linux-media+bounces-62744-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +B9/O181FWqwTgcAu9opvQ
	(envelope-from <linux-media+bounces-62744-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 07:53:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 760025D0F98
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 07:53:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 834B43025A61
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 05:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C17438E5C5;
	Tue, 26 May 2026 05:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qrp4bybi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091323BED5A
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 05:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779774775; cv=pass; b=O0ZjEb0JC6sF0+JAyCWvRFMgUxRuDSxpmYB3HXP6J7RFkRGw72R0NxtArVkeLI/vmFgrVyxu/Ic3cT+ik16AEPUmKHsBz1AL859qkBJ6GkApDUIBuDndxGPhe8pw7IUx48n/9sO02XwZHBw2JJ2eodZRLPP+6wrFE9JeqkJTClA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779774775; c=relaxed/simple;
	bh=LBFgf3mDBP4hn9JKCluRF2dF864RTZ4/VkmmBIgX/Lg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IhHVStI8+i2ZuSPAeVXjzta35eg8EXhYHnUDAH93Y7mWywR6lLTBO1C0qGeJF3rhkVEoyhbcBrNuRHvJH4Lffs0jt0tmiVf5WI67tEuc+llEl+c4E8YULNV8uWvwvFoZ/lwpTsunWpwpARdl6ayKIha+ONpTT7O+Hq+tspHVEzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qrp4bybi; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-65c7492a2ceso9052563d50.3
        for <linux-media@vger.kernel.org>; Mon, 25 May 2026 22:52:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779774772; cv=none;
        d=google.com; s=arc-20240605;
        b=iv7NoxYSjh0bf/zrudCRTmYhlPpw3Z+ublHjDddpD3brouQN98T9EEFuLJLUsvzRl4
         KNdTgAez44twLr9TmBfn69jfpbajptAmgP8p8P1mnGfHpewsJ3Gr+LmduKkX8QB7FaRa
         MLF60WoxBymKH41wI2F5oyg6/8NXjVPes6y6uE0Khb6Lm3CUPxN8TjWfZp7cCqHQLxMO
         /NKijUSxgT30RI+okNzSqPIUuXQhLEpiOIpMm097dk1Fs5c63N0DkTocyeduUELQWTfZ
         RUkTnCvHloPVRdXPhwmj6wyl/94TwDy4E0X2J+p0GrsQZDDooNAoBENDZmSE4o990vBB
         Q68Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2duKumKePn4zoDG7Cxt1kGXnqGO0J1TlCgaAU7R0q8g=;
        fh=yJjsG+3OHF//vRorEmVUGDth5fk9DuHoPsxXTdEn+a0=;
        b=cPCLxK6fZmQtI3nN479Mh88MMiIdXXF4hWo8wGlNd+STKJ79Q6/aOKCG7QDVohvzJK
         SFexe8qJofV2WQUoFRwSrX6k3/IfIUGzkxSvxiYutJQT65xyoqjUukrc9ZxOevaETJXf
         IuUDeJhBravtsUB/r5XEGFHq3o95hMFZ6W1g4qbJ/EI97VHZpfPN/zzrpM7bFJUKiZnO
         BcUnQaTRrkvlLmE6WDc2KX28aX272UWX1l35qimUw3NTx/xVbZlrdausmvjf+hOZYR+J
         yWQH1Qs5POOe6ef6YqWFzOI7bTJ0PgmM4Dsp2FHGBbQtZwvnb8PNhJD4SzFnqU/yvKIO
         DxtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779774772; x=1780379572; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2duKumKePn4zoDG7Cxt1kGXnqGO0J1TlCgaAU7R0q8g=;
        b=qrp4bybik1YuiFDVe6S3AGZ9JPL0OM2V5LBDv7S/JlUw7lfLndswZFFvPQJ3OvWVJD
         m4qjZRd2Gt1w6kIffcogot3A8fXXN6NztXHHAlpC5pV8cHPzMneCIAZEbIeu1Ti4Zj0n
         AITg57RXybPn/7dvGe3tb9YLOqpm4QOWvXLB+knqGzNNJrJ/9VTxyDX31dKmCu6/go7n
         qKVf+KMj0xmoiY1M/nxzsaA+gFnByAN1ly5ftIb0lVNufzqdJsRxfhpKWeHBGeMikQ4Q
         W7FVoGc+NLeTi0q7jXOUnosQyjO4ZYHXtdCsF6VCI+Jr+SeMjjV8Uh/Rl6KmnvQ+yLQ3
         IsrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779774772; x=1780379572;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2duKumKePn4zoDG7Cxt1kGXnqGO0J1TlCgaAU7R0q8g=;
        b=jBBGNCz/pLpF13XTswzIQSx0BNRA29BszJ44PUsALyvj15xnxeoxfLkufNnp25Aqbo
         VkDmbCbmpdPYtROKicCwL8gaUkClJ1yK+WrIndlFyUeTfAgBV1hiZ7q5s7pSOsVW94LX
         R8jE+dtrzq2/4AunHvcAiSfbgtP312uv140T1daN+rB/+rE2kXH3VVZO9S4ena/2wuCk
         cWES1QpTGDHKD/ioeAuvbtkQBWBc9lS8++YF4ygI4EyHTahfX3S8SSD4WRLDZOwwBMZh
         A6zF0FpnO1fmDMe+A6IGMXnpo/FIZnWXiJaw1ITMVxR9L8bAgovkaggC0vXWbaxLgr+K
         9RuA==
X-Forwarded-Encrypted: i=1; AFNElJ+yMYvtsjs+2cmx3DfUy9Tcbhu38yXaaupece/LrnQh8gduMSmmfzQMMFm6GpCtphAhTPyZdP6Cqg28DQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcX5Ei42qhpUcNaC/Btuk6bV5yL2PkcDYUUi2CBFBqKtcGyZWP
	BH1VGqlz/mMNWoaacQF/7HwHTRMUqwN32YcHrHsEtieeEX32KEerNIP9mKGRZxrCwpo1svLA76L
	ymeDErUSUXbIlD188/MEIRe/RwtioWWo=
X-Gm-Gg: Acq92OFvuO/utohGokF6lzjUpr0hTQL4lj0tBo97yFIls1uzfBPNuKVLRAdKf20iqBU
	Xmn7qYAXOBGICuc1lI7Rp94EK8qfs9GHsCaXKBLAmv1dp6BXgXUm6OJB6UhwkpXcJNnBBmPxBME
	c2GqUuC3s1nnH5NpvkntcpgjgllGem1IWXAqLiV2czeRDCh22uIIrg1PqMHX6MS0ekkgct/uX+s
	NssuZw5jH29bAm9tERu9Cu66UBNTSPHuBIiaybJ4AwNUJ3qh54iQFBb3+smlB3sgrua0boGt1J6
	SHXTvdagIB5M
X-Received: by 2002:a05:690e:11cc:b0:651:be68:77e3 with SMTP id
 956f58d0204a3-65ec98a2a85mr17519833d50.31.1779774771987; Mon, 25 May 2026
 22:52:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518130259.1001956-1-lgs201920130244@gmail.com> <824d2c59-d355-4f8c-a602-bc08e49d52e1@nxp.com>
In-Reply-To: <824d2c59-d355-4f8c-a602-bc08e49d52e1@nxp.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 26 May 2026 13:52:41 +0800
X-Gm-Features: AVHnY4KKr9sNKWxiy0Iphg81sV9b0GYog6HfF4iC0Ir_KdVPm-LnQZBI08OEfrU
Message-ID: <CANUHTR-_bAft05ycvb77QP2ck5PNpFcT1nmDQ6WMhe-rD42gmg@mail.gmail.com>
Subject: Re: [PATCH] media: imx-jpeg: avoid double free on video register failure
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Hans Verkuil <hverkuil@kernel.org>, imx@lists.linux.dev, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-62744-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	REDIRECTOR_URL(0.00)[aka.ms];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,nxp.com:email,aka.ms:url]
X-Rspamd-Queue-Id: 760025D0F98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mirela,

On Mon, 25 May 2026 at 21:57, Mirela Rabulea <mirela.rabulea@nxp.com> wrote:
>
> > [You don't often get email from lgs201920130244@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > Caution: This is an external email. Please take care when clicking links or opening attachments. When in doubt, report the message using the 'Report this email' button
> >
> >
> > mxc_jpeg_probe() allocates a video_device with video_device_alloc() and
> > releases it from the err_vdev_register error path if
> > video_register_device() fails.
> >
> > This can double free the video_device when __video_register_device()
> > reaches device_register() and that call fails:
> >
> >    video_register_device()
> >      -> __video_register_device()
> >         -> device_register() fails
> >            -> put_device(&vdev->dev)
> >               -> v4l2_device_release()
> >                  -> vdev->release(vdev)
> >                     -> video_device_release(vdev)
> >
> >    mxc_jpeg_probe()
> >      -> err_vdev_register
> >         -> video_device_release(jpeg->dec_vdev)
> >
> > Use video_device_release_empty() while registering the device so that
> > registration failure paths do not free jpeg->dec_vdev through
> > vdev->release(). mxc_jpeg_probe() then releases jpeg->dec_vdev exactly
> > once from err_vdev_register. Restore video_device_release() after
> > successful registration so the registered device keeps its normal lifetime
> > handling.
> >
> > This issue was found by a static analysis tool I am developing.
> >
> > Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder")
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
>
> Hi Guangshuo,
>
> sorry for the late response, so I assume this patch will be dropped in
> favor of a fix in v4l2-core, as per discussions here?:
>
> https://lore.kernel.org/linux-media/20260519090819.1041314-1-lgs201920130244@gmail.com/
>
> Thanks,
>
> Mirela
>
> > ---
> >   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> > index b442dcba02e7..fe8a373576ef 100644
> > --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> > +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> > @@ -2943,7 +2943,7 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
> >          jpeg->dec_vdev->fops = &mxc_jpeg_fops;
> >          jpeg->dec_vdev->ioctl_ops = &mxc_jpeg_ioctl_ops;
> >          jpeg->dec_vdev->minor = -1;
> > -       jpeg->dec_vdev->release = video_device_release;
> > +       jpeg->dec_vdev->release = video_device_release_empty;
> >          jpeg->dec_vdev->lock = &jpeg->lock; /* lock for ioctl serialization */
> >          jpeg->dec_vdev->v4l2_dev = &jpeg->v4l2_dev;
> >          jpeg->dec_vdev->vfl_dir = VFL_DIR_M2M;
> > @@ -2962,6 +2962,8 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
> >                  dev_err(dev, "failed to register video device\n");
> >                  goto err_vdev_register;
> >          }
> > +       jpeg->dec_vdev->release = video_device_release;
> > +
> >          if (mode == MXC_JPEG_ENCODE)
> >                  v4l2_info(&jpeg->v4l2_dev,
> >                            "encoder device registered as /dev/video%d (%d,%d)\n",
> > --
> > 2.43.0
> >
Yes, you are right. Please drop this patch.

As discussed in the related thread, this issue should be fixed in
v4l2-core instead of handling it in the imx-jpeg driver.

Thanks for checking.

Best regards,
Guangshuo

