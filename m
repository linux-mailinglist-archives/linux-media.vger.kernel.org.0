Return-Path: <linux-media+bounces-54074-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMnMKlRipWmx+wUAu9opvQ
	(envelope-from <linux-media+bounces-54074-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 11:11:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0F81D61EF
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 11:11:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46D6C30526F6
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 10:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33028395DBB;
	Mon,  2 Mar 2026 10:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R8p4kcTv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zs2Gd9+H"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C02838F254
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 10:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772445890; cv=none; b=LbgekLDHArM3TH6nso4vK0RztGijX21BROMKoX+XrAIm+tDpGakFmT81Mc2RVfO7mxNOUorEEc1Pph19MKAIwr+35nDV7YMaIDDGWJesx9H51uBA62jrgoEKP5aBMEbwhQR/ITtTUyzgEdk9hnFZe6q0dOihUGraE5tnbxJQ9DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772445890; c=relaxed/simple;
	bh=wXIgrme5afP2tiMPRUXViQHOv3sFXATlQlG1saolHO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B6QC9jkWfI0koZGg38PLYzODBRGHV2ap9T7FuyB8kT15HsELRz9x2PueQzMyhADYHhNPKCk/hE2LSNJ1TgeWW1f79TjYRz6SoCq85X++7iXdJMUOkyz9rDPXdGGxdCzpWmvfaMu31biMtKSFwwB7mb3TLBPP2oISKe8aQRTH8sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R8p4kcTv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zs2Gd9+H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62294aaF3753080
	for <linux-media@vger.kernel.org>; Mon, 2 Mar 2026 10:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bLYBII5W18wW9AhZIsmUyhpOT4qZ8+Z211ODoWRcDqE=; b=R8p4kcTvjlTzyJ44
	szYg/DEpj6MMXEUMbiiN1pw2tYaxyumwEz8Irng5sZkf93YG/J+Bh4F4bwKcnOPE
	WaCdRdZpN0YYXWXnt/TXE6X6oxGC+0J5r5rb3SLXAoQgOKzmEbWyiH2HeyzkQqNK
	chg4Ch5VtWbJW6bmhqxv3HjiTFDGQQKJX8vWxBpumSett2CL4ccNOVbin0f9Vzky
	QkGGK0AL+S12hU1mQ+AVAMo3xNRxB6P/pkX+C6pcud7yTcGpH0f6suxNcX6D01b9
	ZAxmUx5KFn7C18GoZ1M7RrVaztkr1FTLpyHJYl/UTrjn67B0o7IG3qUB1wTFDHV5
	588phw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7kq87qh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 10:04:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb50fb0abdso438161885a.1
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 02:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772445888; x=1773050688; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bLYBII5W18wW9AhZIsmUyhpOT4qZ8+Z211ODoWRcDqE=;
        b=Zs2Gd9+HRpDg0sEfdGcipIofpvFtCth9SVkeD3AVvQCxxE1S5mlWKnhap8TQlKqjcj
         h0c2cj7K+O5OGPSfx6XfAYjBU48BahppvdYvFs8HBvtOi4PlttOJvrBxl0qjyHcScX5z
         /Z1XtrN0w0j9tSTVDIYAT5OxCu1x0by1iMBeKzylI6UBJ4ggXDcGqpOuDZ8XuoEph40t
         iDVSMmhrYgIE1Ng+xUUEjl1mXFZMI5Cm28+SVdyauxh2GiTViBiIAyJnSiHJInKykWNE
         r0eW8f/43IZPwm404jyb0YwHJCqYE0LJXfswJlrt3FPQc3l//rN1tA/1DOvfPdMeaFm/
         zYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772445888; x=1773050688;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bLYBII5W18wW9AhZIsmUyhpOT4qZ8+Z211ODoWRcDqE=;
        b=C4pS6jSMmlCA2G1VW2ZFOJiR7hoCPbsQNfhbaymJqnUH6Ywyxoy+E0pxsolSPCxWUa
         iLwKrBrMeY9UtwbJNOCupNbeBMHZixHYck8uuAM1dlHnX3COulUHsNeEQHT8xw6VW9YG
         fcsv01t8Hz8MD/w/Kgd90N01E6+gYJVVW/ygo5ppddRJ9pHFQahF8hmirKSbj6CkbIq/
         8EFzXo5LLcvievvZuEZD1yEYLwrer68sfME+K5rZQvBp8SLsV54NiYx2HHq7vLLcGFZG
         oKeoyJTBJ5YrfHAZw1Xnruwxlnt3OFWjpjscJWpQx3j+7k9P0axMEZcW1eBTOFWj93Dv
         vaSg==
X-Gm-Message-State: AOJu0YzX2YZytwKzgRBl0usnlk8lq37N1CAuP63zxJgoTUKTV98DVDjp
	Dotjvg/TMrXdKP9/2wN7pera+/AqbmcSjhc/fI5HPu1+Lo4UdaMYqSAaaT1l9L9txznykpNfEuZ
	c0TJBKPaEuKw4K+n+MECmP6sEa3N0CAgNNb1M8/CWjWy1mBh0d1Ib05pHEs59Cy9rqw==
X-Gm-Gg: ATEYQzwoVpNZh9okhlD40gkgCixByR96/HZvR9yGo4r3L4gMdaG/pMzVc2XvradiKcf
	1hJwZTKZ1iSNEyDcQzgzsZ6TrteIidyZ0J0JOT8cQX2LmWH/WkxeQ3DCv2zlotINwbp8SiHnH4b
	1/wWcGhVJ24ZllS9f4fmchGz/0jS7CNL20Iww7MK8DcpZBmOYSU1eEeFVNLC+C8mGdY0/UJW3+e
	CHsujTLpZGvQUf1TUGqUZ+BfP5FElRzCYJZX4AivNJGF+TP4DfxVEXC3I1MCiDqZdQKDd+cBIGI
	JOFtzqK5T40tcPGQ6LO3hbwFbMI59OT+x/dwRRH2Nzd/nt15Z7XopGTPdBveVIej1YWW3Q5usXT
	LJ0ZEXjekJG6iEQ74AcH/uqWuFlMVacMVDnZyH8VUY4DDpmp31c+ucmN+Jh1GZrB9tp4tCwvIsu
	HEscM=
X-Received: by 2002:a05:620a:199c:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8cbc8e6b61cmr1015330285a.8.1772445887902;
        Mon, 02 Mar 2026 02:04:47 -0800 (PST)
X-Received: by 2002:a05:620a:199c:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8cbc8e6b61cmr1015327585a.8.1772445887456;
        Mon, 02 Mar 2026 02:04:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae6131fsm447236066b.40.2026.03.02.02.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 02:04:46 -0800 (PST)
Message-ID: <ab0762db-c804-4651-9bd5-8675fe164ed3@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 11:04:44 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] media: qcom: iris: handle HFI params directly
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
 <20260228-iris-platform-data-v2-3-acf036a3c84c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v2-3-acf036a3c84c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GD4L_PLSfou678dvm-wv3VyIkz8IapVv
