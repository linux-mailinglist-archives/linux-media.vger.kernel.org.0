Return-Path: <linux-media+bounces-41987-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CEFB48BCB
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 13:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 379797A9933
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 11:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4403F2FFDE6;
	Mon,  8 Sep 2025 11:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ICFLdQcg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975282FABE0;
	Mon,  8 Sep 2025 11:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757329996; cv=none; b=ZYgZTKy1FhzZhY/nbOL5jyb093QpMY0VmwpWz68pxVROj3NoVLUbYMQ153THLwFrysxqc4jLm8QTB60kGA44PajM0azKOA+6PzY+oEvLCMX53e9lA2qmILJ6TlS/VWOy1oK4dO5/iVDA3Uq/kZWf8eoYwBcXHMG98RqDcEIuMx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757329996; c=relaxed/simple;
	bh=Rw9lNLLlfPTsTBLvU6SvNnKjqnHLv9hWI1wiPsPaXlg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=btk3f6CltxKHNNasVEf2oiqO/hAy6lBUI7PrAHVnTWbKHQ++lxyGOzXWtEnwubkkvdE26UoqFZ4c4trVIfCL9vjiZocG13pT5DwcvpL3fnAZbTnqBws4QbgZnm89ReLjRj3gOBMQek3+f7mk+H0hCkPRyHpFjmuXSorYqPI/GTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ICFLdQcg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FDCEC4CEF1;
	Mon,  8 Sep 2025 11:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757329995;
	bh=Rw9lNLLlfPTsTBLvU6SvNnKjqnHLv9hWI1wiPsPaXlg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ICFLdQcgCK2xw32GAESuFUaoMaEqH56tH4zKK+2pdHPyvrHGS0AU0IAGyqW6fyidk
	 gbT8gK7kizB7ANGvnM/u/teXNc/E21Gn6GM2FQVB/AXxoWW4Vuiya+NRapGI9MFGc9
	 1mnCEad1A4CBlcLOEsTkYov7whc5/+5JpKHvEypJiM3QD/BbIO8KQ8cOqzLd4q17NE
	 Ooz7FHr4c14OJDoOy2utlaxkUZjLu9NhMM444bkrpd81BV40EaLRqsdWpLhqV2KoaR
	 YElJT6xvpus53SgMG0cvb194l4AL6ubpr0HRNNWiK6ToBwhyQEuqmND3h+oERCsciE
	 Ha4nmH2FY5NIw==
Message-ID: <ad339c1d-bdf9-44f5-8f83-e3bbbad38e4c@kernel.org>
Date: Mon, 8 Sep 2025 13:13:11 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] media: uvcvideo: Add support for
 UVC_CROSXU_CONTROL_IQ_PROFILE
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250818-uvc-iq-switch-v1-0-f7ea5e740ddd@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250818-uvc-iq-switch-v1-0-f7ea5e740ddd@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 18-Aug-25 22:15, Ricardo Ribalda wrote:
> Add support for switching the IQ profile of a ChromeOS camera.
> 
> This patchset depends on 2 patches in uvc/for-next:
> - media: uvcvideo: Fix comments in uvc_meta_detect_msxu
> - media: uvcvideo: Move MSXU_CONTROL_METADATA definition to header
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Laurent Pinchart (1):
>       media: uvcvideo: Move MSXU_CONTROL_METADATA definition to header
> 
> Ricardo Ribalda (3):
>       media: uvcvideo: Fix comments in uvc_meta_detect_msxu
>       media: uvcvideo: Run uvc_ctrl_init_ctrl for all controls
>       media: uvcvideo: Support UVC_CROSXU_CONTROL_IQ_PROFILE
> 
>  drivers/media/usb/uvc/uvc_ctrl.c     | 41 ++++++++++++++++++++++++++++--------
>  drivers/media/usb/uvc/uvc_metadata.c | 22 +++++++++++--------
>  include/linux/usb/uvc.h              | 22 +++++++++++++++++++
>  3 files changed, 67 insertions(+), 18 deletions(-)
> ---
> base-commit: 078f1a7eb48eef9b3cb78bcd2254356f3a332358
> change-id: 20250813-uvc-iq-switch-37f461657f95

Thank you for your patches.

I have merged patches 3-4 into:

https://gitlab.freedesktop.org/linux-media/users/uvc/-/commits/for-next/

and patches 1-2 are already there.

Regards,

Hans



