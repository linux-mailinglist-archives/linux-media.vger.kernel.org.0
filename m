Return-Path: <linux-media+bounces-55281-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHvRKxq2sGlvmQIAu9opvQ
	(envelope-from <linux-media+bounces-55281-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 01:23:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AA559259BB8
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 01:23:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 023113051228
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 00:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63FC431E842;
	Wed, 11 Mar 2026 00:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UnkRx+Qt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nc5pZyYa"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA3F317160
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 00:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773188455; cv=none; b=QpQYqqo8SJi2jMtvEB65DBgsfbrYozhedVcUnuodG9QS0ZrAaGW9rOZ/lGdi6OYGOKb84sm2GBimYtyWTBbEhoKYosoQ+94KJjZ1dpNkTsds3RWxCeAzaP2GCqISVqXynXT2a4p9TwQXu1jgpjWkCgVZAkqMKrG2/WjHxSe4Z6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773188455; c=relaxed/simple;
	bh=pelA03jj2FiDGxwf+XytSDv8oENkk9fAv5C4nFbyflE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=puTsV4KVNoVp65+o3seFqKDLZ10vRlgpT7twOgKiPBwlnFQRuSNAd04jvKtmLgvthyx6keIWsCFa74YUfhNO6lELchnJy/rB+3CTznm91FOale0l0MSOviamDhNq6qzmNSigkrT0GbZfMwM/aKgpjxZ4oPb91j1qK0f8RNEiaUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UnkRx+Qt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nc5pZyYa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AGH5qP508675
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 00:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Soyoe39fzWQDtJH6+LD4/cBb
	xae2zmQrTURDYpjYC90=; b=UnkRx+QtT29uS0f9N8unViMGjHj2+QQxbn50Jh/m
	NVdiVStfz0pEkzpeLvD30CgIUBWnWQpIr4BEZ4ifY84CMD/cAvabJ3Q09s8hk/B3
	X5hrekxqRZ2AkOcdIuJT+bWFu9O/4hHdOZel0irx7cqIo9Od7jfIYmhEZut8OroG
	QvzMs18RXHwfJ3XD02yUVXXU3yn3HFOIXH/CqZsXnRTLjK3Ao74RGTYo5oSh6IXC
	jdktJnUXxbZfLQFD7osocjTEXOfeA3KN1dmNIfSMODDFL7h6TqZwYaMS+GPd0Pw/
	GTI7BnpdugD5vcgmphji4p0MIfJGpl1SU7uQP+9NGYfkJg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctppahj0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 00:20:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd77bc8186so3716837085a.0
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 17:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773188452; x=1773793252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Soyoe39fzWQDtJH6+LD4/cBbxae2zmQrTURDYpjYC90=;
        b=Nc5pZyYa1R64PS6SpOavqKbhEgEgRWEnmvKL0arMdOhFXxonGEJV85XTacbtA5Ehen
         tZkE/TzK3n3UHaQCmm+jUrgRNU77D2bZ5+kex1d78HvOnJHrSRtc9ygZNvs7EIdA4rVb
         6zCDP1cZxgjYxlRenWlLn0rkNGQ+qwan2cjL5GjTBt7xXlu1wOxK8l4SgxZiag18W/fV
         /CneJ4xFc9sh0Iij/4Pht3nqRZHDPun4fDJ1AR7Nm/jfss2a5cpcmUCyCTDcS4Jn+7jE
         SWmmrm2d0nfICzaS/qgy+dTdoB76i+wHAplWgNopGdUCSa7GCyClY/bgEuhYxftSV3Zw
         YXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773188452; x=1773793252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Soyoe39fzWQDtJH6+LD4/cBbxae2zmQrTURDYpjYC90=;
        b=Yif3McehyZcLvGLb1o6V3UWEcuxMnpFEtn/vt1zP0ILjc5kj8V/291D6M21Mp5I70t
         BwMWpC4N6ivs26+LpWTGZ1li2qcM/UuIOlrRPLkkq7mU7CAf7hj/QOQtlqW5YLYz0CJg
         MWeD816/NUattD9k7bOAefLxhU0VfOsjK7vXsrD02DDXH5BPjX+IfThJG6A/ZcHbajON
         LvvdoSRTiSh4rO2Lx4esz6HT0PxqINmT++Clpp69Na0mSeTbTKwb3evyQWJ6M76q8i4m
         Yi1A6Cl6ehCDr6LBHbZ3r+5oLkADMmEtVjDxC411pWGOv1qyf3OGr0plcC+sNEy7nH/i
         EKlw==
X-Forwarded-Encrypted: i=1; AJvYcCWlz5y+JfPdWVTWPWU7mylPxwtZ0F5fPHgCnBHNw8XvQOmCOV22gcB/GxRHNzdSO/nSzSTbMAWDB2Tk9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyRNiMwEVxHYcC3NKhn3kcTG9Z8fqkR0JHqa06z1B8+ggbEYmn
	UOSDlIm6JBCCpjUD8PPALSAZhP/0spfeL9nnwSyqD3/3sGzHOP2qcvqEfDeEW/zcIof1uTOo3Et
	yHsqq1WT1mJQfPICrpmImsbvvpOm99aldp8wWGUhT37S99La6+6EYD+aNaU5iS9sygQ==
X-Gm-Gg: ATEYQzxa21GMol2uMI/w9a65EjDyL6RXbYLQpruT5lzR2Pebf312bfuE+W7EdASSYdg
	8+amfeTpE/0mhxdZKmLFaLXIFNzOjGr0NuGw4xR/7iizsKIBaeoctCcGwmH/Cq3tMPs6UguyCvp
	VlKT3NREzzGe4i5kxgC+fIrVaFL995JthpCxoRRABS95x0zK3z20WqggEMldkGevC7RQeXaNGDE
	gDLkl9BryW7aPxHoYxuULcYj+SYoXLH7mILg2GTPgKjGvvXA8P2acLXVxw0zI22AF6SV/AmLD+0
	WFeEd0g8Hyu8MAalMJ9kHDl1f5BfycfkZ7/EMFiNOQNwEEI2l+sXcoW9XjsHe545hlcaZTyjEHG
	P38pqqM9hM4fx4Yu4Zep3VQwRF/N3Ipdi/pKhXl+aePCEf3L+qQuXTTZs5Rgg0ywnqtuuIECFLH
	RsMWNRo3Q1zYNwYs7XqMtkUEIMwn7VAwzuItk=
X-Received: by 2002:a05:620a:4115:b0:85c:bb2:ad9c with SMTP id af79cd13be357-8cda1a3193bmr111462085a.53.1773188452175;
        Tue, 10 Mar 2026 17:20:52 -0700 (PDT)
X-Received: by 2002:a05:620a:4115:b0:85c:bb2:ad9c with SMTP id af79cd13be357-8cda1a3193bmr111459685a.53.1773188451667;
        Tue, 10 Mar 2026 17:20:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e713sm109086e87.32.2026.03.10.17.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 17:20:50 -0700 (PDT)
Date: Wed, 11 Mar 2026 02:20:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/11] media: qcom: iris: merge hfi_response_ops and
 hfi_command_ops
