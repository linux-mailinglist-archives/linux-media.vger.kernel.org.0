Return-Path: <linux-media+bounces-57093-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EneE2o5xGnkxQQAu9opvQ
	(envelope-from <linux-media+bounces-57093-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 20:37:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B442F32B534
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 20:37:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5726C3034678
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 19:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C04E22576E;
	Wed, 25 Mar 2026 19:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dem62rWu"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A61F232395;
	Wed, 25 Mar 2026 19:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774467415; cv=none; b=EcXmORyZHroH08iLFNlZA560HqlWJs8zNWfjnfsCOqMAJpFdoeCqO1X5X1o9QinJwlzX16ArHZZ1073hD7PkXdRim+ESGQ4JTU11nb0uoZrA2RwTYsKxA5iBOpZ6m/E8E303FZdamDc/plKmxKbNmmeKK/YmLp7Ca71eu4WFZ+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774467415; c=relaxed/simple;
	bh=1YSlw7vByhgOFf8j1l3FPNj7qTev1y4UjS01y6xjcVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZZUsP3+CUBMPfmDGd+WI419GoMXqqOMGlc2T6LZGB3egWT2E1ANE9w4R6U8UZ5DZVSDRgpzJfmKyNoe/8X5J+p4SLXZ3pXcJVsehUkQYvWGWG8x/y0EE2hFWuu5GtCQAGhOirv3SrA52ndV7j4Chwlf5nvwSPLr/MNM2yy+TCQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dem62rWu; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774467412;
	bh=1YSlw7vByhgOFf8j1l3FPNj7qTev1y4UjS01y6xjcVA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dem62rWuCyawKu0DL8qObPiHL8QwJOGMcHZrvKHVCRvMLEtTtGHH8WrZkRgvLsGQo
	 x8LrbweNoB1UGm2IYx1psxsjquAVO4qkys6PYzEAh2a2qZ+tU3uThgr4SAJ1jiYGT6
	 S6JMI4ytm/4R6rVfsl8GeU19G6UtXvoxR3HViRY0qo/ZqnPSiG1ZCdVFbALt7wUOzW
	 /JQKGA9fMdjt/52QpPhad4qsHErhn26QeaguX86imqVKCco6CisDXYEeXJZUA0c5Xd
	 t/HXn9rPjiDQa16sTg6Lzozhi+JLK/Qd7TIeItLI/L0QakT5aa+4tmq8OUv2UwjMtb
	 1VFbPSKkAItgQ==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8DFCE17E5D17;
	Wed, 25 Mar 2026 20:36:52 +0100 (CET)
Message-ID: <3875be43-63b9-4e49-a0d8-175dd9268788@collabora.com>
Date: Wed, 25 Mar 2026 20:36:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: imx415: Drop redundant runtime PM callbacks
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
 tarang.raval@siliconsignals.io, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260324124524.135278-1-elgin.perumbilly@siliconsignals.io>
 <1378ed13-6744-422a-b0b8-02621117238f@collabora.com>
 <acPU3H9pYEwzuuOS@kekkonen.localdomain>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <acPU3H9pYEwzuuOS@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57093-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.riesch@collabora.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: B442F32B534
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Elgin, Sakari,

On 3/25/26 13:28, Sakari Ailus wrote:
> Hi Michael,
> 
> On Tue, Mar 24, 2026 at 08:42:31PM +0100, Michael Riesch wrote:
>> Hi Elgin,
>>
>> Thanks for the patch but...
>>
>> On 3/24/26 13:45, Elgin Perumbilly wrote:
>>> Replace runtime_suspend/resume wrappers by using power helpers
>>> directly with DEFINE_RUNTIME_DEV_PM_OPS().
>>
>> ...why? What advantage does this refactoring bring?
> 
> It looks like patch removes two redundant functions, doesn't it? :-)

Well yes. 10 lines saved. Not sure whether this was the biggest issue
with this driver -- surely it was not a big issue for me.

Elgin, I was wondering whether this change is within a certain context
or whether there is something I fail to recognize.

Anyway, if you absolutely want this change: I feel it would be nicer if
you left the imx415_runtime_{resume,suspend} and moved the bit of code
from imx415_power_{on,off} to them. Reasons for that may be mostly
aesthetical -- I claim better readability that way.

Best regards,
Michael


