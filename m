Return-Path: <linux-media+bounces-60514-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDFFAvji+mmGTgMAu9opvQ
	(envelope-from <linux-media+bounces-60514-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 08:43:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB1C4D6B66
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 08:43:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACDE63028369
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 06:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C896730F548;
	Wed,  6 May 2026 06:42:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E4730E0FB;
	Wed,  6 May 2026 06:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778049754; cv=none; b=EEwufuM5FGu5KWQRtPFCUNr+cBu0mmnYCA3V5aK9Gh3lpkFdZaFB2iMqbBqKuD9pInJbUZAfodcbdoVj51Z8Vr7p/v7TPxEn3u2wazXkIyNc/OC3VF+sZe3zE18q31eaIKS8OSpnb159tBbrQcG9mFhtHPKwVs/8krSYxSaN0mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778049754; c=relaxed/simple;
	bh=uMKmOeTL3/2pgROWMA/zP/bnLSfPy+1VZq9bHUTyPfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nqeaLZhzRXLSDEcJqQqjEmhbL1u2ISYEBUv4iTSvEtbIn6wYbSYy5KQc+YJhGr5gxdKx//L2kdK5X92o32TVVbND94AaLjdiuoUbNnfNePo9yckUVZlrGoAB9wsyGqktSD4pbgZe52K5cxtgA/s56hA23EIaXT/sNO/5ni4a5hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-c2dff70000001609-97-69fadf471230
Date: Wed, 6 May 2026 15:27:14 +0900
From: Byungchul Park <byungchul@sk.com>
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: bagasdotme@gmail.com, 2407018371@qq.com, Dai.Ngo@oracle.com,
	Liam.Howlett@oracle.com, a.hindborg@kernel.org,
	ada.coupriediaz@arm.com, adilger.kernel@dilger.ca,
	akpm@linux-foundation.org, alex.gaynor@gmail.com,
	alexander.shishkin@linux.intel.com, aliceryhl@google.com,
	amir73il@gmail.com, andi.shyti@kernel.org, andrii@kernel.org,
	anna@kernel.org, arnd@arndb.de, ast@kernel.org,
	baolin.wang@linux.alibaba.com, bigeasy@linutronix.de,
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, bp@alien8.de,
	brauner@kernel.org, broonie@kernel.org, bsegall@google.com,
	catalin.marinas@arm.com, chenhuacai@kernel.org,
	chris.p.wilson@intel.com, christian.koenig@amd.com,
	chuck.lever@oracle.com, cl@linux.com, clrkwllms@kernel.org,
	corbet@lwn.net, da.gomez@kernel.org, dakr@kernel.org,
	damien.lemoal@opensource.wdc.com, dan.j.williams@intel.com,
	daniel.vetter@ffwll.ch, dave.hansen@intel.com, david@fromorbit.com,
	dennis@kernel.org, dietmar.eggemann@arm.com, djwong@kernel.org,
	dri-devel@lists.freedesktop.org, duyuyang@gmail.com,
	dwmw@amazon.co.uk, francesco@valla.it, frederic@kernel.org,
	gary@garyguo.net, geert+renesas@glider.be, geert@linux-m68k.org,
	gregkh@linuxfoundation.org, guoweikang.kernel@gmail.com,
	gustavo@padovan.org, gwan-gyeong.mun@intel.com,
	hamohammed.sa@gmail.com, hannes@cmpxchg.org, harry.yoo@oracle.com,
	hch@infradead.org, her0gyugyu@gmail.com, hpa@zytor.com,
	jack@suse.cz, jglisse@redhat.com, jiangshanlai@gmail.com,
	jlayton@kernel.org, joel.granados@kernel.org,
	joel@joelfernandes.org, joelagnelf@nvidia.com,
	johannes.berg@intel.com, josef@toxicpanda.com,
	josh@joshtriplett.org, jpoimboe@kernel.org, juri.lelli@redhat.com,
	kees@kernel.org, kernel-team@lge.com, kernel_team@skhynix.com,
	kevin.brodsky@arm.com, kristina.martsenko@arm.com,
	lillian@star-ark.net, linaro-mm-sig@lists.linaro.org, link@vivo.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mm@kvack.org, linux-modules@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	linux@treblig.org, longman@redhat.com, lorenzo.stoakes@oracle.com,
	lossin@kernel.org, luto@kernel.org, mark.rutland@arm.com,
	masahiroy@kernel.org, mathieu.desnoyers@efficios.com,
	matthew.brost@intel.com, max.byungchul.park@gmail.com,
	mcgrof@kernel.org, melissa.srw@gmail.com, mgorman@suse.de,
	mhocko@kernel.org, miguel.ojeda.sandonis@gmail.com,
	minchan@kernel.org, mingo@redhat.com, mjguzik@gmail.com,
	neeraj.upadhyay@kernel.org, neil@brown.name, neilb@ownmail.net,
	netdev@vger.kernel.org, ngupta@vflare.org, ojeda@kernel.org,
	okorniev@redhat.com, oleg@redhat.com, paulmck@kernel.org,
	penberg@kernel.org, peterz@infradead.org, petr.pavlu@suse.com,
	qiang.zhang@linux.dev, rcu@vger.kernel.org,
	richard.weiyang@gmail.com, rientjes@google.com,
	rodrigosiqueiramelo@gmail.com, rostedt@goodmis.org, rppt@kernel.org,
	rust-for-linux@vger.kernel.org, samitolvanen@google.com,
	sashal@kernel.org, shakeel.butt@linux.dev, sj@kernel.org,
	sumit.semwal@linaro.org, surenb@google.com, tglx@linutronix.de,
	thomas.weissschuh@linutronix.de, tim.c.chen@linux.intel.com,
	tj@kernel.org, tmgross@umich.edu, tom@talpey.com,
	torvalds@linux-foundation.org, trondmy@kernel.org, tytso@mit.edu,
	urezki@gmail.com, usamaarif642@gmail.com, vbabka@suse.cz,
	vdavydov.dev@gmail.com, vincent.guittot@linaro.org,
	vschneid@redhat.com, wangfushuai@baidu.com,
	wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org,
	wsa+renesas@sang-engineering.com, x86@kernel.org,
	yeoreum.yun@arm.com, ysk@kzalloc.com, yunseong.kim@ericsson.com,
	yuzhao@google.com, ziy@nvidia.com
Subject: Re: [PATCH] dept: update documentation function names to match
 implementation
Message-ID: <20260506062714.GA48817@system.software.com>
References: <aTN38kJjBftxnjm9@archie.me>
 <20260428162614.786365-2-yunseong.kim@est.tech>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428162614.786365-2-yunseong.kim@est.tech>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxbZRTGfe9978ttXc21Ynbd4mLqPgxmuJmZHJfp9A/ddYZlif8oW6JV
	rlJWytJuDCTGoi1WHATrVqQfs9tK+SoBW5ksZIjsg9C1ccON3MWyumQrhVENrEBoGbOFLO6/
	X57znCfPSQ5LK51kDavRHRL1OrVWReRYnlh1arMQTWm2XHA+ARbzlzCbtGBwdvkIWPxNDERn
	LQjm0w4azGcfYDhejeBe9xKBiYu74MHYOAX3bQcgHf6DhpO3xmj45dJNBHcaemgYPv4dgcRV
	JwUuhxWBzeXHELFZKejwF0DUG8PQOEHA9vNqcDTGKQidjmDwGjeAI/wnA3djVgLRoRoGmk5E
	CBzt7mHA6JhnYKTjCoaucYmCYXsbhlt/SwwEwiEapIY7CH74J4bgRuNUDowMuCmIXa+hoO1c
	mMCMZw7DUN0ABd/E+whE6icxXLvRh6C5NcGA3zdKYNzuoiA11svAqPUnAqmWiwiCqWCm79XM
	2YsWAo7qegTd0y0Equ9FEZgir0Dn/VH0xpvCvLkeC+2BM5TgO+FDQrL5a1owN2To/NS/tGAK
	HBGaL08RITV7nQjn5txYCJ7ihe/Dm4Wz9rEcwe0/LJguJBgh0Jq3d32hfEeRqNWUi/qXXv9I
	XvxtNIQPdigqLp00MUbULK9FMpbntvGtSS95yIm4JyfLmFvP17qGmSwTbhMvSQt0lnO5F/hJ
	qXbZT3Od6/gfO4uz/BT3Pt9f009lWcEBn5zwLu8quUJeun2UrOhP8sNNt/HKbh4vLU1k/GyG
	1/ItS2xWlnE7eHewfbnC09zz/MCZoYxFnqkWlPGBOje90vMZ/vdWCTcgzv5IrP2RWPv/sW5E
	tyOlRldeqtZot+UXV+o0FfmflJX6UeZnvV8s7utFM1feG0Qci1SrFL3XFjRKRl1uqCwdRDxL
	q3IV6UhGUhSpKz8X9WUf6g9rRcMgWsti1WrFy3NHipTcZ+pD4gFRPCjqH04pVrbGiHyLr/4a
	Yh3THS8aKdNvX82bPI8XmqPvvuYcXbDKQqc/HjeXeOs0sa6dOy9/Or07923bup5jG0pdM/Gq
	kq2uSf+sp0JZ0PbWzXf0WlpX5S15tqAnaHgsf/u+7VSyCnnO/5U+NuCIGDem+71VZXvUUt+u
	+N7QSPn+/b4Pdt+d2fLciAobitVb82i9Qf0f1Eg6x68DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTYRTHe+69u7suVzezekgIWkoWaEUFB5KICLz0hlFQ+KFaemvDt9jM
	MojUtZoWYqvNdFm+LpmapfZiMTUjy8rUypxlTWNZS02xLXE27a6I+nL4nf85PzgfDkMGeEUL
	GWViMq9KlMfLaAkl2b5OExZp9yhX1tmXgk57EnrtDhG8SW+iwO3SUXC5upIGr+mOGHQ1eSJ4
	0p1BQcf1CgR2tw7B+KSJBG39NAVefYsYXBPvxGBIRzBtbUFg7NSTYOtoJKGyLp2A7zemaBh8
	OIbA0O+gIdeZTsGI+RyC/AGTGJyPImHYfl8E0+8/E9D9YwiB2TFFgKPpDAKvMQ6uFtcKunGU
	hsm2dhJyDR0IivrfkzDm7ENQ1/IBgbU8g4ZPObdIeOWYBa/dIzS0Gs7SMNx5mYBvN2gozLCK
	oPP5IIICkx7BwFsrAZqSahqMBTUU1PfdE0Pn4E8Ceo16AipqtoHdPEDBs5xiQjhX2Lq5AEy5
	GkIoXwgwVN0nYMJsEW8wI25cm01xltrbBKd96aW5yiuViJv06BHnKtOQnDZHaB8OjZDcqdqj
	XNmzIZrzuLtoruPjC5Kz/iikuKfFmCvN9BDc+bawqI3RkohYPl6ZwqtWrN8vUWTan1OHK6TH
	WopOidJQmSQL+TGYXYOHv5SKfUyxwTiroFXkY5pdim22CdLHgWwo/mrLon1MslWL8KUqhY/n
	sntww+kGwsdSFrDLaf7tBrDR2OY4R//J5+DWPAf1x12ObVNOYZ8ROAhfm2J8sR8bgQufWn6f
	MI9dgptuPyZykDT/Pzv/Pzv/n12ISAsKVCamJMiV8WvD1XGK1ETlsfCYpIQaJDyl+cTP83eR
	61VkM2IZJPOX3n09oQwQyVPUqQnNCDOkLFA62StE0lh56nFelbRPdSSeVzejIIaSLZBu3s3v
	D2APyZP5OJ4/zKv+TgnGb2Eayhxvv3BhRnj9TpwW4+8fdahsdP2d2YHHnWQfm73Y0di+PTYr
	Wm3VQUNTcs/el3PCzvp9HTvgsVxPWhbeUw/BbxNKZq4ObcuMqR69GNK1qaRUGtW4xQ7+2xT9
	MipkOmj04IwHEbs0RZFabx7eOrYjKLg89LR7X7Znpi2pp1w2NF9GqRXyVctJlVr+C58CT62Q
	AwAA
X-CFilter-Loop: Reflected
X-Rspamd-Queue-Id: 9AB1C4D6B66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-60514-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,qq.com,oracle.com,kernel.org,arm.com,dilger.ca,linux-foundation.org,linux.intel.com,google.com,arndb.de,linux.alibaba.com,linutronix.de,protonmail.com,alien8.de,intel.com,amd.com,linux.com,lwn.net,opensource.wdc.com,ffwll.ch,fromorbit.com,lists.freedesktop.org,amazon.co.uk,valla.it,garyguo.net,glider.be,linux-m68k.org,linuxfoundation.org,padovan.org,cmpxchg.org,infradead.org,zytor.com,suse.cz,redhat.com,joelfernandes.org,nvidia.com,toxicpanda.com,joshtriplett.org,lge.com,skhynix.com,star-ark.net,lists.linaro.org,vivo.com,vger.kernel.org,lists.infradead.org,kvack.org,lists.linux.dev,treblig.org,efficios.com,suse.de,brown.name,ownmail.net,vflare.org,suse.com,linux.dev,goodmis.org,linaro.org,umich.edu,talpey.com,mit.edu,baidu.com,huawei.com,sang-engineering.com,kzalloc.com,ericsson.com];
	DMARC_NA(0.00)[sk.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[byungchul@sk.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[166];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.972];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[system.software.com:mid,est.tech:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Tue, Apr 28, 2026 at 06:26:15PM +0200, Yunseong Kim wrote:
> Synchronize function names in the documentation with the actual
> implementation to fix naming inconsistencies.

Good catch!  Thanks Yunseong.  I will apply it on the top.

	Byungchul

> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> ---
>  Documentation/dev-tools/dept.rst     | 2 +-
>  Documentation/dev-tools/dept_api.rst | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/dev-tools/dept.rst b/Documentation/dev-tools/dept.rst
> index 333166464543..31b2fe629fab 100644
> --- a/Documentation/dev-tools/dept.rst
> +++ b/Documentation/dev-tools/dept.rst
> @@ -97,7 +97,7 @@ No.  What about the following?
> 
>                            mutex_lock A
>     mutex_lock A <- DEADLOCK
> -                          wait_for_complete B <- DEADLOCK
> +                          wait_for_completion B <- DEADLOCK
>     complete B
>                            mutex_unlock A
>     mutex_unlock A
> diff --git a/Documentation/dev-tools/dept_api.rst b/Documentation/dev-tools/dept_api.rst
> index 409116a62849..74e7b1424ad5 100644
> --- a/Documentation/dev-tools/dept_api.rst
> +++ b/Documentation/dev-tools/dept_api.rst
> @@ -113,7 +113,7 @@ Do not use these APIs directly.  The raw APIs of dept are:
>     dept_stage_wait(map, key, ip, wait_func, time);
>     dept_request_event_wait_commit();
>     dept_clean_stage();
> -   dept_stage_event(task, ip);
> +   dept_ttwu_stage_wait(task, ip);
>     dept_ecxt_enter(map, evt_flags, ip, ecxt_func, evt_func, sub_local);
>     dept_ecxt_holding(map, evt_flags);
>     dept_request_event(map, ext_wgen);
> --
> 2.53.0

