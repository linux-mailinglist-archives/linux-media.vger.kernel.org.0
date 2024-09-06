Return-Path: <linux-media+bounces-17787-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 718E896F6CD
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 16:33:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E46C1C213EB
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 14:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1381D31BA;
	Fri,  6 Sep 2024 14:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y9TBT3GS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5FF1D31AD;
	Fri,  6 Sep 2024 14:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725633083; cv=none; b=RNnaBQre2Jp9R4jKZ7eX6v5HRdPcDDuZ0ANnM8dVS3HCdq0RK5KGoEMDcKMH6S9DgqE9VDvMf2ySsyICo8oLF7XzW/mTzG0APGkP3BPiDRueU8t9/puwlCZp3jAKKNk1SYCPe02wr//AwDEkGYIRcjHYgwkEX3MfLaxGmtHHlUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725633083; c=relaxed/simple;
	bh=rCUlq/O2yUdqQZs0sy1pR46vcQQHPLH+xjf5jmcmJ74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GjSgYV9HnsgGXNgwBwSpMZRnufh3P8foT56YaODeElsePXaD7/Ul5xba8Jdue+KMR9DWBvjtWLISyPQmc0xltth1zXJWtAerYlgsh/KzEzIGbyIZkCqCuNdRXZAZaJI7tShizbd0wjxIUwXn1RUOVylG4T8ZZ3z0jCw9R+JTS9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y9TBT3GS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B538EC4CEC4;
	Fri,  6 Sep 2024 14:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725633082;
	bh=rCUlq/O2yUdqQZs0sy1pR46vcQQHPLH+xjf5jmcmJ74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y9TBT3GSsiXjTLNd+4cq0G8u0dzK+/4Ks/v98z/g+xcikT/9RnMA8DbUh11OWACj0
	 K0sUy83f0uFoS6YpuV4IYZpQBM5ZxtMI6yBodsFFtmpDTbAk/XJW6L9/J6rLmF7E5Y
	 C5OkzTKHULGOPJuQ98sHmKWN38/RQrT/qDwB6FvuFRAH1XNvBZDjkPJzbOSoPR8Ye/
	 H+Vl3qpPwnbw7z1UHR6ynLOCoAQbOd13V8kFKLje6L6PAMuk2qm4W+l5hFRdnqzDxX
	 uduoiKxYUqTgMpkQ6hxr4ulUWqLheIuUg+8PLf32biI6UD2Fn6okEI2lLa7kQTL2eG
	 tY8ZQtiCqtIpw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1smZzy-000000000Uk-2y2P;
	Fri, 06 Sep 2024 16:31:42 +0200
Date: Fri, 6 Sep 2024 16:31:42 +0200
From: Johan Hovold <johan@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/6] arm64: dts: qcom: sc8280xp: Fix interrupt type of
 camss interrupts
Message-ID: <ZtsSTsSsOas0hVNg@hovoldconsulting.com>
References: <20240905164142.3475873-1-vladimir.zapolskiy@linaro.org>
 <20240905164142.3475873-5-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905164142.3475873-5-vladimir.zapolskiy@linaro.org>

On Thu, Sep 05, 2024 at 07:41:40PM +0300, Vladimir Zapolskiy wrote:
> The expected type of all CAMSS interrupts is edge rising, fix it in
> the CAMSS device tree node for sc8280xp platform.
> 
> Fixes: 5994dd60753e ("arm64: dts: qcom: sc8280xp: camss: Add CAMSS block definition")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Camera still works on the X13s. Didn't try to reproduce the probe
deferral issue.

Tested-by: Johan Hovold <johan+linaro@kernel.org>

