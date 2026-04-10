Return-Path: <linux-media+bounces-58571-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PUPM2pw2WnGpggAu9opvQ
	(envelope-from <linux-media+bounces-58571-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 23:49:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1A93DD0C4
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 23:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C149301BCF3
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 21:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5159E3DCD86;
	Fri, 10 Apr 2026 21:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YO1zQBye"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC68D21ADB7;
	Fri, 10 Apr 2026 21:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775857692; cv=none; b=XQc5e/EYItfzN2qc6sVlogL6sFkaX9Wz1/yjC+thRXk6HCbCFNQGtAXTUKHNYngUf7Ka74RmO931M0bnTckbUEMkRD339getJUPB7DcPhQ0xco/5ghGoKTPls/y6354rLtHC2n+qUgGZAGr2w5jXnfr6jAX+sukcc5dNTuVNfek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775857692; c=relaxed/simple;
	bh=Im+rlKHFNOuguxxwYZv+v7NeZoSGIXvZt9v0Smo3S2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aBfalPndrxCyZ5F79apfP81O8e7Udq2nJrYaA0VMlG3MJ7i4jkpeTBKRMcOlaBkjAknVJy8Ee/OPCyMNGuPdM8VWHGxmgrWo7QJ5EhQD+aHEs2mCl+HcLKhRPIZXtdCPijEAKiPHY5DpPlPpdsJi5iq+s4W8t+xAdY6684bpLIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YO1zQBye; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775857691; x=1807393691;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Im+rlKHFNOuguxxwYZv+v7NeZoSGIXvZt9v0Smo3S2g=;
  b=YO1zQByerPMI2EqmFayBu19hy09dr/yt3b3oTbkPft3DLBfB6JRvDVqV
   4fm2YR/8qsfyX/BY/EuRGLXEKI/2ZjUBf2882/XxLdvdsEvgBkStALjMN
   f+N7pR0GApO3LStVPnYlvHDYFik97OkDqdWwygrYp4dnnsm/sz+0Bdjm+
   W/hhcNwiZNTMG/1c+73UakeH19D+mZcf3d/rBOtUNqizc3GNDdzAaKDDl
   TU5y24tdxT3PQ6RJfOZau0tQx8nDY0wHAjdA5FbBeQszm0KpZu6Boh9oO
   Ttmg1Enal7sLw9dPD2vWWKYosbDoEZ009T+cOF8CoCC09jy063/sy9qWp
   A==;
X-CSE-ConnectionGUID: LyAOx0l6RF6sg9dWJGFsNA==
X-CSE-MsgGUID: 7fdGg/3ESja5tdkf/hg7ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="75924815"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="75924815"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 14:48:10 -0700
X-CSE-ConnectionGUID: fZ4Rn95TRnKnA4BIgj4P0Q==
X-CSE-MsgGUID: nbmuyneUSaCj8/TfclVcqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="259655530"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.244.136]) ([10.245.244.136])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 14:48:07 -0700
Message-ID: <c4275422-a9b4-4519-95f9-1163a7912709@linux.intel.com>
Date: Sat, 11 Apr 2026 00:48:05 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for
 fragile firmware
To: Michal Pecio <michal.pecio@gmail.com>,
 Ricardo Ribalda <ribalda@chromium.org>
Cc: JP Hein <jp@jphein.com>, Alan Stern <stern@rowland.harvard.edu>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hansg@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
 stable@vger.kernel.org
References: <20260331003806.212565-1-jp@jphein.com>
 <20260331003806.212565-3-jp@jphein.com>
 <CANiDSCvsxP+npQTHUrMTp+Z8XULYKSLTz2AFu+WQnsLbRBGa2w@mail.gmail.com>
 <20260409100247.7cfb62d1.michal.pecio@gmail.com>
 <20260409221749.5e6bccab.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260409221749.5e6bccab.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58571-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3B1A93DD0C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/9/26 23:17, Michal Pecio wrote:

> Five seconds later two control URBs are unlinked:
> Mar 30 16:59:21 katana kernel: xhci_hcd 0000:00:14.0: Cancel URB 00000000122aa5e2, dev 3.1, ep 0x0, starting at offset 0x11e227b40
> Mar 30 16:59:21 katana kernel: xhci_hcd 0000:00:14.0: // Ding dong!
> Mar 30 16:59:21 katana kernel: xhci_hcd 0000:00:14.0: Cancel URB 000000008a55bcd3, dev 3.1, ep 0x0, starting at offset 0x11e227b20
> Mar 30 16:59:21 katana kernel: xhci_hcd 0000:00:14.0: Not queuing Stop Endpoint on slot 18 ep 0 in state 0x44

log continues with:
Mar 30 16:59:21 katana kernel: xhci_hcd 0000:00:14.0: Removing canceled TD starting at 0x11e227b40 (dma) in stream 0 URB 00000000122aa5e2
Mar 30 16:59:21 katana kernel: xhci_hcd 0000:00:14.0: Removing canceled TD starting at 0x11e227b20 (dma) in stream 0 URB 000000008a55bcd3
Mar 30 16:59:21 katana kernel: xhci_hcd 0000:00:14.0: Set TR Deq ptr 0x11e227b40, cycle 0

One theory could be that xHC control endpoint refuses to restart when its dequeue
pointer is moved to a no-op TD like in this case (second cancelled URB).

xhci spec section 4.8.3 'Endpoint context state' additional Note states that:
"The Default Control Endpoint shall return to the Running state when the
  Doorbell is rung for the next Setup Stage TD sent to the endpoint."

Here the dequeue pointer will still be on the no-op TRB after queuing a new
control transfer after it. Not on a setup stage TRB

This can happen when we cancel two control URBs at the same time.
We turn the second URB TRBs starting at 0x11e227b40 into no-ops,
then move past the first URB TRBs starting at 0x11e227b20 to the second URB no-op TRB
at 0x11e227b40.

It's possible that disabling LPM helps as it reduces the number of control transfers,
so there is a much smaller risk of cancelling two control URBs in one go.

Thanks
Mathias



