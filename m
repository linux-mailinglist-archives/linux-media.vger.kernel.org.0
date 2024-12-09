Return-Path: <linux-media+bounces-22923-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2063B9E95A1
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 14:06:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB5D428251E
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 13:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 823233595A;
	Mon,  9 Dec 2024 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sNKj74jM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD53335941
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 12:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733749145; cv=none; b=Vn+mxV3T16vsImh2Tey68NSqMPxUYZl8PqKQ4amj95z7Z2rWly5X92fOpkBBFdNhUrz8cHQepCdHe1BQBF9mxdNcF9nukTWwPIyXy//ruRvtenuRVFwD9PO/KMyU3Eu27JP6CiiZ361NqCvXwcZGg00gfyk71iWKmSWc78UANMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733749145; c=relaxed/simple;
	bh=KttScc9TGGMMVPNgznMtZYfAzFgUcWmBfnh7Q6f7xfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=AuEkXZReD07DaNm+2/hRDJlxW6bw7b0bI8PMCPcTopnH2R2x8l71A6h7E4Odbn961nA1lYmjQz4uczMdSeOtMeENRhG5xLtDIkben69r2gCiY82gCRq4ezyJCacLWwb7e5ZGvZREeH74tIZ40J6EXLr0o5/sOY5VNXneE3KFMOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sNKj74jM; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa69077b93fso81217666b.0
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 04:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733749142; x=1734353942; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wtjLOtiAQGp7e90thvJSqmTauwPuPzZNe6TVE1CeL/k=;
        b=sNKj74jMMbr8YyHbEviz06s53TTIccLq1PRExpUh4cTKPzurVHzmc/4R2VI3xNRgiQ
         sa9n/fTkc2EYSfqC7HcWSBD+rLzQ39qIprIMF7ufhf+ltnrFIyySHZv02SSFKeNzLrsX
         XkRGDTDRWNowtTDOrAamzvBKxS0OBrmiX7GQCAO/KNKt+lrcWlNrVpGOy9qKFM9K/3pM
         kU5re/GwiJkZ87qY9VBPCEc+uFZLa3G4he+9eLwF2h8WvDR1VMJN1CZ8VkhuySbMOUOx
         n/DgrdUzK7WULlXLeDTGCnNkqvO3bFC+8Rz1/NRZBxe/5hVdF2QV85QX/X0F3trERyLa
         M8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733749142; x=1734353942;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wtjLOtiAQGp7e90thvJSqmTauwPuPzZNe6TVE1CeL/k=;
        b=U2FaLW4HFoZAK8p3+m0Bt0BCxHXIVFccWLUygrnHJyVEtoTcr6jfswbYwUk4/qTW+W
         RYitOE1sfl8uJ3wnbkoCicUrc0n028K+b9CPKzn/RgbSPurxQDPSl7gLwPAyD9Nl7DSx
         csI5MHx091Nb+6+7ZY0CGICrAG7sPUfU0GFJLpINkwXRiytrUGbUqbI68YKKOsedLFCi
         ABp6PJLmnJ8qR2veJhUm7C+/rpRy1Lj3nmx0D+MT02d8Ap6U/QCdSf1dMb0kph2W5UFs
         qvHWEdONNOzjTLltBTXyj3c72L8+ZmWtoMy8yXgHA+hONxfuUil+8ozKLQAO57jRfh+0
         pmHA==
X-Gm-Message-State: AOJu0Yx+MxYO8SK9SVClQEiCHQm6fepbng1UKS7i8mMRezWAHjgKS1Bt
	Z4OjRv9KhShE/7ZWD+ycVucCI7316930I16n1uXqeXB0HIb+ecPN3wjOwu3RxTyEd/MYRBzfgrQ
	e
X-Gm-Gg: ASbGncvD3H4KCyODf/sHQWYkMa0IiZlqXS9oMwiUIMNMTzBCbxq96M+TcXHI2mp92eL
	ZMZGsIKTgOBb6cVgKB8qYMg0C+NYsL6NqLN2TVtTVLv7b8VCy7S8IY86hhOdDxLHpnC+4OSFwYQ
	nU0ecKqjYWDlWKfguGkle8bQh1ozCaCFgAxtuVVdRLTbyQQV9pnAkHwZcdUQFiZDyVPU/2EhjGw
	+NT1jNpab3gES4T5YeasfVNnSqCmVCKffTaxddpC3f+lF6xZHcV1HMHdXI8YiM=
X-Google-Smtp-Source: AGHT+IE4BhSj38WgZWmYVVn77RPNPEAWWuS8wcAulivw8xQwTnGXT1FytdJ2TyPnMJcYE7IgtgCxNQ==
X-Received: by 2002:a17:906:b391:b0:aa6:9461:a17e with SMTP id a640c23a62f3a-aa69461aaf1mr140991466b.40.1733749141839;
        Mon, 09 Dec 2024 04:59:01 -0800 (PST)
Received: from [192.168.0.27] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa695c3ac07sm72995266b.66.2024.12.09.04.59.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 04:59:01 -0800 (PST)
Message-ID: <0f6bc07f-ebf1-44f4-a1ec-7a68e61976ae@linaro.org>
Date: Mon, 9 Dec 2024 12:59:00 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v5,0/3] media: venus: Provide support for selecting
 encoder/decoder from in-driver
To: linux-media@vger.kernel.org
References: <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-0-ef7e5f85f302@linaro.org>
 <6756e7c8.020a0220.154976.4e68@mx.google.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <6756e7c8.020a0220.154976.4e68@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/12/2024 12:51, Patchwork Integration wrote:
> Dear Bryan O'Donoghue:
> 
> Thanks for your patches! Unfortunately media-ci detected some issues:
> 
> 

Where's the error ?

> 
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
> 
> Best regards, and Happy Hacking!
> Media CI robot out on behalf of the linux-media community.
> 
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> 
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/67913952/artifacts/report.htm .
> 
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.

---
bod

