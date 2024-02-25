Return-Path: <linux-media+bounces-5860-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC6C862AD8
	for <lists+linux-media@lfdr.de>; Sun, 25 Feb 2024 15:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CDCC1F2157E
	for <lists+linux-media@lfdr.de>; Sun, 25 Feb 2024 14:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CFEB14276;
	Sun, 25 Feb 2024 14:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UeXeU/uj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FBC13FEA
	for <linux-media@vger.kernel.org>; Sun, 25 Feb 2024 14:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708872614; cv=none; b=dJZSm/lNvO4YZ6AZVv/SCQkvsR4u7gfoCQGjr4mvn39Y4tqJhzu3iEuOePADBpA5LD6ZlDkHdef59z0vTunthMDPIPyfuS39+l3ifZE7WBylM4sNPS2MdGXT+Hf8beOcNtMd/OfcdrIg4gQVYg8CzXv5UZyEnu4LgUbW364shDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708872614; c=relaxed/simple;
	bh=J+pLIlngGfLO+JlpRqNVIODVfFbVdIZjyQl3d4TQToY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uXA7Y5ARu6gywIZVgghtAk2UYqfB5hXNrmBFIQM2g18B/eKPBakY0RBUg27ksWG37rPIu6iqSDicZEERPKkdWklekMUor2x0hPHQbotYmISMhWooxFq1M+raFZu0bwtUjtE0ys4EbEMpnoE9v+RZ611aSX4jVdVZdfGPXUWgcU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UeXeU/uj; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dcc84ae94c1so2057961276.1
        for <linux-media@vger.kernel.org>; Sun, 25 Feb 2024 06:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708872611; x=1709477411; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8ZtuRq6cAfTAvOtymIsospr++soOYmb+Wj6Ig36bcNk=;
        b=UeXeU/ujnX45VMXsBV3cDs92J2Lme4VZJnQPy0kmNUgIf0yvpp2GZ49XyKDI00ZxfD
         ZTDzb2d2OOLMIWvqEC7Vjv8t89mb90LdmOi2NejTxB4TaeQFDA51CFA/ruoa9cBHqAqf
         lAzdrxoYtUQDOwSpXa96U4JZLHUj6gO5M0bfHUsB3ovV2przg6IDwR4/ENkJ4E1thCv1
         bf+BQgLFXGurZuyCFrA/LiaEr1fTAzZVxg5AbWnQwR2jWTHZf1rpE2uvFIDRvAQYtEtZ
         qyN0/wtBtBfEgc8MMaN10g74GlZiy8d0PQvLqCo2ONPgZTL1CAo5hP7AYZVui+A+Xn9n
         pEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708872611; x=1709477411;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ZtuRq6cAfTAvOtymIsospr++soOYmb+Wj6Ig36bcNk=;
        b=Eq6dQU7k/w8Pkrnhn5bp8XSjyzpJI65SR2OguuNjLHTbqExyakkW0zAN5DE3zc9SgL
         6dlfsDHGkJU6xIIxcdNIKmWxG052/nIjvaQ2gwvP34uQDS/nQyqDUIV2jrE6cke71n3x
         kfxYjOpCRcHPEBGZZyjad4zZAoUoNA6hxH0k2KDYXI7+EAvGZWhwRy5ttEQY3h03pLj0
         YkxtAow/sW3EojM14mX/Bhp3GL/ls50CmFJnBzWV18K46Tnsa/GQJzFzWgVha5AvyfGR
         MPW3dbQvHf1j72iF1vGroQhnmEv3mF5ZuuQehp51/XJIN3FGSxipu3Cg9rX+unndSn96
         2U3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXK09Viu0rFaAncBN3H4WYZWwicGBK/WwZz9vyi6qPt5eQJwOhON8pC7hREeI5MQqtpexOLEiWZKci5UlMioY50hciHhelzPnrruNg=
X-Gm-Message-State: AOJu0Yzy+wEJd39i+sv7Opq/NYZxTrP18LIdPYG6+aDF5dDcYv9jVLDB
	zpd8KJHHOuvpZz55f85y2PZpcpW5j3W7KtmdP4NDXlhuzENIgn4cZdLRCp2Rg0qNqodnvczAYk0
	ctYoBAePTYClatybqY0CRtekPC2xb8Jt3rE4v+g==
