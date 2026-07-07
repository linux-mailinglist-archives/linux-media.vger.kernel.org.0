Return-Path: <linux-media+bounces-66812-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AFnVGMqpTGpDnwEAu9opvQ
	(envelope-from <linux-media+bounces-66812-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 09:24:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8448718706
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 09:24:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=hI3ZxTOz;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66812-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66812-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B500304C907
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 07:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D7393AFAFF;
	Tue,  7 Jul 2026 07:18:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED8B3BB13D;
	Tue,  7 Jul 2026 07:18:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783408700; cv=none; b=b+DK+jbhcS8VmoQ3XepclA11vI6eoeanCW5giSVYia5ImBC861RWxUncLHyasH2TfaojZN/gw8ZfaDtoU/0EjEYz08YacmIS5sn7a4PWV0azti2GN6kHtu0GC8+3yiEORTdwHKgthED1t7nG1w/Bf8jcynUEf6+VAv+qhfTwUaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783408700; c=relaxed/simple;
	bh=lXv3s7TUQglwtYTP8xhW2uZKJRMERLZ2mMC90X8SyVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pr9C+G9Dseq6W9wMHwuQBfEvZ6FJkVHdMZ1ife5o+/5+BENLytxXgR7z2T4ZMfyA9NFrKZqbPOslvVF5GEXb8hnE6FMo5DSnsO+BEDci7OCYpGk07UPKpDGyan6zwp4UOwW5zlij+BBLqOSBNTQXHifGptszJqG7PaYXDkfHTu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hI3ZxTOz; arc=none smtp.client-ip=198.175.65.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783408694; x=1814944694;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=lXv3s7TUQglwtYTP8xhW2uZKJRMERLZ2mMC90X8SyVI=;
  b=hI3ZxTOza8Ggeibp6XFFr+MyQKHIvyLw2o96Elf6Iqi3cxoDOzzenzvU
   SmNovYsP6L7K/zMLe8yXfaZ32rxANOcGQ6QkpILZB375m/CRqCY/3ura0
   CtgYiRMzMmtg8Q+zVOWouLP8mn0eWIdieseuD5Y+s+6Ni9o9zzlnGqxWm
   bMZyCeJRwCGMnCLf7vVNIY5UhgZUTE3AwxWE+cWxmCA8MabmCWIDr+lso
   MdxbHc4WzYbeDuho/QbFAgoeG8UwlOiFMC1n5obO3uxdHC7i3THosbXsf
   yKPdTJIy5RE1pjIFW3XmvmljCqPoC5x/DAzWuONKlQGq2Fe3R+UsWQzh0
   Q==;
X-CSE-ConnectionGUID: ZcCdBJxBRDeLf5qaevKUeg==
X-CSE-MsgGUID: I7VDU9lLTK2Vtw1QfXMcjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="84072953"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84072953"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 00:18:11 -0700
X-CSE-ConnectionGUID: GR2WtPkFT+KRqjVdul0wpQ==
X-CSE-MsgGUID: Ea2HVu0rRgS03xBy/Mzg9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="254009287"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.178])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 00:18:09 -0700
Date: Tue, 7 Jul 2026 10:18:06 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Neal Patalay <nealpatalay0@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, andy@kernel.org,
	hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	mugrinphoto@gmail.com, matt@mattwardle.net
Subject: Re: [PATCH v4] staging: media: atomisp: refactor pipe graph dump
 stage formatting
Message-ID: <akyoLqy98pt2iRkP@ashevche-desk.local>
References: <20260706000738.18478-1-nealpatalay0@gmail.com>
 <CAHp75VcSGXC=x3hFXt8qvyRQjPzy3uLN9iBTURp2yA9+P_jibg@mail.gmail.com>
 <CAGjuiT9gu32wvx2Vf0U0g9deyAzzGtwwCNEdW_R4JVarO9x4JQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGjuiT9gu32wvx2Vf0U0g9deyAzzGtwwCNEdW_R4JVarO9x4JQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66812-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nealpatalay0@gmail.com,m:andy.shevchenko@gmail.com,m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:sakari.ailus@linux.intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:mugrinphoto@gmail.com,m:matt@mattwardle.net,m:andyshevchenko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,linux.intel.com,vger.kernel.org,lists.linux.dev,mattwardle.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:from_mime,intel.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ashevche-desk.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C8448718706

On Mon, Jul 06, 2026 at 02:59:16PM -0700, Neal Patalay wrote:
> On Sun, Jul 5, 2026 at 10:37 PM Andy Shevchenko wrote:
> 
> > Please, slow down! No need to send a new version immediately after
> > replying to the previous one without settling down all aspects of the
> > change.
> >
> > This version is no go, sorry.
> 
> Understood, no problem.
> 
> > > +static void ia_css_debug_build_info(char *info, size_t info_size,
> > > +                                   int *offset,
> > > +                                   const char *flag_str, size_t flag_str_size,
> > > +                                   int *line_len,
> > > +                                   int *num_lines)
> > > +{
> > > +       int len = *line_len;
> > > +       int off = *offset;
> > > +       int lines = *num_lines;
> > > +       int len_written;
> > > +
> > > +       if (lines > 3)
> > > +               return;
> > > +
> > > +       /*
> > > +        * If new line length exceeds max line length,
> > > +        * replace the last ',' with a "\\n".
> > > +        */
> > > +       if (len > 0 && off > 0 && info_size - off >= 2 &&
> > > +           len + flag_str_size > ENABLE_LINE_MAX_LENGTH) {
> > > +               if (lines >= 3) {
> > > +                       *num_lines = lines + 1;
> > > +                       return;
> > > +               }
> > > +               info[off - 1] = '\\';
> > > +               info[off] = 'n';
> > > +               off += 1;
> > > +               len = 0;
> > > +               lines += 1;
> > > +       }
> > > +
> > > +       len_written = scnprintf(info + off, info_size - off, "%s,", flag_str);
> > > +       *offset = off + len_written;
> > > +       *line_len = len + len_written;
> > > +       *num_lines = lines;
> > > +}
> >
> > This makes helper too ugly and unreadable. Again, study the case
> > first, when this can be true. Do we really need to cut it? This whole
> > thing AFAICS depends on the dtrace facility in the driver. Is that
> > HW-related? Is it pure SW? You need to perform some homework.
> 
> I've taken a look at the driver in greater depth. The flag wrapping
> functionality being refactored here is used to construct a graph
> visualization for debugging.
> 
> > >                 dtrace_dot("node [shape = circle, fixedsize=true, width=2.5, label=\"%s\\n%s\\n\\n%s\"]; \"%s(pipe%d)\"",
> > >                            bin_type, blob_name, enable_info, blob_name, id);
> 
> Each one of these calls generates a node in that graph, and the contents
> of the node are decided by the flag string we build in enable_info. Seeing
> as we are just collecting debug info and populating a visualization with it,
> this refactor seems to be software.
> 
> Seeing as it's unlikely that every flag is enabled at once, and even if they
> are this only causes a slightly more unreadable graph, avoiding 3 line
> truncation seems to be the best option since it leads to more readable code
> and avoids omitting information.
> 
> Additionally, len > 0 && offset == 0 is an impossible condition under any
> feasible helper function use condition. This can be documented in a comment.
> 
> Given this information, to me it seems like the best course of action is to
> revert the helper function to its simpler state without line count truncation
> or the offset > 0 comparison. What do you think?

I agree, just add more comments to the code and elaborate in the commit message
the (potential) difference in the behaviour.

-- 
With Best Regards,
Andy Shevchenko



