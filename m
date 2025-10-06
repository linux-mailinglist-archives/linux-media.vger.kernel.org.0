Return-Path: <linux-media+bounces-43801-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D16D0BBF93F
	for <lists+linux-media@lfdr.de>; Mon, 06 Oct 2025 23:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7F33189D475
	for <lists+linux-media@lfdr.de>; Mon,  6 Oct 2025 21:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 609AD261B6C;
	Mon,  6 Oct 2025 21:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nRSnBoEt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F491A83F7;
	Mon,  6 Oct 2025 21:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759786438; cv=none; b=m7TFEmNwD463lpn6uh0GFLfTQN1A1dHiyJFPiBoKzCcAarqGGllQAfl/WMHcRB0UwgCg/FufvGhMKNh6KpVxLOj/zFtmfWPu0HD5fJ7fToY85w39hO1Mt7PTmfSkK7z+RiZximZM+7yq59h14PUvQC5B1NNDrjLLnRD9y6cVAOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759786438; c=relaxed/simple;
	bh=lP7mcxzX5c4S2EKINh1jIaVdxeKDs4Uj12BGQ2za1WQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WGFx04ZEIRt7scGmkzal7XX/G4qXYG8xVbTiWm9CS5MBdZi9DjFQoRM0dz5+LTy4zFIMW3mfRvHpL5mJUezZ6GUsf/fVFwecje+KcHxe5nxpd45Fs5hY10ZLyAERCXTGq1w8UdRLSRx2MRHymUF7Ah61ep3GCWoWTnd2IyqKIDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nRSnBoEt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F18CCC4CEF5;
	Mon,  6 Oct 2025 21:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759786437;
	bh=lP7mcxzX5c4S2EKINh1jIaVdxeKDs4Uj12BGQ2za1WQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nRSnBoEtKcb6rzHp3oEgUf4uwonyhS5nrKAQ6FkrNRPWdfaqMXt/MFimfOoI9MKIh
	 D/OtWxfNKWCJggCKn/0bL8GMi0zaGqvRfJC0iVj9tUv9wqNYcS/8zsa8jSRYOmMKXO
	 3qbXLgzOamFZFXMGrFXWM2SlqjetEMOA98cQgWrLavtIZpRow5FB/kMD9s7o3Ead58
	 8tTXtPEHolLZqBcJrW3TU9fCpJI71BfmP1mishPaCDWH/A5GNKV8qRmICrS5DlH0fH
	 NyKU4wTjyVpbNWqvePKMoI3TRcgaaC6QNmEDWTwBGteYLTPoKwgg0iILuwcM8WBDf/
	 tySzAaOtFbR2Q==
Date: Mon, 6 Oct 2025 16:33:56 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	devicetree@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: Add Samsung S5KJN1 image
 sensor
Message-ID: <175978643460.621524.3603907831690218107.robh@kernel.org>
References: <20250928200956.1215285-1-vladimir.zapolskiy@linaro.org>
 <20250928200956.1215285-2-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928200956.1215285-2-vladimir.zapolskiy@linaro.org>


On Sun, 28 Sep 2025 23:09:55 +0300, Vladimir Zapolskiy wrote:
> Add device tree bindings documentation for Samsung S5KJN1 image sensor.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  .../bindings/media/i2c/samsung,s5kjn1.yaml    | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


