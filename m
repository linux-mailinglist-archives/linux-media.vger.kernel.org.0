Return-Path: <linux-media+bounces-49403-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E0468CD8692
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 08:49:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3EF573010709
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 07:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DFEE3093D8;
	Tue, 23 Dec 2025 07:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IzMyPHl3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F02D2D0C8A
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 07:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766476165; cv=none; b=j86N80xmICQxsTWuJEFLzKrlBzBPS0DHEJU0o69R1oMwWoa9uz1f70T6xHk9dE+5l6V0s9Z99sw5M+qeBAEavqPt1bdNpok9675+zUwWFJOvoqGMaSlCWDNk26STlSAOcYLdwF4OoCYomti/Yx+5FzZXjK2g+FQ/8Zl2mwpmfhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766476165; c=relaxed/simple;
	bh=vmW71K85B/nf91nCmpRvDnARYWsnICpp1tJuz3ipQEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mEYxMqALLulmEwplfaMihvH3AtkuOykRxt+CUHd7hkSfl+svCMZLWxagVGAB10PnphtoubABiD9Nu1PT2vPM0CNVHnhM9I7m1npR28XNcanZcKG86UczEMDtFi+ulcZda4nOmj0L8BAnD7Iehm5o/hbZ0ha8IwHmhu0rg7fE1GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IzMyPHl3; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37bbb36c990so50175131fa.0
        for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 23:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766476161; x=1767080961; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mi6OpT/s7P8M3FK6nlpf9htrLGKpL/VL7o4UVG+JcWg=;
        b=IzMyPHl30auTXkzRuleHI20kf0htP8W9wkCfSkG73uoLtfaugNK1GLx8wg6U1j26ia
         GmWt6SdCEC3WhvdW4YPEC+MpmLu7V/nC2roGh2Rtz+0/9DEuLwQrHoyECdLaVZB9JFFG
         nIoX8Qjmbq0VI2zYHH+RpR/drTz3bmhA/VpTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766476161; x=1767080961;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mi6OpT/s7P8M3FK6nlpf9htrLGKpL/VL7o4UVG+JcWg=;
        b=id+kk4wLivygT4dygAh2EnRYXsLICglGcEBfkZoR4d3gzEb6bTADAX8dhdYu1OLGOL
         AQR8uZ86OzGV2/D0Zfm1ZtZKZujFLM/NHNIPuvebQou2PFInXSgL7unaKaoUiapQO+2q
         0shwZw2Fvr2mRAN5wjU/vm1XQRMi0LWIZq5udmcO4wdrNJvOsKCIid8Y+wJiaeFPnABK
         VDd4V5Ce9q/gL+ZQA636KMiIVw/QaJZKxsJxUebDmxVScNy2AJJrKrjcj2sY/vup/jhr
         mt5JCmfAvO6I3smQLb88078ffjpS5KB85XPfmxHBIgR7hez4bxkSzlGVcQ9HcQ5wi40Z
         HmQg==
X-Forwarded-Encrypted: i=1; AJvYcCVnghWr1rdI1mgvsda5TNAWNifwPBLyqMB2o/kmO+nBEjjIwRGi3LmBTFRDHDpCy0th0t9JNpnlHTQHvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkbUWJ/ahUmCQVT0km9HgixMc3ntgkaDgzJ3PAR31N8h2A700d
	rozpbLSqijyVjkP6BWT+PRMLbi7CkFEoMdeHKfnZcyaq2RED0sUK+pPFOoQNEBrkMltsHqKKJiR
	fKIM=
X-Gm-Gg: AY/fxX7ln8/fz3WSpuNM/ctpe7pRemXtFj/Q2JkxuM6BfdaH7F5Lcjk5bg883eaB/h6
	p0fur/hFXnUo6NDbI1/g2VhzhDl4nLjCbFte9P324fu5Py3g3jyE3ErcPfh677u99dH/qkgxIoq
	w2nJwJCDnOCbTioUx6460RWz9YmKuWNfk5gtVdPEQxFzre64dlYK40MWhJHUEM6pO1TNb3GvCFO
	t8FuTPz9yzwnl2fuLoe6hOWeQyvETCKAofGl1So+X2ykMdb2iGxlkg3G+8HWbQpKlyBcRcI1xsJ
	mTqX4m02tXlrmy1veGT4kIGvu/UJg7kQfgYNK9cQQu5FItdzTFHpUC/t1+KZONM0nThMItQgKUx
	kYnYxX4DfazvJz1ml7vD8fDQSmQhrNvkDJCW1/+EgV9xdW8bS9WfY7fLiOOongzJyFaVLLi9vG8
	00pvC8LHoXMIfoNxP95u7NKuJAsjcJq8Ur5LCUXD3/KafAaqqC
