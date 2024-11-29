Return-Path: <linux-media+bounces-22359-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 932069DEC2D
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 19:47:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 413A8163B60
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 18:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C9C61A0BE1;
	Fri, 29 Nov 2024 18:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i410UNyd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AE6145B25
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 18:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732906068; cv=none; b=VY5wW/wGPxnf4i3kD2TVvqHR4PtG9TyDgOu64H6tHy2nHr52Bp6s1+kAX1Tt1krmMDmcbjumSHvXn0L/mCDh5zPYl+O9wLo7k5YAGtkP18+2gsvjreuSAsjWiThLNshBqc6e8fpQCR0ZXIHoburdmPHry9bMHY0mzVeQWPmjFEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732906068; c=relaxed/simple;
	bh=yzFFrdXn8dr9euF4LM4kEvUL45wKK7RQ8v2pkms5H6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JTKZGGynWA9DfenG9j6sO52gSP0f6ouoly7KvcInhnJOyfLg3unw1uds9zOdLiCH7YauF17j+akChWVhG+Z02qHhaaqQ4U/F/Oj73ozh5WcB+8VNW1Ma9J2Fzx+EeTY964yS/cBIoVpUbcHVp3eX06Me3s++H7/XSIHhgtRUBqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=i410UNyd; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7fc99fc2b16so1249793a12.3
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 10:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732906066; x=1733510866; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KcVxSp/SGlyLOWsY0V+J8c8oFuDtTzhTcOpyJE61Nhg=;
        b=i410UNydrQYb+gpW0UcVSk0E6iDpeHrNeLvqPwkQ7XC8MtBJFg8SprlJN61ONP2Njl
         JU0THHxj9Lai+9XTB52NpvylourApt6BM+PnpkfEHmWn5idXFQS3+hRBkdTtv9ieVsAA
         Jk8awmQfsq1yEXJVsNdk9dUoc2lk69dr6gKx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732906066; x=1733510866;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KcVxSp/SGlyLOWsY0V+J8c8oFuDtTzhTcOpyJE61Nhg=;
        b=xJrqu+XtHSmfNMMALJDPbOcL1DLFB30N68Ri7DZ9w4czrUzUSVkmpzSqZsxoxxvrd1
         jQ2IVIfpJQ2oDTRATq60KFGbiUYcx2vhy10MuRFCCgTbtV272hJ5vuscGf5m9H4xFkeC
         pEB7Oj61F4S2gzkrM9Lpm7APil7TmaCwj9SuUA/gJEHTwSreA4YouQBl4JjgLWgZt/j1
         VSNRrmcZKFtaWi72Me9BrYSoU4t8uNvtsxV6COllJ+ivj0XXVre//aReTkMni9bEZB4H
         POLwxvtHz1RfSR9GAApJxgm/YZI5t1gbrYRBkIvD/sKPrFX5W3AjfwJ9S5Vvck9dAc5W
         ReJA==
X-Forwarded-Encrypted: i=1; AJvYcCWHrCHmLI+Nz04YcU8h+6H9fAxbKfYhmd8MliyDnEXTRf5wgpwEYthAI2UnnlnGtJEdz5513tbaIR/FPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAMDJ/uUMrq4fajFrG8NSmVO9fgQn7fH0l6erz8zOaDFixdw9M
	02vu+XJbhqVkEnUbRHeRXYD9dr786/DwlHC2ZTOn176hN3vSB/RfLIKsOugSrEQz47XA1Ue5y+4
	=
X-Gm-Gg: ASbGncuwLuZPspl06hKw76g064Hd6jxw4mtT6/9uD8fr+zkuHZg04tjtWJUPQoKomQH
	AGxSrY1CYEIJpl7tcEnE+ebiDlO6VvQhsonJ1Un5bZkRjOXGO4NIkzyfarVegoWu2NGDvxNx7eL
	Zf2ZwR538NAyyDFvL+IE/badGtjXVr64TkdlIIdCGUCoqfaZFCzhtqMtNzx4Dw+kZEzyT1OEsL6
	H8bD1diiBYRpm17TsXCMTHUz18mcyYVxvXzCgqecQruHbCYhXRpIqRN+vKEO0Ys/VYOwSWr+k7p
	Tn19ehdFUvaMDQYj
