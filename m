Return-Path: <linux-media+bounces-64419-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id prcQAJBJKWrKTgMAu9opvQ
	(envelope-from <linux-media+bounces-64419-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 13:25:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 682FE668BEC
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 13:25:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=snu.ac.kr header.s=google header.b=MSOHkiDk;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64419-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64419-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=snu.ac.kr;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F52D320704E
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 11:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69FEE3E3D94;
	Wed, 10 Jun 2026 11:18:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C638E3DA7F9
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 11:18:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090308; cv=none; b=heaA3pHQFTv+9KqEasrMeqVPRPjyMsNalD2yIWZKyfJuQ6vsqRtSIj13+TyPLfCZ6cP/Y9fSlMEb/NnyO5aDZE/WknATOXKtJBHr2FtCtE6pgCoLCm7f89Ua8+jcvSG2ASyab+QiC7q6XHNF9kgqsCwg8sAk4yVMmQAV8w4UQBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090308; c=relaxed/simple;
	bh=2isqjD9KQSWF4L2rWjSpFxgqr5741UE2UOf6ex0MSSQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bLMhYQ2ZSQ05nxG7TIKz9BCTRxSV0ksO63dR1QTpYxdC5jPrfx0x1bnTqhG7USFWaeQKG5g2V0PFZP4XjsdtzTvUIAQlXHoH4NAatAOFVMaCYscEXKmrd2z0nZZk/zuYNfwq2pAuMaW0VKpHF448/R8RaqDkSauwD+5HgbXkWmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr; spf=pass smtp.mailfrom=snu.ac.kr; dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b=MSOHkiDk; arc=none smtp.client-ip=209.85.216.54
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36baeec21dcso4297864a91.3
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 04:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1781090306; x=1781695106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EZQt1cF34ep5R6ildGqhjs3qA2y7slWIIyH3CSzB2Uc=;
        b=MSOHkiDkXd8uZMJDNPuKmMLRfuY+Xxtct6QAiUAEotKgfgiNAD95fiJZIfJJAp9y7Z
         V+b5koPTz8kUgTls1/As21jYCCIwQZp6FU39Nr4kd8C0insh5UfYuaK8PL3EmvPHYd0K
         Nfnn4nrr0sjtzQxmIl0vH1P7uvCUOvUG/voMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781090306; x=1781695106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZQt1cF34ep5R6ildGqhjs3qA2y7slWIIyH3CSzB2Uc=;
        b=IVG7Xa9kTnRe9/2tpJg6whsFl+69bCEH++LrQxl4NYsy6AtYnRNwoUPzeESo7NJ5or
         m1mv7Dhig62WDRjJMPhEy4Zp7uv1lsz6cmS2ufacmI+isF6+ZlxXLxw44mYcsESKCkik
         DIegSWqKxamEyvv72g7v3AEthVjYnjpMxeyNy4ucF7ad3UPMoVQ3Zewjflo0fY6ysx8P
         RdGRYp9q6/6i3lD2WgqXJT2CD3rhUiFYMhEaaPB+MH6w0JewmZT8rJbP0gZj8kXEXOfm
         W24cUvn7Fuleq2LZZm/sgR8iySpl8phpTyPpQcYhLSqUy/IyYL4E9U53sdyeMiQYjMGY
         BYWA==
X-Forwarded-Encrypted: i=1; AFNElJ+UgiIHtvq8Zo2vROLOEqgElIBBhVYf5dR45NYPFEcllAfq0nikdI8rq1UYrCThiakTo2hP98xwLiPowQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6ce5BCgOB5miDZH6Os76c7mQDyprA3Vm6YSJ/A5OnvupWhrjp
	f97xYcyBFevQcQkKcG4kgd+gbkN/uo9vxJdRSiyv+WnjGoRQw2w336UKVr9PcfQapmw=
X-Gm-Gg: Acq92OEfguF0PvOmwqJLKd7sP1KkmeXDhgTw70vfjSclU9cXAiWz3QXPkpgZL9nngSh
	hRW/8QPBpP6DL7fFVvbSNdYaMZsmEzhzBe8s3Jnk6D30AkOFTHWAbcRbixMnOmhWIwzrwcih5SZ
	Ez502iUw2lJ3iftsErCmy4/MUlPANlKk3pfT10SBSR+qbHg0fvScCfHpUTyuqcZ3hB7vqYXepTn
	Jadp5HS8aX2F3duZca0A/Lcx9WYNQaRvLRq0BcJNgQSAxqXsVR3cuN0T1CtscAr/yQ20GB1vEpF
	SQ4lExmtCtdEAyHEOMSVWeHDqQa49gPadbeKgBWJ/exyu+u6gxzp1vooMV4zFwXTche+U6NoYBh
	j4Ivg9Rn31oY6vbm7kn0HkoZhazCQrQ7xJWgA4aj8ggP7QlpRS2Ee/qXB8NPuzyPkAgi5Tm03wx
	rS0kOOc2bxUKdrx4rrYGHC6uyG6duUV0H6pA/+vcGnti0POEB0j71DcL5EjGbie3vz7cc=
X-Received: by 2002:a17:90b:4a12:b0:36b:88c4:46f0 with SMTP id 98e67ed59e1d1-370f076d902mr25942890a91.14.1781090306199;
        Wed, 10 Jun 2026 04:18:26 -0700 (PDT)
Received: from nunu.. (nunu.snu.ac.kr. [147.46.112.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3762175af43sm2664343a91.5.2026.06.10.04.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:18:25 -0700 (PDT)
From: Jaeyoung Chung <jjy600901@snu.ac.kr>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jaeyoung Chung <jjy600901@snu.ac.kr>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sangyun Kim <sangyun.kim@snu.ac.kr>,
	Kyungwook Boo <bookyungwook@gmail.com>
Subject: media: ngene: BUG: spinlock bad magic in irq_handler() on early IRQ
Date: Wed, 10 Jun 2026 20:18:12 +0900
Message-Id: <20260610111812.669938-1-jjy600901@snu.ac.kr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[snu.ac.kr,none];
	R_DKIM_ALLOW(-0.20)[snu.ac.kr:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64419-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[snu.ac.kr,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jjy600901@snu.ac.kr,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:jjy600901@snu.ac.kr,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sangyun.kim@snu.ac.kr,m:bookyungwook@gmail.com,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jjy600901@snu.ac.kr,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[snu.ac.kr:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 682FE668BEC

Hi,

ngene_start() in drivers/media/pci/ngene/ngene-core.c registers the
interrupt handler with request_irq() before it initializes
dev->cmd_lock with spin_lock_init(). If an interrupt arrives before
spin_lock_init() runs, the handler acquires an uninitialized spinlock,
which triggers a kernel warning.

The probe path, in ngene_start():

    stat = request_irq(dev->pci_dev->irq, irq_handler,
                       IRQF_SHARED, "nGene", (void *)dev); /* register handler */
    ...
    spin_lock_init(&dev->cmd_lock);                        /* initialize lock */

The interrupt handler, irq_handler(), takes the lock:

    spin_lock(&dev->cmd_lock);

If the device raises an interrupt before spin_lock_init() runs, the
handler acquires dev->cmd_lock while it is still uninitialized, which
triggers "BUG: spinlock bad magic" when CONFIG_DEBUG_SPINLOCK is
enabled.

Suggested fix: move spin_lock_init(&dev->cmd_lock) above request_irq(),
so the lock is valid before the handler can run.

Reported-by: Sangyun Kim <sangyun.kim@snu.ac.kr>
Reported-by: Kyungwook Boo <bookyungwook@gmail.com>

Thanks,
Jaeyoung Chung

