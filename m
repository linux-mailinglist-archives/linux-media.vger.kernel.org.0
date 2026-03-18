Return-Path: <linux-media+bounces-56203-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOUQCK+PumnSXgIAu9opvQ
	(envelope-from <linux-media+bounces-56203-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 12:42:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 762432BAFBA
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 12:42:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0205304D97B
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 11:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C183C7DE2;
	Wed, 18 Mar 2026 11:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kkH/cHW8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fJj2wKQk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B3E3CD8DA
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 11:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773833951; cv=none; b=rVOgNLuUnLxV/NIC1sXgIMQnb5vt4fphUvglu/FOPiNlUHekN9b1VHgDdYLm88uCspoMNysZarYP0kSK3vOMY6iloRTszZVdXFrRAxqne8Nlbg6+RKGLKakFRtQCHSogUNTclP6gEnXRmZo6uVMJfI6Q2P8fZcd26AbMftHHhck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773833951; c=relaxed/simple;
	bh=o8MsylkKNqnCY21JiXI64HiJoZceiLCcKPMcJ7kXa2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nXYOhx583Qg3es3dOWzqXUtjuyQ/mOdzLXzwFtNwGZVYGKe+1Zr9J2snsvsP9Yw4CGADJ4owYtrYuHTbOKWeDnhXZIiYT5m/ITk53zF+jPrFgGUvDdGaDvb6tMp9fhYDtzwp9Y7QWpOxjjOm3Sz/8ZSvzBWmzlNTGm5H05hMFCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kkH/cHW8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fJj2wKQk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I94uJh2730141
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 11:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rXeJ2W9R5aktgo3n5YO5Wfowmq2vMFWfhBA2x7IPLrE=; b=kkH/cHW82mDvgPqY
	c36RkLru5x8G1q9Fw80L1zPhKdB6uQkcFteXuZqLHti+NETQ8F6B+X89iqou0tuD
	C/1KOWNDSOxVh4BpQ8wH8IQcyEZ5D6MISLPQvbHGlS3k19H8lA1QX27fueIyQF4l
	b6Bqpg4vh2YT2x0P7kSv0hSmALYFshs+4fwBsfYkrq71UxiQCpLLeD1OCz+9oWEm
	yarPbaOSrDgy8eXeTXIOZ3oKqPYvd3nYlOWnkgm8pMb2OjC1LYnUbi2njxSnNqBw
	7jIu0T23haV474nucLYasvS9azQ8KvPFpOi50Gp2T5O0rtnjCJUTJh1sEIllsGhE
	oONmVw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy8kjvmbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 11:39:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35641c14663so1102098a91.2
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 04:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773833943; x=1774438743; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rXeJ2W9R5aktgo3n5YO5Wfowmq2vMFWfhBA2x7IPLrE=;
        b=fJj2wKQkELnbKBmnQXm/BOb2DLzBIZRJXl2EGQIhEVVMvdczOo1cp8DcBBgylrmfkV
         nZNSWY7CPdV255grvJjY6vjr1vFywgm+rKlDOJ+4Mw/C/dqe6HQ6kFu9pXilL0tDHRQv
         hI/vXEzwbwe8ckMiJdOMbmMVVmqDjybEaxnlxBY6xr25Q8p4m63hSGtZyYJIN/CoQUlb
         MLmTCV1JdEE0su3NbmbGupfDcMly11ESN+2aL/YsK0wS1MxU4bZQ3Y91Zpedu2cczqmA
         jma6v8ZriSewVZa/0UIrtqZhFTUwDG4hZb8Cs6EbbjUHzqGszuBLDgNfOtqF3Yw/JMgf
         FAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773833943; x=1774438743;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rXeJ2W9R5aktgo3n5YO5Wfowmq2vMFWfhBA2x7IPLrE=;
        b=iONrE7J8z6Nnbcvh6A871g+Vw4FJAk6HEJCPOHz5HZpakIvQeRb+vg7LiGBblK9AU5
         i30WGAo4vAsuHqMUQDiXWfKnJnX8wPp42is2lhNwSg1ENeBGKZHNsOEm2jvgOuD8BfJH
         RXQIS5wYtEaS2tyn2FvB0ptr6rtHLHCSbFy7VnvZmrQsTn8VrDRkFrM5xo4sffJFe4Lr
         F6KmWKacOzYhDJYWJMSAMgoHZmCPrV/OIOcmutlyWxX++SBEf9VjqdKhsdrbtHiQdJ1V
         NBCopH1Li8vd2JYCnMs86se+9DWsUkAn2LtgolYxcLe97qCQUPRbhGAK8SsX1OS85JjW
         oz0g==
X-Gm-Message-State: AOJu0Ywj3EaB3pMyTP0P9vfRkG9BA9Cc9UZHkyRtcuHc3WCvCVheiBhm
	T0Tddu7VZy2L3H44Ouo49qmhK+tbXD+UJDDhWtQhPRkvcdiar46/hY7qwGm8RzukrzPVEsOOdMr
	G24QlGQ1FebTAjdZiDWY5jbujSRibXYrKrcKy3EDPFFZakFiBDDb1cNtHzdDzTUT9tQ==
X-Gm-Gg: ATEYQzz/+cfVtEseRWe6Wlo3T3iH1kQ/SK1/JU6wzgzL7x/lYMh9XE+PqdaZvNcbXP3
	w/WAAmvv6nekATEbKK7vPSlqZ3P+1Da4Y+9R0FBRkWG4lG0xR/coeb42nwHRabtckx9AmsTcZTn
	6hkZQ7Ru8wnFViVnuPP9HZaeoqt7LO/6pfd97LtRb6guxXAdstjYzO4rmW+ybtm/576fWrVE9Cu
	VePBtxD4hnzhxOyph1PdtniLG+Kd0LHklGa0qygSYOZpyEQ0M5rGgXrpXOqab6VWARPjgRN4MDS
	Qp6AE/O/O84rvGps863rJ8LT5SjYrhQ8s/ZgHPL2k/CyCZr5aoPzulu0mRgyKHcuHcxc8neVJuj
	ZMQ/MUb/UV6MFZ7grmDtdJeuKzHe6UATfOrcVvExWkA7huRqkldrUiQ==
X-Received: by 2002:a17:903:2acd:b0:2a7:d42f:7065 with SMTP id d9443c01a7336-2b06e3c3843mr34896015ad.27.1773833943141;
        Wed, 18 Mar 2026 04:39:03 -0700 (PDT)
X-Received: by 2002:a17:903:2acd:b0:2a7:d42f:7065 with SMTP id d9443c01a7336-2b06e3c3843mr34895705ad.27.1773833942658;
        Wed, 18 Mar 2026 04:39:02 -0700 (PDT)
Received: from [10.206.101.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e615f88sm25207385ad.65.2026.03.18.04.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 04:39:02 -0700 (PDT)
Message-ID: <1373ca07-8a94-4f72-95e9-a5d247bcbb3c@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 17:08:57 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/8] media: qcom: iris: merge hfi_response_ops and
 hfi_command_ops
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com>
 <20260316-iris-platform-data-v7-5-fc79f003f51c@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260316-iris-platform-data-v7-5-fc79f003f51c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5OCBTYWx0ZWRfX04Ls6Io++w+K
 VKsHjGx0CbaeNZN3pAMsd+PQ7PEfwYJouADc7EK/uiVoq9n7JyM26bsc3Vc3cq5pjXjAB1ByyoE
 OPRKsK4K27fg5MHwDyabThfS4ZEj3ssu/48k0HaqfWMqf7j1R1M/4L6lxLvZFYMFojJtzDNNYhu
 wROcHOqUyX3Go0Ahym3T0c0tCn/MNUkzTzjymcDQL2Y7qXeoE/qHvPQj9XEGTiUxOL0YIPFaJFc
 951vO95cX8hfkkQ/zgSJJvTHYsJF9tXb0CEyuYJ1Xx3fB3ugfsRXTf4ZOx79oeiveaXa0csjCZS
 9Sh782AOWY8elVpTr6e83xi/MRZrO/R+zN91egs/z8b+l6E1mgeAN0jowTGuCmTpbu8gAAuRpfL
 FALnAn6fNNhAZi/LCJVIt58rwTSYYy9skxxg+aRjN8w/XSCNBkWUeewFlTsPfQyqixXQbYDc4Oj
 cpTUC6jumEF0yRUITHg==
X-Authority-Analysis: v=2.4 cv=P8I3RyAu c=1 sm=1 tr=0 ts=69ba8ed8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Dj55yBBYgCuu58Rt9dMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 48mB0oDEmBReMoxWW74fcmEjCjYXy0Uj
X-Proofpoint-GUID: 48mB0oDEmBReMoxWW74fcmEjCjYXy0Uj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180098
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56203-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 762432BAFBA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/17/2026 12:24 AM, Dmitry Baryshkov wrote:
> There is little point in having two different structures for HFI-related
> core ops. Merge both of them into the new iris_hfi_ops structure.
> 
> Reviewed-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>


