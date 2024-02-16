Return-Path: <linux-media+bounces-5311-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EB085862E
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 20:30:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E73A51C21485
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 19:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF6B1369B4;
	Fri, 16 Feb 2024 19:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="V1iJodVa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E86135402
	for <linux-media@vger.kernel.org>; Fri, 16 Feb 2024 19:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708111800; cv=none; b=tn2wD+pgKblpvawjAx4hNJ64Y13PT+GniWXijE50/LNUFvmPLt8Sbpk0h2IoShqdU90qlFUAQFHsO3mSnMVTlCoN1h9QZpFbLFoxVbUWpg1vqV6BQNB81Y3O7IewyzE2+zQ5KTv7lOQWPHQ4DMU0EGdcRyG5ngjQEvHQwCDV5jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708111800; c=relaxed/simple;
	bh=5CLkz15pA3C0PAyuM4OD/Khdbnbhn8Jnj6R4gv2p/Lg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h7GIXYucew4MbSyK3cKb3ynyW4jq0VqdGB6c8kqmoMh3Z6Owcwk9yLWYLR9er7BEcV+D5h+hLQkZZN1T4StNJYU8MqMUxKBRnVZKDPSKZAPsFygTUWgcjk88ma0ef8y/ATd7i5NFkDC7NjXsJOIJTR2u1HXHtOpPRAU9cYHXT1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=V1iJodVa; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6e2e5824687so531205a34.0
        for <linux-media@vger.kernel.org>; Fri, 16 Feb 2024 11:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1708111798; x=1708716598; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cjtHHDVg1EP31BktP6Ck1iG9AHnmh+yzE4yzLtOxWPg=;
        b=V1iJodVa54Vr8BAocvhUA5kxxu93qf5MjhnBZgy15x1EYltuXb03vhwAhtbCfVr3xL
         V7msnCAEyj2aelZNqyllKjK9jhmmFwAcVEnulVfcOlMPpwhjVzK3SJeDJJRnT9Y2xKGx
         rnt+LrJ3KXGZFuuwNSPJSzdeRCdLEJTWix7qGMdx42FCgWJt6fmQDa+z2R8iJwkyLQuA
         +JGoySpshR1PpZR+7lvhewrtF+TL/DNFLwrkG1HhFoIsCTBl5idFk42qgqe/6+OMwUjL
         +7o6YchxRB75kcH17F5xsN9du/ZjDojh90ktr7D1/2iJ8pxvc21zYdXT5oDa/YhhIv3B
         2KQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708111798; x=1708716598;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cjtHHDVg1EP31BktP6Ck1iG9AHnmh+yzE4yzLtOxWPg=;
        b=mNMGzqLseUIHj9BzLnRYQJ2MvaakN/7ByKGeYReq8YzXU+PLBjSmwWuWt6tB7Jalub
         9OlO69xxFZk5WYyuUoH4x+q12MU/eRL7wes0p3r7NRnp6kKfKT1Bjq7d3W4O28733D5V
         BWRmdMZIQEWJt71p6IELRtpijvzx5aALllwxNKQpgcCmbqI/XeXsSFPJ2Q6pU2lXie7n
         e2gFrSKSKUUiEDTwiVJpkmiDDrMeaGLALzFzZJYM09gE8ObBsVFXmW81h2q7PicaOe8z
         bb93zFhB8PnmlFM4bp8q8vveS5MJqS+7rqPe2v/yscsQOy3IPUXj/+NTErvBQuQUY0NE
         TOtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVitaqKzUJA/e174vf05zYWCnIeqr5fyofG5vBfsLCw/Fhxhhl75et0d53egk/pjYzfeVcc5kqm3rB2G22defexgoVSIGEzhb6/TAI=
X-Gm-Message-State: AOJu0YxTawXAuo+JQJrCvh6cNm2ZgSCL6ACX7yc/cb8WPDdRo2gYFLyU
	HijEQ6sKvEmNGNGwyqmLUjTq+nnH8R68oYrsAZGXIZPHrKBKsmKQNB4PKwHHo7E=
X-Google-Smtp-Source: AGHT+IFEYuJ0J4q6Ri7W8LG928weSbYRDzhIjrV39IhvTbn+aiKejHqcf79FSbmpyPZyQyd4jTYPuQ==
X-Received: by 2002:a05:6358:5389:b0:178:dac3:2b99 with SMTP id z9-20020a056358538900b00178dac32b99mr6283861rwe.1.1708111796945;
        Fri, 16 Feb 2024 11:29:56 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:3354::7a9])
        by smtp.gmail.com with ESMTPSA id p6-20020ac84606000000b0042dc7edf2f4sm206963qtn.45.2024.02.16.11.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 11:29:56 -0800 (PST)
Message-ID: <8d68a49a35799d1686d9b674ce4edfd91c68850b.camel@ndufresne.ca>
Subject: Re: [PATCH 1/4] clk: rockchip: rst-rk3588: Add BIU reset
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Shreeya Patel
	 <shreeya.patel@collabora.com>, heiko@sntech.de, mchehab@kernel.org, 
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, 
	jose.abreu@synopsys.com, nelson.costa@synopsys.com, 
	dmitry.osipenko@collabora.com, sebastian.reichel@collabora.com, 
	shawn.wen@rock-chips.com
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-dt@vger.kernel.org, 
	linux-arm@lists.infradead.org
Date: Fri, 16 Feb 2024 14:29:55 -0500
In-Reply-To: <237e690a-2f49-4046-b054-3a878eed6748@linaro.org>
References: <20240216094922.257674-1-shreeya.patel@collabora.com>
	 <20240216094922.257674-2-shreeya.patel@collabora.com>
	 <237e690a-2f49-4046-b054-3a878eed6748@linaro.org>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le vendredi 16 f=C3=A9vrier 2024 =C3=A0 11:03 +0100, Krzysztof Kozlowski a =
=C3=A9crit=C2=A0:
> On 16/02/2024 10:49, Shreeya Patel wrote:
> > Export hdmirx_biu soft reset id which is required by the hdmirx control=
ler.
> >=20
> > Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
> > ---
> >  drivers/clk/rockchip/rst-rk3588.c               | 1 +
> >  include/dt-bindings/reset/rockchip,rk3588-cru.h | 2 ++
>=20
> Please run scripts/checkpatch.pl and fix reported warnings. Some
> warnings can be ignored, but the code here looks like it needs a fix.
> Feel free to get in touch if the warning is not clear.
>=20
> Please do internal review. The internal Collabora review would tell you:
> YOU MUST run checkpatch. Then you see errors, so why do you send patch
> with errors to the mailing list?

Mistakes helps you learn. Meanwhile, I've triggered our temporary CI which
hopefully will catch this and some more for a better v2. Shreeya, I don't t=
hink
this includes any DT automated checks, this is on you.

https://gitlab.collabora.com/linux/build-scripts/-/pipelines/85935

>=20
> Best regards,
> Krzysztof
>=20
>=20


