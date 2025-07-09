Return-Path: <linux-media+bounces-37182-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E33EAFE3C6
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 11:13:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 263A54E064D
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 09:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42759283FF0;
	Wed,  9 Jul 2025 09:12:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D08022B8D0;
	Wed,  9 Jul 2025 09:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752052354; cv=none; b=A1QFSNxR3WQ90lDg7ZCXoIfutUoJKjfbNoO2oMyE86n8IcsBZnwdKWjg1tqvJ7B4VqoLOyKQI+bqn9cDdw3RPq5P5nQ24lCgvL3vDpN3sTDdBxOCdWlX7yASJxWsa0TCK257tmvDVlbyAu7/QzKzT4hy+Xv2mkd6Hz94k9dVm6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752052354; c=relaxed/simple;
	bh=8sUDd96Agv1mEgEAETS/CA8EquNQGPmkWVEZZgzzTfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mxNJ2mY6tc3Mlnh5GWAK+WU/8BLTA0iJSyHs1vqQDWH47ce86Kt/FqStogqreLPW230PjDAKAB4wmS73yppRshK+LnQVeg/XEztcviMWY105oiAhoF8QlPLU1UGFrbLV7IUdr9H3yOMUajyMvU2j9bAZXfs4rkAaUOhxRGC0HMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-531a1fad7faso1959064e0c.2;
        Wed, 09 Jul 2025 02:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752052350; x=1752657150;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8hM0fxayIUYuh11TkzYtjTxngCIjAol0by6ipz9meI=;
        b=f154jg0OqeOI3lQLsZlPsZbjrooh/sgvtjSExOHD6g28rclYmnUAodXdwrUAOuG0cx
         mwVVuk8gvnn5zJKB7heVuNja8AvHu1C2qAP3ZzzKmL3ytXYFhHbY58V5bjkXJ9xY+P7l
         W7isD9ZruIJkIMfNzTT7hVmvZxiDrVw7TedMe5cwq7NE1PCO9tlu8pmdrITd3DU0enh0
         ZJ7WyjLXtqohBeH37M/DLEmrqijQnHCOA/7Fq9Cna0QbJxhAEsGAd6xWFWaJXplyfOWN
         rOX4PHs0s8MsV9njYWFTJAIDsYxpeXP/KHu6VLAOjqMLiQCRZmN0MKmzbPGs6e/YDWw9
         1JVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWn1xjkBXEgLt0JMb6bJkQ+HYnGGVGVnaetAphF/U4R9O9h84017e+w5qv5pOD2r0UeprQpFgoiVgWgIeU=@vger.kernel.org, AJvYcCX50PMCDTE5BW1fhm5g2vCNNAbl3twgSeCT8q3HPK09rj64tOpIu1cIerswGuFFPETpBY0HKC/5iWRXMn7Kp94LOj4=@vger.kernel.org, AJvYcCXYKsuX0C1MD2IySUW2xB07tw7+cCAad+tbT7KShH+lWJe3uYmIeZd1iqjGzHofiBONnv7TjZSrRjcV@vger.kernel.org
X-Gm-Message-State: AOJu0YzS39m8Hc8mGUYPtBXg2V10S0q6YCl4H2NqHPTtFoAIZaOYHMu/
	vWX9Dzvq8Rfh96MSGnZh1msYiDuezUh5vZ6gEznAqB1HVYlYGZR2NDG3+sbbdOYH
X-Gm-Gg: ASbGncudssYK1HQVdtRyHKten53kQBG0QHcgjKx1xahaKCs9bOupTQq90HXmqe4ZPy3
	7uyXhoXT8wLgt/6Jhh42ZISYdVcqEjQLcb3gYR4s9iLQ+4GGZPKzMd02jnFcS/vFyXdKZHFdfng
	ZEzP/fxysZgFJwAaFDZuIU8xYmfX1dDD3ea/zniy6iYafvi4vODhjZpqdVueNtfEL7qucmqeIKP
	ahAsjcu2eND2qgYI68dLBL2lx7rnY52HWaGMtb1x2LpyXo2qAlhvBwUj+HoSroo7KXVBldBQ0Ow
	BPvnC3xqcOZ95pvd0u/1H66FsVh+fvy1gFT7UdcP2zhIENKIOjLBCIL5/Zu4CRx3Fs+WZcwcMlE
	obgbq0Sw47/K7S58Mf2YsS0Jm
