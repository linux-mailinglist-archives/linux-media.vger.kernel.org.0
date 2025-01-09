Return-Path: <linux-media+bounces-24541-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB97FA07BAE
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 16:20:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06399188D7FF
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 15:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EA1A2206A2;
	Thu,  9 Jan 2025 15:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xd8cH89A"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6B321CA16;
	Thu,  9 Jan 2025 15:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736435842; cv=none; b=q/9p7w+xvq928lcjObn8VmYJbRCdSVfLfv4IshxXpxkNBxGj/XIZfUrVmU1j3m1L+Y/TzdJtbG4qF2pVELgLiRT8GajWTpL5D7cuBGyHeUyNOqUcJQIqHSreJq6gQTOVbrsXJFGe+UrtEk8ftHeRbjnTNilp5amKSRB80r5x36Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736435842; c=relaxed/simple;
	bh=VnMu8CiT6L4+MZC85SqfNz+2pFTDnh4jzZDDuqVNI6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tO16U3GtzOZtrZcZ8idXKPWrzGVRebI+a31XsZoVwCj03BcAGja3nnUfWRI3+AUJFYDGCQHXb8w+V2Xd2Z9OQQ8TcpHTOKokS3hzlfOw0IDhQ9UiGnKgSj2PiCodRMbbvcN+HI7/wTtBBWdGW3UiOrlCXl5Y+9mDuvGjRtFjJUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xd8cH89A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56FCCC4CEE1;
	Thu,  9 Jan 2025 15:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736435842;
	bh=VnMu8CiT6L4+MZC85SqfNz+2pFTDnh4jzZDDuqVNI6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xd8cH89A78UrJZlOvR3zOGXUhgooHTSUNSLTQhb5HsvwaOaj3ZtBNIJ03ooJ5boUN
	 OWgKhAxtr+iubFiAweaNpHiG5pLR1e04BoewKzT+6MQdtFpkH2r8OaL+UUQzWxFSmM
	 Ggx+MXjFBO8DwBLVm3lve7IiHDrzIte7hh0IjZmcwhAvAck/vSo6hCoQIfWGv8/cFn
	 pqsyqCMp1ZPmAr12c96UQakXNHJxR6IUVktqrEqytQ6vfsYksfQm90QjZD+Qbw4eW5
	 lFizN2di/Qzr03EPjsyRGd45qbFdFsTHROpCs0TggNnZqKB5YQ4nQ+yVefEaP3voxx
	 U1v/BlO1sJgeg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tVuHj-000000008UF-1Lnk;
	Thu, 09 Jan 2025 16:17:23 +0100
Date: Thu, 9 Jan 2025 16:17:23 +0100
From: Johan Hovold <johan@kernel.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, Joel Stanley <joel@jms.id.au>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com,
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH 0/2] media: iris: fix memory leak and improve driver
Message-ID: <Z3_og9XpRgYvKTcM@hovoldconsulting.com>
References: <20250109-iris-driver-fixes-v1-0-789a0f5dd7ee@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109-iris-driver-fixes-v1-0-789a0f5dd7ee@quicinc.com>

On Thu, Jan 09, 2025 at 04:56:39PM +0530, Dikshita Agarwal wrote:
> This series fixes a memory leak and improves the representation of 
> dma mask to set upper bound of DMA address space.

Both of these issues were pointed out to you during review of v9 of the
series adding this driver, and as the driver hasn't been merged yet this
can be fixed in a v10.

Also looks like something went wrong when you posted this series as it
is CCed to:

	20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com

> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
> Dikshita Agarwal (2):
>       media: iris: represent dma_mask in more readable form
>       media: iris: fix memory leak while freeing queue memory

Johan

