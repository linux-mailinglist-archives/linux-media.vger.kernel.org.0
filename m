Return-Path: <linux-media+bounces-56884-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SD1hFFyXwmkbfQQAu9opvQ
	(envelope-from <linux-media+bounces-56884-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 14:53:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CA1309C38
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 14:53:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFB6B3027D88
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 13:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25FAA3FE348;
	Tue, 24 Mar 2026 13:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BzKhep9G"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF213FD14D;
	Tue, 24 Mar 2026 13:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774360098; cv=none; b=YvnokDwYhqyXIaUipnEEIb1eVRXgW/al3XmztIUbBd7W83gwpNtEdEANctZuOArAz2nBF96JOR0dDfzcT8vy+LrU1n+m/AourdVxJMfsZ9WDIQLsgwYhA6EO+kJJ49UGrX5/8HmXPY5pC8+Knx3RzieElZM5XzmBB6C9BpXC9LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774360098; c=relaxed/simple;
	bh=n1JRsBlE9/aR6gzdid1yfnIVVfJx7S73WcWM60ioxIg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=s6yFBnsjDallofvIwaXpOcAfRxJBHQBwfcsagrpO8NBP6kvNGJiqoKp0wAMBYaspJUuxjpXzBzrodYrpAt9zAfFD1KWtoXoG6sISquendzWemBlxZbD4ij4wrQsWEWrw1Z+wN8llPfin/f4HUMWzZoNkH8PJA1TCVfDuIvuPo1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BzKhep9G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00A07C2BCB3;
	Tue, 24 Mar 2026 13:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774360098;
	bh=n1JRsBlE9/aR6gzdid1yfnIVVfJx7S73WcWM60ioxIg=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=BzKhep9G04YVvdH88KunL1y0dwXTbvzuaFH0fxUxX7whG1IHI+1VpioZsHVVQJrJk
	 MmAK4N4mbqODaG7rnOwxA73Bj+7ANIYM4hjR2/tFlcboiWTBOmQCLl0Za44defE/gw
	 ZkNTitV3LahJz9gGf4jWqYAR9PXiVD2kAjNzU4Vjs+PSrf+kX+NKmyvxkBJnonVWWf
	 YPY/r4hVmRtSCUvINHtaTgby9iMQ+XPv5FrcsK0Hs0ZudFqwesfsDr9QeldqzrdHyv
	 C2H7fEFwh+YlcYV/h+SQ8C5uZ97OJt+pk5tLA1NETaHz4066tLcwMIaUU/fJ9Tipwv
	 2qUzuuo2jNm5Q==
Message-ID: <63e50918-60d3-4a01-b28d-77c8580f1260@kernel.org>
Date: Tue, 24 Mar 2026 14:48:15 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v12] media: Add t4ka3 camera sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>
References: <20260323071647.38086-1-hpa@redhat.com>
 <0532e7b1-b3c5-4bb3-80e4-76db00c385ea@kernel.org>
 <acKREpGPr1J_1Oaj@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <acKREpGPr1J_1Oaj@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56884-lists,linux-media=lfdr.de,cisco];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B7CA1309C38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24/03/2026 14:26, Sakari Ailus wrote:
> Hi Hans,
> 
> On Tue, Mar 24, 2026 at 02:17:38PM +0100, Hans Verkuil wrote:
>> I'm missing an entry for the MAINTAINERS file.
> 
> Thanks for noticing. I already picked this and it's in a PR... there are a
> few other (minor) remaining matters, too, which I asked Kate to address on
> a follow-up patch. Would it be ok to address these at the same time, after
> the driver is merged?
> 

I prefer to have the MAINTAINERS entry before I merge this driver. Other
minor matters are fine for a follow-up patch, but a new driver shouldn't
be merged without the corresponding MAINTAINERS entry.

If Kate can post a patch for that entry tomorrow, and you Ack it, then I can just
add it to the PR.

Regards,

	Hans

