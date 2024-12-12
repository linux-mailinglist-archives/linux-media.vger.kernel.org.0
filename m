Return-Path: <linux-media+bounces-23320-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B58919EE6A5
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 13:26:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 400D428420B
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 12:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AABF12135BB;
	Thu, 12 Dec 2024 12:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0Jm6z+ix"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9BB213245
	for <linux-media@vger.kernel.org>; Thu, 12 Dec 2024 12:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734006361; cv=none; b=V/+NCRcFmj2Xw20uc/Rmh8bRVVHRqXSv+GhbuhkHe43aE79MUpszX2NKEzE2LTpA2OroNx0jE1K5LQv92nBrw5PCx9HSdh1E9FPuKIMnplEOYinBESQlDqtatMoWj3t735vETglupzIvk7KpUTO9jsehVqCLiYJZFmSXwafk8GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734006361; c=relaxed/simple;
	bh=fBaun++Lli1tdhYkoL9iAAF0iy57QmpVUN/vI1Lak7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uLlXPza1/LFzLzoAv41HSrmuLa21fMwK+SErJcjzCaURzAdBJQIrRcOsytyaGXh2Hh1214C/cIeU+5JdWcG3a2iIe5MYUwhde2kIH1Qkrh0FlXnvqgJfwtMB+a5pb6Rk+mW9tHELxfPPfZNsS3Uc4q6V5NPKhlXPyyyWUow0imo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0Jm6z+ix; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7fd5248d663so470950a12.0
        for <linux-media@vger.kernel.org>; Thu, 12 Dec 2024 04:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734006359; x=1734611159; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JcXRJ7nJRwGF7UgU3RGG/FU0UMiV0ZEJ6H8qX/8/UWg=;
        b=0Jm6z+ixicXmb+WwvycP8NnGmLD+ssEyTzWBho5iWyo2CTWLs3mf39ULLuagdln5se
         RlIaG7Ma5sSP1tyL4TdVV9WcWVKTJbiCFFPhuwle3nVIcmQBbV2QEsabalgVXxDjY9c+
         Hiwo/EgihvBbYDIVgshubY4rfs1D0h+zXqWrzKRkbxbqAE7ysqkHu7jj5aBPCOKpJj6Y
         SdocV7spyXFmRGucI7IWXK4VT0Ekf6ARz4Mmh6rOK++ChEPkajAt2C87KixFRYANGw2y
         4EANhAcIVJLsC++XeyupbfjaFWK9ud19tLgGCwhNKS/iyDa6QnyRbp5fuhKuTyad0YwF
         mz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734006359; x=1734611159;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JcXRJ7nJRwGF7UgU3RGG/FU0UMiV0ZEJ6H8qX/8/UWg=;
        b=VK3CxSvQB4WWI+0XeM7BXdpKVnfkeMa2jUys9QNOR2/6v2KPMH/UAOV3cY1QCk5t6e
         NmktcIrylSqLbhIBsSKiH/hsPg42ypRtZRiFoIxX+joJ5PI/xGTcxI0qT751jZXBVFCA
         SWUsE5RM86so7Y6OItIW7++H0qysb3UOfbLAlJC6BzRAQZRjV7NhAXNvqr5Nv2GlE4qW
         wnbd/6UMjLF+oD5Yf1ZlhWFeLtEN2RANoPHpCi8AYMFurnVXlxZJyBY8Tl2w90MouZfS
         VVgGyMGhY3p2v0hGBZkBgbMeBsGfTHoHDLrrrP0IKN1b9fpiC3c29hKKNzHArgo5bS4A
         EO1Q==
X-Gm-Message-State: AOJu0YxYIlKfdQCf4bDnnEvYC6iUTlMBovzqlOEfksiSA0axmC4VOhov
	qsH1wsEMLucewh0kQDDQ43srGauwpom45XTtcuMcZRvey3C4Pe2lL0JmjjjPULPToL54TLU5RHT
	YW2k4QwiLLTHoTTlRUnXnclpQH5TI+tae9NYnhYxADjYUpRGg9Da5GYE=
X-Gm-Gg: ASbGnctZ+MwND2+Y2cz4WSZU4v9yqXL59yu53mMWMp7xm5DxHubRw9one0pdJ1H4Fo6
	YRQuBlF1Merr5bP+6kJY/HsCp/KsX8E6fu+cuavvdfdrJ+QgeQmtN2/W9CTgW45lqZwYO
X-Google-Smtp-Source: AGHT+IEi+raXhApqoug7B1QAHIchpDRG8DvxlrQi7z9b1wxR7wr5XGfxoP7hAzg9mYVpJVxGYyQhym89gLp5hlzjEMc=
X-Received: by 2002:a17:90b:1a8b:b0:2ee:dcf6:1c77 with SMTP id
 98e67ed59e1d1-2f1392950dbmr6005480a91.16.1734006359474; Thu, 12 Dec 2024
 04:25:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiDSCuYj_xV_b1VEVfS5ZgsXKnUSXc0W-4Rd+gip+9zkCzTXA@mail.gmail.com>
 <CAPY8ntAZTfwf7md+5eevAortfSKw+6DvJipC_UpuYgwm9AnVjg@mail.gmail.com>
In-Reply-To: <CAPY8ntAZTfwf7md+5eevAortfSKw+6DvJipC_UpuYgwm9AnVjg@mail.gmail.com>
From: Ricardo Ribalda <ribalda@google.com>
Date: Thu, 12 Dec 2024 13:25:47 +0100
X-Gm-Features: AZHOrDnWO0NtKL-uS1oE3bHTnXWSHka3Ka18WsWuj4YlciiTYmYS23orawYTLNo
Message-ID: <CANiDSCsrnV5O40jZf=dhCgM-O1F6RrvLozxQd34h7phNECKf7Q@mail.gmail.com>
Subject: Re: RFC: User/World Facing camera control
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Dec 2024 at 13:23, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Ricardo
>
> On Thu, 12 Dec 2024 at 12:14, Ricardo Ribalda <ribalda@google.com> wrote:
> >
> > Hi
> >
> > For a system with multiple cameras (think of a phone or a tablet),
> > userspace needs to know if the camera is facing the user or the world.
> >
> > AFAIK, we have no way to tell userspace about this it has to rely to
> > tricks/hardcoding. Eg for UVC cameras they match the vid/pid or the
> > camera name.
> >
> > Assuming we define a new field in the acpi table/device tree to
> > describe this.... Would it be an option to add a new V4L2 standard
> > control for this?
>
> Doesn't V4L2_CID_CAMERA_ORIENTATION already meet the control requirement?
> "This read-only control describes the camera orientation by reporting
> its mounting position on the device where the camera is installed."
> [1]

So it wasn't a bad idea after all :)

Sorry for the noise, that is exactly what I need.


>
>   Dave
>
> [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/ext-ctrls-camera.html
>
> > Any thoughts?
> >
> > Thanks!
> >
> > --
> > Ricardo Ribalda
> > Software Engineer
> > ribalda@google.com
> >



-- 
Ricardo Ribalda

