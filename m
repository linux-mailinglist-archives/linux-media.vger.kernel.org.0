Return-Path: <linux-media+bounces-47365-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 72978C6E12A
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 11:53:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 60F382E163
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 10:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CAB934DB6E;
	Wed, 19 Nov 2025 10:53:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7E5313E12;
	Wed, 19 Nov 2025 10:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763549605; cv=none; b=kb0PsW3zSDeSMA8r1nYYk3hUDR2RzP2HcTxEWEgP5mNkMMYOl62nayWU21iklx8OXYcCA6LJNAd6WVPlHrNRji1EakiWFb5r0Vy1JXOTeq0sWWh9ZUPJDZ346TfJ/A2mxucUsaCIIpxJBpQKexi2hPLkvDJS+KDuTHkl0LWKuZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763549605; c=relaxed/simple;
	bh=GYqmggF3znhUGPatz51esM7m1/OXe2ZD930Ya1NBl3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HHnY/dMGIxxCFdRfTZcTrDjN5VqVIac5c9OXH/ozQT4rGbWwnvm9gKHFq9KVv7u1RUd6GyPRR384da+mMjfaaQPcINxRP2yo0aqTzFTkkdTRvhbx6AtKWCBhr2EpcWp+qWuKDqDEYl4Zb+wNP0KLQks/NDEIl/6+4OFBW4gkYKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-c45ff70000001609-19-691da19e89c8
Date: Wed, 19 Nov 2025 19:53:12 +0900
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org
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
	catalin.marinas@arm.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, luto@kernel.org,
	sumit.semwal@linaro.org, gustavo@padovan.org,
	christian.koenig@amd.com, andi.shyti@kernel.org, arnd@arndb.de,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	rppt@kernel.org, surenb@google.com, mcgrof@kernel.org,
	petr.pavlu@suse.com, da.gomez@kernel.org, samitolvanen@google.com,
	paulmck@kernel.org, frederic@kernel.org, neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com, josh@joshtriplett.org, urezki@gmail.com,
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
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v17 44/47] dept: introduce APIs to set page usage and use
 subclasses_evt for the usage
