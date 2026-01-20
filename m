Return-Path: <linux-media+bounces-51127-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJnsHWIRcGlyUwAAu9opvQ
	(envelope-from <linux-media+bounces-51127-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 00:36:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 168474DE5B
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 00:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E6E7B7035FF
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 13:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25D9142DFF2;
	Tue, 20 Jan 2026 13:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Wo2hYQ9I"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3607E3D4107;
	Tue, 20 Jan 2026 13:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768915429; cv=none; b=fh84afIQ47WMp8HoCfjNN8YSOO3BwYmS9aelg74CSIq/eO1oIpDcCkVaLvnVoTnS9SBk3r+gIXhTZdWycnrhrYJhlN0Qb9LrCTa4keDJb7n5qRnsFFzFpruLenzPykNcaLLQPOXefqb0JN6OWkXpiTydbF3uZq07ar4iL2aTKM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768915429; c=relaxed/simple;
	bh=nlZ6xX2lr/u9upPVXdqofa4HpJJKRV53xTtFzmbr5jU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rxvu7BzMuxw6OP21SWjXg5Fzy5lPJRqRmskQZ2K8gTqyEY2k8OqyS5AoaXoBHPTli/dhad1anVr/G9H1n6bfce72iUSI6v0aF8xK3D+UlbutDzaG+57Tskl0zjdro1utA+xMPpIhPTkRwdcA8/ryO7qG92XWd/30OJa6c/RentI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Wo2hYQ9I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6F70C19422;
	Tue, 20 Jan 2026 13:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768915429;
	bh=nlZ6xX2lr/u9upPVXdqofa4HpJJKRV53xTtFzmbr5jU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wo2hYQ9IkHX1d+nd3G7D/deN3G1JuLr/litsrdGAxUwLcAZErZIK/0ZexZ7juSARS
	 0CfAZShjpS3+OvCZVedd9D1V74pNHJFpvKSrDGUxW/Tn7wEsPdIPbrfyf/QdpH2UjW
	 uKQt2qG8jqNgzFKuM/NaWnwS+03UFhnN5g51W0Rw=
Date: Tue, 20 Jan 2026 14:20:37 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Gui-Dong Han <hanguidong02@gmail.com>, linux-media@vger.kernel.org,
	stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Jia-Ju Bai <baijiaju1990@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2] media: dvb_demux: fix potential TOCTOU race conditions
Message-ID: <2026012031-frostlike-humming-b221@gregkh>
References: <20260120121105.8959-1-hanguidong02@gmail.com>
 <88dbfb85-571a-4f65-8879-16972dd87bbd@web.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <88dbfb85-571a-4f65-8879-16972dd87bbd@web.de>
X-Spamd-Result: default: False [2.54 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51127-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[web.de];
	DMARC_POLICY_ALLOW(0.00)[linuxfoundation.org,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,bootlin.com:url,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 168474DE5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 01:38:33PM +0100, Markus Elfring wrote:
> …
> > Fix this by extending the lock scope.
> …
> 
> How do you think about to increase the application of scope-based resource management?
> https://elixir.bootlin.com/linux/v6.19-rc5/source/include/linux/mutex.h#L253
> 
> 
> > This possible bug was found by our experimental static analysis tool,
> > which analyzes lock usage to detect TOCTOU issues.
> 
> * Do you refer to any other source code analysis approach than LR-Miner?
> 
> * Will any additional background information become more helpful here?
> 
> 
> Regards,
> Markus
> 

Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot

