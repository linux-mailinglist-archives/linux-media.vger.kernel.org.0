Return-Path: <linux-media+bounces-6911-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C39B38797EE
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 16:47:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76C931F22EC7
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 15:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C088E7C6E0;
	Tue, 12 Mar 2024 15:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XuV2fcF1"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32487A70A
	for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 15:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710258469; cv=none; b=Cc9vwLl/oiCkTuImBBRnw6N6SihABNIqSiq5rbLcYLKnDs0CN4XiQgzAQ8kD8XDSIX79Mg2JPnirtouTrUMz10L/U/k/TCJFOWAqui0GBUIrSuvL7KqJ72r8EyqwWQU+noE0zijnhkpbhH+uClLj9Pda5WYBJ8zumGBJ7+3woOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710258469; c=relaxed/simple;
	bh=rSV8M403liOsOWpkP+QfGYfJEErc5Df98s4BS9GLlP8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dTiUuPwTx5mRXU5MpTau9S+XjQ+nLzqgU3FOiCzYb6KpXLiXTHyqfizm1lUv27Jo9H11SmAAlvwzsNYAzbgmVdBAWb5WowR/rkkrYZ8h/CoUNfq6wtFsJX6Yh/X6xPR9AQe2cfLd/IlQ9YjYzODeCHhSvqrKavC844yclCu2KPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XuV2fcF1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710258466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C03ZzqydLhwftyx/8OV079lEb5JdweH7XCPi8d8sS0U=;
	b=XuV2fcF119Kad+YeTvuVmJGIgT6GxZQW05egqI4dRsvYGKxBpoT/oq4LjtjOAIdnhRbrcI
	+LQQmrxIMEO9avUkRyJ/QD2OwUFvbMST5go5S56Q0LwdYMgxFqNoeOMcLZ2Tfpsgwnas/q
	T5QCVpRLi0npZ43aMPVooFe53XOxM3w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-rCkMi7SQOlqbQ9MNZNNwqA-1; Tue, 12 Mar 2024 11:47:45 -0400
X-MC-Unique: rCkMi7SQOlqbQ9MNZNNwqA-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-33e6b0f5d23so2971472f8f.0
        for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 08:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710258463; x=1710863263;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C03ZzqydLhwftyx/8OV079lEb5JdweH7XCPi8d8sS0U=;
        b=JXAWpWhDKIwMSiyzeSiWFUYoseX/ecMj5PKIZc2N1F3YeOKRA56LORUwQeqv2UTbsz
         d8Ey5/UM8CrQy1VZbMxaXuF3N8q+bWZ4mxsyJkwJhUF+7vn9UtXIt+E7mVAHYeihOlWQ
         92xFIzpmDj9KNwV2iu1H/COhSqEJu3NpOs0TLYZG2ORlGP0rmS6hx9KZXMXkJF2lfaPW
         tKZ8PsOGELyiacTipSglVzj+ZZqAZkq6ApxtzFtXJCDgYtoxDyJbbQ8TUc1QCrOWf3ro
         sP7Th0IcmYRGAOF9FjZ5sOVr1tK87LJrsZBDuEbb9Na64CRZiQ+qwAYra4bMM+temGcE
         J3Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVD1vi7ypOrWsRJUsDNBiLY75SVtoYSzk2OCnePK6n8UBDrgqcbh0bWnh64N0CFwuOE6vnW5jLrj83utaHDo8oeWmVWe92L4YTWRcw=
X-Gm-Message-State: AOJu0Yzz8djasWgQfcQeKltcIa/R8cy4NeIzSCrsm3qf9CiLB1PH5i4l
	SG97NmMhym+Ks/tc0pFDp8iH2AUSYTn0JdOGM2egsMAJpVjOur95BMjNJOt200vT1vzjPONb6kp
	AjAjXsP0LbVwfTWhRzZASvzODArQen2l1YmbWpaM0E2uuxMtcDIUPmF/AU2HSFewIu6R/
X-Received: by 2002:a5d:5288:0:b0:33e:7ae7:accc with SMTP id c8-20020a5d5288000000b0033e7ae7acccmr5781985wrv.45.1710258463662;
        Tue, 12 Mar 2024 08:47:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDsApizg7abXDxnCPbaYlKdHgY8nGSh+z+TqlHOoR5D3BylQMjUqTJGZ6234DJDk41455U3g==
X-Received: by 2002:a5d:5288:0:b0:33e:7ae7:accc with SMTP id c8-20020a5d5288000000b0033e7ae7acccmr5781967wrv.45.1710258463239;
        Tue, 12 Mar 2024 08:47:43 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id p18-20020adf9d92000000b0033e17341ebesm9404825wre.117.2024.03.12.08.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 08:47:42 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 maarten.lankhorst@linux.intel.com
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, tzimmermann@suse.de,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linux-media@vger.kernel.org
Subject: Re: [PATCH] drm/shmem-helper: Remove duplicate include
In-Reply-To: <871qh3k4bg.fsf@minerva.mail-host-address-is-not-set>
References: <20230320015829.52988-1-jiapeng.chong@linux.alibaba.com>
 <871qh3k4bg.fsf@minerva.mail-host-address-is-not-set>
Date: Tue, 12 Mar 2024 16:47:41 +0100
Message-ID: <87wmq7310i.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Javier Martinez Canillas <javierm@redhat.com> writes:

> Jiapeng Chong <jiapeng.chong@linux.alibaba.com> writes:
>
>> ./drivers/gpu/drm/drm_gem_shmem_helper.c: linux/module.h is included more than once.
>>
>> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
>> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4567
>> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
>> ---
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


