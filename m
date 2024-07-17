Return-Path: <linux-media+bounces-15070-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A8D93399E
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 11:06:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 853A92833E7
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 09:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5833BBFB;
	Wed, 17 Jul 2024 09:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RzmRRmDF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD5619A;
	Wed, 17 Jul 2024 09:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721207193; cv=none; b=MyEd/BWUWX+iksAU2GnPbN3D0jNTOWb+815J9VYWZevIpkZV4APW3TyAA75vqzgiPwv/YbnpDKVOtj4PXyOvIOSmmZYMkgllgUnTdSuB274jTg6wdXPsyYpLs3U+2nO4HvR0xOIQUR6fxjlR0Yhx/U6O2PsTb+K8ISyIJ/1ZHS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721207193; c=relaxed/simple;
	bh=aCkP98tzaPJDTU2f5HtwXZIffoFmGDNc1z4G6HVmcms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nS59uYZdz+u05UO975vY/A0ELkPbfV39+ukM9vKZbOMANnCwEgPRSIUgkq6I59GTfUP4xeCEETGw1wWmCuxraNsy+14H3yU8/fw8+asZcxq0A6+w+QPWlzXMPi3AvJ72KdW+dlH9UNIQqKrVaPwE/L0DyTdYcDHMzDRShHe3AYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RzmRRmDF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 646E1C32782;
	Wed, 17 Jul 2024 09:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721207192;
	bh=aCkP98tzaPJDTU2f5HtwXZIffoFmGDNc1z4G6HVmcms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RzmRRmDF4YQynkfQKi07+23BcK6iXtRGBnYGYhAAYB+5hphiTdVHwdmGegHHcBjVb
	 1hOlmRIOY3oQTR99bWCXwYr3McfsbbhgMHHl36+Ih1eTZrZLzTB0DBpoKJr4IdUxPz
	 yfG5oNcVDnwbjsDZkchCWq37Q1I6uVzaWwBq4nZRzprfb2Yl8dAsPOR7vyHJmdc5TP
	 FB0L/S+t1aXo7sTeO7NvvWvrG8FzUtkms5N/rGkIjWISZjITyo0b1DM+9/5dHJBjvn
	 dq8B1pn+7EJEdt+BH4yEaYKdG0xDpL0ab9iWI/pbtzjGXkgoJSHbIn7d0SqANbTFOV
	 l9iYnDrRR/AmA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sU0cL-000000002zQ-2EQz;
	Wed, 17 Jul 2024 11:06:34 +0200
Date: Wed, 17 Jul 2024 11:06:33 +0200
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
	Johan Hovold <johan+linaro@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: qcom: camss: Remove use_count guard in
 stop_streaming
Message-ID: <ZpeJmWTfZGUXsc7K@hovoldconsulting.com>
References: <20240716-linux-next-24-07-13-camss-fixes-v2-0-e60c9f6742f2@linaro.org>
 <20240716-linux-next-24-07-13-camss-fixes-v2-1-e60c9f6742f2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716-linux-next-24-07-13-camss-fixes-v2-1-e60c9f6742f2@linaro.org>

On Tue, Jul 16, 2024 at 11:13:24PM +0100, Bryan O'Donoghue wrote:
> The use_count check was introduced so that multiple concurrent Raw Data
> Interfaces RDIs could be driven by different virtual channels VCs on the
> CSIPHY input driving the video pipeline.
> 
> This is an invalid use of use_count though as use_count pertains to the
> number of times a video entity has been opened by user-space not the number
> of active streams.
> 
> If use_count and stream-on count don't agree then stop_streaming() will
> break as is currently the case and has become apparent when using CAMSS
> with libcamera's released softisp 0.3.
> 
> The use of use_count like this is a bit hacky and right now breaks regular
> usage of CAMSS for a single stream case. As an example the "qcam"
> application in libcamera will fail with an -EBUSY result on stream stop and
> cannot then subsequently be restarted.

No, stopping qcam results in the splat below, and then it cannot be
started again and any attempts to do so fails with -EBUSY.

> The kernel log for this fault looks like this:
> 
> [ 1265.509831] WARNING: CPU: 5 PID: 919 at drivers/media/common/videobuf2/videobuf2-core.c:2183 __vb2_queue_cancel+0x230/0x2c8 [videobuf2_common]
> ...
> [ 1265.510630] Call trace:
> [ 1265.510636]  __vb2_queue_cancel+0x230/0x2c8 [videobuf2_common]
> [ 1265.510648]  vb2_core_streamoff+0x24/0xcc [videobuf2_common]
> [ 1265.510660]  vb2_ioctl_streamoff+0x5c/0xa8 [videobuf2_v4l2]
> [ 1265.510673]  v4l_streamoff+0x24/0x30 [videodev]
> [ 1265.510707]  __video_do_ioctl+0x190/0x3f4 [videodev]
> [ 1265.510732]  video_usercopy+0x304/0x8c4 [videodev]
> [ 1265.510757]  video_ioctl2+0x18/0x34 [videodev]
> [ 1265.510782]  v4l2_ioctl+0x40/0x60 [videodev]
> ...
> [ 1265.510944] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 0 in active state
> [ 1265.511175] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 1 in active state
> [ 1265.511398] videobuf2_common: driver bug: stop_streaming operation is leaving buffer 2 in active st

Johan

