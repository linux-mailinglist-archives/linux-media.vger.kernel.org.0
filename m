Return-Path: <linux-media+bounces-28179-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C20A60A68
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 08:52:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1D41189F9B9
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 07:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E98191F66;
	Fri, 14 Mar 2025 07:51:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F38318A922;
	Fri, 14 Mar 2025 07:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741938670; cv=none; b=CC6PF2oYZht8PxVOmVuWit5IKW3CE9Nsvtrpcu9un7qVLVE10JdtWp9o8rCvrVkHYIyyZfXgjmEysQYCJ+OXWs/Lh2Aoysby6DbCm6EnRoWxTOKYxu3UX7q/B3QrC2mpqOr+Hc71hgDnUls8fOv8aKPJ6JGFrKu51cvncnCKjIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741938670; c=relaxed/simple;
	bh=Y8C6RSANjKS2P7t6lIYVSyiJiSl4wrq1aP7pwcralIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZIY0xHKbG6g+jefoHb/FBVChY2ovqHUQNYYsOjeXVwaaavDfRioDnGzUKdahyPeDpE/e/GWBX7jMG99sIlnZZFXS1CeXMzHwCKCg/jRP5oF3u+UNQFs2lbu0n3YM+JlM6N05h1EVq/WMMUdwumM1A1eZHE+NmCv4p0FhneFtxaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 144BBC4CEE3;
	Fri, 14 Mar 2025 07:51:08 +0000 (UTC)
Date: Fri, 14 Mar 2025 08:51:06 +0100
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
Subject: Re: [PATCH v5 1/5] dt-bindings: clock: qcom,x1e80100-camcc: Fix the
 list of required-opps
Message-ID: <20250314-nimble-exuberant-ermine-8ceb43@krzk-bin>
References: <20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-0-846c9a6493a8@linaro.org>
 <20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-1-846c9a6493a8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-1-846c9a6493a8@linaro.org>

On Thu, Mar 13, 2025 at 09:43:13PM +0000, Bryan O'Donoghue wrote:
> From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> The switch to multiple power domains implies that the required-opps
> property shall be updated accordingly, a record in one property
> corresponds to a record in another one.
> 
> Fixes: 7ec95ff9abf4 ("dt-bindings: clock: move qcom,x1e80100-camcc to its own file")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

I do not see improvements:

https://lore.kernel.org/all/20250305-little-frigatebird-of-calibration-244f79@krzk-bin/

I expect both comments to be addressed in the file.

Best regards,
Krzysztof


