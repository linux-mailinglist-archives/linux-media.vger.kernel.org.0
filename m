Return-Path: <linux-media+bounces-30587-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CD1A94F06
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 11:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5EA6C7A74BC
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 09:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6794225D8F6;
	Mon, 21 Apr 2025 09:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YwuW92X9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A3719DF99;
	Mon, 21 Apr 2025 09:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745228991; cv=none; b=Kwyd8qy5PAumGdHOmP5MMMkQnCt4i9T47dTXz6J5cZTSbtZT7yMlZMA5Y0XQ972eXfWSSSeNubezIM/tzoPqqXXCqhAc9u/tmdtWaBjZGblsoc7YbdG6TH3FmRingBcNDUtpznU9brsVIbGCz513qo//yHxZMmOMmU+MDXo3d50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745228991; c=relaxed/simple;
	bh=v+Yuagx2PihBMMrWmfAQKXavj3eAD4INx4YN31dWjxk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oowwpaNXxIfrdO8kNt2KmNESdPwCWX5+rDyGMB/P3ulyqIYg0QnbmRELdKQ6QhwLOVJuaRU2+kKvm3tIj/b8DfhBaQyoz12RPWOrZc06u4XwmiRA6tfHnwLu0U15UvThcoYpXyGDL/s0kJiIXr+N+CCKehy64R+be1xt7G4vp9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YwuW92X9; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-548409cd2a8so5128190e87.3;
        Mon, 21 Apr 2025 02:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745228988; x=1745833788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XP67hn2BmEJVpI7ilGH7ZZkNNg/xaXONtFOtDQ/ick8=;
        b=YwuW92X9aY5KYpSOOXHpXkOnZDyuvA0WH5/jqGOozUuRbmPoSa0vfjH6B0u44gnn6p
         RzdG/qVYVeuT/1FS4dVOJw2+emWmEt1i6TXlEATYlxDchh0IbpNXtqyZDDKqqRR/Ky57
         65TxmILG2gqsPyxK3yOsiuLdgbPMYF50eqQ1DDwba+OMvU9ySUx7vTBHqtz6IA99+tCs
         togKP4Oob/KFqa3qWQY1QCkQHFRfCSjvvycplyHlzNtRDhUtyTaXlzYtmFy0a/SAl44v
         VBKtbucFQjxWnTLW6QKMKP6SEJ55GZ1gvW465bTBKYg9nHkoxsFKn5Mdv4VLde6SnTF0
         ERDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745228988; x=1745833788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XP67hn2BmEJVpI7ilGH7ZZkNNg/xaXONtFOtDQ/ick8=;
        b=n5ftJYaZl/izbEDvC2qBqBmmDKqy2wARhW9iEaNOw+pANxDrmAAM/MhmGNLPMR6nal
         T9BRsQqHyxab8imGlIf4M44nvzaPV2JKee/Y5kWnDf+Y27recSE8Ned2rYklYvsK526R
         TC2ZvWa5+H/CdXKenMgeVwguAMUpXqzprUxUvhvUiBk/uT8N2VvyZuanTWH+8UuUpU6/
         e1e8VTfHiuQHMi/l7vyYpzTKOXrSYXbOxn1lR2NeeiP5Oyr57gzz92Izbh1ZbwZQck9D
         tUsAC1xDYF9tjXTfBS4JhI+NQYEmOAtexgrC5lQCg8cOR9uD8ltMN5oW9brHCLYJHG47
         t/nA==
X-Forwarded-Encrypted: i=1; AJvYcCVLFLZWokd8Qdz8eY1PnAcm6Z4UPN1qDmP4jbiNex86Tu3pUkFNysvCfF6kAdnnKOnTODFyqNNTPubjonw=@vger.kernel.org, AJvYcCVWRVtI6geR8frvY1g04mWm3cHSatF5JdU20FmWFOnIAn8oG7dhtVXJBYvyNZS/CTV48W9yg3sGei23@vger.kernel.org, AJvYcCWv8vpWBdHX/ptlARLKv+TUMwmzHhVy/prHVnHcuZUWGs5cj/4gs0mjRJLlWVBT8goPxnEhbSMsYolFovo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPAZYaqCtQ7SeUfa1txKLl77mee3FZXSH4yJBQo9o+5gkN/DJ9
	GtLzxB3gO7UD+1W3uNEQPBRbFMyxVcHpTODhqG/LkV96n5MOqV1H
