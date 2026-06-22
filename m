Return-Path: <linux-media+bounces-65354-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GWLxL18MOWrMlwcAu9opvQ
	(envelope-from <linux-media+bounces-65354-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 12:20:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BCF6AEA59
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 12:20:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cFmKZ4IB;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65354-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65354-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D089D301E749
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 10:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5CF13A6B78;
	Mon, 22 Jun 2026 10:19:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A0A3A5E64
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 10:19:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782123559; cv=none; b=WLKyFQQU4hZZ/MCrNiJ5JDp3qeIqWQCprJozmlfaTlP87uoWpuMkvvM3Vnt2aqVduQKTwirkAF1M+icctplJKTRvKNz9em6dSJg30clmAR0bbjrEZF8F8H4ceszW8EUukwgwYraUYi+byGA+7/ZV+UKrJT9Q+6FSNKvAimeu4bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782123559; c=relaxed/simple;
	bh=sKS2aTEUMDyREzR6kys0PwlLGqQHwO9+VWIGYP3J6uA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=RRIYuOSdp5En3Vi3AoPjRH5BhjyCWnyH+2y86DhXPCACdDBQYlxceXCD7VIUifxY89omLl8Zd1X92lMu60EjLWcgMRRbJqNe8fmBKBohh95/6AY0A8sjSxo4ygUdo+UOglxHlqrymDeJ8CzkacyJ+mp8uBA4Art4O2xcrqaMdWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFmKZ4IB; arc=none smtp.client-ip=209.85.210.169
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-842848fd613so3361304b3a.3
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 03:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782123557; x=1782728357; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F+EVQAoNlZnF3e/ftE/uuIsUVgqqz8BGXM6PiEsWNE0=;
        b=cFmKZ4IBnX6hVb2x0Pb/zQjdjy4N6gaECfLJAPCFTouNEBzEG2R5MG/r+IO+ySkyTO
         et69oqixy+S3vB5FkrsqDHgLtmyvzsPSyep1GTkWf2Il89ZuzWYf2ThM8VBNrm5lD4DM
         Ip9QRffkm3i+tLIhZImRMb+wYZvYY38UPZ/R4GTGGdkt/vVwBC8o4juvlgrsG7vQu8z3
         dVRCYmygJuKoD8T1vG0EFJSL2FMl24ghhAzaDwEWJVuPatJ0gZE41fi4A2IUpPNbBI5q
         8NUjHfifmzDrg86zz/EuGiVgulp+++NfmzGyMRVdO8/Qs8k89flDHYUYObSte6LlTYhu
         Nivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782123557; x=1782728357;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+EVQAoNlZnF3e/ftE/uuIsUVgqqz8BGXM6PiEsWNE0=;
        b=TFy2Zw2iCTETDSHWyu13jFu0mooVmZR7nvBe2CWDlWUn6xXBwqKUSaZRFMPT5Sqosr
         2asea1fPEDyRxJKOF28E3NvMRF5uII43fTwPK+0Q2y49Z/l9DHFWU9aymga4vfd3qjRc
         FMZAEqoACK/lkrU6DERFZt3Ab58j0DIZVxpzGRXN9q6++ztVaUXncejaLWILgtFQxrMM
         U0x3IYFKCFvSOtMp8dcaSVlaP2lA/JkhepNheH3zzF0Kl2HN49vqndUgRFoWStPyRvqF
         BIZOoihI3W5XHHuzLVn+pKWrhzqC5OegQhfF3YJ2yki7lSAR2G/8OGhH+0fNq7S7YGX+
         W1fg==
X-Forwarded-Encrypted: i=1; AFNElJ8IQyjv8Nm9BydpKuxZ6TZIEdlEO/Slgk2p5YN1rJvuZF2sqndxQPkcJ/9bqMvr5HqjEPK+Bapb0exdGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqCdNN7YaotpEcMCg+ySQKY319B9/0BKdBxME55yWoIjVQIm/g
	H7BwGw4tTz5ojjz1DOR7JyS5FQH4wXAaeNyR3FAXTg1m7mBj/YeCM9wlLJuGoQ==
X-Gm-Gg: AfdE7clyBscb2kJ3LLGRg7kemWsQEHW2MS33GgYHKcW2mNs3yJJ0DHbWq8JJDhlH/46
	7i4o3vP8UYmVB5scvvgHSoewygs15C/7LPGuez4fboX51Lc24BrORMCpj3uCPmiVvbLoxOY+K03
	Lryq5J4GV3gibNzhAwdKRXc5vwemfOXyKxk9msA2J38ZxXaIYKtX77HCLbK1pyPLPEHgZvlP3lF
	W080Dnkh77oaweU3lCNECeLU0vt+WA44WPO99iIZCF3hLCvwzpOJC1Nqs/FiRQs1lDAnxm35Hza
	UeG/Gx/YzzGaIAaArn4sfpilcLL6CInbVRdsOaVJbNjxvCu0v+jJEyTofS2udQvl6dvLqZy40GH
	F7tB7P4gXpoauBtDg5ZgfeY8Q4NIhZKpWbwyRmJyuhgdzSaHDboygSDZNFkw1Idg+g9FIZ+IvHy
	exUaTk4Lv4zedQJCZ0I8sKAYy+SmHZ3IM9O2dMEcLmogkei/qH
X-Received: by 2002:a05:6a00:12e0:b0:842:3801:47f with SMTP id d2e1a72fcca58-84562479148mr9598207b3a.17.1782123557176;
        Mon, 22 Jun 2026 03:19:17 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d8a7f0sm7344312b3a.13.2026.06.22.03.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 03:19:16 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: media: cx231xx: short bulk transfer overflow in cx231xx_bulk_copy()
Date: Mon, 22 Jun 2026 18:19:13 +0800
Message-ID: <178212355315.2250957.14055476404884772489@maoyixie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65354-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[maoyixietju@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hverkuil@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maoyixietju@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 52BCF6AEA59

Hi all,

I think cx231xx_bulk_copy() in drivers/media/usb/cx231xx/cx231xx-417.c can
overflow the heap when the device returns a very short bulk transfer. I would
appreciate it if you could take a look.

The buffer is sized from the device transfer length, then a fixed 3 byte
header and the payload are copied into it.

	buffer_size = urb->actual_length;
	buffer = kmalloc(buffer_size, GFP_ATOMIC);
	...
	memcpy(buffer, dma_q->ps_head, 3);
	memcpy(buffer + 3, p_buffer, buffer_size - 3);

Nothing checks that actual_length is at least 3. If the device completes the
bulk IN with fewer than 3 bytes, buffer_size - 3 is unsigned and wraps to
about 4 GiB, so the second memcpy copies far past the small allocation.

The device controls actual_length, so a malicious or malfunctioning USB
device on the cx23417 bulk IN endpoint can trigger this.

The matching copy path in the same file guards its length before use.

	if (buffer_size > 0)
		buffer_copy(dev, p_buffer, buffer_size, urb, dma_q);

cx231xx_bulk_copy() has no such check.

I reproduced this on 7.1-rc7 by running the same copy with buffer_size set to
2. The buffer_size minus 3 subtraction wraps and the copy runs off the heap.

  CX231XX-POC: buffer=kmalloc(2) memcpy len=buffer_size-3=4294967295
  BUG: unable to handle page fault for address: ffff8881079ac377
  RIP: 0010:memcpy_orig+0x54/0x130

I should be honest that the bulk path is not the default transfer mode here,
so I am treating this as short packet handling rather than a default config
issue. A lower bound check at the top of the function would close it.

	buffer_size = urb->actual_length;

	if (buffer_size < 4)
		return -EINVAL;

	buffer = kmalloc(buffer_size, GFP_ATOMIC);

Does this look like a real bug to you, and is the driver the right place to
reject short frames, or is the encoder expected to always return at least a
few bytes? If a fix makes sense I am happy to send a proper patch.

Thanks,
Maoyi
https://maoyixie.com/

