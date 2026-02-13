Return-Path: <linux-media+bounces-52721-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJZlOVkNj2kgHgEAu9opvQ
	(envelope-from <linux-media+bounces-52721-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 12:39:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B712135CB0
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 12:39:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 72FFD304A2E7
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 11:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EB043563EE;
	Fri, 13 Feb 2026 11:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Dcif+B80"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129A729DB88;
	Fri, 13 Feb 2026 11:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770982737; cv=none; b=DbwOnPFPM0L8pqjI7VbfQWR5xGgOSXTWDHf7SeLITenHcf3SpaflonVmtRs4B7q97EVRd8nYl8EO/Gb7XprtBsY4cEoxFSfjl/qMerP3XgZZQMBDiLfQsGu8R4Q+ZqBlFF+3gIMale7hijpUB39nVvvArml+lCTR6fUgvmMHT4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770982737; c=relaxed/simple;
	bh=s2ex0WsY/tcJGCKfZLLFWSjCycCqG28vgIHmkb2bwhM=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=D49qfLpF1Cr90MAnKF8Ao7jaz1JRTAtpJ+tepv1BITVsLRZa+liNxC6yBSKPC6FfWnIB7rFwF9kIRDHBhWpVnEYwylUDeMNj8Q8XRMjWOBmvAeK88MMhfOrxfOBprMzATw87J0kG47OFz8kCBdfX/QYX/2sK8yFCuH/BdYbXzbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Dcif+B80; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1770982721; x=1771587521; i=markus.elfring@web.de;
	bh=SPZIee0ihLwDM9z/oymVIFG7hxj9h25mUr35Mvb3vvM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Dcif+B801vETyhJcjsHu9V1qHPFVHz8HWCzpknrPLCQU6psNDYOcdqtWUKEuxKIm
	 DDK3ovFKXEL73CU1vqfvpMaLAQLxpXM0Em5wwXlsxyRyVVn39urILG8HYXTN+/WX8
	 j9Qqy1IM5glnH88HdNOugeYk5Fil4aAfdCOu2Rib8J17Q2bK63R+oc8XxEeufBG8S
	 nMmqK+cxXCjNoUItQ52HTBfV0rjhIUtd1w4KdHFZkPs2M9zf5/x+IfqRMVnWB/gU5
	 g0hoNYOCJ7vy+EryxOXMgAlquGGSIlvoACIVJ08JCwN1UES302tAhDFduHzyRCKAL
	 mBLtkU81IbwLxnycPA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.207]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M2Pda-1vn09v04zu-009cb5; Fri, 13
 Feb 2026 12:38:41 +0100
Message-ID: <c4938298-41b9-43c5-bdd5-96f37536ffa6@web.de>
Date: Fri, 13 Feb 2026 12:38:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alper Ak <alperyasinak1@gmail.com>, linux-media@vger.kernel.org,
 Jackson Lee <jackson.lee@chipsnmedia.com>,
 Nas Chung <nas.chung@chipsnmedia.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20260207103224.609938-1-alperyasinak1@gmail.com>
Subject: Re: [PATCH] media: chips-media: wave5: Fix possible ERR_PTR deference
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260207103224.609938-1-alperyasinak1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kAtMIxPeoCjPwjSHIY2YcEH7DvEe3s+rnugdlocjzGkBPKqhMR9
 /lb3pkL2RexS+IypRH8EhsJeBftqJlvF56hrrq7WfnZ12EcEZdn8VsTCvsrwtb/W7dGmOZA
 lTsJayp2F1iuxkaPXVYPMF2/McfsbzBf2oxgaD/OkViUr8L68sZ2kHXapNLWAodotlnHjsU
 csSWj10+hjxHKQQocRVvA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aCli5wizbR0=;IpeAf9CmvIiWJLQNnbDAnQ/GD50
 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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52721-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,chipsnmedia.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[web.de:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[web.de]
X-Rspamd-Queue-Id: 9B712135CB0
X-Rspamd-Action: no action

=E2=80=A6
> or ERR_PTR() on failure. The return value was not checked and in the

     error pointer

=E2=80=A6
> Add proper IS_ERR() check after kthread_run(), log the error, set
> dev->irq_thread to NULL and fail the probe to prevent the driver
> from operating in a broken state.
=E2=80=A6

See also once more:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/stable-kernel-rules.rst?h=3Dv6.19#n34


Would a summary phrase like =E2=80=9CPrevent error pointer dereference in =
wave5_vpu_probe()=E2=80=9D
be more appropriate?

Regards,
Markus

