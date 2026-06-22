Return-Path: <linux-media+bounces-65420-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4x+XENW6OWrxwgcAu9opvQ
	(envelope-from <linux-media+bounces-65420-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 00:44:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD946B2B12
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 00:44:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=YijQmomp;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65420-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65420-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 566A93037BAB
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 22:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA06C37BE7F;
	Mon, 22 Jun 2026 22:44:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7207369D63
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 22:44:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782168260; cv=none; b=BWLr8zy+eATRd3dWpiyJrhe5vyRYfQWmlH2qeQZyE2FNvbdMMtRKQA0x3PysM9Ck2HX8V1rGqD3y73YEhQO2JgQ52Pdi6FV17UYVh0Q7D1Cb/BIA+eaA61geMCawjvgUBRl9ZCxVZ78OvgmN+d8VuM3aQeDH5J4johJbORVwFAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782168260; c=relaxed/simple;
	bh=W5lWlahgJwGGtGLW0ih66TpOa9zremeMUWH0zXFLfPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MMO7NSVfnpKMEHT5W92MWbz5JGvYNQcPTA/T+fNOSI7LSWBb2i2OFI36f197p/cw48jqXiK2cUtySo+w3/w+uaYn4zTeTACzvHFMJWRORflUvQvzoNC6cjhYscI3/7lqZwrEeESAZdxPiJLBwv+akLKNBtAg8oWaj8Pzrt67qjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YijQmomp; arc=none smtp.client-ip=74.125.82.176
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30bf8b2bd20so8946725eec.0
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 15:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782168257; x=1782773057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Js5zTXLWCpFXjeLRJmY47TLMJHvqvUtd9vW4J/ry+I=;
        b=YijQmompk2amt0nsa+sySLtZDDydGl7GTOWsJcAarzgwZq+ZQSsLdAhm9GSIRdiT34
         yFILi1OdjtRN14PdOufd0C7OpnnWQ18ByzyWkU4pNiv3/qKepkk69tWAptHlQ7PGEFV+
         BSKm8v81upwNAes9SYw/OSx0FkKD+oxouE/yYOMwbPy46Sf9N+HFeTkyG3cfDjF3MefW
         cuMyZ/zUIbxbO8lu1KiNKwyt7cySI/TEn0jiVB9wiDvF8mEV6jO1MhSgb0OUigkd6PU0
         LWgp6jozd/yilKHQRqJyHEIx4zrv6+K5H6cpxPtU4+5kcWthBHEPe4UXnCpHUTnS5UHg
         0QTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782168257; x=1782773057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Js5zTXLWCpFXjeLRJmY47TLMJHvqvUtd9vW4J/ry+I=;
        b=hDyxhrhmI+zOG48B4WBaTzlfY0hL0/cUZ2t5DeksA+uWuL+pGFJHbTEWEz8U4wRFaq
         +lmo/imbMIh69bxmYHH+jk/MQC/MVCR+7+R+O3w9kQLvKp5ZoFFg2B1ZWIsMXKQTLIPW
         Fz7W28zhG8vgof6+7xBEVMa9N1MxWDd+C0GrqPbS36DrP1EqgzV9ye70cd8pT0aD8LiK
         I8/eg9a8Tzr0F4dG1u+/j4mUGCcHaGjT8r1oI/XQq+xsK+CZyX1R5TjhURZaeniu1UIV
         zppIe+rUd01xMnKQmZ98sGAooBxCw28u4KzgcSHhIVzji9aGh/z/AoGmtfQ0EHftFO/l
         /NpQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq08Dqo44RbhxZmAB9vf71zUJsveA0Korw5OW2jEG1WzpEfxILzCHNo3ATPAWY4CuJQKFN9S4NcyrEbzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAY0LLeyYLcSZLp3vjNLij1NDOy9+tnUCYNy/7ijGOgHqvZ8fe
	s7ZTLjzCNdZH9Bxr8jGf4UcvbAcKt155AJBiDMQfVU0jWUYluPZRAFVj
X-Gm-Gg: AfdE7ck2t6Uf+m5Vn2wPQpGYZEmKBj5b02APV/R+HkknZNYk6kqCp709JNL7uBHTVuM
	fRzKjq0X1se41zIezsJQX7wPFoer/Ycx5w4WYEckQYamOb2EtXE5skqZ+CWelpJJYfHRQDTn6cq
	Dsz1xsZCEfX0jTbrm2HVdn8Ma/Lu2iVqi+p0QdLUi9X59s1IEFLLxQiPvJYoWtEmKh0cTu8HqhU
	NgnXfnMAcx40+izJ1RjzIGUXtYnAK8+5B9iWU9P18YdHbRcfdroXLnnckQ5n9hXEKQ9gRSnVV37
	DZcZQX7gkwSnJf+Nm+GP2p99EFRbEsdJSAUItRXtuXJ2mcEpFAJ6C1I9Wq91+vzh66e/LiaLnco
	zH2PJ9Y/aK419YiH9FldzYLBH2qSI8O697utOU0av7CWwB9Hqq0zWXKDZo7+026DSBDbp7Lb30M
	2NOqmkkYbNZn0F4aC2i8Crsy7Y0fMb8KCdcxR6GT4dnshgal89d3C3C9kUzbfGwMtjyyk=
X-Received: by 2002:a05:7300:ac8a:b0:304:6d18:3646 with SMTP id 5a478bee46e88-30c1d5955c6mr8674408eec.0.1782168256832;
        Mon, 22 Jun 2026 15:44:16 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:691c:629b:eda4:7c2e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba1c376sm13087954eec.3.2026.06.22.15.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 15:44:16 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 0/3] staging: media: atomisp: use kvmalloc_objs() and drop redundant OOM messages
