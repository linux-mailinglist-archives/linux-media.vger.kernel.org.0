Return-Path: <linux-media+bounces-23734-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B539F6FBA
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 22:53:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 597021893AA1
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 21:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E732B1FCCFB;
	Wed, 18 Dec 2024 21:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bx9CozAa"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DDE1FC102
	for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 21:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734558781; cv=none; b=QyI00tQiXVAobLFnwiQ/frLs+TLrkk89KfAWdQQYvvhL0wMcL2oh7f1bJYuyiIPzGQR0Ch+g9GWrqwKupvaIWPpZxOBLKeN20+wweg2WIalGkUxJ7byntm65RmCD2vWHK/Kdt2JTfuhCs2+oSdfAj60pS188OTCHlTmlPWxVVyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734558781; c=relaxed/simple;
	bh=8BHgIHW+3pJn5aHXGjf50kFUHLTDcgBsiTPIPwRbWDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q2nDxLUWleAerc7LBxKsC+Lxa8TrDgZYp/HoTErqhtClV3CjtRBoOhdfSOd/F7r3+lR/JvDm18Sfhfa3thStb1UUDjcx2I5EIShjvriwmj589Xv2zw/ThmQgjIETrBeRHPphnIWwFV0L/UiVjvD2pYauymTZYOJObBI1tSrCCEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bx9CozAa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734558778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iAR7YBAqAqbtXx52p9OIrSHXHOkK1eu9Jj2Dny0WTOk=;
	b=Bx9CozAaIPTjTa+NWQtRSGiGGGQ+Dm4i1vv7CXjpCeh/DQN/PZSc9NE+ujYlV0w0EFKQF9
	n5k5tEacvzfXeJJiJ58G2HJOrLlR3E8qXrw9Bh9xerlE/WfZctQ2J69ODvWzjMPjrZSo1z
	tQsf+sv51njjlVHFGtJdPWuzA6m3WsE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-ryuvFrnzMpy-ADlieybpUQ-1; Wed, 18 Dec 2024 16:52:56 -0500
X-MC-Unique: ryuvFrnzMpy-ADlieybpUQ-1
X-Mimecast-MFC-AGG-ID: ryuvFrnzMpy-ADlieybpUQ
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aa67f03ca86so6418266b.2
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 13:52:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734558775; x=1735163575;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iAR7YBAqAqbtXx52p9OIrSHXHOkK1eu9Jj2Dny0WTOk=;
        b=aHcqysMH/bNDhpekIB7KW6ZL+KCCPjSF6DrARupMrS8efOXp379t7cmBo0XP6QC3sm
         /BTjP3V1CSTGzKgyc+QCc2PLpicFxXKku9cfO/YGmQyifpnAJ3vD7Y/WaNDpvc9NL6B6
         Wz5xfQ1yYC09nIGZZ/T5CoJuxGbZJ+tG45XjJJjUTjovLgDL01D+LWto0rqMxxORNH2N
         nXieCYX6QDlcPvxa4cntfMbu5s2wn0Ta18PzgYrwidgqTFPU+EHT6Io+1YsBEbW+kP6I
         RJBURjOfFGXwBDwpbEfXnfb9zHXAHvwu+d2aiqxsaRf4Tfh2LmXfc02SyOCRFdCsIYjd
         UXqw==
X-Gm-Message-State: AOJu0YweSwQ6H2epCyzMlxwWGTwsGy0P+uPPBHbCm9yQ/97q4DAmrDio
	6QUtEA1T3g+KLJ32iQdCtP6c8a2I+qfwYkLc+lVq/tE2MQVEex1Ub674X1k6rP3NyGm5Jc/qtDx
	fH23mN9uSYfdlm9ufV/MUFn2HuM9RcbWSefZYjff7ja5kSmOVLyEx5Z3xBgTxUFGhdF5Vy1JolQ
	==
X-Gm-Gg: ASbGncsxGSVKepuT7v14TZGLpDEGFSKsL6S6jk9++nvfDSjzU/wyNlZGMJxIO6sLiKV
	CfuTh/zM3alC9Gg34TTe8vA4tQxXNvrldeBkImGLkR8dFgUGZSyx6nrHdRfES3rZ5DnoKkf6EcU
	iqKUiz1Hw0w0/uvWZH47L+WkC1FBvDulap+FH4NXxfZWGrMc+JVcHelCrJeLMfZ48YPnngutPPJ
	anIrbuIwDsMHv6G/vzI8p4eINvwBIAFO5kqJXw9Xekdd6OSoqvw3NOyPxWxPGhyJobhRU+GJvPf
	oqMSH6fAiM8zeiM/+JKiTzUX/jehh6rdD1cAdRBNgRXR7Ipmizq/sv3lnyD+VE1qfVqTYrsUesM
	DK/xGwr+r6cl4SEgV7Cic0Laqsry+0vw=
X-Received: by 2002:a05:6402:3902:b0:5d2:7396:b0ed with SMTP id 4fb4d7f45d1cf-5d8025b3995mr1765627a12.14.1734558775369;
        Wed, 18 Dec 2024 13:52:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPD2A8RwqR7k86YXAHSuGAXVq4fOjVaQOVI7J4B1cTSGLhES2qH4ATpsYKR00JYmt8NjkBvA==
X-Received: by 2002:a05:6402:3902:b0:5d2:7396:b0ed with SMTP id 4fb4d7f45d1cf-5d8025b3995mr1765593a12.14.1734558775042;
        Wed, 18 Dec 2024 13:52:55 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab963b52basm607319566b.188.2024.12.18.13.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 13:52:54 -0800 (PST)
Message-ID: <7d61cb1b-292c-4b19-b972-1666ba2a0a83@redhat.com>
Date: Wed, 18 Dec 2024 22:52:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] media: uvcvideo: Prepare deprecation of nodrop
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241218-uvc-deprecate-v2-0-ab814139e983@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241218-uvc-deprecate-v2-0-ab814139e983@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 18-Dec-24 10:39 PM, Ricardo Ribalda wrote:
> We intend to deprecate the nodrop parameter in the future and adopt the
> default behaviour of the other media drivers: return buffers with an error
> to userspace with V4L2_BUF_FLAG_ERROR set in v4l2_buffer.flags.
> 
> Make the first step in the deprecation by changing the default value of
> the parameter and printing an error message when the value is changed.
> 
> While implementing this change, Hans found an error in
> uvc_queue_buffer_complete(). This series also fix it.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Changes in v2:
> - Improve cover letter wording.
> - Add new patch to fix vb2_buffer_done()
> - Link to v1: https://lore.kernel.org/r/20241217-uvc-deprecate-v1-0-57d353f68f8f@chromium.org

Thank you the entire v2 series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series, assuming you have tested that
the modparam magic in patch 4/4 works as expected?

Regards,

Hans




> 
> ---
> Ricardo Ribalda (4):
>       media: uvcvideo: Propagate buf->error to userspace
>       media: uvcvideo: Invert default value for nodrop module param
>       media: uvcvideo: Allow changing noparam on the fly
>       media: uvcvideo: Announce the user our deprecation intentions
> 
>  drivers/media/usb/uvc/uvc_driver.c | 23 ++++++++++++++++++++---
>  drivers/media/usb/uvc/uvc_queue.c  |  9 ++++-----
>  drivers/media/usb/uvc/uvcvideo.h   |  4 +---
>  3 files changed, 25 insertions(+), 11 deletions(-)
> ---
> base-commit: d216d9cb4dd854ef0a2ec1701f403facb298af51
> change-id: 20241217-uvc-deprecate-fbd6228fa1e2
> 
> Best regards,


