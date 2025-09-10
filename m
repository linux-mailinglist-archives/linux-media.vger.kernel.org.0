Return-Path: <linux-media+bounces-42196-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF43B515CD
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 13:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CABB7179533
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 11:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41BE31691A;
	Wed, 10 Sep 2025 11:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dw0oDyMk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C2130C371;
	Wed, 10 Sep 2025 11:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757503971; cv=none; b=VN31zpgUFGB48IDjkyfZrDik9CYig75t+rc3Pl90ovzzPFMCpnF3trrozTGfB5wZWxg5Eeg36dG3868M0qYA687tSQE37sH8FUCJQ+TRfe3VmpWOM+ASlUJoAMi3PKp57Ik5lnKJ1fbiGbFfoxcSgshRUrecbdFn3t/qel6Tsvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757503971; c=relaxed/simple;
	bh=erV4920Yq0T2rbBU/yUFkESQG/Yc/YjZ7mIxIQVhfpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tApe9Nb7PjysbbdnAwR8shbVug2wU736xAOk2YjCiyhhxeh5yYgDTNf9owKCi/fSSqra+LwpIO32kws8HQ1OgHrx+bWA6wSCVQLgZbf2ofPvY0gVAcdDoBgjh81T9TXc9oeQtXZeQ3seujHygk0IWsdbQ4F1sMEQyjZx2UPqxnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dw0oDyMk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F1F8C4CEFB;
	Wed, 10 Sep 2025 11:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757503970;
	bh=erV4920Yq0T2rbBU/yUFkESQG/Yc/YjZ7mIxIQVhfpw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dw0oDyMk6hhum3hcABSV0D6G3Gs7c72pqAso2J5Ckm5L0woIwzYULd31G148Wtw6E
	 WtfILYnSfxL/MWqTs3jEqny+PVs6li3OwVrTOXZ07fil3SUseeTAgm6TTM/TW0ODxh
	 QB1ohFU/6Tf9FiGHmVbdniaEZIhfIylrGPTaPXiObOutGyhX+ZMBvICYgENGkm3Op4
	 7MGQZ2zBvOYqCnZo5JovbsbiiHJeSPQEY2sWvjVp5YYrUWMm8BAAYZetjLBfnyXPdO
	 PUHJB1lvCgD9PLPqaDo9gRHVLTTbvuHn46pHRq9o0XwYf/E2J1gAfHJPFofI/k5hVq
	 1+YawLlhNy+vg==
Date: Wed, 10 Sep 2025 13:32:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Martin Hecht <mhecht73@gmail.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, 
	michael.roeder@avnet.eu, martin.hecht@avnet.eu, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: alliedvision,alvium-csi2
Message-ID: <20250910-arboreal-alligator-of-tact-c04463@kuoka>
References: <20250909113218.2595516-1-mhecht73@gmail.com>
 <20250909113218.2595516-2-mhecht73@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250909113218.2595516-2-mhecht73@gmail.com>

On Tue, Sep 09, 2025 at 01:32:15PM +0200, Martin Hecht wrote:
> Change from my company email address to gmail.com.
> 
> Signed-off-by: Martin Hecht <mhecht73@gmail.com>
> ---
>  .../devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


