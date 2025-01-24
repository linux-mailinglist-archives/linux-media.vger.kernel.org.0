Return-Path: <linux-media+bounces-25255-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B63A1B167
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 09:10:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33C5616BCA9
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2025 08:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC651DCB2D;
	Fri, 24 Jan 2025 08:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VFNpuCHQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746FD1DC19F;
	Fri, 24 Jan 2025 08:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737706183; cv=none; b=XpZIcjQiyZy2vY7DghbpKFSfYro/uBlsQAAUK6r4IjnSJx+g+oGZ+ZJ13sPsswdDG7cx3HGkZ/MxSCRhIqLFYNfS4EfgxuCeAC7qAtQkeKaHPHUwP22LaHmvp7MH8fORMtYLFRstcIVzbRefcGN/dJgcEgacc5vGSWukPUO+YLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737706183; c=relaxed/simple;
	bh=nyCibKyLzE7z5VYrssegacxkS3AYtcv+l9TditRtsXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aruk8DlQBvZSTWR60Wf89AtxUZvbWLKNSJrWh+aFJNHtJ7xU0usWvFkq2JSRQ3aJwBlo5ZY3qhTYXpAtv/MN10Sg2UE65pVEFhe4J5xSzkcPPDXnwuIo12TpjTx3UrAkKYKdQyaZ0DQWCohE6gT8qJrP76BkLOMMnhKLmWjA+GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VFNpuCHQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FA7FC4CEE3;
	Fri, 24 Jan 2025 08:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737706182;
	bh=nyCibKyLzE7z5VYrssegacxkS3AYtcv+l9TditRtsXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VFNpuCHQFi2ITQ/SFTIF6lHsOG84Xe+pDu33HqhqenxnwCfEo2LVrFjv7iUZJEXZ/
	 Vo0G3U/6K248WVlv4mP7NeiIoD9dmvCYfSnT+dMnWoD/vD+Slkgxkau7t7Ll7LF/tV
	 uzDE3J+thave1aY+s6IjT0SMal7my3ZPZGlkgE3UGwwo9MIHzektHy7jwP8ZKrUlk1
	 A/TzJANBL2Yq0h+pl13dgc6YRcmW4hU3MdgFAtn6Cp/TChH6noEDlSh0x6EEFwzUNK
	 k15W4pqiq0YrZhHJVIA0qK61LazHc0md++kr1JRWo4siQbol8N94K94dxn84OxduZ9
	 qMgC79g8nBsQA==
Date: Fri, 24 Jan 2025 09:09:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	hverkuil-cisco@xs4all.nl, laurent.pinchart+renesas@ideasonboard.com, robh@kernel.org, 
	krzk+dt@kernel.org, bryan.odonoghue@linaro.org, laurentiu.palcu@nxp.com, 
	robert.chiras@nxp.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	LnxRevLi@nxp.com, kieran.bingham@ideasonboard.com, hdegoede@redhat.com, 
	dave.stevenson@raspberrypi.com, mike.rudenko@gmail.com, alain.volmat@foss.st.com, 
	devicetree@vger.kernel.org, conor+dt@kernel.org, alexander.stein@ew.tq-group.com, 
	umang.jain@ideasonboard.com, zhi.mao@mediatek.com, festevam@denx.de, 
	julien.vuillaumier@nxp.com, alice.yuan@nxp.com
Subject: Re: [PATCH v3 4/4] media: ox05b1s: Add support for Omnivision
 OS08A20 raw sensor
Message-ID: <20250124-bizarre-cherry-mayfly-9f2bce@krzk-bin>
References: <20250124001243.446511-1-mirela.rabulea@nxp.com>
 <20250124001243.446511-5-mirela.rabulea@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250124001243.446511-5-mirela.rabulea@nxp.com>

On Fri, Jan 24, 2025 at 02:12:43AM +0200, Mirela Rabulea wrote:
> @@ -758,6 +914,9 @@ static int ox05b1s_read_chip_id(struct ox05b1s *sensor)
>  	}
>  
>  	switch (chip_id) {
> +	case 0x530841:
> +		camera_name = "os08a20";
> +		break;

Ah, so here I see missing second device support.

It is still confusing to see that you use here some sort of
autodetection, but in the same time not.


>  	case 0x580542:
>  		camera_name = "ox05b1s";
>  		break;
> @@ -900,6 +1059,24 @@ static void ox05b1s_remove(struct i2c_client *client)
>  static DEFINE_RUNTIME_DEV_PM_OPS(ox05b1s_pm_ops, ox05b1s_runtime_suspend,
>  				 ox05b1s_runtime_resume, NULL);
>  
> +static const struct ox05b1s_plat_data os08a20_data = {
> +	.name			= "os08a20",
> +	.chip_id		= 0x530841,
> +	.native_width		= 3872, /* 16 dummy + 3840 active pixels + 16 dummy */
> +	.native_height		= 2192, /* 16 dummy + 2160 active lines + 16 dummy */
> +	.active_top		= 16,
> +	.active_left		= 16,
> +	.active_width		= 3840,
> +	.active_height		= 2160,
> +	.supported_modes	= os08a20_supported_modes,
> +	.default_mode_index	= 0,
> +	.supported_codes	= os08a20_supported_codes,
> +	.hdr_modes		= os08a20_hdr_modes,
> +	.hdr_modes_count	= ARRAY_SIZE(os08a20_hdr_modes),
> +	.set_hdr_mode		= os08a20_set_hdr_mode,
> +
> +};
> +
>  static const struct ox05b1s_plat_data ox05b1s_data = {
>  	.name			= "ox05b1s",
>  	.chip_id		= 0x580542,
> @@ -912,9 +1089,16 @@ static const struct ox05b1s_plat_data ox05b1s_data = {
>  	.supported_modes	= ox05b1s_supported_modes,
>  	.default_mode_index	= 0,
>  	.supported_codes	= ox05b1s_supported_codes,
> +	.hdr_modes		= NULL,
> +	.hdr_modes_count	= 0,
> +	.set_hdr_mode		= NULL,
>  };
>  
>  static const struct of_device_id ox05b1s_of_match[] = {
> +	{
> +		.compatible = "ovti,os08a20",
> +		.data = &os08a20_data,

And here static configuration of model, not autodetection.


Best regards,
Krzysztof


