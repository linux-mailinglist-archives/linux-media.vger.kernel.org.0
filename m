Return-Path: <linux-media+bounces-42625-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C36B59AEB
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 16:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A77D1B21445
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 14:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80ADB34DCF2;
	Tue, 16 Sep 2025 14:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UE5/zGQT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CF01F5434;
	Tue, 16 Sep 2025 14:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034347; cv=none; b=kJykvgnQ6+vXZliniCJGvnw7oNHhkrLlAjmuFiZe3rUew+gjtbnqNIj3YbU1QybyA4W++5BkjF5Qc2g5T6PHRFpexpBinaxTiFcio7dR3zsEqvCEDg1bKYi+6RzHZTFJM7ggzCifSoqBXZQ6hQsknni1zy/QndVBQ/tYpxoFl+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034347; c=relaxed/simple;
	bh=iedr2VF4WgKF4s8fT143kxHZWTFhY70Xv/8PokaAkjM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fc3uEfQVYmYipoJoSgwt25C7h7T9mtrbRz/R1kv1gYiyDbuwN7g3sR9SllYqi91RWO36peslBPKD7Tu/TK0yUFTkjjiegSAdwjvsCqGAs3EX+nHLX89kQUDdKjFQMDuLReujpvdSsE4CezjiU9EkrokPcuD6roIHWVTU15QUpHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UE5/zGQT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2C6C4CEEB;
	Tue, 16 Sep 2025 14:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758034347;
	bh=iedr2VF4WgKF4s8fT143kxHZWTFhY70Xv/8PokaAkjM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UE5/zGQTZZmVI3HZg0CHcKyR+srReuHLDD5D/r9xJkSt6uFbDSYCrAlhdX7e4/kFF
	 1MNH/L2NlS8UlbS/YpPkGEskH6oUuIny12R1KJRjHHoOXkTbGxUyvixkIRZWz5zIPc
	 uCYiT7+30nu1m8ReixOEERloAY66tL4klRtg3M6bE7Uc2mWMxkYUdlGxOTgs+rs+f1
	 nmZVI5ak/PXPNzpG2dHbnSEZomIvu2C4BbBMIfSQIiKgDhJZC4MhxLUXEfjFY8SMFO
	 cJDA2MgoQ5XdWumJGwW8x2flHhN5pgI63KlSLPQhUGNXeTpA1fp44InrIm/RqWbsng
	 oBXOJJRvZKwNQ==
From: Lee Jones <lee@kernel.org>
To: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, 
 Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 threeway@gmail.com, Andy Shevchenko <andy.shevchenko@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
In-Reply-To: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
References: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
Subject: Re: (subset) [PATCH v5 0/4] leds: privacy-led support for
 devicetree
Message-Id: <175803434216.3847280.5284437769175227452.b4-ty@kernel.org>
Date: Tue, 16 Sep 2025 15:52:22 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

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

[1/4] dt-bindings: leds: add generic LED consumer documentation
      commit: 3f5df63955756fbe253a2a26043accf7318fa53a
[2/4] dt-bindings: leds: commonize leds property
      commit: 22420da3662a69d8894ee624494213a5888a1e87
[3/4] leds: led-class: Add devicetree support to led_get()
      commit: 7010cc08a6fd4ae4e68b05ec4f52c36cc0122f4c

--
Lee Jones [李琼斯]


