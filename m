Return-Path: <linux-media+bounces-18625-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92738987222
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 13:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4A841C24884
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 11:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0541AD9CB;
	Thu, 26 Sep 2024 10:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EEdzZGQg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C094D1A726A
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 10:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727348394; cv=none; b=S66w9w9VUM+yBwk0LK0si383mxflaW7ytusKkAi+uwjgGEQHdrmbsNKD9NE+/bs6OlcfU1hvV7fJrh+A4t7AXkUST8OZN8Q5waVH9UavFnQs/iGxx8eHl/P0p8c1/iEcUTy1gynHoFKTZDF1jHQqWjRSw0vpcU0tL80CxLuKfnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727348394; c=relaxed/simple;
	bh=QUXV94SHgmo+WEYfgVklsX24tp3ghJEqv4oqAFKT/F8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UBXgALyCpkO2aXyjhDicfVgwxI2944yr1IbvoM3rBS/JnRrW37Xf0Hb3+7s9PHoriujS1ZsSl1mvTuFoO1GwrGaDybAjLwixtXnEYgobQadmgMKrC8bV/G5n4rCWawLXyA5wVEyDr/ohpyUzhuXaC0vh3sqA57+J6rFkiei1KjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EEdzZGQg; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7db0fb03df5so589582a12.3
        for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 03:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727348392; x=1727953192; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v2Q+CQcomHPNCiaE7bSkH7nOXflsjVV/m6htFUCqgg0=;
        b=EEdzZGQg87C/zs5ObeaY/LeVuvjoSXsC3jdz9sppwdtXYTkryw+QrRgQeovWEC+Pda
         FXiOWHn6/rUGk8WMdgNUzCO5yKX8KRzvDShbGy2St+Ue2w7RbE3Xp0EclXMJKkDKUIq3
         oJvguYEB8nJXrcQs1Gu2SSF3huvVDpojcU+Co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727348392; x=1727953192;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v2Q+CQcomHPNCiaE7bSkH7nOXflsjVV/m6htFUCqgg0=;
        b=IOc1ZJOkOI1hNFhJ5ZHRN5ec3Q/kFTARAWfn2hX+Zn24frAuSmj9Vn66ARUj+z7LU2
         4vEeSUHo1tiFCg2bKokTSpfiiwNIeIz5KtQeMRSQIo2zFeAaaSw2mt2AoQgXqvVgzKhu
         1Ms48dXEQyqEg1FHvqMKnMl7hQ3JOch/cqT44OPbQOeKBk/Yx0drcjqNYnEd1N5wVll5
         YCmccfdiA9Zhz9WJSq3xmtk2fhj2NZAtvZA+TmZLC4zabeZ1dC6H66l3Cft4K6BAATOv
         DSqu4imINOnrYANVBf+0Zzg2D4bg2Tyhuy97fsI8J1wPjHWUywu0rPKvm4+jXxwGUaXK
         1qSg==
X-Forwarded-Encrypted: i=1; AJvYcCUU3WwanuhmciMHnJzEhdZ0Y3VZ/tXTRk1Jn8ECTpSu034j2khVjo7cvDIQ382Zs8Wd32ETAh1A7pwwYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpf5qgJ99HaRbYSrJDNpcvdAf0urKsksy9JkHGEhRLSKNZlPDv
	PbKATXqvI1FoW6gnP9mOU/hY3Jtili57a9jfRprdB0afVWB0ULT/iVBCl3dyxKj6qHSbGiaRcM4
	=
X-Google-Smtp-Source: AGHT+IEutfWsoXCPDloL/8qLil9ZBAgdPqW3yBZZjVPyRn4R1Aq2WAZEEWLfwsYdCXBkr+fKqnE7Hg==
X-Received: by 2002:a05:6a20:cf84:b0:1d3:eb7:2c35 with SMTP id adf61e73a8af0-1d4d4aaf022mr8500358637.16.1727348392221;
        Thu, 26 Sep 2024 03:59:52 -0700 (PDT)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com. [209.85.215.181])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71afc85bb0dsm4209587b3a.92.2024.09.26.03.59.51
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 03:59:52 -0700 (PDT)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7d50e865b7aso582761a12.0
        for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 03:59:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVTg7jCMRSXe9d173tWXkwdELbJUPQcCtQXdzazDSA/Ec0rI8epYfTXxG46kjvPW/Mq+Bp+z4GtDpDnuw==@vger.kernel.org
