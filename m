Return-Path: <linux-media+bounces-57312-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IENdFw3Nxmn5OgUAu9opvQ
	(envelope-from <linux-media+bounces-57312-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 19:31:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 506CD3490C3
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 19:31:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4C60F3004C86
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 18:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E38D40FDB3;
	Fri, 27 Mar 2026 18:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="as1TFFnn";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hWOJrg4W"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE4440F8DB
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 18:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774636269; cv=none; b=WmxsSWFw+TSBfeang4TetSq+SZeaKdeyv4L6iZxjCiMhiN4ASOI3u2gX39C+sewEtVahXKKt0VAPvqyR+0sd3Uo6YSMCMO6gRIZ4B7q+ujOXPHMlwhXaQ+KbEJedpYyRlLMLfINqZg4B9jPjeD0tnCn+0+Gf9RLR8hbZCjXbB4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774636269; c=relaxed/simple;
	bh=Ifcn1AfKDzBS9qJI4NReDoaj23BTLnMBIwTJc8lvNR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=abW9GERLtjOr8zg4374ffNgfXBwNjCXxiIahRt+Str4P9qx9V1YmIyfJMhO0WmiZAHcpdfIvtDKpLbOMVnZeHp8mYqmhtR1wMPyZS1b6an4Y8Zus2bOWIKp5z6C9MXYNmrcoA8s8zsYt5xcpS5TZvv+KAvkGtxQD8JmIirioNyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=as1TFFnn; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hWOJrg4W; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774636267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5iEHOk6nNhGlwlFUIMmU5iNZeSjQ/0MnQ4ckFaUEcIE=;
	b=as1TFFnn0JHHMjtJg4dJTTcVliy1od8+udKlpqtOSxSKnKmYcaJjbG/AvAMTUrgZlNDqtw
	9y5LyodoVCym1iXd3rmRZRY/vbe8u/iNQfrN83VfbNPZOIAOW+Cg8BZM7I+yuROYEF9jgU
	wM0eiT/cqZi7qTsoju3K2BIPoZ6/THQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-PBr-1h3BNPm9AIGn96HCjg-1; Fri, 27 Mar 2026 14:31:05 -0400
X-MC-Unique: PBr-1h3BNPm9AIGn96HCjg-1
X-Mimecast-MFC-AGG-ID: PBr-1h3BNPm9AIGn96HCjg_1774636264
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-487219e0800so15031485e9.2
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 11:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774636264; x=1775241064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5iEHOk6nNhGlwlFUIMmU5iNZeSjQ/0MnQ4ckFaUEcIE=;
        b=hWOJrg4WohUUK3Fnlxva9gAr2uq4/NpSSMXZrgZO16q9ZA8NMwtyQ6zrJkerI+5UPQ
         Gqw14HW6iflgNmpE8TYN5eHQmE7wHKDLgwA9NvnJk+zGcKd5VKXFnPK0gCCtLCB7RUwy
         VOCr/4NAh3YhyvBDe1mueRLD89iXHfl4DaResq2jW4O2ATETcxrL5OfLmp1DuRx5Ofw5
         PfLj9mjVIQLzQoeGNqAn+8mXj+l84eEIVQvnpd1U5z4dHnUBOsbH6FcUYbdZu/1fSPz8
         iKbyPdT0/8mOsl7l7SveyRQGsHm9mFzGBfHkGi2TGof/7VkqzX1JtEYByLtj1GFKji6G
         w16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774636264; x=1775241064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5iEHOk6nNhGlwlFUIMmU5iNZeSjQ/0MnQ4ckFaUEcIE=;
        b=coyqPM/fUjrg3QYi1y5orjb629SUD7PW9w5+QOwd3Cj5qOeBK2xpJ5Oe/mELvTwKoA
         gsru3/etCXarX8Nv/dPFgfJp65+p4TovJVN/QTHtOlH1n3O8wBgbADD8lVu+7nfgCrBA
         7zMYN4MBVgBuaaSRf5P+p2LGsuVFt5PdXrwfxVJ56K4+ZZ4xyZm5Twpi0Rcv7uuQ99cG
         JGuKo7zMDpLiJtefPIXE8qpw+VZ06hXlHn5CHqIjcZA98dXkubXc6rgsFedf0QQr/w+Z
         b4FYWdro3WIlwlJjQyNZW/QJtZfv6hZhCOo2CmEHtlxm0mYfoo/Gs4bNr2uZ7Nd+MPe+
         Rbbw==
X-Forwarded-Encrypted: i=1; AJvYcCV4PHKIqJMH/rDSk42/c3WLswar0sBWKmsxZhCTX+G1SsdtANOwqfThzU8GVxaJP2RhiB3Rn1lKJrUydQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJt4+vWgXudSQpj4Z+ZxNCIxRayXitLEe03KQ0BWDWV+rqSgI6
	H4vRADj3OZHBqsV9E+/arPkhty7OA0e2GbRgPFYqzKmPHGz69Hvbzcol033S7jVGxKkbiMqClVT
	hs5poFtY6VRS5F9YXoa4DO3ilqM26t1NWA9urrkbNu//LQY44DLP1FxC7VwgScjB0
X-Gm-Gg: ATEYQzyJ8qbVOXnW50ZPfHabI0f9VuyhIIbhM2ywsY8pQCqCt/0+PUG9fGqq0xxnixe
	JMbzgUxQ0Q2m7Nc8zilZOjlC4iegquPnJEbE1OPo/Mt/gsqRolFgC1u9YGBH3+WSM9zFUuIujvj
	Y/6hXvhFYU44U6LcOUiPe9BlVPR18JC/HjjNw2lr+c/b+0adLZzHUGPOYPH7YQ1GfQ6kK7yCohB
	PlSRGoNWtPkhnTV1qO6m1hsn5W7OHba59FjGtLM1DK+RIN2GGUOmKbvyAWMt6AVLTfrHKLkvAMM
	/BPpYQ+tIfJmgRp+Skshys+qonmKGqWe6oLhhftzEXFLYoO1CE8Zo89PKWUZU6uDli7jKJ2f0VU
	4c63/UEA2CBZoVLg0jHP7pD8YVMEAfSboCxOBl7w5yoFYuvPgvPbz475L
X-Received: by 2002:a05:600c:4e08:b0:487:1fb4:7b3 with SMTP id 5b1f17b1804b1-48727ef0cc2mr62499395e9.23.1774636263740;
        Fri, 27 Mar 2026 11:31:03 -0700 (PDT)
X-Received: by 2002:a05:600c:4e08:b0:487:1fb4:7b3 with SMTP id 5b1f17b1804b1-48727ef0cc2mr62498965e9.23.1774636263168;
        Fri, 27 Mar 2026 11:31:03 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.11.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c9506dsm106101905e9.7.2026.03.27.11.31.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 11:31:02 -0700 (PDT)
Message-ID: <b38d2d08-7ee3-4356-94b9-d9c885238cbf@redhat.com>
Date: Fri, 27 Mar 2026 19:31:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] octeontx2-af: add WQ_PERCPU to alloc_workqueue users
To: Marco Crivellari <marco.crivellari@suse.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, Sunil Goutham <sgoutham@marvell.com>,
 Linu Cherian <lcherian@marvell.com>, Geetha sowjanya <gakula@marvell.com>,
 Jerin Jacob <jerinj@marvell.com>, hariprasad <hkelam@marvell.com>,
 Subbaraya Sundeep <sbhatta@marvell.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>
References: <20260113141248.203944-1-marco.crivellari@suse.com>
 <CAAofZF5k1SO-RwfgZMvDTxJ2Go=NZuPEeGFM8gF==ZQzh_SXKg@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CAAofZF5k1SO-RwfgZMvDTxJ2Go=NZuPEeGFM8gF==ZQzh_SXKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linutronix.de,suse.com,marvell.com,lunn.ch,davemloft.net,google.com];
	TAGGED_FROM(0.00)[bounces-57312-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,suse.com:email]
X-Rspamd-Queue-Id: 506CD3490C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 5:03 PM, Marco Crivellari wrote:
> On Tue, Jan 13, 2026 at 3:13 PM Marco Crivellari
> <marco.crivellari@suse.com> wrote:
>> [...]
>>  drivers/net/ethernet/marvell/octeontx2/af/rvu.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Hi,
> 
> Gentle ping.

I looks like the above patch did not land into the netdev ML. You have
to resubmit with the correct recipients list and including 'net-next'
into the subj prefix.

Thanks,

Paolo


