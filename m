Return-Path: <linux-media+bounces-44255-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F37BD2419
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 11:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E3F324ECEF4
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 09:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D60822FD1D5;
	Mon, 13 Oct 2025 09:22:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3E42FD1B6
	for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 09:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760347332; cv=none; b=GQdDIdp8Sz9gdOQ+gicYv7+RZtA05VXtPtp5JVoBVfjyaCBTr7PSPC9kvgceDBpbocu98C+ywLL/YoztXJo2tnvRQfHTsjVK0xU1HjNEWsn6YhDB13umOe82fvnw0Mw14hlhEPuoxfKAyedOrDoklbi/l7Da5zF97/mAUE0jOmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760347332; c=relaxed/simple;
	bh=RjZxcAfi3V9A5U9SAZfg5Y9LkVVCiWAYMVhIYAGJi8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cccxIzEkeTsoWIv2hQhxeGbVlDsFcGi5IjxYgmkttWXKOO2spz/zy1W2oXtnJndgsZrTYFBV9UfWcZqW8JcAprYs76RZiQco5lgI2ThtklVxoktOyopefHuCDSrsdAf1egQxYMhkh+SzQTmG5Jnzt8CWKIGKa0c/GbWyDszJIL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-54aa789f9b5so3344897e0c.1
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 02:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760347330; x=1760952130;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LE7TmgC2chzOeWrOmbf8+Owl4JMPcc5AVh1uFAo2uoc=;
        b=Zr9OlqjrlbLTVQBbuOACv/uKwQKKMKWsNTeKOhK+DDxRVBz85Z+Qwa5i9bv+Q+HliI
         rzutSNn6xdFVo1x9+JkVxeI2nmVdfSUZgX51M7ndM0CLqWyapq3ZQ9qewvAm6RcErO7E
         K5GypsVe1nY/ACaSHH8164nftaRCNByh+CfFdBnABlIlA/SMCbIdKi58Jh9lobnYibx5
         oUvjB66liXxLAylz6MH5bbMfYM4wwItfY/5N4RiVK7bHlMfs8NN29v6+2yS/iAEFAy4B
         zTBQ8cuml0wVbaNfjj6ZdyoC/fiEWoMUprIX3XDotVO6+65TIVjI6uSQamiMSSJ1aq8+
         +TRQ==
X-Gm-Message-State: AOJu0YzKbVyQgN/VeVAt0n9RDiJ/V/wmxPZYSdr+XzqgFNcNegMcOdoX
	wUw574pGlfem2Uzht45YIaHXufiJ9Z3SLn8tQDv+oafxoaZiJeoYcONruTS8GQac
X-Gm-Gg: ASbGncsO9CKY8fSupgOaFsrsKFTh20RKsogPxO4cc8FswSAk7xFde6DlPW3Zj/dsyb9
	RbQVCMuL06Yqkms1x+rdZ23IgiT52rGC2xftZDDo8A+/W9xC2D0JjjFsbL5PUMMSqgxJksTBYq6
	DFuYf7ye2ufJYmspNsvs7oseBgGIBfKlaSFLtZ8AXH3iL+AQcAwfGQALhMColUI3WUw+wAkfsC8
	JARNBOODw1VLPjvmEX959xZ7UjvXaW0H0u5YjrGUUIxeHa5TvueLGK+mfum8sSAEQVeebWMbiUY
	3gtWqfWHvcQaOuMN6za6xT0vFLdMywBbMaw0nSRREC56kdTIKyWpukvIT4DaNTeYT4NuJvytwXL
	z5xECRNMT1+nNQtgvu58KDKhGFk6Us19CQ4Rst/EwCirGXto7SZbBY8DEasPLcHHVI1mVijY4Gu
	DyK6oghxs=
X-Google-Smtp-Source: AGHT+IFCdyMT9+F0BjkbNujm1pm6qwAjvFGdSJpc604L7sSvAmgrvpcQi5FziTV3ZL6ivhDXAydfCA==
X-Received: by 2002:a05:6122:c83:b0:520:64ea:c479 with SMTP id 71dfb90a1353d-554b8b941a6mr7776011e0c.10.1760347329693;
        Mon, 13 Oct 2025 02:22:09 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-554d7f0fcc3sm2931456e0c.10.2025.10.13.02.22.09
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 02:22:09 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-556f7e21432so3816727137.2
        for <linux-media@vger.kernel.org>; Mon, 13 Oct 2025 02:22:09 -0700 (PDT)
X-Received: by 2002:a05:6102:580a:b0:5d3:fed4:b012 with SMTP id
 ada2fe7eead31-5d5e225c578mr7941230137.15.1760347328805; Mon, 13 Oct 2025
 02:22:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com> <20250812214620.30425-73-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20250812214620.30425-73-laurent.pinchart@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Oct 2025 11:21:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVYvJFKuauJZyJqZe61G5TYpHMnaX_fFkRW-n63r5t8CQ@mail.gmail.com>
X-Gm-Features: AS18NWAAm_gDezINKRgnhFXgpTjwG25pxtXA25pOO4Uvov585HnEMLG2OoHJPA4
Message-ID: <CAMuHMdVYvJFKuauJZyJqZe61G5TYpHMnaX_fFkRW-n63r5t8CQ@mail.gmail.com>
Subject: Re: [PATCH v2 72/72] arm64: dts: renesas: rzg2l-smarc: Drop
 clock-frequency from camera sensor node
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

