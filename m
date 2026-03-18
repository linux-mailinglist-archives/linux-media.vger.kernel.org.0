Return-Path: <linux-media+bounces-56199-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iP68Kn+JumnSXgIAu9opvQ
	(envelope-from <linux-media+bounces-56199-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 12:16:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 364AC2BAA6B
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 12:16:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B46C313CD62
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 11:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17413C3C0C;
	Wed, 18 Mar 2026 11:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FCXeVVWj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MgbgQ3Y6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1243CD8A3
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 11:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773831726; cv=none; b=rfbkNA1ed2Vno0wpkMeRyXgscfrjRl7kV/3Bef5gI+t6gYnJnnIiwz8JlmoZdpSGb0JTy5eTMJi1G4Wjn13Fs0Yi6axOwOYu+u0AVPD8ZeeRPrMFRcgXAaAhBV7Mywgpuf93lYop2n7KdRMH6zGcLYxAzEaVPl3cd5V01Wo+Uzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773831726; c=relaxed/simple;
	bh=mXGG3fi1msKr1rqOQEhDZU3z+5KSHVjYfE0PBeEdliA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pn4WO4ZGnI0SUNrtzoIPTK3OehNtNGvmQVOuIfRSunUOuYcK0/aEz9+SACEdFbVTvAWGnGfilPyIikVDsF7mRH9axFxuzfBwMcWlsxImuNDlW/TwlpqjoIkLVScTGJiM2bSzdKeL52wJUc6on8B0q+hJXOGKs1jEozI4RWgIKmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FCXeVVWj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MgbgQ3Y6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I9Invu2294641
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 11:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QrvGnIZXPty4XETU1uqiYV3wUNDHCuw5A8GY7KhrLtc=; b=FCXeVVWjn8MH0Txl
	zLd+DoQhHIMImA0493MCbUW5ys5fc+W/Zn9K2t8BTBNxu8cZZW8DP7kivsTqexzF
	sFg94IwvGa69YScvLtzZR1vSkdqTYaSKJZbM/cIuoQIz37QrntVmQCwKDRmqH0/I
	JW6kt/Q35IWGYfZm3PC93roCoioMTkxsFwE2hhGOUnkD+jfP56ZIJJiav5LCUCi8
	dg4doBc5gHytpfBLjyiuHI1YGZG9RgD35jIzPFuKtN7zb+aw/q16C3cYcovCPAl8
	yS7is1nbkqQnvewuD/0uL+fZ8kXUlabT1ZZW17yXSwibHA73hXkTlXRJkkh8K0N0
	w5YuaQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cya83v1ar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 11:02:02 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82a07f4597aso3235448b3a.1
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 04:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773831721; x=1774436521; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QrvGnIZXPty4XETU1uqiYV3wUNDHCuw5A8GY7KhrLtc=;
        b=MgbgQ3Y6aEikGVWYLrAgXHtQnapwG7fDDvwNL04NG7Lu777HTgslXrTL+Wiv89osFV
         yWF++Ph6j42rd+WUIp0am3qtvWmbBx2HwjWWE65chK7tguQRKCmFi7Uw5Dca4VVjyrFw
         pxzhjyGWqjnDXQ6REBEkCYB8RJS7PPftUHI+2WNHoXgYxbxHej7FHlKW8DyCJnj4ZJeQ
         jvm0yVSXuO6y8mfQjd99q8WEQpYwy8aB7XcsVp5EjwBJclQ8PHb1nPduMijNcR1TEcqf
         s/azdexbsxQZZHZeRGYvMV2uuLjqtt6q6fd68t5V3rhZg2qtDgfutvaNEzouSdi3AmAx
         Joow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773831721; x=1774436521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QrvGnIZXPty4XETU1uqiYV3wUNDHCuw5A8GY7KhrLtc=;
        b=gLDxNbdIcMly1W2f7Jf1o2U9xEEliAgOPMa5OE7NyQRoX+gw1vQbydoBaL5v5U77G0
         Pa85TBtK12fa8pCFT2wzKR1gvoVMhad61iSvG8AeJnLHo77UIUBIIlNy20C1beZbc4+Y
         C+t3IMuQpYa+MzGqv26qWFQFeH/Vr80veiCVF8AQnBwPyDROjBpE9O70BU+OGSUoUmIE
         JkQDI5Ya8+r7CzcTTSYUvgTB+/hZBtJUgdZ6+Ze3YZ+F1oCwcwpZQah5SkA87jX0ILpF
         kBHmwhUAZ96iGRTJ7x/uVNuzHeaGfQDx+dpRH2PzxtF2aQHDpgoCN5WgycUftE/W0k94
         JJKA==
X-Gm-Message-State: AOJu0YxZSGIKs2jK2iGB9hQfg9RIhuPEAwPD3yfqkd8dCGEi0gKPVdyu
	orhh49dmBLaM8/MfWZVFb1QOvyZ8blfTApF1weX4s15Hq91il0zCpvKyTGAiAhEfXYVlLo6Lb1L
	7MefoRNhcfwyBw4KXxE/68SrpcQccqHRnoKs8SFiJ4EStl2Eb3/HtVIEGYeCmFI/iyg==
X-Gm-Gg: ATEYQzzYANDPhrcoZAYq2WydYYTWtkctUiQg5DXtJMOX85dlQ25SsLi4CEhFiSKx+Lm
	MrCmqz2dit/Y0ExmiiUQY2YC0LknEAD8NiudgXwPYlot/dLfBKtixJtqrW24WdcZOs0r2Mvyf01
	R6aSWB8qiy5kDpRV+3+6jj8Y84GToxyest+Zj6jcQLPaMlc1tBeJkqFmaxQ4BkU+TSr45d9ZzpA
	VyVuO3tVdAJnpom3Nt4DdOWccSuGXpIZoBDhE1X27XeGKF186ze9GEkUo1JtXaTcMEfigN+to0R
	jeuKHe2ViMQeiB4ID+EiG9n8sE7QJP01nPpLMKDMfSVSzq6hx8m6KyY146p33Pw3dn+ZvOAEfey
	PXglTk47K0R4SRhZpSaCNu8/vxJTEWfF+3Y/pEYBjiz4tQR3feA0xhg==
X-Received: by 2002:a05:6a00:398e:b0:829:8c23:f706 with SMTP id d2e1a72fcca58-82a6af3570dmr2770322b3a.46.1773831721373;
        Wed, 18 Mar 2026 04:02:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:398e:b0:829:8c23:f706 with SMTP id d2e1a72fcca58-82a6af3570dmr2770265b3a.46.1773831720697;
        Wed, 18 Mar 2026 04:02:00 -0700 (PDT)
Received: from [10.206.101.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6b531f35sm2450860b3a.11.2026.03.18.04.01.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 04:02:00 -0700 (PDT)
Message-ID: <3a2f25b8-9859-4bbf-a4bc-996194b73fae@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 16:31:55 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/8] media: qcom: iris: use common set_preset_registers
 function
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com>
 <20260316-iris-platform-data-v7-2-fc79f003f51c@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260316-iris-platform-data-v7-2-fc79f003f51c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XdhIxC3LXKD4TLjVrTcj6tfStJgcyI-L
X-Proofpoint-GUID: XdhIxC3LXKD4TLjVrTcj6tfStJgcyI-L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5MyBTYWx0ZWRfX6RnFjQGyfG88
 MS0rl9/05l1c58W6jI8JiNJspi4MxjObid5PAIZFGWmQfqIUevuIRwk0gDZiNDy8eN9NS9qd3S/
 BM9/ekuvZXmVpAQTNi1T/AkNKBgU2FRcM6mavrSwzHjf/a2qoTUbloxhgMz+j1OWCpqJMj1ZqNw
 fdO2U2m8s491IbwCXlRp7mZ1+56xKXgr3031YZ8wMFcZ0g5/i/q5hWXqV/p8kKy18Q3Ug31kB/W
 da1cIuVf/JzC+N0L1adC3UgdrWfpo/jwASjDTUG/MPWlGPocTRgdiqwou9vA14GGVco3G6c7D9E
 7J2PheSoKOnM+ceKW8Oiy+1/DY0xCLvtyN/yG5cBiqS4N9nRi0fDv3OxzgAnzNoG1E9/+xG3CaJ
 vGUHe2+5CG6K/1nxx51f4lgpyvRPHjPfiRCJoizSXtRy1TLEMSTodQlfyXlpqXU7O+KFK+ywh2K
 U6L50hh1lkSfN6EKr9A==
X-Authority-Analysis: v=2.4 cv=Y8n1cxeN c=1 sm=1 tr=0 ts=69ba862a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=xm1I8ePgU3ACQa9n1MUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180093
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56199-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 364AC2BAA6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/17/2026 12:24 AM, Dmitry Baryshkov wrote:
> The set_preset_registers is (currently) common to all supported devices.
> Extract it to a iris_vpu_common.c and call it directly from
> iris_vpu_power_on(). Later, if any of the devices requires special
> handling, it can be sorted out separately.
> 
> Reviewed-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>


