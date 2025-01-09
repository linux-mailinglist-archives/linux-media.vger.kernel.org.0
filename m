Return-Path: <linux-media+bounces-24538-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE5FA079F3
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 15:59:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DC583A8021
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 14:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E827121C182;
	Thu,  9 Jan 2025 14:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ma/QunMp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB6721B1BF;
	Thu,  9 Jan 2025 14:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736434733; cv=none; b=R+VMwMKNKpHaf+x27lpnTc4pqH9O9IeYqu8XHnF8IOMhXYAoKXViyqBuLXKJsZ0hiLesKXXYRhuIyReKH/fN1fen0fNWdLmv9NyLcoq/JvroJhAN76Qx/W3De7YgOB+a6j+HAMpI2KT5v/5Xt84V9nWI5x5cTQs2JKe0UGvxLVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736434733; c=relaxed/simple;
	bh=CDsK2ol5aehDfnV6LhUEdFF8jxR9hEEyAE1pkOvdgKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WJF48pSAl7iLjlUH5ZuWS/rakDwO0sFB9ochLMuSFFr1aTXypf1v/4ZoDr6HqGEJCSg1fBqCQ3t/fQQdKsjiGC9UpGGo0Wr34nsZgoDwwUIZfkyzKYJ4cP/PPnClplK33owSGjdl1CG1nfq0svK2F8LCHfaNmJFOoJjrgMfjhtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ma/QunMp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A653C4CED2;
	Thu,  9 Jan 2025 14:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736434732;
	bh=CDsK2ol5aehDfnV6LhUEdFF8jxR9hEEyAE1pkOvdgKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ma/QunMp+TxfyjG7kYIat0v+nwIrJiXDuzHweK/wmV3e35j0Vy8lGffSuz+cyCKxR
	 lW/kFpkkwVqR/fNWbzbYmkgBJqexTSV/fNci9lWL7fyR+zGcoMJ5msQwM6WuUawEaM
	 z/ulF/mihe2Ta6ap+yY55zE/dS4jJM67DiBvsSxXLDzVMctB6l7IW0A2dJhNgVdJzL
	 lnRd783/0J8gddL0e7kiIC5OS1lrE+VLi0EVSEMd5xkbXsxFMQ8bdN5yGpGk+hrRw3
	 fe4v6T/j/m+0d7S22X8P3tiv0EO/nIQVM9MxPAhfpL0I8palBIZNCT4hAW+336UIX6
	 VIus/r05CoK2A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tVtzo-000000007tf-2gk4;
	Thu, 09 Jan 2025 15:58:53 +0100
Date: Thu, 9 Jan 2025 15:58:52 +0100
From: Johan Hovold <johan@kernel.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Jianhua Lu <lujianhua000@gmail.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Vedang Nagar <quic_vnagar@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v9 00/28] Qualcomm iris video decoder driver
Message-ID: <Z3_kLJ6Oy6m9D_wU@hovoldconsulting.com>
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>

[ +CC: Bjorn ]

On Thu, Dec 12, 2024 at 05:21:22PM +0530, Dikshita Agarwal wrote:
> Introduce support for Qualcomm new video acceleration hardware i.e. 
> iris, used for video stream decoding.

> Note: A harmless onetime error log "Lucid PLL latch failed. Output may
> be unstable!" is seen during bootup.  It doesn't impact any video 
> usecase and is currently under discussion.

This could be an indication that some resources are not described
correctly and could potentially require both binding and driver changes
to address.

This is also something which could cause trouble later (e.g. during
suspend) even if you manage to get the clock running after boot.

Generally, you should not be introducing any new warnings; they are
there to let you know that something is wrong.

Where is this issue being discussed?

I think we at least need a public analysis and understanding of the
problem before merging this.

> Dikshita Agarwal (18):
>       dt-bindings: media: Add video support for QCOM SM8550 SoC

Could you please post the DT changes required for sm8550 so that people
can test this series more easily? You can do it in a separate series if
you prefer (with a link to this series in the cover letter) or as part
of this one (at the end, with a note saying that those changes should go
through the qcom SoC tree).

>       media: iris: add platform driver for iris video device
>       media: iris: implement iris v4l2 file ops
>       media: iris: introduce iris core state management with shared queues
>       media: iris: implement video firmware load/unload
>       media: iris: implement boot sequence of the firmware
>       media: iris: introduce host firmware interface with necessary hooks
>       media: iris: implement power management
>       media: iris: implement reqbuf ioctl with vb2_queue_setup
>       media: iris: implement iris v4l2_ctrl_ops
>       media: iris: implement vb2 streaming ops
>       media: iris: allocate, initialize and queue internal buffers
>       media: iris: implement vb2 ops for buf_queue and firmware response
>       media: iris: add support for dynamic resolution change
>       media: iris: handle streamoff/on from client in dynamic resolution change
>       media: iris: add support for drain sequence
>       media: iris: enable video driver probe of SM8250 SoC

You should also say something in the cover letter about sm8250 now being
supported by two mainline drivers and how you propose to handle that
conflict.

>       media: MAINTAINERS: add Qualcomm iris video accelerator driver

Johan

