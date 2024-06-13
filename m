Return-Path: <linux-media+bounces-13212-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88104907CF4
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 21:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A18AC1C24001
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 19:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 950D47E796;
	Thu, 13 Jun 2024 19:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7QG8eqQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2482F6F073;
	Thu, 13 Jun 2024 19:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718308303; cv=none; b=S/1CL+71eOiUkvBx6ILNc5wLXkJFj+Q6iiQei/umNpAW8eunxz3oeaXBprPzSo/mW9lLlue4F0dbAzwxXKWiEVg6aMqwk1M+TZIXoObmZ4X+rXmnYRTzx3EAGBi6RsIIabh/zPlUPNiCfCCo6wOJYgE6lx+YJnPsdIdIbR1hoAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718308303; c=relaxed/simple;
	bh=2FR65H6oQRmxvXkcwUoWkYMkK7DPPvgBTT5D29nbwpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XlDf+uH7DzQ23k/IT/h6FDj/G7Sh5Pt8Sua0D0VaSyYPz0cK9RQhL4P/3it+YZMUqNCO7WJXVzO7ZUQu3AnMK4I2Ue+aSkdSKqS1/Eas5R1AF8eIU+wR3o92NQJv+pOyrT8KkC/GV2zQQFCLVSDY844X3I5obQy5RfnAvIfuQxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7QG8eqQ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a6f1cf00b3aso230421066b.0;
        Thu, 13 Jun 2024 12:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718308299; x=1718913099; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wd49EutyMLwKOtVYeW3XG9F3kbsUtYIJI3CsIowTYE4=;
        b=a7QG8eqQl2v8SbteBTK4ct/C5pVfvek6y+L/QYaEoNc1QMvr/UbyYVA8Nj8/p7Qjfx
         u1AxwmEIyF8jVuG221mDrrrBAaSJ+OXOOdTc7KbDwpRDGdWkUcLr1AY9ZLU4y1rTDTmc
         BOkZ/WLp5ON35EXgZTYY+B8lkYmYG5UzcQAldEUmDlSAD1ysdC+m1F1tORw2yqnR+DrJ
         79Yk6TBzr5INsPbQ78ZO6+A4cD7Myvmvpjm4jGZH5eopaG5/slW+AKKi/vkROKvm/Kra
         fWtd2lhq61eYlHScJgF8bgql3lWbky0MtFboRAyDmmQpJsahhQI1mfwR1Y8YOz2OMPm0
         5mSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718308299; x=1718913099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wd49EutyMLwKOtVYeW3XG9F3kbsUtYIJI3CsIowTYE4=;
        b=bWr9yLTtjy7xZfm0tjPrRki+F4OjBDg2N7FpgUEz+7PeeUCaNuW2cG/KfSV2GLQXKY
         29B0m0NnCPNysipvHqooHYkKZyc0qsX1OLphQWsd7Jhn1+jLNlrL9tEBRElHwY5VoLiF
         m7dZlZN5TTtF5v5l+Lvbn7LTO3Mv6idXVVEd+bSholBre7Wen+uwuipqyrRZ/chmkyFg
         9XQnJRTZvdl2ENNIkVN+aMZAzJhna9tvTzQlVrYyWaZaEb3lJZ4eKJmerenP5JwcF/B3
         rg4M8X/l+F+BUgXAmc0vNtddRYTK0E1Q7CKSRSsBMKNurF70LarHjCJx3aKMTm9QT6Fh
         LV9g==
X-Forwarded-Encrypted: i=1; AJvYcCWeGw1N2wGZDvdgKRpSzJnkGMdqSiHqdLk/kX4WaGdmIibk+zSEk3T2/mTJ2Q7nWXpHmGy8R9eAWT78TwnJGLid0gTe53JbXeM8yOf59J07S9rjWlj7ZWoHGTdGf3VrE6M4EXfp7RQcmXjfi4+cM7Aub21mjdCn6E5s6z+cqBxl71QUwF/p
X-Gm-Message-State: AOJu0Yzl2rGDuKVnj+lcScOMFAM4lKI7+ChSrjkRlqj5IsfdtpGpiyyY
	noQRCG1AQ3RXX6gBqWd1xbVZ9cTVD2IEVZfqWCVU9TS9LKSrLmaVpLHBn3ksmlBHYAALfa8StrH
	XRCr49HmbAX5KICaDORiI6NxMjRY=
