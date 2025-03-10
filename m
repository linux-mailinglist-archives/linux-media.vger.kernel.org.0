Return-Path: <linux-media+bounces-27933-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D38CA58FD4
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 10:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3FFC3A80A2
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 09:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A345D2253FE;
	Mon, 10 Mar 2025 09:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eHfcjdd5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066AC1C5F34;
	Mon, 10 Mar 2025 09:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741599417; cv=none; b=QqqbjnzR24HP4Exd3X3oZ3MmCOoHLRM91mMlJohfCYq59bCHOZOqJRmIu6KyG11du7zR6sdNjNRwVc3wZqgTAMj9g28oW0SewmyvViLuyUSnZF3ohp/gObBdFlxG2licYyGjjPbHp/5KXV0VxQ80QB1qjZNg3re8HC3U7yqEb6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741599417; c=relaxed/simple;
	bh=nHXLGpFhXPNDAK+hkP/Z0dZn4AmHRcgM0X5IwjW1/18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ECxBYOwh5u24F+8swJNwiGuN2DZt3byV11e3/KqXTqGIOoVu4fTFllxLD/pBpIlXCsHgvsXGsf+I4ZuLvGa30G1uDf0YI+RmBvV4RdNvQHn/gk9ueinT8cohQfinbr/pPnwAl73rsg1wjON0PqDfS/76O8j6HKowCuz25+qqK1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eHfcjdd5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA38AC4CEEC;
	Mon, 10 Mar 2025 09:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741599416;
	bh=nHXLGpFhXPNDAK+hkP/Z0dZn4AmHRcgM0X5IwjW1/18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eHfcjdd55W9oMKyYnwW6zCB8PWLpJ//1m44xm4oF/T/CyEYbv/5ZBD9i4F4AE1j68
	 H5pCCi2MqiEJ7bAprRM5ZiepuOFw23tQWOqC9nUeH1Hsv4/Ik0Qy6oWqu+AW1o1syy
	 wtLjXC5hSU5cVCrv0sn1hGdafiwjQUWjgrs9Ckay6+by60Ukg0j+5aDrnHYBWDOv/d
	 MZTtCOmRGWZl5CGXZUogsO0e1Y84F9OalVjdOezeILZ37dTD4fBSBbzS8FaT9MEVBb
	 kVzKro25b8fiChPYo5ELc4rLhvk4MYtWrVT5X6Fxk6g0WrEMceVsZ4nDzCSCIGfWSS
	 pAISty1b1/CJw==
Date: Mon, 10 Mar 2025 10:36:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mathis Foerst <mathis.foerst@mt.com>
Cc: linux-kernel@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, manuel.traut@mt.com, 
	mathis.foerst@zuehlke.com
Subject: Re: [PATCH v4 1/6] media: dt-bindings: mt9m114: Add slew-rate
 DT-binding
Message-ID: <20250310-bright-resolute-mongrel-9e4c5b@krzk-bin>
References: <20250307093140.370061-1-mathis.foerst@mt.com>
 <20250307093140.370061-2-mathis.foerst@mt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250307093140.370061-2-mathis.foerst@mt.com>

On Fri, Mar 07, 2025 at 10:31:35AM +0100, Mathis Foerst wrote:
> The MT9M114 supports the different slew rates (0 to 7) on the output pads.
> At the moment, this is hardcoded to 7 (the fastest rate).
> The user might want to change this values due to EMC requirements.
> 
> Add the 'slew-rate' property to the MT9M114 DT-bindings for selecting
> the desired slew rate.
> 
> Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> ---
>  .../devicetree/bindings/media/i2c/onnn,mt9m114.yaml      | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


