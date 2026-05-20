Return-Path: <linux-media+bounces-62237-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHaLOAKLDWpKywUAu9opvQ
	(envelope-from <linux-media+bounces-62237-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:20:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BC858BA2F
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:20:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C12613042213
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 10:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716223D565D;
	Wed, 20 May 2026 10:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bC9V1Qng"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1A43D669F
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 10:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779272112; cv=pass; b=NxxNQxuGDwKnpeQLCVQjf9ZYX3uGjVGDBb3Qv/4NubTehYAp1/ZQPn1z2/k25j2TQxw3KtqCDNNntACz7w9cOLC9IUMTtT5omF2J0UFQCz6SSK96OJIc2KeOVuPOo1VCenGhNrcMaFPae0BnF8KII5r21dVXupVNb/Yn11WjVrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779272112; c=relaxed/simple;
	bh=rwrlF6kTt6uSmFYsm4f0d1KHRzIXkfQ0TGrWWAABm70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nkEJy3tGeojRu1sL2M04b3d3JB9attIa/cj96BrTpG/Gt/LBqPoVPU00Zy+qVQqmOfFjfrh746/ipqxU5lFLuo/L5iMGpDz6zPy5AN6tbud4slcIMHO6PJvPu7wRaz5rKQ/ZGkD8o5Umlt1e8M3v/618oveIspW1gejgh4vNcts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bC9V1Qng; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7bd9f61458eso32296447b3.0
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 03:15:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779272109; cv=none;
        d=google.com; s=arc-20240605;
        b=ca9zqfx//x9yKQ3fE8e88lVBPNAEyjp7Xa6A7eInkFxqlPAt90KzGhqrOA6c+XmRBi
         jFIHfUfg4jy7j0/3OQBDw7k1G+Y8fL1brmUNhwHCex5QmH+91sXLtoPqlTM618FxWeVM
         wiii2HkkYnkf7EFUooVmvZP07LQuM0SMHZvu7CIkf2JZI6lCUv+YwHDmMNTRWPVPN1Ci
         BZATTVU96Smslo6Ex30ppaW49UW67oCsYP+mkOEujkNknS4sE1EykeDDjH/xukQPEwvA
         4nrEyeb/aLPI5hD1xVXDy0h/seX0QdguNbexACc1mV6B66RGf5qnn92vUIj74CrIGThn
         UtjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JLQF+coZTNdUCgn0Wy9DYtBdN0EPRmG+M+vZZk8VRUw=;
        fh=eDxPNu6XcYR7loekoaZwqejOaiVZl0Z9PJX8ocU0Uho=;
        b=ba68zpQyU3kgSydUgl/SfzB5V5GTGExtkPufN5WIXv7d8I1m9Tu6QSbwEAf+kXeGAR
         /OUmP+ycilFJ/Exl7L99d4Hd3BBhsUIyaHncuPI6SrS9Ekb/MD7l4U/+dru+3dwJVLed
         8/jRbt8yn/lz4jGMFJQus6pkXbnga2DUvnUVNIKr5qT0d/F2Ub/oPsbEy0LKNkPTZN7o
         uKRcDcFrDyoHjgexdWMe/wqJGeJT0mVI925K85PWZpDCBiYLc0TbpQ/bhAzMcTTKo6ol
         t4ycYRQjrj8YqVRMq4nnIwcgLO9tTGDsKiHw+eRH+PhScJM/7QOgfhpBqAVmo7ozS2PF
         Tkkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779272109; x=1779876909; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JLQF+coZTNdUCgn0Wy9DYtBdN0EPRmG+M+vZZk8VRUw=;
        b=bC9V1QngXgltOKIfWCNvUgsVOd043USM0amYGsoE6PF5pCjrkblaT2TLfcW53mDKe5
         EP2a1SfBVYmKdo1oF/BwPgveJswAsyNKeNlAmABFegcxch4rNt32B28I9nNLQAqUC0r8
         P4OQOLjfWQxjXeCIm/uG+JyXMCofdDZRmkWf3F+EcVENaUsgDMwGUCLUiSmSk2Wqe+xk
         uMgtts0Qg9v31rFVQsdeJ71ELsh3H2dz8npCCfiZjlUT3JvmeUkC5uqCcIm+VoO1hxsW
         /8FpnrAhcMf5GO3xeQ5s4TkDclz1Q2ILmBREuBce5RIp2LeQaAm+Xty609M/+80AB6Ii
         agng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779272109; x=1779876909;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLQF+coZTNdUCgn0Wy9DYtBdN0EPRmG+M+vZZk8VRUw=;
        b=ckHiwPvqNu+VMF+nVoebTM/k/hNvvLaNKPucVfmZGrY/A6cmhLNFDeaSGjexUG5aL0
         bJy8IWR3nnNpmuyP/GAzJ3w0VjtM+CO6m9SmrkUCIfp/aWQCcmDAbrQYZ1NrwxY78QlC
         RPYL1sSf3KlESpWstjHDZFg38e76gZ7/fKiCApGYaMDqg20H5zYt2IrF/LkLAEjNvMBX
         IdTrNAbFag8aPt28ETyEJpF2CyPa+kzGPJj7RILTdU4PWh9nPVyA4+UBvwbrpTVhvcUC
         gxoGaIiEvnBX1xil6Y6klhGIh5erlscWuQ/8avBgmr3z5j/NS2ZcrL2qe1IKwZY0yrwP
         Q0Zg==
X-Forwarded-Encrypted: i=1; AFNElJ9YkRFHe11m+rXX5yGF7uU6CNhEIo74zUSN6qtdauZDBVlBrpaFRc/pS2fXqLoQjrc90zIG8fZxBlY0wA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyO3NdJYo3SrLrROcEliW64w+eO8VdVwwJkjzPOfqlXtfsOaq/9
	zyDVIyYY4sl21q+CFAVcAUMNDUC+0Ks/fJzAjoddNy/Zje1AchbPb2RDedeQ9x7IXKYoSVWuKA3
	BHfYuEjom9iY4CsaxUhfTsFBJLTTAFig=
X-Gm-Gg: Acq92OFowQj7weETg7VerkAjo8ZARwVKEGaQ7w7N2cPNJNh42zF1zZaxMktjZ2seWAt
	tL/2sBRkcqqeFKe5yB/Iv3o5WzrVSwzuiHma7hdJVrmbj7VVYMwctL9TVb+QWENjK3ylMOt7pMk
	yw4TD1UHJgZSOFJmtJOApWvEpLhgUTChdWcIcrzvYU8cjTylxOxVtDajAmg6UinjdBAKMoG0pDf
	aMWJncGs+PART7fyFXj+Nca5lI4dJiiSDMvtS5hcUEGmu1LvCgZsqawBTfBK2ithranXpSe9gpL
	J9P8mukGLZ+NXYeMWK8=
X-Received: by 2002:a05:690e:1908:b0:653:1945:8fab with SMTP id
 956f58d0204a3-65e22880b0cmr23657412d50.43.1779272109508; Wed, 20 May 2026
 03:15:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520090624.1071139-1-lgs201920130244@gmail.com> <ag2GhHyuomEqUq88@kekkonen.localdomain>
In-Reply-To: <ag2GhHyuomEqUq88@kekkonen.localdomain>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 20 May 2026 18:14:55 +0800
X-Gm-Features: AVHnY4IWOZLmxgP7sV8LlSeDcR0xqOlv6JBPekeZXAxwfgObCZzvf620WlPTgfw
Message-ID: <CANUHTR8uaRa8KjZizLZaimwY7y8xyUWChMNopRWZ1_oJHijp9A@mail.gmail.com>
Subject: Re: [PATCH] media: v4l2-dev: do not fire driver's release on
 __video_register_device() failure
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Kees Cook <kees@kernel.org>, Ma Ke <make24@iscas.ac.cn>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62237-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: A3BC858BA2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

Thanks for reviewing.

On Wed, 20 May 2026 at 18:01, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Guangshuo,
>
> Thanks for the patch.
>
> On Wed, May 20, 2026 at 05:06:24PM +0800, Guangshuo Li wrote:
> > video_register_device() / __video_register_device() registers vdev->dev
> > with device_register(). Before the call the video core sets
> >
> >       vdev->dev.release = v4l2_device_release;
> >
> > v4l2_device_release() invokes vdev->release(vdev) as its last step, and
> > the driver's vdev->release hook is commonly video_device_release(), which
> > kfree()s the vdev that the driver allocated with video_device_alloc().
> >
> > When device_register() fails inside __video_register_device() the core
> > does
> >
> >       put_device(&vdev->dev);
> >       return ret;
> >
> > which drops the only reference and fires the v4l2_device_release()
> > chain:
> >
> >   __video_register_device()
> >     device_register() -> -E*
> >     put_device(&vdev->dev)
> >       -> v4l2_device_release()
> >          -> vdev->release(vdev)
> >             -> video_device_release(vdev)   /* kfree(vdev), free #1 */
> >
> > video_register_device() returns the error to the driver. Drivers that
> > follow the documented ownership contract release vdev on their own error
> > path, e.g.
> >
> >   driver_probe()
> >     if (video_register_device(vdev, ...))
> >       goto err_release_vdev;
> >     ...
> >   err_release_vdev:
> >     video_device_release(vdev);   /* free #2 -- DOUBLE FREE */
> >
> > This is the contract documented in
> > Documentation/driver-api/media/v4l2-dev.rst: the driver owns vdev and
> > is responsible for releasing it if video_register_device() fails. As
> > Hans Verkuil pointed out, the right place to fix this is the v4l2 core
> > rather than every individual driver, because drivers are expected to
> > follow the documented ownership contract.
> >
> > Neutralise vdev->release around put_device() in the device_register()
> > failure path so the device core cleanup does not run the driver's
> > release hook. The driver-supplied release is restored before returning
> > so the caller can release vdev according to the documented contract.
> > Successful registration is unchanged, so the normal teardown sequence
> > continues to call the driver's release hook and free vdev exactly once on
> > unregister.
>
> May I ask how the issue was found?
>

The issue was found by a static analysis tool that I am currently developing.

The tool reported a few double-free issues around video_device
lifetime handling, especially in error paths after
video_register_device() failures. I first prepared patches for the
individual drivers where the pattern was reported.

After discussing this with Hans and others, we concluded that the
problem is better fixed in the V4L2 core, since drivers are following
the documented ownership model and the problematic case comes from the
device_register() failure path in __video_register_device().

Best regards,
Guangshuo

