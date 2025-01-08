Return-Path: <linux-media+bounces-24375-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA95A05274
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 05:58:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86A4216199A
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 04:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F256F1A0BE0;
	Wed,  8 Jan 2025 04:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f577Q+V2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F5D19CC31;
	Wed,  8 Jan 2025 04:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736312323; cv=none; b=go2d0a8fwL1gTXaJyWR3mhmpuZd4IRmz99KTNo87J7w1R11n4S1ElFiGYNVgXjjKFY0jC0+d4YNyFUvpUJ7inE4+BI2A3MIaRH45i7xLo0bEe8YJrTWyAUvc4+7EeZyhLj6woJj2ULKn2p9eqBvK1Q75eU9Lyji6zmj1gGIV8Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736312323; c=relaxed/simple;
	bh=jFYufPeryoQ9CFNlxOJcCOFvHCEYh8iCaszhrUU8DY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EAXusZYqCREyWdoK0gTZMwpXWhRDRtZulzySq6p/K8RF6AXqrl+G0UtxkiaPqExVFVgh3HXdyZrTfdiVT30ixqpQSMmy4ILmatFzVE6JHAGrTU7K3MhkszALIhy/YggeJMpR/tOyv/gLVM1Vflsu4cviDjwDZxCM4yAlrEpmyjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f577Q+V2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6217C4CED0;
	Wed,  8 Jan 2025 04:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736312322;
	bh=jFYufPeryoQ9CFNlxOJcCOFvHCEYh8iCaszhrUU8DY4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f577Q+V2rTiMtbmsts7AD1fHodOj7zM2txr2Vcq7+rglUDHgMvT+xIin0XpVNBICw
	 zHGRjWn+hqku0E+fB5KwVNj5hOMOmHTflzdP4XfnWox0g0zhMwJ5vlvFSDD4j2L8K9
	 cOoQga12uc1bcrrwb9fz6YT2/8DwGgx76ab+3746Qjuca7Ll/QSo+XZyp35T5bHv8D
	 mit1Zy5mS8KAnME0Mhhg52KZu2/yo1Gdf9KDTMwBpWaj6lAQB8rLY11Rq8e8MrDYv9
	 FWcy+x2i70hU6NBmV94/sa012ygvcfjnj+2agwc3/TaZv1LB4TFv8ciM4bQ5vbjQgt
	 6lB8h+GR6in5w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/6] dt-bindings: media: camss: Fix interrupt types
Date: Tue,  7 Jan 2025 22:58:40 -0600
Message-ID: <173631231619.115129.6056790573158063874.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241127122950.885982-1-vladimir.zapolskiy@linaro.org>
References: <20241127122950.885982-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 27 Nov 2024 14:29:44 +0200, Vladimir Zapolskiy wrote:
> It was discovered that on a few Qualcomm platforms types of interrupts
> do not match the type given by the Qualcomm IP catalog, the type in
> downstream code and the type requested by the CAMSS driver itself.
> 
> The mismatched interrupt type between firmware and the correspondent CAMSS
> driver leads to known problems, similar to the ones which were discussed
> previously:
> 
> [...]

Applied, thanks!

[4/6] arm64: dts: qcom: sc8280xp: Fix interrupt type of camss interrupts
      commit: b08535cd41c27b4f32319b5bff754c9da6dc2205
[5/6] arm64: dts: qcom: sdm845: Fix interrupt types of camss interrupts
      commit: cb96722b728e81ad97f5b5b20dea64cd294a5452
[6/6] arm64: dts: qcom: sm8250: Fix interrupt types of camss interrupts
      commit: 6c7bba42ebc3da56e64d4aec4c4a31dd454e05fd

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

