Return-Path: <linux-media+bounces-27969-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39807A599E3
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 16:24:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A3FF168C97
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 15:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0487D22DF9A;
	Mon, 10 Mar 2025 15:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IWFmDQtA"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D1722A4C3
	for <linux-media@vger.kernel.org>; Mon, 10 Mar 2025 15:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741620249; cv=none; b=d2CdODZnCWfXpuRZaCCbb7ZCnQSqoQOY5MeGzKJZVb2n0q1UjtvOelXguygrbm6vPFc2bU+D+GGcczsNFH+LINwjZLyW9DyLvvfx+ggkdD4i0n2Du7SAZVq3TnjT5qerNXmVe8G/ur2At62r6jKhCB3PnAUmdnWdVLxV4u49F28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741620249; c=relaxed/simple;
	bh=32ornFgYDzLX06VXtu/aitU/lwumH5Om/O2eqBU7m44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hx0Nr1QNV8q0YqG2i8446SeEPktgpVjt3cIreuA86QycUXKHpd2HH8z3dd3K+6/CyrvTsrXiOXk0s8JZPYIUG0FVKEmhYIwilaOcNaGSQlrfigvTQI2Vaj4bWR5RwtMR+bzG6cJpkr0NECdCPbDAX/9JMyUcS0nRugI4wHiD5A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IWFmDQtA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741620246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p/l8k+SbLwqAOBHFF4siM3ptx7x9gmuKHDcMneNXbJ8=;
	b=IWFmDQtA9os3tiJICPmJ1EjASe5a4eeKH7XkWYs/HhumnEjZWjA6K86XHcTvY9XIV1K/FV
	kfNHtqdsExE5DBV+GzQivXDiRnO96tO+jX1PsMFIzkcg/L39ZEPJRl1z+/eGIYxwYEB/uV
	geTApQMCQmuJVKl2Dm75g+ZWnpN/E80=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-OPXMUifmPAiYnIuvNeyTIQ-1; Mon, 10 Mar 2025 11:24:04 -0400
X-MC-Unique: OPXMUifmPAiYnIuvNeyTIQ-1
X-Mimecast-MFC-AGG-ID: OPXMUifmPAiYnIuvNeyTIQ_1741620243
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac2a113c5d8so73688566b.1
        for <linux-media@vger.kernel.org>; Mon, 10 Mar 2025 08:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741620243; x=1742225043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p/l8k+SbLwqAOBHFF4siM3ptx7x9gmuKHDcMneNXbJ8=;
        b=nIeHc3qN2vAfpolKnN5SItTE6jgORfux/OlhYmexL5fVLUXrWhKU5SaVZkc73VKdqy
         iockd8iGQNPfqZLvhj0+ep3CFvqAMe5woh/boYCQbZcAC4KUKSPCueFz44yb+69jZNiB
         p2cRAnGrSF1jjAool3bCvjr9w0gqXDuJFKVNKRcUDz7ir4trmX7rL0v2cYNX6UZI9BoX
         ur3vhSj+l7RFR+L9MclXhGSSnsoWMF8pS4uJWNjNJVY4pj145YmznLhLEMdiOfMbWz8k
         6DESvXkmPe2cMQED8dIfQ9nt6Ge2K5RMEAHywiGMHEcoc4OhO7J/XgLK0AvvHSU9iKkl
         WY6g==
X-Gm-Message-State: AOJu0YxfKpaXVdmPBWsOkAj8FKwHd/d82ia0Bo/DF+xBAleXkX49hPs0
	2zsHa1x0lToWlMrfKmdU02zDFhZJylJgCWwYSw9cDJKeZhag6epD+NV7mqTS+rZMWVectpIiCwh
	UzXgR7iqQ+Zc+mQVvOZpOxNNGGcF+WU0+TaZpVQrB7mM+n0mPn6fWMG+VGJ6S