Message-ID: <3jr7gi4u6y4ldbqwrwlouhmem3mfzcs77sjwvxyhovl42qs4w3@3kwsx45o5e5n>
References: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
 <20260228-iris-platform-data-v2-8-acf036a3c84c@oss.qualcomm.com>
 <c37c4efe-c32c-7989-0c69-dfd0b6f71fb8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c37c4efe-c32c-7989-0c69-dfd0b6f71fb8@oss.qualcomm.com>
X-Proofpoint-GUID: dMiFE7fBSl3W8APZaAi0b4e_GqtBJ0SF
X-Authority-Analysis: v=2.4 cv=D7BK6/Rj c=1 sm=1 tr=0 ts=69b0b565 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=rXw9MLyP4ygTMl7QpFEA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAwMSBTYWx0ZWRfX6hLxH0hxsFmp
 SIhPfo3WDGgr7JZ5lCsm6EvvajB9lpS9Ddm+66bIVHR1EGcD7/5ytjm/iFfFuL8CZH3Rgaf958p
 hPuYWdh+WKRSRtoYQMB4ap50p9SFKCx/lgu6lsK0zTorSSTNDoHfTSQkhyjZ2AdnV3SN76qGgfW
 pKCW9qu1/F5XatagegIQ/37EVBHhE0CXdosG+1msJVdoVtdJwd0/03Sq6UpNCmjH6klPwgvBcES
 K9d3Fhos7LZX95Mj3X1KcwPXdUR6JnbOvzign6p1k4c2TMj1wfTH15AYBUku4RSG66YcmCsJZnz
 Q/56vCaiIGt2hGlqqup/s1rgzHFNXS8E30rxkSqpSHGpv6XetNSGQZVNDDnbVhuc3PEHrgmEEZz
 oKkIEiV6s0x1gnIhTcHj3o6nyLWqNbioaGt1MtbR1uJb95xNKx4uGQzXCJfgCF/iY6CYg6U77hl
 PWLMOSD9oTxJYafZM1A==
X-Proofpoint-ORIG-GUID: dMiFE7fBSl3W8APZaAi0b4e_GqtBJ0SF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110001
X-Rspamd-Queue-Id: AA559259BB8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55281-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 02:17:12PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 2/28/2026 8:56 PM, Dmitry Baryshkov wrote:
> > There is little point in having two different structures for HFI-related
> > core ops. Merge both of them into the new iris_hfi_ops structure.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/iris/iris_core.h              |  2 +-
> >  drivers/media/platform/qcom/iris/iris_hfi_common.c        |  6 +++---
> >  drivers/media/platform/qcom/iris/iris_hfi_common.h        |  8 +++-----
> >  drivers/media/platform/qcom/iris/iris_hfi_gen1.h          |  4 ++--
> >  drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c  |  8 +++++---
> >  drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c | 11 +----------
> >  drivers/media/platform/qcom/iris/iris_hfi_gen2.h          |  4 ++--
> >  drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c  |  8 +++++---
> >  drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 11 +----------
> >  drivers/media/platform/qcom/iris/iris_platform_common.h   |  3 +--
> >  drivers/media/platform/qcom/iris/iris_platform_gen1.c     |  6 ++----
> >  drivers/media/platform/qcom/iris/iris_platform_gen2.c     | 12 ++++--------
> >  drivers/media/platform/qcom/iris/iris_probe.c             |  3 +--
> >  13 files changed, 31 insertions(+), 55 deletions(-)
> > 
> > diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> > index d10a03aa5685..d919c7c16106 100644
> > --- a/drivers/media/platform/qcom/iris/iris_core.h
> > +++ b/drivers/media/platform/qcom/iris/iris_core.h
> > @@ -112,7 +112,7 @@ struct iris_core {
> >  	u32					header_id;
> >  	u32					packet_id;
> >  	struct iris_core_power			power;
> > -	const struct iris_hfi_command_ops	*hfi_ops;
> > +	const struct iris_hfi_ops		*hfi_ops;
> >  	const struct iris_hfi_response_ops	*hfi_response_ops;
> 
> isn't this creating compilation issue? This is being removed in this patch.

No, compiler ignores unknown struct pointers until one wants to peek
into it. But I should drop it anyway.


-- 
With best wishes
Dmitry

