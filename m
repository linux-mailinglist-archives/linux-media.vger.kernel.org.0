Return-Path: <linux-media+bounces-56609-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OV6lLE3rvmn9jgMAu9opvQ
	(envelope-from <linux-media+bounces-56609-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 20:02:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C99122E6E20
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 20:02:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFA0D30151C3
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 19:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B93232F3C1F;
	Sat, 21 Mar 2026 19:02:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.auroraos.dev (unknown [95.181.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DA3175A81
	for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 19:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.181.193.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774119749; cv=none; b=arPPVc/4JeaS9j0jYknBAUKr/ES+ZtL2/9brexp7ivh9KMdqloEupecHBtnEMJgRU+eX4pRcgDg8me27G+xoPKwgfXhxlF4wE9eFzNc4zygSWHTTA/uQ/VJCIaOFA7n7mpUyYNJQEgnEhUD4XZXx/RdDmjblhQnjZvK3C7WNh3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774119749; c=relaxed/simple;
	bh=9s9eg76U0XTaysGI9/r7rV7b/pAc7Cj+xmVn4IHDruA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YePlf0+N0ev0rsYnuHR34lv1MOhG7c8OwHKczwSfrHfRi9+bRZ8a+NcRkX075+6Tuhn5VYfwRni9p9JhzoL4Jrj4XTUobjVb07HbaMwUyLIHk1bpW1gMAiqkDfOJUImehjveSGWL+WhfN7rdLBdzM8vwt0fBAAIoRPURK2JJFtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev; spf=pass smtp.mailfrom=auroraos.dev; arc=none smtp.client-ip=95.181.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auroraos.dev
Received: from wasted (213.87.139.102) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Sat, 21 Mar
 2026 22:02:14 +0300
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, <linux-media@vger.kernel.org>
CC: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Subject: [PATCH 0/5] LG Electronics LGDT3306A DVB frontend driver cleanups
Date: Sat, 21 Mar 2026 22:01:37 +0300
Message-ID: <20260321190143.21123-1-s.shtylyov@auroraos.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[auroraos.dev : SPF not aligned (relaxed), No valid DKIM,quarantine,sampled_out];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56609-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.shtylyov@auroraos.dev,linux-media@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,auroraos.dev:mid,linuxtv.org:url]
X-Rspamd-Queue-Id: C99122E6E20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

First, there was Svace (static analysis tool) reporting many assignments
(mainly of the results of the register read/write functions) done but the
resulting values ignored. Then, while looking at the code, I came up with
a few more patches...

The patches are against the next branch of the linuxtv.org/media.git repo
plus this patch (posted earlier this week):

https://lore.kernel.org/all/20260316204455.63426-1-s.shtylyov@auroraos.dev/

Sergey Shtylyov (5):
  media: lgdt3306a: drop useless assignments
  media: lgdt3306a: drop pointless register read in lgdt3306a_set_qam()
  media: lgdt3306a: drop useless variables in lgdt3306a_set_inversion*()
  media: lgdt3306a: use *switch* statement in lgdt3306a_init()
  media: lgdt3306a: streamline lgdt3306a_read_{ber,ucblocks}()

 drivers/media/dvb-frontends/lgdt3306a.c | 138 ++++++++++++------------
 1 file changed, 66 insertions(+), 72 deletions(-)

-- 
2.53.0

