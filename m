Return-Path: <linux-media+bounces-44254-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 79616BD2404
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 11:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 25FC23496E7
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 09:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC6C2FD1DB;
	Mon, 13 Oct 2025 09:21:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EF02FD7A5
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 09:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760347311; cv=none; b=uy6ZTK2MqNSJZi2oY4itrLnIztMcEiVY7panS8Ou7pBaB4XG1TUnJFLfjAXZbG2BQ8o8VDXcDjHL76In9pUZzSCBjFH21XV2Dj7tZJIupD/5i2m1TwphigTDM259OBFhFSHDE2rRHrJUEH9MC9IMTozNOlQtm7llWLZCJMLqGCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760347311; c=relaxed/simple;
	bh=RjZxcAfi3V9A5U9SAZfg5Y9LkVVCiWAYMVhIYAGJi8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K7pjrsJCRmliUomopG4iP0+B60ulyK2nFdcjbaUXmjaqyDW/jW5dtE+IPMPL+Y4qSFcWtoJsp5ehbLlBVBv3rwVxFl0UJNNiXT9fLRetpBjj91WMdFt/VAOdefvWwGePnP29K6XxMso2muI0FItfIdC1yGa2I7+sDwX/VUzSIfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-54aa5f70513so951831e0c.2
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 02:21:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760347308; x=1760952108;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LE7TmgC2chzOeWrOmbf8+Owl4JMPcc5AVh1uFAo2uoc=;
        b=dRhz+cobfnskWHLxmjMohMYYU/NlUve8tdiELHaRZutccg9vNIhrcY48qjWJnWbO/P
         +61krFn2ygeAsDR/n3KaIbFtA1tFyhoGc4B34tNiN0FciexrQFgyp24diQBgioEgrloX
         QAxt3Z71M6skOJOHLGIJesBN6K44lEaSK/8hegBhMuXe3YaGLVYTx744s25zsiAukjbs
         aMHdJNNiWtmILhYkOUVxcQuODYsD9j9/IHUnssibL+9pwbOad5SRxTJdPffL/lQsqXO0
         LyvdpuM0FuOdLwFJYQFD9Wilk3XEfNh9h2I1KqMA3nWE5FkNGDpUOpzk8hVJsMMKehtS
         mdIw==
X-Gm-Message-State: AOJu0YzKz1CZDNbkd43fyjm1LVMVDe+2V7MXZ1jj3jivc79tWtrWvIQJ
	EgcEJBp1ZDl/7TpknVI6hV0gnHVCAKK5Ash9NjwpsGCAcUqdCGa7Tf2U6n2Sq29a
X-Gm-Gg: ASbGnculawuALhWVoXDxvgcPD7/SQfSb7ssXNxC/ZO72hoqTTP0egendYvepNx6uNZ1
	ujaR2KdxxT4kxXEOOyQPFb1xLCZ2SSa7uUyHsEGR43854x16Hvdc/V1URDoJO8VowyWw7iZKJpu
	6VICY3LDFQS3w8R9penJxzE8u5K2clh4m83HQIKWi7TT6g0dQer2IsxVt6Gk07s0+pmADog5Cp9
	zjTxNUMIFTvswDw0F+ppgrA67qeFA9rKCuSqibDJfkcKQ5/lqMAoz3OKG02Rf+nDF8HX4yA3Umq
	xy+V/Wy1q7No0WHx2uFj+JwQQxzweNHEs/CjeuQhf36SScIrmrpv7I+/O6dJGeETM9VtFfTbxEl
	989uQ0g3fG0hnjge86Z1WYZVY6QUqjiHNR9vPMxFbKhiA15paLECTXZkyLSBoZV65u+CLzRk9m2
	bpt7J1gch58XagKUMA7A==
X-Google-Smtp-Source: AGHT+IEUHD7qlxShMNMdy+mWmtxXN29x5/WturwTDCv84Z4hxQ9Ayv4+uxz4bTehp3LXmRbQhk7RoQ==
X-Received: by 2002:a05:6102:2c14:b0:5d6:1564:c09c with SMTP id ada2fe7eead31-5d61564c128mr1247791137.36.1760347307844;
        Mon, 13 Oct 2025 02:21:47 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-930bf6cec14sm2641410241.8.2025.10.13.02.21.47
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 02:21:47 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-91bdf1a4875so715433241.1
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 02:21:47 -0700 (PDT)
X-Received: by 2002:a05:6102:809a:b0:5d5:f6ae:38d6 with SMTP id
 ada2fe7eead31-5d5f6ae3be3mr4887066137.43.1760347306859; Mon, 13 Oct 2025
 02:21:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com> <20250812214620.30425-72-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20250812214620.30425-72-laurent.pinchart@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Oct 2025 11:21:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVTSi6FDvsRziH9ZABR-PbtUK+ApUZCK1hGnKkCUQpEWQ@mail.gmail.com>
X-Gm-Features: AS18NWBAvXq59rhsAhQQrBuQg2NKdE2kj1vgNldRd5rxMwh2dBzQBdR_oulGrYo
Message-ID: <CAMuHMdVTSi6FDvsRziH9ZABR-PbtUK+ApUZCK1hGnKkCUQpEWQ@mail.gmail.com>
Subject: Re: [PATCH v2 71/72] arm64: dts: renesas: aistarvision-mipi-adapter-2.1:
 Drop clock-frequency from camera sensor node
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Aug 2025 at 23:48, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> The clock-frequency for camera sensors has been deprecated in favour of
> the assigned-clocks and assigned-clock-rates properties. As the clock
> source for the sensor is a fixed-frequency oscillator, simply drop the
> clock-frequency.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This patch depends on "media: i2c: ov5645: Use V4L2 legacy sensor clock
> helper", which we tentatively plan to merge for v6.18. It should
> therefore be postponed to v6.19.

Thanks, will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

