Return-Path: <linux-media+bounces-64006-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WGLHNybrI2rv0AEAu9opvQ
	(envelope-from <linux-media+bounces-64006-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 11:40:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3434564D064
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 11:40:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=inria.fr header.s=dc header.b=KmdmIkcX;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64006-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64006-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=inria.fr;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83DAC30160FD
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2026 09:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C7234887B;
	Sat,  6 Jun 2026 09:40:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581E133D6C7
	for <linux-media@vger.kernel.org>; Sat,  6 Jun 2026 09:40:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780738846; cv=none; b=P1W0JTlpJC4iACCTZiHt9oNfBpp2RrzKccJR5pzSBn0rT8kDp+dfgGwGJ8s9GrvixPtdBEp8h90sYHI3slt99+kfVdjT/kZD0f/aFYY2kc5eSXK9q4tPN3usoFLgWEQpPrWqw0obZwb2yOB9OKbGyD6sMmvRQ5igyDI8yyeGLY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780738846; c=relaxed/simple;
	bh=4I30vUtj07mMJco+IhNQqbu/hZcd94bTk6Kd2MCI9B8=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=DISGzM6ihPzOATUFigTSo3r12daHtcYXw0iSMjMDYucsJ8PqP7XDP8jFMk97aumh5nrHhn1vpWblTcSYDFPX4sJNMqp6pp8WfEdbYDeodEBzWmwTnZKPk45WHJdYLiYk4NSUF00qpVCWEXnvzkNVUdXPFagS5Vkxq0z6mB8m02w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=KmdmIkcX; arc=none smtp.client-ip=192.134.164.83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FMgLc0GmGwHe/mQzCi7R0j3/BVpn7XP5mlcY/lk9snQ=;
  b=KmdmIkcXs0b0BmCOl9aE8Clg1MSh4E1qxRrcB0LX7H/Zo9s7jopTaZLS
   QRLFZPs9tqiqWYPn/RuazDN021NM7K8P+vRkyZS7RV1AC4T+BQvZK3pox
   RDsJUuKXjbHaKUi10tsDnx4eFrtbOhemLF+w2Qn8vs6Mv4TAyW8B0HJ4/
   4=;
X-CSE-ConnectionGUID: KWt+6k+zTtGnC6G6dCfj+w==
X-CSE-MsgGUID: /RWs4ROeSA+xSVgqnIV/ZQ==
X-IronPort-AV: E=Sophos;i="6.24,190,1774306800"; 
   d="scan'208";a="280107240"
Received: from 88-188-149-159.subs.proxad.net (HELO hadrien.home) ([88.188.149.159])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2026 11:39:29 +0200
Date: Sat, 6 Jun 2026 11:39:28 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
cc: linux-media@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: [sailus-media-tree:partial-reg 5/9] drivers/media/v4l2-core/v4l2-event.c:81:38-39:
 WARNING this kind of initialization is deprecated (fwd)
Message-ID: <cb16fdfd-7d7d-d0bd-faf1-1c3acabdbb66@inria.fr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[inria.fr,none];
	R_DKIM_ALLOW(-0.20)[inria.fr:s=dc];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64006-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:oe-kbuild-all@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[julia.lawall@inria.fr,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julia.lawall@inria.fr,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[inria.fr:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,01.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3434564D064



---------- Forwarded message ----------
Date: Sat, 06 Jun 2026 13:00:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [sailus-media-tree:partial-reg 5/9]
    drivers/media/v4l2-core/v4l2-event.c:81:38-39: WARNING this kind of
    initialization is deprecated

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-media@vger.kernel.org
TO: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   git://linuxtv.org/sailus/media_tree.git partial-reg
head:   b7d01dab7d47849d483b459ff2abf50497b52149
commit: 0258a2c8b5c7b9a6a0adce2059f2ecd12046776d [5/9] v4l: event: Split the event framework into generic and V4L2 bits
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: csky-randconfig-r062-20260606 (https://download.01.org/0day-ci/archive/20260606/202606061203.fuAY215y-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202606061203.fuAY215y-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/media/v4l2-core/v4l2-event.c:81:38-39: WARNING this kind of initialization is deprecated

vim +81 drivers/media/v4l2-core/v4l2-event.c

0258a2c8b5c7b9a Sakari Ailus 2019-02-15  77
0258a2c8b5c7b9a Sakari Ailus 2019-02-15  78  static bool v4l2_evop_is_subscribed(struct media_subscribed_evbase *mse,
0258a2c8b5c7b9a Sakari Ailus 2019-02-15  79  				    const void *__evspec)
0258a2c8b5c7b9a Sakari Ailus 2019-02-15  80  {
0258a2c8b5c7b9a Sakari Ailus 2019-02-15 @81  	const struct v4l2_event_spec *evspec = evspec;
0258a2c8b5c7b9a Sakari Ailus 2019-02-15  82  	struct v4l2_subscribed_event *sev = to_v4l2_subscribed_event(mse);
0258a2c8b5c7b9a Sakari Ailus 2019-02-15  83
0258a2c8b5c7b9a Sakari Ailus 2019-02-15  84  	return sev->evspec.type == evspec->type &&
0258a2c8b5c7b9a Sakari Ailus 2019-02-15  85  		sev->evspec.id == evspec->id;
0258a2c8b5c7b9a Sakari Ailus 2019-02-15  86  }
0258a2c8b5c7b9a Sakari Ailus 2019-02-15  87

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

