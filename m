Return-Path: <linux-media+bounces-66697-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JnhOALRPS2qHPAEAu9opvQ
	(envelope-from <linux-media+bounces-66697-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 08:48:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E499C70D249
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 08:48:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=sk.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66697-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66697-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E42ED30028F3
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 06:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DCA347F2CA;
	Mon,  6 Jul 2026 06:22:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D3B431E68;
	Mon,  6 Jul 2026 06:22:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783318949; cv=none; b=GZzI0/koBU4o04f81BbLyTi2PaggG96pKjFtsilcgQakqrq0/9uXKQ/DfVEGDcNreiE1TvRY7Om8jv+RkGkfuqfoerrlDySuDpM93kR5Hyo6PvxCt3Lr7t9IWxaOgu+WRXHZLzTb6soO3wmFF4LkZH90I4MsTE8aHYgnz/IRsjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783318949; c=relaxed/simple;
	bh=xc0OMbUS9uSQ9nwrKgQqOcPYyrCTpzyELXOiHv+uu08=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=U9wEByiGLGY6sWWkywkOI21NiTkDa7YtDzda5Qi6vUOpj3KXpRK7y7YRPL/8NEQeEDymm0RBhdGxMiUF/tY2H3WPmAUH7gmq+3P5UbLndJr/TUCy6hIU0dvfJg6sm38Zf3oqSt2naFx1Vn7F4ZxyC1Dpv5HD4BOUg5YfxeShoho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
X-AuditID: a67dfc5b-c45ff70000001609-82-6a4b4984efbe
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
Cc: max.byungchul.park@gmail.com,
	kernel_team@skhynix.com,
	torvalds@linux-foundation.org,
	damien.lemoal@opensource.wdc.com,
	linux-ide@vger.kernel.org,
	adilger.kernel@dilger.ca,
	linux-ext4@vger.kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	will@kernel.org,
	tglx@linutronix.de,
	rostedt@goodmis.org,
	joel@joelfernandes.org,
	sashal@kernel.org,
	daniel.vetter@ffwll.ch,
	duyuyang@gmail.com,
	johannes.berg@intel.com,
	tj@kernel.org,
	tytso@mit.edu,
	willy@infradead.org,
	david@fromorbit.com,
	amir73il@gmail.com,
	gregkh@linuxfoundation.org,
	kernel-team@lge.com,
	linux-mm@kvack.org,
	akpm@linux-foundation.org,
	mhocko@kernel.org,
	minchan@kernel.org,
	hannes@cmpxchg.org,
	vdavydov.dev@gmail.com,
	sj@kernel.org,
	jglisse@redhat.com,
	dennis@kernel.org,
	cl@linux.com,
	penberg@kernel.org,
	rientjes@google.com,
	vbabka@suse.cz,
	ngupta@vflare.org,
	linux-block@vger.kernel.org,
	josef@toxicpanda.com,
	linux-fsdevel@vger.kernel.org,
	jack@suse.cz,
	jlayton@kernel.org,
	dan.j.williams@intel.com,
	hch@infradead.org,
	djwong@kernel.org,
	dri-devel@lists.freedesktop.org,
	rodrigosiqueiramelo@gmail.com,
	melissa.srw@gmail.com,
	hamohammed.sa@gmail.com,
	harry.yoo@oracle.com,
	chris.p.wilson@intel.com,
	gwan-gyeong.mun@intel.com,
	boqun.feng@gmail.com,
	longman@redhat.com,
	yunseong.kim@ericsson.com,
	ysk@kzalloc.com,
	yeoreum.yun@arm.com,
	netdev@vger.kernel.org,
	matthew.brost@intel.com,
	her0gyugyu@gmail.com,
	corbet@lwn.net,
	catalin.marinas@arm.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	luto@kernel.org,
	sumit.semwal@linaro.org,
	gustavo@padovan.org,
	christian.koenig@amd.com,
	andi.shyti@kernel.org,
	arnd@arndb.de,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	rppt@kernel.org,
	surenb@google.com,
	mcgrof@kernel.org,
	petr.pavlu@suse.com,
	da.gomez@kernel.org,
	samitolvanen@google.com,
	paulmck@kernel.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	josh@joshtriplett.org,
	urezki@gmail.com,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	chuck.lever@oracle.com,
	neil@brown.name,
	okorniev@redhat.com,
	Dai.Ngo@oracle.com,
	tom@talpey.com,
	trondmy@kernel.org,
	anna@kernel.org,
	kees@kernel.org,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	mark.rutland@arm.com,
	ada.coupriediaz@arm.com,
	kristina.martsenko@arm.com,
	wangkefeng.wang@huawei.com,
	broonie@kernel.org,
	kevin.brodsky@arm.com,
	dwmw@amazon.co.uk,
	shakeel.butt@linux.dev,
	ast@kernel.org,
	ziy@nvidia.com,
	yuzhao@google.com,
	baolin.wang@linux.alibaba.com,
	usamaarif642@gmail.com,
	joel.granados@kernel.org,
	richard.weiyang@gmail.com,
	geert+renesas@glider.be,
	tim.c.chen@linux.intel.com,
	linux@treblig.org,
	alexander.shishkin@linux.intel.com,
	lillian@star-ark.net,
	chenhuacai@kernel.org,
	francesco@valla.it,
	guoweikang.kernel@gmail.com,
	link@vivo.com,
	jpoimboe@kernel.org,
	masahiroy@kernel.org,
	brauner@kernel.org,
	thomas.weissschuh@linutronix.de,
	oleg@redhat.com,
	mjguzik@gmail.com,
	andrii@kernel.org,
	wangfushuai@baidu.com,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-i2c@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-modules@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	2407018371@qq.com,
	dakr@kernel.org,
	miguel.ojeda.sandonis@gmail.com,
	neilb@ownmail.net,
	bagasdotme@gmail.com,
	wsa+renesas@sang-engineering.com,
	dave.hansen@intel.com,
	geert@linux-m68k.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v19 40/40] dept: implement a basic unit test for dept
