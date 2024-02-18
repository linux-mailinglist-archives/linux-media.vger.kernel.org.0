Return-Path: <linux-media+bounces-5370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77467859699
	for <lists+linux-media@lfdr.de>; Sun, 18 Feb 2024 12:08:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C91BD1F21508
	for <lists+linux-media@lfdr.de>; Sun, 18 Feb 2024 11:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E564F1E8;
	Sun, 18 Feb 2024 11:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CK2n4Kvt"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062991E526
	for <linux-media@vger.kernel.org>; Sun, 18 Feb 2024 11:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708254491; cv=none; b=OZtULz90x49nOSUDN6rSrdp522pRS98ES9y6rZz/X2UiKhPFtcchiQ6mxrvTFNqgtRmQFlPcqPEwrv90fYTduvCG8XovXPZZt74edAW77mZkagO8ihQjKFHZMKJbiLOW99eF2ZshJdNjgTuoAfW742fqlZJL1B0BMgwPkiV+FNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708254491; c=relaxed/simple;
	bh=3TKvhQ3vxwW/peESH3bVfmlT/EEYE6U5+HjKrIuS+lA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZRln9zXY6c/6aVZNiFdOlXMQSY9YVHT4JMf+RIICZGJByjkUZM+DmJUBpIFlo8UWI3WuUD+uFiBvmUjc8wtZTK8uWbx+iTzuv0aBG5dBOITwXjm9uiLIMSRC0LbJ7pfaytZYpPbsmkUgbrUa8M2zo3sybDtC1N2rnqk+EZj6NZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CK2n4Kvt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708254488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JHmmZL1fNh88Qylka4+U/ZSAGTN1aKufKX/Quq5dF9M=;
	b=CK2n4KvtmPjdxeb0eDbZifvLEsuoboMDM3D5+rpWRT9xK8uEzo0fZZHY/8o4ZBJu/XaxMo
	mXpY8nWrmHtJdvx6HdBcuzqFu4Z3V/8tRcWviDb3+MU+xgZTtn0RtQaH11knC4ZItDzS3L
	TVGIdc6nKQ95/xDp/8plcEOq41BuOfg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-srOj_-NRMu663I3qxLb0IQ-1; Sun, 18 Feb 2024 06:08:06 -0500
X-MC-Unique: srOj_-NRMu663I3qxLb0IQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a2f71c83b7eso286800466b.1
        for <linux-media@vger.kernel.org>; Sun, 18 Feb 2024 03:08:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708254485; x=1708859285;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JHmmZL1fNh88Qylka4+U/ZSAGTN1aKufKX/Quq5dF9M=;
        b=qLKylllEqFCnBZoUuipxmD31YRoFsmgzof9EPW5CMsfM/8cmz4l2KVE90taob+3boK
         McMqIwgdAfGfUGmzXXOY3MUYREuf1PFzr0wuugd+Vg1kGCVKRMSXHjOm+Ii0O4R2ybRd
         dO6EZq4DC/hetJquOZWmzF40wLe0DHfyIGUlr/gQie1sPIFs9KdU0oryF6Yzit1E4RH2
         DugeKB7SgByOhTa4qOYDTRDlh97ByjO4uLLRY+vNPDap4AMp/aX5vEdXcisBRu8zTd3I
         t+YsX2L578z4bQIy6RISFUa1YN3BnLNAr20o+cgOzP6J1AbO8x1Qj6Msu9ej6/WJO62A
         DL3A==
X-Forwarded-Encrypted: i=1; AJvYcCUwmBG70JPrjk+iVqYWxtAJ0amgzmy4ppfqjSnUBX86fYR5w33gqpUwYZ5E2QHR5CX3O5cM3z1yWPY8N9o3M7fAJ1loON7yWEshyFo=
X-Gm-Message-State: AOJu0YzhLlXd1jCfPz33o2raXFenLxIZMFPdClCdf/Lu1eF1YKLMmYWv
	ainTjf4+/GRkP1Sizrkho+2eQJQg/hITDRrMEL5bmBRd18nvbg/qzl+WtCZkeuQJcxD2Eh8G6j1
	MLq7o9K52VTv1OL1e/ed3tgHV1Vz/HsCLgQZfIWbkEdihyQ/9f/r9rInE+syn
X-Received: by 2002:a17:906:231a:b0:a3e:8429:a927 with SMTP id l26-20020a170906231a00b00a3e8429a927mr428130eja.68.1708254485288;
        Sun, 18 Feb 2024 03:08:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCDSSiqE95u+4ghdM0qpsXmw/Pn3pWXEEMl5iBEArG7e7qJn0G9Z2BGOgnFtrEJrQRc21/TQ==
X-Received: by 2002:a17:906:231a:b0:a3e:8429:a927 with SMTP id l26-20020a170906231a00b00a3e8429a927mr428122eja.68.1708254485033;
        Sun, 18 Feb 2024 03:08:05 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id tz3-20020a170907c78300b00a3e0b7e7217sm1752185ejc.48.2024.02.18.03.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 03:08:04 -0800 (PST)
Message-ID: <1e42993f-bdb3-471a-9c34-04a23f5e71b3@redhat.com>
Date: Sun, 18 Feb 2024 12:08:03 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] media: atomisp: Implement link_setup op for ISP
 subdev MC entity
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>,
 Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
 Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20240217112438.15240-1-hdegoede@redhat.com>
 <20240217112438.15240-10-hdegoede@redhat.com>
 <CAHp75VfK6QKA4hq0_LNe1_i44M_6j65aYGnU7XSEF0M-NWLs7A@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VfK6QKA4hq0_LNe1_i44M_6j65aYGnU7XSEF0M-NWLs7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 2/17/24 19:52, Andy Shevchenko wrote:
> On Sat, Feb 17, 2024 at 1:25 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The atomisp driver's Android heritage makes it weird in that
>> even though it uses MC + subdev-s it is designed to primarily
>> be controlled through its /dev/video# node.
>>
>> It implements s_input on /dev/video# to select which sensor to use,
>> while ignoring setup_link calls to enable a link to another sensor.
>>
>> Add support for selecting the active sensor the MC way by adding
>> setup_link support.
> 
> ->link_setup()
> 
>> The implementation is a bit convoluted due to the atomisp driver's
>> heritage.
> 
> ...
> 
>>  #include "atomisp_common.h"
>>  #include "atomisp_compat.h"
>>  #include "atomisp_fops.h"
>> +#include "atomisp_ioctl.h"
>>  #include "atomisp_internal.h"
> 
> Hmm... Perhaps keep it ordered?

Yeah my bad, I intended to keep it ordered but I somehow got it wrong.
this and the commit msg remark are both fixed in my personal tree now.

> 
> ...
> 
>> +       mutex_lock(&isp->mutex);
> 
> Side note: Are you planning to use cleanup.h at some point?

Maybe. I have no objections against. For functions needing
e.g. heap memory only locally it certainly makes sense.

Regards,

Hans



> 
>> +       ret = atomisp_pipe_check(&asd->video_out, true);
>> +       if (ret == 0)
>> +               asd->input_curr = i;
>> +       mutex_unlock(&isp->mutex);
>> +
>> +       return ret;
> 
> 


