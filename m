Return-Path: <linux-media+bounces-22041-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE9D9D8CC4
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 20:19:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90D03168A52
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 19:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7701BC064;
	Mon, 25 Nov 2024 19:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jeO9povu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F9A2F2D;
	Mon, 25 Nov 2024 19:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732562376; cv=none; b=p0jO1sqCM02IuopBIJTkjXKwKusdvlmpO3fVGsB2kSHh09Ykrpek6mc1SUflanxpZAjPNuQGxgn39A+qbMNM3qAOMFErwO9m0ovEbZgO300mFhUiv5Z3rFtp5qcesclkfLb1DCTDNNr9mEJ3QghKzBGHhPkr+PdrngGcOeUn9d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732562376; c=relaxed/simple;
	bh=lU17cppgoinyWopdxSoiQkcAImV6/a7OZ/O0RJH0yYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mXG3pfRDzKBiejOUEfz8BrfXN+YNQ+OKxGiyKOYfofpCUhfZk/aP/hHkBYqx116HqAlwzYU3UgIs0CNXycr9NjpJuIFTiN2c4BGbWQbhIFafTkyWD/vENFdBK9iCbKDvV7SMucmrl0jgUXYUsHqxN3K30jEyZi1UfyCslP3TxA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jeO9povu; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-466897883dcso14745371cf.2;
        Mon, 25 Nov 2024 11:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732562374; x=1733167174; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFcDtbEmq7ZVjInvpisCNfzHQPlIXkFOIPRXlH+eeHs=;
        b=jeO9povuyT68q+fQ7TaNsk++rR5MwOE9jzZJViRxekPGw+OFkWNg6aU7OE+Omf+NC5
         vabGfsaMyPXYE2cbskOeY+64z3Ak6upp0mPE937wJmpdsxEVtA5sp0tSu3epgVUKBhkH
         f9OG7pVixGWpDTWyBVyb022m98aOLMyrn10yhuYsiYXeWWff0fg9DiBrYtz2iE4M/SK0
         GAYRHU6ZmUoyFE3jsxVEtEA+WIPhpmhJa+YuX8PyxapGu3AHcoIdqsQjr0ihngQB71HQ
         DdWsS/4XC05sag1dbyTuBTBIVVOOeazxjm93bWRC3CT+/x76+08z6JgvUffHUYJ12Puu
         EMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732562374; x=1733167174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mFcDtbEmq7ZVjInvpisCNfzHQPlIXkFOIPRXlH+eeHs=;
        b=s6fa6iy03zz6FpKrFGG8JEwnb++ZOTdySk82UjanR+BfcU3y/xJJK2lrSIuopJ4kp6
         WXqM5YM4hNYA25HiU4yFJQn0x8JlP0zFMaTJqZzrN4WdWDmAgXjb4HXnZLinDndDf9U/
         wPxSzQa9U4iSPG/XSsUiW9OTmdS3+gwR21HLAOl0kHj5KR3/OzQIS5LmHejvRyHBbQz8
         HivxN89P5oaa7PueI8XWs0skeeaXFM37VPGq6enCWnG3fj7OpKdWBp7wU8Z378pph/Au
         TsVlMypsMP0IU1CAn8LDmZ/SRpU4uf9ZdHPH3uuvlS9RX4LDxD1fstYb36+fNtgf3wPV
         t8hw==
X-Forwarded-Encrypted: i=1; AJvYcCW3Io5B4pxHuMFUSPgDstMh6Q3V3HnoyOw9OHFO0sL9x4SubWg4aXU14tLq2gitqmFKs+0/6q4VMZFfvQs=@vger.kernel.org, AJvYcCXVMlQDS1/YvugRym4660LgbwyoXvJkRvcPhrwE2rCbNHDutswf/QvXmjgbWFUICFQiPxseT6JoZPUWnVI=@vger.kernel.org, AJvYcCXozSu8OaUvXaGZ0WYormQf6UFTrgDRo1fflhI0ZWmc41o5JSo3oMETpTRiWDVOzc1mlYBk7vhViXjpSypVLGDyieQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKZZw6a2noI6sca4dNYZozHSOR/fgnndXn0yCL/9YFnU4GnytU
	n+FUi7kKvKaD+Q6Cw2nRI2QzNJX2v2ioj3QHaJ9IWA27KeT48ZpEwVInX0wLHOF2KP3dTPosfbg
	7hF8J/xSeTqEodxeusUFYw8c+yrw=
X-Gm-Gg: ASbGncue8bPEmpyNo4p1A9kWJZFRggHB+PmZeDaDYdm2zLEDwbvgzIF5OBgOofP8Uwv
	0P9+Ey/fldVsDq/xjtZQyoLBtZ8MzkjJ/
X-Google-Smtp-Source: AGHT+IG9FRlCMVjbtG4tYT5ULavoFaSRxzvNtQwBm2toqh3xQ8KXyaHmRc8ym5w+bW67nXYMJSqEy467XPS2DlqbNmc=
X-Received: by 2002:a05:622a:2ca:b0:461:313e:8868 with SMTP id
 d75a77b69052e-4653d646ebbmr209731321cf.50.1732562374448; Mon, 25 Nov 2024
 11:19:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241123212624.6237-1-jiashengjiangcool@gmail.com>
 <b3e2ed68-092f-4ccb-a945-19e19d5c8071@kernel.org> <CANeGvZXjUUOhySGhMCXDp3yfTtuOKdXgMa7DTtZDpq1iXkkfhg@mail.gmail.com>
 <aeded772-3471-44f7-bdb8-d820ddcf0c6d@kernel.org>
In-Reply-To: <aeded772-3471-44f7-bdb8-d820ddcf0c6d@kernel.org>
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Mon, 25 Nov 2024 14:19:23 -0500
Message-ID: <CANeGvZUkFqnLJW2aPvxCvSoQZ4EoV-QKc5WeLtimzGspgWpJGA@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: camif-core: Add check for clk_enable()
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sylvester.nawrocki@gmail.com, mchehab@kernel.org, dron0gus@gmail.com, 
	tomasz.figa@gmail.com, alim.akhtar@samsung.com, kyungmin.park@samsung.com, 
	laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Mon, Nov 25, 2024 at 2:27=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 24/11/2024 22:10, Jiasheng Jiang wrote:
> > Hi Krzysztof,
> >
> > On Sun, Nov 24, 2024 at 5:50=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 23/11/2024 22:26, Jiasheng Jiang wrote:
> >>> Add check for the return value of clk_enable() to gurantee the succes=
s.
> >>>
> >>> Fixes: babde1c243b2 ("[media] V4L: Add driver for S3C24XX/S3C64XX SoC=
 series camera interface")
> >>> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> >>> ---
> >>>  .../media/platform/samsung/s3c-camif/camif-core.c   | 13 +++++++++++=
--
> >>>  1 file changed, 11 insertions(+), 2 deletions(-)
> >>
> >> Nothing improved...
> >
> > Sorry for the confusion. This series consists of two patches.
> > Only "PATCH 1/2" has been modified, while "PATCH 2/2" remains unchanged=
.
> > As a result, there is no changelog for "PATCH 2/2".
> It is not correctly versioned. Version is per entire patchset, simply
> use b4 (or look how any other patchset is done via lore.kernel.org).

Thank you very much.
I have correctly versioned and resend the v3 patches.

-Jiasheng

