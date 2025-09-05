Return-Path: <linux-media+bounces-41856-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB350B45DA9
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 18:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F2C21C80C77
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 16:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE55306B1C;
	Fri,  5 Sep 2025 16:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wk19Es2p"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B79306B1D;
	Fri,  5 Sep 2025 16:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757088682; cv=none; b=OV8nzWqH7exuU9SHPXIDtFOXHL9oD/VIVWyc6ssm4GDYFe/vR5WWO6hTCNsMH+a4fSkaNtTMGUuIILNs4A6XG+3aYuOmLmkyF5aT9lQUJ3y8jYYOZA5uHFdxLGdyFx1yF/zI+UgeVr9MkOcNXR/pP9XwxMjCfCPlB9tz0JdS3AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757088682; c=relaxed/simple;
	bh=AfRVaKjiP1EmsioqgdJeE1b+4oCBXAacMNkvC2Ja/Po=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S+skeeng86t6kEbXEpMOGQsG8SQ0KMCPieCBBT1Whk8jGcyA3uC+L5SlVX5B/H9ZG7rUWoSybPJF7cBQtYI/TUakBIblUtREVRDWALxxi49JLjDz707hjGM5YQaWWXWqiWVCm/HBW4t95M43QYoEQZ9uK1v6tvrEv6dP0d6I+OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wk19Es2p; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3e2fdddd01dso229664f8f.2;
        Fri, 05 Sep 2025 09:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757088679; x=1757693479; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AfRVaKjiP1EmsioqgdJeE1b+4oCBXAacMNkvC2Ja/Po=;
        b=Wk19Es2p7P16fnTDZJncDU+xJT/Y2+rML3IhxUkHIEpzlKzARLjiEIM++OiYHo3kEl
         o8PCWflOiF+zB2YOJ6ZCQq8f0xQs/5q/rhTCOEh1gMAjDTHcJ+ninJNsnEsMZ2lI/uI/
         gD608WJPDt6l2RRSpUUiOTSpWSUCo9q/A4y9jwmP9B+pGefGwjcefW5bVIkR429jpq6H
         tydH89PKbZaRCbk6Dd3m/okwBn80qaewTQHQPAqpSrCPF5eVO1t8GSJ27ZkCBz+Hhep8
         Kfr+39CBqi135ut3uJMaZ7tuS8PaymN+9IT4+LxqINlHGQw17GRC5/jYknIbyIDW2Hyz
         K0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757088679; x=1757693479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AfRVaKjiP1EmsioqgdJeE1b+4oCBXAacMNkvC2Ja/Po=;
        b=L06zYnWw+5VMqFzSqwFDljOakBSGTXHO3sdy0Fzu7OpInRJUjjUfeYp+xUZJHSd/L+
         Z5/wdDWfcIfCp+z+vyro8LyPrtnv6DGzFFBhFsbhnGyEOyZyoZ9auBtmjohrDs75j1gK
         +KydRDbusH/JoBlIP+028lVoaMztVkd12TZHb4ClogkvE8MBH9CXr3rTLqAcwMBm7ppV
         Wpv/dRAna/8ByMq6xs4hL63VPFcl/EKkdiu0Ph7VxbcgpvaATn4am1aOlqxbwE6illcG
         7iJTRFeYkZP/FbzQZNHXjhbziIfB81rdyrgqvc4JYEma2Wqw55yg3ix5YuI7uRrcT6v+
         TNYg==
X-Forwarded-Encrypted: i=1; AJvYcCU0TQRLNEMsAfUoF52AxrVJeRAwskpmZwpY91yL+ONsZiiEXiVQeD/WtY7LP/7jtBRXFygw8X2xL6lS@vger.kernel.org, AJvYcCUOum58q/DiAYMgb6J67tj+YD1fcUZ7cH0t60qTFzaeNjy2pj7Wqutpd7BNVzw1i4L7Mxcz7eTDogyB@vger.kernel.org, AJvYcCVl4D27dFgJqhZW8nt8rRrbnlMghW3NFg84QjpMwdWoGWCfGUNOLW2PRNEZda1gYBGOUF0sTYEZV2+2m6I=@vger.kernel.org, AJvYcCXkrXu/gyLyFyzrR3gBf130VAYK6kY52PMBrB5BfgXwYP1SQTj6c5Gqy6Ua5lshpcUOA2m+7vs5OR0ods2H@vger.kernel.org, AJvYcCXwyLFXG/TGPlStIs3qRl7nZcpePQyo5J6gyA2IJ+4HtuGG5C+FVih7wkBYpszyf8Z1pimZQx6esc3sMt0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdr01fR5IqtOure6KTwSYk1E73N4cKKgCehsS8fj7K7vFYJyxA
	QtvI/26E1c5V4Q27cDX4HkCs2N+j6XA0nv4G4V4XdewPtfyEtN3V2wyUT5pqmLogkV19m9LJJxL
	LndMt39YIKoY+mEI2uRk8+eaFa1y8QgY=
X-Gm-Gg: ASbGncvQCna0sSe1My76yzM/VancTFaWFNXNvtMhPqvgJT2nAbb/8/CXYrZlK3wl31S
	8ibq5v5dLbHaHA1QgV4pR9/XfyoVVdYd+dMWhN5xP0YnAO3oeBQTla7d7iDeDy2++2o2/4lu+cm
	M3ZYRxJqcDaBypiAFSvNb2paMFlduqmZipxpGcrzWcCeclUVxhg0zeagT0CJSIGEtx8zcwrQ8Hg
	tN8ZKioreQDIUe7I+zqVwLMTAdv9w==
X-Google-Smtp-Source: AGHT+IH51v+ciKEEvcas7KruyEl9MpeeesNqdypPE/z9vKPInzfIea4uW80byqjYo8CWqBN/jvW/WkCZ27XkQSvaQPQ=
X-Received: by 2002:a05:6000:2f87:b0:3d4:d572:b8eb with SMTP id
 ffacd0b85a97d-3d4d5820387mr17089464f8f.45.1757088678552; Fri, 05 Sep 2025
 09:11:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819121631.84280-1-clamor95@gmail.com> <20250819121631.84280-14-clamor95@gmail.com>
 <20250905180837.35547304@booty>
In-Reply-To: <20250905180837.35547304@booty>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 5 Sep 2025 19:11:06 +0300
X-Gm-Features: Ac12FXzeydZMbzruj0x2TMb09dNVozbOPlP5vr1tYKJLv-xNj-t8FjVS8o5nQcs
Message-ID: <CAPVz0n2m4U-7G14Jhnsm41qsj0FVo39bdJ=f8kAm=+uxZyM0xw@mail.gmail.com>
Subject: Re: [PATCH v1 13/19] staging: media: tegra-video: tegra20: set VI HW revision
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 5 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 19:08 Luca =
Ceresoli <luca.ceresoli@bootlin.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, 19 Aug 2025 15:16:25 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > Tegra20, Tegra30 and Tegra114 have VI revision 1.
>
> Why? You should mention the reason in the commit message.
>

Because TRM states that Tegra20, Tegra30 and Tegra114 have VI revision
1, Tegra124 has VI revision 2 and Tegra210 has VI revision 3 (which is
set in tegra210.c btw).

> But I don't see hw_revision used in the series, so unless I missed
> something you should drop this patch.
>
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

