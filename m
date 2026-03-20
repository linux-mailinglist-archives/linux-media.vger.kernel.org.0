Return-Path: <linux-media+bounces-56456-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPYFNJjbvGk63wIAu9opvQ
	(envelope-from <linux-media+bounces-56456-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 06:31:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D665B2D5FA6
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 06:31:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 13104301021A
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 05:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBEC32F549F;
	Fri, 20 Mar 2026 05:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QDL1VFs8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2424221721
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 05:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773984656; cv=none; b=CYOf1MFmHmjs05i4NKEOmgN040KJDs64+2WTs8YFoOF37lf4VHTRVa4qpoX7XQQ89Cq7lyRDyJgzvnT5pAdw+MmBRcu8Z1P06cB04S4NanK/+51lK8azwoHH9eLD4dmj9yGgedCpY7XmgCzp0XNB6EemW+OKGJHdAG3dqG3pxlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773984656; c=relaxed/simple;
	bh=Ae22RPic1YEH5csFBH6HCV3HSnfo+KfeW0NO5YO2dJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VtadqXnNCepeNXo03uZ7oIT+6BIdPmpRgJSfGIOA7PL4rdEQ4am92jn20s30pCArR5hB1P1kOjih6Kp2YtV9m8DsSqws3h1fn4KJ32PQQ8rWLc+uTjdXKvJt8A9R2CZ2ou9Rm6OthxyEI7LpbSMtW3nVoTeYQR8kENuf5eK3rTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QDL1VFs8; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so12897315e9.0
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 22:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773984653; x=1774589453; darn=vger.kernel.org;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BPHK7nGCZz/oSDUy2MClP0uGtGGKcCDrTU26qey0lE0=;
        b=QDL1VFs80/+Kdgf0IsT2h0Kip0uMx3DOaNCfx9GDJDuna83o6oJXeCwKPqLGUD+UCf
         Z6qJgPypeplxeqMfRQxPMqJ40Ta8wlQLrtPjXTiHwSa53o3+F76X8SolobBo3k9/t538
         rPKiaOXK6r5UwVTIwKtcPU6BHij8CtvmV+m7W4CThk9h05e5gTejz5V/j80xmTMZLjm4
         YNTKesFQmLpw/HzV2r9fgSiUnpVc8ur+3fJRJTM3Bf43P/WyFyhWRWpyr4y7fC31qSgk
         T68pn1sT27J8eDwsUXJMSecFZYj0Eu0aB6GBiwMhugjnT5jSEd9fKf5nLrEzBc7PzRrJ
         MqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773984653; x=1774589453;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPHK7nGCZz/oSDUy2MClP0uGtGGKcCDrTU26qey0lE0=;
        b=r3ocecLu7WFusUABdaPIP/Xajdf5ma1qKRARmg54iQvSUb0Z6ZDzA2M976PUmimwRe
         IDAItRlvkXoRk76GRFUzWqvDEVFhcFQKaooGMPQS+SUqINcJZvWFcZ2E8ik+Fl2XJ0Nq
         S4g6qGFEeZcwGPiL5YUXNXo28iwDMnJ03cw0thZtksO75JWHdujCxdBvnKuGUqcTDSGU
         xRnqUMOXxxzD89w5dxLEdpQn/fmPjbHQn+vGHuD52TMSNyyOtEyW+hTbLdwJyeXEpcLG
         VTKJv5joTtPVeKTyZlaeIgEHCqBS0TgdJqVmXqtVXBotm1eLUthDCcQq32VkujGISURT
         SIpg==
X-Gm-Message-State: AOJu0YzZGa3VldHCmJFzGTmph/l6bxdBv2/RL2qvspMt0uxux+3Io155
	M7R54FoaOjvu8kjUkb8Jo3toz1Occdn4ZbjdlUw6Tf7oQw9kdTfxvrEeDnSOu6IYPrA=
X-Gm-Gg: ATEYQzzvjVnIxNjQSt3bO2C1+5wi3qgsxsMK/Kq02YhyRGjFTn/k104S8tJ5RGZkvpB
	0SHHQOcRjdqENLtp534c9QAI3YVjIaT8fsoAmZCfFHe/oCWlndSARwUSpqSWIilZZMv+Xo9rzT4
	lWTRbTxhTtpDF+DYy0W+FW0d85H0bPydu9wMbY6+vviFZj1Y6kouh736ciJ3dJZfxePudL0GWbi
	PJyVtZCEVaTp9xaNNdakYy+zUeUNLEKFnpenS+PgSFeiuQHO1PISrYtt+Unrn06JJaaP6AGBxuo
	CWmeACWg2U5Gtio8H7ihypZR3kLvQj06K9rP4Hgjk45+AkMenOrb9x+y54cEHw/2hW+OZbRxLUH
	GlQ7EhAJ0JfOmvOSz+oifET2EIE51mkJbVKIPscAgLJMlr35fdGYU9xAq+XNophRQS8G48YLakl
	/VhSSrQ9GJrqSy5m3nCWh8qirhw9BtZbHG0JZTCi5f1hTLyuIYrw==
X-Received: by 2002:a05:600c:8b0a:b0:47e:e57d:404 with SMTP id 5b1f17b1804b1-486fee0f917mr23234565e9.16.1773984653090;
        Thu, 19 Mar 2026 22:30:53 -0700 (PDT)
Received: from r1chard (1-164-68-48.dynamic-ip.hinet.net. [1.164.68.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc612d6f3sm5118542a91.17.2026.03.19.22.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 22:30:52 -0700 (PDT)
Date: Fri, 20 Mar 2026 13:30:47 +0800
From: Richard Lyu <richard.lyu@suse.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Richard Lyu <richard.lyu@suse.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v2] media: staging: ipu3: img-mmu: fix sign-to-unsigned
 conversion
Message-ID: <20260320053046.50849-1-richard.lyu@suse.com>
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
	TAGGED_FROM(0.00)[bounces-56456-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: D665B2D5FA6
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


