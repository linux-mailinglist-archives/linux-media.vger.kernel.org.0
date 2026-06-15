Return-Path: <linux-media+bounces-64908-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1f+BGAP3L2p1KQUAu9opvQ
	(envelope-from <linux-media+bounces-64908-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 14:58:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A2D68677D
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 14:58:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=seu.edu.cn header.s=default header.b=P61Hs7oM;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64908-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64908-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=seu.edu.cn;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 76AE1305359F
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 12:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 079933EB0F2;
	Mon, 15 Jun 2026 12:40:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E633E5ED5;
	Mon, 15 Jun 2026 12:40:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781527233; cv=none; b=odjECdu5Ei6WeV4E43fyK0kWPFwbxNkkUumvUFHFL4sOCj6R1zaL0aIbDzf7zbB4CQoyT1hr+I8dLrkTPGrNoz4hBy7p9xwH+5ynw7gVV+MK4hlvalliiolH1Mp7b5bTGZ5uUp00DUkYNmV1m2yOL5wHuK3L2BmTabgW+ZF5rYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781527233; c=relaxed/simple;
	bh=gjaFQJT2kAif7CkimHx3x7Hps77szfPhwpa5ykLK03Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K17t3JIDTl7rLX9LNqsKRHvVMNFtse3dTUNF2/o668GKCI3HCvC+EctjO27I3YI/m5b9GmmHdlFMfGL42u7R130Tn7sq1vefEihbDTnqLwoaU5a6xMLMGRo1AOxzQA6BvKSYN7vi7nVtJ1Dr8W/kJPzAuaFTwXqwShOisJUA+RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=P61Hs7oM; arc=none smtp.client-ip=45.254.49.197
Received: from DESKTOP-SUEFNF9.taila7e912.ts.net (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 426fffac5;
	Mon, 15 Jun 2026 20:35:15 +0800 (GMT+08:00)
From: Dawei Feng <dawei.feng@seu.edu.cn>
To: andriy.shevchenko@intel.com
Cc: abdelrahmanfekry375@gmail.com,
	error27@gmail.com,
	andy@kernel.org,
	corbet@lwn.net,
	dawei.feng@seu.edu.cn,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	jianhao.xu@seu.edu.cn,
	keescook@chromium.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	zilin@seu.edu.cn
Subject: Re: [PATCH v2 1/2] media: atomisp: fix memory leak in atomisp_pci_probe()
Date: Mon, 15 Jun 2026 20:35:15 +0800
Message-Id: <20260615123515.3289855-1-dawei.feng@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ai_kfgkuDYcFd0bG@stanley.mountain>
References: <ai_kfgkuDYcFd0bG@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ecb476afe03a2kunm1210e9d519b2
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHUkfVkgfQx1PHx9DTE5MH1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktISk
	9ITFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=P61Hs7oMyuaM7iyI1iro5WMKkuPk5RSAPqrGnktgg3SrDynw3ORjAlJoYi6YhF/PmYgJMeFq+ffJvy6ZTjwKgJSJWOiU9AxiLiN3IImJ1hM2HoITV5EplIeUMrxi1Co63s9rk/WT3uogQxecXAFnhmt3dtB+l1887n8OCeWe4a8=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=bN1w/C+P47zTBSfglB2f6ou4NJife5gpnW4y55LxdtQ=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[seu.edu.cn,none];
	R_DKIM_ALLOW(-0.20)[seu.edu.cn:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lwn.net,seu.edu.cn,linuxfoundation.org,chromium.org,vger.kernel.org,lists.linux.dev,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-64908-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[dawei.feng@seu.edu.cn,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:abdelrahmanfekry375@gmail.com,m:error27@gmail.com,m:andy@kernel.org,m:corbet@lwn.net,m:dawei.feng@seu.edu.cn,m:gregkh@linuxfoundation.org,m:hansg@kernel.org,m:jianhao.xu@seu.edu.cn,m:keescook@chromium.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:zilin@seu.edu.cn,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dawei.feng@seu.edu.cn,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[seu.edu.cn:+];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 58A2D68677D

Hi Andy,

Thanks for the review.

On Mon, Jun 15, 2026 at 02:11:12PM +0300, Andy Shevchenko wrote:
>> Fixes: 9d4fa1a16b28 ("media: atomisp: cleanup directory hierarchy")
>> Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
>> Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>
>
>This SoB chain is wrong. Who is Zilin and why is he here?

Zilin is the discoverer of this bug. We are in the same research group,
and he actively participated in reviewing this patch. 

To better align with the kernel submission guidelines, I will add a
"Co-developed-by:" tag in the v3 patch for Zilin to properly reflect his
contributions. Would this be acceptable?

>These last two paragraphs do not suit the commit message. Please, drop them
>here and better to describe all this in the cover letter (if not yet).

As Dan mentioned, I included those paragraphs following the exapmle in
researcher-guidelines[1].

[1] https://docs.kernel.org/process/researcher-guidelines.html

Best regards,
Dawei Feng

