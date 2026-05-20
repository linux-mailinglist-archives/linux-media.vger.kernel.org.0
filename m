Return-Path: <linux-media+bounces-62338-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHI7LxToDWrM4gUAu9opvQ
	(envelope-from <linux-media+bounces-62338-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 18:57:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EAD592B66
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 18:57:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D24913583460
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 16:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578BA311597;
	Wed, 20 May 2026 16:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZf65mxN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A213161BE
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 16:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779292802; cv=pass; b=PiS1XJ02dNEbC2O3EpCPfIb8+lIOdEgatJf73dgWXFL+AiipmyZpwaURNkl8K5rAPzVi0okobovvkrm7yWLMV8BHKHLZABe22i/t/FbbTxKAFfcve1QkwYVmBUl9HTg8ajBvCvrBRnBTvhxmknz3V/RjG4w5+Odu7nxMzC/4BQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779292802; c=relaxed/simple;
	bh=Nu4tKXn78iixF1Te73+mYVhVesjIGn94UyWZfZ1zrj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dp4gFVSb2MqmmOcjk12sFQo5NTWUXVe71YdjlLRG+p/nYZ/s/UY+9MS6lZUmvu9fiA3KdyTpLtUCR7bUPJfmFlSi0482gBWsIUcGCaOeCvkyk3e+y2rUP/9dqonxQ9RRUk9wUJ+PXKO4cTLOhP7kEeXCWK42I9Z7nrZYkBJx8+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZf65mxN; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-65c0bda7f15so5056137d50.0
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 09:00:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779292800; cv=none;
        d=google.com; s=arc-20240605;
        b=LeOKNkAnsHo2ttKGmrZj+xONL1K7dQRPfiLwdqrHhQH/wltVsbrfyJsjSUw0NqD3Sr
         QNObKPo1fad06f5Y87nWNv0uwAGA1dDPg/h+KC8k/19IFsdmtzzT9B2uJJ5H0UFGMgkP
         zP4l6MhCXxWE35yG4MxEcQDht6HvTb0rhEnJQNmgD3/mlciuz8njpHK91ZdJrHhkQzLN
         dJmgMBZ+s0iTO1/phhjW4Hq6R1ODLlasyLXFcRjx1qYVmulH4/Xt4Dx2qVNjDlBlk4Kb
         52ZKOLLlF5WNcWuAz4CAk7uRicPcGhnb1lz7T6LbPGDod+SyR+VKp+AHW5FAQmO5gQpJ
         EALA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/qePdh68iZCKwosOGb2v44Bw68AogG3ERpVFmfA5qKo=;
        fh=ywRBOB5sK8zaUmoZzEnQqKAZdmreERPqnlTDnpa9N9w=;
        b=eDnUqyhq6BAUiPZfH3h49nbf19ctMZnJHaP/JxXRjUB5YnKLuNYhR/dbz57cC0f/DF
         XVKBAVCbbKMJJrNnsNw5xwKhIDMmabS1QLIhO1n44nxCAR2bAD6I+IAlvwlQy0+WVr0k
         2d9xAj0qhwpk9mjwdGYzJVFkPdrTWKU6RlUrvbToInyxM8H4GEyAjvPkar0RbpBkoHR8
         3+0cADN0OiYEr8EVfbOgNUdlZRRX3d5S4HAM2Fl3UeRYtDNSiDSPpJ7lV0fc5nWOAjtG
         Sba5QFfy5ypWMXziMrEoxpnIt1XKrFFiXj/bOuS58hoLFqUk7kLgubif/owiiOiZpVD1
         E0Gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779292800; x=1779897600; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/qePdh68iZCKwosOGb2v44Bw68AogG3ERpVFmfA5qKo=;
        b=gZf65mxNhaxPK0lqtVmRm6aRhQnnfpmS/Rv3iuXaFVoFsqhNqY8KTamjObHesUc3Rt
         L6rhNAm9wgajUKN3wd1zrv6eESTP1EnworuVywIX2euQqF9TQcR8n+TEwg19yDqtIaL3
         OmMYWXE6VOi+qBrRNABnUMGsA1ySN+LlrMyC19gvvmX8KHde5U11a5eqzTdoAQF3sdPk
         mMXxuATRrZVep6G1UlN8Tttlyf4x2ZiT4bGa0R+57SV5l3lwcEYzRKub/jJ0INvYLJha
         GCSYs8oOd/dglQaG0oPqzyrpTWJTVT+F3t1Y6CevlB90LLb+zwp83G+M12VM9ioxtLk/
         ktug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292800; x=1779897600;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qePdh68iZCKwosOGb2v44Bw68AogG3ERpVFmfA5qKo=;
        b=ejk7+MHIR9UzL+ce8swlY1KEBvVdA5SRp4uAYNSo9zbe5GbRhYgfp9oI0J32g8SB/C
         XS98QNfUuz91hIJ3raGtzuLPqyN9lh03GGJ8Hc6vibTQ5TLMz/Ue2ta994DEqMvvJHH9
         zqqgH/uXW9ZdI8FpY3hfDain4vHAz2I8505phH93IIudY2mCq3W0wEv6m6SVB+49iVc6
         tgCRJK92bWccFlPOszQUil9GKdK6p0dSwxaefVvy4XGUc9sIxe6fihX8QxlfMLLDZTRj
         KcjMbQzUw0enfHKV3zMX6K2FDdQ+yiDFQJwhP0bVjHmX3A6ifOK9wEGoG0JW1RCObQV9
         GjKw==
X-Forwarded-Encrypted: i=1; AFNElJ+aNOlma74m/Kg85Koy+9TFyi3RztciTj4pP4b8c1L31tledVj1X3Mx7qxxxzCDBhckWhbXOV1+9Sw/8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOJ1FcyTwmPPYF39VTv83BaZwCLkB4RcWDNgGxXRP/j8CSb1Ex
	Nm1o3PD6F86rBGV9UTvHkGWnDCyVBRZrMDLX6Gmg2Pcc6vfYxp9KK7KbB28QEJekKJONmEJk/om
	U0UI2u7oXwGDLE+ocql+SiCvL9/W0OVc=
X-Gm-Gg: Acq92OFT77ouTs9DlTTvsO6y+kcJBPCbhH60iBCJKJQUcRm6dlrV76iK07angXTc4K/
	kF2vbV7fODd6KFLRahqLY/yM9Cjw6AcnvJ+uTRHxVKPNcD1/MB3hj/FoZqmUwmbStTwPOqv6B0S
	3A2jlwmRWFqo58OlJItAd6W0Ex18HvuMZD+79Doam/OCgktmHYVVyLgO9C0s67NEOENwO5RmaYB
	yHe9RnkZH/eKXSsWJNPfMKJpw+MmE0O7h936GB8YcSvl5fsk8qubkcgXzMovjVNUHaSquZaOU7I
	GVHDflzB
X-Received: by 2002:a05:690e:bcb:b0:65e:55bb:d5c4 with SMTP id
 956f58d0204a3-65e55bbfaefmr13936717d50.48.1779292799759; Wed, 20 May 2026
 08:59:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260518130946eucas1p1a8e6673355aa1b2f7bb35f9070f289ce@eucas1p1.samsung.com>
 <20260518130929.1003652-1-lgs201920130244@gmail.com> <38f2ff7f-ee5b-44e8-972b-107b73dccd31@samsung.com>
In-Reply-To: <38f2ff7f-ee5b-44e8-972b-107b73dccd31@samsung.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 20 May 2026 23:59:45 +0800
X-Gm-Features: AVHnY4Idw_mAdZpVPyN7nF09r8RstUgNxjmwYh8BVbbirhp3GoFHnjEdp5i7LWg
Message-ID: <CANUHTR-RfWnoMRRAoDb6CPZsaiAYBLy61dd0P6TnKYgjNeBWpA@mail.gmail.com>
Subject: Re: [PATCH] media: s5p-mfc: avoid double free on video register failure
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62338-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,samsung.com:email]
X-Rspamd-Queue-Id: 33EAD592B66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Marek,

