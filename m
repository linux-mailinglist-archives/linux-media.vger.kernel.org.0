Return-Path: <linux-media+bounces-44927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8C9BEAADA
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 18:26:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EFE66259C6
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 16:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546DB27B50F;
	Fri, 17 Oct 2025 16:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YtSviiKK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616DD26B0A9;
	Fri, 17 Oct 2025 16:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760717391; cv=none; b=qREF5xZYfz8j4tTdwHuxw+ZYqRQqN55rRX3y6OgPoYTZgs0hzvEcE6nq0yyUG+iDC24kUbfUs2Ia5BaxpplYzpi8qPIwBN4ZfU6L+ylVXc4BC+9yPQ3xRO4oXaBDYJVH0pTKa78mxyLZnYHpt1LwJuYCg8Dj1bgYz3vF8k+KuHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760717391; c=relaxed/simple;
	bh=BOrYC+tXjLjRqJyXcD4crvrBNK2lkUpKkjfEmyc87bI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iWy895WajwE+h8mx6Pi2PYix+/PvfztRajECItZdikbvNHHv5lhxGisse8tPX4JO0xzFRLKewC9ErT44yMIAJY6utZePsszk7mX8ag/vyKI5fjBwAIjLZZ0djNPioX/lMqLB9MPuNZuqA7eF0yZakSVaCNBXaDxWk6Q/EwtNQFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtSviiKK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE17C4CEE7;
	Fri, 17 Oct 2025 16:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760717391;
	bh=BOrYC+tXjLjRqJyXcD4crvrBNK2lkUpKkjfEmyc87bI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YtSviiKK7XhOypmn1B0JMTFJNg+aK9xkicr5kleBJoGLQsIHX6oRtRnPJgXbXWtLH
	 cVrvwZYIhcft0nkxK/ZQBpXxxHeWHw5/VEilYnGTD4lEZyzXP8wqDKjbklEc7PQZxX
	 jrw7mNWuagcjs3SnKes4mzFKMKH2tiSDMTY+zRgHS/b+KVlZKnLK4gb6spqja1+1F5
	 LtRKkkOtABvH8jmUIF+maywb5ma9DVPFdB4So5FQ7XdD3Y3FN97CNzQWMZICjSRgyi
	 XbXdYmBkEWUiq556ItdRa+tvmxGUk+V9ozsqtDgWFGhyHQtvMVM573eif+FMsCQ1J7
	 ilRe5q/VN9eDQ==
Date: Fri, 17 Oct 2025 17:09:24 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Eliav Farber <farbere@amazon.com>, stable@vger.kernel.org,
	linux@armlinux.org.uk, jdike@addtoit.com, richard@nod.at,
	anton.ivanov@cambridgegreys.com, dave.hansen@linux.intel.com,
	luto@kernel.org, peterz@infradead.org, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
	tony.luck@intel.com, qiuxu.zhuo@intel.com, mchehab@kernel.org,
	james.morse@arm.com, rric@kernel.org, harry.wentland@amd.com,
	sunpeng.li@amd.com, alexander.deucher@amd.com,
	christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
	evan.quan@amd.com, james.qian.wang@arm.com, liviu.dudau@arm.com,
	mihail.atanassov@arm.com, brian.starkey@arm.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, robdclark@gmail.com, sean@poorly.run,
	jdelvare@suse.com, linux@roeck-us.net, fery@cypress.com,
	dmitry.torokhov@gmail.com, agk@redhat.com, snitzer@redhat.com,
	dm-devel@redhat.com, rajur@chelsio.com, davem@davemloft.net,
	kuba@kernel.org, peppe.cavallaro@st.com, alexandre.torgue@st.com,
	joabreu@synopsys.com, mcoquelin.stm32@gmail.com, malattia@linux.it,
	hdegoede@redhat.com, mgross@linux.intel.com,
	intel-linux-scu@intel.com, artur.paszkiewicz@intel.com,
	jejb@linux.ibm.com, martin.petersen@oracle.com,
	sakari.ailus@linux.intel.com, clm@fb.com, josef@toxicpanda.com,
	dsterba@suse.com, xiang@kernel.org, chao@kernel.org, jack@suse.com,
	tytso@mit.edu, adilger.kernel@dilger.ca, dushistov@mail.ru,
	luc.vanoostenryck@gmail.com, rostedt@goodmis.org, pmladek@suse.com,
	sergey.senozhatsky@gmail.com, andriy.shevchenko@linux.intel.com,
	linux@rasmusvillemoes.dk, minchan@kernel.org, ngupta@vflare.org,
	akpm@linux-foundation.org, kuznet@ms2.inr.ac.ru,
	yoshfuji@linux-ipv6.org, pablo@netfilter.org, kadlec@netfilter.org,
	fw@strlen.de, jmaloy@redhat.com, ying.xue@windriver.com,
	willy@infradead.org, sashal@kernel.org, ruanjinjie@huawei.com,
	David.Laight@aculab.com, herve.codina@bootlin.com, Jason@zx2c4.com,
	keescook@chromium.org, kbusch@kernel.org, bvanassche@acm.org,
	ndesaulniers@google.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-um@lists.infradead.org,
	linux-edac@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
	linux-input@vger.kernel.org, linux-media@vger.kernel.org,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	platform-driver-x86@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-btrfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	linux-sparse@vger.kernel.org, linux-mm@kvack.org,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
	tipc-discussion@lists.sourceforge.net
