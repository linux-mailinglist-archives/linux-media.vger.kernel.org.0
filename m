Return-Path: <linux-media+bounces-21026-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D17BA9BF8C6
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 22:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B087FB225F9
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 21:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 474731DA0F5;
	Wed,  6 Nov 2024 21:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DtNHlDqI"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2923118FDA5
	for <linux-media@vger.kernel.org>; Wed,  6 Nov 2024 21:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730930279; cv=none; b=hmn2OfH8a0NRk2z/vB5NAOuBVECaOdzM9OHVxb1T+6U3xwa6wnNYvGW37feFeKZtSNHTZT+38vepwa+VPPb/s5wMTVKdq2q9PTn/N4E3Z/VUmg5qbK9otABIR2efAfHm90FilIYUc8CIfiRSnCBs38pf04G0+JFpz8hjGyLYuLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730930279; c=relaxed/simple;
	bh=Bkj3UB7UBC/Ez9hmhA6E5RMVZTayzYGCkXScjx9QaTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pXeoyWLnZaL5G9nRGmQA46pvSgIlG5IyjbqGzMc/4V74yh+I7IL5j0jgMA+PHCtV9WJRK9k0ecXHyh5UBLr4+DpLHFKL0HdjeX95fCa3CyQ3SNpeOp+yBwNNF53xXSEEE2EoD8gBGtkoQm1uWnFAlS8T9T4jR54JOCIg+y6jmPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DtNHlDqI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730930277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uh8fyPxMbNunDDTZgfVbC8o1PbeNw2+xc6V20PPrtKE=;
	b=DtNHlDqIM5yI6jDV2NR8MCaX6FYPXrfUsuEDtdRvuuSMzkdxL1/bQ4xgNBLCHUjQprWI8W
	M43IRNbZumBKdxs2mbJMVgxwNWOcFxYuQTz5wnql/I04AHbAGfvCG+gqVRKKQ3ttath+Rq
	NUxHCGI+bKm7iLUJPHoBaUbuWZoqO/s=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-FbCVbifWMH2JtbneRSSE9A-1; Wed, 06 Nov 2024 16:57:55 -0500
X-MC-Unique: FbCVbifWMH2JtbneRSSE9A-1
X-Mimecast-MFC-AGG-ID: FbCVbifWMH2JtbneRSSE9A
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a99efe7369dso28302266b.0
        for <linux-media@vger.kernel.org>; Wed, 06 Nov 2024 13:57:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730930275; x=1731535075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uh8fyPxMbNunDDTZgfVbC8o1PbeNw2+xc6V20PPrtKE=;
        b=BbKQC53tBhYCBtwNV///oUHWNmury85/enO3FFVCrEzN7u4CBaiCTtklxp+h+C0Fuq
         nmeCI6K1eJzTpPIp7TxSomg0jPeE3VQchyBz80ez35jjLiTA5vGcW5vyB7EMD8JF8Acg
         Ghd7cJYaxnq+d1rTU+EKlGJa5Wab9sKo/flEFXn8dHPDgV4Nm7mXT7vbVMB9ZBJs4cf0
         hZBC/93iBEbydxiKaF0NrgRIfRsJPeNshjTjXo+fKRa1yZEuRjAs9RwrgZLCJ0bJKVNx
         X6QmGhw1t8pfEBEV4iVfrhUcmGePZ2EpJn6wRTV5ECKFfsepY/67UL6O8cEDgPGzuM+E
         FXoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcHwhB8kIBKW4hN1dHOBaGEhraOzx0IoIQ/IBkSa9KU3SMu80Vj/ckzw9di2v1vvofWZeSKfwFh+Wt8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDUG1OGfr1gIxqjcY73sjEDtgOR52ZdeAzBoIClLgHu8zOY8Ti
	Mf69XGXNDSQ/XI0oYuM8gctyMsR2+EtzxldUTNwO8qIM1vJIa66jtdf5h+235iM3BQi5u7exHof
	n8aJ5PSx/8UoJqgVrIj17j5KI2vB5+5mRLsELfa+JLeBvF5JNIBDtISz9S4ER
X-Received: by 2002:a17:907:ea4:b0:a99:f722:2dde with SMTP id a640c23a62f3a-a9ed4c604f8mr59436966b.1.1730930274700;
        Wed, 06 Nov 2024 13:57:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEm/1ICA8I+t0X5PlydU6MXTCCQ08CmaQhc42J+P/SNhQFwtFzsdzvkITUAj4ENlZcdKUQ3tQ==
X-Received: by 2002:a17:907:ea4:b0:a99:f722:2dde with SMTP id a640c23a62f3a-a9ed4c604f8mr59435866b.1.1730930274302;
        Wed, 06 Nov 2024 13:57:54 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16d8dd3sm336013166b.43.2024.11.06.13.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 13:57:53 -0800 (PST)
Message-ID: <afd9b4a0-4871-453a-b8cc-b1f99df47743@redhat.com>
Date: Wed, 6 Nov 2024 22:57:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: ov08x40: Move
 fwnode_property_read_u32("clock-frequency") call down
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jason Chen <jason.z.chen@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20241012115236.53998-1-hdegoede@redhat.com>
 <ac006721-6122-482d-9daf-2281f7e4f384@linaro.org>
 <ZyS5kb_QCDdw11x7@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZyS5kb_QCDdw11x7@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1-Nov-24 12:20 PM, Sakari Ailus wrote:
> On Sat, Oct 12, 2024 at 04:10:14PM +0100, Bryan O'Donoghue wrote:
>> 20241010-b4-master-24-11-25-ov08x40-v6-4-cf966e34e685@linaro.org
> 
> Hans: could you rebase this, please? Bryan's set has been out for quite
> some time (and now in my tree, devel branch).

Ack will do. I'm still waiting for testing feedback anyways
since I don't have a laptop with this sensor myself.

Regards,

Hans


