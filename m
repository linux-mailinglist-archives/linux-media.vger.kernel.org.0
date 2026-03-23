Return-Path: <linux-media+bounces-56738-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CnKDuxHwWlGSAQAu9opvQ
	(envelope-from <linux-media+bounces-56738-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 15:02:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF542F3AD6
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 15:02:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E8DD7309BEE6
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 13:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8283AE1AA;
	Mon, 23 Mar 2026 13:53:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.auroraos.dev (unknown [95.181.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E05F3AC0D2
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 13:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.181.193.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774274035; cv=none; b=eHKj5hJAmZYbacqJy94RYh4M4QuIQ6NmL+6JFZbGq+GlQ0OqG3Qes79RUXryCtTbMOSSoCdFa3huM3GIi7EtVaGNIe85sL+DrhQA3/3GD1oKrbx6yIfWDDV7EyMdhLamgQhO3GhA3fKj8WCiHl2Hynw0alrxIo2yRprjuQFlDzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774274035; c=relaxed/simple;
	bh=iSrLix/vuPHgnVHsCa02rTzrdMVHv5oC5w/oIPs6zn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XzrRYzt5GAnsvhAoNPB7G1ieePmNg8hTiVNEQkD0rU1kel5V62ZsM98IbcL/TEfKv0QLEb+3rZTFU6Z/nX6FI8vw3y1XuqbhrgiyuqWD4mC6ux/UPq97v806vXUQYi4Jcwt10RfLB4nLuXHiy/04mfQSUE9dUJak0ejGPor8vjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev; spf=pass smtp.mailfrom=auroraos.dev; arc=none smtp.client-ip=95.181.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auroraos.dev
Received: from [192.168.2.104] (213.87.159.37) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Mon, 23 Mar
 2026 16:53:43 +0300
Message-ID: <5cd44114-30ac-4de4-8a12-8a102ec851d3@auroraos.dev>
Date: Mon, 23 Mar 2026 16:53:43 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [0/5] LG Electronics LGDT3306A DVB frontend driver cleanups
To: <linux-media@vger.kernel.org>
References: <20260321190143.21123-1-s.shtylyov@auroraos.dev>
 <69bf07c3.050a0220.8edcd.04ce@mx.google.com>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
In-Reply-To: <69bf07c3.050a0220.8edcd.04ce@mx.google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[auroraos.dev : SPF not aligned (relaxed), No valid DKIM,quarantine,sampled_out];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56738-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[auroraos.dev:query timed out];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[s.shtylyov@auroraos.dev,linux-media@vger.kernel.org];
	RCPT_COUNT_ONE(0.00)[1];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gitlab.freedesktop.org:url,auroraos.dev:email,auroraos.dev:mid]
X-Rspamd-Queue-Id: 0BF542F3AD6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/22/26 12:04 AM, Patchwork Integration wrote:

> Thanks for your patches! Unfortunately the Media CI robot has not been
> able to test them.
> 
> Make sure that the whole series 20260321190143.21123-1-s.shtylyov@auroraos.dev is
> available at lore. And that it can be cherry-picked on top the "next"
> branch of "https://gitlab.freedesktop.org/linux-media/media-committers.git".

   I have explicitly said in the cover letter that this series of cleanups was done
atop of this fix [0]. I now realize that I should have probably added [RFC] to the
subjects...

[0] https://lore.kernel.org/all/20260316204455.63426-1-s.shtylyov@auroraos.dev/

[...]

MBR, Sergey


