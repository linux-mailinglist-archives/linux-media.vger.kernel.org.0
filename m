Return-Path: <linux-media+bounces-37941-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F698B084E5
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 08:30:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A00861AA32A8
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 06:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B915212B0C;
	Thu, 17 Jul 2025 06:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OtPYixMB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F67533E7;
	Thu, 17 Jul 2025 06:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752733834; cv=none; b=ff25gkwOWf/57fHlAdOMQ77fNMkGNGNPdRjcZmLijNYNyKSdtdnvyw4/wzDG7InDmdDHsM5bIsTxXd5oTEwpM5woY//aHARIdyTb0Y/IR2BJLt9fEBtTmEDs3mZRNO3v00xab8ictuEjs6Z7OxFtvTEsfUyzmnOhs3k8hxr7iBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752733834; c=relaxed/simple;
	bh=/UOgIfX8s+HDhK/lguWYj+CNqGgLHRwUREX7P9Hf9/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ma54StOqxOoSed8/6F9QGi9ETKEBJpRQsdn99i0qp9mYTLpUaC/xW7pnq9JwPtLNaMvKMg0qP/m6zP+ZjZlkDhHDodO7TvvIPW4nT6cvwUXypE9X94QhW8T2450eAYRqK5zNKUtVgwjvYa7oRHnd3Me1Rc6IsruD9+pkTiu4dqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OtPYixMB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25B42C4CEE3;
	Thu, 17 Jul 2025 06:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752733833;
	bh=/UOgIfX8s+HDhK/lguWYj+CNqGgLHRwUREX7P9Hf9/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OtPYixMBD232cAbI8y/08GV7LxxSItQjkc2nGCrPbWZDbQGVgAEa3AjYKHr9a3N/B
	 NQCNvAcABgeqlbc95MK0C4rBIb0edyQ5u/pFVjYe1/cHgteBrqBpz7DD6iJVqQrlcW
	 ljRV6MNCe2OKnZLvypq2ue3zeBIKd6cdyc3AqSw6aWvhVquicQuhcDOeO/0V5gNLof
	 WE8KLWt2thQUU863zMdB8j+GHOEFOJ/tyhOWunD0/5dwraRq3ZaREmj5il2GyQ6Xyc
	 duvxohgVw9p2FZ78HzrQDHQBgEAWVLp3CNO2W0sF5YpntLzoQXFaEvnaiXwveq2sJe
	 ntfisS1qDvS6Q==
Date: Thu, 17 Jul 2025 08:30:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com, 
	laurent.pinchart@ideasonboard.com, krzk+dt@kernel.org, 
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Ricardo Ribalda <ribalda@chromium.org>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Matthias Fend <matthias.fend@emfend.at>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Jingjing Xiong <jingjing.xiong@intel.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Dongcheng Yan <dongcheng.yan@intel.com>, 
	Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: media: i2c: Add ov2735 sensor
Message-ID: <20250717-hulking-earthworm-of-atheism-68a02c@kuoka>
References: <20250716134426.8348-1-hardevsinh.palaniya@siliconsignals.io>
 <20250716134426.8348-2-hardevsinh.palaniya@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250716134426.8348-2-hardevsinh.palaniya@siliconsignals.io>

On Wed, Jul 16, 2025 at 07:14:16PM +0530, Hardevsinh Palaniya wrote:
> +        properties:
> +          data-lanes:
> +            items:
> +              - const: 1
> +              - const: 2
> +          link-frequencies: true

Drop

I don't understand why this appeared. I don't think anyone asked for it?

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


