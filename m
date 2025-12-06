Return-Path: <linux-media+bounces-48344-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B87DDCA9E16
	for <lists+linux-media@lfdr.de>; Sat, 06 Dec 2025 03:10:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C1D03014710
	for <lists+linux-media@lfdr.de>; Sat,  6 Dec 2025 02:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF2A224891;
	Sat,  6 Dec 2025 02:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PsspoPwG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EB5212557
	for <linux-media@vger.kernel.org>; Sat,  6 Dec 2025 02:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764987015; cv=none; b=oBBeHtNLNwfrGx8B2ny9hEfX2UKeogTJHzgYn/YbdyKQe0qH8U11li/4FJD5kfVT86LgAc//b78mJWYtmzNWHom9h0jfI+/Urpi9bl9aT0HsCW1tj18hXXsB7njCYc1+EOYesFwMus1PwUyAdIIRcr0acLo9x1lslnw/Cts5oa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764987015; c=relaxed/simple;
	bh=Iy/dC9DMvwJJmRWZMLpi4XZSdwVA9s5IWC+8sP211f4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qxw2axrhj8flbq+qUEisQqgDmy0C/0+2XTJ+EN0od2LeKE0RH0RDIEnVAMhuC1cfxwH4SBNMRJB5c5D3tGd1UB2mFnizxpsa8JYhWryZfTiqu7A5EvytVc3Wqyix2QJmbQxAcG0lt/3iJjNV+ORlAPPsva7JaqPCMon+6B2cBXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PsspoPwG; arc=none smtp.client-ip=209.85.160.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f193.google.com with SMTP id d75a77b69052e-4ed82ee9e57so31611671cf.0
        for <linux-media@vger.kernel.org>; Fri, 05 Dec 2025 18:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764987012; x=1765591812; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ikbW0KTFV2Hrw3Ofr3+X6/ogNZDuDLj9J6B0i4MyxZI=;
        b=PsspoPwGLM5sZkGTQw4nEc65Os9yZdK1MGU+0v1M5kTAruI6nrHk18vu+tDj+yQUT7
         MQ0U5hXy5Esh8tTG3YBNlBKJ6qP9AO31Ie5OywiYGl/tAS+Gv07v0ev+xPfXy0tIE+ub
         Odwr+A9a4FoNJWXfbsFcdkZ5eTC7bGPBmTsxuMFuuFxirpYwdjJBhuc3KgSEgbarEsH4
         MonCbYEkC0WR8OVsCopLP+sZccIrzmgiAw7UsQp0J1n4syu9+e6aA92mOKRHtCIM4xmC
         N+dQq2s6SSlmSbcf3LL4zlNWbRIQcdl33kZUdjrLH+0BY1AWHUhz7uE3xplE5DvXdlKp
         Zb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764987012; x=1765591812;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ikbW0KTFV2Hrw3Ofr3+X6/ogNZDuDLj9J6B0i4MyxZI=;
        b=mcyNC9jE+dmRFBBpSdpZz/t6U5gEptGrokN9kAcOx+6Fw88GHg3a2dDIfndtMT8eeg
         xt8DtCKYej14vVUyzSkkhTAnTRx0LAsIhJ0CstZVlK0AzexBK+JH7iomUdITCLjIun0E
         kZSazM5D2PlCd6eLx4BHZSgUudNBkPfLsKWi3ZmCiKVrmO7LksppruE4EBUjoRmvOUan
         R1aYUFUO4l+0ddVwRW4ThHY/9eb/03zjSZV1XGnwz0iypw2lAYE5UtprdZhj/A/ejbP+
         5xu4zkNB5YmyFNR9cpzthCBjPoqDu+jlCJHXxpJMf3yd5cgvKZqHuMFpZ6obDIIiLBlI
         J9SQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKs3ouBq3TBgJ82nYh2hzcjgYqWo5xLYA9cklinuVcylt2ipDeLfytuEEEfZPTm7lwQDHWB9f/aE7OAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5E8GQxkfgu/PdsSQIoDmgxdmr7XzExOD00SZ+U8hf83UYgCvu
	o41eG/E35eSp7bQuQNhcGJ6bm/0aCpLvaMtF+0brAr/r1OlmdQZ4FFSM
