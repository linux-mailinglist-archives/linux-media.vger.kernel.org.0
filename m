Return-Path: <linux-media+bounces-50028-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 13526CF889A
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 14:36:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FC2230FA46E
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 13:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C9C7331A79;
	Tue,  6 Jan 2026 13:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="glpoJe4G"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B4C3314D0
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 13:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767706141; cv=none; b=tddwr5f9v8AMu8Dk4yRHRn0AGyXjp/Q3vZzXo/CCv6h8ITdPsMDQ+UBz9VrQH0V4l90qRdVPHSSfidKQ2fwHgCzwMhv9fbQ/uPD0Uvs6tO5yCyG+rakiPVYx37kcaQAEiJxmAuDXkTzSKWRnGQ2JtQymucg1n511nV1vEL8me1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767706141; c=relaxed/simple;
	bh=1P1MLHblIEblLscCyAsxLjS0olkfH791KSwC5KO7UyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=arePji9cTCfum49CaOPGcQhtkdasbAPE2as6ICulxiXLPwrA8ydSSgvld3DMXFBFW+SeDdecai50nBgavgJoGVcMaTmInpIwv5bkac2ma7wc1JH8nyFdfEc+oKKXwIQaptNKa59WeJ/GqPgRRQo7nGAuum9gSPNvTQM4HHQoUzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=glpoJe4G; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-598f81d090cso1008117e87.2
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 05:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767706136; x=1768310936; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1P1MLHblIEblLscCyAsxLjS0olkfH791KSwC5KO7UyE=;
        b=glpoJe4GWHHxqHWCpSNe8Cu35qxTGWuT6Gykbcnxz9hvemuxBthzdOq6N/y2Lyd53/
         4E3GXGdDOLE9g60dnlEQzKsFAEwSp4v4y7AW0vFlxD1NDtW6qjM6eraI+G5qWvhyno25
         kIKm7vFc4u64jzspJn8/QPwFvwdvy9mm54GYPY7gVlDvBc4a7qv8/7AEfWndIXgYYFCF
         Rbl9bfZ2NUzm8TszT7rSE8lQRNHiuCBrDvIbZ4rkeEHKzMU2vKFOLNUk0EoLGCP5f0s0
         +UZlw30AgdoWRYkzirD7Z1MCDr2cVNaaimQme6DUURrPNkGEvLCffdr5UXhxWkLnfLE/
         rO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767706136; x=1768310936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1P1MLHblIEblLscCyAsxLjS0olkfH791KSwC5KO7UyE=;
        b=qmRHcx6Tle0DpYNfWm21f5Cjvlor3OLIzVzW9/nCDQFFc0aDzUjHhp8m+l19skz/8l
         3f85L7oSfnMAU0cFJ8EsJGIgQgzRCXaxQaNFtw+t0C/UkRBbBsAEJOM6MDRReNbldb05
         Bnr+9iI4y3Nf8NqcsKjlQ5oohEM0IwyxH/RDlwUN6ZSDPJY5NPczaHCSjgnxUhPNL+IG
         /XMLI4V/fL6w/iAHLQ9WV+Hvpyo2VSbEWsBNDNHe6fnWzDj39Zz1hwk4uzkbskE1G9E8
         m2rRggxCaKzGP3iA784BJ+cJmndUwJpNuKmoDckjJCc9VXfPRAfgNmOCx/QlbwMdWNJr
         LCrw==
X-Forwarded-Encrypted: i=1; AJvYcCW+uzmbh/+1M16AtYrI+WVDwIBiGVPu/hcKJOyzwkajPwXwyYsZf2bPX6DMJztWt/W+shjGXlzpxpJQbw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/D2jeRSjX3rWrq5fe/rSX88LlFs65QEF1/8fRx3M752VRe2Rh
	E8+BFKCYGenhaY44uZo3Dg7+tA9U+u3p1Oga4Tiu2RgmGK5WtKdRRVStJajBnRmMgGV2cQCcn51
	+saUsz7YiVWz57c9K4KFwB6do4+R0QwTMLVLhPGpIRg==
