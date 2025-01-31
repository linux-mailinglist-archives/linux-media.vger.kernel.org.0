Return-Path: <linux-media+bounces-25457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A60EA23CC1
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 12:12:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D83EF1889B44
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 11:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21001BD50C;
	Fri, 31 Jan 2025 11:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MKm3TU8O"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA04814B08A
	for <linux-media@vger.kernel.org>; Fri, 31 Jan 2025 11:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738321949; cv=none; b=nb+Nukpr6QzARCV9FYcM2cy2Kach0KxOcj5LzZbCMs4g2Qbdc+72Mz+/hrvsYHrOM1dlKCCSGUdyACoPZal5wcKWVyvQZYNnZaQN2ygddae1Wdyv4PgritCXl7UoukzadFo3Fl9o6tWkYfR8T73ZzU8QMB90CdXQdhPiFGjHWWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738321949; c=relaxed/simple;
	bh=yg/Lt2ysuWv9I9rPBWepmPkepMyzr7KTiJFtyVqGRdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ahNhoUtKkyn+Rpfqr/K3EicyfQeFHDydPIH5nUnYKHKwAJUG+xXBffPuYZn+Q6B1kCzg+0sTUw911/IseFuTpDJXS5xk5cMqqFX77282ESuH6sUojLgy3nsE9pxYBQt8pxP732vRIM1Eqvv0IQxhI35j52M7kTKO2cSDE3oqTrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MKm3TU8O; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738321946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G7yBNOiQCNZ/P7gzgB5WNvDKqqvaDIBkc8HpMptciP0=;
	b=MKm3TU8OsU8bxb1sgllJwD7wWj9pZRqpdqZENanMJUJUPayeS092lIWXMMBqvogZg9O5d+
	czg3UMZbZJ/bpX2VEfw2W0azGnqavOU8iogXNktJxTmSA0dg7l0rWV5KrhKvNcE70tM0HZ
	HyhuUy1FMZj8JgNO2zcuDAb2h8GkjfM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-BDAhn_eCNhScsYm9Cdzxmg-1; Fri, 31 Jan 2025 06:12:25 -0500
X-MC-Unique: BDAhn_eCNhScsYm9Cdzxmg-1
X-Mimecast-MFC-AGG-ID: BDAhn_eCNhScsYm9Cdzxmg
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-aa68fd5393cso184356966b.0
        for <linux-media@vger.kernel.org>; Fri, 31 Jan 2025 03:12:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738321944; x=1738926744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G7yBNOiQCNZ/P7gzgB5WNvDKqqvaDIBkc8HpMptciP0=;
        b=oZkUMXKvgFpiwsW2jqZBN64It+oRKy3iINxGRUfzSz79PUSQNwmw79Aex/mir14u9h
         Dhba8BSr858jNIS6o3Mhf+v8e9lvapi5au48yWs3NT2siwAJqihR4zU/Vnb8nkD0VWkE
         k8D553Yg6fAuJ05bNCOVeqIse9CDw++Mfm4hgopG8Ps4biKuzXEQAFLD626X45lO/ZDx
         MMMXfzkT+tP/7BSKkjUYjGwo4UuayR6Y1qnIn/cfHfBuJsMCuc4lZDM2aBaPuii9CPxB
         srIL6hYbnHF05ro1LnOEfJ8knDU6UZzopYoGayILrWvIIvVzkDWjFZhVf/YFjHnTw6a7
         ETRg==
X-Gm-Message-State: AOJu0Yz8/yNSo/sWrEXioNwmo0D8PwGBmRNGMi+ap6ksIpwCnHxxDB1C
	/aKT4fMzucylhmtArZGZ6BghTe1lZevOsl3LW28a5vs8PCAu8vbwfWYUCgQR+Pos5+mobW4cR6a
	sEamyqgHsoIIjjIXwsvbcR43kVs/d7e1JTLsu0POFUbcbMu8l/TDmzToCTwps
