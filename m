Return-Path: <linux-media+bounces-55602-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBQTAynGs2kqawAAu9opvQ
	(envelope-from <linux-media+bounces-55602-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:09:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FAE27F551
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:09:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D009830162A0
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 08:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A138A367F40;
	Fri, 13 Mar 2026 08:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="xkKzpmIV"
X-Original-To: linux-media@vger.kernel.org
Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0EB13A3ED;
	Fri, 13 Mar 2026 08:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773389343; cv=none; b=J1NS/iQm9WmlAl/9jn9qLkBDb/gukaaCjlpWvzzQ8qcjkYezLXHK8eqpu/kp0vgU0bCbTC9rcuPgzMkLU11s6LFlH79hvwQ7Ax939wUIG7Elq//KDn1dihuZgALDFM7tgg53GEw17XlCCk3/e+o6gGhWEHbrr1aTkeBrNirBH+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773389343; c=relaxed/simple;
	bh=fvvjFKck65SZYFHQ4kBwMCpihWobbYKkUe/Gmfxua/U=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=RqeTRzVv9RQXsQAKAubhG9JO1VNxQ5XhAbDKSZpG131BVA98ymfYBaNdKWsTuR9KUXn336+qn6oCdI1EY3nZgxqjtpnerPdC6MkwuQ439esXOXUpZjGKsqlI1TGNavWLMCukVzm6PD1dV9OWGWMyUePKF8oVkSoCzzFV6L+5kro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=xkKzpmIV; arc=none smtp.client-ip=162.62.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1773389329; bh=ya00xthddiIen/lRh1lGVH02PbSvGBlOmhHeyabyfc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=xkKzpmIVOLogH6/k8+5GcojzLiA1ZfjNlb9W8pT/ZX5pb45XXbg3qpujhqhJVEZU5
	 4z86aSq7aKdPdsMHY+Bw58UEiWMqGQ/ZKEyNGau2dctHM3Jmuyi00KT6FcFCigTzz9
	 AAjTsBZkEgJNHqBFHn5Iq7y/iMQ0V+qavop2M4ig=
Received: from June.localdomain ([123.121.145.35])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 22E0321C; Fri, 13 Mar 2026 16:08:46 +0800
X-QQ-mid: xmsmtpt1773389326tfpu5ixxz
Message-ID: <tencent_626BC0197D08681882F023C3E99041C9580A@qq.com>
X-QQ-XMAILINFO: NcnCCMbb94wo0wl/5QZUp/ZWABLEdSia1Q6QFzK54pHB1eXPB/xaFwnTf5wQGZ
	 8G4PnXeKyBOCbQwkWTAvUcovTenzPjCV5JmzTCgccMzLSuFJpXxV2LfWn9S8UOrhj7BCPfKzmAGh
	 VDmH7Nztnhwdub/3c+adkzfkBevJWXFjgCHCUjoCfYCtdnXjSuEmvV1n6x31JJaMtC+4H86oqm05
	 qQ1tCHh77mJI8hhqAVfiTjstHQhLgSH4H5GIw3zDCW0t7Kxl+uIpyBD0Fcn7pCdCDKzjfl5QxG7I
	 L0yTbR7NOrz8XnX/GTk5EEF3sAe2bYYZFyZYgUp8YEdC/hOCOmlZphWRS8WYmUi1yIU18blPrOs0
	 Ox47bfxjtbUrVBmHBJuTiKBcCWPWFWUYP34z5w3bZYZ2aQqfR4vGO2FcaKQixzFNXegfS1fhcwSL
	 AQqKM23/RvpYKD9TIBsskMDcGhYZZOgGzN2oeh4Y3fSExFtlC2YP5j+OhWFBK+Gnz7OEBOwfzHtz
	 JVsQdQkCkQf7hhpZCBk0yFsxaJ8qnfdL89hGH9VQWnBc8rKKAoF/V/OEtCMEOniIddeLz3Js+YTW
	 iiy+dIWK8HsD4AKYlm58mdnpXngdJBDZkccHZ72FXUQ4D67WMe5pZu2z5NfTU4fzQbfzkdO1e3Lh
	 zjjY2g4ny7d7LTyPxN6AhIaTifr8lTFThEK3xQt3uEhg1Tnuf9Q8oaJ72YlacZ39eL2jtGqHq/Du
	 c2TLBPw5hIhzorg1ZRwDA9vlLRr3VSWljireTOOontm4kyO7DhfxTtZ9w7J/bY5UBY/VNOaoj0Fs
	 Sx80o8AQqgACWoEvCpFxRe70tBdYxqpH1o0IH0yH7uFuF5ylr+W7oonMwouF9VJxCGyWIQVqbTsP
	 NOOALn/xjV96NrMdrRRZh4BSAzLp++orqLl6eufvFS2YkBhiqaMJRkykoHsTu942DZ2adO9Zl2ie
	 Ab2hluAqnpdNVmvBWe7KDr0JOWaVI5Am9FdWo6OjL9kY2XByQ1Ws6TKmzm3Fql0EVfDWay4xt8WT
	 JSGfA+D2pJBDCTU1Xr9PIpOig9QXyBknLmcylIqg==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Wang Jun <1742789905@qq.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Wang Jun <1742789905@qq.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: gszhai@bjtu.edu.cn,
	25125332@bjtu.edu.cn,
	25125283@bjtu.edu.cn,
	23120469@bjtu.edu.cn
Subject: [PATCH v4 0/1] media: saa7164: add ioremap return checks and cleanups
Date: Fri, 13 Mar 2026 16:08:44 +0800
X-OQ-MSGID: <20260313080845.169663-1-1742789905@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <a44adff7-60fd-4fca-85f4-0c69a035ec69@web.de>
References: <a44adff7-60fd-4fca-85f4-0c69a035ec69@web.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55602-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,qq.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qq.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[qq.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[1742789905@qq.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qq.com:dkim,qq.com:mid]
X-Rspamd-Queue-Id: 75FAE27F551
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Markus,

Thank you for your thorough review of v3. 
This v4 addresses all your comments:

- Added `Cc: stable@vger.kernel.org` to ensure the fix reaches stable
  kernels.
- Refactored the duplicate ioremap error handling into a helper function 
  to improve code clarity and reduce duplication.
- Replaced manual mutex lock/unlock with `scoped_guard()` 
  for better safety and readability.

Regarding the `Fixes` tag: I've added a tag pointing to the 
commit that originally introduced the driver. 
At that time, the file
was located at drivers/media/video/saa7164/saa7164-core.c; the `Fixes` tag
correctly identifies the commit where the issue first appeared, regardless
of the later file move.

The patch adds missing error checks for two ioremap calls in
saa7164_dev_setup(). If either mapping fails, the function now properly
releases previously allocated PCI resources, removes the device from the
global list, and returns -ENODEV. This prevents potential null pointer
dereferences and ensures proper cleanup on failure.

Please review the updated patch. Thanks!

Wang Jun (1):
  media: saa7164: add ioremap return checks and cleanups

 drivers/media/pci/saa7164/saa7164-core.c | 41 +++++++++++++++++++++---
 1 file changed, 37 insertions(+), 4 deletions(-)

-- 
2.43.0



