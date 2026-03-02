Return-Path: <linux-media+bounces-54115-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BNZJozapWkYHgAAu9opvQ
	(envelope-from <linux-media+bounces-54115-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 19:44:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C5E1DE723
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 19:44:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C445304E835
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 18:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3330E3542E2;
	Mon,  2 Mar 2026 18:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="RBEfIAmf"
X-Original-To: linux-media@vger.kernel.org
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.1.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A42933F8BA;
	Mon,  2 Mar 2026 18:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.1.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772477049; cv=none; b=j6OQG7sMC9IEMqHMdNmHYIBEmBVhc6LvRHCO6TuK5rJrakECT60U9rmWWJgm6k8E0mWamU6Rh7cujHQFba2e3xlkPhuqGa6KFTklDoVe/rVTa1aAfMSEx6BEJSwfxjhwC8h4fi8C//AyRzcNJw3liOzQmBJCbIITj4+5gv2fTA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772477049; c=relaxed/simple;
	bh=TEjyPmG9mj2FxkWtffjjLhIEPXudRu0BFcF6wsxqE6k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mkwp7TuQT0YhttCGXCcTJJ8LOPvMW+4ezJQ7T/cre7HNeNsZSv0eqtOCLftVulirMKY9OiDl5nqFXnzyOA6Xk4E0MZ+HiYydT4xwbpluxt+AOTF3xLTj41Mbgj2Rf8Eas3sBsXR4IJ/LHNaxVfOlpVBbVQNQg1rYeFXF4amxXog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=RBEfIAmf; arc=none smtp.client-ip=44.246.1.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1772477048; x=1804013048;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TEjyPmG9mj2FxkWtffjjLhIEPXudRu0BFcF6wsxqE6k=;
  b=RBEfIAmf8mkPy3MNCDTmHTqkkWyBvgIhgrQ/t0OgNMCKhywM2i/aNTE1
   B/zvPk0wWpm7Y4a1PZpi8R8CAZolu1K5/8UaTTcgH16liVpl3oTx+U0j+
   2/+k7LQULdrFxoPjJ6ruvsdENrIF6jmhTrg2z5nyQwlt3rzlr05O01zop
   1rSaiREnfJ2DchBe8tJRe/SmQSoi0NBf3jsufT0wTbh6+/lRMqs0whU3m
   6ab9N4RyPqfWE3OEhsKFFbcAPnyBILhj5CVFz38uok+pZbWcVeXyio0Nn
   8mV6QK+ng/9+oy1DLm4elDRhCRKwau5tcYdBJ1xvlzB4rtytJK3ffOzhx
   g==;
X-CSE-ConnectionGUID: RzhCn56mTkWR1r9a69Zc0w==
X-CSE-MsgGUID: EIy7z1TuS8qkgqFDz+wUPQ==
X-IronPort-AV: E=Sophos;i="6.21,320,1763424000"; 
   d="scan'208";a="14110907"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 18:44:08 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:13535]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.51.143:2525] with esmtp (Farcaster)
 id 11ea19a8-a946-4843-87fa-609b495f317e; Mon, 2 Mar 2026 18:44:08 +0000 (UTC)
X-Farcaster-Flow-ID: 11ea19a8-a946-4843-87fa-609b495f317e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Mon, 2 Mar 2026 18:44:07 +0000
Received: from bcd074ae11bb.amazon.com (10.187.170.14) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Mon, 2 Mar 2026 18:44:07 +0000
From: Cory Keitz <ckeitz@amazon.com>
To: David Heidelberg <david@ixit.cz>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>, "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>, Kieran Bingham
	<kbingham@kernel.org>, Cory Keitz <ckeitz@amazon.com>
Subject: Re: [PATCH WIP v4 0/9] media: camss: Add support for C-PHY configuration on Qualcomm platforms
Date: Mon, 2 Mar 2026 10:43:59 -0800
Message-ID: <20260302184359.19394-1-ckeitz@amazon.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D038UWC004.ant.amazon.com (10.13.139.229) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Rspamd-Queue-Id: F2C5E1DE723
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.66 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54115-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeitz@amazon.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amazon.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi David,

I've been working on CPHY support for sa8775p / csid-gen3 on 6.6 and have a
similar patch set. The approach here aligns well with what I've done, good to
see this infrastructure going upstream. I've implemented the following for
SA8775P that can be added on top of your series once it lands:

- CSI2_RX_CFG0_PHY_TYPE_SEL in camss-csid-gen3.c
- CSIPHY v1.3.1 register tables for sa8775p
- Data rate-specific tuning for 5 bandwidth tiers (1.5/1.7/2.5/3.5/4.5 Gsps)

I've only tested on a 6.6 kernel so far, not on mainline, so I can't give a
Tested-by yet. I can confirm the settle count calculation and PHY selection
approach are in line with what I have tested.

Acked-by: Cory Keitz <ckeitz@amazon.com>

Thanks,
Cory