X-Gm-Gg: ASbGncvdgL9IjgTaJdHCKRe7yshuD0lXN3B+Al+pbbbNbApI+DZ0Fzv5zHYwx4R3bkM
	67src6hWjyRm1yydl6CDTHTHaBbJw5CNUN+4fnzYcBt9t8GQeVftKDhM72FIoTQBp1h/ChFU2k6
	YzsJTZGYjqw0Rm81Es6WmQwu/97RaRuZFFGe7K4+D6Y8SaNUmTX7O45pyZY72vuzJHjnhauh3qD
	lk0r6F006fEDwGrESXjKb+tfY8sMtjxejdtU17ikD2besjOqjzjBig9YnjXYV7zBL3B2TwLSiLN
	vxNeu6fUx4lL//JvjDEMbwhtzSMVeB0CYNgPCUV6Rq8FDc/dZSJCn8p29TYvk6qbVBfca5+gElk
	2XYsPZEMnA94vaechvwID+kBL3sdzwIGv0KTBs6bA9uano2JtMkXd5cV2sEBhm8CwFb2MSAW7Be
	LimN9amoz8laY=
X-Google-Smtp-Source: AGHT+IGd3Tx8h9j/d0f8+PnHkykV+pzsZzFX2hwgHqZ6hwE3sdFyB+hNtRyQiVIKUkdCjbb/9/d8ZQ==
X-Received: by 2002:a17:902:d4ce:b0:295:557e:746a with SMTP id d9443c01a7336-29df556fa3cmr5536155ad.13.1764980727315;
        Fri, 05 Dec 2025 16:25:27 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae49cbdfsm59025545ad.1.2025.12.05.16.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 16:25:26 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id C8B35421860F; Sat, 06 Dec 2025 07:25:22 +0700 (WIB)
Date: Sat, 6 Dec 2025 07:25:22 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Byungchul Park <byungchul@sk.com>, linux-kernel@vger.kernel.org
Cc: kernel_team@skhynix.com, torvalds@linux-foundation.org,
	damien.lemoal@opensource.wdc.com, linux-ide@vger.kernel.org,
	adilger.kernel@dilger.ca, linux-ext4@vger.kernel.org,
	mingo@redhat.com, peterz@infradead.org, will@kernel.org,
	tglx@linutronix.de, rostedt@goodmis.org, joel@joelfernandes.org,
	sashal@kernel.org, daniel.vetter@ffwll.ch, duyuyang@gmail.com,
	johannes.berg@intel.com, tj@kernel.org, tytso@mit.edu,
	willy@infradead.org, david@fromorbit.com, amir73il@gmail.com,
	gregkh@linuxfoundation.org, kernel-team@lge.com, linux-mm@kvack.org,
	akpm@linux-foundation.org, mhocko@kernel.org, minchan@kernel.org,
	hannes@cmpxchg.org, vdavydov.dev@gmail.com, sj@kernel.org,
	jglisse@redhat.com, dennis@kernel.org, cl@linux.com,
	penberg@kernel.org, rientjes@google.com, vbabka@suse.cz,
	ngupta@vflare.org, linux-block@vger.kernel.org,
	josef@toxicpanda.com, linux-fsdevel@vger.kernel.org, jack@suse.cz,
	jlayton@kernel.org, dan.j.williams@intel.com, hch@infradead.org,
	djwong@kernel.org, dri-devel@lists.freedesktop.org,
	rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
	hamohammed.sa@gmail.com, harry.yoo@oracle.com,
	chris.p.wilson@intel.com, gwan-gyeong.mun@intel.com,
	max.byungchul.park@gmail.com, boqun.feng@gmail.com,
	longman@redhat.com, yunseong.kim@ericsson.com, ysk@kzalloc.com,
	yeoreum.yun@arm.com, netdev@vger.kernel.org,
	matthew.brost@intel.com, her0gyugyu@gmail.com, corbet@lwn.net,
	catalin.marinas@arm.com, bp@alien8.de, x86@kernel.org,
	hpa@zytor.com, luto@kernel.org, sumit.semwal@linaro.org,
	gustavo@padovan.org, christian.koenig@amd.com,
	andi.shyti@kernel.org, arnd@arndb.de, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, rppt@kernel.org, surenb@google.com,
	mcgrof@kernel.org, petr.pavlu@suse.com, da.gomez@kernel.org,
	samitolvanen@google.com, paulmck@kernel.org, frederic@kernel.org,
	neeraj.upadhyay@kernel.org, joelagnelf@nvidia.com,
	josh@joshtriplett.org, urezki@gmail.com,
	mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com,
	qiang.zhang@linux.dev, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
	chuck.lever@oracle.com, neil@brown.name, okorniev@redhat.com,
	Dai.Ngo@oracle.com, tom@talpey.com, trondmy@kernel.org,
	anna@kernel.org, kees@kernel.org, bigeasy@linutronix.de,
	clrkwllms@kernel.org, mark.rutland@arm.com, ada.coupriediaz@arm.com,
	kristina.martsenko@arm.com, wangkefeng.wang@huawei.com,
	broonie@kernel.org, kevin.brodsky@arm.com, dwmw@amazon.co.uk,
	shakeel.butt@linux.dev, ast@kernel.org, ziy@nvidia.com,
	yuzhao@google.com, baolin.wang@linux.alibaba.com,
	usamaarif642@gmail.com, joel.granados@kernel.org,
	richard.weiyang@gmail.com, geert+renesas@glider.be,
	tim.c.chen@linux.intel.com, linux@treblig.org,
	alexander.shishkin@linux.intel.com, lillian@star-ark.net,
	chenhuacai@kernel.org, francesco@valla.it,
	guoweikang.kernel@gmail.com, link@vivo.com, jpoimboe@kernel.org,
	masahiroy@kernel.org, brauner@kernel.org,
	thomas.weissschuh@linutronix.de, oleg@redhat.com, mjguzik@gmail.com,
	andrii@kernel.org, wangfushuai@baidu.com, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-modules@vger.kernel.org,
	rcu@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, 2407018371@qq.com, dakr@kernel.org,
	miguel.ojeda.sandonis@gmail.com, neilb@ownmail.net,
	wsa+renesas@sang-engineering.com, dave.hansen@intel.com,
	geert@linux-m68k.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v18 25/42] dept: add documents for dept
