Return-Path: <linux-media+bounces-60338-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PiKBmqT+WnV9wIAu9opvQ
	(envelope-from <linux-media+bounces-60338-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 08:51:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 833584C755E
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 08:51:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B7F0302158C
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 06:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F1FF3CAE71;
	Tue,  5 May 2026 06:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="glJ/kip2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E133BE141
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 06:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777963874; cv=none; b=tZgk/dONfV9r/d6fH9GqmoYnsqSO/to4asamqJBC0cKpDUFUQVh1R8N7+FMrGDy9b2o4YwKCftZwWwKH6IqZPD5WjzW84gc5wPoQVS9gfA7zg+M6C0GlfsTXuKZL6AwcrZMZ9CitxNa8lWn1jtKPne2qX1GnyX+okC5mO+U2hqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777963874; c=relaxed/simple;
	bh=+bo0nYw0AYtPX8/EIw9wKVMapwMb0gb3sH6/662kkgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nmjHztbud/u1AGITADxvcF6ont7ivmmesS8iLXanksnqC6lZsvUckAXic2hr6hLIF1Nq7V+vxhZ981lHJyhgHPdG5ad9ETJZkx89iyvysxduwR1HQ8WVWqK4G8/ahGfmiaOqQMQB3lRpSF/eu5tMyL1XsA12Kax3xagLuorcXho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=glJ/kip2; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777963874; x=1809499874;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+bo0nYw0AYtPX8/EIw9wKVMapwMb0gb3sH6/662kkgo=;
  b=glJ/kip21UPvZnlsAsJPwBl3/6YH1WWWgLGMu4iFONnHujH7ysiqK/Ic
   bQxb42QN9CYjAlbOm8EDeSJ6X+x27GvxHsmgl95DSi1TTmgCzIOIWC2c5
   tmiMxG1/Hfn8l4BpEzb08szh+UdIYqxgus6cpnnO4QtNnOiUgdoQJGmcz
   /8HZj/pV6+tB9tsVWFkcSmH/MnwaQvkobc4pMEaIjhpFsMVdXO1ENHipy
   99qZ1AqUSbS7XghoT22+6YmVQGOBiHiYxKrOqOreKrL4zHwqqYJOrh8P8
   LG92/wJIYBn7LyMdmZUFpiKzoTQDkLV8hzBmGuUG/Ql5CQPScRTZvFI6T
   g==;
X-CSE-ConnectionGUID: 6tZsYxBkRzyBY7ILrX7Rzg==
X-CSE-MsgGUID: 09p/CMCDQKeMQ69Vn0I9Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="77850012"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="77850012"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 23:51:13 -0700
X-CSE-ConnectionGUID: f2wBM7bXQY+v1R1zIeh0fw==
X-CSE-MsgGUID: Gb8dqkD5TXusf8sEYa2zag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="229250023"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.23])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 23:51:07 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E4898121CB0;
	Tue, 05 May 2026 09:51:06 +0300 (EEST)
Date: Tue, 5 May 2026 09:51:06 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v4 21/29] media: mc: Don't care about unsettable flags in
 MEDIA_IOC_LINK_SETUP
Message-ID: <afmTWpWBVlAaJROJ@kekkonen.localdomain>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-22-sakari.ailus@linux.intel.com>
 <e3b9b553-af2b-4b9a-bc01-a9f859e4c319@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3b9b553-af2b-4b9a-bc01-a9f859e4c319@kernel.org>
X-Rspamd-Queue-Id: 833584C755E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	TAGGED_FROM(0.00)[bounces-60338-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim]

Hi Hans,

On Tue, May 05, 2026 at 08:36:44AM +0200, Hans Verkuil wrote:
> On 08/04/2026 17:39, Sakari Ailus wrote:
> > The implementation of MEDIA_IOC_LINK_SETUP currently requires that all
> > flags that are set by the driver are correctly set as the driver expects.
> > This poses a problem for adding new flags as programs could not work with
> > links that have unknown flags even when the use of these flags wouldn't
> > affect the program.
> > 
> > Ignore the non-settable link flags.
> 
> Doesn't this require an uAPI documentation change as well, clarifying how
> flags are handled?

The handling of the flags could (and should) well be documented in UAPI
documentation but the current documentation is vague. It doesn't say the
user needs to set also the non-settable flags.

I'll add a patch for this.

-- 
Regards,

Sakari Ailus