X-Proofpoint-GUID: GD4L_PLSfou678dvm-wv3VyIkz8IapVv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4NCBTYWx0ZWRfX1lZvooe8L4r8
 /nqVaZZKlmojNY8mndUcerFOjQOoGJmMnylg7zPCCeuFH3OeRj8cu7YU3hIMAP1TlMtL/qX2b1N
 c3ESZlM9JULBDFBoxgEuJekzzGwWNlrjnBQyrdmzEs3MNeofY3QCFlbZRphIBxeE1s/wunySKSr
 /WiJTfAUmpRVJwJmpc8WvxXtcyvn8KSP9uFql+X09Y5QbV3mzj27h3Q2dNvb78/rbvZcBA1iO7I
 4CIXvLvHeoUtKOERkctMUMMFeN7DMNAaOld88p3kbo4+KsCd9l83uwqKnwnM0MFqbTuNxMk9T9I
 O5113DYOmM3F0cVe3ORxPnt5oYNwlfs7v2c9eavY6X6CoAp+3BLPhjw9me9t/lwgaUZ5+L9AlBo
 512VLNZI3ZKP3bxT6i7VZTC6yIrAMQZCMau5tFDfe/zOwKAc6y2OiyotPD/D9yS009ZvEO1IbFj
 ABk/aXfGQgzU+IOX19g==
X-Authority-Analysis: v=2.4 cv=GLkF0+NK c=1 sm=1 tr=0 ts=69a560c0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=v-HoNxYEqgd66x2SWJoA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54074-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1C0F81D61EF
X-Rspamd-Action: no action

On 2/28/26 4:26 PM, Dmitry Baryshkov wrote:
> The HFI params are set per the HFI generation, they don't change between
> different platforms with the same HFI interface.

Looking at venus/hfi_cmds.c I wouldn't be so sure..

e.g.

case HFI_PROPERTY_CONFIG_VENC_MAX_BITRATE:
case HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER:
case HFI_PROPERTY_PARAM_BUFFER_ALLOC_MODE:
case HFI_PROPERTY_PARAM_VENC_SESSION_QP:
case HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE:
	/* not implemented on Venus 4xx */
	return -ENOTSUPP;

Konrad