X-Google-Smtp-Source: AGHT+IFCl5SxP1ciqxFH8v6D0nhd6EHBdwUe+lCrfb+frE2sJOf2e/rmoeQ1+7lbGLJU7ZP82ELGNg==
X-Received: by 2002:a05:651c:1470:b0:378:e0f3:53c1 with SMTP id 38308e7fff4ca-38113275820mr54097521fa.18.1766476161398;
        Mon, 22 Dec 2025 23:49:21 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38122501558sm32460751fa.13.2025.12.22.23.49.19
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 23:49:19 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59583505988so7226901e87.1
        for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 23:49:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVioXGGIxsD1VIa77f1sro7wWuIgbRwTWSnejNemfU0UWgIhVTPSsCeDwBAisrwPsd+ZR634RAli4h2Fg==@vger.kernel.org
X-Received: by 2002:ac2:4c4d:0:b0:591:c6eb:baf1 with SMTP id
 2adb3069b0e04-59a126ea375mr5874461e87.20.1766476158862; Mon, 22 Dec 2025
 23:49:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251210-dw9174-timing-v1-1-4a5036465727@chromium.org>
 <023d20e6-23ef-4f64-8ea6-31f973b33c95@oss.qualcomm.com> <CANiDSCsiu5E0nmm9dAgMGZ4y26cjwr8XKB1KRu2wZSVgdP-Brw@mail.gmail.com>
 <aUl-JZZ5U5GgTasb@kekkonen.localdomain>
In-Reply-To: <aUl-JZZ5U5GgTasb@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 23 Dec 2025 08:49:06 +0100
X-Gmail-Original-Message-ID: <CANiDSCuhGQXJmswNt4XCcUS5jBjfFNh-ZeByORquRoVc1JHbow@mail.gmail.com>
X-Gm-Features: AQt7F2pEKMnqGA44hUM62OuZrJy8LUoGdybjxOqGD1qrQuaijOV7mFIvEPZxRhM
Message-ID: <CANiDSCuhGQXJmswNt4XCcUS5jBjfFNh-ZeByORquRoVc1JHbow@mail.gmail.com>
Subject: Re: [PATCH] media: dw9714: Fix powerup sequence
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: johannes.goede@oss.qualcomm.com, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Ondrej Jirman <megi@xff.cz>, Hans Verkuil <hverkuil@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	neil.sun@lcfuturecenter.com, naomi.huang@lcfuturecenter.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Dec 2025 at 18:21, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Ricardo,
>
> On Mon, Dec 15, 2025 at 09:46:46AM +0100, Ricardo Ribalda wrote:
> > Hi Hans
> >
> > On Wed, 10 Dec 2025 at 09:21, <johannes.goede@oss.qualcomm.com> wrote:
> > >
> > > Hi,
> > >
> > > On 10-Dec-25 8:53 AM, Ricardo Ribalda wrote:
> > > > We have experienced seen multiple I2C errors while doing stress test on
> > > > the module:
> > > >
> > > > dw9714 i2c-PRP0001:01: dw9714_vcm_resume I2C failure: -5
> > > > dw9714 i2c-PRP0001:01: I2C write fail
> > > >
> > > > Inspecting the powerup sequence we found that it does not match the
> > > > documentation at:
> > > > https://blog.arducam.com/downloads/DW9714A-DONGWOON(Autofocus_motor_manual).pdf
> > > >
> > > > """
> > > > (2) DW9714A requires waiting time of 12ms after power on. During this
> > > > waiting time, the offset calibration of internal amplifier is
> > > > operating for minimization of output offset current .
> > > > """
> > > >
> > > > This patch increases the powerup delay to follow the documentation.
> > > >
> > > > Fixes: 9d00ccabfbb5 ("media: i2c: dw9714: Fix occasional probe errors")
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > >
> > > Thanks, patch looks good to me:
> > >
> > > Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> >
> > Some tags for the record
> >
> > Tested-by: Neil Sun <neil.sun@lcfuturecenter.com>
> > Co-developed-by: Naomi Huang <naomi.huang@lcfuturecenter.com>
>
> Co-developed-by: requires Sob. Do we have that as well?

Good point, I did not get a explicit Sob.

I wanted to give them credit for this patch, because they did a great
job reporting the issue.

Let's do a Reported-by with no Closes. Does that work for you?

Thanks
>
> --
> Regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda

