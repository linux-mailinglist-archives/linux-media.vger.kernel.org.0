Return-Path: <linux-media+bounces-27932-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E65C2A58F54
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 10:21:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 882FC188FA63
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 09:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9BF72248BB;
	Mon, 10 Mar 2025 09:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OCkq6t0/"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A216537F8
	for <linux-media@vger.kernel.org>; Mon, 10 Mar 2025 09:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741598498; cv=none; b=P9nRvS4LLSZEX5FXLpV0Y6N8gg26yvz2x+a5JxfgSveoiERhNVk7PdVrINJN+cMMI470fttBA7XVRc02T1iZTF3uPCOrMhBKm4SXwh7tLDEpMWqBJLb9JrT9KDbq6inahi+fZ51TRxQmRtEEVMYVOvl9dq7MFxFoNNI4c0yQ55U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741598498; c=relaxed/simple;
	bh=53OhkacxcrGwVJMlvaeKib9IYi9zP4A0DrGLKYELZFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gWKC05mDSl5w/fc6rAhSqipH61D/27AuLds87eKM5FOxnQjhKos8KeRhBkTcm0m42tU0+S7bHr5lqhnjaS3ppf0lvjD/7cjuWfdh/nRSF4CAL15/JT5F9PSfLyD6Zpia94JbBTdpDjHV/Y96j9vI0IuXmpBQNO9SRIYV+ldNKQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OCkq6t0/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741598495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r38qPEH6BzboivkWcC997syS/UCWnFMjO8VLZJgy+rw=;
	b=OCkq6t0/u8BXd5h4DGV62S5MOkT1bAyUIcv0S17dZfOCtEs90cO0KvuEVNF65Nj8QH3CkE
	1Q2HJOHxm3K9QPz69l+MMUi2p/mOW4EHJqunZHzzC4mwH79g1gcfOVcMzUyYsacA98kVJD
	nmO8Jol1N3eO4DVkhZV8/NdO+7h540Q=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-TZYt4c-lMwSZwpX4GC-2sw-1; Mon, 10 Mar 2025 05:21:34 -0400
X-MC-Unique: TZYt4c-lMwSZwpX4GC-2sw-1
X-Mimecast-MFC-AGG-ID: TZYt4c-lMwSZwpX4GC-2sw_1741598493
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac2573f5876so217182966b.2
        for <linux-media@vger.kernel.org>; Mon, 10 Mar 2025 02:21:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741598493; x=1742203293;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r38qPEH6BzboivkWcC997syS/UCWnFMjO8VLZJgy+rw=;
        b=pzwvaMMxVlSyaC4Q//dNwfLRW0GeQq96U0O8GHrgF9Ee2Po+MO2X574OTtJ3UP0oKe
         eYCgbwW2oURluEtHY/e+MfZA4nuOTIS43eLr9S/EdkmvPFpQ9dFBq7vFgnkrbyaIP+4B
         XIaqMZiWYu3AV17/imIbz8ZIHaSFvkQ7b/PxlTvrf5+0dlW43CfuOZL81k/poXwbNyfo
         6X8LZjPlxdA890sBxrF0GirD3WY55AHQCc6T66ImD1e5G7y+U+vv0Y6M3JOFAHCQZ/cW
         biqChyE1G8tmElezQeNqYlfEY3RYDjHxYPljldRoLmNBf5XccDbO+/ofgfzwPjHTJSx4
         qpzg==
X-Forwarded-Encrypted: i=1; AJvYcCVxsnTvwg77bdNYuK6W2V2i+TTUtohIb/q2ytHodra7Q2o3+IQ0QIw5RNTgKCmMqdKES4xp43LwMmKqVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPbcYogn/ONDZlbUehFliIuY+ztQ1uHyW7ZWQuYQWlx4Pb6lD2
	jQlSBDkOFTLgbNO1jJF8cKQrnbV+diwzW2vK163n3Cb3wBRv/U5bsrVJsjXVWksg1BRhVa2ra7s
	fqN7XVH+COHEqRgxP3c4lpiaHJ8iS5lyB1InFeap0V11UJeh3F228w3cmcuONpM/TjsSv
X-Gm-Gg: ASbGncvsmwa5kUV1sLppRmg81SrD0MwiCRNIVz04cIHowdFLpGE/MXrFjJNP4UkOQXI
	evQ34YYsQFL1vneFRrkkZQTL43SOqfUEw4Yqwf4MacJ33reSkbUTlcsvlEKPau0YBm1K+OBJlEf
	EDqCxgh3seMQs5DaTZTazc2nSOEup9ZTOhqXuvkaldlq/ExmxynRUPWiavnNSrGsvN5TqiTnPqM
	pVA/CqlwEORM2fWGeOECzd6t6iHlZA9VT1/ihv4hK2H5laFMJao/uMHCkfRXDEqxG947tG+7tqi
	ds1N2B2vl1J/LK/V+so=
X-Received: by 2002:a17:907:2d20:b0:ac2:b086:88e3 with SMTP id a640c23a62f3a-ac2b0868a8cmr71224666b.10.1741598492770;
        Mon, 10 Mar 2025 02:21:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7N8AEsh6oNsNTfgxA588HcEdvF5fG4QTfmizN0CfAt7513g11tFKVD9ZiUW6PP4zT8eSZ6Q==
X-Received: by 2002:a17:907:2d20:b0:ac2:b086:88e3 with SMTP id a640c23a62f3a-ac2b0868a8cmr71221766b.10.1741598492395;
        Mon, 10 Mar 2025 02:21:32 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac27e11c457sm358106066b.126.2025.03.10.02.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 02:21:31 -0700 (PDT)
Message-ID: <12c457de-05d5-4785-9e59-82ba52b3260d@redhat.com>
Date: Mon, 10 Mar 2025 10:21:30 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] media: intel/ipu6: minor cleanups
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>
References: <20250306130629.885163-1-stanislaw.gruszka@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250306130629.885163-1-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Stanislaw,

On 6-Mar-25 14:06, Stanislaw Gruszka wrote:
> Few small cleanups
> 
> Stanislaw Gruszka (3):
>   media: intel/ipu6: Remove unused IPU6_BUS_NAM
>   media: intel/ipu6: Remove ipu6_buttress_ctrl started field
>   media: intel/ipu6: Constify ipu6_buttress_ctrl structure

Thanks, all 3 patches look good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Regards,

Hans