Thanks for your feedback.

On Wed, 20 May 2026 at 19:37, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> On 18.05.2026 15:09, Guangshuo Li wrote:
> > s5p_mfc_probe() allocates video_device instances for both the decoder
> > and encoder and releases them from the probe error paths if
> > video_register_device() fails.
> >
> > This can double free a video_device when __video_register_device()
> > reaches device_register() and that call fails:
> >
> >   video_register_device()
> >     -> __video_register_device()
> >        -> device_register() fails
> >           -> put_device(&vdev->dev)
> >              -> v4l2_device_release()
> >                 -> vdev->release(vdev)
> >                    -> video_device_release(vdev)
> >
> >   s5p_mfc_probe()
> >     -> err_dec_reg or err_enc_reg
> >        -> video_device_release(vdev)
> >
> > Use video_device_release_empty() while registering the decoder and encoder
> > video devices so that registration failure paths do not free them through
> > vdev->release(). s5p_mfc_probe() then releases each video_device exactly
> > once from its error path. Restore video_device_release() after successful
> > registration so the registered devices keep their normal lifetime
> > handling.
> >
> > This issue was found by a static analysis tool I am developing.
> >
> > Fixes: d0ce898c39bf ("[media] s5p-mfc: Replaced commas with semicolons")
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> Frankly speaking I don't like this dancing with video_device_release_empty() and
> video_device_release(). I would rather make video_device struct a part of device
> state and use common release function.
>
> > ---
> >  drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
> > index 32eb402d439c..75abb0a8b7a9 100644
> > --- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
> > +++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
> > @@ -1376,7 +1376,7 @@ static int s5p_mfc_probe(struct platform_device *pdev)
> >       }
> >       vfd->fops       = &s5p_mfc_fops;
> >       vfd->ioctl_ops  = get_dec_v4l2_ioctl_ops();
> > -     vfd->release    = video_device_release;
> > +     vfd->release    = video_device_release_empty;
> >       vfd->lock       = &dev->mfc_mutex;
> >       vfd->v4l2_dev   = &dev->v4l2_dev;
> >       vfd->vfl_dir    = VFL_DIR_M2M;
> > @@ -1395,7 +1395,7 @@ static int s5p_mfc_probe(struct platform_device *pdev)
> >       }
> >       vfd->fops       = &s5p_mfc_fops;
> >       vfd->ioctl_ops  = get_enc_v4l2_ioctl_ops();
> > -     vfd->release    = video_device_release;
> > +     vfd->release    = video_device_release_empty;
> >       vfd->lock       = &dev->mfc_mutex;
> >       vfd->v4l2_dev   = &dev->v4l2_dev;
> >       vfd->vfl_dir    = VFL_DIR_M2M;
> > @@ -1416,6 +1416,8 @@ static int s5p_mfc_probe(struct platform_device *pdev)
> >               v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
> >               goto err_dec_reg;
> >       }
> > +
> > +     dev->vfd_dec->release = video_device_release;
> >       v4l2_info(&dev->v4l2_dev,
> >                 "decoder registered as /dev/video%d\n", dev->vfd_dec->num);
> >
> > @@ -1424,6 +1426,8 @@ static int s5p_mfc_probe(struct platform_device *pdev)
> >               v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
> >               goto err_enc_reg;
> >       }
> > +
> > +     dev->vfd_enc->release = video_device_release;
> >       v4l2_info(&dev->v4l2_dev,
> >                 "encoder registered as /dev/video%d\n", dev->vfd_enc->num);
> >
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>

I agree that switching between video_device_release_empty() and
video_device_release() is not a good approach. After looking at this
again, I think the real issue should be fixed in the core error
handling path instead of working around it in the s5p-mfc driver.

Please ignore this patch. I will drop it and look into a proper core-side fix.

Thanks,
Guangshuo

