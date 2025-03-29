Return-Path: <linux-media+bounces-28989-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CD5A75756
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 18:50:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4B007A4DA8
	for <lists+linux-media@lfdr.de>; Sat, 29 Mar 2025 17:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ADDB1DB122;
	Sat, 29 Mar 2025 17:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NyBTVXXN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF88182D2;
	Sat, 29 Mar 2025 17:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743270646; cv=none; b=rH08XHbaSOPHd/vJVM/oePSYIbpzC4+UzGaWWg8tT6XycPjjZMbTu5n4DckJGLIniFGDpcUoLuDaxUryUowgVsVj/DzNDlj+gm8vmEsTeKTX9iu+DMDSwLz9sRbiUPMT5SqvGLwF3zTWp4bal4jwLpPKX+ZzmHaC/6k3jFY3KFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743270646; c=relaxed/simple;
	bh=JgLSRMYPkcIuxIRmIYdn780sIE92C1U7KJGyVq99cZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fEd0auz91Cblm2VJhJZYp1+UjKFvmAkEMmQ6v4T0wQyTpxk/MDt1EEJpSCIno5f3irfnlpIn4g+V0U4HnWhb+Re9j93h4tCRi8qvGouOBiAbQ0EfayPT2q1rEa54Aqy8UagAYLGGJ6FVSChQ5yBjk+iIXWudGFnQmK3jzFSETBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NyBTVXXN; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-476b89782c3so35870921cf.1;
        Sat, 29 Mar 2025 10:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743270644; x=1743875444; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgLSRMYPkcIuxIRmIYdn780sIE92C1U7KJGyVq99cZg=;
        b=NyBTVXXNRp8a3cp5dIMveiXI/w5dONLbNMewa6jgnm6qMabJYO55zyui0scTY9zZtR
         JwTxiykSZ4B+wdFdU88wDSsSKAehVAAb9/VsspsX41G1l8WnZrQ+NDlpyg92abD2Sbxl
         ohEFZ4NiOHLrsvm4cc99rX4yjBf4/m/6NeRdZeLtKsWaOOlP1KtOZF54t/REqcNBzTFa
         kxY8dpTycZd7zglY0OmxtOQX3DTTZj5HCYeQACHjVq09eZPDi8fc9MstYk/fnq9Uscp/
         ojU0sBImlKCe54Gz+Dw1PfdbQB7aSMtFnhkwKyDMKHLayRIFkcnfhhc6Cea+PEtfAegg
         9FSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743270644; x=1743875444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JgLSRMYPkcIuxIRmIYdn780sIE92C1U7KJGyVq99cZg=;
        b=X/Mj+Gm4e3Q97K1WEsSSE+nGvGJuSSIm66NM+8B1YO7PPZmLLl2JABNHCNQcu+I1uC
         4UXUy5bXQcvTf5VMUlyue1RRpy+a6iQ0o1NobF0UlIH3FCIJVraRdBPc9TNpDAkCwWKH
         6Q4ZLY6ZsFB2jJglSk7GyFF1K1QKr3JCwHmmcTTurB7D3ByGq6OGejeboaAoxihSVwUz
         JSwstyvcNxdMs2sGUUHVzXfwtB4VEYqAm9ue1qP+4w/LOUwEMcomNvI4LhQF5k5gcNF1
         MNcieoxi9wqoDjdln3HV8STWHSyeNrA6RM6mP3bpzGAfHX7vLtvir/pI03qdeo+mp0Zw
         Oajw==
X-Forwarded-Encrypted: i=1; AJvYcCU17+EjNd8OkBIIbeZmksNYCCITL774R2/25883VEVmatF2+Auyd0hJewUZDVwUMIQbUz09pN2QYdz23oU=@vger.kernel.org, AJvYcCVEMZKUUV2Gg0AsB40R6f46P4F7tzabX2xVAJHOd7iGLiFDs1sTyJBl3o7JzESX/2Nu39ih4zy+JcXoy2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFhsl1WTgNSMFW8x8/BPeB4i1uQDC5Lgmq2J21ZB+WkiwybkpR
	wCv0i0PYxH8BHd/9ROAYgODSN9FDWTjSJv108luLyRJNTh4iVptzoy+VJt3w9+/+AHAR0QP1/0Q
	ilJ+QKrvainrDN1GXXTjlzcZnyMA=
