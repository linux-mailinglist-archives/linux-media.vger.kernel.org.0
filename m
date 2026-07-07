Return-Path: <linux-media+bounces-66849-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vhIfBCP/TGrctAEAu9opvQ
	(envelope-from <linux-media+bounces-66849-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 15:29:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB4B71BE77
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 15:29:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WuIfxalh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NnJOYeBp;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66849-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66849-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C0EE313022C
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 13:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B668441737A;
	Tue,  7 Jul 2026 13:22:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFDF2FFDE1
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 13:22:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430545; cv=none; b=Q4UmpzIz4jQWiOpljPMvNTI5j5ZAaJV4P80GqcJpXWopz4Mg9++O9ZW4ukfP/oemEaGzBPJkRZ+51QiGwhrkPHsmme2RRm00yV1nLZnAk4XbbIPIuQ/fUd/VjBlB7gJp1ioPJHUG++tp5hYx9ll+tXbS8wEiAq0aUTIuOBabTaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430545; c=relaxed/simple;
	bh=JLUVtpAcR7Sw3pbtVQgfJbUd6mFFYioquXqjBsVIPE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vb7wwlYLgqrQ+iFmvZHo8oo9IehsF5jPQBNsmIXmhQ8aGz2LGsh+eTB8QDbvc3nlr9FrxeiNhdgI/kcBOhe0Z9iPFayZUih06E1kAz7YpbZ/+Qt/qqDH7AwZgcq2PhdXgp24oGllXo11fDHShWyzUf4/MCo1CAeztFWC6LCIFMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WuIfxalh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NnJOYeBp; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C9c7G3619376
	for <linux-media@vger.kernel.org>; Tue, 7 Jul 2026 13:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VmiOWeVXgmFMOpD0RMG3VxxL7rn3EHP1lcppg4A4U0A=; b=WuIfxalh9GeqxVmK
	LeN87fp4gUh4Wd7ecw9aOrJf5lFttjyOj5QZ9Tt6KQbbkx15dpHWRB19m+2+EHsj
	+eNqrHUtxFlZdO5gD5hH1aJo8d+1hnE3+VwS4xyssoqHNcdyAGcXMDO7GH8FxJRT
	M/szL0fFkYSbmrslQ70RRhow4A4jiXx1zthcl62e5HB4w84R8H4FPTtzUtkl/Q46
	ZoKSGFJ2qiG6YewzVwULSaIylOAgw+MAkK/OmfSfMGXyRlYTEt9pEBD2Pb0euUP3
	6b+wEN86NLLRmMRuTCZaLX1DSfPlQKfaBxptBlA+6PgAqBUyZIOzTJslZ4tXESRT
	ZGgcRA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vun1emq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 13:22:23 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9674fae89e9so487865241.3
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 06:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783430542; x=1784035342; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VmiOWeVXgmFMOpD0RMG3VxxL7rn3EHP1lcppg4A4U0A=;
        b=NnJOYeBphVyNtMQAUKt6QLICW3nz3WUx7LAqcF9u28VRAINxHIcmIT7QYM7n9N+Vsk
         Ula8KtYN0cVWp+RHOD8ilQe9YsXGXFXE4yigvKhxPGyAbAbB4lRaHLgmdK4KFFBP3wNJ
         TyFz0a25Kf6nlwG3gK1kCm2EI8PZL8P6i5sqCNcq3P014aOs+2TuEqgS44JcrY8wHwgd
         cVaFThv3ktFPLUvWzWUYjjQwOZwqyP73avVmDBwttHVcuaAkRTPFU8dsFv6vuRq8Q2jQ
         X/G2yMmofRazD8YNHmuDp24+bA2V1KhxL9xTXG7h63B/WQvxVtZaTT8imQeDIF+WU7WN
         9/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783430542; x=1784035342;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VmiOWeVXgmFMOpD0RMG3VxxL7rn3EHP1lcppg4A4U0A=;
        b=Aqt67qKdV7nETMDvHHVwOXeXIAH1qTHIwlU5KuHT887QkNCYFMsVvAyJobGueRKpfa
         ht4W2uj/x1YOKUqvlKJe2i1EoldzoooAnUkiXzy4s1zqqofFwQ7klMZnVdCq3k0ZYi12
         ZI42iYfPTcTqAFq8zxmC+Bj5ACcz3FMLhFhn+YSXzzNyLwA/2v6fzpiueD2/Di0EqXK7
         nJRXR94KUcHu3e0OIAhE6uQ2hZIuJlCOoWy1T5tE9KePxXjp6PLhCYSS2e9DelRrWlDe
         +Mv5RLHYvWmXlT7rrBNblS9FcqXq+ZA5RJhnLkwpxedmvl/GFHfgRIodpHxHYpJ6T+M6
         8Ijg==
X-Forwarded-Encrypted: i=1; AHgh+Ro8sQBxep+iX4YbVfPUx7/2DnDBCHurqBY3geqDtB0r9NPVQYpq/+dMagZJ5mePNncpCjuRvJIV/KEYHg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+rMwbeFacGIk6d+1jSM+mQRkUbRGGBb/xzHbVuiOmHWEARZ5B
	C9mbYpE+8+gjdr/2k14bcknqvi4kvqMeXSc+bjGCxnKWHSRKFl6lmm4ew4cV7hHXsUHJaT0lftw
	Nh0hCQzgZ1WR855OlsGiY4xKLhLreG/NucG8JCKynkoQEjJhhzQbydmnMGNbqYMfdqw==
X-Gm-Gg: AfdE7clVVEXKTAJAOeFoPSWjR9HEBBNxX/gzsubZDUbgUUpIYYp5LJ0eOQ5RZubHs7Q
	c2rGSZXm9DSJF8qSJoK/DmGrJq49d6kEDfDgid1W3apAtElxl3p4+7guuPVTszcm/TQiTdf0PC7
	8JMJDXqTCq+yn4TipLJBIReiXM4t5ycIMIVkhMMfnpa97d3ZykaFpn5RmRnaENWX+fGKqioAOZ5
	XWmsMpST1hTJQCLo4rU5j6sokV3oTysSkmtBqgl6f19F2jN0aawww8+lw+n4zdX9xKfr3TwcQOq
	i+NXCDxwmw72pmtcnoTK7dxdr+rL2lzi5GZgLw8kfSaH1UTIK9eGCWo4nua5VM3+zvI8nlgX8da
	0ZVPtTggYg0yBRfYDa3uhJAOcQ3Zrl+47XSxaOCoVnPPHV0sEK+i4I2pdJldcXohfkSQAGxs5Al
	tzKkLQA8ZmSq1f2aFBNZAnH6Ko
X-Received: by 2002:a05:6102:3e09:b0:64e:32c3:1371 with SMTP id ada2fe7eead31-744b7ae03a1mr2826776137.2.1783430540916;
        Tue, 07 Jul 2026 06:22:20 -0700 (PDT)
X-Received: by 2002:a05:6102:3e09:b0:64e:32c3:1371 with SMTP id ada2fe7eead31-744b7ae03a1mr2826755137.2.1783430540395;
        Tue, 07 Jul 2026 06:22:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1377075sm3648101e87.28.2026.07.07.06.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 06:22:19 -0700 (PDT)
Date: Tue, 7 Jul 2026 16:22:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@nxsw.ie>
Cc: Bryan O'Donoghue <bod.linux@nxsw.ie>,
        "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
Message-ID: <w6imdnlo3xron3f2cw7fq5jtwcgvyijciddxjftwf46kltjjqx@inipxbghzngc>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
 <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
 <7e36238b-96ac-4269-a6e5-0a6763e437e7@oss.qualcomm.com>
 <4a2c098f-5d46-4339-9b09-e0ace37e4052@nxsw.ie>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a2c098f-5d46-4339-9b09-e0ace37e4052@nxsw.ie>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMCBTYWx0ZWRfXzblyRfzZTKw4
 ifPxdOX8basVSdqtGV8pKbII/sWtIzRS9K/mVR46jb7ZFRRrE7ryDD1yXT1fsGyEJh7BVmwhtnq
 EyYxwWBuX6zfWAyM7xW6d+psDce1NAE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMCBTYWx0ZWRfX4IoKsfShOUON
 0YCeaiLVL68xDpTtEtfv9nuDuDo0fsUv5kw80KoZyF6CaBfridlfhzA0YtNqNNALrVXB94UR8gv
 UdmdDuQ6rn6lBSVRQGrr5lyHya8S9CpGLnM/YuliI5TN0NEkl7yuvz5IeliBhStnkWlBKgrkpT7
 XRzBvaQHbqIDtPnn23kA7PdQ5idKMp8bB+feOw3BmwaHdkIJg7uM4JaDe6HReRevxCjWIPSwB8T
 esqaxs1VaKzVvvOQcMRVeA7JUSPlaU17LNQKxzI4NTpjx7/dqaENFz7tm51BWfTmyJnGd4vQOaR
 Bqzg4RAtlfiO/CV9uDzmFEeRnALAK9UCnsesA3OJY3okraeDxrFZ1JTVkiH2OK+j6c10ZvCNFGs
 omROInLCgPAcb4PPtcpPrdKgS+bylTNfHLwweBqZE+SxbAE65xYOnUHTeQDXGx6wJqG5ZcR5Aur
 SFF78sdrltGla3Jyg9w==
X-Proofpoint-GUID: n16IoydLGOpXBOOMrYvNqitvQL9ya0c3
X-Authority-Analysis: v=2.4 cv=N+IZ0W9B c=1 sm=1 tr=0 ts=6a4cfd8f cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=17shpdAnEHHmTgLBXfwA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: n16IoydLGOpXBOOMrYvNqitvQL9ya0c3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66849-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,inipxbghzngc:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:bod@nxsw.ie,m:bod.linux@nxsw.ie,m:gjorgji.rosikopulos@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:bryan.odonoghue@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3DB4B71BE77

On Tue, Jul 07, 2026 at 11:15:40AM +0000, Bryan O'Donoghue wrote:
> On 07/07/2026 12:13, Bryan O'Donoghue wrote:
> > camera-bus {
> >      compat=camss
> >      power-domains=<whatever is common>
> >      csid {
> >          compat=csid;
> >      }
> >      jpeg {
> >          compat=jpeg;
> >      }
> > }
> 
> * compat="camss-bus"

You can't change compat. There is no separate "camss bus". We have camss
block on, say, Hamoa. Or Glymur. Or CoolPlatform. This would mean
exactly qcom,x1e80100-camss, qcom,glymur-camss, etc.

Then, a part of that camss device we have all the IFE, PHY, JPEG and
other blocks. Each of them having a separate compat, etc.

But, there is no "camss-bus" (okay, there is a camnoc, but it is not
represented as such in DT).

-- 
With best wishes
Dmitry

