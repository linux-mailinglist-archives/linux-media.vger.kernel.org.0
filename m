Return-Path: <linux-media+bounces-29660-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3C3A8134C
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 19:13:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7F131BA6E48
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 17:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3713235C16;
	Tue,  8 Apr 2025 17:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="N+LYhooy"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473AE1B422A;
	Tue,  8 Apr 2025 17:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744132391; cv=none; b=ORWWns6G1RHFh5AwqrRECiapuurwusaKUTVEIkZdAEhtSWVzkOPg7VN9CwC8eMMmc8RkqwfEsCuHUkyaQ0S8sT/rlNCiiEC2sKeSAy6pyMqX8mxeP/mXFpMvRFTAuF0mL2wQwTCcL9v0LkSx1Ui3AFqR//xaC8mo1kzVSbRK9nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744132391; c=relaxed/simple;
	bh=ZmKKaF88TDW5BhsqNDRVpPFhYgW4wUtMCyjmNc6OQI4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NK+Kz/dWd4opJIlBFrEhl4FX2FPBIv5fx5dZVdKBmyjVJooaa/1CYoYn5TQoE21JnPpP4cRMHX+wtjS99JuNNCGV9GkQKgeEuNm9neF6aA5IpryoTyX6q0bb1ndcm0vEuXflE0SeX/28IVWBVvqsZTx8t3ALWOMjT7mWjZ70IMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=N+LYhooy; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744132387;
	bh=ZmKKaF88TDW5BhsqNDRVpPFhYgW4wUtMCyjmNc6OQI4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=N+LYhooyQkLc4kOLhP8SJHaiNWekPAzmDrAUOC36on+9cwi20BvQRvfQNKoQnvJgI
	 brR9vh2Y284w75RfWBCOWMaX5WSR4e7QM8tw1fAPVkqXKRFlTLP4E/aRJuSZTUM/hD
	 KHqw85ddoinhSpHsfdKMdo3Eof1MFPCGSpqhwS19I8yK1aMeq4V1gO/GgNoOH9bv6F
	 SLmwTeshxovOM25iBuDnKwEIhSl+X1cvaNET0pDIs+Cgl7XqTIj+ddkgZCJT8LaebE
	 h+3EJfn5y1A1plsZKqLCBOSoaWFENw+mgTBvw0Ac+FlFAfQFhcdl39Uco78WlELXWq
	 VOHuyrr4Yti2g==
Received: from [IPv6:2606:6d00:11:e976::5ac] (unknown [IPv6:2606:6d00:11:e976::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 87EC617E07FD;
	Tue,  8 Apr 2025 19:13:05 +0200 (CEST)
Message-ID: <af5275a0017bc802379ee63df23fcafd44c8c285.camel@collabora.com>
Subject: Re: [PATCH v7 09/12] media: rkvdec: Add get_image_fmt ops
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Fricke	
 <sebastian.fricke@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boris Brezillon	
 <boris.brezillon@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, Mauro
 Carvalho Chehab <mchehab+huawei@kernel.org>, Alex Bee
 <knaerzche@gmail.com>, Benjamin Gaignard	
 <benjamin.gaignard@collabora.com>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Christopher Obbard
 <christopher.obbard@linaro.org>
Date: Tue, 08 Apr 2025 13:13:03 -0400
In-Reply-To: <5cd6e8d3-fa51-4225-a3b8-9727cfd95062@xs4all.nl>
References: 
	<20250225-rkvdec_h264_high10_and_422_support-v7-0-7992a68a4910@collabora.com>
	 <20250225-rkvdec_h264_high10_and_422_support-v7-9-7992a68a4910@collabora.com>
	 <e6b99109-bd35-46ff-a4e2-eb69b549dcbc@xs4all.nl>
	 <77bdada5dce991842e377759c8e173ada115694f.camel@collabora.com>
	 <47c0011f-693d-4c94-8a1b-f0174f3d5b89@xs4all.nl>
	 <19a11d429d9078b82f27e108aa5ac80cc4041bef.camel@collabora.com>
	 <35d34100-7013-4acb-a5a6-3408e0f45d9d@xs4all.nl>
	 <1747c9d2f653a07418422157f4b1613246f39a6c.camel@collabora.com>
	 <5cd6e8d3-fa51-4225-a3b8-9727cfd95062@xs4all.nl>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

(just trimmed a bit)

Le mardi 08 avril 2025 à 16:32 +0200, Hans Verkuil a écrit :
> So can we agree on the following (I think):
> 
> 1) rkvdec_try_ctrl no longer checks the image_fmt. Effectively this means that there
>    is no longer any need to change rkvdec_try_ctrl in this patch.

Correct.

> 
> 2) in rkvdec_s_ctrl we do the image_fmt check: if it changes, but vb2_is_busy is true,
>    then return -EBUSY, otherwise call rkvdec_reset_decoded_fmt(). This code is specific
>    for V4L2_CID_STATELESS_H264_SPS, so just make sure it is under an if/switch for that
>    control ID.

Correct. In practice, the IOCTL implementation function will be renamed
to what Jonas proposed (translated to s_ctrl instead of try), with some
name like s_sps_ctrl() (can't remember exactly). This is because
upcoming HEVC will endup sharing this code. Its going to be 1 control
per codec that supports 10bit.

> 
> 3) I'll see if I can make a patch to clarify in the control documentation that setting
>    it can change the format.

Thanks.

> 
> 4) I'll make a patch for the cedrus driver as well to align with the approach in rkvdec.

Thank you ! Glad we got to the bottom of it. As for rkvdec TODO, I will
prepare an upstaging patch series, and fix anything needed.

Nicolas

