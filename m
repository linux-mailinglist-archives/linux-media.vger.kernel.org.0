Return-Path: <linux-media+bounces-28197-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FF0A60DA4
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 10:43:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A7E11880601
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 09:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E591F03E6;
	Fri, 14 Mar 2025 09:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hYPgpqcR"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD821EEA5D
	for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 09:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741945423; cv=none; b=HNbFQnOfKllO4qfZVOFEoj72BlcZqF4s1HIN7qJ9x1+elSU3c7dHj7DRnFKVzzUucVy9SWabrZD1tR0gGzO6BYatd88wQYvUSuQeMvpZiWkPpHWg1iD1mZyfKXKooDkR5xAGS3y+OWgWsQbjPkHoQ6VmayntlhU6VmpVmNorks4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741945423; c=relaxed/simple;
	bh=4Qftn2v9WJSRJSBmV35DjlvMH8WU8ud3QIDg/Ri+YfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f04tzWJy1TEOAw82LPlNt0JIO3+m84BMJh7aKyxggq4+6mhARm/dFnVTBITxvV60KPlOdOgD7bYDX1avm9AEggVWO1lgnMT6nVSWGeSd5zbDGnQuqHtBqKnhZZCTLtn3mktpi73YjYIvpdUR/MCKtOjtmRkJC/cz6/pVBasWHEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hYPgpqcR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741945420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ITG5pvx1othHNCJobS+NWrOiPLbLR+xd8Qro8wdkXs0=;
	b=hYPgpqcRtO+o7Pi5I9WE9DhvkjIOsidfLu+srLSDyHV6TEdvNbUAxgXd8HVcv6z+eWUr96
	9sMf3Nir/U7dEX/I+/v/TG8UcAgHPCYaz1yeZfODSTJd/m6KnnkkFDw6NFzujUfhY1h3qf
	PmtIgV3thp5l2lRbpD+l9Ac86mL8TzY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-gbpHJJWxPJeazeW_4U8QpA-1; Fri, 14 Mar 2025 05:43:38 -0400
X-MC-Unique: gbpHJJWxPJeazeW_4U8QpA-1
X-Mimecast-MFC-AGG-ID: gbpHJJWxPJeazeW_4U8QpA_1741945418
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac21873859dso194030466b.2
        for <linux-media@vger.kernel.org>; Fri, 14 Mar 2025 02:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741945418; x=1742550218;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ITG5pvx1othHNCJobS+NWrOiPLbLR+xd8Qro8wdkXs0=;
        b=jlAJeV+D5PgOIVhoC0TQdVlLbIx9mYT/H03M2UXETAf3y1P8lpJGL6kSD6YexixovL
         +6wnet2DcEiKOfIcsTQhDjuee4M4QBa53EKyA1ALyHfx8klS6mZBRQGCYFMQfQy2qU4x
         JDYzk77eOtQUTxMpkB8D6cOsJPcgm8uZbtAGeDllL2/qKFZhEwrk/Pt5c2G+eSZOiIo0
         CtMqV3nZKGfi440Td3Re17iAMSSHF5TNimxTbeimvGzT4fbtXJ9VrjBZImU+LGlGIjCG
         KPpcMg8iGvf+dh9iUFsgbOnYln5BQKKObOYn6g8817rhQrOJ7ChRc+AIErOc0WzRf7BM
         Y4lg==
X-Forwarded-Encrypted: i=1; AJvYcCUXsaX8vwJ9UkakpDGdwT24Olv3CPTODp/v5YGN8pE+CleuOwPt4jmAdzR8G+bUaIH8jBm3w661YU/thQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5gwtdxFgQU+bbGqlReBAPvb66msv2O048luQlb2QKK663HXOf
	tnMHpH2OPesXUQ7rj/Rm0jTHF/JSjSu7DrYbLNcAi/5G7V+oSegV4ImoNVT7XnDxBkvBUnxWL9p
	arOEC8/rdNjno7cI6P5qYDw4XKTe0CDtTGMKIezD9vMea69d5z8ksEjJOaVPI
X-Gm-Gg: ASbGnct2c3PyrZnr9M9B35fJ+VXvU3qgAb4bAZOqH6gsRC33I8Sq4cqyqCODnGtCSub
	3FJNrK5FfjV18ULGtp8fh3zQx4nqgB0b2ecTE3jd0pu1lRMSuj1eyTxoRWOUbPFS+oN5DBCw4Ym
	/dOB+TtaZYs8trxykdFZxh8q6tChPCj1ylXY7qDRp8CAes/069O+LYwMmm48Q4fzGlzhrpvXlH0
	DZ/vD5i7STUT5XgtKhb2wadYQ2GsCa21Z9PZin2Z2lYWTH7UR2w2wcBH5QhaY+nOV3t/t8UcE63
	70NWs2y+UjlLUHytZVVU8B4L7zjoVutp/hqOzUym13cnsnTBIO5l+vHX7tXxsBTK4JaHRy9OiRX
	UKR2bw7BhARPWXH9SxWoJwb1PAIBltBEG/p/4B4enGteyTDs2vNaQUTaYdEvWB+wlzg==
X-Received: by 2002:a17:907:7211:b0:ac3:1480:a8e8 with SMTP id a640c23a62f3a-ac3301ea1demr224221066b.27.1741945417696;
        Fri, 14 Mar 2025 02:43:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1lPxhDJZ06zXzGuVM7c12pg+SKHgC7cfF7bXGZlV2/5rpjHqpbji5FDnRWuYG2toi5ZEpog==
X-Received: by 2002:a17:907:7211:b0:ac3:1480:a8e8 with SMTP id a640c23a62f3a-ac3301ea1demr224217866b.27.1741945417305;
        Fri, 14 Mar 2025 02:43:37 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aef69sm198431666b.4.2025.03.14.02.43.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 02:43:36 -0700 (PDT)
Message-ID: <b9bfb5f8-9e69-4e61-ae7c-20bb4f2c8d2b@redhat.com>
Date: Fri, 14 Mar 2025 10:43:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/14] media: i2c: Add Omnivision OV02C10 sensor driver
To: Ingvar Hagelund <ingvar@redpill-linpro.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Joachim Reichel <joachim.reichel@posteo.de>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Hao Yao <hao.yao@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20250313184314.91410-1-hdegoede@redhat.com>
 <455e819b9fe70ee5958d220b8eca6f9c23baa889.camel@redpill-linpro.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <455e819b9fe70ee5958d220b8eca6f9c23baa889.camel@redpill-linpro.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ingvar,

On 14-Mar-25 9:52 AM, Ingvar Hagelund wrote:
> to., 13.03.2025 kl. 19.43 +0100, skrev Hans de Goede:
>> Here is v8 of the patch to upstream the OV02C10 sensor driver
>> originally writen by Intel which Heimir has been working on
>> upstreaming.
>>
> 
> Many thanks to Heimir and Hans for this excellent work. This makes my
> workday easier. 

You're welcome. One more testing request, can you run qcam and
then see what it reports for FPS after letting it run for
a couple of seconds ?

And then report the FPS back here ?

Regards,

Hans



