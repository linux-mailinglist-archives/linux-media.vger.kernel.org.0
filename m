Return-Path: <linux-media+bounces-63231-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SP2zAdZbHWrnZgkAu9opvQ
	(envelope-from <linux-media+bounces-63231-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 12:15:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C3661D2A6
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 12:15:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 310E13029A56
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 10:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7AE63A1D07;
	Mon,  1 Jun 2026 09:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FA5iD/CG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CB43932FC
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 09:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780307520; cv=none; b=miuuZHQZ5rmtOtJbN+TY9Wgy2/J/jwf6m343TdRb1FqP1FGp+AGYpBWMZa7JF23mRic7BtRf2fVMPkgafE+rlvT1I5U/uEp1Vz6ccexL7f33k6Rb0kBzXWwOylguaP/uEtNfnFzbdpimxJadB4KafhrYlzXX3XpYfz2IzWg+K0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780307520; c=relaxed/simple;
	bh=jgFQpWwFNpE/0Wy7VK9eH21qw3y/oTxT9M4jXYKCVfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLv2ZoJ5o/BQ61JsbETd+T+8DBs8T8rvu3mnC8BBrtgsoXu4D2tsgZMntbhEhMhuHXGCt0waWsKNdJkP7/+5+hAUoh4RHeIkbg0cxMBUTbcz7wOy1+ENeeqv5r3nnlgJwM2DdxgHyJDghf0YB5eNIpsm8RBeTz5CJSr34Zh4RlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FA5iD/CG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780307510; x=1811843510;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jgFQpWwFNpE/0Wy7VK9eH21qw3y/oTxT9M4jXYKCVfg=;
  b=FA5iD/CGIxNJ/6wLpKj02Yjg86I3F3nD5zFrEMEeZ+2nvCvkPe98aepu
   e8yL+nEqIXa6ueXG/aiCaL++lT/ieIzP8GsBy+v4/t2mndX91gCRRrvaJ
   HrFG/DH6Vb6SZduuwVgbg1xlvuTI53Jkq8uKkP69pIDmcB/kqgYrA26U8
   JxwNeovpmZTtjGGuTCaoRnhsRfNZltG0CF7ljtDYWFS50XcNKibgaZVUJ
   +CS4PaYMZM0ZQZ2vJbJOiqV0Zm9t3teWxlSELTlNsGX+6Iet3THtpZHaG
   +tw12V49iAf8UcYezvva2ubmN7o+KASN8Csa3MLz1xzDKFivURwQFh3x8
   w==;
X-CSE-ConnectionGUID: ql047S1mTAKDZeqcpLEBog==
X-CSE-MsgGUID: 3YKntH9gTM2y3KD1u9VeAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80913122"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="80913122"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 02:51:49 -0700
X-CSE-ConnectionGUID: JWHeB+jXRyyWj+cL0+VqYA==
X-CSE-MsgGUID: D9TcC8SrQ9KiuGfipPUGow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="281652954"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 02:51:47 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 12E8D1206D5;
	Mon, 01 Jun 2026 12:51:41 +0300 (EEST)
Date: Mon, 1 Jun 2026 12:51:41 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Cao, Bingbu" <Bingbu.Cao@amd.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"tfiga@google.com" <tfiga@google.com>,
	"ribalda@chromium.org" <ribalda@chromium.org>
Subject: Re: [PATCH v2] media: update contact email of Bingbu Cao
Message-ID: <ah1WLSwptKxFrHkN@kekkonen.localdomain>
References: <20260601065555.150536-1-bingbu.cao@amd.com>
 <ah1B9h8baqGqZ8Zj@kekkonen.localdomain>
 <BN3PR12MB95698640E1B433B04559BD438B152@BN3PR12MB9569.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN3PR12MB95698640E1B433B04559BD438B152@BN3PR12MB9569.namprd12.prod.outlook.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63231-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aka.ms:url,intel.com:email,intel.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,amd.com:email]
X-Rspamd-Queue-Id: B1C3661D2A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bingbu,

On Mon, Jun 01, 2026 at 09:03:37AM +0000, Cao, Bingbu wrote:
> AMD General
> 
> Hi, Sakari,
> 
> > -----Original Message-----
> > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Sent: Monday, June 1, 2026 4:25 PM
> > To: Cao, Bingbu <Bingbu.Cao@amd.com>
> > Cc: linux-media@vger.kernel.org; laurent.pinchart@ideasonboard.com;
> > mchehab@kernel.org; tfiga@google.com; ribalda@chromium.org
> > Subject: Re: [PATCH v2] media: update contact email of Bingbu Cao
> >
> > [You don't often get email from sakari.ailus@linux.intel.com. Learn
> > why this is important at
> > https://aka.ms/LearnAboutSenderIdentification ]
> >
> > Caution: This message originated from an External Source. Use proper
> > caution when opening attachments, clicking links, or responding.
> >
> >
> > Hi Bingbu,
> >
> > Good to see you're staying in the Linux media circles! 8-)
> 
> :)
> 
> >
> > On Mon, Jun 01, 2026 at 02:55:07PM +0800, Bingbu Cao wrote:
> > > I left Intel and joined AMD, so update my email in the MAINTAINERS.
> > >
> > > For the Intel IPU3, IPU6 and IPU7 staging drivers, I am not able to
> > > continue the code review from now, so remove me from the MAINTAINERS
> > > and remove the invalid email in MODULE_AUTHOR.
> > >
> > > Signed-off-by: Bingbu Cao <bingbu.cao@amd.com>
> >
> > Dave posted a patch related to this:
> > <URL:https://lore.kernel.org/linux-
> > media/ahiSOvQ2zQuHDHWI@kekkonen.localdomain/T/#t>;
> > I'm planning to post v2 based on the discussion and I can take this
> > patch
> > into account as well.
> 
> Sorry, I miss this as I have not read the LKML for a while.
> Please feel free to post v2 based on the change from Dave and me.

Ack!

> 
> >
> > That patch however is just for MAINTAINERS and I think it'd be best
> > kept
> > that way. Can you post a patch to address this for the media tree? I
> > think
> > I'd keep the ipu7 (staging) and Documentation/ changes as separate
> > patches,
> > too. Tian Shu's e-mail isn't valid either, could you drop the address
> > while
> > at it?
> 
> I can submit a patch for ipu7 and Documentation/ based on your v2 or you
> can submit a separate patch.

Could you post three: one for the Media tree, another for ipu7 and one for
Documentation/?

> 
> >
> > It looks like the ov9734 driver will be left without a maintainer,
> > would
> > you be interested in maintaining it? I'd also add myself as maintainer
> > for
> > the imx319 and the ov01a10 drivers.
> 
> I would like to be reviewer for ov9734, could you take the maintainer?

I don't have access to the sensor nor I know where it can be found. :-( Any
idea?

-- 
Regards,

Sakari Ailus

