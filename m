Return-Path: <linux-media+bounces-56958-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJvaGcygw2kbsQQAu9opvQ
	(envelope-from <linux-media+bounces-56958-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 09:46:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DBD32191B
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 09:46:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04D5A302AC1B
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 08:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E005539A05D;
	Wed, 25 Mar 2026 08:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bNReXSYD"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7E030F540;
	Wed, 25 Mar 2026 08:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774428354; cv=none; b=pL58HFUvrSmb1bImT91AtJwg9lSSCKwcFysUz/x+DX7HYjJDfJMRRb07A365YqZmJ9S0HQ0Zm5eqae3U5K1GCZkZXp2e8fkNcYGoHr87QnKj68qliV6B5Iq1ae4Z2/cUBubQUvNhIJyV/JrBmP7BQwsQ8RL3PNR0GQB5iV9Djmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774428354; c=relaxed/simple;
	bh=yuA40Noq2B38gqBeBHT/TJ+Si2YN8dCOsLOvXO04RFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kRyk40mkS89Sd3FlprYQ3ExBDbcWphmXxsYB+XeEGU2FXrszaSgbjgAn2gdorlFcn7VO3R8xFE3T5WFrbc8tRgC8W5pCfrqFU/SrP054Iby9o3BODM3m9z49PVmH2lLQX6+XLfwMEY8PMnhIAfM1ZSqt+67Pe3HPKSBjDDjyUVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bNReXSYD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62025C4CEF7;
	Wed, 25 Mar 2026 08:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774428353;
	bh=yuA40Noq2B38gqBeBHT/TJ+Si2YN8dCOsLOvXO04RFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bNReXSYDIO3EH/CfZlIqfTsRXG7rHOuZIp6xStKVmqF+X3YxTuyy0l9Z/LCdC9mCC
	 6LW4Sj7gf6kzd2YyLGj8FCcpMbCLZlwOVkz1dSDS86lo8RAFtfPlyZrWOT442Pb082
	 N7W95RkfsnS+u4kU84DVqbWY2rYcrG6TkPzRXHeg=
Date: Wed, 25 Mar 2026 09:45:30 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Anushka Badhe <anushkabadhe@gmail.com>
Cc: andriy.shevchenko@intel.com, andy@kernel.org, hansg@kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Re: [PATCH v2] staging: atomisp: pci: fix block comment style and
 merge split declaration
Message-ID: <2026032514-floral-preachy-bdb4@gregkh>
References: <acJ6sH4yUyity0gu@ashevche-desk.local>
 <20260324180821.42084-1-anushkabadhe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324180821.42084-1-anushkabadhe@gmail.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-56958-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E3DBD32191B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 11:38:21PM +0530, Anushka Badhe wrote:
> Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
> ---
> Changes in v2:
> - Fix block comment style (move closing */ to its own line)
> - Merge split GP_TIMER_BASE declaration onto a single line
> 
> Checked the rest of the file for similar issues; no others found.
> 
> Thank you so much for your guidance on improving the patch.

For obvious reasons, we can't take patches without any changelog text.

thanks,

greg k-h

