Return-Path: <linux-media+bounces-23549-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA359F4555
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 08:41:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0A4516A701
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 07:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1BC11D63C4;
	Tue, 17 Dec 2024 07:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CqiyWHzU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6FA152514;
	Tue, 17 Dec 2024 07:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734421296; cv=none; b=WsPhvc9zLrOA7UDzs+1Xa1Wn33XHt0f6m3kp07A+GGZPZHKWq3J5IUPRrX5L1aSESpks+ZneRvsrRf1AS16ScJUwrmor02UNIaHeNE2p0nq1Tto2xbkdA7cJku2C14wgtrC20NESy4btYW6PNObTBpMEz2Smwtx24KDOrEdhKmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734421296; c=relaxed/simple;
	bh=70sywZhuH7sYVF1lNVXtKGVYFA8RCgLd1FOFxBqxk+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NlXJ6jTHLdL4Mjrxl2Blsw2UuwkosQGdUOu1oXpyJr2Mncf2+01HlrbrAQOVcvXL4odJFaPNNi24lPpiMnY41szmxmkfmDx5h3kENgBJ6ohPLFYkiZZ+4KRJsVNCIe9j2qnlJIKsNzyQQKj/XPdgbChXPq4tYqgqne8UwB5aCp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CqiyWHzU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A40B1C4CED3;
	Tue, 17 Dec 2024 07:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734421295;
	bh=70sywZhuH7sYVF1lNVXtKGVYFA8RCgLd1FOFxBqxk+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CqiyWHzUomXM3/5gl/IVae86Kkcdq9OOSNj+LbSzUWHn9mjxmoOBz7UyqM23lb3Ha
	 /ODBX4MFCO68B+7ktSp2EIlj3m1Wlk72ghRAUsbVX5VJeBA6Dr4H9Ir9St1h21KBs+
	 h91hdjPmctW4gDBFoi2ARe0gDwLbwgh2XIC9kjnE46tV14jZZms/5M4pkfH7Eh10ik
	 /j0ASlr5YmHkaDpcOWC/PJk+gqqWHXqU5BCEze4tz+0wCE4QgNmPNMjynWcr2a95mD
	 rt3JkFtxHtUFhVo7N9FF2JipscsSivQ2LtXkbFsfq1JErEiR+WkSk6OBkmvd1v+Jtl
	 BOEBnHcPRknbA==
Date: Tue, 17 Dec 2024 08:41:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: imx283: Describe sensor address
 using the reg property
Message-ID: <z7nkfmqubqabfxjpffhl4gaztec67xrfaulzd5d43bsyf2ukeb@ebak7s2bmm7j>
References: <20241217032821.1712916-1-david@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241217032821.1712916-1-david@ixit.cz>

On Mon, Dec 16, 2024 at 10:28:17PM -0500, David Heidelberg wrote:
> Use the reg property instead of text in the description.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../devicetree/bindings/media/i2c/sony,imx283.yaml         | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git ./Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml ./Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml

Same problems.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


