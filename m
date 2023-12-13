Return-Path: <linux-media+bounces-2368-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7767811615
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 16:22:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 681901F2189D
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 15:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579A831596;
	Wed, 13 Dec 2023 15:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fNrPOmca"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980D79468;
	Wed, 13 Dec 2023 15:22:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8C93C433C7;
	Wed, 13 Dec 2023 15:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702480955;
	bh=tf/O8dGetCNcpoy6MZUH2WfyxvXI3zJrSEHCm5FUzJ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fNrPOmca6s3S/ZPvqGYwmmGm4U8Nux2est+54hkCERW/9/h6pAIACO4u6ENd52nTP
	 EzwruVq8O270QaA6xO+4M1jqR7JOygVP/qryhESjvj3bZC0IsQkf/aOzVantjhURS1
	 IC+VRRLEolr7n6scU0vjCCr1HaKCECn4b6yEwVexHKV8/BU1Q+T5FIlHvT3G3mK7WQ
	 cPbb114J80/xlnGDBNqk9P/hPTkncp3zlbGBxVT7iIfDaYqChaTdnomlhP8DSzq56a
	 682Ysi6huUkV6dFXXafuGxIwf4WFBw5G/b/3U78HTGnz3fJ4Aa5R0GvziJYQl4m6We
	 8OcivlPMheioQ==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20231207-kms-hdmi-connector-state-v5-18-6538e19d634d@kernel.org>
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
 <20231207-kms-hdmi-connector-state-v5-18-6538e19d634d@kernel.org>
Subject: Re: (subset) [PATCH v5 18/44] drm/vc4: hdmi: Create destroy state
 implementation
Message-Id: <170248095242.191897.1505855856456253349.b4-ty@kernel.org>
Date: Wed, 13 Dec 2023 16:22:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3

On Thu, 07 Dec 2023 16:49:41 +0100, Maxime Ripard wrote:
> Even though we were rolling our own custom state for the vc4 HDMI
> controller driver, we were still using the generic helper to destroy
> that state.
> 
> It was mostly working since the underlying state is the first member of
> our state so the pointers are probably equal in all relevant cases, but
> it's still fragile so let's fix this properly.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime


