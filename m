Return-Path: <linux-media+bounces-54086-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKfuEbyBpWl1CgYAu9opvQ
	(envelope-from <linux-media+bounces-54086-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 13:25:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 915551D846C
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 13:25:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6FBA730A5729
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 12:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33AFE365A19;
	Mon,  2 Mar 2026 12:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="epwO3Uhg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="grOM0Gsh"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86315363C68
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 12:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772454157; cv=none; b=nMpD9ErujUq5COwqCNYpZ67aANEnLI8f4ZndX7Aeik6SAN+qvtgQPOyBe8gf0vQIVF5xNSnjNYr9UbFvjdILX6vM8TMOgeZOhXXeftWUQMluCN/Ojx/ZS0KOdpLQERK6zgL2M3MtKX6u6/8yFN/37Gpr4ysMlg4985nh49NNF+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772454157; c=relaxed/simple;
	bh=y0jOreQcyhNBY7pAZu8EsbnUnYn58lkvbvEdkTtvM3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=doeYxTWL2G7bSVVYiLU12wDX4opbFxWB74dpJEIW7489eTBEIne9GIDTeiWgtPB4yk7pb+eHFN44Q3xLHo2w7PZ8J6Gux/XUPk63NBdzKh/j0ZjRapUTXl7PJBCJv8wLkJw+hI8ATWHUGMlQb8ocGDZF5yfmTjPhlHEyUMrBDqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=epwO3Uhg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=grOM0Gsh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229EwCa3630903
	for <linux-media@vger.kernel.org>; Mon, 2 Mar 2026 12:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L33aOntU2Bnr2c2KW+UdgnR1
	awPO0q+V3/ZIdQVGXpE=; b=epwO3Uhg+wB4H/BC7N3/RNvJmGzcOU7iSnfKeqwF
	OCoqkHgM3nqZphcq/jzuGsMRHLq0x9rk4hkX7CQs3NklSdvfx/jkkK9uW+USYI8m
	z6Nbslo2bsD6xPLRN1VnIbGJqdjIpgIB3OMPH4uV8+295H63h+Estvz5crKqiI+L
	U3D88wVEfvu44DXryX+QXjw35hQfPm2E+ONcauMySE8np5HkI9OsjXvCcUSLfjx2
	98Ba1lk5sswy608RYE7e5imrNaSkMTyQ72sBarid+5Epwkg/iJokDjt5kdnqtawx
	wRgqKeIJMZjLf/FvSF39FWhhqU5a0zBXuvzhkrwhKuomiQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7rhrm0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 12:22:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4a241582so2967768185a.0
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 04:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772454155; x=1773058955; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L33aOntU2Bnr2c2KW+UdgnR1awPO0q+V3/ZIdQVGXpE=;
        b=grOM0GshGPvCOh5cWZ3Ey9reMjK2F9cJjyXCXxWLCBz+tsmRDcbt3x7KUG3GXlm/qu
         Iwjv2JX6+Nd0MRUUqtg1oXhvBrI6xkffzvJfhR/SC13YuZT8HOm0Un6WHVv6RWFsON4U
         8npCIit5/OuJOUDgEUJvoFNNEz5OFpmKsSWJfeFaaddg9RPDyabRfgo5Dy6jJWocgUQU
         1jDSISOD4Lld0Jm52I0xv6sso73kgD9AWnHBT6qn0HdSV1JRybV4tLVCYHiprgfhenzp
         wqHg/S8HloER3C/g7+z/cbnD8yGPmZNe9eChtfP5mRZvnnZzqMInNFvMm5FcsW/Vd+fh
         kuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772454155; x=1773058955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L33aOntU2Bnr2c2KW+UdgnR1awPO0q+V3/ZIdQVGXpE=;
        b=f4BRHgTrLxZRDU5AtEaNvhdiwKWBe/yyRrtc/bQCjHN9bvRPJ8YA/vJ7McG0iz+8CM
         JdMHNkr4LVjvIIczQMKng0HJlq7GGOP0jsm/tnujULxmHAmBed8zSVMPn6/0eqaiEEfc
         PlzMHXReVTu8mwY5JQov/FAxsKbm0AHkljj9/Cr4RPzg+9b0OEDbIuUdXfsB3Eqh5EzP
         2OSYaYE69xrH8XONXmotUgK52W5ul8GzoFpzfymByGU5Y+exxyRbWqwx1DVRlOooPHdn
         d5BLxuudLAu+w5QMH51eZWqsHd1MjW9AVPBV7Tk+4SFgJjtXYoGxrH1kryDqojcNHbzb
         Mfvg==
X-Forwarded-Encrypted: i=1; AJvYcCUrtZDFRyASxYAaLjof5WwD9Ur/jhnLptOGIFaK51jetUj0q618sRL8y+A9SABIcsIx6q6Pkh9XZ4iOCw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmgu6e4QvgAMgK+FKjFqht9ctlFmZ9UIRMRJgHzE+M1/yWN7Ck
	xPWDUvaD9CIYcuFgsEDPXhNwpGWsvFAIhfP6DyGXc3qahbowdzMfDolgPEd2xyj+MttFtc+8Pe5
	7hVag1elO3nDP90lmlSfU87ekuge4f3VOAjuXEq4PBtJFXUcdEMOGtZmfS/sSxwTwfg==
X-Gm-Gg: ATEYQzz4Dzg9I+nV1YQIbzdrBWKnesOt1rZYwLNkZMv6MK1vl9QffW5fKOgkW6plKT7
	L5chZ9wEiiRz7umw1j28P0rkoeXtoZL/Z9BnlgKihsiTfYLOQLpGESnhc176mDmN9y1T2CIolIZ
	271RVPe1Vlq09p/0xJlt1Hm+wwpOOPPKjj3ch3tT9HdH28fPQpHKb7NPZqyO+dnemOqz1YDc8v6
	G2A7Jwhtjl6sQx9LBRINq6S0EVMo17UjDUMyvGhTkgVg9WuzUoAe3z7G+I0BAYldErUAJ/e2lWT
	AFcuexf6mQyhWjah2tSFDzznK4qZ+laVYgIR/uUNxdVIwgDwsafRTtbszRVb37m+iYmLOPVgow7
	9jHpWU/tLUo2qgEr1O53g9GLNPRVFSt/G0JgIAn5cokxwRfeefa7KGbmnFNYyjtOsBt5YJbL8eR
	fS1N+nQfNJm64wazutyP3VDmyBDQgWJiGoHiE=
X-Received: by 2002:a05:620a:470a:b0:8b2:74e5:b36 with SMTP id af79cd13be357-8cbc8e21fdbmr1585649385a.68.1772454154744;
        Mon, 02 Mar 2026 04:22:34 -0800 (PST)
X-Received: by 2002:a05:620a:470a:b0:8b2:74e5:b36 with SMTP id af79cd13be357-8cbc8e21fdbmr1585645585a.68.1772454154229;
        Mon, 02 Mar 2026 04:22:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1142d5fefsm1860478e87.51.2026.03.02.04.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 04:22:33 -0800 (PST)
Date: Mon, 2 Mar 2026 14:22:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/11] media: qcom: iris: handle HFI params directly
Message-ID: <ec77yutijb24k3gvyzpjorbb4i55rv7e7x4flk54djmwko4rua@bagj7w4jo3ee>
References: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
 <20260228-iris-platform-data-v2-3-acf036a3c84c@oss.qualcomm.com>
 <ab0762db-c804-4651-9bd5-8675fe164ed3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab0762db-c804-4651-9bd5-8675fe164ed3@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: upveddpvesoPE6-wY-uXHNGjBYi884j3
