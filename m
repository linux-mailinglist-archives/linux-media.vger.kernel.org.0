Return-Path: <linux-media+bounces-30622-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 725BFA952BB
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 16:26:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A8057A8A80
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 14:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F29B19CC36;
	Mon, 21 Apr 2025 14:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NhJuhQp6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB8219AD86;
	Mon, 21 Apr 2025 14:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745245535; cv=none; b=MU1c1dLv5uqnFf1W5y94x/y3udpNOAK3HR8ct+nyfUrD6IKTfstjkv1TMzMXMj5MaSl8Nob2N+ZfLyCAbay8Qmcap8fo2BCI7v1qUWRpSYSojKtyCITHxe6TYz0ThgXzbcxjx7NeBmJM8qe/yJKSee/RzqA7LoTV1QnafyCxto4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745245535; c=relaxed/simple;
	bh=yFJQUNhGPQ4/Q6dDvGstjqTCnxg8gdsupNj52RxP51w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=otuYn0UkXnNCU4NDCU/fjB7ENQjUeefNng916MDqypNjj6G6UmFbEjw3C6sLTmH2UEE6PYXflEgPC33AepDCWjBIyFT6SAtjyvUNHDkqNk3XPQOrQXTPL/CY7TRadDx5bea0XeQm3zb3yqofszyU0abmNvvGawcQkZNiA0NibNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NhJuhQp6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DCD2C4CEEE;
	Mon, 21 Apr 2025 14:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745245535;
	bh=yFJQUNhGPQ4/Q6dDvGstjqTCnxg8gdsupNj52RxP51w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NhJuhQp6NBXZZKGrDi59Dr9q1BSLSm8YsEdep/ekcyMswyMh8sR2xE3t+9Ar4rewe
	 UpqpLc2wDeEHh4a9NYHWU+k0VXOzc5bGaDsQd4s7veYIiLD1wVr9gbAEcMKmMRkmOs
	 Y9volaHBUcZThC6TIEkOhf0Oqew0p04tJVM3//XTTvoMA6h+SfXnirjOckkat4tSbp
	 AZhXtfU5xfsr2ObShUC/a0TPW6GwhxAZ4YJMi8ixeCsyTliKDpMb7StlTqb5dQ5Gdq
	 HKyISnrWNP8U1wuc7B2ClzR4h+2YvnHePpID6sVtECYz0VKYjBuP/gdR6VaMC8nPwd
	 t4gkyUUIvk/rQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: (subset) [PATCH v10 0/3] Add SDM670 camera subsystem
Date: Mon, 21 Apr 2025 09:25:30 -0500
Message-ID: <174524552572.708487.16263119301727665583.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250205035013.206890-5-mailingradian@gmail.com>
References: <20250205035013.206890-5-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 04 Feb 2025 22:50:14 -0500, Richard Acayan wrote:
> This adds support for the camera subsystem on the Snapdragon 670.
> 
> Changes since v9 (20241218231729.270137-7-mailingradian@gmail.com):
> - add Reviewed-by from Bryan (2/3)
> - drop applied camcc patches (previously 1/5, 5/5)
> - rebase on media.git branch next and sdm670 dts patches
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: sdm670: add camss and cci
      commit: 441ef8588c4608d9742dc73f8ba2102c0db68a34

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