X-Google-Smtp-Source: AGHT+IEmrtKJv54+c81jfxeMW3PT0DeEY92deIfvc6nzpe5YuhJJo4JVWSgMGykmDmk/6od+IICZ+A==
X-Received: by 2002:a05:6122:3c45:b0:526:7f3:16e0 with SMTP id 71dfb90a1353d-535d74037c2mr689495e0c.1.1752052349842;
        Wed, 09 Jul 2025 02:12:29 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-888e29155eesm84696241.2.2025.07.09.02.12.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 02:12:28 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-87ec4ec218fso1485470241.3;
        Wed, 09 Jul 2025 02:12:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU778HrWrmWzQBpINw7sIpedh9s2H8Mo55uERbPm/w8p0g73UR8FlzLUsLkZ5BIZkSeUhbrrdLGsXLK@vger.kernel.org, AJvYcCURrEh6iRwYMPQsh6n1JDuzNEzwAQua8HU5KRrNbm7swR4uJ5N01W8bPZZH0XuK747GcOLX+QVU6hnJ55M=@vger.kernel.org, AJvYcCVnMwg+ELltTYp89g0rhia0KDhb2B/LxxzkRA+5LEflWRYbwkSxLZA1kq2mZRjC5peimc4FsxNTWTjCLmWWmk9aPSY=@vger.kernel.org
X-Received: by 2002:a05:6102:38d2:b0:4e9:a2bd:b422 with SMTP id
 ada2fe7eead31-4f5417308dbmr777556137.15.1752052347689; Wed, 09 Jul 2025
 02:12:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704-ivc-v3-0-5c45d936ef2e@ideasonboard.com>
 <20250704-ivc-v3-4-5c45d936ef2e@ideasonboard.com> <4yt5pvsft7hgkmzsm6febhr7tp2scui6lj2gqkiwklsugb4y2l@wribzukxkpqv>
 <f59029bb-ba62-4aaf-b53e-9a8cb4887d32@ideasonboard.com> <dy3eecuuaacidhpdcuo3nvt5gputvrvm2v7mkknngks4sppsjz@74lh37ymei7r>
 <db08a8db-c7e5-4431-b83e-11a92ab3fe54@ideasonboard.com> <5ie24zvi6jupjn5hn3x642wmr25vleuercp4dxc6wxyatwxzke@5vpzqr7dnscv>
In-Reply-To: <5ie24zvi6jupjn5hn3x642wmr25vleuercp4dxc6wxyatwxzke@5vpzqr7dnscv>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Jul 2025 11:12:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVRG5dgU6Lj2eMYhEqfDs4Jw72XCki8kyL7qwi6Btbf+A@mail.gmail.com>
X-Gm-Features: Ac12FXyKxVqE425RzwZnwNE7P_ZRXZk66fSoRdOsOOQx7KnTlXMPod7jJxMqL8A
Message-ID: <CAMuHMdVRG5dgU6Lj2eMYhEqfDs4Jw72XCki8kyL7qwi6Btbf+A@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] media: platform: Add Renesas Input Video Control
 block driver
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Dan Scally <dan.scally@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, biju.das.jz@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Jul 2025 at 10:23, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
>   I recall Sakari in the past had opinions on platform drivers selecting
> On Wed, Jul 09, 2025 at 09:13:51AM +0100, Dan Scally wrote:
> > On 08/07/2025 16:51, Jacopo Mondi wrote:
> > > On Tue, Jul 08, 2025 at 03:57:46PM +0100, Dan Scally wrote:
> > > > > > +static int __maybe_unused rzv2h_ivc_runtime_resume(struct device *dev)
> > > > > The driver doesn't depend or select CONFIG_PM, so this is rightfully
> > > > > marked as __maybe_unused.
> > > > >
> > > > > However, it doesn't seem to me that the probe() routine manually
> > > > > enable the peripheral, so in case of !CONFIG_PM am I wrong or the
> > > > > device won't operate at all ?
> > > > >
> > > > > I would select CONFIG_PM, or otherwise call this function from the probe()
> > > > > routine and then call pm_runtime_set_active() to inform runtime_pm
> > > > > that the peripheral is active, and at the end of the probe routine
> > > > > call pm_runtime_put_autosuspend(): in case of CONFIG_PM the peripheral
> > > > > will suspend, in case of !CONFIG_PM the pm_runtime_put_autosuspend()
> > > > > reduces to a nop leaving the peripheral enabled.
> > > > Ack
> > > > > I would just select CONFIG_PM tbh
> > > > I dropped it on Philipp's suggestion in the last review; I have no strong
> > > I only see a comment from Philipp here
> > > https://lore.kernel.org/all/8301d2862546507303e2dba1dd61906b848552c2.camel@pengutronix.de/
> > > about the RESET_CONTROLLER. Have I missed other comments maybe ?
> > Oh no you're right; I misremembered. Sorry for the noise!
> > >
> > > > feelings to be honest, I would expect it to be enabled in any configuration
> > > > that was intending to use this...but I suppose there's no harm accounting
> > > > for the possibility that it won't be
> > > no harm no, but a bit more complex handling of the device power up
> > > sequences.
> >
> > No problem; I'll just select CONFIG_PM.
>
> You can then remove __maybe_unused from the function declaration.

You could just remove them anyway, iff you would use the newer
*_PM_OPS() instead of the old SET_*_PM_OPS().

P.S. I already converted all Renesas drivers locally, so no need to
     start working on the conversion to *_PM_OPS() for existing
     Renesas drivers.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

