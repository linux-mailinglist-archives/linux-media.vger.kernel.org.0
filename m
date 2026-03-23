Return-Path: <linux-media+bounces-56706-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EoJDrIzwWm7RQQAu9opvQ
	(envelope-from <linux-media+bounces-56706-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 13:36:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D33B2F1FD5
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 13:36:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76BF4303DD29
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 12:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9785E39FCB1;
	Mon, 23 Mar 2026 12:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DG8DuTeg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S1txus+5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF71F38F927
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 12:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774268966; cv=none; b=sce2P19l1t20+NJlrCjn0JiLk7JZ5jZAO1qvzrexZFI6TZF37+ssoki7NMd+n0NKZrc1iz8Ryb1wElTvxmvTiSQvix/S53WNxKNmrJD2L4351IvYPCp8fZLBBBdWJjtv2JTi2vYMO4bMCOW1gBhE/0JF3zh8IhpDxuV1iORfKSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774268966; c=relaxed/simple;
	bh=64m52hPC5N/MnkLtjidKUoR5KRP7JyUvrc2mIPo9bK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KJucx/g/ED/qSu5k2mt/XghwEkr+WS0kRwaCgEi20Q1TZynDPI1NtW+pMNlD3a4hYkkju9twK/pCfbqxLYwjetxhrJY22qRnTfpWDgIN9B2eZKLDWYiLIAnWtczeUEP+ynlPL4LgeGTl1UzA00pL6/nr9d8F+hhwLjzH00TSCPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DG8DuTeg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S1txus+5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tUkm1627050
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 12:29:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ICXSKOx1B6e1+BhpexWUhl5Z782Ljz3yp9i3g6g7UL4=; b=DG8DuTegZX0YBl7M
	DSU+RlxRl2hL6gjAnuijqMqLRuqatjAokJrEMTzdoWbrCOAXWs/xI59Gq1yNpIw4
	ZDGor3JT02PqknNcgJBoWlaECBtLX8orQ7uT6JZpCtyRWrDPo/fWg/pm/9cLM9gF
	uO3y81BcelN7WhmA0iUTUUXEWykLn+k5a1VLVRnlB2WO4X3fWAZTRUFYB8GL1Fu8
	EbUaE6F3BpjTIfHBdeg5YJcnnTejrNrZrUdB1l0PPI29wR9tFJ132dnYZoaoD7Jn
	RijR3+zz2stCLgbGjauqzeqcf+BU13pLR8463VFzD0/Xmh1KdFk4xH42cO0mfDmE
	leKdEw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc0xdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 12:29:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82a73ec7290so1581983b3a.1
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 05:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774268963; x=1774873763; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ICXSKOx1B6e1+BhpexWUhl5Z782Ljz3yp9i3g6g7UL4=;
        b=S1txus+5+u102Jq8bXjD+F2NOBKbyXZiWWpj1VUkS/c9P2n8TBV9++VlfP9vh9eIrB
         Dxcr/PIzBCCHwIaJ2ua/qv6zouk1RHZUORLcoPdvsC0DX94BuZGT5QtNYbeOIWYcv2kj
         2y4oMg6OsiXC9mU2PppsedkCWBGSvyAeDPThtHZoj/t5fcmVSASNd5OVwmC/XqhFoZmR
         N3U/8UOwrYdgcNgkB0cBOgQUsHrSeFJI329hIIH2ibrRK4toBUFKOipYAWko14vnM5Tv
         nqzlwzhoAm+tLx5Uagw5CvSsRQnJbCN7+p6JLXrxqflyCap1KUNin+JYAZRws1OJIsdX
         bb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774268963; x=1774873763;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ICXSKOx1B6e1+BhpexWUhl5Z782Ljz3yp9i3g6g7UL4=;
        b=Cw8P9YwHUbvFxYZPoias7ZhVtsE+HQI1IwvGOCVAJUOu1CMCWVH4EweipbKeSd1QxJ
         e9itjv9TICEd5LsFXyV8eDJLqpUGam2Ae9R2oB3KHKbXiiHl1YJZyTphMFbR6bP8kHqH
         Rry/Tahb224hhkcY3nXsSqpK1jvja8OKh5TtnaYgY0QMM7eQUhYiZ50wfaSmgiOP5+mj
         alvfvDHoYhi8gqkh7hizsg0os7I2NXU9EnKjlvDtaSK3/iraKraLRQtqjWHE4xEgvxVE
         fMNihrk9d4T9pq7w+4EtrNh1vAUMJ4wemr6VKMNS85556LJ8yYGYWGUJHQpXVfkc1RZF
         9Vxg==
X-Gm-Message-State: AOJu0Ywh1s2q/Uj3Rp21vcEBlhq4o6A2coZxGl0GnbGDPPl/cI26n98g
	0NiC/4oHnlmZPgHBbMPEMd818c9tONkVbKAzY45CZ5BtHOLFvXi0OBdunn8elWVoGCEhKc0PLND
	Xhfusa+o3inI34j1YrvsdvjDHoAhnmxmOlE9luNURYo8TLOc5TMwPkX0KiVhGwQxFgRvGlrT7PA
	==
X-Gm-Gg: ATEYQzylc1hS7X6XjPoNZ0I9Cyd5CNhc95hYbfdkgz2odoWu8MDXsALjMz30A7Aoe5z
	RW5b+tIzjDi451P5zevfK4ScixsJSjVsRhfwZQpssfI6FWqn9I9/GM8qQ45muBabW5uD2EC6yOK
	GCmevU/Bv6BJ7GnLWbetwkBgGfjpac9X4IIcouPZt3c9y+u1Ah7yPmkwR3UGRYdK8tSfFQVvEbW
	0Ir2je9uyg3Sz7tcROdt7anNGkHW1Jx+t+4o1zeqtxxDn+fFBHeKYdL/Eew5L+qdUv9HA16vC3K
	0wFbFpJIZyJ65uA4NpfaA3EpWBIs6SwjNSmQoiFvRqD30O1Ad7Dquw0CYyeUby4tb11dhBGdSLq
	uKqD/tVHspkd0ypf9R9SHy4r87dGJzo8+3vKKkUcqPI+dFc6HIp+ZzA==
X-Received: by 2002:a05:6a00:9505:b0:81b:c2b5:31a with SMTP id d2e1a72fcca58-82a8c397f53mr11082120b3a.53.1774268963310;
        Mon, 23 Mar 2026 05:29:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:9505:b0:81b:c2b5:31a with SMTP id d2e1a72fcca58-82a8c397f53mr11082093b3a.53.1774268962779;
        Mon, 23 Mar 2026 05:29:22 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.233.113])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b042204f8sm11519692b3a.59.2026.03.23.05.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:29:22 -0700 (PDT)
