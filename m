Return-Path: <linux-media+bounces-54731-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFFhCpOwqmluVQEAu9opvQ
	(envelope-from <linux-media+bounces-54731-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 11:46:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F7721F18B
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 11:46:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61EC931081D9
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 10:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D778D37E2EE;
	Fri,  6 Mar 2026 10:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Lgro5ND7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005BE37C104
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 10:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772793851; cv=none; b=U8z2ZVtbi8rRbMhuY351OeJ3Q102H1WLUeUkzhvCZ9T687JmOgNnGRxOB5PDgNhzL2F6V15MvXjFiEYfst2PWtvSEUQioNdqcF9HELSU/LDnXKP5PWO3OzDID4qL4s5r3sU8gM0cqiYJxMUf979hg7XeJIOjMLPRSUisJEBQJ1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772793851; c=relaxed/simple;
	bh=G4C6n0KMnLAbNREaFm3UQE/ADReUrPqJdWAyBHHz9As=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mjx3tk/1pkRZtxTQ/x3+eauotTbDRoAZ2hwgfS5elLqqqqxYS+HCNvQ25hKoarZxZP1OlmjDyrpwSH64t/IX1/C3+077yUEJAYx5V1c8ygl+63whzSgtYxNBUa66nPdTb/63sdVOYGNCLU9pYLsT0cn04RdI3ZzVj152ldgSYZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Lgro5ND7; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-483703e4b08so88528755e9.1
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 02:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772793848; x=1773398648; darn=vger.kernel.org;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9DOpbj26ZJnxNbWf0s+w7ImwLrI/solFuJ1Hpz2a8Z0=;
        b=Lgro5ND7+5uYlpmXgGioxaFdbbRdh7ys2j9TSl4DW8LbroWL3MTJR1RAjlal2ifl7c
         E7D2lUS/b3grM82/ucrl7UveITCSgtMXf88RJ/dxXuct/h+EjvS/ZsBW+U5jtTqSVG0E
         eYEJFP4KEyq2KlcmX2Nd25FC6ENcwmEcYvwyPjQqNBnHhUutUm+3maBQiG5zSjMPXao0
         w5YglE1HHGbj3q2vD/63FMrlyWP/717eTVr24SUJwPolV4bIJODPNfokGt/LOqUJnIZ+
         RhbPNJ5C/tZEj8CQrSxFMHy436F6QJmAPOnSnbZ8aGET63lPt70co+WV3B+DSn18TQSj
         m18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772793848; x=1773398648;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DOpbj26ZJnxNbWf0s+w7ImwLrI/solFuJ1Hpz2a8Z0=;
        b=AmEdhRYXpdGYtkhelk/OSwL9VZ6h2d6yUkGZMneAjqTQmwTVB16nsaFgwI57qU9bnT
         xSiQSoRwZM9xkn5ZvnX9gR5XdtIr0w6qWq2P8gJauO9mTWGkRzfmEXqINXi4V8mB8Jjb
         XDaDguBVMUktvt62GMYFlTNLygK3zT5BkgSteAh6sR6wQGPkBHyHgc8LQ6do2/vwrAdR
         6tmRL1R/e8yJjiMXIuC0m9SyiLaUjfmZAIUkpqUxLK3d+VGjUQu5/SvV27mKBeFqFiVX
         hH7hKUISZAgMcYpNsu/cQOgW9soJm94jS4FdfrsPD/N0SQ7AsiTm0D1mbN2XT8vy9r4Y
         qlpQ==
X-Gm-Message-State: AOJu0YwVEVNPJP3Z76H7BMiCJ26RS0hkAX52RYfulWcRAxW9dt2xqeEW
	zYYth1uJ00OkA389AAGUsgw31EuifDsAgkfejdqDLolRZTJExnzmm1clPvFpU2fkJw4=
X-Gm-Gg: ATEYQzw1cZd6CzKSSUx8aKzy09jmRRueqMXj2UD6bAVCd7fuSaC34qvybrujwBF8pCb
	r2l3IdR+I9paqRIAiz9fPHJP1+DWNxV40wC2Dzcpb81G98C2PQ+zQfq/ZusbJDqfJ4Z/+Ro2xxX
	4xc4QUUEknztftxMNejULOC0S8iErH7W8ZEEl05Wn2Cb+UJribRRjEUf7ydwq5AGjZPpY9UBVsF
	+v8CE0+lmPxQpk9fJurxuU3GSPux7yhjcT3CGYPPnpPlRJby8TAwALXrsHtYOEO6PshrzLBZS39
	hr4pJKmnzmkRQyH7RgaC6qtf20IQcv4VS6Iq582ZLUC13u4KlR00MozBY4bv4ozwth+rV077wae
	OBIf6Cn2DyWFdMjtX6e/rGJX0aNsO074lxVKplYlgJDqkIbXs0doJOa2y7DoXDeCxVljJm1cTyq
	peEazTRlEwg/P/IXnks/+z+EhtE//HN8/IFsdwxaNOw4l4d2DLsSEdLngy2aVL
X-Received: by 2002:a05:600c:8586:b0:47e:e0b3:2437 with SMTP id 5b1f17b1804b1-4851ee73b5dmr92071435e9.5.1772793848259;
        Fri, 06 Mar 2026 02:44:08 -0800 (PST)
Received: from r1chard (1-164-74-26.dynamic-ip.hinet.net. [1.164.74.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dadb29fdsm3098875f8f.16.2026.03.06.02.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 02:44:07 -0800 (PST)
Date: Fri, 6 Mar 2026 18:43:59 +0800
From: Richard Lyu <richard.lyu@suse.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Richard Lyu <richard.lyu@suse.com>
Subject: [PATCH] media: staging: ipu3: img-mmu: fix sign-to-unsigned
 conversion
Message-ID: <20260306104352.629177-1-richard.lyu@suse.com>
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
X-Rspamd-Queue-Id: 89F7721F18B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54731-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[richard.lyu@suse.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
to a very large unsigned value (18446744073709551594), incorrectly
indicating that memory was unmapped and potentially breaking the
caller's logic.

Return 0 when the alignment check fails to correctly indicate that
no bytes were unmapped while resolving the following
-Wsign-conversion warning:

drivers/staging/media/ipu3/ipu3-mmu.c:393:24: warning: unsigned
conversion from 'int' to 'size_t' {aka 'long unsigned int'} changes
value from '-22' to '18446744073709551594' [-Wsign-conversion]
  393 |         return -EINVAL;

Signed-off-by: Richard Lyu <richard.lyu@suse.com>
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


