Return-Path: <linux-media+bounces-22429-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4049E01E1
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 13:17:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A4C82848A2
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 12:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76971209664;
	Mon,  2 Dec 2024 12:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WA/Iaw4t"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6068C1FF61D
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 12:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733141435; cv=none; b=iMv5UM0d7SxPG1DRLWWvr8EiMTT5N1zlStk6Ls3XJA1AMAvB0bzOuq9mPkhlP5WJCoo6GIBlOMxCwZcH2WkM/HjRFMZ3MaioYFv5U8f/fpv0Dg/PmSY0HembofzpxiSlAoVUglWbndChqO7ciflMqx6ORWSI6Z2vqzWTjFD7GA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733141435; c=relaxed/simple;
	bh=W93w2iskkN4COyZsUX+DkNlu0dj+0ORm4iFu8L4bXPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BjRQNPGJptHGfMTM7+u2TwTDHV8mSvJtPiFmDjKJEDklQoAYyiC+siaEHL1bmKsMDU5n0AGVCVokF6/7JapJHpNzbaMXaljURX1gMJKvvwVQjKwdfo+RkEpsxmnk/0XylqwiTvISZQ18HnMzVr7O3y0azO6FnLTpzMcoVozFCJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WA/Iaw4t; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733141433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O6qY7PVOq5h194UrFoW4aw9ArzfwrvJdPz/Jk2VRoAs=;
	b=WA/Iaw4t981RpB9Goq87WAgUEFN/VprGi5yIfXA7Ntqnzb1Clq0zezZM6yGya1dPKHCU4i
	9TRxRPF0NvONU2sko4D27mwtbfkEYJxGy5d45Sqv9bZyiWY5YuOL5rRPP83uixLGorB+tt
	5U7osYHoWP0dlnFP8YOZOwxZMuvmJNI=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-438-5IUa6ByuNoq4dmimXDz84A-1; Mon, 02 Dec 2024 07:10:31 -0500
X-MC-Unique: 5IUa6ByuNoq4dmimXDz84A-1
X-Mimecast-MFC-AGG-ID: 5IUa6ByuNoq4dmimXDz84A
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-53de4ff5b64so2516419e87.1
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 04:10:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733141429; x=1733746229;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O6qY7PVOq5h194UrFoW4aw9ArzfwrvJdPz/Jk2VRoAs=;
        b=SRAGKYvDgLYRfvkNsBkpjA8C9fm1+uFPUecp8E5Uaff4tRQ3i434S481FsK3G73dsW
         K9hEpkV7dggv8Kqrhpii1E+Px0ua7CjJOX6zIDNaIp0absgBy2A92GSPGq1LbXQTfHqr
         x3Qd9b83CisuIO2NJP6YwLN+GZMwqlola1503zMjKD28cuQwJRv3DD5voj7+O+07hmEZ
         lMpB+aGMtzxY7ZHD9s+zfh+noHT7FkX1GylQFJ3d5HHIyAIJoJYWCnBhYsp8ZlhFVKKm
         1mqLuwel284fVp9Q+2ovr63vBb/Bnwpe6Yy6WnxlNNP8mQczzo1KXOOt7rRqQZcqHav9
         ay5Q==
X-Gm-Message-State: AOJu0YwciMgEQKuhLtATOdj2NWNYXnNN2rXLLgUgfU9EVT2zUp15zmhK
	YljK0xIH9DvCNCjc2N2KTpbUFxa293a4of656PXhaLLqyHjywPqKEkcitPZo2c5ToJWxi19/IOf
	MKc1e7Le5nK0ZU9unubdVmnAXVfhHhP6NP6TjNHfqtqjVB0YV+iFjL+MStGktKPRnxT11
X-Gm-Gg: ASbGnct7ydEBe8kGtn+DO5H55zkFGNIv8JdQf7mFTMKB+xt5hyszG3GDRakRiGVXyoN
	oPvTsKJl8AQ/p/mwXf16LssPzCSwczs89SVN6I0edscWU91tUrDaOv1pjyD4qDqz7Bi8X3JyYYe
	xjDK/YTwIcbAuNpwFxIRNCyGqhB0NdfLiaPF+fccHjUK/F3TLJWdEYKA2a71twqBMj+ws4TzG0X
	Z3jnNIM6tak95xDQ0jRG6tzNOOiqpJWxvQc1EOZbfNtwD/5xjkQUA==
X-Received: by 2002:a05:6512:39d2:b0:53d:ec9a:138f with SMTP id 2adb3069b0e04-53df0112687mr12242479e87.57.1733141428820;
        Mon, 02 Dec 2024 04:10:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8J8fjQi9JqmWpQBpvyAF2nP+kOTR9hNLINjX5y9jxd1A2CsOXHqU2sieZeV5EqjZWpXw19A==
X-Received: by 2002:a05:6512:39d2:b0:53d:ec9a:138f with SMTP id 2adb3069b0e04-53df0112687mr12242446e87.57.1733141428422;
        Mon, 02 Dec 2024 04:10:28 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c0e3csm501899166b.12.2024.12.02.04.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 04:10:27 -0800 (PST)
Message-ID: <42d06183-107e-4945-b83c-72be857c2067@redhat.com>
Date: Mon, 2 Dec 2024 13:10:27 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] media: uvcvideo: Implement Granular Power Saving
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, stable@vger.kernel.org
References: <20241126-uvc-granpower-ng-v1-0-6312bf26549c@chromium.org>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241126-uvc-granpower-ng-v1-0-6312bf26549c@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 26-Nov-24 5:18 PM, Ricardo Ribalda wrote:
> Right now we power-up the device when a user open() the device and we
> power it off when the last user close() the first video node.
> 
> This behaviour affects the power consumption of the device is multiple
> use cases, such as:
> - Polling the privacy gpio
> - udev probing the device
> 
> This patchset introduces a more granular power saving behaviour where
> the camera is only awaken when needed. It is compatible with
> asynchronous controls.
> 
> While developing this patchset, two bugs were found. The patchset has
> been developed so these fixes can be taken independently.

Thank you for your patch series. For now lets focus on fixing the
async-controls ctrl->handle setting / dangling ptr issue and then
we can look into the rest of this later (after we have also landed
the privacy GPIO and UVC 1.5 ROi series).

Regards,

Hans




> ---
> Ricardo Ribalda (9):
>       media: uvcvideo: Do not set an async control owned by other fh
>       media: uvcvideo: Remove dangling pointers
>       media: uvcvideo: Keep streaming state in the file handle
>       media: uvcvideo: Move usb_autopm_(get|put)_interface to status_get
>       media: uvcvideo: Add a uvc_status guard
>       media: uvcvideo: Increase/decrease the PM counter per IOCTL
>       media: uvcvideo: Make power management granular
>       media: uvcvideo: Do not turn on the camera for some ioctls
>       media: uvcvideo: Remove duplicated cap/out code
> 
>  drivers/media/usb/uvc/uvc_ctrl.c   |  52 +++++++++-
>  drivers/media/usb/uvc/uvc_status.c |  38 +++++++-
>  drivers/media/usb/uvc/uvc_v4l2.c   | 190 +++++++++++++++----------------------
>  drivers/media/usb/uvc/uvcvideo.h   |   6 ++
>  4 files changed, 166 insertions(+), 120 deletions(-)
> ---
> base-commit: 72ad4ff638047bbbdf3232178fea4bec1f429319
> change-id: 20241126-uvc-granpower-ng-069185a6d474
> 
> Best regards,


