Return-Path: <linux-media+bounces-49414-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C3402CD9737
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 14:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98911301B114
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 13:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F104F340A7A;
	Tue, 23 Dec 2025 13:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k2Abtpno"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9A41F3BA4;
	Tue, 23 Dec 2025 13:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766496924; cv=none; b=G4l7tFcWHP9Q9b+eq0iQJN9Qi990E5RkMLxR9tUwjnF6+A29u4tjhJ0SouHhFgJYRblYF0V4AC34l1JZ4O7TDZlvEbMR676JRLeZ2xT403VAGp8RxWeXt5X24kObtT4IDgDmDYr/ZlRP9u4gjdyheU/9Yq8fbi6XwKHowRTm8fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766496924; c=relaxed/simple;
	bh=pEC+fqxhzWlLt/0FdTPSv6ryY8KxshU87SlXn1Sq1Ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1fsUTVNzSD5KoAzOpeJSs/0QpmjpqVYJgyijmcnw+QLkMFa1Yd8M8DAaLb6GgirlLE5+/TJc3eZ6QRiHq7wYZFRaAnO+1WneF6BqbkwheFxC/Pw/hl6qAaiGqWNBWNVysBDyYC4TrLokCV4NCMLnkTj57Cu+h7wCgXGPDeQfX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k2Abtpno; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04566C113D0;
	Tue, 23 Dec 2025 13:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766496923;
	bh=pEC+fqxhzWlLt/0FdTPSv6ryY8KxshU87SlXn1Sq1Ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k2AbtpnoSwypkZKQX/7JQVRuw57NURAgGBtvF3rqpGhv3T9qlzng4zMDkX3fC6sdr
	 tcs4BFpJeGohs874TrKvUzKe6MIhI9XRjwfLgv0i2yfsJOxxEkINyvJKyeC/hgVatz
	 ZeBheQ+H9uP4ouEpV/tOI4kivaSQPbreGPjKR8BiXhv2K+hXHa04V2gx4n5IMhEW55
	 bLRlpEB15zzOK4/5ocL7xfI+FfA2uogpcGGST1UXkYWZr9jU6ljiDySA3hsCupTc9w
	 ofipdwVSC7+ZAVVx9T9X8/4eDRUBHHU2iPvGZQap48wVTCWWn5piqH5aRL2OLgSdTt
	 2mIPmgBHjLHGQ==
Date: Tue, 23 Dec 2025 14:35:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] media: qcom: camss: Add sm6150 camss support
Message-ID: <20251223-cheerful-beetle-from-wonderland-c5334a@quoll>
References: <20251222-sm6150-camss-v2-0-df8469a8343a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251222-sm6150-camss-v2-0-df8469a8343a@oss.qualcomm.com>

On Mon, Dec 22, 2025 at 04:28:38PM +0800, Wenmeng Liu wrote:
> SM6150 is a Qualcomm flagship SoC. This series adds support to
> the CSIPHY, CSID, VFE/RDI interfaces in SM6150.
> 
> The SM6150 platform provides:
>  - 2 x VFE (version 170), each with 3 RDI
>  - 1 x VFE Lite (version 170), each with 4 RDI
>  - 2 x CSID (version 170)
>  - 1 x CSID Lite (version 170)
>  - 3 x CSIPHY (version 2.0.0)
>  - 1 x BPS (Bayer Processing Segment)
>  - 1 x ICP (Imaging Control Processor)
>  - 1 x IPE (Image Postprocessing Engine)
>  - 1 x JPEG Encoder/Decoder
>  - 1 x LRME (Low Resolution Motion Estimation)
> 
> Tested on Talos EVK board.
> 
> Tested with following commands:
> media-ctl -d /dev/media0 --reset
> media-ctl -d /dev/media0 -V '"imx577 9-001a":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
> media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> yavta -B capture-mplane  -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0 --capture=5
> 
> Changes in v2:
> - Add more resources(BPS, ICP, IPE, JPEG, LRME) and details for CAMSS.
> - Correct the order of the header files. - bob
> - Add Csiphy id num, improve the resource name. - Vladimir
> - Link to v1:
>   https://lore.kernel.org/all/20251016-sm6150-camss-v1-0-e7f64ac32370@oss.qualcomm.com/

So no changes done in response to what I asked?

Best regards,
Krzysztof


