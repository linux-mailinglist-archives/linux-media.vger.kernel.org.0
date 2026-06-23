Return-Path: <linux-media+bounces-65484-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vUolGGUEO2pZOggAu9opvQ
	(envelope-from <linux-media+bounces-65484-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 00:10:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CDF6BA597
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 00:10:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=nrHdFNbh;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65484-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65484-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDD9130427C1
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 22:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35DB63C2BA4;
	Tue, 23 Jun 2026 22:10:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D933B7B91
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 22:10:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782252638; cv=none; b=LCNzrrd48iRVZbMDOprunJ5kSHOBBprB42Ao2GaOPBVz/stvf0r1E5zZAMddLiX9xqau4b5VebRebj4lZTZ6yAbn/T0TMyeRwyb5AgyFhQ6RkrkcmqfaioPymC3BnQzyLCAz0UfNWjrL5orH2dw8DBChiwVuN55bMGmcSKT4Rus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782252638; c=relaxed/simple;
	bh=2ZmnH69X9i6LOFCWhM4qK/TDF+q7CGkCI6G71ROtLpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fIHtd+jkTghPvjY52afWqTqj1j6RP6aY6FOoAc7WsDRD82QLuDmE7F7anVd58VwPoTOqsmt7wLdzSOh2kEKtzJ6S/qN2b5bosFSep1UkcJ4g/45deYrIs3k+2k6W3wpsKNA0P6JNpckPCuE5e6bD2objFyNp7PuFU2cEW2CZtCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nrHdFNbh; arc=none smtp.client-ip=74.125.82.176
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30b9e755555so731988eec.1
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 15:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782252637; x=1782857437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zef6035xk0sI/Vr1UN1WS9r7Ogg1PRDClgF390fpwy0=;
        b=nrHdFNbh4ca84xWkUNIyn4pfa7eHoLA73xrFLfSEamjw73KDOAXhV1k2ZKCaa8gjIh
         MNwsb7Ap8aB6tgnwajR2sfKJSvQP6yNlWkFHrSyrBKkVlJTnb68ROLmWnK/4UidNTG00
         ouQcsjTLGjtTah3bk2ARSiH+qEo2UifCz7zRTCt5X3wRmSnlOlXfVJAfIwi/dF0gwPl7
         vDJD95uVO1bWdHZwx4VXX2NGdlw/zbVOr78DOievFydTgQlNoT9G0QnlA7jXei7WRjBl
         YgiU/WSj6YJPxxpTYDdqaJn4j8PJHPEW0TpFBwZTrwiwc/VdsGMoLSApTZfZxuDC5XhQ
         Qo2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782252637; x=1782857437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zef6035xk0sI/Vr1UN1WS9r7Ogg1PRDClgF390fpwy0=;
        b=Mlj9aHHl5kbr+vteiGQlbl7W97iqFYv3fzAcxBN+WNXzjcsMBP+ODKa51BJzoX333c
         KtPC+vtFHgK+DpOM/d0Ro3jW+9XYJY6KB+Zzwziq6XO8yF21aPi4RjVmGGaW/FJiB3bP
         UAuVI2dk6UUMg+OfjyGeyck9LDoY4a434YvJ2OZ5NEcF6UzHq8MWI+PUDR2S8yieW3V2
         yPRM4Z4XhAd92cKZOC1WioLaMiwVOckgdqubmwZBc1gQ94U0t4JXq/3IzQxm1M/Au0ao
         kAy6uHxFiQprTqJ4rUKnCsstqWzAvM3Aec9mRwCYwRu6tfdXFILu4cUcHCILQ3kNcc4Y
         X1Sg==
X-Forwarded-Encrypted: i=1; AHgh+Rp2V20fsJoUsvq5F1jbwRcykbAj9+t0D7dio8YDqrl+zk8Gv9SB50wzP+g706tVQcEgqeB3z82+WAzdgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcDegv38F+6HiatUOt9CPqpET5gL1G9MrIzcsBOGfIcwWCltSV
	rkWAzoagRnU4xoVY1f8dI3ZIeiMuElGSQmr1zDU+fDwxEax21LFOUoYR
X-Gm-Gg: AfdE7clTPTsecCas4NeZNc9xhMAHraWIuTzjC09aQfUqYTWePZmM+ZWBvt8920LYKKI
	WyXRli6X8nTmvLcXk49ZTNO8PhWglVWw0UqvJFV4CVyhcpqYDJ3zYolVqs/kTJaxJgBAEdUJuZA
	jZXatHzAJlLPcJQAPQWBhCOtQj5hDV5IeMvYgCnG3Cd/po+q9mqCMa4qT8tMfkN07RobLx0aJcl
	AGo1T9cv6VHQkZaNry1mklrto0RZtr/ufAJnohz+UbMtm+dP5px+KFiB4XJvpJWQz/4B+yYVmc1
	lXRMFJDwPHwCIP2SNYr8DeOlNvV5ofeiLkzSvbSbypdwzUjy8trf2MtGp2naruDKtqfV7pih82x
	U3L7fDMqZ1AsiEHc8TtO99H1OH4XN3hFcS45iClkjJgQSEwpjzBUud7HTI3dx/vdbeXpOgAMZ3r
	2c+Q6+5zMhxyfJn5bXGCUxPkUuYI3sidaIyOZv7ep4GP+WLt1uB2IGpZpDcpYXiF9SAUg=
X-Received: by 2002:a05:7300:b918:b0:304:de8e:17b with SMTP id 5a478bee46e88-30c68c4219amr1110911eec.5.1782252636568;
        Tue, 23 Jun 2026 15:10:36 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:c10d:2699:12a0:58d6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c5178a68dsm9059903eec.22.2026.06.23.15.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:10:36 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	feng@innora.ai
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 0/3] staging: media: atomisp: use kvmalloc_objs() and drop redundant OOM messages
Date: Tue, 23 Jun 2026 19:09:25 -0300
Message-ID: <20260623221028.40238-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:feng@innora.ai,m:~lkcamp/patches@lists.sr.ht,m:linux-kernel-mentees@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65484-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[rodrigogobbi7@gmail.com,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rodrigogobbi7@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A4CDF6BA597

Several allocations in the atomisp driver still size their buffers with
open-coded multiplication, e.g. width * height * sizeof(*p). When the
dimensions are large the product can silently wrap, causing kvmalloc()
to allocate an undersized buffer.

Convert the remaining sites to kvmalloc_objs() with array_size(), which
saturate to SIZE_MAX on overflow so kvmalloc() returns NULL instead of
allocating too few bytes.

This continues the work started in commit [2], and picks up the stalled
sites from [1], unifying with [3].

While here, drop the redundant IA_CSS_ERROR("out of memory") messages on
the touched allocation paths: the memory management core already emits a
far more detailed warning on allocation failure as raised at [1].

[1] https://lore.kernel.org/all/20260413112904.98864-1-feng@innora.ai/
[2] https://github.com/torvalds/linux/commit/d178c7ca8fefc28115d35b94c3b1f4d653e34182
[3] https://lore.kernel.org/all/20260609215110.118860-1-rodrigo.gobbi.7@gmail.com/
---
Changelog:
v3: keep original author chain/tags at v2 and v3; minor cnt usage at v2 for readability;
v2: https://lore.kernel.org/all/20260622224402.34001-1-rodrigo.gobbi.7@gmail.com/
v1: https://lore.kernel.org/all/20260609215110.118860-1-rodrigo.gobbi.7@gmail.com/
---
Feng Ning (1):
  staging: media: atomisp: use kvmalloc_objs() for overflow-safe
    allocation

Rodrigo Gobbi (2):
  staging: media: atomisp: use kvmalloc_objs() in make_histogram()
  staging: media: atomisp: drop redundant out-of-memory messages

 .../media/atomisp/pci/sh_css_metrics.c        |  11 +-
 .../media/atomisp/pci/sh_css_param_dvs.c      |   5 -
 .../staging/media/atomisp/pci/sh_css_params.c | 101 +++++++-----------
 3 files changed, 41 insertions(+), 76 deletions(-)

-- 
2.48.1


