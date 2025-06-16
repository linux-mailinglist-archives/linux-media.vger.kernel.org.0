Return-Path: <linux-media+bounces-34876-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B35ADABA6
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 11:19:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C9457A696F
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 09:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC25273811;
	Mon, 16 Jun 2025 09:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="csja2bDf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF211DB92A;
	Mon, 16 Jun 2025 09:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750065560; cv=none; b=p6d/mFC1O/GLUQEC1Unf82mlmyMi2oT74apJMd3zYZzdHYDRx2Kt+S3Y8LShdm68l0o4VOTVuSfQ+5CbUTQXPIzppfIl2xXs+gbU7qZNbY9YD37b7p0RhXXSS/Zi5k2LujaVpUiqIZYJZNcs88hPXLf7dn2dM1t7s/FQB5MAJGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750065560; c=relaxed/simple;
	bh=cIWgCue/aqvpSg/kLDSZwh6pFlaG1xIal/HdrKsv3tA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cOvmAWPn8YqSCLoJ9pOUIZmc8m9au6iSsuydMWmFmOGQfSlYN4GMOeU0nqjblaCfcOq5hgSw4c/ZzawrZoO0xwDkDyFjsuA6lcMdshnFfjQVIt9ei1msBewkrxwusPL+N0oUNDHIWyvPlPJYVcLyIps3+RaTqjss97K/TcA/5dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=csja2bDf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F7A5C4CEEE;
	Mon, 16 Jun 2025 09:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750065560;
	bh=cIWgCue/aqvpSg/kLDSZwh6pFlaG1xIal/HdrKsv3tA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=csja2bDfFVXwJHWt9Mv+cG/BZxIObuzgt1mBo5mgh8rbGQnTZx8gvAxRHHyOhFy0a
	 G0scb5aTnlGOrkoLj/IIqrQGA0N8ZaYJX9swYbqcetVA1INH/BO9MUSky41vA2KPGK
	 cKo+uLHW6PutUn58QN2K4C7n5nk69ibXq63hVOUr3jvP2KwxtVlfdKVtmiKG9IoKGL
	 jLBItFuxKDmT2/lFbLFNKef/lPKlPn3lH2Rbe3HAXNZEyGdGy8EwIIk/PiBup1CzU5
	 jwiHY3QOSItn6IStk4J0QihcCSTJm8VZI0T5Voic2AMx0PwPoBa6+CLR8vT8DddXsz
	 PRLn3slXKLQgw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uR5zo-000000005ZR-2jKu;
	Mon, 16 Jun 2025 11:19:17 +0200
Date: Mon, 16 Jun 2025 11:19:16 +0200
From: Johan Hovold <johan@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Depeng Shao <quic_depengs@quicinc.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH 2/2] media: qcom: camss: vfe: Fix registration sequencing
 bug
Message-ID: <aE_hlGHkRZqFFacR@hovoldconsulting.com>
References: <20250612-linux-next-25-05-30-daily-reviews-v1-0-88ba033a9a03@linaro.org>
 <20250612-linux-next-25-05-30-daily-reviews-v1-2-88ba033a9a03@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-linux-next-25-05-30-daily-reviews-v1-2-88ba033a9a03@linaro.org>

On Thu, Jun 12, 2025 at 09:07:16AM +0100, Bryan O'Donoghue wrote:
> msm_vfe_register_entities loops through each Raw Data Interface input line.
> For each loop we add video device with its associated pads.
> 
> Once a single /dev/video0 node has been populated it is possible for
> camss_find_sensor_pad to run. This routine scans through a list of media
> entities taking a pointer pad = media_entity->pad[0] and assuming that
> pointer is always valid.
> 
> It is possible for both the enumeration loop in msm_vfe_register_entities()
> and a call from user-space to run concurrently.
> 
> Adding some deliberate sleep code into the loop in
> msm_vfe_register_entities() and constructing a user-space program to open
> every /dev/videoX node in a tight continuous loop, quickly shows the
> following error.
> 
> [  691.074558] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000030
> [  691.074933] Call trace:
> [  691.074935]  camss_find_sensor_pad+0x74/0x114 [qcom_camss] (P)
> [  691.074946]  camss_get_pixel_clock+0x18/0x64 [qcom_camss]
> [  691.074956]  vfe_get+0xc0/0x54c [qcom_camss]
> [  691.074968]  vfe_set_power+0x58/0xf4c [qcom_camss]
> [  691.074978]  pipeline_pm_power_one+0x124/0x140 [videodev]
> [  691.074986]  pipeline_pm_power+0x70/0x100 [videodev]
> [  691.074992]  v4l2_pipeline_pm_use+0x54/0x90 [videodev]
> [  691.074998]  v4l2_pipeline_pm_get+0x14/0x20 [videodev]
> [  691.075005]  video_open+0x74/0xe0 [qcom_camss]
> [  691.075014]  v4l2_open+0xa8/0x124 [videodev]
> [  691.075021]  chrdev_open+0xb0/0x21c
> [  691.075031]  do_dentry_open+0x138/0x4c4
> [  691.075040]  vfs_open+0x2c/0xe8

> Taking the vfe->power_lock is not possible since
> v4l2_device_register_subdev takes the mdev->graph_lock. Later on fops->open
> takes the mdev->graph_lock followed by vfe_get() -> taking vfe->power_lock.
> 
> Introduce a simple enumeration_complete bool which is false initially and
> only set true once in our init routine after we complete enumeration.
> 
> If user-space tries to interact with the VFE before complete enumeration it
> will receive -EAGAIN.

As Vladimir also pointed out, this is at best just papering over the
issue.

You need to make sure the video device is not registered until it's
ready to be used. That is the bug that needs fixing.

Johan