Message-ID: <20251119105312.GA11582@system.software.com>
References: <20251002081247.51255-1-byungchul@sk.com>
 <20251002081247.51255-45-byungchul@sk.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002081247.51255-45-byungchul@sk.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0iTYRTHed67o9HrtHrMhFhJYGQaYoeyKPDD+6WILoQF1cqXHM0VW1lG
	hWWpWVJMFrkuXtO1vLWVeWeazUsXK22saF5CtDCNprOaS3NG5Lcfv8P5/8+Hw5EyO72YU6qP
	ixq1QiVnJJRkZF7Bqrv5IcqIhochkGHOoaHXnYHgUs00Bb91NhamG2wIhp+6EOj7BxiYdg4R
	MGBNRzD5spOER7YeBO36KwyMvLlNQN6FBhpSCysYqOmrZeHGw0WgL6sjoDglFD4ZDSw4r+kp
	aO+x0zA8qGNgvLufgPy0Igps1Z8IuFr5mIae0mkaUm79oKGztoyG/j4HDdmjgwiK3d9YsOUt
	BN2giwVX0QQFaWNTNLRmWQnofl+HoDGjj4CWiicEmEvtDHQ4x1jwOKtpsOtyGaj8XsLAnfFI
	KPttR5siBJOlihBK75YiYdKjQ8L4vVRS8LjfMUJHARZqDE5WuNj4gRUsxjChsP4LIeS73LRg
	Nl1mBLNLxwqZI92E8NFezwijr16x25bskcTEiyplkqhZvfGAJKGxr4Q5lr7hlHGomk1BLyIy
	kR+H+Sjce76X+sdfx/NZH1N8KG4730X7mOFXYIfjF+njQH4ptmQNzngJR/I5wdhdmcr4BgG8
	Ck+0lM8uS3nALbkts17GH8R6Uzb91/vj9pyB2TKSD8OOqS9EJuJmOBiXTHE+7cevxeW5NuTj
	BfwybK1qJXxdmO/xw1XGn+jvoUG4yeigriPeMCfWMCfW8D82D5EmJFOqkxIVSlVUeEKyWnkq
	/NDRRDOa+bbis9691cj1ekcz4jkknyfNmB+ilNGKJG1yYjPCHCkPlIZuXqKUSeMVyadFzdH9
	mhMqUduMgjlKvki6ZuJkvIw/rDguHhHFY6Lm35Tg/BanoJVnRm+v927dpIvd9cLjv/1BZNby
	Q1cnK+ss2UExnWShmBDr/8hakN110vK8oO2NN5KuNacPlN/ct2a33qaIttbnVnl3bqkju5yx
	0RXhsV3rkos2ar0QnxaXfjC6adgRZA58Vrxs+G3AOXy6Q/353X0yKuKyyR4V51k3tLw87eMN
	OaVNUESGkRqt4g+/LpDnaQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0xTZxjHfc+dZtUjg3hiXUK6oQaDQjLmk7kZlyzxxGXGxA9LtkWtejYa
	SmGtY9aEDCyNBJ3UukJoBcrt2BSE2noBSQ3jUqdCLKubZIMBSy0wuSTaApXbTl2W+eXN7/39
	n3/yfHgYPHGF3MyotacEnValUVIyQnZwjzG9uu4tdUYgvBt+K+4iIBopJeBKWwsFpZ4qEgKt
	zQhGo6UIFpbsOJg61ghYsfhpiMT+oGHN50dQMWjBoeVGMQYv3KsUPOt5jsA6HqKgcqqYgDnx
	AgJb2E7DVN9+mBntJGFtZAKDJ/PTCMTQKgahrnMIVipyoLbeS8HSwCMcKq0BBHXjIzhMuqXw
	hv9PBD7nWQqemm/iEAyth8fROQruW89TMDN4BYNZNwWOsz4Squ0WBMaGNgoqqj0EdIzdoWHw
	2TIGwxUWDJo9n8KoGCbgobkek/aTpq5vAnulEZOeSQys1zoxiIkuGvobhgkQi1LBPhAk4S+n
	jYbl8UxYc+SBv3mChpFyKwGtM4/IfVbEL5guErzLewvjTb+sUHxLTQvil15aEB9pMuK8ySx9
	e6bncL7E+x3f9HCa4l9Gf6V437yD4B/Uc/ylgXS+wzZC8yV3f6cPvf+57IOTgkZdIOh27T0m
	y747dpXKP/fhaedEO12E+jPKUALDse9y05E6Os4Em8r9XBwk40yx27ihoRge5yQ2hfP+EJa8
	jMHZKgUXdRupePAmq+Hme1tfleUscL21va98Inucs7ouk//6jdz9qhARZ5xN44ZWp7AyxEis
	4K6uMnGdwO7mWmv9KM7J7Ntc1617mBnJba+1ba+1bf+3HQh3oSS1tiBXpdZk7dTnZBu06tM7
	T+TlepB0lGLh8qV2FAnu70Ysg5RvyBfNW9SJpKpAb8jtRhyDK5PkqR9JSn5SZTgj6PKO6r7V
	CPpupGAI5Sb5gc+EY4ns16pTQo4g5Au6/1KMSdhchFwpXRu+f55pejyW9YVKH3sykbl93dbC
	NPTJ4t5wRvJC5zd/L9aUKH5aUISInB9v6icPtycf6T/cdHQwwJ+pOeBrNNBHKgvHHxwKOi+I
	X/aleAJfpR8MG4wZTva2uyemnd1RfvHpO0lZfeWjH7MNmONyG31evL7eWzY7/F7jjJjfqyT0
	2arMNFynV/0DMGDGq5ADAAA=
X-CFilter-Loop: Reflected

On Thu, Oct 02, 2025 at 05:12:44PM +0900, Byungchul Park wrote:
> False positive reports have been observed since dept works with the
> assumption that all the pages have the same dept class, but the class
> should be split since the problematic call paths are different depending
> on what the page is used for.
> 
> At least, ones in block device's address_space and ones in regular
> file's address_space have exclusively different usages.
> 
> Thus, define usage candidates like:
> 
>    DEPT_PAGE_REGFILE_CACHE /* page in regular file's address_space */
>    DEPT_PAGE_BDEV_CACHE    /* page in block device's address_space */
>    DEPT_PAGE_DEFAULT       /* the others */

1. I'd like to annotate a page to DEPT_PAGE_REGFILE_CACHE when the page
   starts to be associated with a page cache for fs data.

2. And I'd like to annotate a page to DEPT_PAGE_BDEV_CACHE when the page
   starts to be associated with meta data of fs e.g. super block.

