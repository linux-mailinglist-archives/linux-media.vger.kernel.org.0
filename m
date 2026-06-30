Return-Path: <linux-media+bounces-66062-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ji4iFtiTQ2pfcgoAu9opvQ
	(envelope-from <linux-media+bounces-66062-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:00:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F596E2908
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:00:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=QK9lhknu;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66062-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66062-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7E0063067AF8
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 09:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F54F3E8684;
	Tue, 30 Jun 2026 09:55:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6449F3672AA
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 09:55:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782813302; cv=none; b=fkQRFC1Sup2O5bgzNLzOWgzUHa07yAhKVk4IfIhFNScySOiLu3fHRfroI+bTyEz2tlt5K59fOwmSdQYRhBi06q2b/BJdsuytgopSzzD1gg491+xJNbT+b7VWiy69Jb87z5ktnEm+sRWUOi4L8SkAy+0ruiTjHTFj1dPi3+NdHaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782813302; c=relaxed/simple;
	bh=T8AFSyXrMAPyQstUVqXg9W8pfvh91+5v68zwfOY2gT0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cU1gUN78jv1rgVeuKzorR/SF4lq8dowGk1OerkYFLYFTG4anBEktx8hfb95Y4TXX3LAQkdHaZRgJOi0NICiKCqjT/xQFSRJvuS/Na31MEnNO+jUmnPLxc4YlJKAo46iTiB5vrm9GYcjj7SLWftvRigS9xSGvRSD4b3GA2Lvlfsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QK9lhknu; arc=none smtp.client-ip=209.85.210.174
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-845537740ddso2432573b3a.0
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 02:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782813301; x=1783418101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8AFSyXrMAPyQstUVqXg9W8pfvh91+5v68zwfOY2gT0=;
        b=QK9lhknu15+C4KBNoz7PYVL8eqkxea4OOrkosU0y95csVCGkG/xCmtkqUiCs1+sdrM
         OdXtFn3GIOzcpT4etLeIR9cM+PX94bRL9KBEs+mO5khXWljrvS3a258sd6Dy+r8z2372
         C7SsvWywytCFN68TTrdGt1Sx5ZeB6yEAsMQgrATRcaFqsd8sOOgVHo1DkdVMzX1oO8Wt
         QQvkSrq2FOGVnX5E8sDkFrOk/pULDjyYVyHyVkWinINYZBQ65Ol5Dh+um5AEoYd6fXlt
         FAi/d1DW1KTly+/j/18l+Rbcd12HR7Anwaezt6xow25Tud+KFue4WJOgmPg1CsxjL4OF
         Qv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782813301; x=1783418101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T8AFSyXrMAPyQstUVqXg9W8pfvh91+5v68zwfOY2gT0=;
        b=CPlgCXWDlNRdyiWRq2Ir6FsoEjvUe7TtS2BS9P3YLnszN0+t5PPU3tiJc1xuwtHKH1
         xbYdKBFcTxIMQMhDuHZQN3bVRgNwvUVmxX370CEFUxATEMncWJrkemY6y2mZSPBCpUrJ
         qT4Jo2aaISHgmwQEk81R0F+4KHoQn9CXxtqa/EcahCM3YTnEhq2RyI1cJsQe4iG0R9dm
         lfnXFdiZrN1mBHgcEx/ZlExzkNxDCMEA5W31ZyvYdWCG6AmH5AOISPsckZ6OLnHRrmo6
         ZgGbkViUR1A4Uggd9FSuwPdbKO9jxAbUp2ojl/wvEByoq2dr8uR2nDUrNEQlmI5zlamr
         9THw==
X-Forwarded-Encrypted: i=1; AHgh+RqitDna295wz4s84bfIl1UE+HtTQ0PB9RfFpdUcb5IRc3IuMRP+cNgQSAXl6JF2FYS/Fx4KZvmyDGmkpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUdOekJXFe87kiCqs7DapyH+E2PCEwEzrtgFQbptqEMmjbEcv9
	nZjpksM2BgZp0D4/MoYyBqrlG7ZVPIuquitfrHjrxOj3svjOdC2H6uelKz+gqVxw
X-Gm-Gg: AfdE7cnJNGXP80IW3mJyIU33Ir/ApIh0+OGeSpm+ditJ1z6trtPtQo54kBln6NrTnyk
	RVgyx3VVZH0OzTPXuIEol7TIsW6WdJSH5u6Q6mDQ8Br0IMwuCcHKoMrZWa584/iWzd8Fud8ooF1
	Ca/PEgQKL5APPPm4eXxe3LXfprtOePKnWl6eqVcBrmrxu/Q70VaLV+fO8xeBK5XqaVNpUY3EmrD
	xzk9HS+hn8bRZcYI2ltKMw3kuTPGv4MAsQBxm4bBYsyOHdMF72EzVKN3/geL8flbjXYZxO5OPYp
	m/RExDR5xqB1i+22p6MKM8zH+lvly0fQWkZBCRH3WEgAn9/QY53pi3Qz67kdwwNO05grNVIukcQ
	QFG5SPtv2oEOf0/IAI2tg4ABhKmdToEahqnT0qv67KF5RxkbPh596TuyCk9aZh2APsY/rZRVwod
	ckkzw2mEgm0a+iz1CMsYAlr65xz+9GdpRUHVcULVvzUR/AALzuVldrTy265pnxk4ONmLGKJy+yX
	WBUhyS9ewECmInjl88llSc=
X-Received: by 2002:a05:6a00:1253:b0:845:e1a3:107e with SMTP id d2e1a72fcca58-8479f27a8d4mr2243277b3a.52.1782813300635;
        Tue, 30 Jun 2026 02:55:00 -0700 (PDT)
Received: from fourcolor-Home.. (2001-b011-7010-d7cf-1ecc-f3e6-c652-23d3.dynamic-ip6.hinet.net. [2001:b011:7010:d7cf:1ecc:f3e6:c652:23d3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479ff8b80esm1563495b3a.6.2026.06.30.02.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:55:00 -0700 (PDT)
From: Shih-Sheng Yang <yshihsheng@gmail.com>
To: laurent.pinchart@ideasonboard.com
Cc: hverkuil+cisco@kernel.org,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	yshihsheng@gmail.com
Subject: Re: [PATCH] media: v4l2-dev: fix media controller registration error handling
Date: Tue, 30 Jun 2026 17:54:56 +0800
Message-Id: <20260630095456.1745545-1-yshihsheng@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260626192257.GA2894880@killaraus.ideasonboard.com>
References: <20260626192257.GA2894880@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66062-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[yshihsheng@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:hverkuil+cisco@kernel.org,m:kees@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:yshihsheng@gmail.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yshihsheng@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E8F596E2908

Hi Laurent,

Thank you for the review.

I've addressed this in v2 by moving the NULL check into
media_devnode_remove() and by using device_unregister() in
__video_register_device(), as device_register() has already succeeded
there.

I also checked the other media_devnode_remove() callers. I didn't find
another caller with the same failure pattern or an immediate risk that
requires changing the helper API. Since changing media_devnode_remove()
to take a pointer-to-pointer would affect a wider set of callers, I have
left that out of v2. I can add it if you prefer.

Regards,
Shih-Sheng

