Return-Path: <linux-media+bounces-66680-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xc6yEupOS2pBPAEAu9opvQ
	(envelope-from <linux-media+bounces-66680-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 08:44:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F2D70D1C1
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 08:44:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=sk.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66680-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66680-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 16BA4304367B
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 06:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E3AE3FB043;
	Mon,  6 Jul 2026 06:21:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66113C3786;
	Mon,  6 Jul 2026 06:20:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783318879; cv=none; b=B8PkLJ0k9MEUeS4KZXUJ0guKUfliCbZtMC20ZpMP/qmTv1BQEnj0xTeckGWfRngoj+DWbXGgSt8zXYI1oIpY8T239I5ULEggFy4myCiBlaJI8CWCFUNCGsAIZ/vMSUD3267jcx5Pdk5bGuhRB2vqIEdDWlSplOLMipUIZ779Oc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783318879; c=relaxed/simple;
	bh=USof1/oiICp6mrFMlXObfo51TjySfTnFgIgWh9aYqa4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Jk3TeqftEkEvbvI0bALuEMK9uvhq+KL0OGourESBD8+RbHWzErTU81N/x5L1HCm4znYMw+y+UbpdMLAw17q8PFE7v0Dm34swttpKH+Vgn8LNKKNJDFB0wKJQHWA7Uyyc2HAp3AAzZ3X1WWstnmzY/jvUNGx9EarqKk8wwdeMbG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
X-AuditID: a67dfc5b-c2dff70000001609-1d-6a4b4903c124
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
Subject: [PATCH v19 24/40] locking/lockdep: prevent various lockdep assertions when lockdep_off()'ed
Date: Mon,  6 Jul 2026 15:19:12 +0900
Message-Id: <20260706061928.66713-25-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260706061928.66713-1-byungchul@sk.com>
References: <20260706061928.66713-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUxTZxiGfd/zntPT6tFjR+JRf6Cd8zN+QNx8NhfDtsQcZ0w2zWKiW6Sx
	Z9JawLWKdvGDVkF0gNAFlpQxKJY6aZFaJLIpCaCiIkaq46NoIW5Y3Uo1Mj2LWD9anP+u3PeV
	O8+Ph6XUA/QMVp+1UzJlaY0aRkVU0UnOxWTNWsOy308T6LW2Evi5wcvAlT4bgaGnBQj+e15B
	QZkVwauWDgTlATsF3jNWDI5whQKiQ+doeBW6j6FPHkHgHn6JoaqmkQHn3RAFZzoGEdwangwP
	fQxU21poCHRFEFRW2ONDlX4CgUgMw51yOwaPfx2U1Z/D8Mxdp4Cu43cIxO6mQOhYGYFT0Rs0
	XB3spcFbGKbA/1ecWgYWgTPfRaCj+U8Mhb4mGm56uglcdZwkUNsXwNB4vYsCuXgmdJcW0dBf
	cg9BRHZTEPxpRAHhnnwMvkMOBdjDowoYdckE8v99SUO+6zSGiw1nMYyFmmnotVcxMHbiEgJP
	gECFtRhBwUWZAt/jEwxUPkmB+he9KC1NzLv5ghG9v3iR+KT2ICXmlcTpwsgjSqy9NsKIY097
	GLFFriZiZ40guo6MYbH0+mLxN0dIIVb7d4nHz/+NRX/dEUY8Gv0DfzFrk+pjnWTU50impavS
	VRmeWJDeEZy6R64ZwLnIPeUoUrICv1xoKg3Sb7ngko1JMMPPE/r7n1EJTuJnCY1F4bijYin+
	VrJQ6C4iieIdXid0BOvHJcK/Jzx3deIEc/wHwm1bVPFmNFnw+FrHHWU8PxWrHHfU/PvC7UeX
	SWJU4KuUQnfng/+vmC60/dpPShBXjSbUIbU+KydTqzcuX5JhydLvWbI1O9OP4h/n3hfb3IxG
	uze0I55FmkkcpH1uUNPaHLMlsx0JLKVJ4ubOX2tQczqt5XvJlL3FtMsomdvRTJZopnGp8m6d
	mt+m3Sltl6Qdkulti1nljFxU3KqbF+FJaqTN3LB+8vRt75ZGbZtXl+Nvhg4a5hzC+/oWwEcX
	WMOcgSRu0fC3yTeM3x1WrrGv2Js7PxOWfjjxn+zzlvTsuvW85+sDVPLGtt2FKz9pXTf7s7mp
	Tc6vPr3yQ22eNZ3pcXr51fvdQ4OxjQ6OnzD7x71pli+5Yw5ZsSyiIeYMbcpCymTWvgZ7T6Ze
	bQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSWUwTcRDG/f93u12q1bWCrvoAaeIRE6gmaibxwhjDCtHok9eDNrKRcqcV
	EBW1xWpVUGzSEqkoVGm0oCDFA0ljUwIiXtSqgFCRpBa5xChHoEUsGF8m38z3my/zMDQheSpY
	QitSj/HKVHmylBKRol0bciPRjrjE1bqeMNBpz0Bnl1cAn9QOEkaGdSTcqKygYNL0RAi66usC
	aGrVkNDyoBxB14gOwZjfRIC2doqESX2jEIbHO4RgUCOYsjciMLr0BLS1PCegokaN4XfVHwr6
	638hMHR7KSjsVZMwZMlDUOQzCaG3IQYGu+oEMOXpwdA6OoDA4v2Dweu4gGDSmAS3zLbguvEn
	Bf437wgoNLQgKO32EPCr9yuCmsYvCOx3NRR8K3hEgNs7Fz6MDFHw0nCZgkHXDQw/qigo0dgF
	4Hrdj6DYpEfg+2zHkHu7kgJjcTUJtV+fCcHVH8DQadRjKK/eCV0WHwmvCsw4eG6QergITIW5
	OFi+YzDcr8MwbrEKo8sQN6a9QnJW22PMad9PUlzFzQrE+Sf0iBsuyyU4bUGwrR8YIrhztiyu
	7NUAxU2MfKQ4+2gJyTWbWe7OxQnMXXsTydUWeYS7tx4QbYznkxWZvFK2+bAooTzQLkhvn398
	1PwZn0WWeZdQCM0ya1ldg4aa1hSzgm1rGyemdSgTwdryfYJLSEQTjDuczbPkk9PGAiaebWy/
	PwORzDLWf6cZT2sxs57t0AwK/4WGs+VVjhkmJDh/ECieYSTMOrZj6AVZgEQlaJYVhSpSM1Pk
	iuR1UaqkhOxUxfGoI2kp1Sj4T5acwLWnaNgd40QMjaRzxBAdmygRyDNV2SlOxNKENFS8fGVc
	okQcL88+wSvTDikzknmVEy2lSekicexe/rCEOSo/xifxfDqv/O9iOmTJWZR/MnDryLy+0zhs
	ftJYSd76TVZ8hc36Ltvc0Fm6Xfuxx20mbFnnn2yL89S6dy683uw692xLd2xlmG9FpPOUsWjr
	qNP6yL+nN73uXloP3fdT2SSbnXOw+NPiWQRTE1DLbE2uiGUx+xXRUB8+eDqq9KrN0WSPWDzm
	cQT2ybQZbwkpqUqQr1lFKFXyv5jOPbtLAwAA
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
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
	TAGGED_FROM(0.00)[bounces-66680-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sk.com:from_mime,sk.com:email,sk.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D4F2D70D1C1

lockdep provides APIs for assertion only if lockdep is enabled at the
moment asserting to avoid unnecessary confusion, using the following
condition, debug_locks && !this_cpu_read(lockdep_recursion).

However, lockdep_{off,on}() are also used for disabling and enabling
lockdep for a simular purpose.  Add !lockdep_recursing(current) that is
updated by lockdep_{off,on}() to the condition so that the assertions
are aware of !__lockdep_enabled if lockdep_off()'ed.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/linux/lockdep.h  |  3 ++-
 kernel/locking/lockdep.c | 10 ++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index 60b17a2ff555..5113b7053b62 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -303,6 +303,7 @@ extern void lock_unpin_lock(struct lockdep_map *lock, struct pin_cookie);
 	lockdep_assert_once(!current->lockdep_depth)
 
 #define lockdep_recursing(tsk)	((tsk)->lockdep_recursion)
+extern bool lockdep_recursing_current(void);
 
 #define lockdep_pin_lock(l)	lock_pin_lock(&(l)->dep_map)
 #define lockdep_repin_lock(l,c)	lock_repin_lock(&(l)->dep_map, (c))
@@ -630,7 +631,7 @@ DECLARE_PER_CPU(int, hardirqs_enabled);
 DECLARE_PER_CPU(int, hardirq_context);
 DECLARE_PER_CPU(unsigned int, lockdep_recursion);
 
-#define __lockdep_enabled	(debug_locks && !this_cpu_read(lockdep_recursion))
+#define __lockdep_enabled	(debug_locks && !this_cpu_read(lockdep_recursion) && !lockdep_recursing_current())
 
 #define lockdep_assert_irqs_enabled()					\
 do {									\
diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index dc97f2753ef8..39b9e3e27c0b 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -6900,3 +6900,13 @@ void lockdep_rcu_suspicious(const char *file, const int line, const char *s)
 	warn_rcu_exit(rcu);
 }
 EXPORT_SYMBOL_GPL(lockdep_rcu_suspicious);
+
+/*
+ * For avoiding header dependency when using (struct task_struct *)current
+ * and lockdep_recursing() at the same time.
+ */
+noinstr bool lockdep_recursing_current(void)
+{
+	return lockdep_recursing(current);
+}
+EXPORT_SYMBOL_GPL(lockdep_recursing_current);
-- 
2.17.1


