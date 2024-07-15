Return-Path: <linux-media+bounces-15013-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F04CC930F06
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 09:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACC1C281684
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 07:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C405D184101;
	Mon, 15 Jul 2024 07:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A6HQwlIQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276D46AB8;
	Mon, 15 Jul 2024 07:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721029577; cv=none; b=d3sSSihWVUcnC9XhcI7jVwJSjvMzonEKWme9hORRBlkrcFHgnBobr1UhzNkhkhMroLFdn5WfduDpx80qclztT4zhsQD+CTfxmxV8mNT0EYraAqYj0OlcMTPhSOLlw3mRHpgMEnLicaVapTMDFyX8kQJ7X0GPCh8OjhwKjts7qkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721029577; c=relaxed/simple;
	bh=WpjJRtS73XPx4qErFEnKNQ2LIobUuQY0zJN+fVegBA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MUBszfkXZWh/OV8p2Ff2aoWeZo8ruKA/qaoyziPj7dOepMW01TuvoElJ1FxP4raMmsi94A+xihehjX/pmkNLd/F+OvsM9hIPOy9EqlCOp6pipZt6dG6M8rDpP65MFV9WAr90ALpgWpDutXcUNC70qv+TQmP7Jps3E7niXK5Q+Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A6HQwlIQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D38EC4AF11;
	Mon, 15 Jul 2024 07:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721029576;
	bh=WpjJRtS73XPx4qErFEnKNQ2LIobUuQY0zJN+fVegBA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A6HQwlIQy1t6OE0ghLN1MJNM/jO7ymf+vCAVv3pL7qF2oPfE1mOvrMCGtASAmHWKy
	 5W0BOiLtqK8QFEt5wiH70cTY4s+v9T9hm1227e/aKbHJjGAj3ADlXr0qLF4/vMUyta
	 cFIdik7SBIy1W5gonUZMrB031s12HOlhAPJLAdMoHbgI4l5UK2kk2BySPUP7b/8unj
	 4+7ecPZBDd/w8U7K7EJ4sAowuBLPCM8uO/Lrn8lphPSEPd7pNGIVnY4M0yRm0Tu51T
	 rHEtAf+JL/sZx3/cfsEk6oomtEMBeLM3papl4/sZMJ/24cUwQ4c76+Jb9PdClEPtC0
	 GjlF9ow2wTDGw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sTGPW-000000001TJ-0gQl;
	Mon, 15 Jul 2024 09:46:14 +0200
Date: Mon, 15 Jul 2024 09:46:14 +0200
From: Johan Hovold <johan@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hansverk@cisco.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Milen Mitkov <quic_mmitkov@quicinc.com>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH 2/2] media: qcom: camss: Fix ordering of pm_runtime_enable
Message-ID: <ZpTTxk_7hBbFLTTp@hovoldconsulting.com>
References: <20240714-linux-next-24-07-13-camss-fixes-v1-0-8f8954bc8c85@linaro.org>
 <20240714-linux-next-24-07-13-camss-fixes-v1-2-8f8954bc8c85@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240714-linux-next-24-07-13-camss-fixes-v1-2-8f8954bc8c85@linaro.org>

On Sun, Jul 14, 2024 at 11:53:59PM +0100, Bryan O'Donoghue wrote:
> pm_runtime_enable() should happen prior to vfe_get() since vfe_get() calls
> pm_runtime_resume_and_get().

Again, please describe how this manifest itself to users. I see
occasional:

	qcom-camss ac5a000.camss: Failed to power up pipeline: -13

on boot.

> This is a basic race condition that doesn't show up for most users so is
> not widely reported. If you blacklist qcom-camss in modules.d and then
> subsequently modprobe the module post-boot it is possible to reliably show
> this error up.
> 
> Fixes: 02afa816dbbf ("media: camss: Add basic runtime PM support")

Missing CC-stable here too.

> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reported-by: Johan Hovold <johan+linaro@kernel.org>
Link: https://lore.kernel.org/lkml/ZoVNHOTI0PKMNt4_@hovoldconsulting.com/
Tested-by: Johan Hovold <johan+linaro@kernel.org>

Johan

