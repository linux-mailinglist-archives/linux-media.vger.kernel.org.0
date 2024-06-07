Return-Path: <linux-media+bounces-12768-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA48900BAB
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 20:01:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B0B0B20ADF
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 18:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99ECF197A97;
	Fri,  7 Jun 2024 18:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hr4sjUEl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85821805A;
	Fri,  7 Jun 2024 18:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717783286; cv=none; b=iENyqbaTpXjdL2JZMWh19wY2hzzyLC111k8yg88pEJbCHTi5P1TE/xf2XPWdC/P0NN1W3+6S/d6jbbFBtE3AakMNr/q0V73aDAOVqHqUvKE34Fl12TKs6c0Mu9n7QQWTmIy8rDoX83AwM3Re6ARKaRJylqbd4/1J+Gn66dBFyHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717783286; c=relaxed/simple;
	bh=XSsSxTQpjiFDdpc1b98fcJVPUJbKI9o+V72QkYiSWvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mbTjUM0erYfQaJlLckX+J+w4eIBVHA8DaoEd+qLj9PYWMSmksH2XP7YzQipZjJe7fZmsQdqR3aM3n7t+q5CrIWFJqbdebZtp+DTjm3ZZZY4B21tlLnSmBdIrTJ8suapnx8/68pkZ0pViinZP4shiUBwI6WkHGKeexSk5oaLeCUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hr4sjUEl; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2c1ab9e17f6so2154270a91.1;
        Fri, 07 Jun 2024 11:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717783284; x=1718388084; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJzRZyEuNURXvkjyHbfNkt9tQwj13U1o8kBE1pEHtyA=;
        b=Hr4sjUEl5NFbR5BomLiCVc5qHoZ/zvFyKQAbahQVD8buiCqYr0FIPfFswc3PLNik/i
         KnpCAk92xIqre7wprLG3jAYry0tF7w9IpNUOznnKEq5BBxMhGpnn2ZwzGIdwUuZZNFDC
         5njzEkRnA3TacpQfzcBzZQlguZRG+KCN/7QGwFdSBnjHaPKHmxfvzrne+uKxfoGmwcv/
         ht+burK+XDM7OYCwSMpY/FwehoWZf/4x0H2X1F9E0uvyA7hrYKneN2uBujEv6jzWZp4M
         bfnAKuCDRV2DT2uUkzNvcYBYaYlNV/n21xfaaxSEi4ALMi1EgX43LqFlO5n4S3tivbqM
         uC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717783284; x=1718388084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJzRZyEuNURXvkjyHbfNkt9tQwj13U1o8kBE1pEHtyA=;
        b=ee7ac75YbTLZHfcPpRNwxxhooAWRDC7M/ON3kZ+Cyyph+L17vMWkVw9McEVaNCgr11
         91Vjd9D2msBUSuDtxfbtulxr4DdDMxL1jf2bvPvMNNwHKGFySMFCU5lpjXjuFguv7RIk
         xwbUdg8sBC2eV3a+ojNEHOYfpXCDcxw/dMcwG4RVKnoReEF8Rzj3ud7kB9XLMtqYHTGv
         gywqF8GH+vFq/go626mdzdv/MYYlJURC7w0Wi3RCZ6/cAzNIR4BiYTyjP7l3hk7nR42i
         WaJx9tIiPbxNuCG3gjaJeuQCLeD3LKCr/v6uTwFo5QBdh7OK5J97sNuryLBjxitc3TFD
         B5iw==
X-Forwarded-Encrypted: i=1; AJvYcCWBBo23enpXA9waK0BdhYtkW6gQOGYGYZtRWQ1SyV+agfVk7a3vzcoRwNNtxWnhCoDpLDszWG9syUA5/TsMAUXy0eESipopeRdagPJ85bQnZZ7LjI46jwbD1NXNGkz8YdW/889yPxzm/l4=
X-Gm-Message-State: AOJu0YxITrh8lPwOpBUpQpPcOMsRTOeu0cLfc3M3qEc4cfw6bkG+oE4y
	0q3ua8vcBki1hxvbihCndzw+AhC97IC5Sn0Yg+jERzRIW/vZs0F+lowfflVuYa9anDCDv7U0/sl
	d0kf6FXYMEpZMDA/RKJuWbrhi/gw=
X-Google-Smtp-Source: AGHT+IEn95NJ9UaI1fTyhHJ0ii8HedIb+85uo/e/VYbmncSbPq0wt4KuAko6TnouF7o2ni6GcAFaM3gj4SsC/UdpfR0=
X-Received: by 2002:a17:90a:a891:b0:2c0:29d5:3515 with SMTP id
 98e67ed59e1d1-2c2bcac8c4dmr3100559a91.3.1717783283768; Fri, 07 Jun 2024
 11:01:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240607-trimmer-pummel-b452ed15e103@spud> <20240607155704.GB1242@pendragon.ideasonboard.com>
 <CAPY8ntBNNOFR1nn05g4Y-SOv_tN0YJv9wygO=+S80-zA1oq7mg@mail.gmail.com> <20240607-celibacy-contend-c4a6be15804b@spud>
In-Reply-To: <20240607-celibacy-contend-c4a6be15804b@spud>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 7 Jun 2024 13:01:12 -0500
Message-ID: <CAHCN7xLoJK+_=+ASL=P8x=E3ALY-Xw=+_Zg+q0Za32kgvm5iQA@mail.gmail.com>
Subject: Re: [PATCH v1] media: i2c: imx219: fix msr access command sequence
To: Conor Dooley <conor@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Andrey Konovalov <andrey.konovalov@linaro.org>, 
	linux-kernel@vger.kernel.org, Naushir Patuck <naush@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 7, 2024 at 12:55=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Fri, Jun 07, 2024 at 06:29:49PM +0100, Dave Stevenson wrote:
>
> > > > ---
> > > > I got the report of this third hand, I don't have a device and can'=
t
> > > > test this. I do wonder why the RPis get away with the sequence that
> > > > seemingly doesn't work for the guy that reported this to me. My the=
ory
> > > > is either that they noticed the sequence was wrong while adding som=
e
> > > > other MSR access that is needed on this board while either cross
> > > > checking the values written or because the other MSR accesses didn'=
t
> > > > take effect.
> >
> > Did the change fix it for the reporter? We're using the driver with no
> > changes to the register settings cf mainline.
> > Why it works on the Pi but not on a Microchip board is likely to be
> > something quite subtle.

I have two different platforms which can use this sensor.  I can try
to test it this weekend and I'll report back my findings.

adam
>
> I've asked, maybe it turns out to just be the first of my suggestions,
> and they noticed it was not matching in passing. They did introduce two
> additional MSR accesses, both outside of the range documented in the
> datasheets I could find online. They did have explanations for what those
> undocumented MSRs did (0x5040 and 0x5041) in the mail I got, but given
> it's third hand info to me, I dunno if we have the datasheet etc. I'll
> try to find out some more next week.
>
> Thanks,
> Conor.