Message-ID: <aTN38kJjBftxnjm9@archie.me>
References: <20251205071855.72743-1-byungchul@sk.com>
 <20251205071855.72743-26-byungchul@sk.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tsFx90K4YzyOMDd5"
Content-Disposition: inline
In-Reply-To: <20251205071855.72743-26-byungchul@sk.com>


--tsFx90K4YzyOMDd5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 05, 2025 at 04:18:38PM +0900, Byungchul Park wrote:
> Add documents describing the concept and APIs of dept.
>=20
> Signed-off-by: Byungchul Park <byungchul@sk.com>
> ---
>  Documentation/dev-tools/dept.rst     | 778 +++++++++++++++++++++++++++
>  Documentation/dev-tools/dept_api.rst | 125 +++++

You forget to add toctree entries:

---- >8 ----
diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/in=
dex.rst
index 4b8425e348abd1..02c858f5ed1fa2 100644
--- a/Documentation/dev-tools/index.rst
+++ b/Documentation/dev-tools/index.rst
@@ -22,6 +22,8 @@ Documentation/process/debugging/index.rst
    clang-format
    coccinelle
    sparse
+   dept
+   dept_api
    kcov
    gcov
    kasan

> +Lockdep detects a deadlock by checking lock acquisition order.  For
> +example, a graph to track acquisition order built by lockdep might look
> +like:
> +
> +.. literal::
> +
> +   A -> B -
> +           \
> +            -> E
> +           /
> +   C -> D -
> +
> +   where 'A -> B' means that acquisition A is prior to acquisition B
> +   with A still held.

Use code-block directive for literal code blocks:

---- >8 ----
diff --git a/Documentation/dev-tools/dept.rst b/Documentation/dev-tools/dep=
t.rst
index 333166464543d7..8394c4ea81bc2a 100644
--- a/Documentation/dev-tools/dept.rst
+++ b/Documentation/dev-tools/dept.rst
@@ -10,7 +10,7 @@ Lockdep detects a deadlock by checking lock acquisition o=
rder.  For
 example, a graph to track acquisition order built by lockdep might look
 like:
=20
-.. literal::
+.. code-block::
=20
    A -> B -
            \
@@ -25,7 +25,7 @@ Lockdep keeps adding each new acquisition order into the =
graph at
 runtime.  For example, 'E -> C' will be added when the two locks have
 been acquired in the order, E and then C.  The graph will look like:
=20
-.. literal::
+.. code-block::
=20
        A -> B -
                \
