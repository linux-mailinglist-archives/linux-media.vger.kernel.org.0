Return-Path: <linux-media+bounces-56870-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHJ5MqmBwmlneQQAu9opvQ
	(envelope-from <linux-media+bounces-56870-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 13:20:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CCD308143
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 13:20:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 75E043038899
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 12:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21BF83F54D8;
	Tue, 24 Mar 2026 12:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B+hU8lVy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8513EF672;
	Tue, 24 Mar 2026 12:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774354151; cv=none; b=OZ/uQMQ14bMB975ZqmmLg3v/ZsWBTfIf1gBh7drCXj8GIhvOZVhTBKtq+6gapS2IrdFVzoZpD1BVVeaTqf7RacEDSqyCvyXEqL1m5D/tnM3cWgctbXQpx02zgo+0kXViN3w7u+xBXF0h9YygUZb/e5jekTYI6A/XQPOM/9ixH+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774354151; c=relaxed/simple;
	bh=5LjOAonuU3uCnMK7KKSQPamQFdOpUTc3YHq5mK4ekog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQr/pCUFWuh+EolgcqqObGZhOdehQG6FYju+2jLv0bIwdDwux0arL12kWC7xe1wESfgWNVLIEmf69jSlbGQyq2Qa1F67ylE3ehADroV3zVfB5T5/M0hMM7NXjEWYcmZVpFR8D9GsYqaBlpbYBmLpFht3bgvDtJI6OnGMV7RUA90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B+hU8lVy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774354147; x=1805890147;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5LjOAonuU3uCnMK7KKSQPamQFdOpUTc3YHq5mK4ekog=;
  b=B+hU8lVyaKgR3K/VTC4ffFdS0AZl+/4fG47SFR7gHw/B+e327FOoIy+z
   QINmi10T5RQ5zfLIRXLRbO/i2guniWo5uV0RRZUjqIbQ7vyhd6aC0+j7l
   iMJZLEk+uZXsojPN9UiE/RmYdKcl9REwX3VXFGEKPxKyx795y59fe0aJS
   FCz9jyO4WEknQuHHKVHlk3Qo1nu0W1B24dXfUAXdUVbQgtE8N9HW2aa1Q
   xeTdLq5LFYEnyQlz+osGTDtP4jxgu/eBE7uyfEUKEvkIrxO8DVFTgm1zc
   4Q7Zm81JaY9SfiMaY7rB7VkLA9fF30ArIJqQzGblg979rsIH6Ac5pIWo+
   A==;
X-CSE-ConnectionGUID: A1LqBzvBRTC5YsuNOp2Jow==
X-CSE-MsgGUID: hF5QProURv6oTjkUS2rWJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="92746057"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="92746057"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 05:09:02 -0700
X-CSE-ConnectionGUID: 1TJKkL/vQ++/9FbDVCNotQ==
X-CSE-MsgGUID: NmZS1kMQSKyKBtuij4qxxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="247412624"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.214])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 05:09:00 -0700
Date: Tue, 24 Mar 2026 14:08:57 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chethan C <mail.chethanc@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Kees Cook <kees@kernel.org>, Petr Mladek <pmladek@suse.com>,
	Osama Albahrani <osalbahr@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] staging: media: av7110: fix coding style
Message-ID: <acJ-2eBSlbuZ2ltN@ashevche-desk.local>
References: <20260323190835.660111-1-mail.chethanc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323190835.660111-1-mail.chethanc@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56870-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,suse.com,gmail.com,ideasonboard.com,vger.kernel.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ashevche-desk.local:mid,intel.com:dkim,checkpatch.pl:url]
X-Rspamd-Queue-Id: D3CCD308143
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 12:38:19AM +0530, Chethan C wrote:
> Fixed Indentation, Alignment issues reported by checkpatch.pl.
> 
> Rename enum av7110_rec_play_state, av7110_type_rec_play_format and
> av7110_encoder_command to follow the kernel naming style.
> 
> Rename wssData to wss_data to avoid CamelCase identifiers.

...

>  	u16			wssMode;
> -	u16			wssData;
> +	u16			wss_data;

Now these two are in inconsistent state.

...

> -	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, LoadVidCode, 1, mode);
> +	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER, AV7110_LOAD_VID_CODE,
> +			    1, mode);

Also rethink about more logical split. As far as I can see this API does some
variadic arguments processing while the first two are mandatory ones. With
that taken into account I would do it as

	ret = av7110_fw_cmd(av7110, COMTYPE_ENCODER,
			    AV7110_LOAD_VID_CODE, 1, mode);

Also check the entire patch for this kind of amendments.

...

> -	rc = av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetWSSConfig, 2, 1, av7110->wssData);

> +	rc = av7110_fw_cmd(av7110, COMTYPE_ENCODER, AV7110_SET_WSS_CONFIG, 2,
> +			   1, av7110->wss_data);
>  	return (rc < 0) ? rc : count;

This can also be improved a bit as

	if (rc)
		return rc;

	return count;

but strictly speaking it's out of the scope of this patch.

-- 
With Best Regards,
Andy Shevchenko



