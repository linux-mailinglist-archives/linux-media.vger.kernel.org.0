Return-Path: <linux-media+bounces-64920-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3ArfJ4EYMGrFNQUAu9opvQ
	(envelope-from <linux-media+bounces-64920-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 17:21:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E82668798C
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 17:21:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=seu.edu.cn header.s=default header.b=KoF24CFG;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64920-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64920-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=seu.edu.cn;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6C2CE3010918
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 15:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 989D94028F4;
	Mon, 15 Jun 2026 15:20:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03999401A3B;
	Mon, 15 Jun 2026 15:20:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781536859; cv=none; b=lV+1up5jdGQ+vM0BHdWOlzMdQKHVL7JBcv0ZXSfaP0AKqXaTXwkOB7B1ldZk9MbfIozWR5FIwUNLaR2hl4DnwAcekfMJ7TaoUzbvxysG2dhUpwPYg+JVXwgKVBLUUBl/KnynOFNXrSy99JpB4ZNTglJU/o7rty5RTndGwm4RP6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781536859; c=relaxed/simple;
	bh=mMjcPctx96k8AW3mtoeXy2eGmTvYgaPV5jPnJwJmQE8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IV6xKlNzz62gVIttzkT1W2gUsCnAwFZyH3e7DNgIaEmZmRbvQUbyTQziUlv1gSipV8vj4giujpLC5/34qjjOb4NTDIpbuFn+NrN8jpd6PRA4/XLm/yxqSWzW4kcILBsoIzIB0jkrTREVyPHUiV6b0zUXYUAkOkIb1h1jiUpLlhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=KoF24CFG; arc=none smtp.client-ip=45.254.49.198
Received: from DESKTOP-SUEFNF9.taila7e912.ts.net (unknown [223.112.146.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4273845e6;
	Mon, 15 Jun 2026 23:15:44 +0800 (GMT+08:00)
From: Dawei Feng <dawei.feng@seu.edu.cn>
To: andriy.shevchenko@intel.com
Cc: abdelrahmanfekry375@gmail.com,
	andy@kernel.org,
	corbet@lwn.net,
	dawei.feng@seu.edu.cn,
	error27@gmail.com,
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
Date: Mon, 15 Jun 2026 23:15:43 +0800
Message-Id: <20260615151543.3385190-1-dawei.feng@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ajADZZqqsFcgAPhy@ashevche-desk.local>
References: <ajADZZqqsFcgAPhy@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ecbda559003a2kunm52e56f2c6ec6
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCQ0lIVk1IGBhKT0MfHR1CTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVSkpJVUpPTVVKTUlZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=KoF24CFGA/rqsCVcIhExTK+Qn0Rn9q4fVqSa2LEVHAzCFQhwzlWqJqbh49TSlj2EkqaLazd0rQL2Qdai4b2lktH/5vblwb/JwXjv2D3gGcUogdKnp1r4Psp1qhWnzQ6CgDgOpGrQkzlLGfxyMi+O8bEnfDqHnruT8qtt+yXxqKI=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=mMjcPctx96k8AW3mtoeXy2eGmTvYgaPV5jPnJwJmQE8=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[seu.edu.cn,none];
	R_DKIM_ALLOW(-0.20)[seu.edu.cn:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lwn.net,seu.edu.cn,linuxfoundation.org,chromium.org,vger.kernel.org,lists.linux.dev,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-64920-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[dawei.feng@seu.edu.cn,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:abdelrahmanfekry375@gmail.com,m:andy@kernel.org,m:corbet@lwn.net,m:dawei.feng@seu.edu.cn,m:error27@gmail.com,m:gregkh@linuxfoundation.org,m:hansg@kernel.org,m:jianhao.xu@seu.edu.cn,m:keescook@chromium.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:zilin@seu.edu.cn,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,seu.edu.cn:dkim,seu.edu.cn:mid,seu.edu.cn:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3E82668798C

Hi Andy,

Thanks for the review.

On Mon, 15 Jun 2026 16:51:33 +0300, Andy Shevchenko wrote:
>But did he _develop_ any parts of this patch? Otherwise Reported-by is more
>suitable.

I agree. I will set Zilin as Reported-by in the v3 patch.

>Yes, and I still insist to move them to the cover letter. In any case those are
>not present in the second patch anyway, moving that to cover letter covers the
>entire series (and I believe you tested the entire series, didn't you?).

Yes, I compile-tested the series. I'll move those paragraphs to the v3
cover letter.

Best regards,
Dawei Feng

