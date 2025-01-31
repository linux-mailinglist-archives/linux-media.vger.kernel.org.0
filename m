Return-Path: <linux-media+bounces-25450-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C87A23B2B
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 10:16:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE1963A1F58
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 09:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E39F91714B2;
	Fri, 31 Jan 2025 09:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AwuAIXSr"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A630D1494A3
	for <linux-media@vger.kernel.org>; Fri, 31 Jan 2025 09:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738315006; cv=none; b=Q+xyNNwksrL79fBNfRw69K9GGi2WFC+ys8DLkMl6arQLnKZcbbCUw2T/wnNSP6Lgfvd+DyPE92hZKaQHPsrR7jobvmFUenIjBU5v7z5O6UaZ+j3GkvIE9r5VLfEJdqVSmIAu+uCk1z3RvIQPdEjyiTQyK5idwrlV0BsjhmeNYHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738315006; c=relaxed/simple;
	bh=mnKltg2FvOx3trf98joMHHqkpfHLXTzfoNycyohl9zA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=igA8RBJb69ppwQZCSBVSOSoyoQZpDD8jIibS4a2YW3SILYhflarHpL5oVmVpLPFahlpd6ukXYzF27La9wY/NOwfS9RGsUiwzkU55WYnTgrY0UMc5EAFFCPl8k2CHB2O28uqGirx2jABF2ErRyOchQiL1aGP+T7bwsODiZq3B4UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AwuAIXSr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738315003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xHNsRiCSRz6xsJifECD+Xt4CtJuoDCzikyI/v1psxhc=;
	b=AwuAIXSrJLDKH3eJS2D0VrzbcQbLJA+WHJThEb/xUIivYlUsV6bfIYPhNqmbiA0v/lnYjo
	lQMw82LYEZGnpUvGF/BmOcvAYv+SJm0tkDDCmmb0DOELYMOYWoUPC2XuAfxKReWCRn6XIw
	VNVR6Toa+paxuNHi9wYadpWYlbzW+qY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-zADD01unOMqxGnSL5cQLpg-1; Fri, 31 Jan 2025 04:16:42 -0500
X-MC-Unique: zADD01unOMqxGnSL5cQLpg-1
X-Mimecast-MFC-AGG-ID: zADD01unOMqxGnSL5cQLpg
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-aa67f03ca86so147101566b.2
        for <linux-media@vger.kernel.org>; Fri, 31 Jan 2025 01:16:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738315000; x=1738919800;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xHNsRiCSRz6xsJifECD+Xt4CtJuoDCzikyI/v1psxhc=;
        b=hka+FeN+HF06vxws6qgkN2AhnJp+HSYNOz8Jy/1oFmWhfau6Y6r1seUxR4i+YAHgXZ
         RIM2JRGNZskZMif2VBOBwLOP4nEayatgCByCWpClUuF1Yj2YvPOsQi7D5iAT8Fc2uGOZ
         1e3+Z50FXrjQPjjrOhfwUzRaQZp/ymhwWT/ZL6ZTmtDhLN14E8YJkHXkH80T9xm1aJ+e
         Mff4xIl+cLw86EBfJHU3F3XSiYnGYKhyENxdB5mKpreERQl1ipdyxDr1o1H1KkpnZhyn
         d9IaumjhzQ1DcPtRj0TwKozFltvfocw6Q0Re2yeqO5BFuSLfYPsk7VoNlMDuinrL1UV3
         ZpYA==
X-Forwarded-Encrypted: i=1; AJvYcCXJGNht05Qv0ipFOHZURRaMuCihlfXucoEavtGyWilGQLR0HgzDMrhHyh9mTdhDsN4VIYPfq76Hk57QYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGQigU5jp7pMroNbkQYMX9NBB7xq+gg7X0tYyywWYNwsyvzr6O
	y38SFRU9ErT071nEalGURkDagdAsTF2nhzCInqPmBVPnfY98Yldl/bq3caqno3VdiV2kEmht5ET
	U162yx56In10XfpCrQ2ltgXqaAhWizmzjD6NvJo9INW9+CQuluPU2EMMpicNYwMJUvqKtnKk=
X-Gm-Gg: ASbGncu3bveyTrKSpdNg+aHPu6HsqNo5WGVos2Ntg5lxcj6vJs09fL3R0gCbyyuW4WH
	PtWKJog4IJNTzRrnw5fop1QbBJjfUyWwH1RlFzBGuEf6WEGnX8FMvtruyK8Cu3f/S8H6z4KkH91
	ApTCWgbUoX4luVCkTTqkrw7bQAz8PPxx7swrHR+q3q29kVELH4VUU8ZAEKQEYunU9VeGqeB7Q5i
	H1ZX6KE3sSuQFWC9l89rcFNDu9WGRu16K++K5eB3eAEfwk/hDHawBK3KvWuLqSjVJ6Bw929DXi2
	JXY9a/YZkq564O32tw+GRIqJyA9Fm4ylEwNxAVCSaHrkMgMbRQ4rpnuaPp1Nqhbu2XecbPfkZgS
	ozEjLbVWOBnLeQJBEtxZHITM/5C+h58H1wWc/4uC04gYJIXI+1NCcBYM=
X-Received: by 2002:a05:6402:3511:b0:5d0:81f5:a398 with SMTP id 4fb4d7f45d1cf-5dc5efa8b65mr22809852a12.1.1738315000543;
        Fri, 31 Jan 2025 01:16:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFf4am8MHjco0rJymrwx+u9poYP5/gS8vD1zPBlgsmwx1x0zfJ62gQ/043Oifv+KOQtlg/1uQ==
X-Received: by 2002:a05:6402:3511:b0:5d0:81f5:a398 with SMTP id 4fb4d7f45d1cf-5dc5efa8b65mr22809790a12.1.1738315000152;
        Fri, 31 Jan 2025 01:16:40 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a320e0sm262029066b.151.2025.01.31.01.16.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 01:16:39 -0800 (PST)
Message-ID: <0d2c594d-0bc9-4a96-a0f8-390a9efbfb3e@redhat.com>
Date: Fri, 31 Jan 2025 10:16:38 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] int3472: Support GPIO con_id based on _HID
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
 linux-media@vger.kernel.org
References: <20250131073707.1082931-1-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250131073707.1082931-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 31-Jan-25 8:37 AM, Sakari Ailus wrote:
> Hi folks,
> 
> One patch turned into a set, the second patch being the original one.
> 
> since v3:
> 
> - Add a patch (first one) to switch to unsigned long type for polarity
>   field and renames it as gpio_flags.
> 
> - Use a polarity_low boolean field for indicating the GPIO polarity. This
>   is turned to gpio_flags in int3472_get_con_id_and_polarity().
> 
> - Put the new polarity_low bool field next to the u8's for better struct
>   packing.
> 
> - Add a patch (last one) to rename "func" as "con_id" which is used
>   throughout the GPIO framework.

Thanks the whole series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Regards,

Hans


p.s.

Did you see my remarks about rewriting the INT3472 code to have it
do all the power-sequencing itself in the "RFC: How to deal with the INT3472
handshake GPIO found on Intel IPU6 MTL?" thread ?



