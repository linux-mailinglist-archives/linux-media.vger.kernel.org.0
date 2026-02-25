Return-Path: <linux-media+bounces-53315-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPE9B92jnmlPWgQAu9opvQ
	(envelope-from <linux-media+bounces-53315-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 08:25:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7420C1935C8
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 08:25:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06BC7309E06B
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 07:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 892F92BCF45;
	Wed, 25 Feb 2026 07:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DUQJ3vmp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RxreKDhU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074A528750B
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 07:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772003218; cv=pass; b=g88IEXbXtbqjRR78vsWpeyN6u2XMtSQGdbHs8ft4teEUKselPsSJfLWzFHkCIlNqp65ck57K108pzcEtRpGKZNiFO0iP2sdDQaRcOAYMmfTzvt053smr+pCFWo8LCsbmRNXPiJ15JRnhtzDvs4iN4+ZmcJ8616IIVESV0zGiw9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772003218; c=relaxed/simple;
	bh=6jedk5b8lwL6ojvkceAkX24NwJEm2kKc92vfb/gSp3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TL0InN5Hx5eXiAv7z3MjpgRQOy0lp9rL0jzemOfi6Fqm54iILZuSTVQ1QKzgov2mwJiFuZP97OiYWHJfzbAPxxMz4596FWgqv78d96Gg7GQ6bRdXj9aiCP6bZPEQlA8geIBDzHu8OgzaEqMq/7GFMBquPZ7QWkbBd2m7wFK3kTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DUQJ3vmp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RxreKDhU; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P33TXL057136
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 07:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6jedk5b8lwL6ojvkceAkX24NwJEm2kKc92vfb/gSp3o=; b=DUQJ3vmp4/U18oMl
	nXQdyKKCK5JLc+aJ2FSTOsDrN6Il2mkszwy6jYmiius8IvyA4Khcf+IBhzfymNEI
	KVo1EVIgFB0Pd35E0+dDaaM89TsZWAJXRKEaH0QQK9keY/Q4zvmQs8y0KqVUENbV
	rWnYpxfWBuO82hVqe19CaeaYkkZLIYVAJnbJlgk8X/AQ/Xrq+980ZucvMZ9S2/58
	9iOvLCI2UR8kYugeiSyYGjvAvq9bgXCs3r3wCe0Pc21pQ2cZR903WNxwmk/CBmUQ
	0VHVRUi9fi6kCKNS5U3CHj2/FNSThyWtzTaBKx2J3VUsa1c/Xk/PpOajXoc7MMcY
	V6JA9A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch9sabky9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 07:06:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8954803bd74so70044586d6.0
        for <linux-media@vger.kernel.org>; Tue, 24 Feb 2026 23:06:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772003215; cv=none;
        d=google.com; s=arc-20240605;
        b=jPlkolZ2n3mTfMgXwiD5i2CMHlQEvSBPJWL2Tkdmd/LZfyk29hv8QyBZKsXiEDl6Rs
         b/erFw7sXeXvqyaWIuYbcFPSMDqTdMQMl5PaW/P6dao8qvSE8nWnDftCQ8CQMa9nety1
         b5+eTxZgM42lk8hBw8hkMxQ5aCbyu1wGjUhnw6y95h97D9yQDiBmVelhRG77gFDNwZVm
         pYrMU1QTIDO4jUOoJc5mWbVAuDKDgTdkSlgoZQDOg8zJMDlH+J8gMp2t1ro+2UQCJmF4
         UfNqySCzMdyZzYvN9zoUQGY9zVeaHz6k10GYgFCv//uxQjnSpavC+WoiMer8JAQGTVs+
         KMTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6jedk5b8lwL6ojvkceAkX24NwJEm2kKc92vfb/gSp3o=;
        fh=79FwLkNTzEcIfxnPTlnVbihre3/5kf6YaxcJUhHvhoE=;
        b=a6VFMm0GYdwBZebdoGyYhXoHfVqs7JKnPSF7+1ktjsxEkbe4e2DoHHDgduHJMhzZlm
         MvZNOGbPAfEgmLuAs6VkfkpWpLnWIsLewyVmoIZR3wRrsgcdSi0xnfAql6EQCA7/z4UX
         JqDr8X3ZoAg/pB4TWv/rQU2LS/bJ6tD4fe1OkiNSsflyJo0BlmoFPEMknEf0M1ZQbbCS
         2VkPInmIr3l5nXjP7ulBZy9hRqWUlb27lGQIbjihWgxSZYao6T7KhkP22nH7G89j1Llc
         nk5t4QZx9kX4INBTbb2Ludj5v+bfQfpCaIvTSO4aiwTA1bRWGlfhm5Oig/vGwdBEpg4S
         KVRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772003215; x=1772608015; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jedk5b8lwL6ojvkceAkX24NwJEm2kKc92vfb/gSp3o=;
        b=RxreKDhUgvO9NQPY/+7EH0asEtepOouMxA/06ymqqGpNQ4lDdDRBfQc5Dtt2L33PJD
         hiWFe+Ryv7MhG+5qDTNNzl7QkgDem9KE8btYZchWb4fzvPRnHijWBy0Tk61vkpcbpwmJ
         i3URyk2tCIntv/0a6ml/ATz2nNMgR+K+egb+N73iy2DEhKP+8NUfDasR8ZnX2NLlI2e0
         nco6SX89SdTY4CEdGkSc5gm8lIXS/JZ1ONeSTfFNvsMU6DRY1B8N1VWGcvrNfRijWZ36
         Ne72IXRLbw0hKyEQiNe6vKMyQ5c4mBY51eK1+ZK1JlN4PLspS1XBz5REhL/sIUsDDcBo
         1WSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772003215; x=1772608015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6jedk5b8lwL6ojvkceAkX24NwJEm2kKc92vfb/gSp3o=;
        b=psTRav+7gGQi3ypGRFIsZZo+glFEvMc50S4dHP0ECH1SRU0ItqhzKvBpXY5PoBAV1H
         QChXm+NEfZNGJ9VG7jg62Uckm3gWXDY0V9VXrHPxNvmsxLhVywRuXL2uLqZCn/5gkKNv
         HBXD8YqLo69rkPYNmOpeWVhIIKU33WaCo2Y5QnRd87txb0A2qxNXYCwZMOXY6nKaRaCg
         RyL6FMTaI9+PAN8sUHlED/x7Ts9pY3/uZdOTEXBGkSvczEY0LUt1PTlhKsoH+1lWVC7i
         TT1npBFWDe5f8CCJSgUjSJq45edBnn7U7Nu/KPebqWyQ7CwwzjJhtFsUgebUfPP/bSGM
         OOjA==
X-Forwarded-Encrypted: i=1; AJvYcCURZDLxyUO+5v5gvd1RgZFKsXqb9HKgo+70ADeQbqJJnNoY3DgK64BKHl4NT+CC6K03TxM0QSgrlnRMfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMtmWe3ecmSWjQMx+Mpz7DnHKdJascgNPJKBJEQblhQ0CyBaDL
	VNaee1gWNQ2nPWU8w36jioDDpKcJAyM+lRSmixWFjJybYlcQU5p8NCP+dg74CCSj5hVRnRHp2sa
	sscMu4qn45RXHMI0wfqepOhpU6zkWUYxwn7u3opc20CSLqjk9Gh4w92gUSQMafHhHnEL7Zpr/w6
	xa9i/1YC/eEYP2fcVxoXiiTlIoKdjBzMplDDidy7ZD
X-Gm-Gg: ATEYQzxnPfu+JEQ+9nPT48k/jC6BWZpil2Zm51gVuXudUQPZWXBIrf+V/cFW3+d1apc
	UADyyuYdReSigFwHga4qBGS9yGYyZvlXTaR7113s1A9QW6QpeuuyxGeOg91am0zmGw/nwfXdJqc
	83WC0TTmRIQ0LoNxDulh8f+iBM/OF4KN0fz8oNYFoDfgDwFHTi029KSCtw4pGTzsl/5Zpux1Esu
	IRcGUH69QIfjWALJZ36Wj2NzIaE0x+rASF2WLU=
X-Received: by 2002:a05:6214:509e:b0:896:fa50:4c0c with SMTP id 6a1803df08f44-89979d63e82mr227114366d6.53.1772003215244;
        Tue, 24 Feb 2026 23:06:55 -0800 (PST)
X-Received: by 2002:a05:6214:509e:b0:896:fa50:4c0c with SMTP id
 6a1803df08f44-89979d63e82mr227114216d6.53.1772003214811; Tue, 24 Feb 2026
 23:06:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219152737.728106-1-loic.poulain@oss.qualcomm.com>
 <20260219152737.728106-2-loic.poulain@oss.qualcomm.com> <5d5cf1ab-ba3b-48fc-abc5-5fce86c27c9c@oss.qualcomm.com>
In-Reply-To: <5d5cf1ab-ba3b-48fc-abc5-5fce86c27c9c@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 08:06:43 +0100
X-Gm-Features: AaiRm539ntmjMqjEZzvDlOnzaPaPKHMk4zproJmWAUp_2TgLmPBzR-2ZXRNbvWY
Message-ID: <CAFEp6-0etP-e=4UTs6=4kqsrh-0iEY=UQj6H-m9c9Sq8=D6kJA@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: qcom: camss: vfe-340: Proper client handling
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, rfoss@kernel.org, todor.too@gmail.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA2OCBTYWx0ZWRfX8XJ8s2Wyb0N3
 CynO2eJfkGnfUiRHhxMFr7PcnSz439F7YF/ARVHiN8kLkk9XDJdNB4xUr7B8SrWUe2S5laSk1l9
 5JBS6cA8+MMMvGq5PzW4eHMGm8fWNppIe01ceZDCN9ghISiR22a+GX6zs1v1MBMUtAV2kQqlGm2
 rP63rddHoA9RuOBsvOlh1wUr5fFZkc7MRVmNfCFELv+LFWvxTpZWgBKG1aVRW+vZOAnLyI6GAzi
 6vYwUO2qdJT3R/tR2fWr2Af/dndMhAPYSI9FUJdCcPevhnf4Wqz6D6QHQhNNLcLm24OK7iNs5r1
 kLMSV22uRPqYlgyA39eeG332Oyi7Y+JaQGUdd+6QLVhtrGojRuHtZuwwxC/YEzM9kPOgBXd5iiN
 Hhsj459alnw0slHlqSwaABkrBPv5+ZNIRIa2jgrrozoLlwyk1ze7HY14zFUJZ3JWjphw5Lbe9zx
 laIFkbm9edC5dUTFIeQ==
X-Proofpoint-ORIG-GUID: B5WoY9ty6rjL7DAKSUw732NiW_WmDhCR
X-Authority-Analysis: v=2.4 cv=e7ELiKp/ c=1 sm=1 tr=0 ts=699e9f90 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=78OocEQVKo9_0ljsv9sA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: B5WoY9ty6rjL7DAKSUw732NiW_WmDhCR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250068
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-53315-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 7420C1935C8
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 4:29=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 2/19/26 4:27 PM, Loic Poulain wrote:
> > We need to properly map camss WM index to our internal WM client
> > instance. Today we're only support RDI interfaces with the RDI_WM
> > macro, introduce a __wm_to_client helper to support any interface.
>
> Do they actually differ between platforms, or can we simply remodel the
> driver defines?

They can differ, yes, not all platforms have the same order and number
of write engines/clients.

Regards,
Loic