@@ -41,7 +41,7 @@ been acquired in the order, E and then C.  The graph will=
 look like:
=20
 This graph contains a subgraph that demonstrates a loop like:
=20
-.. literal::
+.. code-block::
=20
                 -> E -
                /      \
@@ -76,7 +76,7 @@ e.g. irq context, normal process context, wq worker conte=
xt, or so on.
=20
 Can lockdep detect the following deadlock?
=20
-.. literal::
+.. code-block::
=20
    context X	   context Y	   context Z
=20
@@ -91,7 +91,7 @@ Can lockdep detect the following deadlock?
=20
 No.  What about the following?
=20
-.. literal::
+.. code-block::
=20
    context X		   context Y
=20
@@ -116,7 +116,7 @@ What leads a deadlock
 A deadlock occurs when one or multi contexts are waiting for events that
 will never happen.  For example:
=20
-.. literal::
+.. code-block::
=20
    context X	   context Y	   context Z
=20
@@ -148,7 +148,7 @@ In terms of dependency:
=20
 Dependency graph reflecting this example will look like:
=20
-.. literal::
+.. code-block::
=20
     -> C -> A -> B -
    /                \
@@ -171,7 +171,7 @@ Introduce DEPT
 DEPT(DEPendency Tracker) tracks wait and event instead of lock
 acquisition order so as to recognize the following situation:
=20
-.. literal::
+.. code-block::
=20
    context X	   context Y	   context Z
=20
@@ -186,7 +186,7 @@ acquisition order so as to recognize the following situ=
ation:
 and builds up a dependency graph at runtime that is similar to lockdep.
 The graph might look like:
=20
-.. literal::
+.. code-block::
=20
     -> C -> A -> B -
    /                \
@@ -199,7 +199,7 @@ DEPT keeps adding each new dependency into the graph at=
 runtime.  For
 example, 'B -> D' will be added when event D occurrence is a
 prerequisite to reaching event B like:
=20
-.. literal::
+.. code-block::
=20
    context W
=20
@@ -211,7 +211,7 @@ prerequisite to reaching event B like:
=20
 After the addition, the graph will look like:
=20
-.. literal::
+.. code-block::
=20
                      -> D
                     /
@@ -236,7 +236,7 @@ How DEPT works
 Let's take a look how DEPT works with the 1st example in the section
 'Limitation of lockdep'.
=20
-.. literal::
+.. code-block::
=20
    context X	   context Y	   context Z
=20
@@ -256,7 +256,7 @@ event.
=20
 Adding comments to describe DEPT's view in detail:
=20
-.. literal::
+.. code-block::
=20
    context X	   context Y	   context Z
=20
@@ -293,7 +293,7 @@ Adding comments to describe DEPT's view in detail:
=20
 Let's build up dependency graph with this example.  Firstly, context X:
=20
-.. literal::
+.. code-block::
=20
    context X
=20
@@ -304,7 +304,7 @@ Let's build up dependency graph with this example.  Fir=
stly, context X:
=20
 There are no events to create dependency.  Next, context Y:
=20
-.. literal::
+.. code-block::
=20
    context Y
=20
@@ -332,7 +332,7 @@ event A cannot be triggered if wait B cannot be awakene=
d by event B.
 Therefore, we can say event A depends on event B, say, 'A -> B'.  The
 graph will look like after adding the dependency:
=20
-.. literal::
+.. code-block::
=20
    A -> B
=20
@@ -340,7 +340,7 @@ graph will look like after adding the dependency:
=20
 Lastly, context Z:
=20
-.. literal::
+.. code-block::
=20
    context Z
=20
@@ -362,7 +362,7 @@ triggered if wait A cannot be awakened by event A.  The=
refore, we can
 say event B depends on event A, say, 'B -> A'.  The graph will look like
 after adding the dependency:
=20
-.. literal::
+.. code-block::
=20
     -> A -> B -
    /           \
@@ -386,7 +386,7 @@ Interpret DEPT report
=20
 The following is the same example in the section 'How DEPT works'.
=20
-.. literal::
+.. code-block::
=20
    context X	   context Y	   context Z
=20
@@ -425,7 +425,7 @@ We can simplify this by labeling each waiting point wit=
h [W], each
 point where its event's context starts with [S] and each event with [E].
 This example will look like after the labeling:
=20
-.. literal::
+.. code-block::
=20
    context X	   context Y	   context Z
