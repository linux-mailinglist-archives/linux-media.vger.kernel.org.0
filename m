Return-Path: <linux-media+bounces-66691-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V7fAI01SS2pjPQEAu9opvQ
	(envelope-from <linux-media+bounces-66691-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 08:59:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFFB70D3FA
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 08:59:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=sk.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66691-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66691-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2178E3366614
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 06:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71AB414DE6;
	Mon,  6 Jul 2026 06:21:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 155B73DE438;
	Mon,  6 Jul 2026 06:21:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783318899; cv=none; b=bsPtfSm92ykuOMQgxLla8vwOQVInpV23NEOIjN2sHIkFf3D/FabPWObfAY9PjA3aj+vI26U9ayUcn2X6E6vkPcrJkhd2QskHREUdEv5ZPG5AUcumt/bkOFOTJZvHJsYtOunGc5VS/EcISzPDpnP3E52tINV/aBRrjvTTBRaubF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783318899; c=relaxed/simple;
	bh=ZP14qEDopNnEnLEQhqQ/ulyrwzcBDiZHFXDtu5WPpPo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=sT0nqR8lGkuvDi9vLeyIdZX2+T85VXagWxM4RQtHBgHBZmcRSz4JpTyssc0z9NIb0LyRvArUX5U/nSnaFsbKaz/8ICO3Pid+6x2Fq2jMlYG2vxMnTKHkBsPhXHOB4VhQhlvwmg9uyjRYw/1vzTXi2f58XIcEeODIA2zFikGCEag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
X-AuditID: a67dfc5b-c45ff70000001609-f1-6a4b49054f63
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
Subject: [PATCH v19 31/40] dept: assign unique dept_key to each distinct wait_for_completion() caller
Date: Mon,  6 Jul 2026 15:19:19 +0900
Message-Id: <20260706061928.66713-32-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260706061928.66713-1-byungchul@sk.com>
References: <20260706061928.66713-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzXSa0xTZxgHcN9z3vec0tjsWF12Jku6dBEvCUwXNU8MQ/2w5XXGZAnJTLxE
	q5xAuRTScjUx4eo6BcZMChHQgEDDTaxtvCIIKLoGlWLRVShCE2xAVomlwBqBzmr89svzz///
	6ZGxylGyXqbVZUp6nSZVzcmx3Le6Pprftz9565trKnhR0INhPmDE4OhoQzA+b0RQcjuEIRAc
	5cFUgCDU9RBB5dB5FlyOeyzMWVY4mLnvR2DyTHJQNV2AYdZciqDaW8ODb7yTgHlyhYHJnt8R
	LFemwPsngyxUmRwI6j1jLPinJxB0NRdy8LriOgvD87Mc2E3nOPAN1TLw1sKBd6SLgaKGqxxU
	XrRiGJpZYqDNegAGKi4zUFM1xUDQ3MrD4wY3hponTgJLnm0QqkuHsT9NGDp8gwTsr14QGH90
	hoD1ZT+CwLCHgfZSLwv1ZxoxXLjk5sC4HEDgvFPLQanlOoFX7SEC+TWLBJ61OTAMPPwbg726
	BUPTP0MMeCZcBBbKI8HxVxmBK28vc3sS6GJJOaatthsMLXm2zNH2S+2IBpqKWHr/31mWFtty
	aNdCHaa3q8d4Wtw9wtM6axYtfuAj1Na8hTbcnWboyMyP1Nr6B/drzCF5bIKUqs2W9N/HHZcn
	9RY+JxmF+txQ+QLOR/1Hz6IImShsFxvdRv6z6288ZsPmhI2iyxX86HXCt6KtzEvOIrmMFZwq
	sdRchsPBWkESB103UdhY2CC6Xy+SsBXCTtFdayOfRlVim6Xn41DEh3vH0kUmbKWwQxydfYTD
	o6LQECHaV1rYT4Wvxd5mF65Aijq0qhUptbrsNI02dXtMUp5OmxtzMj3Nij68nPn00uFbyO+I
	70OCDKlXK2DPL8lKosk25KX1IVHGqtcpojbtT1YqEjR5pyR9+jF9Vqpk6EORMqz+SvHDQk6C
	UkjUZEopkpQh6T+njCxifT7a9XJkc2z83uirWhoVGTO38em7uw96W849T0v8KW937hTb671Z
	5ZyrzFgz8R3xJ249QmN/Njae7P7maHBv0hTPx67kNHW+35Hp7xizWAZU+3RXltWG6G714G9Z
	is6gKr7f8UW//UDW05m46gvnF7n8N5ONPXNf/jf8LuVE0cE45267GhuSNNu2sHqD5n8zvpSL
	bgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSf0zMcRjHfb6/7ns3Z1+nrS827IasrbBhz6aRf/StZMzMMNPhS9fv3VVk
	rLoc+dGvs7twRaKbVfpx1w9pR4pIUqficEnbOXIl0o9VV7lj/nn2et7v53nv+eOhcckDcgkt
	j03gFbGyaCklIkQ7N6f7kcGhketev2YgQ50Ctj47CW/TGgkYG80gIL+ijIIZfZ0AMozXSXjx
	TkVAZ3kpgr6xDAQT03oc1PVzBMxoWgQwOvlRANo0BHPmFgQ6iwYHa+djHMqq0zD4XTlLgbN5
	BIG2305B3kAaAcOGKwhuOPQCGHgWBEN9DSTM9X7F4N34IAKDfRYDe+MFBDO6KLhVZHKv635S
	MN3egUOethPB7f5eHEYGPiOobvmEwHxPRcGXnBocuuwLoHtsmIJW7WUKhiz5GPyopKBQZSbB
	8sqJoECvQeD4YMYg/U4FBboCIwH1nx8KwOJ0YWDTaTAoNYZBn8FBQFtOEeY+1z1V5Q36vHTM
	Xb5hoL3fgMGkoUQQWIy4CXUWwZWYajFO/WaG4spuliFuekqDuNHidJxT57jb5sFhnDtnOskV
	tw1S3NRYD8WZxwsJ7mURy929OIVxue1+XP2NXsGubQdEAcf4aHkSr1i7JVwU8UTVQ8arFKfm
	ssaJVPTs0CUkpFlmA3u79hXuYYrxYa3Wyb/sxaxgTZkO8hIS0TjTtZy9YsgkPMYihmc7rHXI
	wwSzirV9mSA9LGY2sbZ8E/kvdDlbWtn4N0jo1stdBZiHJcxG9uPwcyIHiQrRvBLkJY9NipHJ
	ozf6K6MikmPlp/yPxsUYkfufDGdduQ/QaFdQE2JoJJ0vhsCQSAkpS1ImxzQhlsalXuLVa0Ij
	JeJjsuTTvCLusCIxmlc2oaU0IfUWh+zjwyXMCVkCH8Xz8bziv4vRwiWpKLjteKS4Zk9iwHbb
	m9yti8+venSkW/l+KPTM94s768J63ht/+R79mTlwNfNHS0r9cxDubc3u0OY3lnSbXQ+bZsN/
	p1oDmp/CynnZDSGu/Uv7a0HgFD49UO1l2R30dVlVT2BBq49js9ByLiwF3+c8GLxjq2/p6slN
	I4XdSg2NFiZfkxLKCNl6X1yhlP0BQeBZKEsDAAA=
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
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
	TAGGED_FROM(0.00)[bounces-66691-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sk.com:from_mime,sk.com:email,sk.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DDFFB70D3FA

wait_for_completion() can be used at various points in the code and it's
very hard to distinguish wait_for_completion()s between different usages.
Using a single dept_key for all the wait_for_completion()s could trigger
false positive reports.

Assign unique dept_key to each distinct wait_for_completion() caller to
avoid false positive reports.

While at it, add a rust helper for wait_for_completion() to avoid build
errors.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/completion.h | 100 +++++++++++++++++++++++++++++++------
 kernel/sched/completion.c  |  60 +++++++++++-----------
 rust/helpers/completion.c  |   5 ++
 3 files changed, 120 insertions(+), 45 deletions(-)

diff --git a/include/linux/completion.h b/include/linux/completion.h
index 3200b741de28..4d8fb1d95c0a 100644
--- a/include/linux/completion.h
+++ b/include/linux/completion.h
@@ -27,12 +27,10 @@
 struct completion {
 	unsigned int done;
 	struct swait_queue_head wait;
-	struct dept_map dmap;
 };
 
 #define init_completion(x)				\
 do {							\
-	sdt_map_init(&(x)->dmap);			\
 	__init_completion(x);				\
 } while (0)
 
@@ -43,17 +41,14 @@ do {							\
 
 static inline void complete_acquire(struct completion *x, long timeout)
 {
-	sdt_might_sleep_start_timeout(&x->dmap, timeout);
 }
 
 static inline void complete_release(struct completion *x)
 {
-	sdt_might_sleep_end();
 }
 
 #define COMPLETION_INITIALIZER(work) \
-	{ 0, __SWAIT_QUEUE_HEAD_INITIALIZER((work).wait), \
-	  .dmap = DEPT_MAP_INITIALIZER(work, NULL), }
+	{ 0, __SWAIT_QUEUE_HEAD_INITIALIZER((work).wait), }
 
 #define COMPLETION_INITIALIZER_ONSTACK_MAP(work, map) \
 	(*({ init_completion_map(&(work), &(map)); &(work); }))
@@ -119,18 +114,18 @@ static inline void reinit_completion(struct completion *x)
 	x->done = 0;
 }
 
-extern void wait_for_completion(struct completion *);
-extern void wait_for_completion_io(struct completion *);
-extern int wait_for_completion_interruptible(struct completion *x);
-extern int wait_for_completion_killable(struct completion *x);
-extern int wait_for_completion_state(struct completion *x, unsigned int state);
-extern unsigned long wait_for_completion_timeout(struct completion *x,
+extern void __wait_for_completion(struct completion *);
+extern void __wait_for_completion_io(struct completion *);
+extern int __wait_for_completion_interruptible(struct completion *x);
+extern int __wait_for_completion_killable(struct completion *x);
+extern int __wait_for_completion_state(struct completion *x, unsigned int state);
+extern unsigned long __wait_for_completion_timeout(struct completion *x,
 						   unsigned long timeout);
-extern unsigned long wait_for_completion_io_timeout(struct completion *x,
+extern unsigned long __wait_for_completion_io_timeout(struct completion *x,
 						    unsigned long timeout);
-extern long wait_for_completion_interruptible_timeout(
+extern long __wait_for_completion_interruptible_timeout(
 	struct completion *x, unsigned long timeout);
-extern long wait_for_completion_killable_timeout(
+extern long __wait_for_completion_killable_timeout(
 	struct completion *x, unsigned long timeout);
 extern bool try_wait_for_completion(struct completion *x);
 extern bool completion_done(struct completion *x);
@@ -139,4 +134,79 @@ extern void complete(struct completion *);
 extern void complete_on_current_cpu(struct completion *x);
 extern void complete_all(struct completion *);
 
+#define wait_for_completion(x)						\
+({									\
+	sdt_might_sleep_start_timeout(NULL, -1L);			\
+	__wait_for_completion(x);					\
+	sdt_might_sleep_end();						\
+})
+#define wait_for_completion_io(x)					\
+({									\
+	sdt_might_sleep_start_timeout(NULL, -1L);			\
+	__wait_for_completion_io(x);					\
+	sdt_might_sleep_end();						\
+})
+#define wait_for_completion_interruptible(x)				\
+({									\
+	int __ret;							\
+									\
+	sdt_might_sleep_start_timeout(NULL, -1L);			\
+	__ret = __wait_for_completion_interruptible(x);			\
+	sdt_might_sleep_end();						\
+	__ret;								\
+})
+#define wait_for_completion_killable(x)					\
+({									\
+	int __ret;							\
+									\
+	sdt_might_sleep_start_timeout(NULL, -1L);			\
+	__ret = __wait_for_completion_killable(x);			\
+	sdt_might_sleep_end();						\
+	__ret;								\
+})
+#define wait_for_completion_state(x, s)					\
+({									\
+	int __ret;							\
+									\
+	sdt_might_sleep_start_timeout(NULL, -1L);			\
+	__ret = __wait_for_completion_state(x, s);			\
+	sdt_might_sleep_end();						\
+	__ret;								\
+})
+#define wait_for_completion_timeout(x, t)				\
+({									\
+	unsigned long __ret;						\
+									\
+	sdt_might_sleep_start_timeout(NULL, t);				\
+	__ret = __wait_for_completion_timeout(x, t);			\
+	sdt_might_sleep_end();						\
+	__ret;								\
+})
+#define wait_for_completion_io_timeout(x, t)				\
+({									\
+	unsigned long __ret;						\
+									\
+	sdt_might_sleep_start_timeout(NULL, t);				\
+	__ret = __wait_for_completion_io_timeout(x, t);			\
+	sdt_might_sleep_end();						\
+	__ret;								\
+})
+#define wait_for_completion_interruptible_timeout(x, t)			\
+({									\
+	long __ret;							\
+									\
+	sdt_might_sleep_start_timeout(NULL, t);				\
+	__ret = __wait_for_completion_interruptible_timeout(x, t);	\
+	sdt_might_sleep_end();						\
+	__ret;								\
+})
+#define wait_for_completion_killable_timeout(x, t)			\
+({									\
+	long __ret;							\
+									\
+	sdt_might_sleep_start_timeout(NULL, t);				\
+	__ret = __wait_for_completion_killable_timeout(x, t);		\
+	sdt_might_sleep_end();						\
+	__ret;								\
+})
 #endif
diff --git a/kernel/sched/completion.c b/kernel/sched/completion.c
index 5e45a60ff7b3..7262000db114 100644
--- a/kernel/sched/completion.c
+++ b/kernel/sched/completion.c
@@ -4,7 +4,7 @@
  * Generic wait-for-completion handler;
  *
  * It differs from semaphores in that their default case is the opposite,
- * wait_for_completion default blocks whereas semaphore default non-block. The
+ * __wait_for_completion default blocks whereas semaphore default non-block. The
  * interface also makes it easy to 'complete' multiple waiting threads,
  * something which isn't entirely natural for semaphores.
  *
@@ -42,7 +42,7 @@ void complete_on_current_cpu(struct completion *x)
  * This will wake up a single thread waiting on this completion. Threads will be
  * awakened in the same order in which they were queued.
  *
- * See also complete_all(), wait_for_completion() and related routines.
+ * See also complete_all(), __wait_for_completion() and related routines.
  *
  * If this function wakes up a task, it executes a full memory barrier before
  * accessing the task state.
@@ -139,23 +139,23 @@ wait_for_common_io(struct completion *x, long timeout, int state)
 }
 
 /**
- * wait_for_completion: - waits for completion of a task
+ * __wait_for_completion: - waits for completion of a task
  * @x:  holds the state of this particular completion
  *
  * This waits to be signaled for completion of a specific task. It is NOT
  * interruptible and there is no timeout.
  *
- * See also similar routines (i.e. wait_for_completion_timeout()) with timeout
+ * See also similar routines (i.e. __wait_for_completion_timeout()) with timeout
  * and interrupt capability. Also see complete().
  */
-void __sched wait_for_completion(struct completion *x)
+void __sched __wait_for_completion(struct completion *x)
 {
 	wait_for_common(x, MAX_SCHEDULE_TIMEOUT, TASK_UNINTERRUPTIBLE);
 }
-EXPORT_SYMBOL(wait_for_completion);
+EXPORT_SYMBOL(__wait_for_completion);
 
 /**
- * wait_for_completion_timeout: - waits for completion of a task (w/timeout)
+ * __wait_for_completion_timeout: - waits for completion of a task (w/timeout)
  * @x:  holds the state of this particular completion
  * @timeout:  timeout value in jiffies
  *
@@ -167,28 +167,28 @@ EXPORT_SYMBOL(wait_for_completion);
  * till timeout) if completed.
  */
 unsigned long __sched
-wait_for_completion_timeout(struct completion *x, unsigned long timeout)
+__wait_for_completion_timeout(struct completion *x, unsigned long timeout)
 {
 	return wait_for_common(x, timeout, TASK_UNINTERRUPTIBLE);
 }
-EXPORT_SYMBOL(wait_for_completion_timeout);
+EXPORT_SYMBOL(__wait_for_completion_timeout);
 
 /**
- * wait_for_completion_io: - waits for completion of a task
+ * __wait_for_completion_io: - waits for completion of a task
  * @x:  holds the state of this particular completion
  *
  * This waits to be signaled for completion of a specific task. It is NOT
  * interruptible and there is no timeout. The caller is accounted as waiting
  * for IO (which traditionally means blkio only).
  */
-void __sched wait_for_completion_io(struct completion *x)
+void __sched __wait_for_completion_io(struct completion *x)
 {
 	wait_for_common_io(x, MAX_SCHEDULE_TIMEOUT, TASK_UNINTERRUPTIBLE);
 }
-EXPORT_SYMBOL(wait_for_completion_io);
+EXPORT_SYMBOL(__wait_for_completion_io);
 
 /**
- * wait_for_completion_io_timeout: - waits for completion of a task (w/timeout)
+ * __wait_for_completion_io_timeout: - waits for completion of a task (w/timeout)
  * @x:  holds the state of this particular completion
  * @timeout:  timeout value in jiffies
  *
@@ -201,14 +201,14 @@ EXPORT_SYMBOL(wait_for_completion_io);
  * till timeout) if completed.
  */
 unsigned long __sched
-wait_for_completion_io_timeout(struct completion *x, unsigned long timeout)
+__wait_for_completion_io_timeout(struct completion *x, unsigned long timeout)
 {
 	return wait_for_common_io(x, timeout, TASK_UNINTERRUPTIBLE);
 }
-EXPORT_SYMBOL(wait_for_completion_io_timeout);
+EXPORT_SYMBOL(__wait_for_completion_io_timeout);
 
 /**
- * wait_for_completion_interruptible: - waits for completion of a task (w/intr)
+ * __wait_for_completion_interruptible: - waits for completion of a task (w/intr)
  * @x:  holds the state of this particular completion
  *
  * This waits for completion of a specific task to be signaled. It is
@@ -216,7 +216,7 @@ EXPORT_SYMBOL(wait_for_completion_io_timeout);
  *
  * Return: -ERESTARTSYS if interrupted, 0 if completed.
  */
-int __sched wait_for_completion_interruptible(struct completion *x)
+int __sched __wait_for_completion_interruptible(struct completion *x)
 {
 	long t = wait_for_common(x, MAX_SCHEDULE_TIMEOUT, TASK_INTERRUPTIBLE);
 
@@ -224,10 +224,10 @@ int __sched wait_for_completion_interruptible(struct completion *x)
 		return t;
 	return 0;
 }
-EXPORT_SYMBOL(wait_for_completion_interruptible);
+EXPORT_SYMBOL(__wait_for_completion_interruptible);
 
 /**
- * wait_for_completion_interruptible_timeout: - waits for completion (w/(to,intr))
+ * __wait_for_completion_interruptible_timeout: - waits for completion (w/(to,intr))
  * @x:  holds the state of this particular completion
  * @timeout:  timeout value in jiffies
  *
@@ -238,15 +238,15 @@ EXPORT_SYMBOL(wait_for_completion_interruptible);
  * or number of jiffies left till timeout) if completed.
  */
 long __sched
-wait_for_completion_interruptible_timeout(struct completion *x,
+__wait_for_completion_interruptible_timeout(struct completion *x,
 					  unsigned long timeout)
 {
 	return wait_for_common(x, timeout, TASK_INTERRUPTIBLE);
 }
-EXPORT_SYMBOL(wait_for_completion_interruptible_timeout);
+EXPORT_SYMBOL(__wait_for_completion_interruptible_timeout);
 
 /**
- * wait_for_completion_killable: - waits for completion of a task (killable)
+ * __wait_for_completion_killable: - waits for completion of a task (killable)
  * @x:  holds the state of this particular completion
  *
  * This waits to be signaled for completion of a specific task. It can be
@@ -254,7 +254,7 @@ EXPORT_SYMBOL(wait_for_completion_interruptible_timeout);
  *
  * Return: -ERESTARTSYS if interrupted, 0 if completed.
  */
-int __sched wait_for_completion_killable(struct completion *x)
+int __sched __wait_for_completion_killable(struct completion *x)
 {
 	long t = wait_for_common(x, MAX_SCHEDULE_TIMEOUT, TASK_KILLABLE);
 
@@ -262,9 +262,9 @@ int __sched wait_for_completion_killable(struct completion *x)
 		return t;
 	return 0;
 }
-EXPORT_SYMBOL(wait_for_completion_killable);
+EXPORT_SYMBOL(__wait_for_completion_killable);
 
-int __sched wait_for_completion_state(struct completion *x, unsigned int state)
+int __sched __wait_for_completion_state(struct completion *x, unsigned int state)
 {
 	long t = wait_for_common(x, MAX_SCHEDULE_TIMEOUT, state);
 
@@ -272,10 +272,10 @@ int __sched wait_for_completion_state(struct completion *x, unsigned int state)
 		return t;
 	return 0;
 }
-EXPORT_SYMBOL(wait_for_completion_state);
+EXPORT_SYMBOL(__wait_for_completion_state);
 
 /**
- * wait_for_completion_killable_timeout: - waits for completion of a task (w/(to,killable))
+ * __wait_for_completion_killable_timeout: - waits for completion of a task (w/(to,killable))
  * @x:  holds the state of this particular completion
  * @timeout:  timeout value in jiffies
  *
@@ -287,12 +287,12 @@ EXPORT_SYMBOL(wait_for_completion_state);
  * or number of jiffies left till timeout) if completed.
  */
 long __sched
-wait_for_completion_killable_timeout(struct completion *x,
+__wait_for_completion_killable_timeout(struct completion *x,
 				     unsigned long timeout)
 {
 	return wait_for_common(x, timeout, TASK_KILLABLE);
 }
-EXPORT_SYMBOL(wait_for_completion_killable_timeout);
+EXPORT_SYMBOL(__wait_for_completion_killable_timeout);
 
 /**
  *	try_wait_for_completion - try to decrement a completion without blocking
@@ -334,7 +334,7 @@ EXPORT_SYMBOL(try_wait_for_completion);
  *	completion_done - Test to see if a completion has any waiters
  *	@x:	completion structure
  *
- *	Return: 0 if there are waiters (wait_for_completion() in progress)
+ *	Return: 0 if there are waiters (__wait_for_completion() in progress)
  *		 1 if there are no waiters.
  *
  *	Note, this will always return true if complete_all() was called on @X.
diff --git a/rust/helpers/completion.c b/rust/helpers/completion.c
index 0126767cc3be..5ea2eef74abc 100644
--- a/rust/helpers/completion.c
+++ b/rust/helpers/completion.c
@@ -6,3 +6,8 @@ __rust_helper void rust_helper_init_completion(struct completion *x)
 {
 	init_completion(x);
 }
+
+void rust_helper_wait_for_completion(struct completion *x)
+{
+	wait_for_completion(x);
+}
-- 
2.17.1