Date: Mon,  6 Jul 2026 15:19:28 +0900
Message-Id: <20260706061928.66713-41-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260706061928.66713-1-byungchul@sk.com>
References: <20260706061928.66713-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0xTdxjG/Z/zP+e01ZpjRT3KB0jNnGGRecHl1ZjJBw1HyYxmccn0gzZw
	kHKpplUuGg2gdRUKsmGpKxdBtA5ErO1ULjIVY7RRCohoWSHQoIVyVdYScXhpMX775Xne93mT
	J6+IlPVQy0RK1WFBrVKkyGkJlozNq1yl3RabtLppSAIvsu9h8Pt0GHTWPyl4/DIHQ3vdVQS+
	aRcDhmwEtX9nE2Bwv6LB6M3GMGHWI/A+jIFPvYMEfChOhgsXbTSMFL+h4f/WNhKMhnYEle5e
	Eia9/QjshjwaxjpKCWjob2Sgz+zBUHxjCUybaxh4WtWDoaS1k4K6sTYKRjx/0ND36DQFvudu
	AnSNfgzN/34HnY2lNOgtNymwm6oxuFrPMuDud1IwVRAK7b/nU+AsfI2gaNyDoNs4yoDZP8GA
	p+s0AZZTJgaqL1xBcPOuFsFl3zgJvw010dBTMIzheXcTguueByQMmsoIeOAfJaDoWQUNNquB
	BK1+OlDBjI6GPG0xBsvbKzQUOGLg2ocXKDqar7HdIvja8lrE+y6fJHltYYBO2dL59/4umm+e
	qsB8g6mX4SusR/iqO16Ct9acoflxh4PhK7MMJF9u38W7Pg6QfM7Th+TO0D2STfFCijJNUH//
	435J4rluHT7UsjnD8G6EzEJ563ORWMSxUZxDd5v6yn3/uYgg0+y3nNM5TQY5hA3nbPmewIxE
	RLKdYZzenI+DxkJ2K9dR3cwEGbPfcB2OS7O6lP2By613kV9Cw7irlnuzLA7odTNlswdk7HrO
	NfEIB0M5tkrM6W8N0F8WlnL3/3LiQiStQHNqkEypSktVKFOiIhMzVcqMyLiDqVYU+Dnz8Zm9
	9Wiy/ecWxIqQfJ4UorcnyShFmiYztQVxIlIeIl2xMjZJJo1XZB4V1Af3qY+kCJoWFCrC8iXS
	tVPp8TL2gOKwkCwIhwT1V5cQiZdlocXHw41jQM01iSWLNEVxEwMsbps8mRERfsKZHCYJmfNx
	R/Ivv/Yu6BrZ3106NT9Nv8O7IWGfJb3hJ06xZstwPYoJX413qwbco49L3tpLhne/Gyw/31Cb
	I8tZimK3HOuIoJYPcRu0T4yfol6eSE8oC4uM+2d85cWddxLc9tyN6wZ9cqxJVKyJINUaxWdj
	cndZbwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0hTcRTH+917dzdHi8uSvBn0GD3VHkbKiV4WVLciiwiiItstLzkfS7Yy
	7UHpXC0fNVeb1LLMdKWzWq7SKSNRMnuYTistsxWs1VBTTCvfTaN/Dp/z/Z7XH0eAi8t4/gKZ
	/AinkLOxElJICMNXqBambtoSvcT2VQIa9Wn46HTx4F1yJQF9vRoCrt0vJmHYWMoHTckVHtQ2
	pxDQcM+MwNmnQfB70IiD2jZKwLCuhg+9/a180CcjGLXXIDA4dDi0NDzBofhhMgY/LSMktFf3
	INB/cZGQ7UkmoMuUgeCq28gHz9ON0Oms4MFo2zcMmn91IDC5RjBwVZ5DMGyIgRt5Vm+7oZuE
	wbp6HLL1DQhufmnDocfzGcHDmk8I7HdSSPiqfYRDk2sSvOnrIuG5Pp2ETsc1DH5YSMhNsfPA
	8aodQY5Rh8D9wY6B6tZ9Egw5JQTYPpfzwdE+hMFHgw4Dc8lWcJrcBLzU5mHec71VD/zAmK3C
	vOE7Bvq7FRj0m4r4YQWI+a2+QDBF1scYo24cJpni68WIGRzQIaa3QIUzaq03re7owplU6zGm
	4GUHyQz0vSUZ+69cgnmRRzP55wcwJqtuIWO72sbfvnaPcGUkFytL4BSLV0uFUZffa4j4qjWJ
	+j/t+BmUHpKGfAQ0tYx2/mzFxpik5tEtLf34GPtSM2lrppuXhoQCnGqaQWeYMokxYzK1nnYU
	2vljTFBzaMfr/HFdRIXSaWWt+L+hM2izpXKcfbz6vaGc8QViKoRu7XpGaJEwF00oQr4yeUIc
	K4sNWaSMiUqSyxIXHTwcV4K8/2Q6NZRVhnqbNlYhSoAkE0UQtjlazGMTlElxVYgW4BJf0dz5
	W6LFokg26TinOLxfcTSWU1ahaQJC4ifavIuTiqlD7BEuhuPiOcV/FxP4+J9B0kZ2dv0UqyWo
	cffz0ilZ5WL1qpgDZ3MuSwMt4cf22bXT44wb1v2pXW41e6QBmr3BQWsS02RHB0/daAjnFljl
	5b6fKmqn7ogItJ3uDr2Y1+kvuXCi83bppPqdnrqmQPfS0PRZXFJZt6pat1VamGqAk3LxjhTt
	tvUBly6KmIgC1iwhlFFscACuULJ/AYjxPnJLAwAA
