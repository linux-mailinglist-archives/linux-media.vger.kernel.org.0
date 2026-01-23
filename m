Return-Path: <linux-media+bounces-51424-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPLvMsiEc2kDxAAAu9opvQ
	(envelope-from <linux-media+bounces-51424-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 15:25:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BED276FFA
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 15:25:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 308B7304E6F2
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 14:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B93D73246E4;
	Fri, 23 Jan 2026 14:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cwl68DKq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2AC163
	for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 14:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769178189; cv=none; b=lby4HG2PvKpU55ZuTTNdDOJxnsE5T++pjReBzw7/a2sy/D77pIf24DXFVoAuZOSOSUO/xVkSoHtMzaB7Z+bJbJBpJ3EVb6Y/ixb263FGRAaExcjrtpX4QX0ioy0nB8dhJulNirDTv312KlxRw6VKvWehmN+laSobd/Ebn+BkmOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769178189; c=relaxed/simple;
	bh=SSeTmZTeEXBCl3QevNeqEejLOlgzZ3iuo2zXS18zFNk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=iHx22sPF+x2SigsKCzn+aslqXQZgXj3owgKeQIgkvIsT1gxIljIIfSarCuAUCz+hPrkd6HeJOXTQ4ayjU8qshC/cmSjlavbAZ3GMihwWIda4EO6r+9Gg3heQkbx6QARa1gWrVxEkwx8/LT3QCIZskuCW8Tlh9MgUmQ5DcgCk61k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cwl68DKq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE3EC4CEF1;
	Fri, 23 Jan 2026 14:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769178188;
	bh=SSeTmZTeEXBCl3QevNeqEejLOlgzZ3iuo2zXS18zFNk=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=Cwl68DKqtlazcx8eNfXcd0Tw+OZs7f9sJijK4FxDmZidhSuE5Ggn1tbEeabKBg2d7
	 qSufOXhxgXqmrwrD3yifaz2t8gGitugFYhnq+xCfqgUHpqhJdvMtKD0YDjRczjImUd
	 /97OFxUQCaoduRT89cNd6xqz4mi5Z4yDfvs4sei+Wd2U/IV9zTo9AcdS6uGe5XhnsO
	 rfzFgDkjGluyAS0u8aT21Z5rwgxjjYWWowXHNyw41JzKxxiLpnzhrIHfl8IctoXWSw
	 h2chCIkB/XrRKrVy/k82MT6KbjEa/7Fqzafk8op4R8/Cw7RdvE6P+vtGZXZsZuccMp
	 JMQTudOt0XmHQ==
Message-ID: <2b23f2c5-215c-4f9c-8808-229ac526b84b@kernel.org>
Date: Fri, 23 Jan 2026 15:23:05 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCHv6 1/3] docs: media: update maintainer-entry-profile for
 multi-committers
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Young <sean@mess.org>, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Ricardo Ribalda <ribalda@chromium.org>
References: <cover.1761571713.git.hverkuil+cisco@kernel.org>
 <1495ec4ccdcdfab788fa9d02e11a6028a455e31b.1761571713.git.hverkuil+cisco@kernel.org>
 <20251203104328.23d3139c@foz.lan> <20251203110013.365716b6@foz.lan>
Content-Language: en-US, nl
In-Reply-To: <20251203110013.365716b6@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51424-lists,linux-media=lfdr.de,cisco];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0BED276FFA
X-Rspamd-Action: no action

On 03/12/2025 11:00, Mauro Carvalho Chehab wrote:
> Em Wed, 3 Dec 2025 10:43:28 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
> 
>> Em Mon, 27 Oct 2025 14:28:31 +0100
>> Hans Verkuil <hverkuil+cisco@kernel.org> escreveu:
>>
> 
>> On your version, there are 6 types of maintainers related to media
>> subsytem, plus the ones on MAINTAINERS, as one could potentially be
>> a "media maintainer", a "core maintainer" or even a "subsystem maintainer",
>> being responsible to update patchwork but still not having commit rights.
>>
>> I don't think we want that.
> 
> Heh, I should have read it to the end...
> 
> From:
> 	https://hverkuil.home.xs4all.nl/spec/driver-api/maintainer-entry-profile.html#list-of-media-maintainers
> 
> it sounds that you're actually proposing exactly that: have a mix of 
> maintainers with and without commit rights.
> 
> On such case, I think we need to define them as something like:
> 
> 	Media Maintainers
> 	-----------------  
> 
> 	1. Media maintainers and reviewers
> 
> 	- Everyone that has an entry at MAINTAINERS for a media-related file;
> 
> 	2. Media Committers

I wouldn't make that a separate class. It is irrelevant in practice if
a maintainer has commit rights. The only difference is that instead of
posting a PR they can commit directly. That's only relevant for us as
subsystem maintainers.

Developers care only about which maintains what and who should I Cc.

Regards,

	Hans

> 
> 	- Subset of media maintainers that have commit rights
> 
> 	3. Media Core Maintainers
> 
> 	- responsible for one or more media framework;
> 
> 	4. Media Core Committers
> 
> 	- Subset of media core maintainers that have commit rights
> 
> 	5. Media Subsystem Maintainers
> 
> 	- Those have commit rights.
> 
> I won't add (1) to List of Media Maintainers session. We have already
> the MAINTAINERS file to track them. Keeping two files updated with
> the same data is confusing. 
> 
> Also, we need to plan a cleanup MAINTAINERS, pinging and eventually
> drop or replace inactive Media Maintainers.
> 
> 
> Thanks,
> Mauro
> 


