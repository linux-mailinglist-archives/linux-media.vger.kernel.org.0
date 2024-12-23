Return-Path: <linux-media+bounces-23999-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1853A9FAD26
	for <lists+linux-media@lfdr.de>; Mon, 23 Dec 2024 11:31:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B892F162F5A
	for <lists+linux-media@lfdr.de>; Mon, 23 Dec 2024 10:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50FE6199956;
	Mon, 23 Dec 2024 10:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S3FeDK4+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E614198A34;
	Mon, 23 Dec 2024 10:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734949835; cv=none; b=Ou9yBHrqViXbaziUisktAeZL5nQTUFQuZSaL2sOpvcDUCLx1WD3PCFLXM+e4XPmKuLzfTp4++KUvq9LVbGSklGYzAx+5ERCrePoUQVJ5orSe0dylOU0t4GuiQUbR9SCnvaYtlyqiSKwMkChsVKxQE5FgkXNYZmDfaoX+IHxVdjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734949835; c=relaxed/simple;
	bh=hKGJ7WK7Gu3bIdfY90AYO0AyOpIUidEhTmnkKyIOL4k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o8yKJIk/9wZfkVf6xLhe5tuGXiDGywLZk2eTRc4RReG4HCng4PfqIe/ETXs9hAwaWz5icO7P07E1E7aNJWkgQccdxtDR0Ta5b/pr+qGCE0sDQWDgAV0fUYluVPzI+HdRKiOrNHmrTVFHR5SPw67W6C2rmcH+POaM3m5znhxlXio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S3FeDK4+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F8CC4CEE0;
	Mon, 23 Dec 2024 10:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734949835;
	bh=hKGJ7WK7Gu3bIdfY90AYO0AyOpIUidEhTmnkKyIOL4k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=S3FeDK4+ha8SgS/NON6h90GCcIxLKIUxfv3A3bYj05jPQnhgyZjSj20JiM+dAzxcd
	 6FugZa1BAvrEIU6/NmoPMNG+kdW40fIRBAk4ZTkkF/Gq0ONQNczx85NAevcbf8Ho1L
	 g/DCzOKuIGeiqmZMasN+7mwebg8XH4QDHmO/v6Rh5ZmYPMxfkXwd2pRLkdt19isTKs
	 yZewWBdflHPD/nsakZJEn7UfQ8+T9y6J5CHYqoggWz+fmS5RRkT/YdTnWL6qkLa2QA
	 /6ins6zQVSUkeixMmlxFU4SwAFrQOqDS5SVcBP/1+AHHVZTh/VSHxzXlo91vi+yotA
	 eIGHCbwIlB4JQ==
Date: Mon, 23 Dec 2024 11:30:27 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Rob Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Hans Verkuil <hverkuil@xs4all.nl>, Bryan
 O'Donoghue <bryan.odonoghue@linaro.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5p?=
 =?UTF-8?B?Zw==?= <u.kleine-koenig@baylibre.com>, Jianhua Lu
 <lujianhua000@gmail.com>, "Stefan Schmidt" <stefan.schmidt@linaro.org>,
 <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 27/28] media: iris: enable video driver probe of
 SM8250 SoC
Message-ID: <20241223113027.21b8f7ab@foz.lan>
In-Reply-To: <20241212-qcom-video-iris-v9-27-e8c2c6bd4041@quicinc.com>
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
	<20241212-qcom-video-iris-v9-27-e8c2c6bd4041@quicinc.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 12 Dec 2024 17:21:49 +0530
Dikshita Agarwal <quic_dikshita@quicinc.com> escreveu:

> +	.dma_mask = GENMASK(31, 29) - 1,

Setting a mask to GENMASK() - 1 sounds weird. Is it really what you want?
I so, why?

Thanks,
Mauro