X-CFilter-Loop: Reflected
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[sk.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,skhynix.com,linux-foundation.org,opensource.wdc.com,vger.kernel.org,dilger.ca,redhat.com,infradead.org,kernel.org,linutronix.de,goodmis.org,joelfernandes.org,ffwll.ch,intel.com,mit.edu,fromorbit.com,linuxfoundation.org,lge.com,kvack.org,cmpxchg.org,linux.com,google.com,suse.cz,vflare.org,toxicpanda.com,lists.freedesktop.org,oracle.com,ericsson.com,kzalloc.com,arm.com,lwn.net,alien8.de,zytor.com,linaro.org,padovan.org,amd.com,arndb.de,suse.com,nvidia.com,joshtriplett.org,efficios.com,linux.dev,suse.de,brown.name,talpey.com,huawei.com,amazon.co.uk,linux.alibaba.com,glider.be,linux.intel.com,treblig.org,star-ark.net,valla.it,vivo.com,baidu.com,lists.infradead.org,lists.linaro.org,lists.linux.dev,qq.com,ownmail.net,sang-engineering.com,linux-m68k.org,garyguo.net,protonmail.com,umich.edu];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:max.byungchul.park@gmail.com,m:kernel_team@skhynix.com,m:torvalds@linux-foundation.org,m:damien.lemoal@opensource.wdc.com,m:linux-ide@vger.kernel.org,m:adilger.kernel@dilger.ca,m:linux-ext4@vger.kernel.org,m:mingo@redhat.com,m:peterz@infradead.org,m:will@kernel.org,m:tglx@linutronix.de,m:rostedt@goodmis.org,m:joel@joelfernandes.org,m:sashal@kernel.org,m:daniel.vetter@ffwll.ch,m:duyuyang@gmail.com,m:johannes.berg@intel.com,m:tj@kernel.org,m:tytso@mit.edu,m:willy@infradead.org,m:david@fromorbit.com,m:amir73il@gmail.com,m:gregkh@linuxfoundation.org,m:kernel-team@lge.com,m:linux-mm@kvack.org,m:akpm@linux-foundation.org,m:mhocko@kernel.org,m:minchan@kernel.org,m:hannes@cmpxchg.org,m:vdavydov.dev@gmail.com,m:sj@kernel.org,m:jglisse@redhat.com,m:dennis@kernel.org,m:cl@linux.com,m:penberg@kernel.org,m:rientjes@google.com,m:vbabka@suse.cz,m:ngupta@vflare.org,m:linux-block@vger.kernel.org,m:josef@toxicpanda.com,m:linux-fsdevel@vger.kern
 el.org,m:jack@suse.cz,m:jlayton@kernel.org,m:dan.j.williams@intel.com,m:hch@infradead.org,m:djwong@kernel.org,m:dri-devel@lists.freedesktop.org,m:rodrigosiqueiramelo@gmail.com,m:melissa.srw@gmail.com,m:hamohammed.sa@gmail.com,m:harry.yoo@oracle.com,m:chris.p.wilson@intel.com,m:gwan-gyeong.mun@intel.com,m:boqun.feng@gmail.com,m:longman@redhat.com,m:yunseong.kim@ericsson.com,m:ysk@kzalloc.com,m:yeoreum.yun@arm.com,m:netdev@vger.kernel.org,m:matthew.brost@intel.com,m:her0gyugyu@gmail.com,m:corbet@lwn.net,m:catalin.marinas@arm.com,m:bp@alien8.de,m:x86@kernel.org,m:hpa@zytor.com,m:luto@kernel.org,m:sumit.semwal@linaro.org,m:gustavo@padovan.org,m:christian.koenig@amd.com,m:andi.shyti@kernel.org,m:arnd@arndb.de,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:rppt@kernel.org,m:surenb@google.com,m:mcgrof@kernel.org,m:petr.pavlu@suse.com,m:da.gomez@kernel.org,m:samitolvanen@google.com,m:paulmck@kernel.org,m:frederic@kernel.org,m:neeraj.upadhyay@kernel.org,m:joelagnelf@nvidia.com,m:jo
 sh@joshtriplett.org,m:urezki@gmail.com,m:mathieu.desnoyers@efficios.com,m:jiangshanlai@gmail.com,m:qiang.zhang@linux.dev,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:chuck.lever@oracle.com,m:neil@brown.name,m:okorniev@redhat.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[byungchul@sk.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-66697-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[byungchul@sk.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_GT_50(0.00)[165];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sk.com:from_mime,sk.com:email,sk.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E499C70D249

Implement CONFIG_DEPT_UNIT_TEST introducing a kernel module that runs
basic unit test for dept.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/dept_unit_test.h     |  61 ++++++++++++
 kernel/dependency/Makefile         |   1 +
 kernel/dependency/dept.c           |  10 ++
 kernel/dependency/dept_unit_test.c | 149 +++++++++++++++++++++++++++++
 lib/Kconfig.debug                  |  12 +++
 5 files changed, 233 insertions(+)
 create mode 100644 include/linux/dept_unit_test.h
 create mode 100644 kernel/dependency/dept_unit_test.c

diff --git a/include/linux/dept_unit_test.h b/include/linux/dept_unit_test.h
new file mode 100644
index 000000000000..753ac9ac727c
--- /dev/null
+++ b/include/linux/dept_unit_test.h
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * DEPT unit test
+ *
+ * Started by Byungchul Park <max.byungchul.park@gmail.com>:
+ *
+ *  Copyright (c) 2025 SK hynix, Inc., Byungchul Park
+ */
+
+#ifndef __LINUX_DEPT_UNIT_TEST_H
+#define __LINUX_DEPT_UNIT_TEST_H
+
+#if defined(CONFIG_DEPT_UNIT_TEST) || defined(CONFIG_DEPT_UNIT_TEST_MODULE)
+struct dept_ut {
+	bool circle_detected;
+
+	int ecxt_stack_total_cnt;
+	int wait_stack_total_cnt;
+	int evnt_stack_total_cnt;
+	int ecxt_stack_valid_cnt;
+	int wait_stack_valid_cnt;
+	int evnt_stack_valid_cnt;
+};
+
+extern struct dept_ut dept_ut_results;
+
+static inline void dept_ut_circle_detect(void)
+{
+	dept_ut_results.circle_detected = true;
+}
+static inline void dept_ut_ecxt_stack_account(bool valid)
+{
+	dept_ut_results.ecxt_stack_total_cnt++;
+
+	if (valid)
+		dept_ut_results.ecxt_stack_valid_cnt++;
+}
+static inline void dept_ut_wait_stack_account(bool valid)
+{
+	dept_ut_results.wait_stack_total_cnt++;
+
+	if (valid)
+		dept_ut_results.wait_stack_valid_cnt++;
+}
+static inline void dept_ut_evnt_stack_account(bool valid)
+{
+	dept_ut_results.evnt_stack_total_cnt++;
+
+	if (valid)
+		dept_ut_results.evnt_stack_valid_cnt++;
+}
+#else
+struct dept_ut {};
+
+#define dept_ut_circle_detect() do { } while (0)
+#define dept_ut_ecxt_stack_account(v) do { } while (0)
+#define dept_ut_wait_stack_account(v) do { } while (0)
+#define dept_ut_evnt_stack_account(v) do { } while (0)
+
+#endif
+#endif /* __LINUX_DEPT_UNIT_TEST_H */
diff --git a/kernel/dependency/Makefile b/kernel/dependency/Makefile
index 92f165400187..fc584ca87124 100644
--- a/kernel/dependency/Makefile
+++ b/kernel/dependency/Makefile
@@ -2,3 +2,4 @@
 
 obj-$(CONFIG_DEPT) += dept.o
 obj-$(CONFIG_DEPT) += dept_proc.o
+obj-$(CONFIG_DEPT_UNIT_TEST) += dept_unit_test.o
diff --git a/kernel/dependency/dept.c b/kernel/dependency/dept.c
index 35a3667ac8b3..bcff14f20046 100644
--- a/kernel/dependency/dept.c
+++ b/kernel/dependency/dept.c
@@ -78,8 +78,12 @@
 #include <linux/workqueue.h>
 #include <linux/irq_work.h>
 #include <linux/vmalloc.h>
+#include <linux/dept_unit_test.h>
 #include "dept_internal.h"
 
+struct dept_ut dept_ut_results;
+EXPORT_SYMBOL_GPL(dept_ut_results);
+
 static int dept_stop;
 static int dept_per_cpu_ready;
 
@@ -826,6 +830,10 @@ static void print_dep(struct dept_dep *d)
 			pr_warn("(wait to wake up)\n");
 			print_ip_stack(0, e->ewait_stack);
 		}
+
+		dept_ut_ecxt_stack_account(valid_stack(e->ecxt_stack));
+		dept_ut_wait_stack_account(valid_stack(w->wait_stack));
+		dept_ut_evnt_stack_account(valid_stack(e->event_stack));
 	}
 }
 