Subject: Re: [PATCH v2 00/27 5.10.y] Backport minmax.h updates from v6.17-rc7
Message-ID: <20251017160924.GA2728735@ax162>
References: <20251017090519.46992-1-farbere@amazon.com>
 <2025101704-rumble-chatroom-60b5@gregkh>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025101704-rumble-chatroom-60b5@gregkh>

On Fri, Oct 17, 2025 at 05:03:02PM +0200, Greg KH wrote:
> On Fri, Oct 17, 2025 at 09:04:52AM +0000, Eliav Farber wrote:
> > This series backports 27 patches to update minmax.h in the 5.10.y
> > branch, aligning it with v6.17-rc7.
> > 
> > The ultimate goal is to synchronize all long-term branches so that they
> > include the full set of minmax.h changes.
> > 
> > - 6.12.y has already been backported; the changes are included in
> >   v6.12.49.
> > - 6.6.y has already been backported; the changes are included in
> >   v6.6.109.
> > - 6.1.y has already been backported; the changes are currently in the
> >   6.1-stable tree.
> > - 5.15.y has already been backported; the changes are currently in the
> >   5.15-stable tree.
> 
> With this series applied, on an arm64 server, building 'allmodconfig', I
> get the following build error.
> 
> Oddly I don't see it on my x86 server, perhaps due to different compiler
> versions?
> 
> Any ideas?
> 
> thanks,
> 
> greg k-h
> 
> ------------------------
> 
> In function ‘rt2800_txpower_to_dev’,
>     inlined from ‘rt2800_config_channel’ at ../drivers/net/wireless/ralink/rt2x00/rt2800lib.c:4022:25:
> ./../include/linux/compiler_types.h:309:45: error: call to ‘__compiletime_assert_1168’ declared with attribute error: clamp() low limit -7 greater than high limit 15
>   309 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>       |                                             ^
> ./../include/linux/compiler_types.h:290:25: note: in definition of macro ‘__compiletime_assert’
>   290 |                         prefix ## suffix();                             \
>       |                         ^~~~~~
> ./../include/linux/compiler_types.h:309:9: note: in expansion of macro ‘_compiletime_assert’
>   309 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>       |         ^~~~~~~~~~~~~~~~~~~
> ../include/linux/build_bug.h:39:37: note: in expansion of macro ‘compiletime_assert’
>    39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>       |                                     ^~~~~~~~~~~~~~~~~~
> ../include/linux/minmax.h:188:9: note: in expansion of macro ‘BUILD_BUG_ON_MSG’
>   188 |         BUILD_BUG_ON_MSG(statically_true(ulo > uhi),                            \
>       |         ^~~~~~~~~~~~~~~~
> ../include/linux/minmax.h:195:9: note: in expansion of macro ‘__clamp_once’
>   195 |         __clamp_once(type, val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
>       |         ^~~~~~~~~~~~
> ../include/linux/minmax.h:218:36: note: in expansion of macro ‘__careful_clamp’
>   218 | #define clamp_t(type, val, lo, hi) __careful_clamp(type, val, lo, hi)
>       |                                    ^~~~~~~~~~~~~~~
> ../drivers/net/wireless/ralink/rt2x00/rt2800lib.c:3980:24: note: in expansion of macro ‘clamp_t’
>  3980 |                 return clamp_t(char, txpower, MIN_A_TXPOWER, MAX_A_TXPOWER);
>       |                        ^~~~~~~

Missing commit 3bc753c06dd0 ("kbuild: treat char as always unsigned")?

Cheers,
Nathan

