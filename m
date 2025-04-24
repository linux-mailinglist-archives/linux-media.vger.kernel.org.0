Return-Path: <linux-media+bounces-30904-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D85A9A476
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 09:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6CC77ABAE9
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 07:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB24121ADBA;
	Thu, 24 Apr 2025 07:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eo2RhD7v"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB7021C18A;
	Thu, 24 Apr 2025 07:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745480265; cv=none; b=j81DNvIoBV0tfhRFhBZZVidrLd5oyUChXm8XuWxMDxucfPkvFVSvGGdPZ5AW0by3RqIFcC19AkJmowI7cD+KfEXps/x1VpeZWw7Mce0OLsc/XYdSwGK9TFUmY7MCRAj5QM/v74OQdSn8WjmmD8B9jBq2a4q+1YQ5pxbRETDx4gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745480265; c=relaxed/simple;
	bh=rqIQXLU4teKa3KV5UZ9eFWNKZcGmH9UFWtWigS0N56o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PFfbHqxJv02GhNGNeaeSEJoZPJjRROfnsGvG9VJvcgk1LQ0nj/LG/F5A1bnACVt+l4yHYaZlzjJmXCDwLmhgmiESvt8/0Ri/qiI5/laOgQ4EHHDKzrIxbV48+vxNPmPHjZbeIezEAUQ6ujrm8eEXweMLttwS6d0xYFRYFB9uEhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eo2RhD7v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D47EC4CEE3;
	Thu, 24 Apr 2025 07:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745480264;
	bh=rqIQXLU4teKa3KV5UZ9eFWNKZcGmH9UFWtWigS0N56o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eo2RhD7v+yruovP5prL7D73p3h19vJO8XxOMKiMOadfRnH6eenLazD5LJwIarqLpb
	 99gQMtrYHdqj7coifte7/wF/uGJbsQ5yFT+IcPmmJp2MbLYgouLciFzaJQg4nmrLWw
	 Rv/s64GcU02uHGF3djJPjgMVwUFbSIz01CgIuVbF5ZV2U5/zHy/rAQdhhcGw+NTHWJ
	 nBfX/A46+xbF5iihUvYDBHDwdw5a+GNA0L02tpNpPaFCbXsYtAGFvN204DKtD+NfoM
	 uu9LDO3YcqzmTxr3SXkPohiXSgnGqUfVaQ7ArUgvu8hucO0/mnfoKL2FCIYjcHSnFa
	 Q5QE9NSUuLV1Q==
Date: Thu, 24 Apr 2025 09:37:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org, 
	andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v4 5/6] media: dt-bindings: Add qcom,qcm2290-camss
Message-ID: <20250424-versatile-brown-chowchow-dfc4a9@kuoka>
References: <20250423072044.234024-1-loic.poulain@oss.qualcomm.com>
 <20250423072044.234024-6-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250423072044.234024-6-loic.poulain@oss.qualcomm.com>

On Wed, Apr 23, 2025 at 09:20:43AM GMT, Loic Poulain wrote:
> +  power-domains:
> +    items:
> +      - description: GDSC CAMSS Block, Global Distributed Switch Controller.
> +
> +  vdda-csiphy-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to CSI PHYs.
> +
> +  vdda-pll-1p8-supply:


How are the pins or input supplies called?

Before sending new version, allow people to actually finish ongoing
discussion.

Best regards,
Krzysztof