X-Gm-Gg: ASbGncsE6MP2EGDtA2fu3gsYhxVGoK8winJt3oyWnaDXa6MKUhV9XrkzTfX1GsXprrD
	azVOacfj3BUZz1WtdTyMZ8o75UoHJgBNpkYvvciPNsDvDP5BS/9tqQrkJlifbgYHJoIOmM+BEr1
	4WD4+L+9Nw4mUvx2XuSeqo1GuIDxC8kC8aPUx70U5i+jaiYMmHSOAivoEYew==
X-Google-Smtp-Source: AGHT+IEyfBtS6B8X2yr/f5ocuBfnuCUx2JnXYuIeBWNpQSzvULQDd+JR8MDrkEpwGjTkAau9a61tbFImJmfCo3M6KHA=
X-Received: by 2002:ac8:7f4b:0:b0:477:ca3:4b66 with SMTP id
 d75a77b69052e-477e4b29282mr47637391cf.12.1743270644050; Sat, 29 Mar 2025
 10:50:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <67e26157.0c0a0220.36adcd.506e@mx.google.com> <CANiDSCsvEke31SAgXhs_sXEN7d6fXrwuhJFsi2mzESq1Jc8pxA@mail.gmail.com>
 <CAKUZ0zJjdSDH3cw=8iKJauU5dmcq9TFhAaJX4yS5UQoiCUaguA@mail.gmail.com> <20250326001336.GA23984@pendragon.ideasonboard.com>
In-Reply-To: <20250326001336.GA23984@pendragon.ideasonboard.com>
From: Gabriel <gshahrouzi@gmail.com>
Date: Sat, 29 Mar 2025 13:50:00 -0400
X-Gm-Features: AQ5f1Jq8tHUMMY_4wNuFI9rLkWF9v3pWiux_nw6Gw_ZztqG7vxIoRN8bhMGdG1k
Message-ID: <CAKUZ0zKDy47cQ0ZQo-=1c7wmazbutF=VF3qX09DfZFBz01hh-g@mail.gmail.com>
Subject: Re: [PATCH] media: Fix invalid link creation when source entity has 0 pads
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, hdegoede@redhat.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+701fc9cc0cb44e2b0fe9@syzkaller.appspotmail.com, 
	skhan@linuxfoundation.org, kernelmentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

I=E2=80=99ve analyzed the bug report, and the root cause of the
"WARNING-media_create_pad_link" issue is a mismatch in terminal
references in the USB descriptor.

The format type descriptor references terminal ID 6, while the audio
streaming interface descriptor points to terminal ID 5. This
discrepancy triggers the warning: "No streaming interface found for
terminal 6", followed by the media pad link warning.

I confirmed this by changing the terminal ID in the format descriptor
from 6 to 5, which eliminates both warnings. This shows the warning is
correctly identifying an invalid descriptor configuration, not a
kernel bug.

Since the USB descriptor is invalid, I believe the warning is
necessary and should remain. The code should stay as is.

Regards,
Gabriel

On Tue, Mar 25, 2025 at 8:13=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Mar 25, 2025 at 06:05:00PM -0400, Gabriel wrote:
> > Hi Ricardo,
> >
> > > I cannot reach that URL
> > I was unable to access the URL from my email client when I initially
> > sent the email, but a couple of hours later, I was able to. Initially,
> > copying and pasting the URL into the browser provided a workaround.
> >
> > > Shouldn't it be?:
> > > Fixes: 4ffc2d89f38a ("[media] uvcvideo: Register subdevices for each =
entity")
> > You're right, I incorrectly referenced the wrong commit. However, I=E2=
=80=99m
> > not certain if it should reference a96aa5342d57 (Fixes: a96aa5342d57 -
> > '[media] uvcvideo: Ignore entities for terminals with no supported
> > format') as it's the latest commit affecting the line I'm changing or
> > the one you mentioned.
> >
> > > Shouldn't source->num_pads be the same as remote->num_pads?
> > The fuzzer (Syzkaller) that triggered the warning appears to have
> > encountered a case where source->num_pads and remote->num_pads were
> > different. When analyzing the case in GDB, remote->num_pads was 1,
> > while source->num_pads was 0.
>
> This seems like the real bug that should be fixed.
>
> > > Are you sure that your kernel does not contain?
> > > https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/drivers/media/usb/uvc/uvc_entity.c?id=3D41ddb251c68ac75c101d3a50a6=
8c4629c9055e4c
> > Yes, it should be included since I am running the upstream kernel.
>
> --
> Regards,
>
> Laurent Pinchart

