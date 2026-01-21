Return-Path: <linux-media+bounces-51306-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBH8FXtbcWnLGAAAu9opvQ
	(envelope-from <linux-media+bounces-51306-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 00:04:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCA75F387
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 00:04:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6855A4E390A
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 23:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1883938BDA9;
	Wed, 21 Jan 2026 23:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHfQJHdd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5558A33EAF5;
	Wed, 21 Jan 2026 23:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769036654; cv=none; b=hX+yaDq/ZWHeHADVHda8IJqTC+KFW9DsohFLBJ+IW9zVteBIcHM/DFTXRXk88PuwzH7XkJDPwyDQB9w7iIPKkicxdeoNs2r5xRXckHJTcnOxCWM44LdqdkHyeeCCm42BjQcUVWbRFBBAm6mOvnwo2VQ+0xKzfo55Q5AsPCcd0L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769036654; c=relaxed/simple;
	bh=bicMi5K8e0B0bp9gSrJTYl5RYIvmgDkMATFB4TZCQLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVfSIUbW2Jg+8oUsCc8w1Fbk29eUti4Lul9R+xia+O9E/6EkUK1uUswlnvHWs4cFt6GRGgNF6YvjA9BgeUjrQWRMmojr5LYiweDhCKszw+vnpHvaMCH0b66Eb07R6GlFy20zi2QgFzxmgRS9d5XsaSsimW09/bLbrapjcPRl0c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHfQJHdd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4FEC4CEF1;
	Wed, 21 Jan 2026 23:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769036653;
	bh=bicMi5K8e0B0bp9gSrJTYl5RYIvmgDkMATFB4TZCQLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FHfQJHddac0k4J6Tc/1P7oFnqeTw3s9eyMEiKLF6XhkkXbmW3Am0ReKC9DLA6UVwb
	 z/QZjN54GV79pn6NpBuVcSJRqUq6whka+8q9xpqyJeerFnATA6lA5PcrLhEZegM178
	 53+7d2yvbafoYE7uwLRwI/hKY+NH7aRYe5OvPHyO5d476sXqwdnBagVGa3v1ztCm4y
	 HAN5SBcNDpFac+VWxA7Rmkk04B8dqLxs2pzZWIfvRB1Y+y6dnwshyyFkPoPC899qkC
	 iDUSaK4MHkOhqsMacAdTfcNURN6kJiKS//ev5JXi4zNkFkLF8BCUNTr6bQAoxBZtiv
	 yWBzc8CgzpeAw==
Date: Wed, 21 Jan 2026 16:04:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: kernel test robot <lkp@intel.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, Yunke Cao <yunkec@google.com>,
	Hans de Goede <hansg@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Pavan Bobba <opensource206@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	Jonas Karlman <jonas@kwiboo.se>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: Re: [PATCH v9 15/17] media: rkvdec: Add H264 support for the VDPU383
 variant
Message-ID: <20260121230406.GA2625738@ax162>
References: <20260120222018.404741-16-detlev.casanova@collabora.com>
 <202601211924.rqKS2Ihm-lkp@intel.com>
 <69fda4f0136285e4d2f86e7e93d5bdd812c1d47a.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69fda4f0136285e4d2f86e7e93d5bdd812c1d47a.camel@collabora.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51306-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,collabora.com,vger.kernel.org,lists.linux.dev,kernel.org,vanguardiasur.com.ar,sntech.de,lwn.net,chromium.org,xs4all.nl,google.com,ideasonboard.com,gmail.com,linux.intel.com,blaize.com,lists.infradead.org,kwiboo.se,cknow.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,git-scm.com:url]
X-Rspamd-Queue-Id: ECCA75F387
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 09:46:48AM -0500, Nicolas Dufresne wrote:
> Le mercredi 21 janvier 2026 à 22:27 +0800, kernel test robot a écrit :
> > Hi Detlev,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > [auto build test WARNING on rockchip/for-next]
> > [also build test WARNING on linuxtv-media-pending/master media-tree/master linus/master v6.19-rc6 next-20260120]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Detlev-Casanova/media-uapi-HEVC-Add-v4l2_ctrl_hevc_ext_sps_-ls-t_rps-controls/20260121-071026
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
> > patch link:    https://lore.kernel.org/r/20260120222018.404741-16-detlev.casanova%40collabora.com
> > patch subject: [PATCH v9 15/17] media: rkvdec: Add H264 support for the VDPU383 variant
> > config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260121/202601211924.rqKS2Ihm-lkp@intel.com/config)
> > compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> 
> Modification has been done to reduce the stack utilization on clang, though we
> believe we are hitting limitations/bugs on older clang. We went ahead with these
> patch by updating our CI to clang 21, which allocate a lot less stack with KASAN
> enabled and this code. Our general advise is to use a newer clang, or GCC for
> testing with KASAN.
> 
> The stack utilization is caused by the combination of loop unrolling, agressive
> inlining, and write operations to bitfield (which requires the compiler to
> generate more code for memory checks, since the writes are not aligned).

Yes, this is an area that has known pain points, even in current
versions (but it is certainly better in most cases):

https://github.com/llvm/llvm-project/issues/143908
https://github.com/llvm/llvm-project/issues/115862

Thank you for working around this.

Cheers,
Nathan

