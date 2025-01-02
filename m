Return-Path: <linux-media+bounces-24206-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE849FF7E2
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 11:16:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21CA83A14CE
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 10:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0EA71ABEC7;
	Thu,  2 Jan 2025 10:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jXqf+o1r"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D3638F82
	for <linux-media@vger.kernel.org>; Thu,  2 Jan 2025 10:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735812968; cv=none; b=nPTWtIVRawvdSVoyRHO/weU2HO7HDUgGe+WPVEIPtBxw2Kc4//uziMhXnWvTz0j2XKC73ioyx9iWPI4U+2apZfPOBF+g5lYorS1gTubhrJDrJa07rvCQnyHgClx7ghErCgt9dFt5Qcv/ZMUoe+UWRD8f07LQwbigwJQmL72YSxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735812968; c=relaxed/simple;
	bh=RRyikr50p4Lqr8r/i624ULnM/EJReL1+7/2X4ZhYIgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sU+Q5uu/QZoGqR9EQhaK3kO6gwfOp34POlHIJ4oqPuGmBos28hbSPzeoo8jYNL+p3GCihVeIWqnFtJv2tm56cXsSnriUddLmlZ061/E9zcZWDLNhEVNFbyiennCxhHkK3oWiN85Gv3Zj5kL0hXWyZzKz8z3hR0gqxQkBywDvRDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jXqf+o1r; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5401ab97206so11886250e87.3
        for <linux-media@vger.kernel.org>; Thu, 02 Jan 2025 02:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1735812962; x=1736417762; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P/16WNMsDkbAAUMAw2ohs3kMsGdjZfaasLubS+cJRrA=;
        b=jXqf+o1rwJ6cecq6ZVLkkHkOLJdc8POjoGBJUbjliZteh5g3lQw6fuG2vfM7NXrWHQ
         hVg3yV1L4eRKd9wPW+zK2vzAi/unNjNSDMjDsp1Lk8qdcaUGxXbKLBln242BAX7pYuja
         tJPiDWwVcZOGi7+D2CcFYcSEcsTjJICo1ICjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735812962; x=1736417762;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P/16WNMsDkbAAUMAw2ohs3kMsGdjZfaasLubS+cJRrA=;
        b=wGjmIWxokOIAGect16N4pTGgUBro36VxxSufOR3SNXPJQQpUbqcwe3ag6ivdkfkvUf
         /fqFk8KFXIQJdUk3DyqdXVVX9YWaJA05vah0S+kf0w8T60MJvjgo9+GObMPtN7/IJQx7
         ZcQ7O4O2gcT9GnEyB8PJK45Oao3AXsQmzoghC/OtfBur95ZjJ9zeCQ3QVAzzwHDSXmzm
         EOLwRSqIdtWuksEnh+5oG6+agqz6nJTW05VyZav0hmm4/Ax63tbPtOLtMJlzcFuJMvpT
         uUCOxTJr4EV61H45u4eWlaP/gVlW6fXpx7gwplhetaNpGd+97owNDHyMbI223jtc0qJU
         drng==
X-Gm-Message-State: AOJu0Yxx2GIklacKokiap0/st8XovChGB8JB0F7FcD8VgeRzpDndeQb6
	VwfZVyoUd1RIanJjv9IAF0sfB+EAeoJrQXNHAbjcuEa1LhyLLauDY8U3PyR4dkoqt4p9ceX48H8
	=
X-Gm-Gg: ASbGncueTYYZZdtbQ6bRZQGmrWZaFNx6ozqfjvkOfWnJcPYniEnlDr7krILFldKyD6b
	UfJPe6vBcDJPNlg6aUfLS2Lx7NrGPT/KbxL1SpVviOvDRWLJ0s70U0gbbpBNoevd2Ztk8V0rzIE
	5IPs83rD9aKvtgSEq62pwZ8SkzyYUSOZma5kIz7MAoRJQbwtn9nH0uYwLPjJf5CmEyhb2Z65mA4
	ZeuAqgyZtWI8c1o2WLtbpr7P2XPIDPjpfH7/MouF8Lkw53XWcvxuFdwEPVjEfSDXLX3Q3S4QCdF
	jvEI7zpGUg8bca7UXic=
X-Google-Smtp-Source: AGHT+IF1q6zaGX3yZcLJjdjg1pSncUckDbKl9CBbRjrYdKWOLAECm4GK/BAAH1i8lOUyK2f5hF3R4w==
X-Received: by 2002:a05:6512:2349:b0:542:2a29:88ee with SMTP id 2adb3069b0e04-5422a2988fdmr11510486e87.2.1735812962136;
        Thu, 02 Jan 2025 02:16:02 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f66fbsm3809776e87.21.2025.01.02.02.16.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 02:16:01 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54025432becso12212599e87.1
        for <linux-media@vger.kernel.org>; Thu, 02 Jan 2025 02:16:01 -0800 (PST)
X-Received: by 2002:a05:6512:ea3:b0:542:238d:d714 with SMTP id
 2adb3069b0e04-542295502dfmr15703308e87.32.1735812960601; Thu, 02 Jan 2025
 02:16:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241225153056.GA3523@pendragon.ideasonboard.com>
 <676c8a04.050a0220.20d632.9cf5@mx.google.com> <20241225230649.GA554@pendragon.ideasonboard.com>
In-Reply-To: <20241225230649.GA554@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 2 Jan 2025 11:15:48 +0100
X-Gmail-Original-Message-ID: <CANiDSCvASC9EdRUvcmUaC36Y+9Jj=iAyDR3ssTwD4Q5r7ziBAQ@mail.gmail.com>
X-Gm-Features: AbW1kvZZya_t_7isJC3dYeEp56Xr-9oFiT4WYoSS4wyDcbLmuwMAS2OFr8OVk1M
Message-ID: <CANiDSCvASC9EdRUvcmUaC36Y+9Jj=iAyDR3ssTwD4Q5r7ziBAQ@mail.gmail.com>
Subject: Re: [GIT,PULL,FOR,v6.14] uvcvideo changes
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linuxtv-commits@linuxtv.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Dec 2024 at 00:06, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Dec 25, 2024 at 02:41:08PM -0800, Patchwork Integration wrote:
> > Dear Laurent Pinchart:
> >
> > Thanks for your patches!
> >
> > The CI had a great time going through them, and it could not find
> > any issue.
> >
> > For more details, check the full report at:
> > https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/68621153/artifacts/report.htm .
>
> I don't know if it's worth it, but I wonder if we could save some CPU
> cycles and skip CI when the cover letter mentions a link to a successful
> CI pipeline run. Clearly not high on the wish list, just something to
> keep in mind.

The user might have a different CI configuration than the one used by
media-committers. So it is probably a good idea to not skip the build.

Also, in the future I expect that most of the Pull Request will be
replaced with MR in media-committers.

Regards!


>
> > Best regards, and Happy Hacking!
> > Media CI robot on behalf of the linux-media community.
> >
> > ---
> > Check the latest rules for contributing your patches at:
> > https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> >
> > If you believe that the CI is wrong, kindly open an issue at
> > https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> > to this message.
> >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

