Return-Path: <linux-media+bounces-29506-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DBFA7DF6F
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 15:36:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B816F16A348
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 13:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C3676035;
	Mon,  7 Apr 2025 13:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M+cUpgQI"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0584535976
	for <linux-media@vger.kernel.org>; Mon,  7 Apr 2025 13:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744032797; cv=none; b=OXdq+iUlLybG1qi9zJlx4bJ5mqrm0J5mBa/KBf6ZJ4hhvB3xL1UJxjb9hmy3kSppT9zYPgFZ75urei3kjWt4b+0FQBV997paTWghINp1Gb89Jks2EnrpoMJ0P5DhhFcqGMYznfG9RFSUGAkgImKM/zBVy9cWBY66vhokIxoKHfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744032797; c=relaxed/simple;
	bh=or+KEFGTrsg1nsPIdmkEwhSXILQOsSETwxadfTI6AhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PpPds090EIhUaWB4NPvlyLcPfu9nJJ76D1uCPn/tbnEA8+nfuONb+b5+D8BNB3G96E0Ow2CSdpLPNeeBO2MNJJ/3hth5KIz/vyqmynl8UgTLcuerZdfA8ysCH1SFJqjDACGlTkpfdp2rBc2PcJwVmhwyfnV1VdsVdI6DuKTqXJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M+cUpgQI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744032794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=afbb7WkLp8lyjypZ4x8CYxgmQXgkeIvIjBj+73twv/o=;
	b=M+cUpgQI4xg/zzIb6FMTFaWpEnqBbJ5pKEcqrw7sALn2f7UVO8/qXt5fPFbIsBG3kB0lp7
	UfFZjZC60iaaW/OEIkr3EU/ZpIavws7Lf8HEFci18C7q4hYKDAVwrnVcSasSl9/NYxlJQT
	a9b7Kz/0b0XVlJhcIuY/6Ghb6SKJ2VQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-XdJh391jOkGUbQGtczN5Ow-1; Mon, 07 Apr 2025 09:33:13 -0400
X-MC-Unique: XdJh391jOkGUbQGtczN5Ow-1
X-Mimecast-MFC-AGG-ID: XdJh391jOkGUbQGtczN5Ow_1744032792
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39141ffa913so2265913f8f.2
        for <linux-media@vger.kernel.org>; Mon, 07 Apr 2025 06:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744032792; x=1744637592;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=afbb7WkLp8lyjypZ4x8CYxgmQXgkeIvIjBj+73twv/o=;
        b=kjs/TXDvsyhma3aBnK2HEGYVI+2JKjMfn5/rsYcU0jl/14BWJASOA9sv7cthvQnEun
         TSOTiptBbiZxj4I+W0//Phx6gJiBHt2gbBHF9LpkDsTsRP3fXQHJHv6tBZkSMbYuFOfF
         FAe2iFFQWnz9so7Z5G9hF1CFAIy9BxQgih1+MYM5/u8KQ/w8mKRrfBgoaDohpOOQnZ9M
         ajQxsXdzCwgpcT4vkiZY0QLEcF/ux8Jzcf81/lwfk04R4hlf0JMXXloThDIPW0nK3aIn
         omjuwc0Q8zIHmMA6Ihdz9Hh4tj/chQ1K22by9EjpLApYyVyRqIV0Av750U/Ju0OVw1tm
         mqrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVojdLebZQBjuYIPg3OlvPzQ4VSFIkquCYqDggeisHdqYMDaBA9Rj6ZCYUc4XINdYaFaUvzKgRzBVFcsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNtPyXXiQrgdajNHqpvo826WqMw0Kl6arc6BoA2noXxpoJoq/o
	/tiHQvhWoTuMTvZNcdKabmBLIKk548BTp5HO4V5fNRZ7oP4A3GOLBg8ex1yqDM36OXBfKP27922
	xcyoPGkROIhT1++SZuKsRXGvR6rF+i2oKrQ2m/zguzW8yA3etZ1LNARkkFmps
X-Gm-Gg: ASbGncuJ4vF2JnGtLPNtBJfORejcy3QlQAVQ56XwQP0EIwkNxxa5P38zLH0s5FchSeq
	Kn8fenCjPfDDCJ3KwrsOuxw0uJ2IfYl+bLYpf+NiDbg2ojJUq3qCzgL75oCjYELM67JHP0mjFTC
	U27ZbDy6OxaMarbu3h/d4FaF64Z5kPZpYRSZrFk8yt3SFCiGUbuZLG25skCLxJXk9uJNDflsedM
	Mk7tQC7Toi/3qQtSV7rrklBPcczztGc+ZNhDdpRCl7AeMX2+QA5zow/FwICPL35eg5UiYZEf81M
	yOumGNWeP+cyV+Jcmwk=
X-Received: by 2002:a5d:5f85:0:b0:391:4559:876a with SMTP id ffacd0b85a97d-39d0de66a76mr10099034f8f.46.1744032792514;
        Mon, 07 Apr 2025 06:33:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE21qC+qO+axlamg3PP6rk4oRrAkKrbz3ds7kuXha7eToDMkVaV6kV/fgeW4vqYEdmW3QBD9A==
X-Received: by 2002:a5d:5f85:0:b0:391:4559:876a with SMTP id ffacd0b85a97d-39d0de66a76mr10099001f8f.46.1744032792149;
        Mon, 07 Apr 2025 06:33:12 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b6a1esm12135521f8f.45.2025.04.07.06.33.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 06:33:11 -0700 (PDT)
Message-ID: <a1661517-536b-49bb-95af-8cf7baf91b39@redhat.com>
Date: Mon, 7 Apr 2025 15:33:10 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] media: uvcvideo: Fix Fix deferred probing error
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Douglas Anderson <dianders@chromium.org>
References: <20250313-uvc-eprobedefer-v3-0-a1d312708eef@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250313-uvc-eprobedefer-v3-0-a1d312708eef@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 13-Mar-25 13:20, Ricardo Ribalda wrote:
> uvc_gpio_parse() can return -EPROBE_DEFER when the GPIOs it depends on
> have not yet been probed.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thank you for your continued work on the UVC driver,
I've have merged this series into:

https://gitlab.freedesktop.org/linux-media/users/uvc/-/commits/next/

now.

Regards,

Hans




> ---
> Changes in v3:
> - Remove duplicated error messages in uvc_probe()
> - Link to v2: https://lore.kernel.org/r/20250303-uvc-eprobedefer-v2-0-be7c987cc3ca@chromium.org
> 
> Changes in v2:
> - Add follow-up patch for using dev_err_probe
> - Avoid error_retcode style
> - Link to v1: https://lore.kernel.org/r/20250129-uvc-eprobedefer-v1-1-643b2603c0d2@chromium.org
> 
> ---
> Ricardo Ribalda (2):
>       media: uvcvideo: Fix deferred probing error
>       media: uvcvideo: Use dev_err_probe for devm_gpiod_get_optional
> 
>  drivers/media/usb/uvc/uvc_driver.c | 38 ++++++++++++++++++++++++++------------
>  1 file changed, 26 insertions(+), 12 deletions(-)
> ---
> base-commit: f4b211714bcc70effa60c34d9fa613d182e3ef1e
> change-id: 20250129-uvc-eprobedefer-b5ebb4db63cc
> 
> Best regards,


