Return-Path: <linux-media+bounces-21958-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEF89D830A
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 11:07:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C65D71660C7
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 10:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E031191F92;
	Mon, 25 Nov 2024 10:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FOK1wufw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16AE190661;
	Mon, 25 Nov 2024 10:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732529267; cv=none; b=mLx6JhhG6xtNXyM0H1IRhIfH2o3xVuTYywIdaIHWLZaQ8LSdvRD8GRYQ11NJvfQodcpyHUryYruOyuEVxt/Vm2RMUD2Xaqseev0aOJY8n3mCsqPLquq11Xthi/3OEUmOB++FCXnUxgJPdtIRIJkz99Pj0kEjGPpVxBP6VYux0fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732529267; c=relaxed/simple;
	bh=E9ezbafur2nm2cEtQaawacaJc/GnWr2pW/5V8YrWFFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pGteUVeBg2i9GEBnSzlItcoyTU5ic3KZBRQ1uId362LX/kMyUUXe1HQIoI2E74y7neh+gjnstcesny1LJWDB5gGMWG+PjIE5BqPNBptHbbz59ynWwi0CQL2KEnzv7EgGk4FlB/0dAtKyRlB2+Ko/GmJTum+uzlFlb358EVjrM8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FOK1wufw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A82FBC4CECE;
	Mon, 25 Nov 2024 10:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732529267;
	bh=E9ezbafur2nm2cEtQaawacaJc/GnWr2pW/5V8YrWFFM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FOK1wufw0HpRvt9cJZl9sPkoDe2BoIUxI7N2/zm8kB/4YGme1rrINKgNEWS/N6cB7
	 Xgk4MEMq3VK0ai3nMpXnUEPpDaBXncZnTkztw56LeyqgI28bJiSpyXnfyA8W3xFTka
	 ZL9Tw/ECworC9At9tXaA1foYVfYLWHDr+tkBMDV+u0RvNXaWvan+bt74NsrYVeVvAl
	 tOTmrgBinKigtxQyLjJyALoxCgmIMZAGceygMfTMc75fMvXr0zW0adjooqlqGX1wXA
	 gV4jxa/jvUvXw+5loUcWVvk4KUc4lwTqpsGsLQGzi1xGwHYWUeGaTZrSJ0dvQGPY7y
	 XS/KTUeVK/WAQ==
Message-ID: <04a7ebf7-2924-4894-bc53-ba77e2f64fae@kernel.org>
Date: Mon, 25 Nov 2024 11:07:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/8] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti Video Input Interface
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
 <20241125092146.1561901-3-yuji2.ishikawa@toshiba.co.jp>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241125092146.1561901-3-yuji2.ishikawa@toshiba.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/11/2024 10:21, Yuji Ishikawa wrote:
> Adds the Device Tree binding documentation that allows to describe
> the Video Input Interface found in Toshiba Visconti SoCs.
> 
> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>

Why this tag stayed and other was removed? What was the reason of tag
removal?


> ---
> Changelog v2:
> - no change
> 
> Changelog v3:
> - no change
> 
> Changelog v4:
> - fix style problems at the v3 patch
> - remove "index" member
> - update example
> 
> Changelog v5:
> - no change
> 
> Changelog v6:
> - add register definition of BUS-IF and MPU
> 
> Changelog v7:
> - remove trailing "bindings" from commit header message
> - remove trailing "Device Tree Bindings" from title
> - fix text wrapping of description
> - change compatible to visconti5-viif
> - explicitly define allowed properties for port::endpoint
> 
> Changelog v8:
> - Suggestion from Krzysztof Kozlowski
>   - rename bindings description file
>   - use block style array instead of inline style
>   - remove clock-lane (as it is fixed at position 0)
>   - update sample node's name
>   - use lowercase hex for literals
> - Suggestion from Laurent Pinchart
>   - update description message port::description
>   - remove port::endpoint::bus-type as it is fixed to <4>
>   - remove port::endpoint::clock-lanes from example
>   - add port::endpoint::data-lanes to required parameters list
>   - fix sequence of data-lanes: <1 2 3 4> because current driver does not support data reordering
>   - update port::endpoint::data-lanes::description
>   - remove redundant type definition for port::endpoint::data-lanes
> 
> Changelog v9:
> - place "required" after "properties"
> - dictionary ordering of properties
> 
> Changelog v10:
> - no change
> 
> Changelog v11:
> - no change
> 
> Changelog v12:
> - remove property "clock-noncontinuous" as VIIF switches both modes automatically
> - remove property "link-frequencies" as VIIF does not use the information

Driver does not use or hardware supports only one frequency?

> - remove reg[2] and interrupts[3] which are used for CSI2RX driver
> - update example to refer csi2rx for remote-endpoint

Were these the reasons?

I am really surprised that after 11 versions this binding still is being
totally reshaped and you need us to re-review.

Also, start using b4 tool, so:
1. your cover letter will have proper links to previous versions
2. b4 diff would work. Look, try by yourself:



b4 diff '<20241125092146.1561901-3-yuji2.ishikawa@toshiba.co.jp>'
Grabbing thread from
lore.kernel.org/all/20241125092146.1561901-3-yuji2.ishikawa@toshiba.co.jp/t.mbox.gz
Checking for older revisions
Grabbing search results from lore.kernel.org
  Added from v11: 7 patches
---
Analyzing 144 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Analyzing 13 code-review messages
Preparing fake-am for v11: Add Toshiba Visconti Video Input Interface driver
  range: e16e149ced15..4efb0d6768a6
Preparing fake-am for v12: dt-bindings: media: platform: visconti: Add
Toshiba Visconti MIPI CSI-2 Receiver
ERROR: v12 series incomplete; unable to create a fake-am range
---
Could not create fake-am range for upper series v12



How can I verify what happened here without too much effort?


> 
>  .../media/toshiba,visconti5-viif.yaml         | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml b/Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml
> new file mode 100644
> index 000000000000..ef0452a47e98
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/toshiba,visconti5-viif.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Toshiba Visconti5 SoC Video Input Interface
> +
> +maintainers:
> +  - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> +
> +description: |-

Since you ask for re-review, then:

Drop |-

Best regards,
Krzysztof