@@ -920,6 +928,8 @@ static void print_circle(struct dept_class *c)
 	dump_stack();
 
 	dept_outworld_exit();
+
+	dept_ut_circle_detect();
 }
 
 /*
diff --git a/kernel/dependency/dept_unit_test.c b/kernel/dependency/dept_unit_test.c
new file mode 100644
index 000000000000..e8dada2e3dfb
--- /dev/null
+++ b/kernel/dependency/dept_unit_test.c
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * DEPT unit test
+ *
+ * Started by Byungchul Park <max.byungchul.park@gmail.com>:
+ *
+ *  Copyright (c) 2025 SK hynix, Inc., Byungchul Park
+ */
+
+#include <linux/module.h>
+#include <linux/spinlock.h>
+#include <linux/mutex.h>
+#include <linux/dept.h>
+#include <linux/dept_unit_test.h>
+
+MODULE_DESCRIPTION("DEPT unit test");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Byungchul Park <max.byungchul.park@sk.com>");
+
+struct unit {
+	const char *name;
+	bool (*func)(void);
+	bool result;
+};
+
+static DEFINE_SPINLOCK(s1);
+static DEFINE_SPINLOCK(s2);
+static bool test_spin_lock_deadlock(void)
+{
+	dept_ut_results.circle_detected = false;
+
+	spin_lock(&s1);
+	spin_lock(&s2);
+	spin_unlock(&s2);
+	spin_unlock(&s1);
+
+	spin_lock(&s2);
+	spin_lock(&s1);
+	spin_unlock(&s1);
+	spin_unlock(&s2);
+
+	return dept_ut_results.circle_detected;
+}
+
+static DEFINE_MUTEX(m1);
+static DEFINE_MUTEX(m2);
+static bool test_mutex_lock_deadlock(void)
+{
+	dept_ut_results.circle_detected = false;
+
+	mutex_lock(&m1);
+	mutex_lock(&m2);
+	mutex_unlock(&m2);
+	mutex_unlock(&m1);
+
+	mutex_lock(&m2);
+	mutex_lock(&m1);
+	mutex_unlock(&m1);
+	mutex_unlock(&m2);
+
+	return dept_ut_results.circle_detected;
+}
+
+static bool test_wait_event_deadlock(void)
+{
+	struct dept_map dmap1;
+	struct dept_map dmap2;
+
+	sdt_map_init(&dmap1);
+	sdt_map_init(&dmap2);
+
+	dept_ut_results.circle_detected = false;
+
+	sdt_request_event(&dmap1); /* [S] */
+	sdt_wait(&dmap2); /* [W] */
+	sdt_event(&dmap1); /* [E] */
+
+	sdt_request_event(&dmap2); /* [S] */
+	sdt_wait(&dmap1); /* [W] */
+	sdt_event(&dmap2); /* [E] */
+
+	return dept_ut_results.circle_detected;
+}
+
+static struct unit units[] = {
+	{
+		.name = "spin lock deadlock test",
+		.func = test_spin_lock_deadlock,
+	},
+	{
+		.name = "mutex lock deadlock test",
+		.func = test_mutex_lock_deadlock,
+	},
+	{
+		.name = "wait event deadlock test",
+		.func = test_wait_event_deadlock,
+	},
+};
+
+static int __init dept_ut_init(void)
+{
+	int i;
+
+	lockdep_off();
+
+	dept_ut_results.ecxt_stack_valid_cnt = 0;
+	dept_ut_results.ecxt_stack_total_cnt = 0;
+	dept_ut_results.wait_stack_valid_cnt = 0;
+	dept_ut_results.wait_stack_total_cnt = 0;
+	dept_ut_results.evnt_stack_valid_cnt = 0;
+	dept_ut_results.evnt_stack_total_cnt = 0;
+
+	for (i = 0; i < ARRAY_SIZE(units); i++)
+		units[i].result = units[i].func();
+
+	pr_info("\n");
+	pr_info("******************************************\n");
+	pr_info("DEPT unit test results\n");
+	pr_info("******************************************\n");
+	for (i = 0; i < ARRAY_SIZE(units); i++) {
+		pr_info("(%s) %s\n", units[i].result ? "pass" : "fail",
+				units[i].name);
+	}
+	pr_info("ecxt stack valid count = %d/%d\n",
+			dept_ut_results.ecxt_stack_valid_cnt,
+			dept_ut_results.ecxt_stack_total_cnt);
+	pr_info("wait stack valid count = %d/%d\n",
+			dept_ut_results.wait_stack_valid_cnt,
+			dept_ut_results.wait_stack_total_cnt);
+	pr_info("event stack valid count = %d/%d\n",
+			dept_ut_results.evnt_stack_valid_cnt,
+			dept_ut_results.evnt_stack_total_cnt);
+	pr_info("******************************************\n");
+	pr_info("\n");
+
+	lockdep_on();
+
+	return 0;
+}
+
+static void dept_ut_cleanup(void)
+{
+	/*
+	 * Do nothing for now.
+	 */
+}
+
+module_init(dept_ut_init);
+module_exit(dept_ut_cleanup);
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 5c7f22ba253e..41c822f7b75a 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1477,6 +1477,18 @@ config DEPT_AGGRESSIVE_TIMEOUT_WAIT
 	  that timeout is used to avoid a deadlock. Say N if you'd like
 	  to avoid verbose reports.
 
+config DEPT_UNIT_TEST
+	tristate "unit test for DEPT"
+	depends on DEBUG_KERNEL && DEPT
+	default n
+	help
+	  This option provides a kernel module that runs unit test for
+	  DEPT.
+
+	  Say Y if you want DEPT unit test to be built into the kernel.
+	  Say M if you want DEPT unit test to build as a module.
+	  Say N if you are unsure.
+
 config LOCK_DEBUGGING_SUPPORT
 	bool
 	depends on TRACE_IRQFLAGS_SUPPORT && STACKTRACE_SUPPORT && LOCKDEP_SUPPORT
-- 
2.17.1


