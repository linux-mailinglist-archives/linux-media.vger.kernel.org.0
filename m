Return-Path: <linux-media+bounces-40603-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DD2B2FAC8
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:41:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE04B7AF33D
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 13:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F02343D7A;
	Thu, 21 Aug 2025 13:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GXGEQuDK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBDA33472E
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 13:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755783445; cv=none; b=SDK8tInWnoiCdGxam/zUxNK+P3OQoe6PNFRhWctpX/FSm/fLMrc/MbzBIuLgTsA7uhlKPr9ytMa8ip13mJvh8nFLLIxrKjXwnzn952vbiJvPz69I5MhoZgSgNuQQ4qxLmMTB+fbFcrf+wqx2vBGS5ZpJjWorFs1SLBhMVYVxUk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755783445; c=relaxed/simple;
	bh=S0tBL68alPBoiQhQgrLoetKbMqWhl6PN9VracU1Lsqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L6u6h0lj1HyDVQU1duVQpqk31whnAmJ7XXiLOhkNwLFPLbSLA183lYC/Pk8LZB8e/szizV3GxAZWvrltue/AB4aEGAZxd5+AZDMe1QolzRU9pAWhrDh7kIy2wRQ0uh1HqKEjzb9/wXb1XretXCYkI1icctrWL1hlY872cz8Iy4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GXGEQuDK; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b49b56a3f27so78849a12.1
        for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 06:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755783443; x=1756388243; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6+lAEs4MsieSPVTZ/E6noXDmgaG1ojns092XrliUQI=;
        b=GXGEQuDKygPgA6sauxw3gpZWBZNFVB+EqqYHrcw4+wBMk4VHYiPU+PRAwNTFfPOEEN
         LiaC/JA4UanPO0VRj4Vwmf2F2B3s4Qeq0dRqzWQDGt2ifeFU6tRUai/2SsOIn1zIg5Mr
         kCw60fpZlQ999Ym28/UsWwj1iVOg0enFaTi/tnI6+NcrkRwUs0vgVBi2GCiupXU7IaBu
         pF5ebsngWkbsNa3sSNHcYhfWHqQw4CZWAscf6vmdm9r6Kw2KcgK2mUFXeZ8BDPDY62fZ
         tbtX13yAktIj2HNwaDGt0SnfuVFJi7t5PpC5ZJVQKyPjjtFs/SATgO2P09oFZkbCKAxC
         9ywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755783443; x=1756388243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f6+lAEs4MsieSPVTZ/E6noXDmgaG1ojns092XrliUQI=;
        b=IPaAynfY5EdjUtKfh+I9SNo0uX6+s64npi305gA0/ZJHB8MU1nw03k+EZCPM0j8tOg
         g9qM5wmikB5eUHXHqc7s4UEo62b4Is12sg3denLGg5AgOShQEFiXZ4zMgbwq26807SXJ
         XaVxdrcX8whNWipcxP7LHbPs16c+rxC5UYP5TjqLfK0OcKsqlcH1ycLTjretwXOuMgNG
         TOOjTyzb1iIvwW4HhqOCCeOkZlZHAHHxAod4a2NcNAooA+qyU9/JhIT9GUAU/eoAw28f
         fW0QwS4Ix+wKEfkS320RSVVIAQcdZ5npQBN0lkz2vg8lB0nfeEolLLrZ6RQdHL2XEv5S
         uERQ==
X-Forwarded-Encrypted: i=1; AJvYcCVf3MU4xEzAHYV+DlDHqTVVggAyh5klQV+P3tahKzTGwsnK6a3wc1ZWA4d3Bh4vJwLKPKn/x6JbcFxRnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIRi0Z8nd1C1QtXbJeuzMwEhHPFWqtzwc3BG+dnHyLtDh+8oyK
	30blj1jYiH71yXjshmLPeZl6nz/zAY0qwC2R5ymfrYbS5XVUosBrJCBUDOToqC1YB1XQelB4jbz
	LoOVHZCWz0gAhfAA8BtBTIeQsq5eb9yuLa3o02bfJ
X-Gm-Gg: ASbGncv+VpRA4dkj0sJdUkO0NboA69Q+at0CLtoA1PqLkEU9oQrmbS2Ubne7g7gQ+1j
	YHjE1tNnQEXxCqan98JuwE7qyZwywbu8d7oJNIcAA47dkqQO/o6uEntO+i7442HjgV72HYyQB1T
	ue2K0wjTMuKX6t7rZNyhuu51eO5I3hpOE1vDf2X9XeH6jDwGrzN1SADsY/8Ir2JZnsj/hDj2DBU
	K800JeYj/L+twLTLSXYV+jTeqRez/MjC4P+Ig4BoeIw5l3MQMXJoQ==
X-Google-Smtp-Source: AGHT+IFKuVeM8P/4fFTgJ9U8pzM7gkzc2YyF0U06MGypBG9yR59a576LajRenIcFYbHnNEUd1SatYN2HBujM5YeBS1c=
X-Received: by 2002:a17:902:cecb:b0:246:2703:87ae with SMTP id
 d9443c01a7336-246270392ccmr1041385ad.30.1755783442839; Thu, 21 Aug 2025
 06:37:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821070130.2581766-1-abarnas@google.com> <aKcRDWlRQ1gughvQ@stanley.mountain>
In-Reply-To: <aKcRDWlRQ1gughvQ@stanley.mountain>
From: =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>
Date: Thu, 21 Aug 2025 15:37:11 +0200
X-Gm-Features: Ac12FXxRWvefi0pFzenHIpwJbcSrmWtx4bZJqgVYzbGZBgzhqDHq0XNWj_bwV7s
Message-ID: <CAATBrPH-TTAdpCyCopZNsgTCqwnTBxjEiBg9HQ8KnJaPESA6Sg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] staging: media: atomisp: Remove unnecessary inline
 declaration in gdc.c
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you Dan

Posted v3 applying your suggestions.

Best regards
Adrian Barna=C5=9B

On Thu, Aug 21, 2025 at 2:29=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Thu, Aug 21, 2025 at 07:01:28AM +0000, Adrian Barna=C5=9B wrote:
> > Get rid of gdc_reg_store() forward declaration because it brings no val=
ue
>
> The subject should say "forward" instead of "inline".  Also add a period
> to the end of your sentences.
>
> regards,
> dan carpenter
>

