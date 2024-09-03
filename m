Return-Path: <linux-media+bounces-17445-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B32A696969E
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 10:12:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E53301C232C8
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 08:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8033B20124E;
	Tue,  3 Sep 2024 08:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XA4iFZrO"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392F11CE700
	for <linux-media@vger.kernel.org>; Tue,  3 Sep 2024 08:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725351106; cv=none; b=BPVzgLqsIx8Scmz5V938ci30HMA/jgzvLNcNjV3qk173FUcZAGTUI5xKVMOGLrKotSiL0rhZO0Z7gY/9m6aEUzxB2ARTH5sVSGpp61tzPwZu/4dHuyVPLg09lr92Idg7g95Oj758o2Z+4TMbK7v8R5R07r/X0vxyf6nVkFZO4+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725351106; c=relaxed/simple;
	bh=gaE08WknlXp1YbtKsu4Dh8p8qxDplsAxNyYKzUyhgIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rahHedh86NX3w0P57uJG1VcQ4WXzY3jnpT0jwGuM2E+02tDc+mEPGBeUr+a8DH3ShAIvJpdEpolP3QLTEMJ7jP4wlKst/6yLLsuX2/ekAeKeaFj98RqF4MIhRuG9PQj96XX/UJPyTAEqsUOaMY3b7At7yQ6MgrYtEAdVdWhM9hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XA4iFZrO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725351103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DUIoVB/s/msezd5C4XucxRX3jXZXNa0cIvXCCoDGhNA=;
	b=XA4iFZrOr0YgulsUPRFPcBZyzm/46OYhFMfQplBpckp/eK8XsrXLPD4dXiqnpPuorVMuiJ
	ILmOTgOp7Fd/Aaj2xoxdncjSDnJC/mF1sHT8NMD39t3CsKin7cZI8LlRt6Gc9RIJpPsQp8
	L1idE7y8euch/NwdNHO+1qT2helCDBY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-245-3CxNwFP_MAGI7FkSnMAfRQ-1; Tue, 03 Sep 2024 04:11:41 -0400
X-MC-Unique: 3CxNwFP_MAGI7FkSnMAfRQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a868403dbdeso374151566b.1
        for <linux-media@vger.kernel.org>; Tue, 03 Sep 2024 01:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725351100; x=1725955900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DUIoVB/s/msezd5C4XucxRX3jXZXNa0cIvXCCoDGhNA=;
        b=k4DOf7mZXxhES8kFPre41/DsaORrMvEpX7cKk0MoI5q0OwRWPhIUtKh5FQI7gBEjvR
         VPRnPT/sacreZSDiU5ajHNZ4A77wCtWambcu5j2QkI4YLwldgWxuwy1olWYdt+dqgypL
         Ptx/xybY0PqTdFJrDIrMXLvEzDOX0tKRVNDlVpUbbnDkn5SFFxN1MDT+QEnoMwhsTKmK
         TH4x4y1C23jQGk2ZgtLFK0rliMkspBe3ZvqDQoqWCwLprLdvmdNfgCmScnTqvbsKPQUY
         zU4uL5416o1vz9K+mTfuUb2aD5bbX3aljqm4YkVmof38E9xCvDytsOrLv/lVwN0ZGDFl
         ar1g==
X-Forwarded-Encrypted: i=1; AJvYcCU9tKeBgRT02y3PoEpH3eOyZqLFny7ZJBKTggD3INNVJnwv12kGXMcI+aPNVKk4EZCeFasNM+5loO7NZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIdSuLN6R0LHyh0WM+uKakL4FeRWmPN1EFrDwOWjhEUxBsnbO1
	LxLAgY7KSt/wKhr3xDcz2g354z7Ld255UkWDO1pCJY1RP7AZK+ZsHPoJgDTH0S+Q913CBeI7at8
	jN1KyxUSBo+HsRhGIikV49YfjAmv2nlvUxdth3cWqZbpS8WfJ0Qnx6Lxrl/WxXqJPynGo
X-Received: by 2002:a17:907:7f14:b0:a86:a56a:3596 with SMTP id a640c23a62f3a-a897fad4dc5mr1334689766b.60.1725351100276;
        Tue, 03 Sep 2024 01:11:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5stnOPCMct9E/1dwwwU1L3Krx1s5fHLEmHndvEuP6UPF9v0bb1yV5LgvdmxGsZsDNJrMwLA==
X-Received: by 2002:a17:907:7f14:b0:a86:a56a:3596 with SMTP id a640c23a62f3a-a897fad4dc5mr1334687266b.60.1725351099802;
        Tue, 03 Sep 2024 01:11:39 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989222593sm651355066b.205.2024.09.03.01.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 01:11:39 -0700 (PDT)
Message-ID: <12682239-d098-4cf8-bfec-a754d934a04a@redhat.com>
Date: Tue, 3 Sep 2024 10:11:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: atomisp: add missing wait_prepare/finish ops
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org
References: <cover.1725265884.git.hverkuil-cisco@xs4all.nl>
 <9f401f3732dd728e3d2ca508002c97b80a2eae30.1725265884.git.hverkuil-cisco@xs4all.nl>
 <5e8e08e9-d807-4626-8e9b-b34fe6cef447@redhat.com>
 <bea65459-5c71-4ab8-bdfe-9e5c4fda4d6a@xs4all.nl>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <bea65459-5c71-4ab8-bdfe-9e5c4fda4d6a@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/3/24 9:59 AM, Hans Verkuil wrote:
> Hi Hans,
> 
> On 02/09/2024 12:39, Hans de Goede wrote:
>> Hi Hans,
>>
>> On 9/2/24 10:31 AM, Hans Verkuil wrote:
>>> Without these ops the v4l2-compliance blocking wait test will fail.
>>> These ops are required to ensure that when VIDIOC_DQBUF has to
>>> wait for buffers to arrive, the queue lock is correctly released
>>> and retaken. Otherwise the wait for a buffer would block all other
>>> queue ioctls.
>>>
>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>> Cc: Hans de Goede <hdegoede@redhat.com>
>>
>> Thank you for this patch.
>>
>> I have merged this in my media-atomisp branch:
>> https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp
>>
>> I'll run some tests when I'm back home tonight (with access to
>> atomisp2 hw) before included this in my upcoming atomisp pull-request
>> for 6.12.
> 
> Would you be able to post a PR today? We want to switch over to our new gitlab
> tree (https://gitlab.freedesktop.org/linux-media/media-staging), but we'd like
> to get all PRs for 6.12 merged first.

Yes I already reviewed + merged all the pending atomisp stuff yesterday.

I just need to merge your "media: staging: atomisp: set lock before
calling vb2_queue_init()" and run a quick test and then I'll send out
the PR today.

Regards,
 
Hans