X-Gm-Gg: ASbGncs7nwNOYT0jMoZd+BRcYNEsf/kpNCfCPnYaWMJ5OEP++Xm7SHkFFpSBa1Pp67z
	QrmS81n45r0e9PyEmy1CwoRXV/G5OCUA9HvYtpUij8uz/C4cLpYrnnVHWcjAXO4NqC9+q1gMAZf
	EsJTjtUKPjtlMIpcAptg0NYoHsdv6wEv4Z8yU8LNwpVUNNg3pofRyQRng+henurGPaZQMQ4xajJ
	E/PwbUjxvgplVP4p5gCFWQauXfAWoxWk30l0Kot15/gVD9yNIK3YJ1WprjRtUwV3mH0uu0ZG0Lb
	xtxtLm2pW1f50hq/UimFRAxPt9xrCpxZ8548w+nhYQNoBqWAVMuQQyQRig==
X-Google-Smtp-Source: AGHT+IHn91puYlL4ZseLJ09YpA1E08ENhfGm6qWp+xrjCUt1KCqx3HTlCLvJjCWbPKZ4vbiKNy4e7g==
X-Received: by 2002:a05:6512:2386:b0:54d:65e8:31b8 with SMTP id 2adb3069b0e04-54d6e61604bmr3098798e87.5.1745228987892;
        Mon, 21 Apr 2025 02:49:47 -0700 (PDT)
Received: from foxbook (adtk186.neoplus.adsl.tpnet.pl. [79.185.222.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5cf922sm921663e87.149.2025.04.21.02.49.46
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 21 Apr 2025 02:49:47 -0700 (PDT)
Date: Mon, 21 Apr 2025 11:49:43 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede
 <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Support large SuperSpeedPlus
 isochronous endpoints
Message-ID: <20250421114943.085160c6@foxbook>
In-Reply-To: <2025042101-coyness-vitality-e636@gregkh>
References: <20250421095951.1e63824e@foxbook>
	<2025042101-coyness-vitality-e636@gregkh>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 21 Apr 2025 10:51:38 +0200, Greg KH wrote:
> On Mon, Apr 21, 2025 at 09:59:51AM +0200, Michal Pecio wrote:
> > USB 3.1 increased maximum isochronous bandwidth to 96KB per
> > interval, too much for 16 bits and the SuperSpeed Endpoint
> > Companion descriptor. A new SuperSpeedPlus Isochronous Endpoint
> > Companion descriptor was introduced to encode such bandwidths, see
> > spec sections 9.6.7, 9.6.8.
> > 
> > Support the descriptor with code based on
> > xhci_get_max_esit_payload() and widen all 'psize' variables to 32
> > bits. Subsequent calculations are 32 bit already and not expected
> > to overflow, so this change ought to suffice for proper alt setting
> > selection on USB 3.x Gen 2 devices.
> > 
> > Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> > ---
> > 
> > This change appears to be a strict necessity for supporting USB3
> > Gen2 isochronous devices meaningfully. Whether it's sufficient I
> > don't know, I don't have such HW. No regression seen on High Speed
> > and SuperSpeed.  
> 
> If you don't have the hardware, why make this change?

Because it's an obvious and easily removed limitation, and may be the
only thing missing in uvcvideo to support such hardware. I saw it when
investigating a related SuperSpeed problem earlier.

If media believes that more is needed, or if there is objection to such
changes based on spec alone then fine, at least the patch is out there
for anyone wondering why things aren't working.

> >  drivers/media/usb/uvc/uvc_  
> 
> This line looks odd, because:
>
> >  drivers/media/usb/uvc/uvc_driver.c |  2 +-
> >  drivers/media/usb/uvc/uvc_video.c  | 13 +++++++++----
> >  drivers/media/usb/uvc/uvcvideo.h   |  4 ++--
> >  3 files changed, 12 insertions(+), 7 deletions(-)  
> 
> Only 3 files were changed.  What went wrong?

Sorry, some editing mistake.

