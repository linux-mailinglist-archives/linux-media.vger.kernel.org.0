Return-Path: <linux-media+bounces-35837-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 068B2AE70EE
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 22:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 248B73B4951
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 20:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534A22E9ECC;
	Tue, 24 Jun 2025 20:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqgj/Cnu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE1B239E7A;
	Tue, 24 Jun 2025 20:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750797295; cv=none; b=CVfSxfcj7/4t4wA7JbJma24njKvbNVFZ0EANrgrUEj92Qjcv+9Gne6tx5V8Pq8fEX10LEDqh3cYUcFwNV6dxoEu55TAUVtUUGijrliNz/qDL+D5uoIbWuyB5j73TOJoMf4geDE717eYj4jgz/08e+a4aLhNn5bwUDyABoWZBvkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750797295; c=relaxed/simple;
	bh=K5j/6oYH1KXNC9To2vN2BHAaftVspd2uOYN2OIC6GO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oFuZ+ZKootmtWkFF/tXxMqw/JIsR6nzXBapLMBBt15bdYtaJw8GlA8CMRu3V3DQM+K8CfOx8gwJRVVbX4pJQHix8WR+7RUGOCQAK1RYl6xtzFMRUnKTjclzZ116sXXdMq1OAWfZ6ylWKmWWus+CvgC9TSvU/Me52T4og+920CYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqgj/Cnu; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a6cdc27438so4926396f8f.2;
        Tue, 24 Jun 2025 13:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750797292; x=1751402092; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/P31FkjAx4pu5r0Cc+j+q8zUgTSwo2qpyckK87E9/Z8=;
        b=iqgj/CnuUjTON84B0f5OH3wUybvkbMqOEEmCXx2hIjaS9vYIH3B9bBGbbV6qfUao6J
         syoAziknLZk4Q7T7R6Vo4Yt60dgmsD71KJHIA2b9ZAitGI2UO102fmNuuwaVbspiXfhk
         us349pk+OslWpCAQvOfbbLVReeO6zE9dqXDZpPaizY/NzZM226Cmx4RTe7TLUJu+i8b2
         wjU2KDaJue+ETQ9zMr6xeel1RGmpvNt+Bd8f+huTIBWS9VWxjpgwiBvr8/yvudmtmtyq
         MWioXvo/b3ORx8O3J9zffqQHVWhl6kJJfq+JcRAIwm6WS710n9vbm8e89HLiU5AcW0kw
         JnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750797292; x=1751402092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/P31FkjAx4pu5r0Cc+j+q8zUgTSwo2qpyckK87E9/Z8=;
        b=CuU5bRRLfdHUxAqKVaRogN4Sx6xJTeA7144BBenDhqN/PodYQ7UvTGgvW6B2IPbSZp
         +EnmNFG6CnA487tu7EJ06t13b5lUna1334lM7EdKK4eyDfP2rTe0rrAdMvlfyXnVdgDI
         NtM7DfVYL3agNambknQu3JkFfs83a+vjZLv9Os4DlsrX8auOi8Uh1vtbgFkpjOv6XHqY
         JSfwqtOzpQlWEqdKP4Xw36RsRUbH5x5oVkkLimOa8S1qM8SxM8YITnNFeOEk02axeeHR
         ckyih2X4HYeVuF/9sopZijdKtTeWFtlbB680dH6/6eJrcqw0GIvTzPU7sLHybYjmG/bS
         8vLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJ94NtjbNSpF5uIjzbxMRF9SAwVLxHGaADRTGKPRM8W68k6ZWSneIi4iy8x5cJ9u81PJCbu+Yxr7bF41c=@vger.kernel.org, AJvYcCUMWpvJFEwWLpyypy/x/qmvaA+ts+OlyysPrGLby6vUAsW/lVhmpa3UUW8uPPOPigB1z8JiTEcptCf9Qkg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4YVQJLnzw+skz1FvKvh+iL+uuxJVod3l5fDos2X1DImdp9lBs
	GCWEQ4MePojq69LY9btHcAv9Tn+SqhR+lIr9pg5SE95+JcW5wHKBuTgD2ttmXXD4znPGaDCivSw
	GbDGk/X+es0bJH7HVQ4AWcuvzChwRW5U=
X-Gm-Gg: ASbGncsMWku89UotnzK/nBR3n5TTZE/7nXVV8BYNYyou+MqYDixzZezK2nvC+KbkLf+
	YH0VaGbVhEG0H36LZcQN01DqQ1M8/Gnbk/nErgHPE6ilBl5fYInnOgXnLk+t469q7g1yZTudQcB
	UM+rFpisT0s05xl2K1GSKkGi/5CGn9WrTxTDnW3X66DI9/KwFNIVK4gxnh
X-Google-Smtp-Source: AGHT+IEV419En0GlqpLoJ8SBerrB6DWTd/TY+ANk1ZKcthKUJ+wHqD0h7wu3BMWEAEQRtnffePWDGFo4o8WrgncRw/A=
X-Received: by 2002:a05:6000:258a:b0:3a3:66cb:d530 with SMTP id
 ffacd0b85a97d-3a6ed5fd86emr128337f8f.23.1750797291826; Tue, 24 Jun 2025
 13:34:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1750352394.git.mehdi.djait@linux.intel.com>