X-Google-Smtp-Source: AGHT+IEsDNKJglOwjpcbwuPET3jv5CNNyGpNaZEJmoSwiU0M4Hi3m/yyoB9WQeO9FCl6owi4EWs5iQnCZDMYGCJpGJQ=
X-Received: by 2002:a25:e0cf:0:b0:dc2:2e01:4ff0 with SMTP id
 x198-20020a25e0cf000000b00dc22e014ff0mr2897191ybg.45.1708872611551; Sun, 25
 Feb 2024 06:50:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
In-Reply-To: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 25 Feb 2024 16:50:00 +0200
Message-ID: <CAA8EJpqB+Mf4jp88__r5dfsRSuGdAB+Q3vK5MBfBXysvRB92iQ@mail.gmail.com>
Subject: Re: [PATCH v7 00/36] drm/connector: Create HDMI Connector infrastructure
To: Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno <freedreno@lists.freedesktop.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sebastian Wick <sebastian.wick@redhat.com>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Sui Jingfeng <sui.jingfeng@linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Maxime,

On Thu, 22 Feb 2024 at 20:14, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> Here's a series that creates some extra infrastructure specifically
> targeted at HDMI controllers.
>
> The idea behind this series came from a recent discussion on IRC during
> which we discussed infoframes generation of i915 vs everything else.
>
> Infoframes generation code still requires some decent boilerplate, with
> each driver doing some variation of it.
>
> In parallel, while working on vc4, we ended up converting a lot of i915
> logic (mostly around format / bpc selection, and scrambler setup) to
> apply on top of a driver that relies only on helpers.
>
> While currently sitting in the vc4 driver, none of that logic actually
> relies on any driver or hardware-specific behaviour.
>
> The only missing piece to make it shareable are a bunch of extra
> variables stored in a state (current bpc, format, RGB range selection,
> etc.).
>
> The initial implementation was relying on some generic subclass of
> drm_connector to address HDMI connectors, with a bunch of helpers that
> will take care of all the "HDMI Spec" related code. Scrambler setup is
> missing at the moment but can easily be plugged in.
>
> The feedback was that creating a connector subclass like was done for
> writeback would prevent the adoption of those helpers since it couldn't
> be used in all situations (like when the connector driver can implement
> multiple output) and required more churn to cast between the
> drm_connector and its subclass. The decision was thus to provide a set
> of helper and to store the required variables in drm_connector and
> drm_connector_state. This what has been implemented now.
>
> Hans Verkuil also expressed interest in implementing a mechanism in v4l2
> to retrieve infoframes from HDMI receiver and implementing a tool to
> decode (and eventually check) infoframes. His current work on
> edid-decode to enable that based on that series can be found here:
> https://git.linuxtv.org/hverkuil/edid-decode.git/log/?h=hverkuil
>
> And some more context here:
> https://lore.kernel.org/dri-devel/50db7366-cd3d-4675-aaad-b857202234de@xs4all.nl/
>
> This series thus leverages the infoframe generation code to expose it
> through debugfs.

[...]

>
> Let me know what you think,
> Maxime

The overall idea looks great. I've started checking how I can use that
for our msm devices family, which makes use of bridges and
drm_bridge_connector.
My current idea is to extend the drm_bridge_funcs with the new
callback to be called once the drm_connector has been instantiated.
This way all the bridges can influence new connector.
Another possibility is to follow drm_bridge_connector design closely
and let it call into drm_connector_hdmi code if it detects that the
last bridge is the HDMI one.
WDYT?

Some context, older MSM devices have an on-die HDMI encoder,
implemented as drm_bridge at drivers/gpu/drm/msm/hdmi. Newer
generation of devices has dropped the on-die HDMI implementation in
favour of using external DSI-to-HDMI bridges, like Lontium LT9611 or
LT9611UXC. I'm looking at enabling new HDMI infrastructure for both
cases.

-- 
With best wishes
Dmitry

