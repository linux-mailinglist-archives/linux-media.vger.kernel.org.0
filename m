Return-Path: <linux-media+bounces-54076-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IPLNUZjpWmJ/QUAu9opvQ
	(envelope-from <linux-media+bounces-54076-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 11:15:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EBB1D639F
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 11:15:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 074993079E26
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 10:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31B88396B85;
	Mon,  2 Mar 2026 10:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wp7Ur5B0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="atdXtUI5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3718C39527E
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 10:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772446163; cv=none; b=PaL+kZ0kw0U2GbLVqH+0eBsdSSi/16D2fiK8NUUJnW8VD3pA3UxuMgQTxp7NYDRklGbAxeguFPczxnToV8KdCPZZGNmoqyAYORpLDbsNtk9EyxUBKKURxkURaTPa+TaUUSpgvk1LCXIEgeySogwr0SMB6jepKM2tYTYadTgr+uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772446163; c=relaxed/simple;
	bh=l7uceIMIY1mV6pvYa+qMbFOH1vYdC8XntB/RP1WCv8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W0KyCBsmWOuUhZcs/T7rORG/wwZIfbR4aB61VFA8yloMDu9qyLcSwGki5ixEC4LSp2kmcSYCpuxFSctR7sXJ8BBpp8HhKp524/+VK0vEKoThwF5CnTNkmGCCdpt3S8E5zeWfGK8LNKdOvCRZJizjUnMe26zqfdaUcYAxYrwa7HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wp7Ur5B0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=atdXtUI5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62294auF3753087
	for <linux-media@vger.kernel.org>; Mon, 2 Mar 2026 10:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gsrfegSNqrweAQN0E5QffjLf/9EPehHhXm1mL9ykDRM=; b=Wp7Ur5B0Vuc+xuTj
	jAtQ5hM8bXkr5njsMNkHFxqKGdeiFLOiAJSC7SwPJI58Wvx9umG/7RibWFh5dqxy
	ETX94KgnToXWqkFTFSm5MgMfQ5chjZrFHeMrEy+U+OaZvziM6zWu67ODy9wW+OGF
	Ot+uUYasejVe4HCirqG2rG/KZpo8fgARl7Cb6bZJc+eZowrQLGQaykIq6tg4SBP5
	ytSccKYJHE2/K7UnT2KBwtaGUPRPgiyK0LSPbPhafzHB4n6uDc+me0ttyU1jwQHq
	Wkg4OvWc4J6XoxrraSNJYb7ZYzLECfA9ut9IGYo1th//sarf0I9Hd95dc1zK1zN1
	0uuE9g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7kq8894-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 10:09:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae50386da7so5197235ad.0
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 02:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772446160; x=1773050960; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gsrfegSNqrweAQN0E5QffjLf/9EPehHhXm1mL9ykDRM=;
        b=atdXtUI5wDw07zwl1kG2pU8pUBrAGkQodLZyxsF2ME1LfufGDvs+RJjNqGrufBHMjn
         6L8OVZZLuxKbzKLe09UvqsAVj1Z1wLeB4AgSBz5+IzKKd7hXQdKm6qrgGJXvwfoKNG/b
         E6Re1RnwhedRIw5lTrpxe8HYqu5d+CCqgm91GxucD9+th2TYbJoxVuHuFqWbmci2QLBi
         u8RApMWN3ieEcRMjRsx2lRSShOZH3rmgTIqDmT0BrFjQuePRCC5OXeIC294RNrP8xZw6
         oIDQxXvxMe6iuPAhqUY0RXDEfdXk3UFjN/yqqOC1BapnacsIXkldLFAYC1UUTA5lNdK0
         b6kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772446160; x=1773050960;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gsrfegSNqrweAQN0E5QffjLf/9EPehHhXm1mL9ykDRM=;
        b=LsurkY1UBktX/5hzLQ5Egh5Sg78fGS1aUBBOVX7RxlgZFDHiNyrPK9VI4Ei+sSYwmE
         9mQSLJFYVED7NcwZTfCsxfteBNejnPEv62MMvzPtti3gXhzpBtqlfvB/7Y9x3AG7dHss
         wuB4iYHRq0TBwZ1jzWr+sR3Y4FzyTtjVcslXVREzGLRYrVBADhXWEhKNk5gb8sUZ7KB1
         KffqHBBFfYVBdeVz6YNtE3EGLGPsLmcaOWBn4o0Pfm1NsrYB2xDRUFvf4KUUXyofDzbs
         d6Xhs31ahwavzMXtE/zQ1aFLBeXon6QVYRnSKGK1MhJFoKBCmF9z+rt2kaL01SMMYRbr
         7PtA==
X-Forwarded-Encrypted: i=1; AJvYcCVWWDqbsSii//wilA45Yxv5xRNQQ9S8FdD4V9dv6ih5a//G9xuunBxuqiShOj6x1kmOnKQLJONy8TQ85A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyncT8VbSpXp1r9du/fQCCXEueXq/S6mW9I3ODJF60WNxFjd/XI
	fJrHQG8/2db0OtYAjEwa/r6lLemEvcuLNqyAnq5H6l9/ik9QQL81z9pagGHKJmdNJzJw6P7IRFQ
	LnKQdBfAUySDkWz1m1nUlqDrUrcu0GD4vgFbID76viezyoVxQXs3246K3c4rVKy+vqg==
X-Gm-Gg: ATEYQzyPWHXD7VYeIBQf79e4B/AoHGJRYM7zzlR/iHvrNoyX67Qx510ZAzz2D9/AFYw
	A69cM17RckkvflPsgE8MiMnwi0CwHWNx8Jn4mRKuh6j0HOnk1K10l1A/pnC/FtaXzIu1cp8EJv2
	gVWT5EcAum5UFSp3tpdNb5Ks1bjX2bhF5y3X4ufPDHJDzcWG/fHNL41xh/3az7ST74HR0TM3VXS
	zw+bXAC4l2aVrsuwFUDUefIiQB6Txs3zwhZPld3XLsgO2ZKBpGV1GmApri8vnNLN/x8q61esV1j
	o9Zg8x9bRAdLx6KWuYErQOeO5y5LjguZZQFU2icXYMAdQcyechZNKehpH9ncfeSItJxp/l5BpiU
	XXZr/LNUBjPpbcnSZlVuXzPjUVOLMoniACGEBcrkc3bzSneVgNIBXww==
X-Received: by 2002:a17:902:c410:b0:2a0:b432:4a6 with SMTP id d9443c01a7336-2ae2b8d4de5mr122189225ad.15.1772446159867;
        Mon, 02 Mar 2026 02:09:19 -0800 (PST)
X-Received: by 2002:a17:902:c410:b0:2a0:b432:4a6 with SMTP id d9443c01a7336-2ae2b8d4de5mr122188805ad.15.1772446159206;
        Mon, 02 Mar 2026 02:09:19 -0800 (PST)
Received: from [192.168.0.172] ([49.205.253.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6b5813sm136639365ad.63.2026.03.02.02.09.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 02:09:18 -0800 (PST)
Message-ID: <a7c04423-363d-4584-9139-f621abc0f0ef@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 15:39:13 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: Fix use-after-free in
 iris_release_internal_buffers()
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Dan Carpenter <error27@gmail.com>
References: <20260216-iris-smatch-fix-v1-1-51f6b41c43ab@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260216-iris-smatch-fix-v1-1-51f6b41c43ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tFpgRbcMLL4ttHshjgT5BV8xSeAnKwj7
X-Proofpoint-GUID: tFpgRbcMLL4ttHshjgT5BV8xSeAnKwj7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4NCBTYWx0ZWRfX0p9oZy2a3bnq
 5JZTm7nOqazoUJgiPTtqBrBN9YEcJtgPpqgRgtk+mkZONOmCoPPGuZIZVmjt8Usw32Ok/V9Cyxp
 HpSnMxOwdKBkFVqMerfL6VEGnydWw+SRtpNYjMJVosqBP0xI7jxRtqhjOlYlVh9cneI1G2fT8cb
 KoeQ4GkJSC6kV1kyPpoKSKke0qlMXJTIR2cTzty36n9HI6360pskBqhLlwGyLUU3uL+lS5MAdbZ
 uwBhgUsvaiw0FEDohkxch59bL7+zGC6tRiETcsKlpR1S9LGMPHJdhlgfwSz+69nZdM1tZNPbfNT
 BbzfPdAmSFL03StC/7Adxwe19MHPKuAfyXoxsLAD4oCPMRV2rEamrudeGPX3YMc+KiCqqtB8FI2
 1SY2bVRr9qq1WwtbWYJsVDAnAG00QSa9JjPA8CXB8c1izwlKy4nmM9Qs2nsPhrWSPBxm9LbE/kX
 PhwARRpOmOzQqbiyv6Q==
X-Authority-Analysis: v=2.4 cv=GLkF0+NK c=1 sm=1 tr=0 ts=69a561d0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=WNU4mP0iZEZjDg176sUGxg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=EUspDBNiAAAA:8 a=epIOnHcr0igDC_0qk5cA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-54076-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oracle.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 85EBB1D639F
X-Rspamd-Action: no action


On 2/16/2026 12:37 PM, Dikshita Agarwal wrote:
> The recent change in commit 1dabf00ee206 ("media: iris: gen1: Destroy
> internal buffers after FW releases") introduced a regression where
> session_release_buf() may free the buffer. The caller,
> iris_release_internal_buffers(), continued to access `buffer` after the
> call, leading to a potential use-after-free.
> 
> Fix this by setting BUF_ATTR_PENDING_RELEASE before calling
> session_release_buf(), and reverting the flag if the call fails. This
> ensures no dereference occurs after potential freeing.
> 
> Fixes: 1dabf00ee206 ("media: iris: gen1: Destroy internal buffers after FW releases")
> Cc: stable@vger.kernel.org
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Closes: https://lore.kernel.org/lkml/aYXvKAX3Pg3sL37P@stanley.mountain/#r
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

