Return-Path: <linux-media+bounces-63930-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q6dPMznmImrWewEAu9opvQ
	(envelope-from <linux-media+bounces-63930-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 17:07:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A996491F4
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 17:07:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=seznam.cz header.s=szn1 header.b=pLa7z7v3;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63930-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63930-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=seznam.cz;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B17B03018BF0
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 14:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 111CC3DB640;
	Fri,  5 Jun 2026 14:52:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mxd.seznam.cz (mxd.seznam.cz [77.75.76.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006BE3D668F;
	Fri,  5 Jun 2026 14:52:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780671176; cv=none; b=PpaXogERD5cSSUcOAVDSUBAOYrl5lrSKItMy8bSrYidpgTdCxlgtMHyTs8GqCbsLbUp8wy6qNW1bJlsNq39SfF5gIxLGjZJ5GhzSFcTbeuk6sJU6LOCCxT4DXA2Aru0egr3oLgAgU9xygsNw4xAnI5ZtZhdW/HemaOl8BGiuHVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780671176; c=relaxed/simple;
	bh=nQfDg2cAMFcvMVUxNquY59qh0L6Dc689yPLLlWQkl+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ph74Huox6O+N/fp3kExk8E+di0N6fmHJgkiNaZ6V712Ts6JjgK3wTVWAoOLATF0sEce/T3mMWwnRbab09LzkjnE90Siv2XMNBHFiKmjHtdJIyMMmb4UkyVY/PKeg7EqJbLjh6DngfKgOwcVJR4AjvQzRWh0inZcvwj2PnYie0Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seznam.cz; spf=pass smtp.mailfrom=seznam.cz; dkim=pass (2048-bit key) header.d=seznam.cz header.i=@seznam.cz header.b=pLa7z7v3; arc=none smtp.client-ip=77.75.76.210
Received: from email.seznam.cz
	by smtpc-mxd-85fb448c55-l247v
	(smtpc-mxd-85fb448c55-l247v [2a02:598:96:8a00::1200:706])
	id 09c79de452c9c98d086e51ba;
	Fri, 05 Jun 2026 16:50:15 +0200 (CEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=szn1;
	t=1780671015; bh=nQfDg2cAMFcvMVUxNquY59qh0L6Dc689yPLLlWQkl+I=;
	h=Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:Content-Type:Content-Transfer-Encoding;
	b=pLa7z7v3soMAQhW/LRwANtgNNhKoyl7yR+UNJXQqByQqik1fBbMNr1MzQI0O4iUlZ
	 /BA6BW21Ayi3Uv8wSSCuyi0Yd1+g1dNMmzxIQtsaF1TzirzbK3NgQOSz1dUsD8oglz
	 4eKRjd1K48k0elDGZvTZYZhROKBVvhJFSQJjMbcc6F7aimBmva3dYSx4ZSAPBKo8Of
	 23WR2LkLh4HguLPN8HCB+wuAI8gEYhWr7OFR/QgIW6PIHUJIdNwsTBgWCjk81WAQaH
	 ZtSqsxrPdEh02olyQLwiN1lgU+RoPsmUMxPaLxb80qPLYRP3IlD9rVNkQNUUOCokV+
	 v9KeY7P6mXchg==
Received: from [192.168.0.240] (ip-111-27.static.ccinternet.cz
	[147.161.27.111])
	by smtpd-relay-647c665986-mvmlh (szn-email-smtpd/2.0.74) with ESMTPA
	id c0acc1d8-caa7-4a77-879e-f30b4be02d4f;
	Fri, 05 Jun 2026 16:49:51 +0200
Message-ID: <c7f35621-2bdb-4e66-ac8a-6c7fc6f80f1c@seznam.cz>
Date: Fri, 5 Jun 2026 16:47:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/8] media: qcom: camss: csiphy-3ph: Add Gen2 v1.1 MIPI
 CSI-2 C-PHY init
To: Bryan O'Donoghue <bod@kernel.org>, Frank Li <Frank.li@nxp.com>,
 David Heidelberg <david@ixit.cz>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 "Dr. Git" <drgitx@gmail.com>, Cory Keitz <ckeitz@amazon.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260603-qcom-cphy-v6-0-e50de0b557a8@ixit.cz>
 <20260603-qcom-cphy-v6-5-e50de0b557a8@ixit.cz>
 <8azU3NvUdGCvWCxLb0gz7FWkTGFL4k_xiBUPp170jiYIQjwHyRqynP_oLG4pjFkIRSY_bo91FQh9ECYlXdXrsw==@protonmail.internalid>
 <aiCiVe_LRA4DXTCL@lizhi-Precision-Tower-5810>
 <8b9f8754-48da-4b61-84b8-3688520c7f63@kernel.org>
Content-Language: en-US
From: Michael Srba <Michael.Srba@seznam.cz>
In-Reply-To: <8b9f8754-48da-4b61-84b8-3688520c7f63@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[seznam.cz,none];
	R_DKIM_ALLOW(-0.20)[seznam.cz:s=szn1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63930-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:Frank.li@nxp.com,m:david@ixit.cz,m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Michael.Srba@seznam.cz,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[seznam.cz];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com,linux.intel.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Michael.Srba@seznam.cz,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[seznam.cz:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,seznam.cz:mid,seznam.cz:from_mime,seznam.cz:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 15A996491F4

Hi,

On 6/5/26 12:25, Bryan O'Donoghue wrote:
> On 03/06/2026 22:53, Frank Li wrote:
>>> +    {CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(25), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(55), 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
>> what's these magic number in ADDR(x), if it is register, it'd better to use
>> macro.
>
> That's not really feasible for non-Qualcomm, non-vendor document-enabled people to provide. For alot of the code that gets sent to upstream we have magic-numbers for registers only, published in downstream code.
>
> We can't demand better documentation from community members who simply don't have it.
Makes sense.
>
> So, hex values from downstream in this case are acceptable.
>
> OTOH vendors can and should enumerate their registers in an upstream submission.
I thought this was the policy indeed, but this made me wonder if ALL the magic numbers
in that file were added by volunteers. And weirdly I found this:
https://github.com/torvalds/linux/commit/7803b63a1640a0a39e3ebad487b33cb2d26e778b
and possibly some other commits look like they were made by people on Qualcomm's
payroll. This specifically is QUIC, and idk how much documentation access they have,
but at minimum I assume they had access to the CTRLn register names? (fwiw it's entirely
plausible that the registers don't actually *have* better names).

I didn't follow the relevant ML discussions, but it seems to me like they should've
been told to document the registers?

And even if the documentation they have is not complete, seeing as they are being paid
by Qualcomm to work on this, would it be unreasonable to pressure Qualcomm to give them
documentation for the bitfields (which obviously has to exist *somewhere*, even if
the registers are free-form, the values do *something*).

- Michael
>
> ---
> bod
>

