Return-Path: <linux-media+bounces-11730-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BE88CC13C
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 14:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12AA51F22C34
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 12:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1E013D62E;
	Wed, 22 May 2024 12:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KEUw1RiD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B0413D615
	for <linux-media@vger.kernel.org>; Wed, 22 May 2024 12:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716380920; cv=none; b=PfJswhjLYGqAvpW17dqJPuUE2IO2MJCOeG+83xK6tfrBvhSpG9gkw6iM9k5TiHWAUCHqsu8RWP+jTnMSgF2glN6Up/xOREKIrh/w7hykG8D/UvSF/GAwnOCVYFHozbfIHt1rXM6DjtDrEh9wi0BFFuk4GZajQvPzkyS8ZMuD6cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716380920; c=relaxed/simple;
	bh=bdxw+Q0XGRmuFjdwhmwLig3zIBnPf0qvOWQa/FwvDVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OATT4Pe/ooVlyRG1kqBUX130niVuRMjc3yEJG8I1v+A02EHpV2LQ+7sXY2NmQyFs9MtoZUJXeUpDF6M4N4mgdmkC4W8u8V+UrKoAStmmQV3RbiGH2H/WamBKxiCmIHndWs0ZDEvcFv63BAtOPddd1r3hEG2u/0libOHxd/a6vKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KEUw1RiD; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6181d032bf9so8412317b3.3
        for <linux-media@vger.kernel.org>; Wed, 22 May 2024 05:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716380917; x=1716985717; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iVUa+HtknJVyE1LRWMYlqdPQQktkEpm5BV1SvyrxPpw=;
        b=KEUw1RiDK7ASUILMjPUziIYB9+sJvnat7T96DBTMJg0e/WiOZctET2845y6KBdAspM
         nW2o8sRlNPdOrlr/s0krJVpNssJr2v+jQ1FXab+0cv6cY9a6Lqh3gXe0K0FvlQ0/t2vX
         kddh1bDJmIIhp6teiOH19YygVYCWBNL1bbsYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716380917; x=1716985717;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iVUa+HtknJVyE1LRWMYlqdPQQktkEpm5BV1SvyrxPpw=;
        b=bWAlf0tttTA7x/6CTTKMp1OICOdHuhwNEz2y0sMNWr4d9ocLn+jzRG0VA4dqv/R8fl
         VfMpDrAk4myeEqxLF0n/HgRSneR/XmO2zHZbeUoyi11bJsf6Z8LMxFWaSvygPR+c3zeR
         zgG2hz8VKAayxdV1/eHFNWPFX0kw7T0gA/ZxNbNl9j3G+tzN9D8QqCoBRdr3H6jWYA4b
         ILnzn+F+xtf66Timr2ZjexqI4Vg2DlrW3X2ZPVzCyy4tyKffpVyXw8GlCcv87H+Xlwxk
         mnePGDXfQs3HRRGTpJ1lIAqi2OQh49zi0LPSo6imHTMFzn9kMKXnf2lQaRutP9hF+0nZ
         PRwg==
X-Forwarded-Encrypted: i=1; AJvYcCUBcoczPTcYfUnohy9iqDU4V0MhnPm2seVDavIGUQmKz39TNdhjhTxit3T8pPsIiQtfZoyvjXf/XBTn/KZSlKWMANEEvCNyAE2kVbQ=
X-Gm-Message-State: AOJu0Ywt5LmI6GpRDVJGgUhhXjozVKimrpxYiSxeRNjm9dwaIAMddD9W
	tWEH0C5ocvepbpajlWAGwpcgC+Z2VVqr0bnwr58WXFNRYQ8KBU2FXuLgLokv5wdplDV+XLORl0M
	=
X-Google-Smtp-Source: AGHT+IE+hMMeLSBDeX6CU4lRuoQ03f3rzAxXUwbCQX0rz1g6jQ83NCf1/X48GnzwuJeVjF3O7WFldA==
X-Received: by 2002:a05:690c:d8f:b0:61e:a3a:2538 with SMTP id 00721157ae682-627e46c7296mr22406007b3.18.1716380917503;
        Wed, 22 May 2024 05:28:37 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e3472cdsm57391767b3.99.2024.05.22.05.28.36
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 05:28:36 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-61be4b9869dso50678167b3.1
        for <linux-media@vger.kernel.org>; Wed, 22 May 2024 05:28:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUoPAkrKicLdgZlna1tDld7YWt95u9zuOUXSbE/hDGxx+uRxffcj3m96Zsp34VLKOSNDr7jk+iV1gnNUJ1ZY1XVsBzpTs+J+giZzvk=
X-Received: by 2002:a25:dc8f:0:b0:de6:1534:e0ec with SMTP id
 3f1490d57ef6-df4e0a760e3mr2044809276.13.1716380915690; Wed, 22 May 2024
 05:28:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
 <20240507-cocci-flexarray-v2-9-7aea262cf065@chromium.org> <5eec6d69-badd-46f8-9da6-a578d5f7c3ba@linaro.org>
 <0e6ad5e7-ab20-495c-aa76-77531a53d459@linaro.org>
In-Reply-To: <0e6ad5e7-ab20-495c-aa76-77531a53d459@linaro.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 22 May 2024 14:28:22 +0200
X-Gmail-Original-Message-ID: <CANiDSCuQtND+jbAAv0UYmtgO9g95qshY=HZVnyuraC0Ud_cD_g@mail.gmail.com>
Message-ID: <CANiDSCuQtND+jbAAv0UYmtgO9g95qshY=HZVnyuraC0Ud_cD_g@mail.gmail.com>
Subject: Re: [PATCH v2 09/18] media: venus: Remove unused structs
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Michael Tretter <m.tretter@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, 
	Andy Walls <awalls@md.metrocast.net>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"

Hi Bryan

Thanks for your review

On Fri, 10 May 2024 at 01:56, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 10/05/2024 00:35, Bryan O'Donoghue wrote:
> > I think these structures should just have the "[1] -> []" conversion
> > done and be retained instead.
>
> They won't have the same sizeof() then so ignore that thought.
>
> I still would suggest dropping the `something[1]` in favour of
> `something` because these structures document the protocol between host
> and firmware and therefore are useful even if unused in the code.

The structures will be in the git log for the rest of the days. So if
someone has to use them, they can recover them from there.

Right now, they are not used and they are triggering a warning. I
would argue that untested code is broken code.

I'd rather remove the code.


>
> ---
> bod



-- 
Ricardo Ribalda

