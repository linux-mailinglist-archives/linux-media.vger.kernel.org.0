Return-Path: <linux-media+bounces-51881-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sE3gHFaifWnoSwIAu9opvQ
	(envelope-from <linux-media+bounces-51881-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 07:33:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CCEC0F82
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 07:33:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14E84301DE1B
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 06:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6BD3148A6;
	Sat, 31 Jan 2026 06:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="tPiDe9GM"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEBD3093C1;
	Sat, 31 Jan 2026 06:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769841202; cv=none; b=VHJJQRPmRKNLloRUSkYxCAQEjkLtVTCe9BYvx50UVDQo5qzpNg5PhYNOsea71PxKCapve3sn1TuSdI2sHe/BQIw2yu+VwqsDk/vYgwTVCWIrk2/5+iZP+B5QsEJ1RgZLRrlRwyyT8jHO5fEA+eFKKWsFMZ1CifzVY5hv3iNQFX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769841202; c=relaxed/simple;
	bh=Sk30x7IKpAiC5ZBmK4z860az2B2mDPfat7WQedHpveg=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=mch92bpCa9LmDj56gWktxdDlX2bevyVHVTNk5Xgh/x32Rm5TOEwbaFWZF9EdsWzhIK93Fa81gyzWwayQ2vZqVMcFZXj96Ta3SI0etqdQqip/BtUhr/JNNi+tjl6ELX/UaMDAUKKCPn8ueH5+CVCJa2RCkftN0FyDnyKDtSpccYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=tPiDe9GM; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1769841192; x=1770445992; i=markus.elfring@web.de;
	bh=Sk30x7IKpAiC5ZBmK4z860az2B2mDPfat7WQedHpveg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=tPiDe9GM0rHI63aazvTFT2kPjhCe7q2ewCEvRBBYkWik/aYXdLMX8V5WhBD2FAxO
	 kLGRCj6uOtzJz43KIs/CVPdUKxMzrunAoXw7npoIwgBq1hzAvnYRTtLpXI3AQQXT3
	 Uk9Z4IgRk6mWTYBX1bvt22DZJiStuuAbO5QJlxEAmhLOnqNXeM1hvkBe0cA7xasSb
	 KcbLLECH1NcREU3pGUiVyIohSRXLJVCXn4EQB2jTmqPU9+PmFP6gRm0gFcPZMIZeP
	 gsJB+XbO2ihAOxnekAeafYxQ+f5OyCOWswJk0WOa1IEXKEiJprg4USKTVL9L1EkFT
	 wKg3kY5WmcyPRVm5Ww==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.223]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N1d7i-1vsZtn3U2C-00tWgc; Sat, 31
 Jan 2026 07:33:11 +0100
Message-ID: <62bab62f-5fde-437b-a7cb-4426d57004e6@web.de>
Date: Sat, 31 Jan 2026 07:33:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chen Ni <nichen@iscas.ac.cn>, linux-media@vger.kernel.org,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260130042043.2988065-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] media: i2c: vgxy61: Check return value of
 devm_gpiod_get_optional() in vgxy61_probe()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260130042043.2988065-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:C8tebCskp2fzwgeOi4l+cHfw+5WBynQdmr7WvEZ3TxwHUmalKHK
 uSPtQkZyLA3q5a+hcwh9JdUcZ8YI/ruKRord6qxxE1q3tUjnE1I9s8lXsNlAWcR9mVGVa5o
 bS4pIFBoxx0/Nqu1yCZCj8ozQxunj9+QEts/9XImM8jt0GQzdX9YdLX1/1rRzNqKCuiVBtH
 bRmpPzQGabI+Ozmu3rk1w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:v2NTI1uZBrQ=;40UfJ+7y8OjMtSPS2PoOYIgqSgU
 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
 x8xzvtkn4OkVrOJjAsa2HolzvPp2q
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51881-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[web.de:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[web.de];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 13CCEC0F82
X-Rspamd-Action: no action

=E2=80=A6
> Add an IS_ERR() check after the function call to catch such errors and
> propagate them to the probe function, ensuring the driver fails to load
> safely rather than proceeding with an invalid pointer.

* Were any source code analysis tools involved here?

* Did anything hinder to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?


Regards,
Markus