=20
@@ -443,7 +443,7 @@ DEPT uses the symbols [W], [S] and [E] in its report as=
 described above.
 The following is an example reported by DEPT for a real problem in
 practice.
=20
-.. literal::
+.. code-block::
=20
    Link: https://lore.kernel.org/lkml/6383cde5-cf4b-facf-6e07-1378a485657d=
@I-love.SAKURA.ne.jp/#t
    Link: https://lore.kernel.org/lkml/1674268856-31807-1-git-send-email-by=
ungchul.park@lge.com/
@@ -646,7 +646,7 @@ practice.
=20
 Let's take a look at the summary that is the most important part.
=20
-.. literal::
+.. code-block::
=20
    ---------------------------------------------------
    summary
@@ -669,7 +669,7 @@ Let's take a look at the summary that is the most impor=
tant part.
=20
 The summary shows the following scenario:
=20
-.. literal::
+.. code-block::
=20
    context A	   context B	   context ?(unknown)
=20
@@ -684,7 +684,7 @@ The summary shows the following scenario:
=20
 Adding comments to describe DEPT's view in detail:
=20
-.. literal::
+.. code-block::
=20
    context A	   context B	   context ?(unknown)
=20
@@ -711,7 +711,7 @@ Adding comments to describe DEPT's view in detail:
=20
 Let's build up dependency graph with this report. Firstly, context A:
=20
-.. literal::
+.. code-block::
=20
    context A
=20
@@ -735,7 +735,7 @@ unlock(&ni->ni_lock:0) depends on folio_unlock(&f1), sa=
y,
=20
 The graph will look like after adding the dependency:
=20
-.. literal::
+.. code-block::
=20
    unlock(&ni->ni_lock:0) -> folio_unlock(&f1)
=20
@@ -743,7 +743,7 @@ The graph will look like after adding the dependency:
=20
 Secondly, context B:
=20
-.. literal::
+.. code-block::
=20
    context B
=20
@@ -762,7 +762,7 @@ folio_unlock(&f1) depends on unlock(&ni->ni_lock:0), sa=
y,
=20
 The graph will look like after adding the dependency:
=20
-.. literal::
+.. code-block::
=20
     -> unlock(&ni->ni_lock:0) -> folio_unlock(&f1) -
    /                                                \

> +Limitation of lockdep
> +---------------------
> +
> +Lockdep deals with a deadlock by typical lock e.g. spinlock and mutex,
> +that are supposed to be released within the acquisition context.
> +However, when it comes to a deadlock by folio lock that is not supposed
> +to be released within the acquisition context or other general
> +synchronization mechanisms, lockdep doesn't work.
> +
> +NOTE:  In this document, 'context' refers to any type of unique context
> +e.g. irq context, normal process context, wq worker context, or so on.
> +
> +Can lockdep detect the following deadlock?
> +
> +.. literal::
> +
> +   context X	   context Y	   context Z
> +
> +		   mutex_lock A
> +   folio_lock B
> +		   folio_lock B <- DEADLOCK
> +				   mutex_lock A <- DEADLOCK
> +				   folio_unlock B
> +		   folio_unlock B
> +		   mutex_unlock A
> +				   mutex_unlock A
> +
> +No.  What about the following?
> +
> +.. literal::
> +
> +   context X		   context Y
> +
> +			   mutex_lock A
> +   mutex_lock A <- DEADLOCK
> +			   wait_for_complete B <- DEADLOCK
> +   complete B
> +			   mutex_unlock A
> +   mutex_unlock A
> +
> +No.

One unanswered question from my v17 review [1]: You explain in "How DEPT wo=
rks"
section how DEPT detects deadlock in the first example (the former with thr=
ee
contexts). Can you do the same on the second example (the latter with two
contexts)?

Thanks.

[1]: https://lore.kernel.org/linux-doc/aN84jKyrE1BumpLj@archie.me/

--=20
An old man doll... just what I always wanted! - Clara

--tsFx90K4YzyOMDd5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaTN37QAKCRD2uYlJVVFO
o40gAP9yWQe507aOQ9xG+y3WznUbz9K0gxVdcJgmBzyPkuLdOAD/SjStuxrT6yQi
Wd1X9MlzPBf7sPwdNC1xXihj1C/n6go=
=b9ga
-----END PGP SIGNATURE-----

--tsFx90K4YzyOMDd5--