X-Google-Smtp-Source: AGHT+IErRieTi+saRfAiHY1ySQX0ddVIoYhrdonTqyNzBa1+IpOMd/MmGEDmPaGqQkjrTu7v+AA2L9lTIH5K61Z97aQ=
X-Received: by 2002:a17:906:7629:b0:a6f:1285:5799 with SMTP id
 a640c23a62f3a-a6f52474235mr242477566b.36.1718308299119; Thu, 13 Jun 2024
 12:51:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240612012019.19078-1-zhi.mao@mediatek.com> <20240612012019.19078-3-zhi.mao@mediatek.com>
 <7c71534f-9815-4ea3-969f-c04d249d35d2@collabora.com> <18d2c28fc8b47889689a1506957ea2a308c80fa2.camel@mediatek.com>
 <171823714905.1550852.13442340621133903705@ping.linuxembedded.co.uk>
In-Reply-To: <171823714905.1550852.13442340621133903705@ping.linuxembedded.co.uk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 13 Jun 2024 21:51:03 +0200
Message-ID: <CAHp75VcA9yZ6bVt+10FrzB3L3wPj8fW5UBB9D7p0iHjLaxWCpA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] media: i2c: Add GT97xx VCM driver
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: =?UTF-8?B?WmhpIE1hbyDmr5vmmbo=?= <zhi.mao@mediatek.com>, 
	angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, 
	krzk+dt@kernel.org, mchehab@kernel.org, robh@kernel.org, 
	dongchun.zhu@mediatek.com, "heiko@sntech.de" <heiko@sntech.de>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"laurent.pinchart+renesas@ideasonboard.com" <laurent.pinchart+renesas@ideasonboard.com>, 
	"yunkec@chromium.org" <yunkec@chromium.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, 
	"bingbu.cao@intel.com" <bingbu.cao@intel.com>, 
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	=?UTF-8?B?WWF5YSBDaGFuZyDlvLXpm4XmuIU=?= <Yaya.Chang@mediatek.com>, 
	=?UTF-8?B?U2hlbmduYW4gV2FuZyDnjovlnKPnlLc=?= <shengnan.wang@mediatek.com>, 
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	"alain.volmat@foss.st.com" <alain.volmat@foss.st.com>, 
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, 
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "10572168@qq.com" <10572168@qq.com>, 
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"mehdi.djait@bootlin.com" <mehdi.djait@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 2:05=E2=80=AFAM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> Also - Cc: Dongchun Zhu <dongchun.zhu@mediatek.com> who is listed as the
> DW9768 VCM driver author...
> Quoting Zhi Mao (=E6=AF=9B=E6=99=BA) (2024-06-12 12:13:40)
> > On Wed, 2024-06-12 at 09:07 +0200, AngeloGioacchino Del Regno wrote:

...

> > Our project uses Giantec VCM hardware.
> > For detailed vendor information, please visit: (
> > https://en.giantec-semi.com/yqmd/164).
> > The VCM datasheet we are referencing is provided by Giantec.
> > Currently, the relationship between Giantec VCM and Dongwoon VCM is
> > unclear, but Dongwoon seems to be another manufacturer of VCM
> > hardware.

There may be plenty of manufacturers of the same/similar IPs, but it's
not an excuse to have a duplication like this.

> > From the perspective of software driver development and maintenance, it
> > makes sense for each vendor's hardware should have its own software
> > driver.
>
> Personally, I don't think so. If two vendors make identical parts, we
> shouldn't have two identical drivers.

Exactly! That's why we have compatible strings or other means of
reusing the same code base as much as possible. This in particular
reduces maintenance costs (of all means!) _a lot_.

> I still have plans to refactor VCM drivers if I get some spare-time(tm)
> as almost each driver does the same identical task. They're all just
> copies of the boilerplate.  That seems like something we should reduce,
> not increase.


--=20
With Best Regards,
Andy Shevchenko

