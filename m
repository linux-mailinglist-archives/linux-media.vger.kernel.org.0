Return-Path: <linux-media+bounces-46025-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2F9C21254
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 17:24:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8FBE1A238FC
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 16:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F5A366FD9;
	Thu, 30 Oct 2025 16:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sM2BrH/9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FFD279329;
	Thu, 30 Oct 2025 16:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761841360; cv=none; b=ZVVJlPZh9fu1tgJVfBtP1chR/ybbPfvIu5XLhwDSB2qzVGA1pMePN16TSDo3SfsUj7tNQHSZemkcop2Pl7ABdcsQJv8dNXrFd5d9MNXgCzukgYxyzrj4Chg/JriloillZfgFQZnkEyOhQRHwolqMTtGSkA5D/2TgzfNORiPhDH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761841360; c=relaxed/simple;
	bh=qeejJw/Ci04guqvtvub4+S+ZoFbZ8/admEO2nb7xcKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M5dwTqbHn7hlSu6Eh69d9E/g085RBjCNOU12jJ0+MJj0sc6/XANkrfKSvLFwbjt4KN07xkzJ+9c1D2FuszO1AdoZSmuTMK3YvKtP3seib+iemmxc7vr2pELm4rX5dPos4+zjKAojPB/PZQkb+qaRUVuC3Va+M4ugweT3PqxA8ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sM2BrH/9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D9C5C4CEF1;
	Thu, 30 Oct 2025 16:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761841359;
	bh=qeejJw/Ci04guqvtvub4+S+ZoFbZ8/admEO2nb7xcKk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sM2BrH/9fLau66Kv3195fiOQB6MxtyPXRXtOIYVMdU5A17KL7QC2Qai+2RmKFruY/
	 uTxFhGlUjTeb7BdmOXNCSNp9kWr7zSRhWCbaRPS008DM8bOn8Za3RY6SbVy5EAlYXo
	 NHFmhjj4Wnxex9UrXdb7nEma4PZD9b2kNGKvqUITnEp5ODjFDs3Pb0AQHXbeKZLZds
	 /Y9UaXi51BAeTwg93p/Q1UJQZ3YdLY6yHAduDN2woYqCSIY6v0ABaXPu9cSDqw7Z2E
	 VnlNC1IvIV20+NKAkAo/2CVcajJ5k02bGlPpLU8Ss/jKqZvwMywdaosN1nNbFViAk9
	 xgX2bZxesoVqg==
From: Bjorn Andersson <andersson@kernel.org>
To: Hans de Goede <hansg@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	threeway@gmail.com,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: (subset) [PATCH v5 0/4] leds: privacy-led support for devicetree
Date: Thu, 30 Oct 2025 11:25:33 -0500
Message-ID: <176184154198.475875.6266114626536757346.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
References: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 10 Sep 2025 14:01:07 +0200, Aleksandrs Vinarskis wrote:
> Re-spin of RFC patch from ~2.5 years ago [1]. v4l2 controls for privacy
> LEDs has landed, but the DT part was left out. Introduce missing
> dt-bindings, and commonize 'leds' parameter. Finally, add a patch to
> enable privacy-led on Lenovo Thinkpad x13s.
> 
> With recent inflow of arm64-power laptops (Snapdragon X1E/X1P) which
> mostly use MIPI cameras, this feature becomes more desired. Original
> rebased patch is still working as expected (with respective DT changes)
> on Dell XPS 9345.
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: qcom: sc8280xp-x13s: enable camera privacy indicator
      commit: b54c412b511c8bc8e71fd09a766bd95528d94840

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