X-Gm-Gg: ASbGncu2FmmKmFIe3juBkGsb0nsQv015uE3Nh0fHzyrZZ+RahOxTmFea/Xk8hEk7qVW
	dDIGcNKwnk6gqGpV8iz6p6SYz60Efod/iAAlcQjN6yLzeRlq8BXHc3vaPkMa8fAMsWfoBIV07On
	t7gg+dFFkt/lvDgphsHb0eczcXzHSYDh9GBw6ykMkQvitgHMWNjALr+0C5er6hUb8OverGv9j4L
	Emj8rwq5U3uufy6JdcBCzW7BOiS+mNonDP+pHGutCRJNe4pr0v2AwDFORwrGcceTpaza1VPbvII
	VpwgJoFvuqUHHVK78II=
X-Received: by 2002:a05:6402:50c9:b0:5dc:80ba:dda1 with SMTP id 4fb4d7f45d1cf-5e5e22bda31mr32394023a12.9.1741620242788;
        Mon, 10 Mar 2025 08:24:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGWJp4OmWENK0TghYc6B4IScukYdvpFNY++I6ScXPdNyaiXupqiZztXxu64W0DqJ0roLTpng==
X-Received: by 2002:a05:6402:50c9:b0:5dc:80ba:dda1 with SMTP id 4fb4d7f45d1cf-5e5e22bda31mr32393964a12.9.1741620242392;
        Mon, 10 Mar 2025 08:24:02 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c74aa96bsm7091793a12.48.2025.03.10.08.24.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 08:24:01 -0700 (PDT)
Message-ID: <cf81d1e8-3378-463f-948b-6c894e73a1b0@redhat.com>
Date: Mon, 10 Mar 2025 16:24:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] media: uvcvideo: Implement Granular Power Saving
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
References: <20250303-uvc-granpower-ng-v5-0-a3dfbe29fe91@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250303-uvc-granpower-ng-v5-0-a3dfbe29fe91@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 3-Mar-25 20:13, Ricardo Ribalda wrote:
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
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Changes in v5:
> - Improve "media: uvcvideo: Make power management granular" commit
>   message.
> - Link to v4: https://lore.kernel.org/r/20250226-uvc-granpower-ng-v4-0-3ec9be906048@chromium.org

Thank you for the new version.

I've merge the entire series into:
https://gitlab.freedesktop.org/linux-media/users/uvc/ -next now.

Regards,

Hans





> Changes in v4:
> - CodeStyle
> - Create uvc_pm_ functions
> - Link to v3: https://lore.kernel.org/r/20250206-uvc-granpower-ng-v3-0-32d0d7b0c5d8@chromium.org
> 
> Changes in v3:
> - Fix build error on sh4.
> - Link to v2: https://lore.kernel.org/r/20250203-uvc-granpower-ng-v2-0-bef4b55e7b67@chromium.org
> 
> Changes in v2:
> - Add missing semicolon.
> - Rebase on top of media-committers/next
> - Link to v1: https://lore.kernel.org/r/20241126-uvc-granpower-ng-v1-0-6312bf26549c@chromium.org
> 
> ---
> Ricardo Ribalda (5):
>       media: uvcvideo: Keep streaming state in the file handle
>       media: uvcvideo: Create uvc_pm_(get|put) functions
>       media: uvcvideo: Increase/decrease the PM counter per IOCTL
>       media: uvcvideo: Make power management granular
>       media: uvcvideo: Do not turn on the camera for some ioctls
> 
>  drivers/media/usb/uvc/uvc_ctrl.c | 13 +++++-
>  drivers/media/usb/uvc/uvc_v4l2.c | 99 ++++++++++++++++++++++++++++++----------
>  drivers/media/usb/uvc/uvcvideo.h |  6 +++
>  3 files changed, 92 insertions(+), 26 deletions(-)
> ---
> base-commit: d98e9213a768a3cc3a99f5e1abe09ad3baff2104
> change-id: 20241126-uvc-granpower-ng-069185a6d474
> 
> Best regards,


