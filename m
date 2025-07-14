Return-Path: <linux-media+bounces-37709-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6DFB04849
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 22:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EFE616D46E
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 20:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45A9B261574;
	Mon, 14 Jul 2025 20:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UyP5oEgE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0E222D4DC;
	Mon, 14 Jul 2025 20:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752523876; cv=none; b=B3gsBjnd1lED6ofsM8wkzb04Y+ukA71/aeMHL2DfqW6jJybzeqbiwtA0DmDG3+p27bMbe3Cxnz1wpb7E1O0LyYzcxtCn1as9tn2MJGPNHfoAgHbYpFfJyiWA+A/jLYwi3K/y+5gS79OEAwDBqVgwxUH2TVYj0EzGvkxmyRt1M9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752523876; c=relaxed/simple;
	bh=o116LaKgiE9093dMEoxX9/33WuiYNbhzU2RyjJOB82w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=btJl0y4SWqYE9TI4o6GJEoyzF4gCM2lfn1Huaj6+kK10x+9eRW/3U66pNpbhvHTSKCyO1wMpvDfNQHXjWj/bFnGNruXp9OZxBcUONSPiqMWKQ4S5tBmK+6QvcfDt3LW1bEX4EJ/pBq8EAzwtmDzp8eCvkSDdtO9yQNXA7v6gCwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UyP5oEgE; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e821a5354cdso606803276.1;
        Mon, 14 Jul 2025 13:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752523874; x=1753128674; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o116LaKgiE9093dMEoxX9/33WuiYNbhzU2RyjJOB82w=;
        b=UyP5oEgEk3CqGtCEAHdQJt1SXRULxW+g0DrywICa7MfglNfJ1tGvKRbj2KXxUHcV6m
         bvsqg72zGzAdQItuN+rn/fK/rLJr9fDUlIlQSks0luLt30I6SWouU1HqvUTXIlfg9pJG
         20sVsE7Z8aYR+4J34aIj86tGKUDTzZXL/RbpC3PMf9/ALy470kGM675Duun+5vvBIXlS
         XFaxDhWRiqf1lNtT6FdEI7Kr1wBD/L3UnXG7mcvRVUi7d3JioBJkansF6W/plqBsCvvb
         /bHSQAbwcpJMhLdJa4WfHkOiZYJOMcAMbQ8w2FbownNLXOoP9dIFoXDFdWIP9bSIuGX+
         4PJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752523874; x=1753128674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o116LaKgiE9093dMEoxX9/33WuiYNbhzU2RyjJOB82w=;
        b=T+79pryfw6W2M0JPtw9ZUWz2Acix23U2iE/8fm5Pd7oPJNS861OB7lnFGW7sckU4IO
         ZILANMh5feZwLUYry0ehBg8LrD6IW52zl2wa5AZi4cOH+axKe2zhJ5ONpKtx96AUersM
         tLr+3iz686kcucRJxGb6I3Q8ws+HmIWXXlALYhXIYkvrYTmQOeq3QUtF+xtezalVMmll
         nxyRtIpJ/e5Up8VGV1vPwly7xcNNd7DuQBe8WzUguGzxnUFHy6Pv2BTUYVi1Y60FfjsW
         e76ec/4Bm5Y1sMmXTux4aK215mTLZEgvk3rFnEMLesq1FI1drKYTvJa8J70KMwtVTR2B
         2Ujw==
X-Forwarded-Encrypted: i=1; AJvYcCXCQaoa2FIjnn1FCal4OX8MD1YyEmliTd68vQbIy0BUHXeb/DrfP0vZCUCqHVy7Y4WYj1GnpIsmGNQbqUo=@vger.kernel.org, AJvYcCXIXd/+kGVtqwHSq97luCdB68afqv78EzNctSkljLZxSYJE4bOjQUE0QDU+DopjqGTemztekL4md/g4AvI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvs8n6MVNYNeykKXltJCULk+oQWRBetsRAw4mG26o5duIiPjJR
	gw0kF6S9bmP5G7i96zuvO+mTbock5+6tajCCEcc8cL8cezWmlURVEnL7AV7eFm4aCs6PX0UnNRq
	oURlTJ9ND1gVb5fkER8xSTyYy96KzCbM=
X-Gm-Gg: ASbGncuM8MnbK++begAlOj/w2lCRvRd8yn35MZGDisa/z0N6edaYM8ec8Qf7NNaQXVh
	CS9vtYUXFgDcFVcKQxAdAVMwQ7/FWLOG4drzwbfjx833Fqx/bqEaW7H34ltesFcmjBPG9x2ET0F
	oZh9PY5CVAs+J+90clxRqkKpAwE9veFFdszs8hnLPbHgbx4wcVavThi5+jRWqEpLcmoXNnUHyJc
	hAXtBs=
X-Google-Smtp-Source: AGHT+IGoo7GzS3HLrAW/xIlHtnfmsPdRduB748ZUUggtMZR0LEKaEK3EdiT40iM/XPCwFZzKs3a+IWXQUp7hfj5Hohg=
X-Received: by 2002:a05:690c:8:b0:711:457a:401f with SMTP id
 00721157ae682-717d5edff8emr83001767b3.4.1752523873831; Mon, 14 Jul 2025
 13:11:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707140923.58935-1-abdelrahmanfekry375@gmail.com>
 <20250707140923.58935-2-abdelrahmanfekry375@gmail.com> <00673c30-8233-417a-9f8b-2ab91381fa4d@kernel.org>
 <CAGn2d8PjT+gE2EH0+YT_-ivfcXBuBM1OxTLEAvy+sFctpc66Aw@mail.gmail.com> <8372cba0-61da-468d-97b2-85deb8bd4129@suswa.mountain>
In-Reply-To: <8372cba0-61da-468d-97b2-85deb8bd4129@suswa.mountain>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Mon, 14 Jul 2025 23:11:02 +0300
X-Gm-Features: Ac12FXyIkEobG-8R07HIBrMYPv4NjZ2K5m2DDIlRYHeClMiStHBZzlat32RUJ5s
Message-ID: <CAGn2d8MmZjJk=Zr+qrOTP+wnOe5qB8T=kXEdunzWNxW2p1nwxA@mail.gmail.com>
Subject: Re: [PATCH 1/2] staging: media: atomisp: return early on
 hmm_bo_device_init() failure
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Hans de Goede <hansg@kernel.org>, mchehab@kernel.org, sakari.ailus@linux.intel.org, 
	andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,
On Mon, Jul 14, 2025 at 10:13=E2=80=AFPM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> Smatch has a check for this.
>
> ~/smatch/smatch_scripts/kchecker drivers/staging/media/atomisp/pci/hmm/hm=
m.c
>
I have sent a new patch series that this was fixed in and added other patch=
es
here is the link :
https://lore.kernel.org/all/20250712191325.132666-1-abdelrahmanfekry375@gma=
il.com/
> regards,
> dan carpenter
>

