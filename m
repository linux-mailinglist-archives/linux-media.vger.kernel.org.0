Return-Path: <linux-media+bounces-50103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 56360CFC6A2
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 08:41:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADA4C304F8A1
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 07:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A87842C21DD;
	Wed,  7 Jan 2026 07:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ow19Mrnq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EB9263C8F;
	Wed,  7 Jan 2026 07:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767771273; cv=none; b=KDJGhmbNRhFgi+RJn/htzBRtuq04mHZtqKraQM9phBrnvODgrXtj1JVvQDgLVGkVfgNhg2FQnP6/Cyn5XSSv9Q0qOeafmNUiejd1GmNSyFyQ2dOTwdyBqotvx5aCgwc49y14ITwFANlTTYxsAIf0LTWJzWVuFDnDmtDj3XYVrg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767771273; c=relaxed/simple;
	bh=Ff2R0DMELCldC2SynS52T1S+adVaJGrGoaADlIOcuMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACkhIdfuIDDyaRPkGHdTgefxL5hVaibj65idtarXKRUolQjQZV2GeuOWF3I76wnlOQ68hePJ9KZI2tXHaStBQsnGFiQ0eerX+RXkLjAkB042VZCHdUp/IEdZt0tXr3ETe44H9KQED6g0U4juBikZOA2NYwIUpKgFOZYoccVyncU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ow19Mrnq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E13FDC19421;
	Wed,  7 Jan 2026 07:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767771272;
	bh=Ff2R0DMELCldC2SynS52T1S+adVaJGrGoaADlIOcuMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ow19MrnqUMnH/Ck2zQxOJZuoDDCOhIimnWt66xkCto9MiTyX0ayIi5VTp1oP1X7wA
	 FB6TaQZvTAxpKeONhrnALEGkV5ElJjtesnTXJ08qERziJmP9e08HpxBCnDBzS4g7SE
	 HQJi0sbyeCBgzKabMTzF7BuNKnjNYfxINe3NddOSdUmCDVcATk4ezgUHsucgu17ym6
	 E54yJl5fjMwuola8qHQ5NU8iuuJmx5M2N+7j63Zt0Rnft0LGm033PIjhHqFpVq1L9k
	 YkYSw+biN0+1aanizrwUNI7DybwApThKY/nEPSOrS/kkKRTTVn/6GrvuuxE+mz3sJ+
	 6YZHL4FjS1J9w==
Date: Wed, 7 Jan 2026 08:34:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Robert Mader <robert.mader@collabora.com>, 
	Bryan O'Donoghue <bod@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v6 2/5] media: i2c: imx355: Support devicetree and power
 management
Message-ID: <20260107-masterful-ermine-of-cubism-e5d5e1@quoll>
References: <20260107043044.92485-1-mailingradian@gmail.com>
 <20260107043044.92485-3-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260107043044.92485-3-mailingradian@gmail.com>

On Tue, Jan 06, 2026 at 11:30:41PM -0500, Richard Acayan wrote:
> A device tree compatible makes it possible for this driver to be used on
> Open Firmware devices. Initialization of power-managed resources such as
> the reset GPIO and voltage regulators can be specified in the device
> tree and handled by the driver. Add support for this so the Pixel 3a can
> use the driver.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Nacked-by: Krzysztof Kozlowski <krzk@kernel.org>

You did not receive such tag. You cannot construct tags, just because
of ... what exactly? Why do you think to use this or other email?

You received only NAK as disagreement of this patch, but I did not allow
to merge it with my NAK.

Best regards,
Krzysztof