3. Lastly, I'd like to reset the annotated value if any, that has been
   set in the page, when the page ends the assoication with either page
   cache or meta block of fs e.g. freeing the page.

Can anyone suggest good places in code for the annotation 1, 2, 3?  It'd
be totally appreciated. :-)

	Byungchul

> Introduce APIs to set each page's usage properly and make sure not to
> interact between at least between DEPT_PAGE_REGFILE_CACHE and
> DEPT_PAGE_BDEV_CACHE.  However, besides the exclusive usages, allow any
> other combinations to interact to the other for example:
> 
>    PG_locked for DEPT_PAGE_DEFAULT page can wait for PG_locked for
>    DEPT_PAGE_REGFILE_CACHE page and vice versa.
> 
>    PG_locked for DEPT_PAGE_DEFAULT page can wait for PG_locked for
>    DEPT_PAGE_BDEV_CACHE page and vice versa.
> 
>    PG_locked for DEPT_PAGE_DEFAULT page can wait for PG_locked for
>    DEPT_PAGE_DEFAULT page.
> 
> Signed-off-by: Byungchul Park <byungchul@sk.com>
> ---
>  include/linux/dept.h       | 31 +++++++++++++++-
>  include/linux/mm_types.h   |  1 +
>  include/linux/page-flags.h | 76 +++++++++++++++++++++++++++++++++++++-
>  3 files changed, 104 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/dept.h b/include/linux/dept.h
> index 0ac13129f308..fbbc41048fac 100644
> --- a/include/linux/dept.h
> +++ b/include/linux/dept.h
> @@ -21,8 +21,8 @@ struct task_struct;
>  #define DEPT_MAX_WAIT_HIST		64
>  #define DEPT_MAX_ECXT_HELD		48
>  
> -#define DEPT_MAX_SUBCLASSES		16
> -#define DEPT_MAX_SUBCLASSES_EVT		2
> +#define DEPT_MAX_SUBCLASSES		24
> +#define DEPT_MAX_SUBCLASSES_EVT		3
>  #define DEPT_MAX_SUBCLASSES_USR		(DEPT_MAX_SUBCLASSES / DEPT_MAX_SUBCLASSES_EVT)
>  #define DEPT_MAX_SUBCLASSES_CACHE	2
>  
> @@ -390,6 +390,32 @@ struct dept_ext_wgen {
>  	unsigned int wgen;
>  };
>  
> +enum {
> +	DEPT_PAGE_DEFAULT = 0,
> +	DEPT_PAGE_REGFILE_CACHE,	/* regular file page cache */
> +	DEPT_PAGE_BDEV_CACHE,		/* block device cache */
> +	DEPT_PAGE_USAGE_NR,		/* nr of usages options */
> +};
> +
> +#define DEPT_PAGE_USAGE_SHIFT 16
> +#define DEPT_PAGE_USAGE_MASK ((1U << DEPT_PAGE_USAGE_SHIFT) - 1)
> +#define DEPT_PAGE_USAGE_PENDING_MASK (DEPT_PAGE_USAGE_MASK << DEPT_PAGE_USAGE_SHIFT)
> +
> +/*
> + * Identify each page's usage type
> + */
> +struct dept_page_usage {
> +	/*
> +	 * low 16 bits  : the current usage type
> +	 * high 16 bits : usage type requested to be set
> +	 *
> +	 * Do not apply the type requested immediately but defer until
> +	 * after clearing PG_locked bit of the folio or page e.g. by
> +	 * folio_unlock().
> +	 */
> +	atomic_t type; /* Update and read atomically */
> +};
> +
>  struct dept_event_site {
>  	/*
>  	 * event site name
> @@ -562,6 +588,7 @@ extern void dept_hardirqs_off(void);
>  struct dept_key { };
>  struct dept_map { };
>  struct dept_ext_wgen { };
> +struct dept_page_usage { };
>  struct dept_event_site { };
>  
>  #define DEPT_MAP_INITIALIZER(n, k) { }
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 5ebc565309af..8ccbb030500c 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -224,6 +224,7 @@ struct page {
>  	struct page *kmsan_shadow;
>  	struct page *kmsan_origin;
>  #endif
> +	struct dept_page_usage usage;
>  	struct dept_ext_wgen pg_locked_wgen;
>  } _struct_page_alignment;
>  
> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> index d3c4954c4218..3fd3660ddc6f 100644
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -204,6 +204,68 @@ enum pageflags {
>  
>  extern struct dept_map pg_locked_map;
>  
> +static inline int dept_set_page_usage(struct page *p,
> +		unsigned int new_type)
> +{
> +	unsigned int type = atomic_read(&p->usage.type);
> +
> +	if (WARN_ON_ONCE(new_type >= DEPT_PAGE_USAGE_NR))
> +		return -1;
> +
> +	new_type <<= DEPT_PAGE_USAGE_SHIFT;
> +retry:
> +	new_type &= ~DEPT_PAGE_USAGE_MASK;
> +	new_type |= type & DEPT_PAGE_USAGE_MASK;
> +
> +	if (!atomic_try_cmpxchg(&p->usage.type, &type, new_type))
> +		goto retry;
> +
> +	return 0;
> +}
> +
> +static inline int dept_reset_page_usage(struct page *p)
> +{
> +	return dept_set_page_usage(p, DEPT_PAGE_DEFAULT);
> +}
> +
> +static inline void dept_update_page_usage(struct page *p)
> +{
> +	unsigned int type = atomic_read(&p->usage.type);
> +	unsigned int new_type;
> +
> +retry:
> +	new_type = type & DEPT_PAGE_USAGE_PENDING_MASK;
> +	new_type >>= DEPT_PAGE_USAGE_SHIFT;
> +	new_type |= type & DEPT_PAGE_USAGE_PENDING_MASK;
> +
> +	/*
> +	 * Already updated by others.
> +	 */
> +	if (type == new_type)
> +		return;
> +
> +	if (!atomic_try_cmpxchg(&p->usage.type, &type, new_type))
> +		goto retry;
> +}
> +
> +static inline unsigned long dept_event_flags(struct page *p, bool wait)
> +{
> +	unsigned int type;
> +
> +	type = atomic_read(&p->usage.type) & DEPT_PAGE_USAGE_MASK;
> +
> +	if (WARN_ON_ONCE(type >= DEPT_PAGE_USAGE_NR))
> +		return 0;
> +
> +	/*
> +	 * event
> +	 */
> +	if (!wait)
> +		return 1UL << type;
> +
> +	return (1UL << DEPT_PAGE_DEFAULT) | (1UL << type);
> +}
> +
>  /*
>   * Place the following annotations in its suitable point in code:
>   *
> @@ -214,20 +276,28 @@ extern struct dept_map pg_locked_map;
>  
>  static inline void dept_page_set_bit(struct page *p, int bit_nr)
>  {
> +	dept_update_page_usage(p);
>  	if (bit_nr == PG_locked)
>  		dept_request_event(&pg_locked_map, &p->pg_locked_wgen);
>  }
>  
>  static inline void dept_page_clear_bit(struct page *p, int bit_nr)
>  {
> +	unsigned long evt_f;
> +
> +	evt_f = dept_event_flags(p, false);
>  	if (bit_nr == PG_locked)
> -		dept_event(&pg_locked_map, 1UL, _RET_IP_, __func__, &p->pg_locked_wgen);
> +		dept_event(&pg_locked_map, evt_f, _RET_IP_, __func__, &p->pg_locked_wgen);
>  }
>  
>  static inline void dept_page_wait_on_bit(struct page *p, int bit_nr)
>  {
> +	unsigned long evt_f;
> +
> +	dept_update_page_usage(p);
> +	evt_f = dept_event_flags(p, true);
>  	if (bit_nr == PG_locked)
> -		dept_wait(&pg_locked_map, 1UL, _RET_IP_, __func__, 0, -1L);
> +		dept_wait(&pg_locked_map, evt_f, _RET_IP_, __func__, 0, -1L);
>  }
>  
>  static inline void dept_folio_set_bit(struct folio *f, int bit_nr)
> @@ -245,6 +315,8 @@ static inline void dept_folio_wait_on_bit(struct folio *f, int bit_nr)
>  	dept_page_wait_on_bit(&f->page, bit_nr);
>  }
>  #else
> +#define dept_set_page_usage(p, t)		do { } while (0)
> +#define dept_reset_page_usage(p)		do { } while (0)
>  #define dept_page_set_bit(p, bit_nr)		do { } while (0)
>  #define dept_page_clear_bit(p, bit_nr)		do { } while (0)
>  #define dept_page_wait_on_bit(p, bit_nr)	do { } while (0)
> -- 
> 2.17.1

