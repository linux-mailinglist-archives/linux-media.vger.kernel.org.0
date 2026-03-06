Return-Path: <linux-media+bounces-54801-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCG8NozrqmlxYwEAu9opvQ
	(envelope-from <linux-media+bounces-54801-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 15:58:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E239223333
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 15:58:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E42D4306B4CD
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 14:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB427347534;
	Fri,  6 Mar 2026 14:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SokgLTTU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2423118CBE1
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 14:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772808209; cv=none; b=C/6vpXLDeHNmBlWf/H9Q4aZ2WnUiMKfu2u04+LLDcP+KRDX+1+6cch0KOjrw7f8ZvAE2BICq1DOU5wJkB6FymxrLQ+jVlfXyerjGCQE+O3HkNtsVBNB2FewHspW56Ng11UFODfpngh9+KK0/VC0HfERYDO11r6PljqYZk2hBysc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772808209; c=relaxed/simple;
	bh=8tkDEwM2asPohBzdRdZz2Gu73uJ0yd4QUYX/86HGjpc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JSO/4pS0qlWrRpodTKBqbwQNbQRxTiwSxvNhxGpRJ1xPiyEnyDVHLpz05RdYRxNXK67IlP2ik+8jHr+ziKM1ZfrKBCZwWa0AQBUWcvefmaK3jSF2lHBKWY5psMqJpQ6H38atcwKeFz2q2bSVzJC9m9YiHAZD/V4HkbhFg1UB8ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SokgLTTU; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48371bb515eso138271525e9.1
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 06:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772808206; x=1773413006; darn=vger.kernel.org;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mnkBKbiAwsVbbilQBNTs5Gb2aWXP6aakLa1Sqz5ipyw=;
        b=SokgLTTUr2H751OQnXqWIiOqjxmZ+y26EbscThH/7RBjUtuy9z/er9Yyd5GTqaGwzz
         ZO9l77s+X/K9nuYWhP3G5ZNdY6AY9N/SKydHxnqeBCNJMgOFLAo3ZAd1ccAsJsJ3ZJ3J
         +pwP/L7+5ovHhH2LULzpvD+cRSD0EDMNViBsXv6Be8EllFyWnYsDPTrOriYLapTsVacb
         T7vIKDA4EYFIgZAm+CuJH6HAiUvSIsikXyqhkLUeuLk0J6o3LC93/gMLinjpiXmw2uuk
         kR0eYxvG0mgERN4/8VrSBhE4NM6ION1bQuk4GEzDKOU9Tm8THQS5Yn/+/k5k6TboxNg1
         +uiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772808206; x=1773413006;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnkBKbiAwsVbbilQBNTs5Gb2aWXP6aakLa1Sqz5ipyw=;
        b=IHVe6NyBsvr3UVu7ciCHMFBwd2aBHuARK21klXf6kr/ANOhRUweVa/PreFfRPmczR/
         cSiTOcuKTTxYGoUxX4aXA900bUPGgA1T7OASZoEaxDIGjRl/lwJ3xquLqubMtW3PHYaC
         UNxp6KH08rthn42OLHq5lQNXvwvRufqzPOFqk0BP6hmiT5G/U6otYr2dbUH/dgO++H4T
         n/mEwJqocsto15CEGLR9tnVO7fd3ozJ/WXpl/7u/1fijuQMIMiPfAyeSzvUWvzYy57CS
         y9eZKRA8U4jdfTTzvXaBwmACxKPmlSDQ6lBqRC3kfZ/4i0P394jsFnCLJMqbXHN7biJ1
         KMdg==
X-Gm-Message-State: AOJu0YymlJ4sa0DFfYOke5txZLYTyE1wCpk5J6IPhAFsusxI4dxV4Abp
	ZMn/0N7d6a3Lt0Z0jCqv+XGaQahw7vtGZAoHtPOo3bgXjawcbrMdE/QcWzm7ai17o4c=
X-Gm-Gg: ATEYQzwcCWpM4edPYDVa+KhIBGmp4aaB10bzHNvbns1IQyVOKMiwGu013prLsE52lZf
	PF+AqpYkBqIkMJY2YXMI39m1xro1nRIAqflrSchiLqEIQ4GbN+gWF8C9zykh9YALCGzDPXnH00O
	SkthN1f3OZNpl6K/syOTboO6ez6SnEOjtSnwiZNG2OHi8y794vJ3bNl1pfNAcsVmRp7KFCW8vAo
	KofJnSTz/Zdjd7ktQXTSqtJOFnqUZqwJNtEb5CJn+2iKxv1xDryMM3iZGfE5RV7/UOP2Uvl4RDS
	soESNOnOkZYnQoxyHqSU3Zw+DNV4m3ll6tGvgyluWDVjtW6BD3PsU7bl4YPlT4mfzLV7alr+wzy
	o1aI/KhZ5k1vwNqrx6ZTmZ+bb6u+UMbbnp802350D4kmYOuTtk2rFI/fDOvikzYImaAcKe5TJgx
	dLJk0VaUL+V4QZHUd+XLq9fjzMOLi4C2yCfgvtaZWbsBdZVl2z8w==
X-Received: by 2002:a05:600c:474f:b0:477:af8d:203a with SMTP id 5b1f17b1804b1-48526964c79mr39805115e9.27.1772808206465;
        Fri, 06 Mar 2026 06:43:26 -0800 (PST)
Received: from r1chard (1-164-74-26.dynamic-ip.hinet.net. [1.164.74.26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840ad894sm32276145ad.80.2026.03.06.06.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:43:25 -0800 (PST)
Date: Fri, 6 Mar 2026 22:43:20 +0800
From: Richard Lyu <richard.lyu@suse.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Richard Lyu <richard.lyu@suse.com>
Subject: [PATCH v2] media: staging: ipu3: img-mmu: fix sign-to-unsigned
 conversion
Message-ID: <20260306144307.670648-1-richard.lyu@suse.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.51.0
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Rspamd-Queue-Id: 4E239223333
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54801-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[richard.lyu@suse.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,suse.com:dkim,suse.com:email,suse.com:mid]
X-Rspamd-Action: no action

imgu_mmu_unmap() returns size_t (unsigned), representing the number of
bytes successfully unmapped. However, when the alignment check fails,
it currently returns -EINVAL.

On 64-bit systems, this negative error code is implicitly converted
to a very large unsigned value (18446744073709551594). The same happens
on 32-bit systems as well, although the resulting value is smaller.

Return 0 when the alignment check fails to correctly indicate that
no bytes were unmapped while resolving the following
-Wsign-conversion warning:

drivers/staging/media/ipu3/ipu3-mmu.c:393:24: warning: unsigned
conversion from 'int' to 'size_t' {aka 'long unsigned int'} changes
value from '-22' to '18446744073709551594' [-Wsign-conversion]
  393 |         return -EINVAL;

All callers ignore the return value, so this change does not affect
existing behavior.

Fixes: 26f5689592e2 ("media: staging/intel-ipu3: mmu: Implement driver")
Signed-off-by: Richard Lyu <richard.lyu@suse.com>
---
v2:
- Added note that this affects 32-bit systems as well.
- Clarified that all callers ignore the return value.
- Added Fixes tag.
- Link: https://lore.kernel.org/all/aarQeHfQuq20gXH0@stanley.mountain/
---
 drivers/staging/media/ipu3/ipu3-mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-mmu.c b/drivers/staging/media/ipu3/ipu3-mmu.c
index b196a5815903..fcea125e5935 100644
--- a/drivers/staging/media/ipu3/ipu3-mmu.c
+++ b/drivers/staging/media/ipu3/ipu3-mmu.c
@@ -390,7 +390,7 @@ size_t imgu_mmu_unmap(struct imgu_mmu_info *info, unsigned long iova,
 	if (!IS_ALIGNED(iova | size, IPU3_PAGE_SIZE)) {
 		dev_err(mmu->dev, "unaligned: iova 0x%lx size 0x%zx\n",
 			iova, size);
-		return -EINVAL;
+		return 0;
 	}
 
 	dev_dbg(mmu->dev, "unmap this: iova 0x%lx size 0x%zx\n", iova, size);
-- 
2.51.0


