Return-Path: <linux-media+bounces-61349-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6G+CEQgpBGrGEwIAu9opvQ
	(envelope-from <linux-media+bounces-61349-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 09:32:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9545B52EAE8
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 09:32:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32BDC30B7E4B
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 07:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD92E3D6473;
	Wed, 13 May 2026 07:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KCY+zcyW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gq14o1yO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ACF39D6F8
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 07:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778657307; cv=none; b=Bfm3NBLTNw4RzZnz0f5nsaPZW/L/oaib7l6VJUsIa63Jk68plldqqWQP3olgceNaOfkbiZS3y4P1WGze8vtpkfDuuP83A7bTio1otWeJ+fGd8rmV04xE7ZrwyAr0a0DpdpbAAuIENzz46B/Z4Oh8BX5yzdvm8/pOP51NnsoblxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778657307; c=relaxed/simple;
	bh=528VoSM2aa778Qts4gB5yQ4qq6/FD5P3P66qmqgtluU=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qU9RTnSkFjT1WVOnx83t/iWjlcnZwbbml0dX2bEff1dEBk16dK1/bH9xoa/Ps9pD8+iSlqhDARWLvsEETY/66MoXk5nIgA5w98U6NrL1FpkMjC23N+N6TueW5/x79fIBSuXTekemYcSVkEFjI+qxu0sYR7F+1qjI/3DEysvB+Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KCY+zcyW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gq14o1yO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4p81E2652374
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 07:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t5ZWdV9jzy5MxC+WapGhJHUixZePqL9eaeYtcShx2SE=; b=KCY+zcyW5mQm3sfE
	7Bx2+KqP+GvwzEdHPFUxrXZ1+eTRpmPgi2F1eaVIhfOETrntxJ2srgL3Jn6bixrH
	rdqcgR3LRlJg9tmaEHzEmIF+KMWrwSDzJ2T9TXqR+d+j1psfrvVYBy1J2QaLaM9w
	oJ0iv/BMS/SNeEdTuYr5vQ8uYrAjGwVxtF2Rb1t4GNY4WlyGISO6wKgHGm/vY0cO
	9lpwu4riih29fVL0AYajcOtsHVpxStSvObgoy0xmHQCc6nEeJBAMo6ziKzmMnHhl
	V+3v57TJvpN4GiAtjynhLXlnA7yDwXzqXRNgWte3pFFITSuDQ9E1yMScJgF7G8so
	y6vwLQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e45avkhju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 07:28:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba718173d1so111904035ad.0
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 00:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778657304; x=1779262104; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t5ZWdV9jzy5MxC+WapGhJHUixZePqL9eaeYtcShx2SE=;
        b=gq14o1yOP4aod3GKYHN+5Io35NrwJ2oz07ak4QdxJIEBn1/dV2yMBSN+3xm89p01ol
         xcMX8jWhXLGqgYsXk+vT85zMdmPHt9YXzaQW6yI+RqLA+/CwIsnosQsfjc72ERv4SzNM
         Vynsu2UVmJYMJ4iy5JKwYcrUjrfXULC6PTy8n0NRiOcfgcpgqhQYaavSTAegNLqCHeAt
         iZIJT9s4bSF2AOnJTEEuPYZHa+MthyN4PeCfiEfnvck2s2T2ZKAQMiShDJVb1nYf5ViB
         wS2sx8rlgTS9yPW8SOWKMvy5vqnq4IoO3lpT2TQlECgViqrthHOWEFoBpVSduILUV1t2
         e5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778657304; x=1779262104;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t5ZWdV9jzy5MxC+WapGhJHUixZePqL9eaeYtcShx2SE=;
        b=qnQEhhE9gaFD7uLDlEufIyUNaaXLZPfBOdQ1sIR6n9rx7AXgzy9PEfVXRqP+yPta92
         nY4oQTvQ0XBQM7hJvHoATtXsD10BlcF8441bNJxc+LQN6llIingLono1V79T2uCjW2BS
         oGMlenbEviySaHFrPl+Zr76s7GU8YIdSbdFBg0NZMF0P8vkKu7Ercz6rn6pBHYSWUqJu
         XLOhSRX1FksXC7JS/0wbpfbkrDNEb6K1GEJCW+r/HpHHFzjfi3oDDuCYABNLs0Rz2xB5
         0MtHJhm2Qy7Q+tWKb8jE27LLdPqwiqe+8yZl7DTNMYF8b26R2p4DmoEoz/LXn7l5MS9A
         1h5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8cJhTcr2OtH7yod8wXWdF4XqlbQxJsWyelTJd0o967k7dpw/aNAYwVmIglf9Megoa3fILVuiHluwQXFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwvWt4ryRIr4meFl0U5Rcj1ee/sSat1BcAaSkZ22UFAEkM/x2B
	f1V49D1TgK6R7kChfHNu1UGQGWHvvftWYqjiRA0tf3ZTNC45ZBKFUnRDoY4zRY2pokQRtd8QVzN
	zcEJIf1RSAK2PQ32ZOBvtn4PpbTP7QZSb0uM8ettFBHpq01TgJIZzagNZ1iKbOFpk5/OaN/9S7C
	Or
X-Gm-Gg: Acq92OHUi4Ce06+NdNN30fWHKUMQnS0yovbtJM63XSf3uUuZyloghJJxVnx4bHcVrA1
	BG8biVWKlYKy7o4jjVg96mRw6aKr4JLS36vJz4L1phjsDAVmbSSqvUT5OomoMh95RIVQ11eQ0qm
	lGOXZ0dCEZcqE7bnU4haHGwa3NtyKruYmknL/3YbL47FwKrRfNJttGGAvBPfxxh7EoK9pK/L7jT
	G2mmBYA8R1gzWDd/6BOcp/TybcYAFFioubWYYZVI9Jsds3jakptYdYWpHV68EN+jjTj0ZOGTyhD
	VU7FL2pVp+CRW4JMR7drwFYbxc7D4+cNG9sjqrovyewhN2OFqWBe5FhjeUCQnDXDoikiffMyxd8
	FqSd9H+00l8iI8aGT4LD6Sn3t2r8tTOrjM8hA4BfD9SF9IwvoxsxYWncVLmPcSonFA5Jbg6IJBE
	OgVXL9efLU4InEI+TD
X-Received: by 2002:a17:903:390f:b0:2ba:e8fa:898e with SMTP id d9443c01a7336-2bd3063552cmr18433925ad.39.1778657302123;
        Wed, 13 May 2026 00:28:22 -0700 (PDT)
X-Received: by 2002:a17:903:390f:b0:2ba:e8fa:898e with SMTP id d9443c01a7336-2bd3063552cmr18433555ad.39.1778657301602;
        Wed, 13 May 2026 00:28:21 -0700 (PDT)
Received: from [10.249.28.138] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ec232esm163722025ad.81.2026.05.13.00.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 00:28:20 -0700 (PDT)
Message-ID: <fd67f670-e443-44c7-849a-6af9b6c856ca@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:28:16 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 0/6] media: qcom: iris: encoder feature enhancements
 batch2
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <AeTY6px6rgEkRtdav105VvaVqOXn4ANY-7FkwVUXdoipWmEG0iNRHi3qX4YK3yYKjWgEOIBc4iCohfNbuDxa5w==@protonmail.internalid>
 <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
 <8a75ce66-8fa3-4c39-92d7-1b23919922e5@kernel.org>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <8a75ce66-8fa3-4c39-92d7-1b23919922e5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: v1HIGknya1OaXU2f0drctTKk56d0-6Ct
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA3NSBTYWx0ZWRfX2likA87ydZDq
 JzHgL5v7UZgNIk1MME3lisS0fjwK4bMlWQn8206aBPhkqagn/kFkfml3MPMpxQN9VCJTkY8SNx+
 iR9Dxoydn7sPqUj7T7ZNjtg53Bb6+Xy32Watu0j8P2dAiUe/7+Bgmj6Hj+ddDK536tA5w5iO8Bm
 UDp/hcFuBerzcGMv9TJj6uUG3eRXVaSICmVwdcxKpm8nWUwJPK9YxMKi0mUVB5MBdkw/7UXoWnd
 9QkO0qadjsp7c4coisGDoYCDeDAKHDOzVNDohH/AtVa/KO9M8XNM8GIpfHX6KjRVSrvBNN7Sn6B
 Zrl3JgbszneZpE5xLGsUBtGW5pAQlfozMSPDtsBaq2r6oXoDrvIci8hIyYUyzfv8WHxgahBbA8E
 ZHmsUk7pao17RYlwx7PDATC3CYfaE/eZpwgH48F6ybDQi6PfFaGUaVELD9OjZV7ooyq2acfOLxD
 u667bNyE3+obqVwXpZw==
