Return-Path: <linux-media+bounces-25452-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA54BA23BD7
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 11:05:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 666A316890A
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 10:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B76317C225;
	Fri, 31 Jan 2025 10:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q/kxEtZ/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48C9145A18
	for <linux-media@vger.kernel.org>; Fri, 31 Jan 2025 10:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738317898; cv=none; b=flAWpZ+DpAagzZec9ySE85btMSUh05XjCXOgY/GgxiyeFraXFoFaY7yvOnqWbY3u+Utubeo9c4fZb1XuEOtZNjCXBE0a+s40IrZBuIP7DN1L/EiKQ/b8k2196Wr8/l2d66QXEgf6DQ4C2hKL5Ti3LHY0T5XYazF++mZIU5iTm8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738317898; c=relaxed/simple;
	bh=Tm1jzmuaCg4tm3xDyskBAan6nPRBolotjXi6IDQfhZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V9WJqmjk9ZpOhrm4w4bcJN6Gs4W+z1U28euMQ45txTvZPRTjcKKPpBt9sR3EoKanUcZ28kAWPdY4Wr+zrH9gQry89VoCz7mLz+gX6JlKp6nQj3p1N1IyNmMZxcDdqw28vdU/5OhwHdURoCKLUpWvXNZuWyW7gqTB0nnkG9k81n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Q/kxEtZ/; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3076262bfc6so18734051fa.3
        for <linux-media@vger.kernel.org>; Fri, 31 Jan 2025 02:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738317894; x=1738922694; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tm1jzmuaCg4tm3xDyskBAan6nPRBolotjXi6IDQfhZU=;
        b=Q/kxEtZ/1S7H+7vXEgkT8nyEM4UZqqy9cDcw05V0CF24oCqetHzBXqGXQGoftieQ2D
         grtkJfyVfzp4ZLSy6nEKzQqcIz7nlcuDSGgLx0873kalvEGOW+WKPiIqCW4dg7CQzbJs
         ou9ev9s79AGMXUb31p320slxpafkC+Ah1AjjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738317894; x=1738922694;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tm1jzmuaCg4tm3xDyskBAan6nPRBolotjXi6IDQfhZU=;
        b=Pa59N12GO/wjge2SPaPKsS+4p9sSlXhQkijSp1+Y8VFBjv6cHK8gVvFim2UFV0oEgy
         x24R6HVN2mp8Gqlih6BGUcLybTM3wdvKUBeqpwhLeVO4BfxGiponV8IgoO7codB3qfXi
         aqBFTP1Yli5kPackSYxaT9aJLzZ2RuiKYSHxE4A9JXIkh+wGgo2gDgqmBMUdLq62N2DV
         LmiwwbAy5QImEwrNFMQlz/2xhUkkS3XZ60Hh+IYLGkg1vHJ+bhDjdqCsqUYq3i0X8/u+
         0oeA/8wcgxKRZoRqCT6btwANtZkdUpKhxfC0NY602fBJIXzfbp//+AydUu3UYOp8D8qx
         n0Ow==
X-Gm-Message-State: AOJu0YzNVT05X+XQRDl+42cXkp6uK3IYpvibwhL8b2ih33PxxeOX6hoy
	LfizeUqrrRJdLbTZmxWpj9/3iAWqX4aZW+fMn9RI249MgDXzpxhU46vtxQuw+XnDB4kz/pxqYio
	=
X-Gm-Gg: ASbGncs1dhovTr1TIaf013wbMeES15Y9mFXt2KgT9GbeJaXtwVo7z/bnBWlZoUV8a0q
	kEHdCKvCRDbFO4ewvM/R5qN7YEEQzWeRO2BXNR59iVOioeLnmmkO61Y3r8VPk5gOXcwWPnEKp6u
	+bcLAGRypWyGV/EJL/QzhuPEO3i5kqG0rfbuiwW1XW4x0BBw5DFjEnpDEudinG22FS12KXm/xbb
	t2scbzGzn01k2h7ZW2k2uIpWBFOP1kCkrNhuNn/aPiV3K1jSvbVRBGN/ojRbxVw7DncU5vzZ+J4
	9tEkfiPKkAjUSQro8yE+Eh+CtT1Dl19i4w5vD2hRk97g2cpzp0T0nA==
X-Google-Smtp-Source: AGHT+IH4BFOEHSDQzFWKk3+/R+wHBcelf3iRh1ungru5WUuo6PZENarY7vf2JG40hAnfsVPqmgFCOg==
X-Received: by 2002:a2e:a914:0:b0:300:25f6:9b3d with SMTP id 38308e7fff4ca-3079684e440mr40396461fa.10.1738317894490;
        Fri, 31 Jan 2025 02:04:54 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a3088938sm4967181fa.31.2025.01.31.02.04.53
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 02:04:53 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-543d8badc30so1836658e87.0
        for <linux-media@vger.kernel.org>; Fri, 31 Jan 2025 02:04:53 -0800 (PST)
X-Received: by 2002:ac2:5dd0:0:b0:53e:362e:ed6 with SMTP id
 2adb3069b0e04-543e4c417f1mr3547325e87.50.1738317893100; Fri, 31 Jan 2025
 02:04:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z4aeK4Ct7L/9kR2H@quatroqueijos.cascardo.eti.br>
 <20250114200045.1401644-1-cascardo@igalia.com> <CANiDSCvx4QrAuhXgF51W+-B4XJU-6bxTd=5vCuw9SPmKXDXjdQ@mail.gmail.com>
In-Reply-To: <CANiDSCvx4QrAuhXgF51W+-B4XJU-6bxTd=5vCuw9SPmKXDXjdQ@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 31 Jan 2025 11:04:40 +0100
X-Gmail-Original-Message-ID: <CANiDSCu6ociHkyatMHpH5a2TDsMmHNr=f7-wvpwGDSTw=DKNhQ@mail.gmail.com>
X-Gm-Features: AWEUYZkZtDTnauTUATJYFKIqi6yUpPjypPyKgHcCyybqtKGbtfZ6X6-V1rDGz8U
Message-ID: <CANiDSCu6ociHkyatMHpH5a2TDsMmHNr=f7-wvpwGDSTw=DKNhQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "media: uvcvideo: Require entities to have a
 non-zero unique ID"
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, Hans de Goede <hdegoede@redhat.com>, hverkuil-cisco@xs4all.nl, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, Tomasz Sikora <sikora.tomus@gmail.com>, 
	kernel-dev@igalia.com, syzbot+0584f746fde3d52b4675@syzkaller.appspotmail.com, 
	syzbot+dd320d114deb3f5bb79b@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Hans

We are seeing a spike of reports with the signature:

"Found multiple Units with ID XX"

Could you take a look at this patch? I agree with Thadeu that the best
strategy is to land the revert asap and when the storm disappears work
on a different solution.

Regards!

> If we do not find another solution in a reasonable time I think we
> should land this ASAP:
>