Message-ID: <19d4fd0c-b1c1-8caf-703b-649b19902f92@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 17:59:18 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v8 08/11] media: qcom: iris: split firmware_data from raw
 platform data
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
 <20260319-iris-platform-data-v8-8-55a9566ebf60@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260319-iris-platform-data-v8-8-55a9566ebf60@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c13224 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=hbzS8gabZINpAvasuVNEhA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ATcjf3gZzKgDnsL-OLQA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: qtyEeIRVBf5LU20iWjXPJz5txugPKWiV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5NiBTYWx0ZWRfX8JwTrvjU2HiR
 FtVw0OoeK9ros7v1qDp9oAOdTcxeFlZhclfaWkoYeP13e41oi/yNwWbHhPulh+8I06Tr30hfBqR
 VRWS3mk+nBdKByEbv31JBDB+MR6sOzMR/JQvZ9kfjk1sOnZI3WYEzerjFFzDqB+EcCFdgQYtCQj
 J875/PDgVg0qAwr3frvV+jomrThs89QJm2kYRqZ+Zb5kKLjVg25OJfUtLeellvsj+oMNW+QLCjP
 dY5nwYHwnEvqlfK2WpNZWVKOqshGJCYmsbCav1j5d111HvRKUKDiOyPOY1uBjzZf5S/H7wEuEu1
 bRjJ+zFnXX/Q2uKHyRiXmGJVoWC1tNTpFQO3F3kwBjDWKdiNwobwmtqUyv/XIRdE4SMeO+KdEqj
 epPtaBgupr4HHK8kcq8vhZqJTR+Kfq7LBLk9k8C4X8G3Xnctn6BnpjB6lWQuFVvqZwlHJTRxiSU
 A8iKCNUiH4vD0pnbzWg==
X-Proofpoint-ORIG-GUID: qtyEeIRVBf5LU20iWjXPJz5txugPKWiV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230096
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
	TAGGED_FROM(0.00)[bounces-56706-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9D33B2F1FD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/19/2026 11:29 AM, Dmitry Baryshkov wrote:
> Having firmware-related fields in platform data results in the tying
> platform data to the HFI firmware data rather than the actual hardware.
> For example, SM8450 uses Gen2 firmware, so currently its platform data
> should be placed next to the other gen2 platforms, although it has the
> VPU2.0 core, similar to the one found on SM8250 and SC7280 and so the
> hardware-specific platform data is also close to those devices.
> 
> Split firmware data to a separate struct, separating hardware-related
> data from the firmware interfaces.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

