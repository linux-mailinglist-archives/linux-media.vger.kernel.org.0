Return-Path: <linux-media+bounces-65797-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8TTaNbnJP2oDYQkAu9opvQ
	(envelope-from <linux-media+bounces-65797-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 15:01:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ED36D1F51
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 15:01:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=0sec.ai header.s=google header.b=SkBDMn63;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65797-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65797-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70CA730226A2
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 13:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E523AFCF2;
	Sat, 27 Jun 2026 13:01:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8499393DE3
	for <linux-media@vger.kernel.org>; Sat, 27 Jun 2026 13:01:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782565289; cv=none; b=I06QnNuU4YHI0Bsd0BqwCAhEnk2HUVpGGa8UbHQLU2nBIPJVZmsxEUfNciiaVKYKwkWq/8lwB0j0dYDV2utNBBKynbZdR3VwG+/PIUAGg8Zzex9P0v5g7eSRmGMmhIsGENSkLcka/9aQV6Y9L0PJvuw11dDGCqGVWcf+o/yZjsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782565289; c=relaxed/simple;
	bh=VYbEJ9TgQh6SAjqIVMrEovD7WnJXHM4ttSb9uGdhvts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Auce3tb21aot6tiJvszI8IB/VnqUCVqlYbjBOiev4MBoZL1oAsDF9NfCW3P7Kvxw25ebZ2HU3OBUClQcpIRrS3swjVhOpVOoQVzTwVkhvIV+VtthRmv1qhsj5jIw8my2mCsaT/O7xXfMWuXnrW+Tjh9zH9t8IsShqHkEqJtZBNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=SkBDMn63; arc=none smtp.client-ip=209.85.128.54
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4926ee9e8d9so6879435e9.0
        for <linux-media@vger.kernel.org>; Sat, 27 Jun 2026 06:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782565286; x=1783170086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYbEJ9TgQh6SAjqIVMrEovD7WnJXHM4ttSb9uGdhvts=;
        b=SkBDMn63/mphaTNx8MiKIQlAzQ/vj6Fx4MpaKbe9vFcbmDfb/CYsPoPffpB7pQmUTA
         fFZ3BH0cDJXuFcp+E4xirlKXx8mTaNynDuJejHNF73n/Iml7V4D7+Vc2BxsmBY8Oxpud
         lh3vBA7RPt+AM6AQEunknsjjeRWMP0wawZYLJDyTmUzxhsbkydPzPQrk9J88oUvcNSEm
         jCOkpVjYgZPvKphCW10jQqqlNLAL6VcmR0+a3eZ1WEbn+/W1vOKFt2V2XtW7fOskJkw/
         45yKwY7gwOawjNiQjgkOjEby3rBkMJYCfDOADc3xvWTpfTmdDLmRsPdQCWrEBHmrsAdr
         7j2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782565286; x=1783170086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VYbEJ9TgQh6SAjqIVMrEovD7WnJXHM4ttSb9uGdhvts=;
        b=YmIjxLv/KF4HmDmyWq5d05caBHYj8pNW7CfrQC0268uFvkg7qcv4Huw6OGGZEPeVbm
         r2ITS05Q3me+3qkF9M0AVZ6kP9NPsUdRS7vwtSsdRL1WeVTdi6quDaZMV9L0kUM90j/B
         +ksYRzeMkNAfiZSh+J2DVTBytdAOqKW3tAyv8w63aiY2bUui9SFYk6m6/iS6+8sKoHdm
         sRBM1UsW54ZxsjA0foKSRyuedB4NYk5lVqRoK+mDYRXZgcKfNwYfR4QbTQqftMLkw63y
         9y5HZ1FTo6Txu5x7XFmiqOt4KjB6W9n/UtOq0N81o1TGjluVhPLzUBk29a/KdvIQaEiM
         gADQ==
X-Forwarded-Encrypted: i=1; AFNElJ87BzLfeeXcIRlptFRKgVF3Rx9sHyBrEwwCWnR0GpSUMYy/i9Or9L6KHKsZ8SMcAMLp37cQkk/rMYxEZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3EM0xYQjCnmkrNnUDJRFX7Al1QB3L5JoqSZ1+p1QaU8+JDcVM
	AMcqBGhT4rL+agh/bj9g2OvTe+Rzwpc5tJ7kl8H+k7VcUCatMDxV96vF8jGEQZ5XEMYL
X-Gm-Gg: AfdE7cnPwZ8a/6EvqcWZpuRFaDDcGMAuzJnyCpvh4yvyyZhtBEiKutTwS98xx9r5qGN
	526UC70Mw3iCMevyflGbBbeV2MwYanrf1GmCwK1Uyu/Er65PojtgVETf7LyIfvzu+WZ1lOKX7sH
	/XmSrYwxvtf/DgiERpPPKv3SYOpaYtqfwM52aO3DC4nVmBM3XiJw7HW8alN7cUQA7mw92e8H5dC
	hahyTFnggeH6fppSjVWSKXQLsbH+HGr7GNDoEpdRxFsnG+8/aLeSqTIBKmyglLOW0yjQIB5POua
	iouHQpRoghvGxNz/VZsAV5+EB3ldsspK9rmnssuWZyDoAsBro+BM8WRHE1MqjMcaE1BW4EgYDme
	el01nInNhxzZaARsQkiiiuf3pvmwwmAlb1Ux88t/h7GLhFpj2pN5clSGzSnVoEOWR5abz10ZAdP
	WeWWFP4hVWbQRojiosB1xtbD908qc8gXDOVVDRldNyvadpmwxbp6tEVCHtXSVA1MeTHdDm5cT8g
	0Hrkj8ETPQJWo5xZF/fAv78cU86HAm31tJyInDnmiReNg==
X-Received: by 2002:a05:600c:3587:b0:492:4871:7e21 with SMTP id 5b1f17b1804b1-4926641b4c3mr124297055e9.10.1782565285994;
        Sat, 27 Jun 2026 06:01:25 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49269071c9esm155504645e9.9.2026.06.27.06.01.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 27 Jun 2026 06:01:24 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	hansg@kernel.org,
	andy@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: Re: [PATCH v2 0/2] media: atomisp: validate user-supplied buffer sizes in two ioctl paths
Date: Sat, 27 Jun 2026 15:01:21 +0200
Message-ID: <20260627130121.78713-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026062709-copy-ensure-cf64@gregkh>
References: <20260627063924.79491-1-doruk@0sec.ai> <2026062709-copy-ensure-cf64@gregkh>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[0sec.ai:s=google];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65797-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.intel.com,vger.kernel.org,lists.linux.dev,0sec.ai];
	DMARC_NA(0.00)[0sec.ai];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:error27@gmail.com,m:hansg@kernel.org,m:andy@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:doruk@0sec.ai,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[0sec.ai:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,0sec.ai:mid,0sec.ai:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 73ED36D1F51

Hi Greg,

Done, just sent v3 with the Assisted-by tag, plus the Fixes tags and dropped
the comments per Dan. Thanks both!

Doruk

