Return-Path: <linux-media+bounces-63315-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOy6BOnOHWpeewkAu9opvQ
	(envelope-from <linux-media+bounces-63315-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 20:26:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A25B9623F01
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 20:26:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B3F8530BB1DD
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 18:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 105943EDE7D;
	Mon,  1 Jun 2026 18:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QVjdv6Da";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IrxghAaI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F2C3EDAD5
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 18:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338158; cv=none; b=vBus//6koH6pn5TyZgkgDT2dW2j2B7AThGvf8fYricTbitNky/Jnmdg9QNqGKF+HR64XedldMcB8TdyQyhKPQly2krnxD0lPJF1uXJ8hEBpMZqze/xTTRJdME1SxnPcVeivl2sGFBaUHaqhfzVmm8y/VZGw7YIWtJCdcbw0a1SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338158; c=relaxed/simple;
	bh=Q0VBfssifErgdqVQOL9DdzlVcV8Q1BsKWkErX6gR83s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EszYlTrPE39qvSWbo5spYTNyO43IuTi+hkZhuvj6c13dK9CiDyEq4ZbhAMajMNpvB+bTWN96KhQmutNxUXSXH1/Q2pKUJGr1Z8imv4uaWe6LVcfwNaOyV5mdsnWPcQx2WuYPqlcUPQUTKjoF2KgG4urSOBrGUahBCedjgtvYgmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QVjdv6Da; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IrxghAaI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651EetOJ3563820
	for <linux-media@vger.kernel.org>; Mon, 1 Jun 2026 18:22:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G7prPtOABqDadqiRplnkx+h7C6pmAJpXpIH0GVEtePw=; b=QVjdv6DaIaOykkrh
	EBFFhhhy39i1Wobp77SJnPRz4Ii62Ny0n4/RgeysjYfI6xWsO2PQSKyixtj3uETh
	M+WuruyY26mb/yq3E5N3kVTz8CcuIUc8U8hZkgfct0nGDd7/R47KWTVOKIdbx3pQ
	zv3KKaFDvIi52g6ysZ87NVzPJtvq4VVxy6V93ZXcsPFGFgHhFN1yRHfYT4wP8VGT
	tj0RnOjClI5rnDyWv/fyb5PhSk1VoD3tmNMtLFMFg9AE+0m9HacTGOZil3vN5nHt
	cLgTHGbcF1eapXwkhGXWMKAiHW1gnUhqdVWr2dUisKG+F/Issqu583l93JPEtFxI
	yKl0NQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6rxtjhp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 18:22:36 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304f23c55b2so3115147eec.0
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 11:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780338155; x=1780942955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G7prPtOABqDadqiRplnkx+h7C6pmAJpXpIH0GVEtePw=;
        b=IrxghAaIkRqsYQ8aeqAW80Q+QCCIWWPfiRw41vuj3aJqSPMe7wXU0ysELuh/lYLQQk
         O8yL1c53GUvDrxXFqL2xLq7QrKaD9zba2MT1qX7wX73ZZP356oP6JWY+1Tf/Z7h+20Sa
         l6sn6svsGVWhOYmIVhBrSeh6NBBxEph1GgSbBx0z2n6i/CLHw3sBabXgN32OWosRFVs0
         FAp3YLkud2KzsAlDCROG4TMdZMNbQsVWwezq0RuEl5QJME9DxeNKj0LAvDhgCFqZHJWT
         +LPt0vjRtjzfgOtmobU2EFn/4NgMQe1jcBwNOutdCQshADsuEY9Dq2bpwigHYNlgclKg
         pK3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780338155; x=1780942955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G7prPtOABqDadqiRplnkx+h7C6pmAJpXpIH0GVEtePw=;
        b=Smra8FlHqpWXyy0e9UaBNZKp6D93zd5FJGqW4ZGwGCm/IX4rN2b+luQe0qsVeo4hSq
         hGEC7PhidPCDyRBL4kgbLiDBvp21TsGe+6gAHi+aT7DXyMd9bO2PQ5dtadUM20J1wPv1
         IPTSMYQeuo3wvNIx6i1bAI2MhbV0GWC+zt0diMJ6xON+cAkOh8QR87pdQMUf9wS1ida1
         LDMZw8d70giX666SzvNw+6AhrUSznQww5RQpghJUguYSIU/fO4moNta3qt32AGQ76kJ6
         GE/jGYAhg3kpjoYzJLP9KFTh0chX+zH2W0+y1zQfefL73UhOEpw2MoFp3NI/vEhPjv1Z
         mtDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/xUOnCOQAcVS9mkvQUuY6D0AtITu0RAUUzwll0/xgpkFDLiCTNS+CCy2XK34zO5wAOTs+zZXx+E+VQqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFDXIWmIpZiwVbl3YJjcAFUdpxi6JXPQpIEb5e4jiOeqYzuWWM
	5VDiJTyddiqHXV1xAcWdo/KZgZ3foKL/EG77Mo1N5h0wkK6WvBsSbzUx/ubOzKNlDu0O0mas2M2
	tIiJj1+Yc29fnRJzZYEWZQV9bRXnAM51qRgqqkKLx8tL0UGjbKuRJ2q0BhDDqX8BhGA==
X-Gm-Gg: Acq92OE5l9xgfcVipiE5D1UVLjAl1hYbGTBvKMzSxXlUMKK29w9CBDFJOs3C9Ihw9tW
	2eK1w+dhkqFT/BTuHzeohPfcGqwClX1E7cITcTyv/9ikEbPSpgeuK3LzC1+UFHn3PUBnW8hnkRD
	giOAdVg5/bEy9LqZyVIUyJ/Wsl8UBSMdNCmxYMO2QM9k4EcaJZcFKMriDBiQZgjQzWI1WK77BNB
	iJ3Xp2RixVNQ5K/4dObdsAAYS1V0bMT3yWlSFPBBHpLaCdD9y3zPaSOVD/oKaLG+eSsv3Ka6991
	fhbQoFptdObT3Vo5F+ty2pv/VgLpFfryZEKy0JNHGlU5w92Nukx3yl659A4ediKGbvSuy6KWSmz
	AkgNiS9IdGhNU292h2/ne3Y3HOpkOAZf1IrF4xELJkqaHCYoHPv9eB3jD4KpTnUYY5ZJUEG90C6
	dGCq8ElRFOLG8=
X-Received: by 2002:a05:7300:f18f:b0:2f5:285c:4374 with SMTP id 5a478bee46e88-304fa75bd1dmr5800033eec.35.1780338155251;
        Mon, 01 Jun 2026 11:22:35 -0700 (PDT)
X-Received: by 2002:a05:7300:f18f:b0:2f5:285c:4374 with SMTP id 5a478bee46e88-304fa75bd1dmr5799996eec.35.1780338154665;
        Mon, 01 Jun 2026 11:22:34 -0700 (PDT)
Received: from [10.62.37.26] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed5d5385sm9402462eec.28.2026.06.01.11.22.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 11:22:34 -0700 (PDT)
Message-ID: <215786e4-e85c-4af0-9993-5c6331c87817@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 11:22:33 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: csid: Consolidate
 CSI2_RX_CFG0_PHY_SEL_BASE_IDX definition
To: hangxiang.ma@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260601-camss-macro-v1-1-cabf1fb99241@oss.qualcomm.com>
 <CAFEp6-3a_ZRvCBiATwT594KOMH3DOMoQA_=qj0WW7iiZHTWABw@mail.gmail.com>
 <ac381274-f50c-4db4-9e4f-436d1d3cdbb6@oss.qualcomm.com>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <ac381274-f50c-4db4-9e4f-436d1d3cdbb6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pFxHDIMzexCUUhAYwdHVg-A8O9fDRCLj
X-Authority-Analysis: v=2.4 cv=dsfrzVg4 c=1 sm=1 tr=0 ts=6a1dcdec cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Gk2RreO4ThQZDhZWC3YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE4MSBTYWx0ZWRfXwjDXRYzIgsiV
 IKvne0WoJ2SLjgIued/lM2yB85+hhApIiGvcJJyubGjILIN7UTccBHVfRjooZxka6T7ugZVfraR
 s93gTvpVldnnOBzQeGQSVYqErW/oNHCOJI+/ETwsJjtKf37v/aUKrINFxLUYAoMUKdkfXebi//o
 14RK5IWso3jgN+4pF67a4s9OY2NT/oL20U+kuTbQS6eOfj7EIDKnZ28tGLJ798bjtFCjxLAtoDO
 bfvvQRdVBR2oaOXLd8h9gVQvdXXHjkudFeJ9aDGFYY0ObPoOwybCMElXeTzBiTAOkFLztKaifMG
 oDX5YhMt8MC8Cc7QZl0nU/mjOrLo6Jk3YiyS3EDwyCeDs3trAo/W1Wr4MYAg4QTVNiB4DhJMHxo
 YsG4nj7si3yPufSN3pjh1vpDaSA4PA8MxjYW1mWZUzRbtRM7JMs8zirjI6ryVVT5sIwBNlEoa05
 LSvH9V37Id3KhTfQmYA==
X-Proofpoint-ORIG-GUID: pFxHDIMzexCUUhAYwdHVg-A8O9fDRCLj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010181
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-63315-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vijay.tumati@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A25B9623F01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hangxiang,

On 6/1/2026 8:13 AM, hangxiang.ma@oss.qualcomm.com wrote:
> On 6/1/26 11:04 PM, Loic Poulain <loic.poulain@oss.qualcomm.com> wrote:
>> On Mon, Jun 1, 2026 at 4:44 PM Hangxiang Ma
>> <hangxiang.ma@oss.qualcomm.com> wrote:
>> >
>> > Move the duplicate CSI2_RX_CFG0_PHY_SEL_BASE_IDX definition from
>> > camss-csid-680.c and camss-csid-gen3.c into the shared camss-csid.h
>> > header. This eliminates redundancy and makes the constant available
>> > to future CSID implementations.
>>
>> Taking that direction, I don’t think this is the only instance of
>> redundancy, so why single out this one in particular? Should we
>> consider one-line cleanups across all similar cases? Also, other CSID
>> drivers follow the same pattern but use different identifiers for that
>> define (e.g. csid-340).
>>
>> Also, introducing such low-level, register-aligned naming
>> (CSI2_RX_CFG0_PHY...)  in what is supposed to be a generic
>> CSID header doesn’t seem appropriate.
>>
>> Regards,
>> Loic
>>
>>
>>
>> >
>> > Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> > ---
>> > Move the duplicate CSI2_RX_CFG0_PHY_SEL_BASE_IDX definition from
>> > camss-csid-680.c and camss-csid-gen3.c into the shared camss-csid.h
>> > header. This eliminates redundancy and makes the constant available
>> > to future CSID implementations.
>> > ---
>> >   drivers/media/platform/qcom/camss/camss-csid-680.c  | 1 -
>> >   drivers/media/platform/qcom/camss/camss-csid-gen3.c | 1 -
>> >   drivers/media/platform/qcom/camss/camss-csid.h      | 2 ++
>> >   3 files changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/ 
>> drivers/media/platform/qcom/camss/camss-csid-680.c
>> > index 345a67c8fb94..bf7164085ddb 100644
>> > --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
>> > +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
>> > @@ -101,7 +101,6 @@
>> >   #define                
>> CSI2_RX_CFG0_DL2_INPUT_SEL                      12
>> >   #define                
>> CSI2_RX_CFG0_DL3_INPUT_SEL                      16
>> >   #define                
>> CSI2_RX_CFG0_PHY_NUM_SEL                        20
>> > -#define                
>> CSI2_RX_CFG0_PHY_SEL_BASE_IDX                   1
>> >   #define                
>> CSI2_RX_CFG0_PHY_TYPE_SEL                       24
>> >   #define                
>> CSI2_RX_CFG0_TPG_MUX_EN                         BIT(27)
>> >   #define                
>> CSI2_RX_CFG0_TPG_MUX_SEL                        GENMASK(29, 28)
>> > diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/ 
>> drivers/media/platform/qcom/camss/camss-csid-gen3.c
>> > index 0fdbf75fb27d..da9458cd178b 100644
>> > --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>> > +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>> > @@ -105,7 +105,6 @@
>> >   #define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)     (csid_is_lite(csid) 
>> && IS_CSID_690(csid) ?\
>> >                                                          (0x34C + 
>> 0x100 * (rdi)) :\
>> >                                                          (0x54C + 
>> 0x100 * (rdi)))
>> > -#define CSI2_RX_CFG0_PHY_SEL_BASE_IDX  1
>> >
>> >   static void __csid_configure_rx(struct csid_device *csid,
>> >                                  struct csid_phy_config *phy, int vc)
>> > diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/ 
>> drivers/media/platform/qcom/camss/camss-csid.h
>> > index 5296b10f6bac..059ac94ad1be 100644
>> > --- a/drivers/media/platform/qcom/camss/camss-csid.h
>> > +++ b/drivers/media/platform/qcom/camss/camss-csid.h
>> > @@ -27,6 +27,8 @@
>> >   /* CSID hardware can demultiplex up to 4 outputs */
>> >   #define MSM_CSID_MAX_SRC_STREAMS       4
>> >
>> > +/* CSIPHY to hardware PHY selector mapping */
>> > +#define CSI2_RX_CFG0_PHY_SEL_BASE_IDX 1
>> >   #define CSID_RESET_TIMEOUT_MS 500
>> >
>> >   enum csid_testgen_mode {
>> >
>> > ---
>> > base-commit: 697a0e31ee66f5ddb929c09895139779fff33f20
>> > change-id: 20260601-camss-macro-3d40c4d4e90d
>> >
>> > Best regards,
>> > --
>> > Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> >
>>
> Thanks Loic, Bryan pointed this out in last review cycle and suggested 
> to split it as a standalone series. This idea comes from KNP series as I 
> was once suggested to move this macro into one common header to remove 
> redundancy. I think your are correct after fully consideration. I will 
> make changes only for KNP and put it in driver.
> 
> Best regards,
> Hangxiang
> 
So this patch is not necessary any more, is it? If there is anything 
specifically to be done to withdraw this, just for it to be clear to 
Bryan, can you please?

Thanks,
Vijay.


