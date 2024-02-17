Return-Path: <linux-media+bounces-5358-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B59458591D6
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 19:49:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 471D81F221F9
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 18:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B8C57E10A;
	Sat, 17 Feb 2024 18:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q8qZYAQA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8C67CF38
	for <linux-media@vger.kernel.org>; Sat, 17 Feb 2024 18:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708195768; cv=none; b=hWno2GP8M6zLyZk97VzCmUkuAClXtIkdYh7+ykwi89RExoAMCZUEFGS/NAvYKcDjo2TEYSMkVoWQmmekDJ6Vh4DBobb6Nqd/e/8lM+sPmqPZkTYvoFzRbWomcZ8BByr9oE7pPzvcox1g7HdwkyUsQyBYi6vc6/Xwf8CM4Z1r3t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708195768; c=relaxed/simple;
	bh=tVdFkiuKgbKzE6Gz/75ntqSZtQxuEh8c1qDUVRnHDPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lN+RsDdemBnL1nlNK7xOynRenNp8h8v4pej+gA6BIUGo721MhQ98LH1ZUwDZqKmuKPV4F0PxoeHaym3inVUA2sSRPcB4nNoi7HdCvT4r/ojg4PgIxTxECpABNiLEQ1iC0rJNalCivjrNbnCCO4SWWone9r9dSyEgvllfUbK1H84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q8qZYAQA; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-55ee686b5d5so2215512a12.0
        for <linux-media@vger.kernel.org>; Sat, 17 Feb 2024 10:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708195764; x=1708800564; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8Il7Kft3mdaMOMzG2JXVblquBnarZFp7+L4OeCIil4=;
        b=Q8qZYAQACBC9Tiq+JZ6B1qiv0Bt2z9tajFADyjsVa7ay3Q5GXx80SUF9eI2TE21HeW
         SP4SuKkOe6+sA7ai7ZCsqlA1PzPf/+A43OsSDetMZCunzkxROf7R3JcMyEW20weDYcPa
         5j4l/hEn2dgu79+exhWI+FdQkrh/KF6stnr49XQbyL291uMuR11cPdaLT826j4ymUFNc
         vmXqy5tIqvAwv+OWKTqsjPLuVwii2sl1/fzlcYch/3JR+UNVTFXNylTpaUFqdpQbwEEn
         1Wxin8wbTAhj/ZN2OWIwM1lXPldd0N3N1kzwCJ4hZoWVhV7SaF1CtdsNKqqjBuptjjk0
         6+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708195764; x=1708800564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8Il7Kft3mdaMOMzG2JXVblquBnarZFp7+L4OeCIil4=;
        b=sABjyyDrSxGD4yL2byb5SJwe9v6ug6zXXtNYEJ747vHM+TiYRD8rHIcHJsMconBeDo
         IVLzWzhNDNeFSYkeTFRKS4uoss5vO978gnrjRrzfIpkFJvho+VD67yXXciJwF1GVLzSv
         nr50pEZlr6ZhzBiXGEr18ePCPcxZOIhC1WCfTK+8MzMmAHdg6Nc/5yB5j1TG/eXoPSO1
         ksRXEe3RCjJD5Fnec8JehmWEDnLKntsFgWwaAf38CkIubOE/5BwMckH7EO2n4bCoUodQ
         BWypPjCi8TEc77ITIqaaT5vGrwwSbT9Gyf+QBUIm6wMrID/LvXTfwQLLDKCAjYK3QXt7
         4oHA==
X-Forwarded-Encrypted: i=1; AJvYcCWWP6vugHiPXHc7VJL/Ztt6r1rF6Uv9IFLAkBDNxGRF95bwEN2wLE/UegUJAY+P/Gchq7c8ilfM07UyGswgKxFPQ3r8d5Utlc9EllQ=
X-Gm-Message-State: AOJu0YyGYcwowIgokLb53Rf1sFQufcw9I/W2OWE/jQaXzzU41kkkYAhT
	vIyg4T3ZqWRdHSBcG0FG1TDjMLEGzL0CyslFV/6yWCxZqPMtF2H6hG3f/xtdLiVlbsUJiFSK5Gc
	QG2kwUKcjSBUY52T8nNOUbPwSS8U=
X-Google-Smtp-Source: AGHT+IGbT/dABf64NLru2OpDqaHothjKYVRbdBSvna58sx6rvZGnGEWCJoVftQOsH16vsPGZY3be7yejhI8Ls7mkPv0=
X-Received: by 2002:a17:906:1982:b0:a3d:c9e9:c7e5 with SMTP id
 g2-20020a170906198200b00a3dc9e9c7e5mr3857107ejd.61.1708195763892; Sat, 17 Feb
 2024 10:49:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240217112438.15240-1-hdegoede@redhat.com> <20240217112438.15240-8-hdegoede@redhat.com>
 <170818560760.1206667.14199319396527835603@ping.linuxembedded.co.uk>
In-Reply-To: <170818560760.1206667.14199319396527835603@ping.linuxembedded.co.uk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 17 Feb 2024 20:48:47 +0200
Message-ID: <CAHp75Ve-v=gbNtzy4o=gvhhQxhyaw=awkDrf+_Qgee0v43PcsQ@mail.gmail.com>
Subject: Re: [PATCH 7/9] media: atomisp: Change ISP subdev name to "ATOM ISP"
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>, 
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com, 
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 17, 2024 at 6:00=E2=80=AFPM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> Quoting Hans de Goede (2024-02-17 11:24:36)

...

> Pure bikeshedding, but I'd probably lower the shouting to just
>         "Atom ISP"

You beat me to it, +1.


--=20
With Best Regards,
Andy Shevchenko

