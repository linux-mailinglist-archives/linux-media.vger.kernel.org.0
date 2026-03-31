Return-Path: <linux-media+bounces-57743-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCk6D2eFy2l4IgYAu9opvQ
	(envelope-from <linux-media+bounces-57743-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:27:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1580366131
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:27:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A99430A5C09
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 08:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2FDD3D75D5;
	Tue, 31 Mar 2026 08:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wk85xRbJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q+zvWklN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9872E371888
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 08:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774945235; cv=none; b=mWwo3tY1lFUQixuOK6zTQdVa8ucKk9uU5Xazeu/LQVZ6FImqW9clQc0/yoz41+lxrqfjy67yTEYO1ZsZHPD5HhqfdOEOEhbQf4l+VRGjIrL+oia3c2sZPN+O0DekomPJLu27x/VvnUXqjOKL+iwWAMv7gbwIWBKYzvxaF9BAT9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774945235; c=relaxed/simple;
	bh=pIn7DVo83rKFtZQ4lodJgGsSWTKSw7e3XyL9bBLwCOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p6TlXaohaAznCJD+MThsbvUJ8+Pz8u3qrW4yVhBIgTjb5sTN18or6CQ+pkZs7IZ1EzuRX6K3TvveRNybJot3U5DBXgVss4UzfpZhpuAN7/6+ggWHkT6upW60dDsN70ZsomPZ16d/3OYtJBYbkBsEDoPyR257ZSRo++nSnP9a7eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wk85xRbJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q+zvWklN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V6A6361090724
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 08:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BG1I/liNZmNcrk2tkigeYR5Je0NJszVTJPmGzNZ557U=; b=Wk85xRbJ/ntis3Z+
	Dhhc9zf1ImvmsxEsvaPG1qqvEceuza5QEtVsZTpleMgA2EIbh/4qzqYUTWNDyMpB
	5RuuZe1ObVti7NPPMc6GMdbK/OZmpv4foFfYmjK5wKfh782JnVHwkkD0yf8TUr1c
	Y8DzGb5XoJM5x3ejmCUy8HTdwPZNuYYai5La0njIEUZYhczQRXtMnOxgG1qDjkqu
	RLBc4A6afMz2T2Yp0paWi489yCWGs35hf61Tf4KLCWMBXl06wE0Mvjy7oW7OAAoU
	DTXikLj7F05QnSdgmQX9vtcSqY1vztUnUUpzQr3k3seTfOyHCGietHg4TermHOSp
	k8xnmQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7trd3qmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 08:20:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35daf3d3030so1629094a91.1
        for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 01:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774945231; x=1775550031; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BG1I/liNZmNcrk2tkigeYR5Je0NJszVTJPmGzNZ557U=;
        b=Q+zvWklNYPcunN46OkLuUblcNtykZyWpPRMS2lzbZqE7DQcpWB2ZIWehsZfrOeIbCF
         kiEOF6nX3vT6+6i++luREMKynilzkLC+PBOUzyVg7bxBKkvWzUxI7v4aJkm/MT8CaARk
         wyr7hWyxFTP7fTKY4zVrw9ZKFIbRif7//cfE0ax1gURaDEjMMO06vYFdK/yQE16w9aP4
         6MpM3selLekny7irmPou4aNnOujzyriqmX/cAFOoDo+w92QTj7iVyYpEz2v4VZf27JSO
         Wc9W0KP3ra51XQzOCUEKpxScXce/xTVx9Hrn/P2btUKBPoPd8HNvavGKHBdkQ4TgaZf4
         UmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774945231; x=1775550031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BG1I/liNZmNcrk2tkigeYR5Je0NJszVTJPmGzNZ557U=;
        b=IuNG3UXqTm8UupAsZuI7wbwlBXu+dZcq7Jpy9n4kYOkdjntXOYwuWcwPRGC6UPaIkD
         ZVn6Qq1CSBRVCJHK0ihKP92mJ+N3lcWtlPIWib6g8sdH065IfIabm85XB3GdeNSQRTb/
         ZB83nU3u2MSjDSOpvPY7BTiBwx1Bw26gsrKYoWJBs1uTh9YleqOcNrZbVrVYBkxQwGw3
         JKviV1MyFJUlmkZx1O9FHtv30kW/XPxPYHjv05yHcqEtHfwfQjeX1UqRudU9dNJznZC0
         sCQAblfeN/E4BJf6sdtuzqvsIoGqS8ywZAyHW1cPkxwFEwPbR66uCMbIBWeMKm5xjc9G
         ZQYw==
X-Gm-Message-State: AOJu0YwjgjuNtf8imNeF/epYYt7L/OYbRnRXGeJQWw/OyE1BzyFOrlVc
	BKLwgSx4GmhH9ruWTriPtzGSZo4LTYk0bJPMvSkL83GTFmtKK+mhOxjoLIeuy7DrkT9k9j+uNJ7
	Zcbm9XK4UQZiHIjVyWrPsZnt75ULibjG03ApcBxFlF9Fxs3vNwXl40IZCQ/BLL8cMNw==
X-Gm-Gg: ATEYQzz0mK3K6Krf2iZF3fvrYYHrh9W5EBX6PGhZhrOp4l+vebxpGq53Sz9qVqRVq+B
	cgJK3tOuWSk1PUtMmyAqpvT7ayY9OD4HCEca56I+Mp/5m8AO46jN0n9WKpOkhzYn7XGHviDVUEI
	wZLipkMIvrNN/a0sT/eWsLe25zVTiqRakax4Pni2199Z9n9X2bBgZhi4MqOWgfkSCKSLvYdV4iH
	yBeGhKf8HECO2N/ETvG+fX3UqrIWQD3g6eB03b4ZPIyzHdA1t4z9VLwXBuYuGT+BNbj99zEim8+
	INP8bDrXXLrS9YmmtsNxULIB2KVNsBrfyHNaJ1/jXZYUnQCTzbq6KYb9gyfhtanDvCY7qK1N3tD
	8+vMCWLXtHJBZ3P8h0zHhcKV30UxeFzjyxzoXp3hZ/2hLzvUZxUYWAg==
X-Received: by 2002:a17:90b:5288:b0:35d:a557:e41 with SMTP id 98e67ed59e1d1-35da5572476mr7580362a91.14.1774945231124;
        Tue, 31 Mar 2026 01:20:31 -0700 (PDT)
X-Received: by 2002:a17:90b:5288:b0:35d:a557:e41 with SMTP id 98e67ed59e1d1-35da5572476mr7580341a91.14.1774945230674;
        Tue, 31 Mar 2026 01:20:30 -0700 (PDT)
Received: from [10.204.101.77] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe959886sm852242a91.14.2026.03.31.01.20.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 01:20:30 -0700 (PDT)
Message-ID: <1f2e1608-100d-4a3e-99cf-6a7a6d39fbef@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 13:50:25 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] media: iris: Switch to hardware mode after
 firmware boot
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260331-kodiak-gen2-support-v3-0-958296fab838@oss.qualcomm.com>
 <20260331-kodiak-gen2-support-v3-1-958296fab838@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260331-kodiak-gen2-support-v3-1-958296fab838@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mwWwwOUZ-E--6mYgqcovNjMe8kuiPWYK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA3OSBTYWx0ZWRfXyAAldSI1rmaC
 p0Yv003iRgfNTs1a4WMhm09pC7sAyD+hKFp/oovnVWDxR1U+okachPOWaAQ4zJQowfz0ENARSlS
 H002nyWc1EerHPBX5l4wkQ2y5Z2tWUgm+WfwKrued48R5woNCjQKufkkWRcajj2BaxqltFmwhAp
 PWasheBQPyG5hm0/EuoMdXeUWoCvgFNSiSYTeAnj375a3vreOzRCD1zaPEGEMjR9Y1wYfdROphE
 F/TICU9lhWrASIC2gruK98Qr6U9nluwwfADgpEbINdr0pKUEJKm/7+abBO9k90T9VpgnhU1bgDQ
 7w6K8NCWCjtyldzpPNIDprva37zXHdM06Qqij+oasj1LZo74UMxiE5FrAfYP97U9Kk2VgrP3S4F
 JjlBPu/FpfLZsb/Y3GvoA0BUouQu8C0NVc+MctxmO74EOAJLkdjJYs0lQwnQx5KO9StQUMaZH/g
 osKzwD4E0B65Bq1URHA==