X-Authority-Analysis: v=2.4 cv=bOwm5v+Z c=1 sm=1 tr=0 ts=6a042818 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=t6K0ciqNoT1HXW0k3U4A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: v1HIGknya1OaXU2f0drctTKk56d0-6Ct
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130075
X-Rspamd-Queue-Id: 9545B52EAE8
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61349-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

As you asked in the other email, I have rebased this series onto this 
branch:
https://gitlab.freedesktop.org/linux-media/users/bodonoghue/-/commits/venus-iris-next?ref_type=heads

Now v7 can be applied cleanly. Please let me know if further rebasing is 
needed.

On 2026/5/12 17:00, Bryan O'Donoghue wrote:
> On 12/05/2026 09:55, Wangao Wang wrote:
>> Changes in v7:
>> - Rebase.
>> - Link to v6:https://lore.kernel.org/r/20260401- 
>> batch2_iris_encoder_enhancements- v6-0-7022af3401ff@oss.qualcomm.com
>>
>> Changes in v6:
>> - Rebase.
>> - Link to v5:https://lore.kernel.org/r/20260206- 
>> batch2_iris_encoder_enhancements- v5-0-fb75ed8fa375@oss.qualcomm.com
> 
> Unless you need to update your code as a result of a rebase, there's no 
> need to publish a rebase.
> 
> i.e. a rebase for the sake of it, is unnecessary. If a rebase is 
> necessary then please state "rebase because commit-x affect my code in 
> way y"
> 
> ---
> bod

-- 
Best Regards,
Wangao


