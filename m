Return-Path: <linux-media+bounces-38575-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B926B13CE4
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 16:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DFAEF7A2462
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 14:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDE5D26F462;
	Mon, 28 Jul 2025 14:20:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945B526D4CE;
	Mon, 28 Jul 2025 14:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753712434; cv=none; b=aJw+AnRCCzWcemLblgg6jhsdjJHWLCb23F2x9cMiotqJjJgUacMblThxRKXnAhWYTaXulF2vCPkyEXfgcwQdDiyavWKMdBS6aNrulzmdhDDmJ7W+e2iGbelGZC5mcBLGTqrwcmtoSzBwcyJgDxIb4KV9Tu0ig6FNTMoTC6aaCS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753712434; c=relaxed/simple;
	bh=KScW2TEfff2DeFbr9tv5xkpuMq0mJqlcJRK7/ZrXwr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PDNxJGCE2Q7XqB0sBVByM/7o2PacM1wvH0XaXBEbBgaCsI/8hTGeGWtrJG3eHtiTLCdd9iCgSUOWInHmHtd4/LhWKqvt+snbOomf6X55t5dJ+Oz6sE3lzdOVLfTp3HzMFQPoF4aMHq+3CdwZTtLe1UvDJvdVNTM+ouf1vIxUdUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-53167fb5690so1563199e0c.3;
        Mon, 28 Jul 2025 07:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753712431; x=1754317231;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xPD4jf+41+Ilbe0nBLpg7TbDJCvWddyNcY0wPtYOwRM=;
        b=CxNFeho9QMesvHruey7BpG/+Qgbvd5J3kLhcIbOTkrgSpdwvPCAHPX+dOqeJfMVD17
         0l3Fv3Obg6zrt8dBns0wst1X1yST243XxrHsbkV1nWc9D93uRe5MfvLEIttu5Hq6aocy
         ARlqEbWipjn+dfUn0Gcu76FsnqtMNOvuMKMiSujh56iwtBAV0QAnucFgYOP2uQlMRL0Y
         z3+tJN1/a2Dv8It22P3wxND0nyiJqhls0yz6mZ7BCxJjvbMAKBfxhppbiTUNKPgZVjh5
         NVUYnmZP0S6txmyKK7bONO9/rbXVhmwPcVpcwB4O2mFbYP1VB2rA9+SStjJbmUNRC5uI
         StAg==
X-Forwarded-Encrypted: i=1; AJvYcCVTnfNOKUZmtvKJjwNiNdXtEYb0su+3LzzoIe+GHDfjyHzo/bSefPv0o4kTn9j4tpDKMMe3P2CQyxR5ikIHO3Vv6LE=@vger.kernel.org, AJvYcCW2+Tyn7pihvEjNBU66GeaSeZvygT5wNSWgKbL68v5seZGWCvKY6HmytlQftl1RKzTKfZN6HezOP/Z0@vger.kernel.org
X-Gm-Message-State: AOJu0YwwPO6nh+8uYXeKxw0aSFQpiKXGiioubPod9XnH2NnqF2dai2H1
	3y63hjYHM0I5zog0l6VF1bGbqnm9DaEhqB9pzQ9O3xvgx11SlOBwGSDDSyuzlX3T
X-Gm-Gg: ASbGncvHpb98TODaB9uBXXHFtKdFxBZ4ztCQaXw+RSS6bFrMnEocy4ZCbjmaV5mfowM
	I6VraWQAkKpso3ZXVLloIrgHmkO3TrB2TiEElXJLyXKo0PuQ1yMaVAXk305+e+5Zh5UCSWAXumE
	a5NKpy0ItiIgldGD5z3Mvfp68B8tXs0POb6bfi9eZ1lipM4dJp3pIO89IpWtfxEv3LJ3aWG7nzA
	FlLy2/3gTZv8ZHU8iUQiltEmIwiExZbT6Y1Vo2SYmTdXKR7dlNyAPw3Avizl7MP2/rWFrzF+42H
	uPmUy7JyGJ97TLKQ5UxfbCDZrOi2gGfmnCvU815HsYyOqpqsidYuHhMGYs4+wd+uOwboYOJox0V
	yCjRm/lHv1edx8SBJIjSmHLgVB63FPds19RhDBOQWKxYlRV35CPqsXWRxMe/H
X-Google-Smtp-Source: AGHT+IGvGg3zKwgauP3N9WVo2t4ezFqF+Ze+/Akaxlx+PMKU3l2+xMrTRrKUUpQEcTlwwOypUk58iw==
X-Received: by 2002:a05:6122:168e:b0:530:66e6:e21a with SMTP id 71dfb90a1353d-538db4cbe01mr4271269e0c.3.1753712431157;
        Mon, 28 Jul 2025 07:20:31 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-538e25ebd61sm1457027e0c.2.2025.07.28.07.20.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 07:20:30 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4e9a284c225so1432308137.2;
        Mon, 28 Jul 2025 07:20:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVXDYJrCOFXz7dauMPdE1pAO+VZbMhsMsWGHIEQvLs0Ddeg6YrbjeWA3lpjeJRjUMNjkNJ0Q/OyuuXZ@vger.kernel.org, AJvYcCXCuRa6m7SyPHbAbV7u7d5RytCKsR2YvPyE8Px6dVOF9FyH11NDD/+0Ucr1VVDtxaw/OCqrAmJ5o8aYgyK89j5wBXM=@vger.kernel.org
X-Received: by 2002:a05:6102:2ad0:b0:4e4:5ed0:19b2 with SMTP id
 ada2fe7eead31-4fa3fd76720mr3943103137.9.1753712429023; Mon, 28 Jul 2025
 07:20:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com> <20250710174808.5361-15-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20250710174808.5361-15-laurent.pinchart@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Jul 2025 16:20:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWRMxSgRzWRZrQbvUQXkdZz8AW2naBuj0NTKqBs46aCA@mail.gmail.com>
X-Gm-Features: Ac12FXyWXDswxlvdswJh_9c-SZ_EowZFhgwFmpzT9neYDwKhGNr10cuE13ZZ_uo
Message-ID: <CAMuHMdWWRMxSgRzWRZrQbvUQXkdZz8AW2naBuj0NTKqBs46aCA@mail.gmail.com>
Subject: Re: [PATCH 14/72] arm64: dts: renesas: rzg2l-smarc: Drop
 clock-frequency from camera sensor node
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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