X-Gm-Gg: AY/fxX74nXLXUQ0GG0v65KKvf2WPT+sZ34iGRTDrpJGqgDzLksnSnQj9IXnpKY+OPFs
	FF6OCIkbbZRNm8jAxZ5fjFChMFHg7F16KEtuFvYiP7b0cmLKUZuHTg9BScNl0fsoaDvuVaSXzBy
	G33xXW/PFDS4WsrjMonpmhYrnv0nBD4MjA9cA2RvL/bpQAzr16M7J1EZyqlEQ/tCwLNAXXC9RJ2
	HozSeF7C3ExyLpzQIqqL4fEQkRb+Z7JeYrlQUvt6rtj3fegrZMGeUMEA34ffrDSAtNjOyQ=
X-Google-Smtp-Source: AGHT+IHkKfseNVlbexy7OYWanrOUhCQ9xbT4x6amCXeiCeHgnckAsxqlsczo+X6SDJmlQDkKr5zQ1Uvoi6Pw/dvfyTY=
X-Received: by 2002:a05:6512:688:b0:595:7854:af77 with SMTP id
 2adb3069b0e04-59b65225f3amr1166436e87.22.1767706136101; Tue, 06 Jan 2026
 05:28:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205015428.643-1-ming.qian@oss.nxp.com> <20251205015428.643-2-ming.qian@oss.nxp.com>
 <CAPDyKFpt-GL-RFcJ5mTWFqaRfy1dQJ7LL8OBCoQK0+zPDFEzsg@mail.gmail.com> <16eb88083b68e3701f22799d8ccc20b800b59d61.camel@ndufresne.ca>
In-Reply-To: <16eb88083b68e3701f22799d8ccc20b800b59d61.camel@ndufresne.ca>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 6 Jan 2026 14:28:19 +0100
X-Gm-Features: AQt7F2rDAkeOIKvNG1n_1ix69cFZ19Y_sfdt-a0UsEok8udvX69D57IFSE6PaYY
Message-ID: <CAPDyKFrWx3FwNDAzYrsQTaoZtmaM+bnx=Q7c5vxjntv4L06BiQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] media: v4l2-mem2mem: Add a kref to the
 v4l2_m2m_dev structure
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: ming.qian@oss.nxp.com, linux-media@vger.kernel.org, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, benjamin.gaignard@collabora.com, 
	p.zabel@pengutronix.de, sebastian.fricke@collabora.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-imx@nxp.com, l.stach@pengutronix.de, Frank.li@nxp.com, peng.fan@nxp.com, 
	eagle.zhou@nxp.com, imx@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 5 Jan 2026 at 19:08, Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
>
> Hi,
>
> Le mardi 30 d=C3=A9cembre 2025 =C3=A0 14:39 +0100, Ulf Hansson a =C3=A9cr=
it :
> > On Fri, 5 Dec 2025 at 02:55, <ming.qian@oss.nxp.com> wrote:
> > >
> > > From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > >
> > > Adding a reference count to the v4l2_m2m_dev structure allow safely
> > > sharing it across multiple hardware nodes. This can be used to preven=
t
> > > running jobs concurrently on m2m cores that have some internal resour=
ce
> > > sharing.
> > >
> > > Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> >
> > I certainly don't have the complete picture for how this needs to work.
> >
> > However, I was thinking that rather than using a kref and having to
> > share two specific functions to update it (v4l2_m2m_get|put), couldn't
> > we just use a device-link instead?
>
> The device link seems to be intended for power management, I'm effectivel=
y not
> familiar with it, so thanks for the information. However, my impression i=
s that
> this is indented to describe power management dependencies on siblings, b=
ut this
> was done differently on this SoC (way before my time here), the DT seems =
to
> describe a block controller which is common to the two (defective) cores.=
 So
> power management wise, its already handled.
>
> Be aware that my intent is to rename v4l2_m2m_dev into v4l2_m2m_sched. It=
s not a
> dev wrapper, but a helper object that will schedule work coming from N
> v4l2_m2m_ctx (per open() calls). Making this helper object ref counted ma=
kes the
> live-time management a lot simpler, and since its not a dev wrapper, this=
 patch
> is not creating a second refcount for the same object.

Okay, fair enough. No objections from my side,

[...]

Kind regards
Uffe

