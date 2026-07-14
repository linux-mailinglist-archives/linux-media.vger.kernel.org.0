Return-Path: <linux-media+bounces-67593-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LatQIcS9VmrRAgEAu9opvQ
	(envelope-from <linux-media+bounces-67593-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 00:52:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14777759472
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 00:52:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IJCQHvoi;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67593-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67593-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7A16A301EF53
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 22:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9282541B8E6;
	Tue, 14 Jul 2026 22:52:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979793F4845
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 22:52:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784069565; cv=none; b=dTsEaZxrhIf3LQQfd7Y/5JUizdb5SCdeDtLNEQ9L3fjtxWcXdbrv2QpXP8I3t1ut8EboefZKZtTsRHG7DWzI/wAl7BJpev/7iHI9LRokH8lGywu9dcmyKRbnqt2ldMMI71rXEsK9jlbMq2m1LF77siAC6FwiilrguKOqBehwTpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784069565; c=relaxed/simple;
	bh=hII1+EpO76dP+zuiHl33FQnNw3xAMPFb+8sWj3r6nIc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FMBSL7QHCTy8vFbZO8mewJT0F+3c06aLWELLA2uEfn2G9RSeLm6F8VPBa5AJgGBZqNYHYvTH9kMpCmMZVWcTDzaK0H+H+yGMQZX7B3NLUFxt26Sr7WtciWjd/PSduJ3QdyGenrtdvjhsIabMJx1Yoysbz5VZZnPlwlisE04OJh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJCQHvoi; arc=none smtp.client-ip=209.85.128.181
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-81062fdeaf5so1165887b3.0
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 15:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784069562; x=1784674362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XaVrA3HODxV67MqxZaxfvdN/jDJhMYGWIyIOq2g23Ic=;
        b=IJCQHvoigLuyjsFz9VUYrSjTzd+AZYsHDAl8+Ve1zB/24Xm7zhZk7sIyvFbjM7yrPm
         oz/HOgHbQR7BVrqhWfpdy6UFsKNic2wtqxoQUgAgGwXS2vTNWogR+KrV8jwT1QHjAVHq
         D7MtuaXgPH0xVs1q9/bhcaPWSvrwORNKxfhkZ2zKTR8/pvtqsXZex8zsELb+YIlwK3Nn
         +5NO9skrd2QTIU4/tAzkfK3bkAJifantv1MuL024RiqYvyIvxAJl2G+GMVj6YXmqKrUN
         n4EAhMbXA2s6Zod3gCOq3SKcYYi7m/ytviR524+hD+/AzKG/JuH1gIzOqLBNe3nOEHyD
         N/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784069562; x=1784674362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XaVrA3HODxV67MqxZaxfvdN/jDJhMYGWIyIOq2g23Ic=;
        b=N8FyP4ctj65S/3QzZJqRvyPaBjqIhntCbQwuzRkezoHo8xBIx7qfYD9exIsUyxKVCY
         DAGqu4Uhk0I7S1pYRkO4yRhSFWX2ftapV1zOB7YPQOLXlmuV3Fm1akJvoYmWVQuM6nl/
         +g6WoQGuYHKvnvJAozPUUGBDFooSxE2ZM5eks9Nz8AD8SlgAgUVFoRoSDOwNy4XyPDHV
         H7WLx+qRbViYpsBTYmup4RokEbWo4b6HtIq0IUFTSo/IN6e7jCzQAujmkrpPDQZFkcWU
         y+YDh71S66rdP+sJ1ySoOuoj5NWs+FGBxWrYk6bj4jTvAtR1u4pz03OncOeJiUdGh+uf
         ey5A==
X-Forwarded-Encrypted: i=1; AHgh+Rrv12Vnva2Y37qm+Irxo2fegFsCP2QAPlpJ+miS3ynB09OiBQfpRK3epiclJ1/8MjtoIR2NdYLmUZ49qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyISWw+kt6VvOI6LBzsKE/C2dAZE8S7ykAnIYAbAGPkNR3wrn3A
	owDTKUrMhnFswFlPjQ7qQBNdrYiQj7CUE9Y9XoxUlh6l3fyW6BwYrVrQocAJTyft
X-Gm-Gg: AfdE7cmjKL+/W7TUaYab66oOwlSyqUzDCcH+niFz5Hsmuq+BdGfeQXuUEyuUTaUiYEe
	JaORUylRmTQOp5miG3wMlOAWcru1T9Q6LVLxATzHYvdoQN0tc4CHQDB5SJpgIl5v7CkAK4pmY5j
	e6SvG1FTpHtWjZD9aTadmWyzu84uP/DuUy/sIamqtVXU4mbUWQ7NTmILbJNrubbJ7q5knGe1ii3
	qz1ZG9K8FOM/IYWFjTbtebvPMGDaiY5htQA4+IawcyCKQIbTtZxcyKuSF8gLgDrRD4jatZDIwsw
	L3ivMbfrBA6Ai1YK4ngvQanbr40kANfDzHPwVYkUdvXJ2DSSdeU0oVGJ8zViN1twn6tmFDA2CDU
	WKZgCoTmidcft3Na6pc+i6n+3fBp2w9qSFmxYkDD81VkSi7TbTY6fM8SOEeOYP7HsbgCDFBwIGq
	Tp1HOBlWOrHXNEgJn3/ZK4amhH5vmmENJjTvrgA/iU1cfBD0FM/DwkrUfb9Axjb7IwnQ==
X-Received: by 2002:a05:690c:399:b0:7ef:e7ec:b6e7 with SMTP id 00721157ae682-81e7bc9497cmr150082747b3.27.1784069562556;
        Tue, 14 Jul 2026 15:52:42 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:a510:f4e7:1a8:cf71])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c249b87sm153446897b3.49.2026.07.14.15.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 15:52:42 -0700 (PDT)
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
Subject: [PATCH v4 0/3] staging: media: atomisp: use kvmalloc_objs() and drop redundant OOM messages
Date: Tue, 14 Jul 2026 19:48:59 -0300
Message-ID: <20260714225235.47134-1-rodrigo.gobbi.7@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:feng@innora.ai,m:~lkcamp/patches@lists.sr.ht,m:linux-kernel-mentees@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67593-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[rodrigogobbi7@gmail.com,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rodrigogobbi7@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 14777759472

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
[2] d178c7ca8fef ("staging: media: atomisp: use array3_size() for overflow-safe allocation")
[3] https://lore.kernel.org/all/20260609215110.118860-1-rodrigo.gobbi.7@gmail.com/
---
Changelog:
v4: 0002: use the full commit reference form for d178c7ca8fef (Media CI checkpatch); collect Andy's Reviewed-by;
v3: https://lore.kernel.org/all/20260623221028.40238-1-rodrigo.gobbi.7@gmail.com/#t
v2: https://lore.kernel.org/all/20260622224402.34001-1-rodrigo.gobbi.7@gmail.com/
v1: https://lore.kernel.org/all/20260609215110.118860-1-rodrigo.gobbi.7@gmail.com/


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