X-Proofpoint-ORIG-GUID: mwWwwOUZ-E--6mYgqcovNjMe8kuiPWYK
X-Authority-Analysis: v=2.4 cv=H8/WAuYi c=1 sm=1 tr=0 ts=69cb83cf cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=vonRipBiouzHufA7OUcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310079
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57743-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C1580366131
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/31/2026 1:09 PM, Dikshita Agarwal wrote:
> Currently the driver switches the vcodec GDSC to hardware (HW) mode
> before firmware load and boot sequence. GDSC can be powered off,
> keeping in hw mode, thereby the vcodec registers programmed in TrustZone
> (TZ) carry default (reset) values.
> Move the transition to HW mode after firmware load and boot sequence.
> 
> The bug was exposed with driver configuring different stream ids to
> different devices via iommu-map. With registers carrying reset values,
> VPU would not generate desired stream-id, thereby leading to SMMU fault.
> 
> The efuse tells us which hardware blocks are actually present. If efuse
> status is disabled for a block, the driver will skip powering it on or
> resetting it. otherwise the driver will perform the necessary resets and
> then switch that block into hardware mode. This makes sure we only touch
> hardware that really exists and is enabled on the silicon.
> 
> Fixes: dde659d37036 ("media: iris: Introduce vpu ops for vpu4 with necessary hooks")
> Co-developed-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> ---

It is missing the RB tags

