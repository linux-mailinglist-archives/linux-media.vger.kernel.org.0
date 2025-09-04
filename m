Return-Path: <linux-media+bounces-41758-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BB7B435A0
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 10:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42478480E36
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 08:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E8B2C11D9;
	Thu,  4 Sep 2025 08:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cMaiJt+2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F43A2AE68;
	Thu,  4 Sep 2025 08:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756974254; cv=none; b=SOMt71IZBlXvpzMnCSw4GXRSQylk+MQn7yi8DyUN9GEExi4hmS3X8b/JK2o2MJb+o+G8N30jGw92tawxqyJ/Pgq/uFlt9ptXjtGFoeeJJ8gtSaMRrfPGfv72iuNPhpzQMMRbpCCHkPCi+l2G+igsOJ8yrIeIbU3S3MbIpejxgbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756974254; c=relaxed/simple;
	bh=a9LPPP3Jqp0CkgRLiN9BRA0xBNTVwaijfZKvGiivozA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LYBJ7OddktmuBvbkL9eL37tn6DT+5b6WRH5K//QkX6XKLjhSF+Ogw1OFR48ANLVkenceDuJqsgEQxvEmSnV+B28EQPbh103yAq3EeUCV3BbqKXleRfby8Rgqx2BZ3Yso5Cw9LKk3EfOq5c/obo/1XF9tOGwS+57rZjPAXqdYviE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cMaiJt+2; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55f7ad815ceso835724e87.3;
        Thu, 04 Sep 2025 01:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756974251; x=1757579051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KsZU/Z0686kZr73L0uRE+CVL67RZQ/oBdg4VrSudCyg=;
        b=cMaiJt+28KojiSS6T/MU9g4ETWkPxGvLFK41rs8fyGPto62ha+UQAKlOp2ddXSE/4K
         6AsfzgSI/c0F750enmphlvbUyLVOjYoI8eVdkfG27+jMNC490a9hdKingfgou+9mbfQN
         fir+JSkB611RJc0EmxQdxHbYNNoI/7qNVFOQ0X7ff8KGOwqh0MvkEGxd13t4n2hc+3tC
         txwFkeKw3mdEtUKUl8SjDzI4ap9k+wkoVpmYsYTHQeNDGfHTwuEnhsCyle2EihPaDTwe
         OeCAQrEyIiPgS2xPkdevzPMEWA84fZqZQF8U4TSdWhp+Fbl+7uNZAyPdy3/dEPwGYRPy
         oJjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756974251; x=1757579051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KsZU/Z0686kZr73L0uRE+CVL67RZQ/oBdg4VrSudCyg=;
        b=pzkXWypvjhavweRI/Kk+JMJ042B7ungk0cdesOZt2ssEyyI97AD9cIlxln4MXY3qKV
         6c76v5lecD/UBXLDNpnErQtSB84VvzolyfDAz8XQ7bxhRYC7LYq1zYDaCiSwSYsyk6g+
         2U5zz2gIhXEA+L4Jq+NcDw5PZN2A4KsuVwPnnxrBX0FBdpByTnJlmYPeAfLQjrZXa3JI
         df3VYQNOdDXfS2EIgBTSIer+M9qr11vmj/qpt3rtRA7KPwEqVLnAjANf+bYzkoZ2y543
         1hpDIkhdVSfr1QSVuiRZpvYR8gLZCXrGUpRbkascCfV1BykzoGnR8eJ4KHEDQfeEpxKJ
         AV5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUIArOZk8b8EF3ZE1V558Smkb5j865TBolENWsY6eLS2xtlaZ0iyDUDIJBuuJFccgr9p8vX6eFEpK9Bj7o=@vger.kernel.org, AJvYcCXmxtRGWc0BYljSQV663e1H7SZ7te/Cf7D322ooOSkxr9mK/sXEtk42oHoZKhkNJ0VAbX9AIwKMeQ7HlE0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf9OXpgdJpoBvGnttBCJwFPoM8oKt7x9AQY0GLpjfNZ+kOF92u
	QVSCR5jBAxSF/NKZoUUD9kmt6ZJa9D8/OLT4ahhrVVe6A4vEFDqIzrJf3eJ+7g==
X-Gm-Gg: ASbGncsUhOkFwYO1/5mjlCjbhynclzoIcdtC65FRn0NGZdfIYro+Ni5sQZ3+tvrcubh
	UUzjgfXeZbR045LjPm9Qm2Kdiah+nRqS8j3GFLqpuSfifN93NE3ktcw9MlFGX7lCs5CvyMnby6l
	bBhXUURKe13t19HC5M9dNuGh2vowgLOA+QEc8AbqVy66EBXh8jZx2kP1RaYKEx8POMS0fTFjy4U
	KoaDhgHukO1YP2hqRnpYXA2uo+xnZ3IwEjURzOKT5ByA243ug8M/FBfkJoW4ocqHL4H0+fmm8gM
	W/2t7afjIj/Wgo6ur9jD3kGT4zT3iDvzYJaTofP+CLuoqWdZqlWrQetlLv0MFmP2nzEVJsmDY6z
	RzbbbH58j8+PrfDeEQWQFctf1v5/v68zzlUUr7BX3ZUQ=
X-Google-Smtp-Source: AGHT+IE2FO2kHU7ApX80XmGPiRU8lkDmV+Q0djLsWnwr3Nk3JV5C5f2RVdS4OKx1AsOWgx/XpUwe9w==
X-Received: by 2002:a05:6512:448e:b0:55f:6adb:b867 with SMTP id 2adb3069b0e04-55f709bdb50mr4607478e87.45.1756974250709;
        Thu, 04 Sep 2025 01:24:10 -0700 (PDT)
Received: from foxbook (bhe29.neoplus.adsl.tpnet.pl. [83.28.94.29])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad2e35esm1023344e87.132.2025.09.04.01.24.09
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 04 Sep 2025 01:24:10 -0700 (PDT)
Date: Thu, 4 Sep 2025 10:24:05 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Shorten the transfer size non
 compliance message
Message-ID: <20250904102405.3109bfa6.michal.pecio@gmail.com>
In-Reply-To: <CANiDSCuwHo_wLqVwPj8VHmNAgZw6gyq4zxoapvGxDwnb0tfkxA@mail.gmail.com>
References: <20250904081429.592e439f.michal.pecio@gmail.com>
	<CANiDSCuwHo_wLqVwPj8VHmNAgZw6gyq4zxoapvGxDwnb0tfkxA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 4 Sep 2025 09:20:31 +0200, Ricardo Ribalda wrote:
> Hi Michal
> 
> I like the new writing :)
> 
> On Thu, 4 Sept 2025 at 08:14, Michal Pecio <michal.pecio@gmail.com> wrote:
> >
> > This message is much longer than others and doesn't fit even in a 160
> > column window when printed, despite providing little real information.
> >
> > Also replace 'transmission' with 'transfer' because that's the actual
> > name and 'max packet' with 'limit' because it isn't same thing with
> > isochronus endpoints. Remove cryptic abbreviations like 'ep'.
> >  
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

Thank you.

On second thought, I'm not sure if those brackets look good here:

[ 2410.688715] uvcvideo 11-1:1.1: UVC non compliance: Reducing max payload transfer size (32764) to fit endpoint limit (20480).

but I sent the patch already. If you think it would be better without
them, please feel free to tweak the patch or ask for v2. If not, meh.

Regards,
Michal

