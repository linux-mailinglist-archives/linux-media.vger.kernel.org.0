Return-Path: <linux-media+bounces-38574-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3297DB13CEF
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 16:22:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8CA81883CB4
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 14:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F8726AAB2;
	Mon, 28 Jul 2025 14:20:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A37265281;
	Mon, 28 Jul 2025 14:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753712409; cv=none; b=OUrwQjA6c9orDdzmc6f2p1TjDEoMYd+PRZaKTtYYw1vAvNkPRcXwDb/0hnrWicxrp+lLgP54cTvJS+UKPLkeuDQt6ybSGgZygqy+vqcgJkiJSwLM/IdDBwaoWcgGoRl+ndL/Tdyasb6nwot/3wFiHZwImQgrgIiSMfGne6ahh8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753712409; c=relaxed/simple;
	bh=KScW2TEfff2DeFbr9tv5xkpuMq0mJqlcJRK7/ZrXwr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WiPAUURg5ZvgB8/lZ1Oq4IMNVUcciDIQMQyj2R6QfmKSpya+iGwbe4ofHgB092ae2eI+mY0OGAme7/S2+/9ZjXRzl8O4viNyrxBxlxf/E9asdYZmyzfmExGcHleRBAYwBbuOV2OOvSM6Ei5mvQw2dy725G/Trfk+IVhvIc3Mk2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-535f0912f1cso1344164e0c.1;
        Mon, 28 Jul 2025 07:20:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753712406; x=1754317206;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xPD4jf+41+Ilbe0nBLpg7TbDJCvWddyNcY0wPtYOwRM=;
        b=DDuH4FmyNt0KCqUS6H/jQ1fn9jkn+PAPBY/dkcGirrtefY85oaFOn5iqBcp4/JsPCe
         UHBIHAK90f6SmeLZagv+qb/SSsb4dunQd47iajEXRcUW1nSpOsviLhIvpkQyRtkR5xVI
         D9G+x0O95mNJm/wu40BAcYobYOxxzLuYwlTEjdDkYJxc8LGBXOvVbz/gyNRoI61Yh68S
         ORCPTtwK7R6BNw+XfE8MQtI94eDV/d34Y/fbc5Uw+hudE0zGkzGewB/qAc0ZcNoub5gM
         5Ur2zaaEFkRn/kQdZEW2rwjNlHbWRKO9iD7vnw0zONx565HWzs/zB9znCjoPC9T1uTRQ
         2YIg==
X-Forwarded-Encrypted: i=1; AJvYcCUmvwad+MraurjKbs0Rumkjk7Uk6uCJIRS2hlHFVh6u5RCw9I2kPizl5Kl2IG4nxGyCuzBTOdyQgm1e@vger.kernel.org, AJvYcCWX24qd2uHyGZo8KHpHH0WsK4gYL0/ZTeRTcqRFC7fyourn0uzjdF8BNZUV/+Jcubrp0VyzeEYwh79HmW1g231hMH4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrBBJg2X5ZAN2+JiQ2XmgvNNJPjBd0vEFfcuCJi0W/wX5rzFJM
	ZpAka4CJJPRd4zxyAsB0MAfxQm2PpfauDBE5u95b+Z7TF+5FMRVj0Ofbs8TzMAvL
X-Gm-Gg: ASbGnctE+JrBwBo8DkpOUFhxz4ZlAQ6bGOqqO4ufDSwXySn/Fnu10W2mlHkWOFIdNcu
	J+wgFtKn6R3U4zFmmrvgs2kTMvt2CM6HQ7XXyU2wXDCuQfzmyQL3F+B7MMJO0qZQjZKV9w5FutN
	4CY/foeGdPVRSS+huJR4nAOnyTc7neEygPpIiwMxgaXTGq1p6CTpcNDsXB3d5K+qUJfQ14noTbe
	9HQCTi9gTPoggsv1PXnEEA8bcnMtBKNFBgHssDM5uV9QbwXcPRs4wP4y3OhPwsn9VrJw3lx4a/d
	NYdB85WAM7jmi97x61PcNWkB59QObt+TXj5mh+ndXo/sy+2uvadWkVgtemHrihS+ucc/nGC8+xV
	48ac63tM0C5DmNSD5EKKlXUfd3WJ0qUuQn07lHHl1M/78QqjbFhe15IAmMzvw
X-Google-Smtp-Source: AGHT+IHE6JFBzfBcWSE5YUdbexjf5hKe/z+E+offhdCGBRv0AldUO5DB6PrRBD6OGkUUwy8RdtDkkA==
X-Received: by 2002:a05:6122:c92:b0:535:e789:6ccc with SMTP id 71dfb90a1353d-538db4d9c11mr4377238e0c.3.1753712406252;
        Mon, 28 Jul 2025 07:20:06 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-538e28cbcf8sm1453642e0c.39.2025.07.28.07.20.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 07:20:04 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4e7fac85892so1304107137.3;
        Mon, 28 Jul 2025 07:20:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWD0hNFPaF67RndJFF63om7NF+OfiUTvEVRYdjYi25tQ1CyTVX7a3CWGD8/EjBMb9LmcC7JbcEiDHHzs7+S3F7ApSU=@vger.kernel.org, AJvYcCXHQ4DaDN7XJIt6n9xrIFzzN0UOOs3x/E6PPf38xxaV5meqnsAgVjVHZMdyv732yXtDcOk7QxTuiYxn@vger.kernel.org
X-Received: by 2002:a05:6102:5a92:b0:4eb:502c:569a with SMTP id
 ada2fe7eead31-4fa3fb3f3f9mr4107584137.9.1753712401555; Mon, 28 Jul 2025
 07:20:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com> <20250710174808.5361-14-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20250710174808.5361-14-laurent.pinchart@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Jul 2025 16:19:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV=kuBePu8iwfd6Z2naLYUvKM74G+UoDP9=PvD776SBmQ@mail.gmail.com>
X-Gm-Features: Ac12FXwVOA7O9oGguFx-qWOXWQ8Dz_3M6RwPQ4LJ3w9opB93J5yW_JUXD3SODqg
Message-ID: <CAMuHMdV=kuBePu8iwfd6Z2naLYUvKM74G+UoDP9=PvD776SBmQ@mail.gmail.com>
Subject: Re: [PATCH 13/72] arm64: dts: renesas: aistarvision-mipi-adapter-2.1:
 Drop clock-frequency from camera sensor node
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Thu, 10 Jul 2025 at 19:49, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> The clock-frequency for camera sensors has been deprecated in favour of
> the assigned-clocks and assigned-clock-rates properties. As the clock
> source for the sensor is a fixed-frequency oscillator, simply drop the
> clock-frequency.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Doesn't this patch have a hard dependency on "[PATCH 66/72] media:
i2c: ov5645: Use V4L2 legacy sensor clock helper", and thus shouldn't
this patch be moved after the latter in this series?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

