Return-Path: <linux-media+bounces-28319-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF305A636B5
	for <lists+linux-media@lfdr.de>; Sun, 16 Mar 2025 18:12:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05FF8188FB0E
	for <lists+linux-media@lfdr.de>; Sun, 16 Mar 2025 17:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE3BE1DAC81;
	Sun, 16 Mar 2025 17:12:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6221F2AD02;
	Sun, 16 Mar 2025 17:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742145162; cv=none; b=iqoefsx5hC7x7eby64CQRie/6TTqtRdGMDeDAUq2d0Th/cuQLyg6j+rTxTGdI/JCv75CaMsOjlrOUHsBwwxyRs5p7AO8lHapYCtMJkDsucNHnsM20PSeHazAGOicJ/8tdHfQG4hjd9EOi1elg58bdsJZdRe/dYOSk8K+UoeuOLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742145162; c=relaxed/simple;
	bh=vKQLzrgpNSv2P0kbjJiXpY6KLGJYZqUtSuZD/PghHU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cw5byJpkYQCeijk9iTX2cn0L9+CbrXYM864Y5+uOMjmtz4Bg/8SYUXh4WhwgOAtTq4Vt4Rj2BNutTUMVL3pIaO1gPvcWzEIjQFkP58g8UdH9UHNSJrUWQWF8Pr4EWzBvkR0R/84K06AonkSw+zyqfGzZ+BZq9a32Kj0MQ5yVp4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06851C4CEDD;
	Sun, 16 Mar 2025 17:12:40 +0000 (UTC)
Date: Sun, 16 Mar 2025 18:12:37 +0100
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v6 1/5] dt-bindings: clock: qcom,x1e80100-camcc: Fix the
 list of required-opps
Message-ID: <20250316-carrot-skylark-of-priority-c59ed7@krzk-bin>
References: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
 <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-1-edcb2cfc3122@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-1-edcb2cfc3122@linaro.org>

On Fri, Mar 14, 2025 at 01:13:59PM +0000, Bryan O'Donoghue wrote:
> From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> The switch to multiple power domains implies that the required-opps
> property shall be updated accordingly, a record in one property
> corresponds to a record in another one.
> 
> [bod] Adding the opp to the yaml is not an ABI break since we currently
> have no upstream implementation of this yet.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


