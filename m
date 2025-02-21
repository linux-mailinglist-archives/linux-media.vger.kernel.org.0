Return-Path: <linux-media+bounces-26579-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C45DAA3F433
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 13:27:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DD17176B82
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 12:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1078320AF74;
	Fri, 21 Feb 2025 12:27:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AE5209F2E;
	Fri, 21 Feb 2025 12:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740140841; cv=none; b=dqBhHsbBvEtnhlBJ0k8Y+PQEDvw7HUujpxx0Qgyol9+oSAS9GerwZY+KiO9q4tIYWL2XIK2t+2foaKDx5DX71AnoOoXreOGxZuROjlTtxCRwDm7xBJ9qSCNRboafeNry25/bOLfUXxZhJpfLoeiuuOxSbFkUfrncDbGiX/TDGHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740140841; c=relaxed/simple;
	bh=lZoHxOGcfy3q2OL6Eli0jg/KBp4T/ELGKhLw5xt4kgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WBVTHE6DwwKyT+7iyDCNBQ9dMy2RM+wCOvcb9YidcRp3FM09pHEP50rh4IwfCAwRn8EtstbEE+tTgLvGlnOdJnW9RcXPKcoq8Ba7JkIr15ovAh8nP5aIxGceNn8QQ6Gbni+JJrjS5vJ4VMn15DcplIywQ53xURRCv8TqT7kl4io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D893DC4CED6;
	Fri, 21 Feb 2025 12:27:18 +0000 (UTC)
Message-ID: <310e5f92-e4d9-4127-afff-9566ba8a075e@xs4all.nl>
Date: Fri, 21 Feb 2025 13:27:17 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] media: Remove vidioc_g/s_ctrl and
 vidioc_queryctrl callbacks
To: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Mike Isely <isely@pobox.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20241210-queryctrl-v2-0-c0a33d69f416@chromium.org>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20241210-queryctrl-v2-0-c0a33d69f416@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/12/2024 10:28, Ricardo Ribalda wrote:
> Most of the drivers use the control framework or can use the superset
> version of these callbacks: vidioc_g/s_ext_ctrl and
> vidioc_query_ext_ctrl.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Changes in v2:
> - v4l2_query_ext_ctrl_to_v4l2_queryctrl
> - Fix conversion (Thanks Hans)
> - Link to v1: https://lore.kernel.org/r/20241209-queryctrl-v1-0-deff7acfcdcb@chromium.org
> 
> ---
> Ricardo Ribalda (11):
>       media: ioctl: Simulate v4l2_queryctrl with v4l2_query_ext_ctrl
>       media: pvrusb2: Convert queryctrl to query_ext_ctrl
>       media: pvrusb2: Remove g/s_ctrl callbacks
>       media: uvcvideo: Remove vidioc_queryctrl
>       media: atomisp: Replace queryctrl with query_ext_ctrl
>       media: atomisp: Remove vidioc_g/s callback
>       media: v4l2: Remove vidioc_queryctrl callback
>       media: v4l2: Remove vidioc_g_ctrl callback
>       media: cx231xx: Replace s_ctrl with s_ext_ctrls
>       media: v4l2: Remove vidioc_s_ctrl callback
>       media: v4l2-core: Introduce v4l2_query_ext_ctrl_to_v4l2_queryctrl
> 
>  drivers/media/usb/cx231xx/cx231xx-417.c           | 21 ++++++----
>  drivers/media/usb/pvrusb2/pvrusb2-v4l2.c          | 40 ++++--------------
>  drivers/media/usb/uvc/uvc_v4l2.c                  | 10 -----
>  drivers/media/v4l2-core/v4l2-ctrls-api.c          | 51 +++++++++++++----------
>  drivers/media/v4l2-core/v4l2-dev.c                |  6 +--
>  drivers/media/v4l2-core/v4l2-ioctl.c              | 19 +++++----
>  drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 35 ++++++++--------
>  include/media/v4l2-ctrls.h                        | 12 ++++++
>  include/media/v4l2-ioctl.h                        | 12 ------
>  9 files changed, 97 insertions(+), 109 deletions(-)
> ---
> base-commit: 6c10d1adae82e1c8da16e7ebd2320e69f20b9d6f
> change-id: 20241209-queryctrl-5c3632b7c857
> 
> Best regards,

$ git grep vidioc_s_ctrl
drivers/media/radio/radio-wl1273.c:static int wl1273_fm_vidioc_s_ctrl(struct v4l2_ctrl *ctrl)
drivers/media/radio/radio-wl1273.c:     .s_ctrl = wl1273_fm_vidioc_s_ctrl,

Now that s_ctrl is the callback of the control handler ops, but
I think it is wise if you add a patch that renames wl1273_fm_vidioc_s_ctrl to wl1273_fm_s_ctrl.

Just so the string 'vidioc_s_ctrl' no longer exists in the code base.
Besides, it isn't the correct name of this function anyway. It's clearly a left-over
from the past.

Regards,

	Hans

