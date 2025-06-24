Return-Path: <linux-media+bounces-35780-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93446AE654D
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 14:45:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26CB44C07AB
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 12:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8B42951CB;
	Tue, 24 Jun 2025 12:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1xwT2Rr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7F429290F
	for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 12:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750769110; cv=none; b=LYz2S82ZdoIf4Yh5s5tois6UdAXXudU9nALrFauKIleSOAqM6ixTqoxb6w+2d62ITQLTpfT3XC5iCTwGRdNg75T44b6c0lav1docs4IqG1m1nJlVeJYme/s/F83vRgs+3IpsUnrGhx0l6qZDgWyPIZK2PrR5P4MpDsnuXSXzkSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750769110; c=relaxed/simple;
	bh=Fe71F7HdcAHhNcecH3dW8Mmyypodx3hGpbxIQFgA/HM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RSVj0GWZU6Y90g0XcRLCLVnsNNRZTdFkPw4080lFG13XLu2yaU5Frcv1tsUuYcW3pYcHEEaOuJGQ1aY++ypSPTGnlRRRV3U7ItYufL2OsckNHC5qibieaJuPL8TBXg+J54dw9HwLelKCTr5GnnSnMq3oF3uuX5uJv4LVZQNuAKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1xwT2Rr; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32b910593edso3429391fa.1
        for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 05:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750769107; x=1751373907; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44fmXxwkfoot3fh9e2sUcZb/KaObynpb8RV8HjoXy88=;
        b=J1xwT2RrNfxvGSCG9I/gKFUM9+ZjzRBsnFiu5NrITv0M4YJVD6fx/yjfL/nrS+/EyS
         UCZK/bByQ27iUHtCicVFe0UzaGW9wwbfgJXOEWwvkC0eb1EVgTVpy8G3+EorOoz1uHw0
         muwYLbPXWf3TNn981kYqmo3mTEK9rlSE19YhCkTMrXLPT8KkRAB30Zg4E8DOn0U2Mwex
         zAADN3JIa6p10IDc1fdiSswkxSkHOocjdLdWUZvZ2BCW/WPSnDCA2O7S5XrSKUaz7ocU
         FhVIMnzAusTmRAVikmJSwPVvP3vUDhxQecaeJ3yiM+HUj7fKlNBX8HzeHNr6gltelMH1
         wDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750769107; x=1751373907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=44fmXxwkfoot3fh9e2sUcZb/KaObynpb8RV8HjoXy88=;
        b=q0SsKfaH0xGeFkEWx/bg5ZX/L1HyOS0QN+hxeemYh2wgoPDbAAKpbGMB6cL/2pG2P4
         9F6k2Xjqj6kQfw13WVVY0Fa+HsHHJ3uz7xF4mgAp2AIRXuDRXbMs6vb4mQNYupVIA4jY
         zd6F8/fWnGUN40cmeXPi7eSKiRel6VKC2RjKQgVhWnPDBzw6kF4HfybzT1/UenAQpuLp
         TP07jQyT4SitW6Co+wsITQpoBfo2yeVXz8V5hj96NE99zPx/boDzGeFn3YeQ63QL/tNA
         pbnjjlOG0KtIdlMLlq1eBKiPyrWFHrES8VLLAedyBvzKvIeuAc6Q0ujX57ZeLctAoG+F
         rIGA==
X-Forwarded-Encrypted: i=1; AJvYcCUBNDieTNiWXslhhgS2acPWfB3Ew24vMoXFb0TsUK1NAFpXNlHoPWk+yybxpFffDwv4ttU6ufUad9L46g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Mrk4OewKbyQg9ajdfmW4UuifiEolncrKEOs4qAeGYCt3NKh8
	ESZwVrmgFbcTPC/EgUDZEiF2a2wLZrZNM501Aqj0boI2cq/UAd1fB/zXoH3L6DzAWR0YGn5YSqV
	KyL3QSIb1Oi/rKA2b3DK9Gb+zCKg0FWA=
X-Gm-Gg: ASbGncuR8gZKi8lSIkjxsaPJ9Xg5qCmsVujHtR+6IDY6dUQ1lVwYwYHZmS2PlvhE2yh
	G0kik96SeT4RpESqLab9MrFIQkJ6SwPLe4vNVa0l7Wnn9nQWT7iYjbsf24kN6wN1bZqIsCg6ICs
	o61L6VdHhXIIDw4yd69vap/3ZT9fthJlfQuRtl9hEVsV5fEpMNA6cO
X-Google-Smtp-Source: AGHT+IH2lBkY1ADP0+cdT23Em7atsIb38nWYG2n+FU1ignsSzeqEiR540m43rOF1AvX/ANCieUtZXY4nV/+C8ec7qEA=
X-Received: by 2002:a05:651c:1076:b0:32b:47eb:8bcc with SMTP id
 38308e7fff4ca-32b98ed9d8emr35090731fa.13.1750769106783; Tue, 24 Jun 2025
 05:45:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623110035.18340-1-hansg@kernel.org> <20250623110035.18340-5-hansg@kernel.org>
In-Reply-To: <20250623110035.18340-5-hansg@kernel.org>
From: Daniel Scally <djrscally@gmail.com>
Date: Tue, 24 Jun 2025 13:44:55 +0100
X-Gm-Features: AX0GCFuXne4BdWkxq1GjoRY-ZZyRv-lm4brPtspHXd5IFYUSfSVbgzp3brM2jYs
Message-ID: <CAFLoDVG6BenJKaa=TSYzBN2kZP2qCGKq=sB=4KW4aFjNiGUgMQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: ipu-bridge: Improve error logging when waiting
 for IVSC to become ready
To: Hans de Goede <hansg@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 12:00=E2=80=AFPM Hans de Goede <hansg@kernel.org> w=
rote:
>
> From: Hans de Goede <hdegoede@redhat.com>
>
> The ipu-bridge code waits for the IVSC to become ready (on platforms with
> an IVSC chip).
>
> It does this by returning -EPROBE_DEFER, but it does not use
> dev_err_probe() so no reason for deferring gets registered.
>
> After 30 seconds the kernel logs a warning that the probe is still
> deferred, which looks like this:
>
> [   33.951709] pci 0000:00:14.3: deferred probe pending: (reason unknown)
>
> Use dev_err_probe() when returning -EPROBE_DEFER to register the probe
> deferral reason changing the error to:
>
> deferred probe pending: waiting for IVSC to become ready
>
> to help with debugging why drivers are not binding if the iVSC does
> not become ready for some reason.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Daniel Scally <djrscally@gmail.com>
> ---
>  drivers/media/pci/intel/ipu-bridge.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/int=
el/ipu-bridge.c
> index c80af394ce18..dbb847a104e0 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -811,7 +811,8 @@ int ipu_bridge_init(struct device *dev,
>                 return 0;
>
>         if (!ipu_bridge_ivsc_is_ready())
> -               return -EPROBE_DEFER;
> +               return dev_err_probe(dev, -EPROBE_DEFER,
> +                                    "waiting for IVSC to become ready\n"=
);
>
>         bridge =3D kzalloc(sizeof(*bridge), GFP_KERNEL);
>         if (!bridge)
> --
> 2.49.0
>

