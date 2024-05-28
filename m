Return-Path: <linux-media+bounces-12068-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BBF8D1657
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 10:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A9931F22888
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 08:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6763713C83E;
	Tue, 28 May 2024 08:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxEuWFtV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B749871B4C;
	Tue, 28 May 2024 08:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716885301; cv=none; b=A/NC3phcN4D6Zye9KjPVbvTWaIzMSSzH4W0WkcUfDdy5416dfbIcukd3O8e4J067HOniOgouIuCWznTZaNTAkypapQYhi1cbsSMdLpqfhy/Z4WFzvfFNRyOVjV7Zly49N29vWnm7YSO0efrLpqtMDuf4tvTCLdykDXCrfrYiGsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716885301; c=relaxed/simple;
	bh=mjrj8Y6U0achW4zr5kCGXAf0WM06rRFoOQ1fH5Q2jWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g4eQT9GARpCjQX4LibUUR/7h//+NnHgiHU0dtti+SQMvKM0yteYzkyBh4j57grrdBJfSA3wDyDvdQP6O48MnvPkZn7dR1WjmBhT6EwJ3xwOTdfK7/eqgeSPbxDtX6E5mv+wVSYk6JSIhauV7gRmjzFbrzTrnhkKejTMhIvO9s/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dxEuWFtV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF87C3277B;
	Tue, 28 May 2024 08:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716885301;
	bh=mjrj8Y6U0achW4zr5kCGXAf0WM06rRFoOQ1fH5Q2jWg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dxEuWFtVj51/nmDcan82+Q/GlF29zGoAkcdnUKo6RKHYMkoiPRuZemCy52R+Dplz+
	 jnJxH28JcQmW+EcyZHFlMIKBcAUM9kmC+RBSNtin/dzPRP283vFQZGgV2akVs6/xOJ
	 /jtj4FIPOKrRXse/dnEKIq5DfrPO9sSF8kUBgOAfAt2PtrVuV2+g2Dy9lTIXFn5DK4
	 hzSH4bDeMYEKlRUjVemI8Y+q3/ZgV7teBVWe0WMW6FhatR2cQkHW/5S5RZkM/fwtvj
	 T6rx4zqTa+uo9gCxeAgkDz686lmdMHM/sNxRFS9zOBcGOdK/yXIq9DR/4uneXrj/be
	 IkI9FPpC0i+yQ==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maxime Ripard <mripard@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Sebastian Wick <sebastian.wick@redhat.com>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sui Jingfeng <sui.jingfeng@linux.dev>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Andy Yan <andyshrk@163.com>
Subject: Re: [PATCH v15 00/29] drm/connector: Create HDMI Connector infrastructure
Date: Tue, 28 May 2024 10:34:55 +0200
Message-ID: <171688520803.1994316.11229514011452981600.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
References: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 27 May 2024 15:57:49 +0200, Maxime Ripard wrote:
> Here's a series that creates some extra infrastructure specifically
> targeted at HDMI controllers.
> 
> The idea behind this series came from a recent discussion on IRC during
> which we discussed infoframes generation of i915 vs everything else.
> 
> Infoframes generation code still requires some decent boilerplate, with
> each driver doing some variation of it.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

