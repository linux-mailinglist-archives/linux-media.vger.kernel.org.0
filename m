Return-Path: <linux-media+bounces-18656-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D6D987A53
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 23:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65FF51C227C9
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 21:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8331850A4;
	Thu, 26 Sep 2024 21:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HpTYMJ+1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05AE28371;
	Thu, 26 Sep 2024 21:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727384694; cv=none; b=XAFyB5efkgIKc6QSgAiQAASORQrF1tuhAb0YyHJbHhzyiNy7081WXAF4Rrw2Xsz12zHqJVoT3A4rwfGlj0nf8B/ejoAduaBbbX4S+Pz4d0tBv19+2PBMI0BtLFAqMMWpw2s7w1mnEeEV8ga/mNiRQslNCVLiFOD79hsTVmufs/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727384694; c=relaxed/simple;
	bh=YRej7A7yZeUKbpOWXMs3+vrczVPRhS3F2i9Vz3ZPNl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qKNRa7pcG9RpTfXsBxSXkZ92HJF2iZ+KIZFaJwSYZ/m2pe6J5V4421SFrSOkeR10BhnTmrE1g7UblXKRe8LRmTMSZwfDGDQ6WxfszVkvYiU6kyCJmckyg1i31fRgN32MLEKqAbouRRh3gcYeeB49Gn2rL8eVJww18v4yk8GC6pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HpTYMJ+1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB7CC4CEC5;
	Thu, 26 Sep 2024 21:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727384694;
	bh=YRej7A7yZeUKbpOWXMs3+vrczVPRhS3F2i9Vz3ZPNl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HpTYMJ+1qfzYDksvuch1xtDVEo6JnmnrKpKI+TS5U0F79c37P829KAtkVTTdwAp6a
	 vM/NaUYWVfqWNLAgNeqF1CjdgtIBRBr/70J66nUlv9ifEugHIf8jQTsz+kzZQ0pu4x
	 rZZJUK+KKCmjIJ/MjNmdptuOdGyyNLjVWteWKsauNm5dIFWbaqe1cFRABJUL1P3Xpn
	 525D1ZPM93W30/V+i1TPps5Dhbaps9aWsO1nrqguQr5D7AxYQD2HV00mJox2AdX0t2
	 R1TuQPUCKky3SFCfJM4aJgjG8SSd1eoGE3UxevQZQS7wkB0uIxDGL5CiNVjgtPv69O
	 RcyEtujeUt0uQ==
Date: Thu, 26 Sep 2024 16:04:51 -0500
From: Rob Herring <robh@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jason Chen <jason.z.chen@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] media: dt-bindings: Add OmniVision OV08X40
Message-ID: <20240926210451.GA2909078-robh@kernel.org>
References: <20240926-b4-master-24-11-25-ov08x40-v1-0-e4d5fbd3b58a@linaro.org>
 <20240926-b4-master-24-11-25-ov08x40-v1-2-e4d5fbd3b58a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926-b4-master-24-11-25-ov08x40-v1-2-e4d5fbd3b58a@linaro.org>

On Thu, Sep 26, 2024 at 04:46:38PM +0100, Bryan O'Donoghue wrote:
> Add bindings for the already upstream OV08X40 to enable usage of this
> sensor on dts based systems.

s/dts/DT/

> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/media/i2c/ovti,ov08x40.yaml           | 130 +++++++++++++++++++++
>  1 file changed, 130 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov08x40.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov08x40.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..250785f062d0146e8615d8f3e7700aebbd40b1dc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov08x40.yaml
> @@ -0,0 +1,130 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright (c) 2024 Linaro Ltd.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov08x40.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Omnivision OV08X40 CMOS Sensor
> +
> +maintainers:
> +  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> +
> +description: |-

Drop the '-'.

> +  The Omnivision OV08X40 is a 9.2 megapixel, CMOS image sensor which supports.

supports:

> +  - Automatic black level calibration (ABLC)
> +  - Programmable controls for frame rate, mirror and flip, binning, cropping
> +    and windowing
> +  - Output formats 10-bit 4C RGB RAW, 10-bit Bayer RAW
> +  - 4-lane MIPI D-PHY TX @ 1 Gbps per lane
> +  - 2-lane MPIP D-PHY TX @ 2 Gbps per lane
> +  - Dynamic defect pixel cancellation
> +  - Standard SCCB command interface
> +

