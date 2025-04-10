Return-Path: <linux-media+bounces-29952-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DADD2A8491F
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 18:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDB254E38B7
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 15:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E824D1EB5F0;
	Thu, 10 Apr 2025 15:55:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDFC1EA7FF;
	Thu, 10 Apr 2025 15:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744300512; cv=none; b=odU8PpgUAcfpcK1RkiDb3J3wCWzl1HnKQ9/Sk7BK/GJZEx6wLkQAh1ePc7S3HEqojiwhX0o0d7f+Ayne/Vo69Ci3UtuCl/Tp7ci2bI5UxN86xKqOINDeLIuYuND8CjtLIB28VEfuxVFinsCHZYl2PG5rbif6j9xNJ1AjnHGmwGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744300512; c=relaxed/simple;
	bh=HuaLbGh1eHRxjh/9XvIoBd9wl+ZTVYS+7JSSyYUNJrA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZRIgFGCOFD0vBrVYVDb4u+B3leYcoPEgGS466Fnv0s8YhKX7YHn6HzRhwFFsxZi5VHwY0FOXhQ1jYQfNF/2qPvi5RE/PmF+m0fXMYTqp9hAeHz6zmWy+sCBaT1rAGPnpr3KPW8TkO8kyz5N1U1y7pzKPA55VGgmZEq0ixgkdIR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-524168b16d3so945777e0c.0;
        Thu, 10 Apr 2025 08:55:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744300508; x=1744905308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KsGLcTHeQyhASl6f7mYhm/Im6GMgT2kHBENWgeU0UAc=;
        b=LpOCKcR9co6RujiiAp8j3AWwu8xS+9lzVDccs0TjGr18orK6p4QVU3f3dyaPzS54dS
         vw9YA9YH4zUVXZJm2il89HoN3aJEix0TP+q+FZnuSJT1y9sMOVLt2DV9Tm/1FpYW8odF
         TMaK9B8w0YJ0CYuZQGab8GRyIKVXJ7v259JOBWj08veRUCvAjOnTMAElP48EEW/2POLV
         PnNo0hUruNs8EOYkkKUoy6FXCsCbUx2+/k+LsQYJa1oZowwFy9NwdE4arCKFBV5+g9Ed
         QucrkOO44E7wCIlbA+OiL+CpBJddAQmteahhdVliupwHVuY+VlF2nyxjBFhJ+za4EBU2
         wcDw==
X-Forwarded-Encrypted: i=1; AJvYcCVzXsdj3E4/aF+CCK22c3cRWMNRDmFPNU56kkAUhPfgPaOcYsA/yNxl7JdyxESXJXrkwY0TnK2pmYURovM=@vger.kernel.org, AJvYcCWw1iZG9+bggx+RhOcxgKQy4cY4SoW8B5XlYKCvhusPxKVeyFz0zy0Rqm98DCeeLGC2mUUDCeTAXriI@vger.kernel.org, AJvYcCXe/IBTqbl5xGqEOeUSc47geaMwuq01RjrnQMxtlEyDzTG/gufWQiUznv4KVBXUzsFSTfp20RW96PrMh+PGQ9sjJn0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC5YddBbOtV5oAyrT0D+G76QadeGAVUalmtFpjwc/R7YeQscSR
	xTOnKrzaeuBg/8Z9ul4xDSH2RYkNu/85awtEHtP5PxsH0viEEXPBOnTQO5I51w8=
X-Gm-Gg: ASbGncvyRvFZyu7phVmnU9yRvYCsxVZDDT57vQQ5QiqiI1A7Cnc8bRNBotJJgrYfU9G
	qYGzmaoqEnYUCEtmShltCNv6kgPMauwV124wE4sIKHz30Vob1g4W2j6d3Bti2D/IPW2OE5kFOcD
	VIcgDXpy//T+h9J6YdHSQYNltfQeD19y+oz9PtjeDxXRaj2PM2GyRO9N0VrpKKsG6CU8HrpxYgT
	06V0NhaAG8lJ5GXQnRHTIrv5xdxd4FxIPgDVFshx9zNM+mh0m1BCeySyXofOTNQdyMtLYH50Tux
	FFs3usjdpLx2586Vj1eh5L0ba5pjguL8I60HZg8fKyx6xcUrxn+lrkMi8bXmGkF02HrScL/evWM
	BT6un4Pxg7H1RFw==
X-Google-Smtp-Source: AGHT+IGYPR1vc8JMpqF28UHuLrF/hXgLgwfkrR5wwK9rTl8PeBsaN3np1BQEIMeALTMdk22MVeWsgw==
X-Received: by 2002:a05:6122:4683:b0:526:2356:f3fb with SMTP id 71dfb90a1353d-527b77d5666mr1984341e0c.11.1744300508304;
        Thu, 10 Apr 2025 08:55:08 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-527abd7495bsm700028e0c.14.2025.04.10.08.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 08:55:08 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86d3ac0fec0so868738241.1;
        Thu, 10 Apr 2025 08:55:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU631XRSo/cxyZcirhv/3GHirjuapUEaVLeLmIHivny0XBA33dPFZyfPPm0Oob57FNSdukytRBrkLBM@vger.kernel.org, AJvYcCWJRADdnBbSoMYkJ5vcXjlSghYoHKd33/K+51fdexTQ39BHQn9RznUdnMlAFkG3WD2Bmw8Jmj41Uxn+fK0=@vger.kernel.org, AJvYcCX5FcAP5fTrSmxWH/M2emeQdsMw2dksGIjn7sjH0leXfRr1ynjr2O5P4vJj6wyX1LkK3dECq5JdlLwUzDNkdtv1sX0=@vger.kernel.org
X-Received: by 2002:a05:6102:1512:b0:4bb:d394:46d7 with SMTP id
 ada2fe7eead31-4c9d6258d52mr2320758137.6.1744300507901; Thu, 10 Apr 2025
 08:55:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315152708.328036-1-niklas.soderlund+renesas@ragnatech.se> <20250315152708.328036-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250315152708.328036-4-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Apr 2025 17:54:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUDj-1-eNfM9CtHWQmrejd+raZANvcsARe2G4Te9ogycg@mail.gmail.com>
X-Gm-Features: ATxdqUEaM9MRNFQlQM6SL3IIuhUAat2qB8ylh6HkCoGsvAKAJK4_kMvbHUjQ8VU
Message-ID: <CAMuHMdUDj-1-eNfM9CtHWQmrejd+raZANvcsARe2G4Te9ogycg@mail.gmail.com>
Subject: Re: [PATCH 3/7] arm64: dts: renesas: r8a779g0: Add ISP core function block
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 15 Mar 2025 at 16:28, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> All ISP instances on V4H have both a channel select and core function
> block, describe the core region in addition to the existing cs region.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Queuing in renesas-devel is postponed, pending acceptance of the DT
binding changes.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