X-Google-Smtp-Source: AGHT+IHAAivCab/lWOm7BsvWoOQ2K6B01GqxvoWloosYFbQsUiGgSXFJuECPZI8gxDNKfzms/lzdHA==
X-Received: by 2002:a05:6a21:3989:b0:1e0:d20b:4f80 with SMTP id adf61e73a8af0-1e0e0ab431amr18597463637.9.1732906066111;
        Fri, 29 Nov 2024 10:47:46 -0800 (PST)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com. [209.85.215.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725417fba9asm3938631b3a.125.2024.11.29.10.47.43
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 10:47:44 -0800 (PST)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7fbce800ee5so2097043a12.2
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 10:47:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU8WpgP8uZ/G5avSLjdQWyyL0b03mP7mDQt18peylxZTkswEX1c1TaIqOR8SNUvl9MEkgQQx7LqEde/7Q==@vger.kernel.org
X-Received: by 2002:a17:90b:1fd0:b0:2ee:53b3:3f1c with SMTP id
 98e67ed59e1d1-2ee53b3416emr5720571a91.5.1732906063311; Fri, 29 Nov 2024
 10:47:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127-uvc-fix-async-v2-0-510aab9570dd@chromium.org>
 <20241127-uvc-fix-async-v2-2-510aab9570dd@chromium.org> <20241128222232.GF25731@pendragon.ideasonboard.com>
 <CANiDSCvyMbAffdyi7_TrA0tpjbHe3V_D_VkTKiW-fNDnwQfpGA@mail.gmail.com>
 <20241128223343.GH25731@pendragon.ideasonboard.com> <7eeab6bd-ce02-41a6-bcc1-7c2750ce0359@xs4all.nl>
 <CANiDSCseF3fsufMc-Ovoy-bQH85PqfKDM+zmfoisLw+Kq1biAw@mail.gmail.com>
 <20241129110640.GB4108@pendragon.ideasonboard.com> <CANiDSCvdjioy-OgC+dHde2zHAAbyfN2+MAY+YsLNdUSawjQFHw@mail.gmail.com>
 <e95b7d74-2c56-4f5a-a2f2-9c460d52fdb4@xs4all.nl> <CANiDSCvj4VVAcQOpR-u-BcnKA+2ifcuq_8ZML=BNOHT_55fBog@mail.gmail.com>
In-Reply-To: <CANiDSCvj4VVAcQOpR-u-BcnKA+2ifcuq_8ZML=BNOHT_55fBog@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 29 Nov 2024 19:47:31 +0100
X-Gmail-Original-Message-ID: <CANiDSCvwzY3DJ+U3EyzA7TCQu2qMUL6L1eTmZYbM+_Tk6DsPaA@mail.gmail.com>
Message-ID: <CANiDSCvwzY3DJ+U3EyzA7TCQu2qMUL6L1eTmZYbM+_Tk6DsPaA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] media: uvcvideo: Do not set an async control owned
 by other fh
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Before we all go on a well deserved weekend, let me recap what we
know. If I did not get something correctly, let me know.

1) Well behaved devices do not allow to set or get an incomplete async
control. They will stall instead (ref: Figure 2-21 in UVC 1.5 )
2) Both Laurent and Ricardo consider that there is a big chance that
some camera modules do not implement this properly. (ref: years of
crying over broken module firmware :) )
3) ctrl->handle is designed to point to the fh that originated the
control. So the logic can decide if the originator needs to be
notified or not. (ref: uvc_ctrl_send_event() )
4) Right now we replace the originator in ctrl->handle for unfinished
async controls.  (ref:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/usb/uvc/uvc_ctrl.c#n2050)

My interpretation is that:
A) We need to change 4). We shall not change the originator of
unfinished ctrl->handle.
B) Well behaved cameras do not need the patch "Do not set an async
control owned by another fh"
C) For badly behaved cameras, it is fine if we slightly break the
v4l2-compliance in corner cases, if we do not break any internal data
structure.


I will send a new version with my interpretation.

Thanks for a great discussion