X-Received: by 2002:a17:90b:180d:b0:2d8:bb95:56f6 with SMTP id
 98e67ed59e1d1-2e06afc1862mr7137514a91.30.1727348390934; Thu, 26 Sep 2024
 03:59:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bb8c09c7-0eae-4e1a-8fb8-e325fcf326df@xs4all.nl>
 <20240918092454.21884920@sal.lan> <20240925195843.GK30399@pendragon.ideasonboard.com>
 <902b2828-5eb8-4741-90af-8e42f1240e86@xs4all.nl> <ZvUpuopPY8lwBHEm@kekkonen.localdomain>
 <20240926121914.69b47a50@foz.lan> <20240926102448.GA21788@pendragon.ideasonboard.com>
 <ZvU49mrccFlKDhD0@kekkonen.localdomain> <20240926104022.GD21788@pendragon.ideasonboard.com>
 <CANiDSCvMmd0eQCWHj6rt0u8nu0uVnDbYT=GJsobxHGOHE74DZw@mail.gmail.com> <ZvU9c4bYhMSXbIbD@kekkonen.localdomain>
In-Reply-To: <ZvU9c4bYhMSXbIbD@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 26 Sep 2024 12:59:35 +0200
X-Gmail-Original-Message-ID: <CANiDSCv5Tsh=rq7M0CBT7tODEzsnK+P5zBuwu9QwnsCU2S=zsw@mail.gmail.com>
Message-ID: <CANiDSCv5Tsh=rq7M0CBT7tODEzsnK+P5zBuwu9QwnsCU2S=zsw@mail.gmail.com>
Subject: Re: [ANN] Media Summit September 16th: Final Agenda (v7)
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Martin Hecht <martin.hecht@avnet.eu>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Michael Tretter <m.tretter@pengutronix.de>, 
	Alain Volmat <alain.volmat@foss.st.com>, Sean Young <sean@mess.org>, 
	Steve Cho <stevecho@chromium.org>, Tomasz Figa <tfiga@chromium.org>, 
	Hidenori Kobayashi <hidenorik@chromium.org>, "Hu, Jerry W" <jerry.w.hu@intel.com>, 
	Suresh Vankadara <svankada@qti.qualcomm.com>, Devarsh Thakkar <devarsht@ti.com>, r-donadkar@ti.com, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Nicolas Dufresne <nicolas@ndufresne.ca>, 
	Salahaldeen Altous <salahaldeen.altous@leica-camera.com>
Content-Type: text/plain; charset="UTF-8"

Hi

On Thu, 26 Sept 2024 at 12:54, Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Ricardo,
>
> On Thu, Sep 26, 2024 at 12:46:49PM +0200, Ricardo Ribalda wrote:
> > > > > I'd argue that even a missing SoB may not be a cause for rebase if it's
> > > > > an accident, but that's not worth debating because CI will make sure
> > > > > this never happens.
> > > >
> > > > Does it?
> > > >
> > > > checkpatch.pl checks should just be warnings. And that should probably
> > > > stay. Sob: and From: being different isn't necessarily that far-fetched as
> > > > having an address in .mailmap may change From: field but not Sob:,
> > > > resulting in a checkpatch.pl warning.
> > > >
> > > > I wonder if checkpatch.pl should know about .mailmap actually, currently it
> > > > doesn't. I could send a patch.
> > >
> > > We have an explicit check in the CI to ensure that both the author and the
> > > committer have a SoB line. It's not base on checkpatch.pl. Ricardo,
> > > could you confirm this ?
> >
> > CI checks that there are at least 2 committers that agree with the
> > code (SoB, Reviewed-by or Ack-by)
> > https://gitlab.freedesktop.org/linux-media/media-ci/-/blob/main/lib/test-trust.py?ref_type=heads
> >
> > We also have a separate check for SoB:
> > https://gitlab.freedesktop.org/linux-media/media-ci/-/blob/main/test-media-patchstyle.sh?ref_type=heads#L61
>
> This script appears to be also ignoring .mailmap.
test-trust does not ignore mailmap:
https://gitlab.freedesktop.org/linux-media/media-ci/-/blob/main/lib/test-trust.py?ref_type=heads#L56

Do you see any scenario where the committer and the author are
different users? "git commit" will set the same value for boths
I am not against to modify the code if we find that usecase

>
> --
> Sakari Ailus



-- 
Ricardo Ribalda

