Return-Path: <linux-media+bounces-51141-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBwHABGjb2l7DgAAu9opvQ
	(envelope-from <linux-media+bounces-51141-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 16:45:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7B746935
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 16:45:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7F614766F20
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 14:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B13744BC8E;
	Tue, 20 Jan 2026 14:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ralfj.de header.i=@ralfj.de header.b="jF65YBn6"
X-Original-To: linux-media@vger.kernel.org
Received: from r-passerv.ralfj.de (r-passerv.ralfj.de [109.230.236.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFDF43C062
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 14:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.230.236.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768919127; cv=none; b=rgoYmOk6KWgIYOfhRARMUf7bGLp44WLR9FfXSskAGwNRGIIDv/tfeq+oi9UrpzzXF5FLQhgzKTALgWWCsQMkf5ehxtxTDQSYb0Cc3GalEEZe7ZEmy2W8XLkRmgZgbAi8lkG1aiFbP5PDphC/afs0D4qfY6GSu98KMRtm/HNqY9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768919127; c=relaxed/simple;
	bh=erj8VBswtkBs6jDn5Hf84LETFLBZ+DUXrSpNY2Mb1cc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GHl89lU/Bo4O9zV5OsMKFzHQTxKGVL+EJv1qtTYTT2U53e3ChiezEDUHaDRjda606xkpKtzShF+t7CpTJLSXfQFeexeKEEHlwvx+IveGgIax2MEBlylD5EC7/rOc/rXVcoxPd5GB9sr25Gsg1BK+ZBL9R5rKlNFTZQL6ua9F++Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ralfj.de; spf=pass smtp.mailfrom=ralfj.de; dkim=pass (1024-bit key) header.d=ralfj.de header.i=@ralfj.de header.b=jF65YBn6; arc=none smtp.client-ip=109.230.236.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ralfj.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ralfj.de
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ralfj.de; s=mail;
	t=1768918793; bh=erj8VBswtkBs6jDn5Hf84LETFLBZ+DUXrSpNY2Mb1cc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jF65YBn6f6CiKn6AdrNDccZ88ccx4UHt4qYzFBuBVlOJ8hc+WY4oqz49YJYqOYfAo
	 OR1+Ir8EmGFhpPCJLcdTX9m6N0HYIm1EuBmtyiT7eq0i4JCEQXOtaSmpo6Pln+fhLy
	 hSVHcNhXTxUKlOUb1UspV5bryl/ysyKh67DaIr3g=
Received: from [IPV6:2001:67c:10ec:5784:8000::143] (2001-67c-10ec-5784-8000--143.net6.ethz.ch [IPv6:2001:67c:10ec:5784:8000::143])
	by r-passerv.ralfj.de (Postfix) with ESMTPSA id 22498205201F;
	Tue, 20 Jan 2026 15:19:53 +0100 (CET)
Message-ID: <6125311d-74f9-461d-846f-4494dae3a333@ralfj.de>
Date: Tue, 20 Jan 2026 15:19:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug#1121718: linux-image-6.17.8+deb14-amd64: Logitech C920 HD Pro
 Webcam shows flickering artifacts (sometimes)
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Salvatore Bonaccorso <carnil@debian.org>, 1121718@bugs.debian.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-media@vger.kernel.org, regressions@lists.linux.dev,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede
 <hansg@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <aS8YBLEPwF0-NtJO@eldamar.lan>
 <ba9a132e-6296-451f-8351-4045c0b72d6c@ralfj.de>
 <4rnbopkefvp6h3dwttj4h7cexehqtbuzzz4gatnebdnjzdy2li@bupytpnlk2xh>
 <2ed13f74-8de3-4caf-8972-26dd5a31e9fc@ralfj.de>
 <uboug5ectzm4s32yfgopjbcxq2uhsoc4kluaby7a4b7nzfjave@boco7oocnftr>
 <176458169204.346596.13968096833088921213.reportbug@r-ethtop>
 <0490a39a-28d9-4925-a162-5e4d498be257@ralfj.de>
 <aVfPmZ8rUm3Vf7pT@eldamar.lan>
 <58a7c628-63dc-48f7-8a46-357ca2d7d500@ralfj.de>
 <CANiDSCtX-RJrmfiK_rOqi870CK06_ONvnsvqWRZczBXY38eg0w@mail.gmail.com>
 <dc4c95e6-d19d-414a-a7ae-401dacbaebfd@ralfj.de>
 <CANiDSCuse+=+MrDUFc_Sd1zXvtY9TDrX0GF6bs2_w34b03Djkw@mail.gmail.com>
 <CANiDSCt8KFH7d6cc4zTpf10F4G=O6vmZiSj5pPC0q+_e90Cjpw@mail.gmail.com>
From: Ralf Jung <post@ralfj.de>
Content-Language: en-US, de-DE
In-Reply-To: <CANiDSCt8KFH7d6cc4zTpf10F4G=O6vmZiSj5pPC0q+_e90Cjpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ralfj.de:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51141-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[ralfj.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[ralfj.de:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[post@ralfj.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: AA7B746935
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20.01.26 14:46, Ricardo Ribalda wrote:
> Another update
> 
> Zoom has notified that they plan to land this even earlier. In 6.7.5
> 
> Ralf, if you could confirm that it works/doesn't when zoom is released
> I will be very grateful.

Thanks for the update!
I'm happy to check this once the Zoom flatpak has been updated to whatever 
version has the fix.

Kind regards,
Ralf

> 
> Thanks :)


