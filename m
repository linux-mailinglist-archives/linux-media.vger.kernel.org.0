Return-Path: <linux-media+bounces-66093-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5Fz6Hpa9Q2rngAoAu9opvQ
	(envelope-from <linux-media+bounces-66093-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 14:59:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AC26E4872
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 14:59:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=i3NzVyTg;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66093-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66093-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD952305BE38
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A78240FD86;
	Tue, 30 Jun 2026 12:53:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F6140BCCC
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 12:53:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823981; cv=none; b=qLIuCugLnyDwl8bbvxcvi5kRy75fWK7mLcpJFeuBhywHjMZIP0nwzPy9YS3hvXZhHCLkmmSLn0whDKCRgfdFytMneqlDsxDJLD27y+N5LozQb1zYY5C0ratfp7do96ejDyZ6KI8NU/i+mrPnahujM72YQkFuCQ4c9Yl53P3hRi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823981; c=relaxed/simple;
	bh=DJeK4emkOflXwjl/mac/si0g6PHw3pIUf55mgtIYcVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ro2OHy4BFBz96jbcOx4KMN7fPL85w7TsJC7muHohw7tyh2yUw5zJdMIa2ncQHcYwzkxSPCZifgqJs+/ICbc7190avn+cf+1pPTd2N5FujeITXvRki7qEUhzWMfrb2qTqB2XkWmgTv7V+H6WH6+voLLhH8dmLUPnMXZwVYGmuOx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i3NzVyTg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF5ED1F00A3A;
	Tue, 30 Jun 2026 12:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782823980;
	bh=3eFIvaKAkvwnwvhwdzZi33rTkXErjVUnJ11p2qd39jY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=i3NzVyTgAcTZVw8J5cfMUpQP6hokw/WQwBKYx/BaA25NmkQxjT0Rv2h1mZeVcWjyG
	 4VYW9KoRFsKHEOr3C7FKcVBcPa7NYonFUWVJ9VnkSCzn7nNWV3iKfzuvmYDMpJaUwr
	 j9ntnowRra5SglhtzwTG6mepzCJnLLtcoT4ucrh/tgav8EkUGRTeurWfxT3s/Bjzdn
	 XNchxsf0JoSzW7T9sOotdjLIrhsgWP06ADdjKiQdXbtRcN8GcmfZs95zlO+P63khSu
	 hFHs60Rv27Lyh3gjlpcztStFpXrDGumFLkdYPgrJFwu/wFf9Y1IkdVcbqbJ6AegECw
	 mp7vqtWhz15vQ==
Message-ID: <d8523330-2094-458d-b346-5f5a195d4986@kernel.org>
Date: Tue, 30 Jun 2026 14:52:58 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv4 1/6] media: core: v4l2-async.c: unreg subdev if asc_list
 is, empty
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Mauricio Faria de Oliveira <mfo@igalia.com>
References: <cover.1782716154.git.hverkuil+cisco@kernel.org>
 <2cf4473a9c16d0715aa081e234bb36c70fefce3c.1782716154.git.hverkuil+cisco@kernel.org>
 <05d38e6d-5f18-4d70-983b-1a28ddd22535@kernel.org>
 <akOW0ioLKG7WxFHH@kekkonen.localdomain>
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US
In-Reply-To: <akOW0ioLKG7WxFHH@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66093-lists,linux-media=lfdr.de,cisco];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:mfo@igalia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F3AC26E4872

On 6/30/26 12:13, Sakari Ailus wrote:
> Hi Hans,
> 
> Thanks for the update.
> 
> Did you notice my comment on the subject?

No, I missed that :-)

Fixed in my branch.

> 
> On Tue, Jun 30, 2026 at 12:02:53PM +0200, Hans Verkuil wrote:
>> When my em28xx USB device that uses the i2c tvp5150 driver is
>> disconnected, it crashes.
>>
>> The cause is that the tvp5150 i2c module uses v4l2_async, but
>> the em28xx driver does not since it predates v4l2_async.
>>
>> In that corner case sd->asc_list is empty, so
>> v4l2_async_unregister_subdev() never calls v4l2_device_unregister_subdev().
>>
>> Modify the code so that, if sd->asc_list is empty,
>> v4l2_device_unregister_subdev() is still called.
>>
>> Fixes: 28a1295795d8 ("media: v4l: async: Allow multiple connections between entities")
>> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> 
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 

Much appreciated!

Hopefully once this patch series lands it will finally stop people from posting
bad em28xx patches 'fixing' the syzkaller issues due to this.

That reminds me, I need to add a:

Tested-by: Hans Verkuil <hverkuil+cisco@kernel.org>

to this series.

Regards,

	Hans

