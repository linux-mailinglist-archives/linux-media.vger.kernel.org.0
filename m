Return-Path: <linux-media+bounces-19432-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8D899A630
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 16:21:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08FB32858BD
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 14:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95203219CB3;
	Fri, 11 Oct 2024 14:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MRac+aNI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0874219C94;
	Fri, 11 Oct 2024 14:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728656490; cv=none; b=LF56xnzuMN2Oo6/2G42iimYr7D+0JJuCIau4SwDylKb750v1/WA00gWGRongXRJmDmFsxpzHTu5nvUUgKzz1UJobiNti7JaY5BIDnXIO3npoB3ngAMVqoBiN0Oz4ALDGRRGyoGPvvsyMr0TFGADV2NVmjblUnGIwOdkEtYk9cfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728656490; c=relaxed/simple;
	bh=37MtFp99OIt7vNoiuAnY53uiK3IjAbyhbAdFTFwG0U0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I2sNXOpxnE2SK7Z/s2VYuQTpekyQvb07Idie86wcQz2EwWOUswMzbxHCQDsPk3tAK1f1m/wLr/GG+H6+yL4Hty94lM08vbkBxLj93CFD5Kc4hdeIGrM81yINDgZldogM+3iqUMpG2oBdncxC60tInEM9gOFmJrnUSub/6KZXeoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MRac+aNI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A80F7C4CEC3;
	Fri, 11 Oct 2024 14:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728656490;
	bh=37MtFp99OIt7vNoiuAnY53uiK3IjAbyhbAdFTFwG0U0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MRac+aNIsKGINHCEeI6SJEZL8ZPvfU5wjYFMaO040rmiup8j5b9pcSPmEjmqsKfY8
	 WUrLgUl/RRX+FRwGSIUrOxA1apLvqpF6gFe7xn7msby+rkRQch57IEQ2v1vWv88T1Q
	 HIgWKhR89/r4JM1GtuGXxLvOS7JunYJpsuVPhew/qEhgv+9iR5WY1UqVkThxZPXh71
	 JLjtPqjqdtUgmRGyLgjk3I8aiMNoFLqR0RrerZDAif23yjg1zVIeeAe2xo+v3NOuGs
	 62jGt4dPH2sjJVnJk9rQNdY0BD9AiTWEqr7EVLBa3QIkbi0g8nTfSvseBtlC1x9JJi
	 bpkDQIfGgkb0Q==
Date: Fri, 11 Oct 2024 16:21:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jason Chen <jason.z.chen@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 2/4] media: dt-bindings: Add OmniVision OV08X40
Message-ID: <4plzz64zfeozca7prwgffvsx62eh4ez5g3eo4hdp3wq65d6ibu@qxmt2hmvewcp>
References: <20241010-b4-master-24-11-25-ov08x40-v6-0-cf966e34e685@linaro.org>
 <20241010-b4-master-24-11-25-ov08x40-v6-2-cf966e34e685@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241010-b4-master-24-11-25-ov08x40-v6-2-cf966e34e685@linaro.org>

On Thu, Oct 10, 2024 at 01:33:18PM +0100, Bryan O'Donoghue wrote:
> Add bindings for the already upstream OV08X40 to enable usage of this
> sensor on DTS based systems.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/media/i2c/ovti,ov08x40.yaml           | 120 +++++++++++++++++++++
>  1 file changed, 120 insertions(+)

I found the reason in cover letter.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


