Return-Path: <linux-media+bounces-56198-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEFrF6eHumnSXgIAu9opvQ
	(envelope-from <linux-media+bounces-56198-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 12:08:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3012BA841
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 12:08:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 185F330BDD9B
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 11:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2E03C73E8;
	Wed, 18 Mar 2026 11:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hv+qYdtd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gPZd/y5H"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FD037C922
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 11:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773831699; cv=none; b=miI9fOdK7PvBWdHcx9rQObWPtdaJX+Yu5Q1y9T5Svr9cVStb/m/xRKTFxSRwesFpZyEKr1kOeBxPHmP9dRFdaaO7sYlLyLKkKqdMDeU/nsgrOQXUQfJ+TolmeYGkiv8du7oXUne9S6PFdpMdDx0Dg1Q3gaVT/EGzkmm09Q9NPU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773831699; c=relaxed/simple;
	bh=A0f4I0OZs1dqTYfPadbb3ckuw4lRvrMW3xJm5uiysbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aa/dxFlvBjwrYi57wsobM2fnpX537AzNs7vc/XOuE+UI0sQw4/UPcs4s7Xk04Rb9Jrul8ppk7NIktHMaxfCF2837mkzPfR/+ukpXJcVNOocUcqd4arXbeqJP2CiDE5IQaMfz2Gz4S9aEEb8T3cRtkbUnMEdxh8Ok2jbmNapj6rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hv+qYdtd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gPZd/y5H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I90lDm2241177
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 11:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E5LxkOuvU8fMQyG4q960dml6b2JQv7eMWU4n+znqRHk=; b=hv+qYdtdqJeBEy/f
	pWZRn3i+1YopieYJ6puu+cbNv8wRjV+RaRVOz9MHOKESzrLWje4xJwnQ2l/KWGdD
	w4/Jg4RYINy5NHmJuF/KY9FAp5hdqUNIgRis4CJ6zQG3w1mjFJGN0GDLpPTXK+Yq
	D7KA3SeuD51vgAEF11LOx5xdgZ9lCi4RuI6wjNUQotDrQj42bAREiHJQOSYtGHqa
	rInV4RhHK+gI3mcimzsFfe7KmRZA8mThM1XglQw5S7S94ycZel3qeMwv/eIExOjM
	6LXG/94F7zaNqIqGSaYVwX8HWmfVIhDj+0dL5r64BKWWCl0KnlK8Ge9VkWmUNBtQ
	sEpaIQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyak3uwgh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 11:01:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35b901d542bso27290888a91.3
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 04:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773831695; x=1774436495; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E5LxkOuvU8fMQyG4q960dml6b2JQv7eMWU4n+znqRHk=;
        b=gPZd/y5HeNkL8yARNJwYUtwKE70ZlD8gzpgmjQ9mppH7g9xtja8h+d37s+RPwRmfts
         kTWa0Z8TG4slk1LeTQiReAAbg7zFY9gjYTvtY8VJ7mpntZAXTZ7jOEboUmBCxHqUmo2W
         1PIK1YnZWWyLQX4ebl0sF2qOwiULXUY9q3DE5jcspIUL6elmO6SLAwtd/HuZxyW1hGrX
         TVXL8EuzFul4B+qOyVHVGwsw1+LVec4RL+194GP8xBifbhp1fo2gPC5kcqj7imU/84Gq
         S/hotD/RguD7cqXO9yWUkm4kAjX6CYUcEZq29DX2cGLnQvruuMpzm8zNGJ642UnQpx1O
         92VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773831695; x=1774436495;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E5LxkOuvU8fMQyG4q960dml6b2JQv7eMWU4n+znqRHk=;
        b=ls+ta+cfDA8PsdfRp2AmwzaPRuZM5jebO3fA1x20lLweHd9/fwjFslG3xddu3HansF
         FD/J7b7T98c/4MNQjcxOuGQZojFwcDOjvnD5gJy+7Aj23YZFfi9mrYmx9aIUGUw+9PEj
         bcq4LESpjfopl/cJDAPl9UJ6x58eZzhxs5NMPW+cn7PNgxxMRH4PPprOPX8uUkelUs8T
         dZKaqujBopQHhLBuHNY62/6EPZRGDIMGc8EARHIk1QfiWKeq+cQwhZ5zkKv9/heUhZq1
         tomLoS1WtgFnrSs6QSEBMzjrhsO4g1qIMR2oQ0BEf9pzcmG6+F2bomwKJxXctNKx3FZ2
         uEQg==
X-Gm-Message-State: AOJu0YzipcQfU+Sar+0+qL4m4jCyLwoKrQnta5/jg5TFRsG5uwG9C4aY
	BnK6P2Nsrjn8R4ah2YJOT08zcMgSJfzmMukfZ59UFnRSrEFaaDiAPjtCZ49JrNyIXjtEXPvE6BK
	DbeHjfRDr25fuFEt6p7ktvFVB+mb+riYuO8qDC/wVcz5mV4uyYu4Elx1mZR49/QRgpQ==
X-Gm-Gg: ATEYQzxCuQ9gjpbBqhvCz4Fy2XGsz54UcSii8s96cB5HGx2gx7m5I+4iCt4RFtOoDN7
	p5LOF6Gpq1CBRPB0ZE4OiDNDGDVBJUS6HGuyW8KOc9ijfb0CrC3k8xO3UJgyYEJRUDuXrIKju8q
	HNJjcCCjK2KY8eoewMlyaX0i4J4dENehjv1oJTXibbG87eC8tYlv5vg1jvDU+BkO6qa8B07ciBd
	QjPjRBGKzor+SC6HnO402/qSEx19w7uNXBbq07pp0qwuRP4EzAkc+dfH2APq2k/mjOAUFGcoTKI
	66gyYC9UCOmqwzLzmC7SYbCsm8FNijtUutcBvFdi4FQUlVpimTegE2Yipiv4FkNrXuXuUvw+Dn7
	1yMOtl20/Srnsn79p05E5I8q/gZeQPCzJkaO03gp4+hz8LubxCA3Lmw==
X-Received: by 2002:a17:90b:540f:b0:359:f22:8879 with SMTP id 98e67ed59e1d1-35bb9ef22b1mr2370884a91.22.1773831694842;
        Wed, 18 Mar 2026 04:01:34 -0700 (PDT)
X-Received: by 2002:a17:90b:540f:b0:359:f22:8879 with SMTP id 98e67ed59e1d1-35bb9ef22b1mr2370856a91.22.1773831694356;
        Wed, 18 Mar 2026 04:01:34 -0700 (PDT)
Received: from [10.206.101.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35badbcb8b9sm7982500a91.13.2026.03.18.04.01.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 04:01:33 -0700 (PDT)
Message-ID: <aa6e2355-f379-4cbb-8449-c50de99f2e66@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 16:31:28 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/8] media: qcom: iris: drop pas_id from the
 iris_platform_data struct
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260316-iris-platform-data-v7-0-fc79f003f51c@oss.qualcomm.com>
 <20260316-iris-platform-data-v7-1-fc79f003f51c@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260316-iris-platform-data-v7-1-fc79f003f51c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=A7Zh/qWG c=1 sm=1 tr=0 ts=69ba860f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=OinizHH6AUJIbddlOokA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: C9avyY3OHZ3uWRXzCXK1B3CZ8dmnX0d5
X-Proofpoint-ORIG-GUID: C9avyY3OHZ3uWRXzCXK1B3CZ8dmnX0d5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5MyBTYWx0ZWRfX4tlCl3EYRDEa
 D3DT9vkJyRzYAzNxHD6fYw6ERfAc00n4RwIqQEco6ZZP25MKf6GQahgunNzLm8WdtLBUQQqCRzp
 rGrFLuYkALdHPBN12Ge+4m1HgWuCqrpH5wd7KO3lS2pC/CLeKMDMBAO9k3c1RML2Ztvdy3k894B
 TJMN4EOf+DkxGF98w79+sqkhlqPjC7mLtyPtK92h6C80b7fHiHNhuYWYQe1yS7Me7qQ0if4qdAH
 1zuHTBy3MI8Vxqsu9gzvRJojPYo3biBDoswt0+rd2dvKfh6nVFBSYS7ONZbSpjjDkPdzAw26tQ6
 8/I5ESukiwxXmloYBDRvcnxNlL8qj/gXqdHNjPtan3qD1NHjjm2AfOnKHGcpdsp9eTfGJuvYEvs
 VvSDc0BIvNXsRr9bNWAK+CZh5LSSZSonoAOdA85uqBh6iH3YEVBcq4JwXcZdSI7XgHhX6Lo4ipc
 z/QaqX1m013hXnAfR/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180093
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56198-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CD3012BA841
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/17/2026 12:24 AM, Dmitry Baryshkov wrote:
> The PAS ID, the authentication service ID, used by the Iris is a
> constant and it is not expected to change anytime. Drop it from the
> platform data and use the constant instead.
> 
> Reviewed-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio<konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