X-Gm-Gg: ASbGnct9HLNQMH24btMkP292UWKDH2YBrPpz0J8fW+YSNKuyyZaEa9bj/f9EYvHoi6B
	boj6Zk5MyC2n00DF2WlOqlrweLOGjb8aU6YunpxbI3jvFKKbdb7b3EFVTwatAP9CGlnvf3SEdNA
	A4w5o5R13Fom+uOcu9MFlk3TwEoqI+8x3Ev2sm6DN2okCxlNEM3+kLO6NGZ42A+oj8JUa+ver9v
	GqFVxbVEqx0rUf2La5uTQoUTrSVyGjrbqcdZ1/vi78Uk2vSS20vADPQJqvj2ag6rPevyV1YGaOS
	dD1WA3YjT4rI8ZgHdqitAnWqkR/lAGuaYnRDTvXdbOhceeCCZAIaZCzgD47xOOkChRlxaRauqW4
	JNDHqCJh7imKKhWA8h7mP9qx9sndQY3aM1b6eXkVOwzYbr/+XFcLedxM=
X-Received: by 2002:a17:906:7d13:b0:ab3:a4bc:ac4 with SMTP id a640c23a62f3a-ab6e0c7bdf7mr623131066b.18.1738321943782;
        Fri, 31 Jan 2025 03:12:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFufVwMC1BOfbNuUtqaJkfIYdbV5IndItjiBgG6GyF+OjoG3pcocYwMqCn1Klku3jxhTHda3A==
X-Received: by 2002:a17:906:7d13:b0:ab3:a4bc:ac4 with SMTP id a640c23a62f3a-ab6e0c7bdf7mr623128366b.18.1738321943339;
        Fri, 31 Jan 2025 03:12:23 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a00002sm274584966b.120.2025.01.31.03.12.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 03:12:22 -0800 (PST)
Message-ID: <6d67c5c2-be60-454b-b03c-ed89c74262b8@redhat.com>
Date: Fri, 31 Jan 2025 12:12:22 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "media: uvcvideo: Require entities to have a
 non-zero unique ID"
To: Ricardo Ribalda <ribalda@chromium.org>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 hverkuil-cisco@xs4all.nl,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, Tomasz Sikora <sikora.tomus@gmail.com>,
 kernel-dev@igalia.com,
 syzbot+0584f746fde3d52b4675@syzkaller.appspotmail.com,
 syzbot+dd320d114deb3f5bb79b@syzkaller.appspotmail.com
References: <Z4aeK4Ct7L/9kR2H@quatroqueijos.cascardo.eti.br>
 <20250114200045.1401644-1-cascardo@igalia.com>
 <CANiDSCvx4QrAuhXgF51W+-B4XJU-6bxTd=5vCuw9SPmKXDXjdQ@mail.gmail.com>
 <CANiDSCu6ociHkyatMHpH5a2TDsMmHNr=f7-wvpwGDSTw=DKNhQ@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CANiDSCu6ociHkyatMHpH5a2TDsMmHNr=f7-wvpwGDSTw=DKNhQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 31-Jan-25 11:04 AM, Ricardo Ribalda wrote:
> Hi Hans

Which Hans, me or Hans Verkuil?  Since this needs to go out
through a fixed pull-request I think it would be best if
Hans Verkuil picks up the revert directly in the fixes
branch ?

> We are seeing a spike of reports with the signature:
> 
> "Found multiple Units with ID XX"
> 
> Could you take a look at this patch? I agree with Thadeu that the best
> strategy is to land the revert asap and when the storm disappears work
> on a different solution.

Ack, Fedora is getting some bug reports about this too. Since both
you (Ricardo) and Laurant seemed to be on top of this I didn't take
a closer look yet. But this definitely is hitting users and we
need to fix this.

Since we still don't have a fix yet we really should revert the commit
causing this problem ASAP.

Regards,

Hans


