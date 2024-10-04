Return-Path: <linux-media+bounces-19081-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD5798FD5A
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 08:31:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 147681C23029
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 06:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CEA812CDAE;
	Fri,  4 Oct 2024 06:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mFRKaiXe"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30DF4437F;
	Fri,  4 Oct 2024 06:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728023465; cv=none; b=jZi3va+tsKePGMAQkY3EHo3JklOLigVoE4SmRvEd0y2zlBdt0S9WhY+gD6mPdE1zWUuLIyzZbbzlb4jZI+kIEWg5LJj5VkVVsI448JueMSH3VfCP1A+isDTHH0n6sur9C8iunl4jXidvo1aoXBHjPcuf/zTxHXl4XfQ53t6Ub9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728023465; c=relaxed/simple;
	bh=EEw+7pUhIXdNBpJ3A/JT4kBhGTn4VJpaixV1VAt1T4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QNV1XcUja/iyLihmvXa5djzB0Ztbx+PceGU0LRQgiLPzzX4idnWB0wHxfLLewRe0GAWhGiYi+kBSH388Dzt2aAjioiERBMsRnTrVSySzEWP2cXqmC+tMWfHlvUkvFUWq7OwvZZbASiFz6p2RHJLq+DVvxEsg7xKVOCtahif5cnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mFRKaiXe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BCCBC4CEC6;
	Fri,  4 Oct 2024 06:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728023465;
	bh=EEw+7pUhIXdNBpJ3A/JT4kBhGTn4VJpaixV1VAt1T4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mFRKaiXeEsDEbezP6MfTfRNsO+Crl+ydWn/5S8QB09wEo9Xpm+pyxiW1wLfUABoN+
	 l59d5mgcRH6OtZX+g7+ZdAaz0KeU7hAS96Uh2icNLBbV2R73tLf2gK6QMfNGBaY4ov
	 Gnwm27Yxv/AV3tuZnMT+YEdjN9GRnIfcAZF3sycc6yD/Aal4UpcCZcVgUgFfkX2m/o
	 znXHn5r8jDuJn0MLvmPWQb6ToTwYJE2+sNmbhk/uRgbbwPUDCeGtL/BlscoPV+SPbL
	 2mScfgl8RV6Q7bIDVsMwK7DpzqqwSLi6mMy7H0IraudE4pyToCb4f6i+EFoQRSFyc+
	 Lp0qfiNo36Ulw==
Date: Fri, 4 Oct 2024 08:31:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jason Chen <jason.z.chen@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/4] media: dt-bindings: Add OmniVision OV08X40
Message-ID: <gymosm3qtkhpembqomiqpjcb7554cv3ytqgxoffo2ej36rjet6@45co6ybnjlzl>
References: <20241003-b4-master-24-11-25-ov08x40-v4-0-7ee2c45fdc8c@linaro.org>
 <20241003-b4-master-24-11-25-ov08x40-v4-2-7ee2c45fdc8c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241003-b4-master-24-11-25-ov08x40-v4-2-7ee2c45fdc8c@linaro.org>

On Thu, Oct 03, 2024 at 04:41:26PM +0100, Bryan O'Donoghue wrote:
> Add bindings for the already upstream OV08X40 to enable usage of this
> sensor on DTS based systems.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/media/i2c/ovti,ov08x40.yaml           | 114 +++++++++++++++++++++
>  1 file changed, 114 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