In-Reply-To: <cover.1750352394.git.mehdi.djait@linux.intel.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 24 Jun 2025 21:34:24 +0100
X-Gm-Features: Ac12FXx0vHYgR-BnxEQyuVMUWfTz2mWS13uRhkyRpoiBisvCV4emCeCrZyaLNFo
Message-ID: <CA+V-a8s1wNrgxKJv2KGq_dLXRW2o4Q30TND=0mQs1jG1t7rS+g@mail.gmail.com>
Subject: Re: [PATCH v1 00/55] media: Add a helper for obtaining the clock producer
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com, 
	akinobu.mita@gmail.com, stanislaw.gruszka@linux.intel.com, 
	hdegoede@redhat.com, arnd@arndb.de, alain.volmat@foss.st.com, 
	andrzej.hajda@intel.com, benjamin.mugnier@foss.st.com, 
	dave.stevenson@raspberrypi.com, hansg@kernel.org, hverkuil@xs4all.nl, 
	jacopo.mondi@ideasonboard.com, jonas@kwiboo.se, 
	kieran.bingham@ideasonboard.com, khalasa@piap.pl, mani@kernel.org, 
	m.felsch@pengutronix.de, martink@posteo.de, mattwmajewski@gmail.com, 
	matthias.fend@emfend.at, mchehab@kernel.org, michael.riesch@collabora.com, 
	naush@raspberrypi.com, nicholas@rothemail.net, nicolas.dufresne@collabora.com, 
	paul.elder@ideasonboard.com, dan.scally@ideasonboard.com, pavel@kernel.org, 
	petrcvekcz@gmail.com, rashanmu@gmail.com, ribalda@chromium.org, 
	rmfrfs@gmail.com, zhengsq@rock-chips.com, slongerbeam@gmail.com, 
	sylvain.petinot@foss.st.com, s.nawrocki@samsung.com, 
	tomi.valkeinen@ideasonboard.com, umang.jain@ideasonboard.com, 
	zhi.mao@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 7:00=E2=80=AFPM Mehdi Djait <mehdi.djait@linux.inte=
l.com> wrote:
>
> Hello everyone,
>
> Here is my v1 for the new helper v4l2_devm_sensor_clk_get()
>
> Any testing of the patches is GREATLY APPRECIATED! Especially the two
> drivers with the special ACPI case:
> 1) OV8865
> 2) OV2680
>
>
> Background
> ----------
>
> A reference to the clock producer is not available to the kernel
> in ACPI-based platforms but the sensor drivers still need them.
>
> devm_clk_get() will return an error and the probe function will fail.
>
>
> Solution
> --------
>
> Introduce a generic helper for v4l2 sensor drivers on both DT- and ACPI-b=
ased
> platforms.
>
> This helper behaves the same as clk_get_optional() except where there is
> no clock producer like in ACPI-based platforms.
>
> For ACPI-based platforms the function will read the "clock-frequency"
> ACPI _DSD property and register a fixed frequency clock with the frequenc=
y
> indicated in the property.
>
>
> Solution for special ACPI case
> ------------------------------
>
> This function also handles the special ACPI-based system case where:
>
> 1) The clock-frequency _DSD property is present.
> 2) A reference to the clock producer is present, where the clock is provi=
ded
> by a camera sensor PMIC driver (e.g. int3472/tps68470.c)
>
> In this case try to set the clock-frequency value to the provided clock.
>
>
> RFC History
> -----------
>
> RFC v4 -> RFC v5:
> Suggested by Arnd Bergmann:
>         - removed IS_REACHABLE(CONFIG_COMMON_CLK). IS_REACHABLE() is actu=
ally
>         discouraged [1]. COFIG_COMMON_CLK is a bool, so IS_ENABLED() will=
 be the
>         right solution here
> Suggested by Hans de Goede:
>         - added handling for the special ACPI-based system case, where
>           both a reference to the clock-provider and the _DSD
>           clock-frequency are present.
>         - updated the function's kernel-doc and the commit msg
>           to mention this special case.
> Link RFC v4: https://lore.kernel.org/linux-media/20250321130329.342236-1-=
mehdi.djait@linux.intel.com/
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/c=
ommit/Documentation/kbuild/kconfig-language.rst?h=3Dnext-20250513&id=3D700b=
d25bd4f47a0f4e02e0a25dde05f1a6b16eea
>
> RFC v3 -> RFC v4:
> Suggested by Laurent:
>         - removed the #ifdef to use IS_REACHABLE(CONFIG_COMMON_CLK)
>         - changed to kasprintf() to allocate the clk name when id is NULL=
 and
>           used the __free(kfree) scope-based cleanup helper when
>           defining the variable to hold the allocated name
> Link v3: https://lore.kernel.org/linux-media/20250321093814.18159-1-mehdi=
.djait@linux.intel.com/
>
> RFC v2 -> RFC v3:
> - Added #ifdef CONFIG_COMMON_CLK for the ACPI case
> Link v2: https://lore.kernel.org/linux-media/20250310122305.209534-1-mehd=
i.djait@linux.intel.com/
>
> RFC v1 -> RFC v2:
> Suggested by Sakari:
>     - removed clk_name
>     - removed the IS_ERR() check
>     - improved the kernel-doc comment and commit msg
> Link v1: https://lore.kernel.org/linux-media/20250227092643.113939-1-mehd=
i.djait@linux.intel.com
>
> Mehdi Djait (55):
>   media: v4l2-common: Add a helper for obtaining the clock producer
>   Documentation: media: camera-sensor: Mention
>     v4l2_devm_sensor_clk_get() for obtaining the clock
>   media: i2c: imx219: Use the v4l2 helper for obtaining the clock
>   media: i2c: mt9p031: Use the v4l2 helper for obtaining the clock
>   media: i2c: ov2659: Use the v4l2 helper for obtaining the clock
>   media: i2c: ov2685: Use the v4l2 helper for obtaining the clock
>   media: i2c: ov5640: Use the v4l2 helper for obtaining the clock
>   media: i2c: ov5645: Use the v4l2 helper for obtaining the clock

For all the above,

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

