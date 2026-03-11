Return-Path: <linux-media+bounces-55435-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Jw9ClK3sWl0EwAAu9opvQ
	(envelope-from <linux-media+bounces-55435-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 19:41:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF5B268BE0
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 19:41:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 31A47301511A
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 18:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C893EAC7D;
	Wed, 11 Mar 2026 18:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0s93ub2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442963EAC74
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 18:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773254429; cv=none; b=ZfeHtKjti/79Kc+UwKEYy4WIyCY3DSUyZxOtFiXV++H9UavcIsBVeZ3dNmsP6NaSYCbuhiiOn7MlvhFNEWMLUtRiM5+IIj0/f5mKqGENpLuIDECjlHl/5tRmvNPz1TbUTr7bwwlbrc5OQwqZ+NP99YkDon3rXxdGQzcW7mfAxuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773254429; c=relaxed/simple;
	bh=is5nN+TX0unizFQTKEQ7DdrzwQGC5E3Me2H9mDq6+tc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MEGOcO/U1Ly9XT4JIorcAENdfRXWkGvVLN2H82DfD4Ht0FTHbi0iDNk2GdfMqcWtAmRo945gw6uuhDuLl13w43Nk0PYJCYNjZ1cxjsBi+XY7ikx5/K2OTiDF8xchU6R+UsXQn5xkQ2na9DuKjolD8oudVNkQLsY3kl9D3jXcUrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0s93ub2; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48529c325f0so1300195e9.0
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 11:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773254425; x=1773859225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=is5nN+TX0unizFQTKEQ7DdrzwQGC5E3Me2H9mDq6+tc=;
        b=M0s93ub2jNTHVigekti/TJrktq58s3ZDZYN9mgikeS/2swyg/Cvwme89ditfbdF5W+
         k0UZIMxn+UJuknzd+xGwu9lMbyq7sDgaTUJi4kkemUCinxcBF9LQx7HlmE78H+wRhxq2
         CRjqfJZfVUkl1381XHXip3BnMehRlgMyIAdFwWHTdInVhcxoO9YHpRwxzGxPqCxb68JX
         kiow8Z92K1AW5ZfcWiBgGBD/jus54J/J9zsFXudlSOzslrr3LmINu9hG7zfSBF/+KYX3
         MYLZewfK+9qzoxB3pvJodoen8z1hiPQ+pgX65+vxiGxw33mQGzB2W7sRQjRGJu38WY3q
         e4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773254425; x=1773859225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=is5nN+TX0unizFQTKEQ7DdrzwQGC5E3Me2H9mDq6+tc=;
        b=dE6Yo6Y6kuwmg4YW+Q+g3hg4pxJWbmGp5qIvt4FcJF3akCb1bBB8t9DcTb8ntNR7sl
         oItW56alnYIn5+EIyLtHFb9gmNx07j1GfzUkc+SwVR718ydgGGnqwRLTbtwSjoDZH3jC
         R5TZB3SYl5YNWa2ohTEUZ57oidul0V7icX3gUU6GsvQ1vYBwFEqmitV5SjjEE8x4frDw
         TAOw/SqGt3p0leIZfiN11O+lA34Ov6vZ00olw/PqxgBMKi9pp+hkRPG68uwsXQzJrZ85
         SydrcprNm7hjgvpvV39/vqmtezUdcxusS2bje78Go0qChR0w7cDgvUwaxsk2qnnDSpgr
         T6Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVxYqfAU6YJ9pizRUJZPGfGCKtGeXipfyus372eo1UYVra+mWZRpXl6XTo4GI+zoRkG+N0XujimsWxj3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeNZMcnORRTc8cb08kWNwiTSOnRwBiKAVrfvTahXsPOACGmQC0
	56yksPOlYHzafuOrWSpvuV5iEgyBECd3rJlv6rWaDcTrH48QLSkXXyTr
X-Gm-Gg: ATEYQzzPXtXBKNAuKjIrq49hZYq1R9M9o6gXfaJr4Lta7sMWbTzpLeNIugJqnn2M5nF
	0NM1WrsBYJPyIdu5o7mIpAMih8zuZ4tHdZ4N2FGroru590QcCTkvBkOsdMamb7f9uY/UL99Qosy
	Pstrbh4yEtUq9gBaFyKACHqwPquF7sVjtYknbSibLC3sjkEPmhReFpDsGc++DCc/oRpLoatU3Oa
	nP9uM8VkexQNUx9TEHiS4aTCIFnEMDoTbbEUZh3SrLojR83R7wXpT/Znu1P0g2dQuN24IRHU3vO
	7D7f4euj5rlYGN3GTt2NaJexZmmGBRVW0BLzyvgnGvpjcXtaCQuAXY2Rv3qjOl+8Okokc1k52SL
	eFohB24vry51Yti4+9F3xQu7EMk1a0ABLf9tUd6U6hqiT25ItaUa5Jswt3DSYCMTmX0NIZOhqD4
	HIcFRI5f9gBQABtqZw+Tl3E13h7Ss5ZbMVMFw2m4W0G9iFMM771A==
X-Received: by 2002:a05:600c:a08:b0:485:2c61:9459 with SMTP id 5b1f17b1804b1-4854b0afb48mr64033025e9.8.1773254424412;
        Wed, 11 Mar 2026 11:40:24 -0700 (PDT)
Received: from DESKTOP-VOVUFNJ.localdomain ([5.14.84.168])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0dc8d7sm22165535e9.25.2026.03.11.11.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 11:40:23 -0700 (PDT)
From: Bogdan Sandu <bogdanelsandu2011@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	bogdanelsandu2011@gmail.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	tian.shu.qiu@intel.com
Subject: Re: [PATCH v2 1/4] media: ipu3: fix alignment
Date: Wed, 11 Mar 2026 20:39:39 +0200
Message-ID: <20260311183938.6289-2-bogdanelsandu2011@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aak7s0qFNf4xgNhZ@kekkonen.localdomain>
References: <aak7s0qFNf4xgNhZ@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-55435-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bogdanelsandu2011@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BDF5B268BE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Sakari,

The quoted change was made in error.

If you'd like me to resend the patch, please let me know. Otherwise I will refrain from resending it to avoid creating noise.

--
Regards,

Bogdan Sandu

