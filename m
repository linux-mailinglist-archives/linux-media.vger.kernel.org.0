Return-Path: <linux-media+bounces-20918-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 424799BCBCF
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 12:27:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 012F728329C
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 11:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C42E1D45FD;
	Tue,  5 Nov 2024 11:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E8m6FFCs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0541D4350
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 11:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730805990; cv=none; b=ZAiHdtAvoRLBVM2xsddvEfeQij07AP8S2sPIIb2i5daaGaP9q2tvTLxAHOyl/V30+xmB8nER57KsD+O0OOlhEbl5nb09cjcrY6T36EOxbekiDjmkiT8dzkH3obsJ5Wuywle8JIxSM0GRxm8u89lk60LRsRrP3UBiZV0vX1BvuY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730805990; c=relaxed/simple;
	bh=5QQgUw2ALK33YJykVY7tKUEL4qnSJZInxh6RWYviDA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YZlA3AtXzKMX08+3xiMykXGS4J8THHYqTMNSp/wuXtpDUS1JG6BuZ9Jl+YSBi2nyKGymr/sYrrAnmj8miC1irdMyc6MLhRaERoV2I6ZtWlLWxnStcPdtn7PWIl/m9SGf9QpZkpIU/sDEQZrS44FHv9VpF5qiCN078fBGWHkHgEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E8m6FFCs; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e290e857d56so4772822276.1
        for <linux-media@vger.kernel.org>; Tue, 05 Nov 2024 03:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730805987; x=1731410787; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZbPFk8wJiQvrTCXjlYgvumUQ0j3KXfVkR1pWzQFIBYw=;
        b=E8m6FFCs+Shrh0CSDyAWDehh/MGhCznW3oNxLJnLnEW+/uLh5Ig8n441HhbIayj0V7
         OhN8KVljL00ESkeG5C9rg3HTkvELnDSI1SZ5eRePfkBj3hAP07073U56foYcQQfuKHCQ
         8Ysp2kde9dnWoPCCfnzzaNptWA/G81N/aRD2GAhbRc+k6MUc11nOPL8nW0dF9tDmJfUj
         4EitIwTY2qq6eD1tizvxK5lo4RgDIYf5r8+fqr1ZZeCojBYrDRJWSOmLRyGO/LJQXulk
         1t4fQ5AZtd6u9uUblt45kv0MZXOksD4PtZ8YVSxLIHjJnvU752Zme5feyiXZrLOn1vKh
         OxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730805987; x=1731410787;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZbPFk8wJiQvrTCXjlYgvumUQ0j3KXfVkR1pWzQFIBYw=;
        b=hFEUfaxuvDD0hn2v6V3mITQm6ASAOjcM9dIRJoRNTrOTDp533uYcDInYaxznfUJ3pT
         dat0lnyoTyuUKysZXUjlK8SPI1YuDHTIie9dqOKwn5j4opltnYeBShT83S8fMje7ONPB
         uvQYBoWuROLQAQMq0OnRsNY8b9AgMrsmI9FY8wYeTpKDPoij6eCR/RpPn6qmlBsfRDYs
         lCkq6qmqXHwlg4OGUM8EeyAtj89z257zfG1l5pCdFyYch689R+3UxX/vnWE2xITqBLjG
         syiKhZrJO5iuFN6npWsW0YuTe0syRxuEzWquD6KYas9IQ7lh/I8gwkqW8aaO48tHGf/u
         VEug==
X-Forwarded-Encrypted: i=1; AJvYcCXOJWQYiDeb1bv19/CHg/qqe+X3BvhKErLTRgSrFyZLOcVHIb8pf6gorZjacFXud3EqcLiPg9YsB7345Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfEwsi90UE1/B9oLfIMPB+v3mJlM9KgTzZm3N+lml1H5yc3EvR
	Db+2evNcWoerZKwqlfW16dfArZc4kRmjlaTx6wGSEHlXZtwRZqs85G+u818E4VxrcWybhsMF3BE
	ULILhoseZeVstueOxtTxYOnBAiZcbNbC0laxcGg==
X-Google-Smtp-Source: AGHT+IHwht1pfSwQlaqWWbyXJaYST2v470nqEkV0Y3tMwYWqipVeiUaNoITHKiBik6whym2zw0rsn51UBBneR8aGa1Y=
X-Received: by 2002:a05:690c:fd0:b0:6ea:8d6f:b1bf with SMTP id
 00721157ae682-6ea8d6fb48amr78680707b3.0.1730805987251; Tue, 05 Nov 2024
 03:26:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241028023740.19732-1-victor.liu@nxp.com> <20241028023740.19732-5-victor.liu@nxp.com>
 <Zyn5CgZvyg05cgJW@kekkonen.localdomain>
In-Reply-To: <Zyn5CgZvyg05cgJW@kekkonen.localdomain>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 5 Nov 2024 11:26:16 +0000
Message-ID: <CAA8EJpoaLnw46DUaZ+z-YSkbdk-f45-dKMjoQWu16zaC6i-H-w@mail.gmail.com>
Subject: Re: [PATCH v4 04/13] media: uapi: Add MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG,
 JEIDA}
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, quic_jesszhan@quicinc.com, mchehab@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com, 
	quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de, 
	nfraprado@collabora.com, thierry.reding@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, marex@denx.de, 
	biju.das.jz@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 Nov 2024 at 10:53, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Ying,
>
> On Mon, Oct 28, 2024 at 10:37:31AM +0800, Liu Ying wrote:
> > Add two media bus formats that identify 30-bit RGB pixels transmitted
> > by a LVDS link with five differential data pairs, serialized into 7
> > time slots, using standard SPWG/VESA or JEIDA data mapping.
> >
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>
> It's fine to merge this via another tree, too.

Thank you!


-- 
With best wishes
Dmitry

