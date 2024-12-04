Return-Path: <linux-media+bounces-22625-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6848C9E3CE1
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 15:34:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 421CFB37FFF
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 14:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E52CB1F7594;
	Wed,  4 Dec 2024 14:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f5hAvNrl"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C1020ADD3
	for <linux-media@vger.kernel.org>; Wed,  4 Dec 2024 14:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733320843; cv=none; b=qNQ7RaCSNdy72ReeOLbbP8g2ZVHoE0uo8Yd/AGdwH/R+z6cwaLcHg4X3ud3AH3Kj2+k1hwLyE3MJEwm11GbWAk3m86tcQA0U+e47X/EvkYnJSWufVzqry/F29MbN6JAbzcfohlqOnbeCPvWb0vNTG3gsmpoBjOMQPoMeNGSEdp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733320843; c=relaxed/simple;
	bh=K5XkhdPpHqBscx9cuL2xc9SfulCNC53nfSWJYshtIgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n5D6L+zNfD3MpLXoecK6kOdq6dJj3zExKDG6ucIMYhMXUwiF4wcVgcOrF95053RuJNyV4JqH3nrPuQaC30A3/0uzPtM/DIcrydIxyqpbJ9V0LmCrnqv7kcGtICYY23rkMRuokRyX8ToaMBfrW0wwrV78eL1OhQVlGLVtuG1hR1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f5hAvNrl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733320839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pd0pcYkSUAXYAkPdvS5Z/9VshciCSve8tgQub98YvW4=;
	b=f5hAvNrlVbNr+U20z6sR1migQ/S5Td2OCqbvBo3HMoNddPFhoq/gwHEvuULIZ1s4lIhxv1
	rgC7c/4T9qfIVZ/6ktY6+wJLBoXSr2B/cv2qAEXo1mdFDRRIF4MHYPZOYvIDY1ycj+SPxB
	plE/GOcVFa/g9to+jLqCrCIRqbDDlLA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-itSrUR6pOdyupc4GZsAqcg-1; Wed, 04 Dec 2024 09:00:38 -0500
X-MC-Unique: itSrUR6pOdyupc4GZsAqcg-1
X-Mimecast-MFC-AGG-ID: itSrUR6pOdyupc4GZsAqcg
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5d0c8ba49bfso4340594a12.2
        for <linux-media@vger.kernel.org>; Wed, 04 Dec 2024 06:00:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733320837; x=1733925637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pd0pcYkSUAXYAkPdvS5Z/9VshciCSve8tgQub98YvW4=;
        b=saSWiYo8iRJNkR2qufa/HM4BDtYXChsfdKwrk7glD6/5KsPgMcn0sX71XfDrIx430b
         5Oq4+0g+adLzxG0zITmID0ePWi9f0/Ct/z7LPw3L1SxzWOOTfk4c03TCR5mTme4i3BSf
         /r8kUppBVUljPShd/YHaH6UKZtwq5589xVsOy8jQ1qu3FsZHzCo5xTzO6SQJC0/AeOoP
         LOk8EwCZGg6eayrqiL9pqbKjydnVKuXvuToZX66tTpJPCM3TO8QOJTe8cN/t+2E96o48
         XNA+OYMcz0p2TNQ132dixBI8NzD1ERKbzU/OXRFT1ajxE67sOSbopUdl7X/NHgqAllJR
         iJ8w==
X-Forwarded-Encrypted: i=1; AJvYcCXJ+Pt7MtQzUiWBhbTkABGMUkG05NAHVOt5jg733YswUoIxN4Di5elLMO8aQNmKJBwj7CyUmwR0LXAoXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwK98jF+GuRZpP13rOlmxquqv41/gcIagwiK+j70YUUQYvfO+Yh
	R16OXmPNQuOvJLboOaNDlP7PSVrEp7Jf7BESqn3jyoKlEWyJnTXsEOuZ1LQaEiwIHbMocqp6Lsx
	/Ws3zrKqfCTtMc7wT9vIsu4c08sa+SUKfTm356QTRsGWEAbnBQQhjbVotGcL4
X-Gm-Gg: ASbGncvhEEkEIaXApxvudNXvPxCVBcKF3LASFBiXjpisWnb35HBMLU+tSKwWPLSOTv6
	pThrQ85PfwmX6bnjwwTi4T6zYf0rWYcbVfzdLlxnWdA3q3lNoGgsUmWxVKCQYU7gpy4ED5Q0Ss1
	rwlkd5RLYZV0WeYaBoP24YuUGy0u+XI5ajWqKON1tkjjGxt4EarK+yxMA3pcePbj8LkPSsrn2vu
	48HeD7cVw9YhEeyQpBWLVH9xD0ptr9eV3e3EnZFP8NtWeecMfiRqSdYBkacmc80jp4qlENo/7jb
	5piERXm/ExwXtx6ezRMC51aw4QEkuSQoCxkx8rdLrbB09E5SIZZlEGOZ3WtZt1DLZ5hW6OX2AXn
	bIFAtCH8eRhHVVfpElrMeqLro
X-Received: by 2002:a05:6402:270c:b0:5d0:d311:dd4 with SMTP id 4fb4d7f45d1cf-5d10cb81b94mr6097156a12.22.1733320837044;
        Wed, 04 Dec 2024 06:00:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFeZUJPH3qksYgzj+j2Ik055uUV0znVH3V1OqEMo7YPDSZPvLXpT2JePuXn1yrYMCeFxYxLZA==
X-Received: by 2002:a05:6402:270c:b0:5d0:d311:dd4 with SMTP id 4fb4d7f45d1cf-5d10cb81b94mr6097102a12.22.1733320836460;
        Wed, 04 Dec 2024 06:00:36 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d0e75a2315sm3767619a12.39.2024.12.04.06.00.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 06:00:35 -0800 (PST)
Message-ID: <b982d20d-2f34-492e-8910-dfaf3adde552@redhat.com>
Date: Wed, 4 Dec 2024 15:00:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add missing file entries for the USB video
 class driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20241117213833.22952-1-laurent.pinchart@ideasonboard.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241117213833.22952-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 17-Nov-24 10:38 PM, Laurent Pinchart wrote:
> The USB video class driver is missing a few F: entries for files related
> to the driver that have been added to the kernel over the years. Add
> them.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  MAINTAINERS | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f65f00392789..af018330f6fd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24076,7 +24076,11 @@ L:	linux-media@vger.kernel.org
>  S:	Maintained
>  W:	http://www.ideasonboard.org/uvc/
>  T:	git git://linuxtv.org/media_tree.git
> +F:	Documentation/userspace-api/media/drivers/uvcvideo.rst
> +F:	Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> +F:	drivers/media/common/uvc.c
>  F:	drivers/media/usb/uvc/
> +F:	include/linux/usb/uvc.h
>  F:	include/uapi/linux/uvcvideo.h
>  
>  USB WEBCAM GADGET
> 
> base-commit: 5516200c466f92954551406ea641376963c43a92