X-Proofpoint-GUID: upveddpvesoPE6-wY-uXHNGjBYi884j3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwMyBTYWx0ZWRfX9l5Ph0TuKehM
 ueb8bPHn0ADVTQR+XzhKDgS3eIYxbsHn6ErXZgPIuQ3iI39vg4bDO8/x6Q6gz5XZjnP+J4M6b3Y
 kHBt0LodY2xtXW93UjYB+AE3gkA+C3NPvo0x5lwZ4j1h/HBtP0PhplX+/zuRqCMFw5SSMKMnO8A
 A32s2HkruhOIuvXJukzbF3S1C3wF0H4AgY02GCRHfU4nSDyWBUd5hcS3pL9hhLqILVfAoZA/9QB
 89M/R4gENl90xYrhFEKyM2OEhddLXk3WzUiojZyfWRK70TDfbaLuY/d1wHoYVty4PekRXOtEUCh
 5Cp4/Wy6Sp8OOYhUtsZh0KE/0jON+3z5lBidXF98avktjfCVVWBAAdcgYJRtE/xeAjO07NuLpmI
 9IzX0pu4HEkg+wWnmaNCaHLfuuVCeYYknbhKCLgTdgEFy/PWSCoJvHMp2vt0zy8h/NqOjcPnelg
 VoCMZjwc+9bPY4FKVaA==
X-Authority-Analysis: v=2.4 cv=cLntc1eN c=1 sm=1 tr=0 ts=69a5810b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=qcQtHrNKKEhQtL90CQIA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020103
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54086-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 915551D846C
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 11:04:44AM +0100, Konrad Dybcio wrote:
> On 2/28/26 4:26 PM, Dmitry Baryshkov wrote:
> > The HFI params are set per the HFI generation, they don't change between
> > different platforms with the same HFI interface.
> 
> Looking at venus/hfi_cmds.c I wouldn't be so sure..
> 
> e.g.
> 
> case HFI_PROPERTY_CONFIG_VENC_MAX_BITRATE:
> case HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER:
> case HFI_PROPERTY_PARAM_BUFFER_ALLOC_MODE:
> case HFI_PROPERTY_PARAM_VENC_SESSION_QP:
> case HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE:
> 	/* not implemented on Venus 4xx */
> 	return -ENOTSUPP;

Interesting. I think it's still be better to have iris_hfi_gen1_4xx_ops
rather than having a copy-paste of the same data with minimal changes.
I think it's easier to cross-check two similar functions rather than
sets of tables which then get referenced against a "handler" table.

-- 
With best wishes
Dmitry