Date: Mon, 22 Jun 2026 19:42:41 -0300
Message-ID: <20260622224402.34001-1-rodrigo.gobbi.7@gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:~lkcamp/patches@lists.sr.ht,m:linux-kernel-mentees@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65420-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8FD946B2B12

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
Hi, all,
Regarding a comment from Andy at [3]:
> From: Andy Shevchenko <andriy.shevchenko@intel.com>
> On Tue, Jun 09, 2026 at 06:46:31PM -0300, Rodrigo Gobbi wrote:
> Replace kvmalloc() with multiply with kvmalloc_objs(), which handles
> the size multiplication internally with overflow checking, silenting
> checkpatch warn.
> 
> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
> ---
> Hi, all,
> There is a ongoing effort like this for other files from atomisp
> at [1], yet, it is not covering the same file.
> Tks and regards.
> 
> [1] https://lore.kernel.org/all/20260413112904.98864-1-feng@innora.ai/

> Yeah, the problem is that the activity seems stale. Can you pickup all
> the patches from the mailing list that have not been yet applied (regarding
> k*alloc() uses) and combine them into series or so and update regarding to
> Sakari's comments?
The only patches that I found from stale threads were added in this series,
hope that is fine now.
Tks and regards.

Changelog:
v2: convert to a series with additional stale patches;
v1: https://lore.kernel.org/all/20260609215110.118860-1-rodrigo.gobbi.7@gmail.com/
---
Rodrigo Gobbi (3):
  staging: media: atomisp: use kvmalloc_objs() in make_histogram()
  staging: media: atomisp: use kvmalloc_objs() for overflow-safe
    allocation
  staging: media: atomisp: drop redundant out-of-memory messages

 .../media/atomisp/pci/sh_css_metrics.c        |  11 +-
 .../media/atomisp/pci/sh_css_param_dvs.c      |   5 -
 .../staging/media/atomisp/pci/sh_css_params.c | 101 +++++++-----------
 3 files changed, 41 insertions(+), 76 deletions(-)

-- 
2.48.1


