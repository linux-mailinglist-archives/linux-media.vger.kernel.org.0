Return-Path: <linux-media+bounces-23540-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 545729F4375
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 07:21:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 75EEC7A2AEF
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 06:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751EC15CD52;
	Tue, 17 Dec 2024 06:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qSOewmBl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D148BF8;
	Tue, 17 Dec 2024 06:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734416470; cv=none; b=gEnqAkkGW+Gd8nJMaXba7RVEJi6VIFdHDzPszIOdonxnzAeAqEeG/jiAsQygILUmUxIDmM+bqMvABTwFiWZbbrkL1c5w6TppihG3fF3CkVgON/5S3DxY5J7IoxGr8meBjFE/uQskU8pED2TuD51gG7iJTK6pAy/T8DjDnWAEkXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734416470; c=relaxed/simple;
	bh=/RJNh8rOvfKE1G2/kVcw2UaL4mMQRBTB4or30Sm+lb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TYuvISZkOaoBppsAzW0xs7U0gz3mV5YHoD+IOrWTRjmEcqjrMsfhg0gZ8tKJkXAlhfI9+vWOX0M9rciWfYRaCgfo0zZFEqr1DbPCCGr8GR1mMQCIR6Tlpyl79Wli4IRFjYafr6Xo8n5Ga7+beCLAxGYB6Gfp7wio2V3pRBS2du0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qSOewmBl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC960C4CED3;
	Tue, 17 Dec 2024 06:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734416470;
	bh=/RJNh8rOvfKE1G2/kVcw2UaL4mMQRBTB4or30Sm+lb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qSOewmBlY7dmrGm/03ec6+9tn/G14ZAAj7JBOKdtRZGooNY3IYXmWm/ojEvF3Btmu
	 Cv2j5mTjnIjK/BLNuEcjharW4vkYuWcL93OtiaqfLDhco0+6aRWY/pj1wjNOCT9Rik
	 Nj032nF6axSD+Pe4wTwg9DsCXMwQNmDoUEPm+hsYfxUrSsL2nmSV/kbDXh666dXbXx
	 e1MknmYaD09Ju5hGZo7bNBDCsA8INRX7kc9EyzMFrVMAE2hZTTE0CuN1G0BNEnL1sH
	 uvsnpPTLn7Gna5ikSTm1wDbju7vv7WwvdSUFK7SMRVMpGfX34qMTqKhXNQVwRL81pA
	 rSiuFR/7OA1dg==
Date: Tue, 17 Dec 2024 07:21:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v8 3/5] media: qcom: camss: add support for SDM670 camss
Message-ID: <srhejepgg6b43im4laxurflipygrd4dthgskrkygqd3dzyknmj@babtxu5hh6kh>
References: <20241216223019.70155-8-mailingradian@gmail.com>
 <20241216223019.70155-11-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241216223019.70155-11-mailingradian@gmail.com>

On Mon, Dec 16, 2024 at 05:30:24PM -0500, Richard Acayan wrote:
> The camera subsystem for the SDM670 the same as on SDM845 except with
> 3 CSIPHY ports instead of 4. Add support for the SDM670 camera
> subsystem.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  .../bindings/media/qcom,sdm670-camss.yaml     |  72 +++----
>  drivers/media/platform/qcom/camss/camss.c     | 191 ++++++++++++++++++

You cannot combine such changes. Bindings are always separate.

Please run scripts/checkpatch.pl and fix reported warnings. Then please
run 'scripts/checkpatch.pl --strict' and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.

Please drop the review/ack tags and request re-review for this patch.

Best regards,
Krzysztof


