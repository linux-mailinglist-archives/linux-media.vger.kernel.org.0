Return-Path: <linux-media+bounces-34827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D229ADA2BF
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 19:00:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B410316CDBE
	for <lists+linux-media@lfdr.de>; Sun, 15 Jun 2025 17:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5DA327AC3E;
	Sun, 15 Jun 2025 17:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="wT6PJ2kz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB19742A97
	for <linux-media@vger.kernel.org>; Sun, 15 Jun 2025 17:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750006815; cv=none; b=qmRnX8U0iE6v5GImqMq06is6CYirHUumi9NEgG3l64ua55e69vIQZWo7qzCQcZc1APLJE0kVqLenELoJl5/MtoupzX8ad+hTS4qm3EMwLKkA/sS3tMcML57C9t4gqV9oyDZnFGLRpLw9IV/CNoVnTW9mQaeLgOU8J8tUZvSPhnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750006815; c=relaxed/simple;
	bh=G0wXUY98yRU1ynKcxGXdppY7NcVQxF3noX16e9kLojw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nj9ezbd8k0tJE3NdQavDr93gNHcDwM2fMOVLW46C9co8LUtz11whM1lAX5BfZE8GWEytsD6TQn8dC0M1w2MXWCHdsX+7Mrn7j6BHKcoK+8KR2E1lIyhIgV4FD9yhJJhGqPbJiQkVb1Wq7ApCjg8Bnzrld8PcwiveDoTfb0omYg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=wT6PJ2kz; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1750006810; x=1750266010;
	bh=ormvHGHFQrwO9W0w9F5G7IIoMPICOUtE+2VM1NOOpik=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=wT6PJ2kz0B4FFzkghfpwEnMrbg0eiXsNywKct2Ijr0wHCMEbQbr44uO3Dx8KIeh6N
	 3vtzq3DTEKXkWwnvd2MvzC0xdfBCuMcgzvGMWFTN+kxDFtKKf5KHRxPKYL9EqCJWtM
	 3rDP2UV4jLYCFYmMnsp4C0Gw6oidsZvxQ9lfSf6BR4TYB2iNdiDKwz56hzWC3N2iGV
	 GpPlOphmz9Kzd1rCXs3zFLSvmV2+kI6B0HWDrvakIsWUhaROWuHXSkZyXoipWndi3z
	 oOxVWIUu+rFMTef0pFIVUzqehe5i3tiLGhJyQjBtmAnGMkD3+GccmK6xJhh3k1NObR
	 g9c39l97lytXw==
Date: Sun, 15 Jun 2025 17:00:05 +0000
To: linux-media@vger.kernel.org
From: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v4l-utils] qv4l2: Fix video capture being transparent on Wayland
Message-ID: <3429dcc4-bd65-4f51-aa0b-9aeb0f54f981@protonmail.com>
In-Reply-To: <20250614134354.674830-2-mavchatz@protonmail.com>
References: <20250614134354.674830-2-mavchatz@protonmail.com>
Feedback-ID: 20039310:user:proton
X-Pm-Message-ID: bb7b3d6122c54ff34d17ef388ecac1cef9cdac01
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2025-06-14 16:44, Mavroudis Chatzilazaridis wrote:
> When a non-alpha capture format is used, the default value of 0.0 causes
> the capture to be transparent.
>=20
> This issue is not apparent on X11 due to Qt not negotiating a format
> with alpha by default.
> ---
>   utils/qv4l2/capture-win-gl.cpp | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20

Sorry, I forgot to add the SoB.

Signed-off-by: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>


