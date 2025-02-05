Return-Path: <linux-media+bounces-25676-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F29A28F2E
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 15:22:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5BE93A6A22
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 14:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F016155756;
	Wed,  5 Feb 2025 14:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eaY5Aw6b"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCB31519BE;
	Wed,  5 Feb 2025 14:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738765281; cv=none; b=A80khvC9bKarmoT1Q54VyWP34mKLLQunAp1bQXmT7fslvl7R3+L1ZKpWREoLiLRv3d/z6IDIrbYFO51fIA0KHlU03wicLB0so5OzwKu4B5o+IBPIA24zbzFH4EuASTi5y5hHLLK6iKuSYQodouNr92HJrMdPCt9cazufvxOs4q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738765281; c=relaxed/simple;
	bh=Ohttqdq+nfn3PKh4oPeEL2WKjenbT/PfD/8epqeP7fM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sFHFs9PvDRc9wIB+k3HIzL0vrQQieaicgGCemXyag4JPHXKgOhADoT84CO1SrQ8NmSSe4biCcyRRNOrXD9pF8TjDmryPB/AWUWq0Zr6mwFPADfXrS1J2NmUuoCGAaqcFV7hP3bx5lxu1mCq0TxAtiWrRQyHweIFcxSOXMhQSVI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eaY5Aw6b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB6FEC4CED1;
	Wed,  5 Feb 2025 14:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738765280;
	bh=Ohttqdq+nfn3PKh4oPeEL2WKjenbT/PfD/8epqeP7fM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eaY5Aw6bSJI2JaoBz2F/GA03XwIor+VXzYKJq1Gdir6kyGtpQxWWc2u+ZAZ9oRJ55
	 TsLf+PF0Km8Fw9X3CqkFjLXExgukLa2jnwEu7Ws2ghhNye2UAVWBXt1eqv87iYKJJX
	 NUjrpib+wvERt2qoEKYNciCpicbrKSGD/48l8SUzzcofmc9qC9s8pViV3jmn6MASYi
	 OVXneBm2hdLmkE6CCJLfv09Sz32c5ncbhRA4Hvy7AP6r6Vjlzl5EQTOi5RoDCC7z5M
	 fUyjcWk0+0Rq7NYCGFY/WtdrbTCIjjRCAdhEv0gMm+zN/Y7Wf6Cc+RvTV/YueQYKw6
	 10MLooYV13DYw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tfgHO-000000005vU-0EXG;
	Wed, 05 Feb 2025 15:21:26 +0100
Date: Wed, 5 Feb 2025 15:21:26 +0100
From: Johan Hovold <johan@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, quic_vgarodia@quicinc.com,
	quic_abhinavk@quicinc.com, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, p.zabel@pengutronix.de,
	sebastian.fricke@collabora.com, bryan.odonoghue@linaro.org,
	dmitry.baryshkov@linaro.org, neil.armstrong@linaro.org,
	nicolas@ndufresne.ca, u.kleine-koenig@baylibre.com,
	stefan.schmidt@linaro.org, lujianhua000@gmail.com,
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org
Subject: Re: [RFC PATCH v10 27/28] media: iris: enable video driver probe of
 SM8250 SoC
Message-ID: <Z6Nz5r8Z1BhtD2KZ@hovoldconsulting.com>
References: <20250116070234.4027116-1-quic_dikshita@quicinc.com>
 <a3cafc25-3453-4a2d-81fb-71730982ddc0@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3cafc25-3453-4a2d-81fb-71730982ddc0@xs4all.nl>

On Wed, Feb 05, 2025 at 02:15:25PM +0100, Hans Verkuil wrote:

> This discussion about probing the driver is holding up the merging of this
> driver unnecessarily. For now, only support the iris driver for SM8250 SoC
> if the venus driver is not enabled:
> 
> #if !IS_REACHABLE(CONFIG_VIDEO_QCOM_VENUS)
> 
> That should be uncontroversial, and allows us to merge the iris driver.

Sounds good to me, but that should be IS_ENABLED() as otherwise which
driver ends up binding depends on whether venus is built as a module or
not.

Johan

