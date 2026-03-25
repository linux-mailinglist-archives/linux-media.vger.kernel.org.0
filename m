Return-Path: <linux-media+bounces-56974-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOb2Jn7Aw2kRtwQAu9opvQ
	(envelope-from <linux-media+bounces-56974-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 12:01:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D470C3236E1
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 12:01:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFCC3302410F
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 10:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4693D3C4550;
	Wed, 25 Mar 2026 10:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="GRGdFnKw"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2463C3453;
	Wed, 25 Mar 2026 10:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436097; cv=pass; b=IoCNDltWqKYOVAXddY8WcqvmbV7/06bkP484EDQ+4xfFq9miDmS/swp/72DMLPw/rRn2WONvdu3EAaMgtW/6La68Fzn4TZPEGQSP9y8kOVpViMhipcvG7Fy1F6n1Pw7IYy8VA4rPLxcwrL1AS7dUt6cwq4wanGU2uCG+DJ+MyBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436097; c=relaxed/simple;
	bh=Kcnxc72wj1ctUdzzQwTa/frrDaQ+LdK5SDzzbWAVHCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aAkbZST8pub/VQLq35bHy8y3ZFHabB3Y7clNiKOvZcIEKjbKWn4IdonlMocuAsb60iokB74SM73vya2vmZLUm8Jqj2FipNl5YNWVZ7NuVpyUNdSvmlqNK4HNshaxqDCrYMEqSHOP2pqVxnj0Oe8XQ5Ftomx29eHeAPrp9kctLxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=GRGdFnKw; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1774436069; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jGWxXoI4Fxqx9ftKhBp2mvazwVpUW0HDji9YuSV26ACBDCI+smoWI5oUdQsM6xlOZ+dEpGUqOwU152MGjeMqvujLR9kAD3tuFgAEMfZ1ytFzAyzM5lar6RjqUImkqh3CJpKswqjeKFiPhQevSFjQvlPQR/aVubUed69J/pn4tZ8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774436069; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4R+g7a/6PRxwSQaBDvJIaVNLCDM/f6AmvMh/P5pv3zc=; 
	b=kqldyP0bOC9wgr/ms0zIgDRjFFkizSYbwz0qa5l2VXyJWJvJdU+qVZfpUqfG4aidvJSefDc1qNYkDl+4yuT25mdRBY0jPFHGk6FZwac0f+dp4Dz1xTHKwStlmWGoZEfBPFhVf0Pwlnns+ww1Wz4QaPJ/oLG+87VRO6AHNBqgJBw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774436069;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4R+g7a/6PRxwSQaBDvJIaVNLCDM/f6AmvMh/P5pv3zc=;
	b=GRGdFnKwIcf6go3L5npFnz2a/Iz+cN8J/ed8ULL/XMc8XDOLzPjCzpjlsR+877AK
	/i0eIHBmUWVsDsvPUBxn96Nq8wYi3Lh7YjB4+QEKJON/yImImUaCFuKr68RDV51Lcet
	pK+uPm1sy13oak2metBV9dMXgiOgU2/kP1v9Kho4=
Received: by mx.zohomail.com with SMTPS id 1774436067747177.4963352124538;
	Wed, 25 Mar 2026 03:54:27 -0700 (PDT)
Message-ID: <d5939f86-d61c-42b1-a85a-e81b0a358240@collabora.com>
Date: Wed, 25 Mar 2026 13:54:19 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] media: hdmirx: snps, rk: Fix HPD hold time
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Ross Cawston <ross@r-sc.ca>,
 kernel@collabora.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260318192619.3910060-1-dmitry.osipenko@collabora.com>
 <abxfd7SdlaMWag_-@venus>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <abxfd7SdlaMWag_-@venus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,r-sc.ca,collabora.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-56974-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.osipenko@collabora.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,r-sc.ca:email]
X-Rspamd-Queue-Id: D470C3236E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 23:45, Sebastian Reichel wrote:
> Hi,
> 
> On Wed, Mar 18, 2026 at 10:26:19PM +0300, Dmitry Osipenko wrote:
>> Increase time of holding HPD pin low by 50ms. This fixes EDID change not
>> detected by sink/display side.
>>
>> Fixes: 7b59b132ad43 ("media: platform: synopsys: Add support for HDMI input driver")
>> Reported-by: Ross Cawston <ross@r-sc.ca>
>> Closes: https://lore.kernel.org/linux-rockchip/20260209061654.54757-1-ross@r-sc.ca/
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> ---
> 
> The prefix in the patch subject should probably be
> 'media: platform: synopsys: hdmirx:' or 'media: synopsys: hdmirx:'.

Good catch

-- 
Best regards,
Dmitry

