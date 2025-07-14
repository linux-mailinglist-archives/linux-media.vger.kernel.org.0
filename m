Return-Path: <linux-media+bounces-37590-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B74B0374D
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 08:41:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60DC01770EB
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 06:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 557FD228CB8;
	Mon, 14 Jul 2025 06:41:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33C534CF9;
	Mon, 14 Jul 2025 06:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752475270; cv=none; b=Bq5RulJbYXUO7Eg19MM6KKV8QKcakckFdKK2uUPrWrFAMK3uGIwAVfzU8jJVzyEeWtNrHmPcY3+ZlwofAJ37xaYbDt/RKUKiebj/ENxi9Aehn3pyEx0UW/5PcCNodd/3eEtNjpvyb1vV3a2ecVvCGOdm4vU0IbFE8aLOQsfsAdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752475270; c=relaxed/simple;
	bh=5ATHMX9AThV1+HT52RPqloerGobaOpiT9IMioipvwzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YGUjcoBBMe4ujOZoj/U/Bu/SK0g5bB0mWO33YUXEGWN2sRSTQPS43EudvOFOL/Y9DwnYUHZd4K+L6T4ZttHnznTAIRbr8UcHE+b1R/9g9xBs1bPV4TV/9vUxwWYoauVg8zXuw0AKwEjqJuHw5SweKwq2cZqzEgg+I0hgxPTQfJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECBF2C4CEED;
	Mon, 14 Jul 2025 06:41:09 +0000 (UTC)
Date: Mon, 14 Jul 2025 08:41:06 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v7 01/15] dt-bindings: media: qcom,x1e80100-camss: Assign
 correct main register bank to first address
Message-ID: <20250714-overjoyed-celadon-crocodile-4bec3a@krzk-bin>
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
 <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-1-0bc5da82f526@linaro.org>
 <f4fd544b-bd5e-49eb-83d9-290f77e503ef@linaro.org>
 <6ca1b24b-5f9d-48e7-9afd-7dac47b486b1@linaro.org>
 <03ba99cb-18ef-48eb-9504-cbce752c85fd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <03ba99cb-18ef-48eb-9504-cbce752c85fd@linaro.org>

On Sun, Jul 13, 2025 at 11:34:18AM +0200, Krzysztof Kozlowski wrote:
> On 13/07/2025 11:12, Bryan O'Donoghue wrote:
> > On 13/07/2025 09:15, Krzysztof Kozlowski wrote:
> >> On 11/07/2025 14:57, Bryan O'Donoghue wrote:
> >>> The first register bank should be the 'main' register bank, in this case
> >>> the CSID wrapper register is responsible for muxing PHY/TPG inputs directly
> >>> to CSID or to other blocks such as the Sensor Front End.
> >>>
> >>> commit f4792eeaa971 ("dt-bindings: media: qcom,x1e80100-camss: Fix isp unit address")
> >>
> >> I have next from few days ago and I don't have this commit.
> > 
> > https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/1da245b6b73436be0d9936bb472f8a55900193cb
> > 
> >>> assigned the address to the first register bank "csid0" whereas what we
> >>> should have done is retained the unit address and moved csid_wrapper to be
> >>> the first listed bank.
> >>
> >> This is confusing. Did that commit change entries in the binding?
> > Fixed the unit address.
> > 
> > What we _should_ have done is put csid_wrapper as the first entry.
> 
> That's different problem then. The commit fixed only DTC warning and it
> was perfectly fine from that point of view. I would not refer it,
> because it just makes impression that commit was not correct or even
> complete.

BTW, you have here also checkpatch warnings.

Best regards,
Krzysztof


