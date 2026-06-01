Return-Path: <linux-media+bounces-63280-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CdZOGmjHWrmcgkAu9opvQ
	(envelope-from <linux-media+bounces-63280-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 17:21:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id ED58A621944
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 17:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4B0043062808
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 15:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D89C3D9DBF;
	Mon,  1 Jun 2026 15:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RYjbyKHE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D8oJAe9d"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794813D905D
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 15:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780326812; cv=none; b=sbpocDcy6f0thByjq9ubR+1xbg/WCc2nufXpb4rOEgEc5ds36o6dJAlQ9BN2cAy5p4opnX423GUDCYEFzf6N6vYvsFVL4zs9hZQ/5p1xVrwJ6UEQ/cZRVEBlgcBkSHS+HZWC89pcqyrc6IV3yQQDyB5PRL1OCqVJJ8vsRqff5Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780326812; c=relaxed/simple;
	bh=r0+aCzNBWqpfZkcJMC8J4KdHaiFjjmgp8w4RhjdUi30=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:References:
	 In-Reply-To:Content-Type; b=NQzf4gRZ0kMNKtv4y+HTWtoNPjPUOsvYvMjLwmpykT8P4TQYhN+9zp3Z9br7pFmovwqTUrHx1SGJ4srdjPpXPlxfurZodQ/djSe2duCMwzgV9swGmgwTchn8xmNX3qUGHAOkVr0IXw9vcmNaqCwirj3hR5DrD3bTo2j9Zuy12is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RYjbyKHE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D8oJAe9d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651F0qx94065781
	for <linux-media@vger.kernel.org>; Mon, 1 Jun 2026 15:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l1AKZpYX7RXkOvz/l1ikrJX0mnPav1pKxezabwf8MjU=; b=RYjbyKHEOfptoxa2
	kRWEeQHJIPHhn3IX6WIJ0PTUcElg4GClm5nJFvdUzABhJ/KM5J9g5ezP9Nd/jiPs
	SpYMs0QSjeqBtnDoYtb2HQfNCR4eDUoWSRdIT1BKrIjvk2LAWx1HkSinVjl0REfv
	LN86JJB1kgl0Ciliy/qozAkZd7wSvih2gweaA3w8n3hT80VxqcW125c8J+iOHrP0
	KLn/WkTIyR0vh17KMRULiO6D4t0RdV0FHOgmdLxkAhsElUzUxetj33jF8ne1mmQz
	ZKTQJGMLN+wXaITan7JUM5UZYMJWpC8pFyhT93zMoCGvf5xMnlpXgSe+yVkIvqy0
	FHbQtg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6swsn1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 15:13:30 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8425a9979e1so595807b3a.2
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 08:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780326809; x=1780931609; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:subject:to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1AKZpYX7RXkOvz/l1ikrJX0mnPav1pKxezabwf8MjU=;
        b=D8oJAe9doR/1vnfE2Cv8YYn5jXiSeaBb5YXQi05UurXCJVqB0TxB8Dgm/TzdCK4BCI
         ZgS7yDFzLU5SaTZeAhjHwbi5lfbYSFOkd+PWSAGB5SlQuazXkM4D6Q8ZPIIzsrCfCfUN
         wG/AjNTxVlqSl3q9Ajrcg/Qwrr7bKah1HAfkwc2DD7vBQ6hvDtx3wcVHwz4doOTHwSlF
         1dj2DK/xNWIL+a6WboPVkKEpBeT1YgaJCeIdOh3VMSPfOquD75ql2uA2fr0VlSG0dlas
         m+fEgFkFhlpCIw0DnLazasICKEyiKqqkW3BaYTl18Keda9mWnE/wDnVENlZtOiRxRkL+
         icTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780326809; x=1780931609;
        h=content-transfer-encoding:in-reply-to:references:subject:to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l1AKZpYX7RXkOvz/l1ikrJX0mnPav1pKxezabwf8MjU=;
        b=pBnL7VN0Jm9isYuBMcRCDVOrSWfF/SE9+1BOk0ghE8K6HgCsbPkgRLC1GIDtH77phy
         YROlofyxhXC6uL2c+6BANEXQs97/hTSI5xhhL6VnWyjJ9hqcXmkhHZ2islMMMhNyDRos
         WUNkhMvJkXdgh6X0JgDZCEg1V9tHVfFaceTpF+GWepQVTOQBXVC59DYI+JbJuiNkx46R
         cHDYNszyHXwsm0hDMeSaS7D3hlbA3e8TwJVWBbcRx+nzHEvGoo881TBW/XUEcgdn3crl
         bz1gXbPMtWbeWgl82qks14qrleZhIUX6nX9o/dK7siuDb3j88UveOBo9l+gK43f/0pke
         HuiA==
X-Forwarded-Encrypted: i=1; AFNElJ/IKgiTvT6I4/TI1GyHnLFAK7kEQPdz6BUj8HGFPr/nBqbf/znoIPPK/57lUadHyKEWhwYXPkc5GMip+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzK9/+MhoNxAdo8DouuH91+ZLkOvWcGxGgHZyyR84tW9xKFogRF
	yc+XznCmPlDwJD++mhYNvgsRnPEbOao82EWveeM+H+3A1CzWcR6pQLBYR/772/yQ0+SmRrenZLR
	AIMAuY91ScJJTHI5vk7wlNGbhIUid4X4wh0iVIHTWFsCk6XcWaVj66Hv4j+/e3WX91w==
X-Gm-Gg: Acq92OHSrE7Xrm+7ksQjaTyuulRovYNRJ2V4muighSJUDn7F63D9xZfRYcd9y47zR/2
	FrbwQ0xO0nDRcCz3U/4GkahB2qgucrbEomCnGWQ5rOaMxGKU1tdG8IC7kBMPFwxTHdJ5qcVEZMt
	Q3RBYnK8bqDTwgCDJTNImsHrzA6qReXIOiDupvFa6AQRLVAelhBO8LR+3rTiEP97AlACPpo8nBT
	SpSnbWn1mbPwyx3OADTHhVzCpgbeXVlmfbehAdPX1oEA1KNnE6pXIU5dcrbUqbeSH+deEMwxIlI
	02rf5Nq7Z9epai+GvKDS57QwcHR4wuM6fQ7J3PNeYyvBHzylJ/c7Nd95WTeZu6rB9a/x5yBfCpT
	KBfhDsstnCCqbu1gXkzuGKWaxJRCctpeXAow19WxuzV9wzESQ1aoHv+ebhmE/RRa1aVCUTaVjIB
	+P4p8uab/Bbsk5P1+pomCe4Qe49sY=
X-Received: by 2002:a05:6a00:2d9e:b0:841:dc85:1638 with SMTP id d2e1a72fcca58-84225700f47mr10727547b3a.42.1780326809358;
        Mon, 01 Jun 2026 08:13:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d9e:b0:841:dc85:1638 with SMTP id d2e1a72fcca58-84225700f47mr10727514b3a.42.1780326808761;
        Mon, 01 Jun 2026 08:13:28 -0700 (PDT)
Received: from [10.133.33.66] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214c9252bsm10691086b3a.39.2026.06.01.08.13.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 08:13:28 -0700 (PDT)
Message-ID: <ac381274-f50c-4db4-9e4f-436d1d3cdbb6@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 23:13:24 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hangxiang.ma@oss.qualcomm.com
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: qcom: camss: csid: Consolidate
 CSI2_RX_CFG0_PHY_SEL_BASE_IDX definition
References: <20260601-camss-macro-v1-1-cabf1fb99241@oss.qualcomm.com>
 <CAFEp6-3a_ZRvCBiATwT594KOMH3DOMoQA_=qj0WW7iiZHTWABw@mail.gmail.com>
In-Reply-To: <CAFEp6-3a_ZRvCBiATwT594KOMH3DOMoQA_=qj0WW7iiZHTWABw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a1da19a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=oV6xyBMvY1brQq5Mu-QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: LSxt4JoVpWuxH-nscoiK2PmC0JanWm4H
X-Proofpoint-ORIG-GUID: LSxt4JoVpWuxH-nscoiK2PmC0JanWm4H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE1MiBTYWx0ZWRfX/kMCV+wmip1g
 v8/KF35P/YiXje/LdBblNhH7TDobvxGLDDV6N4qPrQe8h0DWu1XLqWtNwy9Znv4n27ozgCfuUta
 8ipX3+lRFOwFjLM7Cd99Zgb9hJ/t9xatgbpMeJObHSU4GCj/ERGXaJ/uVN0OkhK6VJlT1mmmsL3
 gJkRzyrOu1w7QGuIQ+7kY8mKcg21iDrxUTFfAlRLakUAxzXWEUtqZzWpi1/WDBXaofl3RnUM03t
 atGSqA5WfcmNE2DB6Hq324eVM1GOK+pdYtaJiFpo0rs8H/2N/Nd1AFHgtOAZkSson2PIvc7lnMT
 B5rOxdiyFHdNvb+jU2ev6lhoiiu3q1zdZlH2/+mu/mJe8tyGmkcfPzTvAJVrZHJjM5fQB2t+EOp
 1rIZG4Qk0+LvRarNBoo1tiwUONGR/ZZm9y5KN/b5WL7NKjcNf47oCz4qS+IsF4TCisidIdx2YbV
 4a9q9XnyuI5WoeUppKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010152
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-63280-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,vger.kernel.org];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hangxiang.ma@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ED58A621944
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 6/1/26 11:04 PM, Loic Poulain <loic.poulain@oss.qualcomm.com> wrote:
> On Mon, Jun 1, 2026 at 4:44 PM Hangxiang Ma
> <hangxiang.ma@oss.qualcomm.com> wrote:
> >
> > Move the duplicate CSI2_RX_CFG0_PHY_SEL_BASE_IDX definition from
> > camss-csid-680.c and camss-csid-gen3.c into the shared camss-csid.h
> > header. This eliminates redundancy and makes the constant available
> > to future CSID implementations.
> 
> Taking that direction, I don’t think this is the only instance of
> redundancy, so why single out this one in particular? Should we
> consider one-line cleanups across all similar cases? Also, other CSID
> drivers follow the same pattern but use different identifiers for that
> define (e.g. csid-340).
> 
> Also, introducing such low-level, register-aligned naming
> (CSI2_RX_CFG0_PHY...)  in what is supposed to be a generic
> CSID header doesn’t seem appropriate.
> 
> Regards,
> Loic
> 
> 
> 
> >
> > Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> > ---
> > Move the duplicate CSI2_RX_CFG0_PHY_SEL_BASE_IDX definition from
> > camss-csid-680.c and camss-csid-gen3.c into the shared camss-csid.h
> > header. This eliminates redundancy and makes the constant available
> > to future CSID implementations.
> > ---
> >   drivers/media/platform/qcom/camss/camss-csid-680.c  | 1 -
> >   drivers/media/platform/qcom/camss/camss-csid-gen3.c | 1 -
> >   drivers/media/platform/qcom/camss/camss-csid.h      | 2 ++
> >   3 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
> > index 345a67c8fb94..bf7164085ddb 100644
> > --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
> > +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
> > @@ -101,7 +101,6 @@
> >   #define                CSI2_RX_CFG0_DL2_INPUT_SEL                      12
> >   #define                CSI2_RX_CFG0_DL3_INPUT_SEL                      16
> >   #define                CSI2_RX_CFG0_PHY_NUM_SEL                        20
> > -#define                CSI2_RX_CFG0_PHY_SEL_BASE_IDX                   1
> >   #define                CSI2_RX_CFG0_PHY_TYPE_SEL                       24
> >   #define                CSI2_RX_CFG0_TPG_MUX_EN                         BIT(27)
> >   #define                CSI2_RX_CFG0_TPG_MUX_SEL                        GENMASK(29, 28)
> > diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> > index 0fdbf75fb27d..da9458cd178b 100644
> > --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> > +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> > @@ -105,7 +105,6 @@
> >   #define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)     (csid_is_lite(csid) && IS_CSID_690(csid) ?\
> >                                                          (0x34C + 0x100 * (rdi)) :\
> >                                                          (0x54C + 0x100 * (rdi)))
> > -#define CSI2_RX_CFG0_PHY_SEL_BASE_IDX  1
> >
> >   static void __csid_configure_rx(struct csid_device *csid,
> >                                  struct csid_phy_config *phy, int vc)
> > diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> > index 5296b10f6bac..059ac94ad1be 100644
> > --- a/drivers/media/platform/qcom/camss/camss-csid.h
> > +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> > @@ -27,6 +27,8 @@
> >   /* CSID hardware can demultiplex up to 4 outputs */
> >   #define MSM_CSID_MAX_SRC_STREAMS       4
> >
> > +/* CSIPHY to hardware PHY selector mapping */
> > +#define CSI2_RX_CFG0_PHY_SEL_BASE_IDX 1
> >   #define CSID_RESET_TIMEOUT_MS 500
> >
> >   enum csid_testgen_mode {
> >
> > ---
> > base-commit: 697a0e31ee66f5ddb929c09895139779fff33f20
> > change-id: 20260601-camss-macro-3d40c4d4e90d
> >
> > Best regards,
> > --
> > Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> >
> 
Thanks Loic, Bryan pointed this out in last review cycle and suggested to split it as a standalone series. This idea comes from KNP series as I was once suggested to move this macro into one common header to remove redundancy. I think your are correct after fully consideration. I will make changes only for KNP and put it in driver.

Best regards,
Hangxiang

