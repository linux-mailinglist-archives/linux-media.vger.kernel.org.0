Return-Path: <linux-media+bounces-56457-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADyuC8HdvGmb3wIAu9opvQ
	(envelope-from <linux-media+bounces-56457-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 06:40:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEC82D600B
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 06:40:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 76E863014289
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 05:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 060023009E2;
	Fri, 20 Mar 2026 05:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ts678KlG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262A92F3600
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 05:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773985205; cv=none; b=ccHrsFlT1FoZHlqBJsTwcP+E4ca7DfZ58u9SGwVhzzRMkvRChMnIVvzBq9x2e8e+7jPAahJZLsyyMo/6QrnaB+4S/O6FBo/5XFnh+wGYlnbJcCp9bR+r+Hc2ErvGkHuARYF/z+MCbWLwnew+MGQZWV6VZZEKsPx4d3nnSWWE+1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773985205; c=relaxed/simple;
	bh=Ae22RPic1YEH5csFBH6HCV3HSnfo+KfeW0NO5YO2dJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aaoHGCPRtmWc6lOu6anpXQv6iKrrlW4tPHhLSgw5FzrUIk933R0UnAa3UMsZLAWta3xS0okxOfUVeFXRwXp2bjO+nKr5j07Y37SCVwio/yEo95wXCnN9BCz6ij2L7Y0mZyS1GG+xmrM2QskJmJ3w8Jm0Mw9qIlR0q9mmhQhTcjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ts678KlG; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so12935545e9.0
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 22:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773985202; x=1774590002; darn=vger.kernel.org;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BPHK7nGCZz/oSDUy2MClP0uGtGGKcCDrTU26qey0lE0=;
        b=Ts678KlGu1/gVuP2FXnWTXdRfvLaepyGBDh5r3EDgTG1hWC0Mmwtssolr6DhOPBBKJ
         CcDPFnaOyrv6JyT2JOqPdbvQwRL9B6p/LFtleJowLz5oGFLXzazIxYbjTVgayyiE0y+X
         7HuvoNWZhjPevEG/yPkdDMO4fZpU5p54pTLk3pzBaWYtLgver9LBiGVpmZlDgytlJHhV
         MzeBj/QSsbX+YadOPr4xAp2XgXRId+qnpfccmeuqqGYq4j3DjO8Jxdl/sHVVizu3tk9j
         Dj6i3wLGU5K1w4ou8bVPJz6+I1vrjwi/BnV4SQqr8w0kkSWqteGyuIudn68winuBkZxo
         foGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773985202; x=1774590002;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPHK7nGCZz/oSDUy2MClP0uGtGGKcCDrTU26qey0lE0=;
        b=kVcWuTLp6+2Pu5+k/nLqxW4E8AsKyKCv88YbATkBt5NiXjNxq3huXSiyOFGuFf7Rx3
         bnG1068twjFkUXTUoTvPSZN57YewPQBvIMVHWj/EKdUzz76s9nwLeH62B1TMu75rnRU4
         k1agL/my2KItkpkPTkFN/Ixh/QhRcIN/oC8VI0N7QeEWXSYSU0zcg7OgH+L1q5ynfLZD
         2SlV3G+xAy9y16l4epoFhzIpSnxeX/HK1/igrj6u3JbI+m2oDk5qoDeGA1U0/oikU8H7
         mqJqcKRZCwrg0T/EbtUbGBsShPk8Fl6/jCSTBsksBmNdAq8/fqy5eJImG6dqFKbiCP6h
         BDyA==
X-Gm-Message-State: AOJu0Yynn48NkkJCEZYOWQJCejRwbgaVtSQIquBGp1yqoFh46hP/5Yar
	bcjHxzhcNfeyXec5GNf3IULMiBZ+iWRDP9phqR+g51bR5EUXTCP2Zi+0huiITpfpyUE=
X-Gm-Gg: ATEYQzyoSw9POJdzZG1+V5ncbg637LPQHFLNCmqUcEgfIxH1d9vY5CG39S+TNlJl8m2
	qr6HUBr1KOJQFUcxh3zJ3yXW2qohTHS7TUjBaqhnZHkJQOOEG/hmzoEe+mqXGoZwlx+0DVamN7O
	Y8wu4mx1i9OwyHlzXjRUv4CxUzw3+ZiETgJxFFR+yU16nvT0mibg8yNXORanwXqC/PXHh4jNS3/
	13PxSKUCB3EzCKD9Jz3vzmiDQNX1gKB/oZ4d3ii5ISCdv3lZ4opWFTsr2akVSOJ3O3m3DHe8+ks
	LcP3VEUC8msYQN2V+22QoQ6DiJHQ1kn6zlJ5jmRlamRp38aN5tQ8AC2ZfbNmtwKgAgbSKehJjWE
	cOkr4SYKZ5/ghui869T8CLGo1W06/4mk3E2J0eb0Mwz31+TUBlS1PcKSOpA2oct/vyi+NhkiT/3
	0XoMaiPNol4tAaX4RO/pRbn8g9GFucCpRHJuKD/6kTnrbb7dh55Q==
X-Received: by 2002:a05:600c:83c8:b0:477:5c58:3d42 with SMTP id 5b1f17b1804b1-486fedbd0a5mr21577325e9.10.1773985202413;
        Thu, 19 Mar 2026 22:40:02 -0700 (PDT)
Received: from r1chard (1-164-68-48.dynamic-ip.hinet.net. [1.164.68.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd410e7b8sm785693a91.14.2026.03.19.22.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 22:40:01 -0700 (PDT)
Date: Fri, 20 Mar 2026 13:39:57 +0800
From: Richard Lyu <richard.lyu@suse.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Richard Lyu <richard.lyu@suse.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH RESEND v2] media: staging: ipu3: img-mmu: fix
 sign-to-unsigned conversion
Message-ID: <20260320053914.52916-2-richard.lyu@suse.com>
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
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56457-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[richard.lyu@suse.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,linaro.org:email]
X-Rspamd-Queue-Id: 4EEC82D600B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
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


