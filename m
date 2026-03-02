Return-Path: <linux-media+bounces-54230-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEBNFAALpmktJgAAu9opvQ
	(envelope-from <linux-media+bounces-54230-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 23:11:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4311E4F28
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 23:11:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55CC831EBB51
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 21:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ECE539150A;
	Mon,  2 Mar 2026 20:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="KILPeOl5"
X-Original-To: linux-media@vger.kernel.org
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA7E3914FF
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 20:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772484841; cv=none; b=gg250vrRvafm6cMyYTlbVUg5GsLKk6Du/n6+og6kYCs37SF9vFCL1Y1lxfqM5de/qjs4zMUnbp6dqN+mzBh+33kB2GOF1RJtvJIfFfOXbGiogBh9X+uWgUjBHiaFwWD3pCmVzx9HRAT+YDhVUfmW0BcXevR/FyAFo9Zj9DxwDCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772484841; c=relaxed/simple;
	bh=Q6ZvqAc6XMcikde9CagYwLmbE9akEWonsqqGYOAeOCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S8UHQMkHotFn4KuNeFkwWwl62RhbiHc+mQbnfhIYjmopGXSJlcTg4F68w7ubCudwilLaYHn8lOiErtWeJzrgTsq+u0vJedPzYjPzSUDCqt4ylqSDyjZq+tpnqYaPVyUfIjlGdUtnjoF8V9OySpVcgQVhJoK1X5cFkaIjzBC24gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=KILPeOl5; arc=none smtp.client-ip=199.89.1.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4fPrkp3YBsz1XM6JW;
	Mon,  2 Mar 2026 20:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1772484832; x=1775076833; bh=Q6ZvqAc6XMcikde9CagYwLmb
	E9akEWonsqqGYOAeOCQ=; b=KILPeOl5aJH+YT79HZYVdGJ3/VY7AxKEDk90tZRB
	SZrGNnqLehvnQVvTXtEByEXQCo4ag1miDfc9/rA1nHvCJH75UVquVdJXtGBD+HKj
	8qRB5KDsPJbzNRCpMpl4GxBccc8/RZsJL2kPaZZRNxENngCrJIUINHQaGhiwihon
	MLFMBgdm5ZwKu2Y+IpocmvTmals5Nqio099oJXv2uV5af/8Mx19G+Amk4tbmOLB0
	nxbg/dhi4k+jXazJCzrW1Iv29gdcFgEcGqhaJvo+9zQZ2NXVZHIH+yoPjX7kWYpb
	isFNxVM/mP5IfRBoreQRTkkuJr+sSKpRkERlAicPZz2EUA==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id pKyBdOvXmM06; Mon,  2 Mar 2026 20:53:52 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4fPrkl0HfPz1XM6JP;
	Mon,  2 Mar 2026 20:53:50 +0000 (UTC)
Message-ID: <5ca3bada-c52b-49ab-9078-cb64d69759e8@acm.org>
Date: Mon, 2 Mar 2026 12:53:49 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dma-buf: Suppress a thread-safety complaint
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>
References: <20260227165501.2062829-1-bvanassche@acm.org>
 <e1d95b76-7e7b-4dc3-a9a2-37f1d7f85988@amd.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <e1d95b76-7e7b-4dc3-a9a2-37f1d7f85988@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: BC4311E4F28
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[acm.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[acm.org:s=mr01];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[acm.org:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54230-lists,linux-media=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bvanassche@acm.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On 3/2/26 1:06 AM, Christian K=C3=B6nig wrote:
> On 2/27/26 17:55, Bart Van Assche wrote:
>> Handle all possible dma_resv_lock() return values. This patch prepares
>> for enabling compile-time thread-safety analysis. This will cause the
>> compiler to check whether all dma_resv_lock() return values are handle=
d.
>>
>> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
>=20
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Do you want to push that one upstream through the DMA-buf path or do
> you want to upstream it through some other branch?
The DMA-buf path please. Peter Zijlstra requested this as one can see her=
e:
https://lore.kernel.org/lkml/20260223220117.GT1282955@noisy.programming.k=
icks-ass.net/

Thanks,

Bart.

