Return-Path: <linux-media+bounces-63482-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6uYLDCu+H2ogpQAAu9opvQ
	(envelope-from <linux-media+bounces-63482-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 07:39:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EDA634531
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 07:39:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="gFwvN/NT";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dRd1tkM2;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63482-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63482-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4C38301D6BB
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 05:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E860A38C401;
	Wed,  3 Jun 2026 05:39:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E0037C933
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 05:39:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780465184; cv=none; b=R/lN2xHFkmGjmRqyDDI2ej2/it5GeRZCrblyJ959fUvDOEjoz5XNs+tCu/9U0IGguFxWW5jA5vAUZi+Cmn/vu/7DcgUWJj0gqyjmg1mDbi15y/Z5f5Xy15k/9hV1OMFwi1dLfIkBmpmVoNvzqr6XzEBg62Xt/l/6Gz0KDJHwt2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780465184; c=relaxed/simple;
	bh=QWXlDTxJzDkrthRwYVwzN1NdNghfVqA6sohnVAuEH14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f9QsRo0paSJJ+39tRCJ0o+9aOYhomRfs3p50SYsgzXqI3dsuOoynn4hXj/G8WQA1UY7fleoRgqt6PbIVGwX7q5wG6izYjEApvTL/iyI0yIPbG4nCIUcUADQbfMdDqLziDqvq13FY9+byWsmJ+jZwkhoYgBubiRtvGzOiSSYH/CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gFwvN/NT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dRd1tkM2; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6535Wop4260577
	for <linux-media@vger.kernel.org>; Wed, 3 Jun 2026 05:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oCMutz/MyDhFR2IPTdBR86gHzqmBqi9zc2xD34Nwwhs=; b=gFwvN/NT7sPgzj62
	CKGfx2dursqnvLzRufm2muLcqMueBJEB+BZxAbEt4edrnlERAoS6j0X4Ajqx+gaK
	CWje20/aKu6STz3GfeF6hjFnaNSqgsiDWLE4aL5QL+Zs3Nyr95e9wbpn/yte9H7r
	2A10xTZZRoPxz31s3zTCJURFa7fXLTWBwXHRSOTSoL9vLH4qSM8ZmKa3Ey9x5vtV
	87PG/GyLawCCKaQ0fBcHilkCoaFpapxASjXZH5D0QgtCf+z2Zlgmhi+yscU6KBwU
	GYq4ko++njlorEOxyUzmrBALO/wONWxVhQNTN2kGxiD3Nyw+qxUR+z3VHr3TF351
	eCOhHg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehs9vwe2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 05:39:42 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85807671b1so2496034a12.2
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 22:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780465181; x=1781069981; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oCMutz/MyDhFR2IPTdBR86gHzqmBqi9zc2xD34Nwwhs=;
        b=dRd1tkM2RnlvsOa5pi2IfDIoGKgaUxSI1NzMBEOQ9IqiDw1h47joDkJja/X9idsLt7
         w43J6pv83KrqeDLP/iJnEx8bXpDXhauITMypHRqfL1IyvxmWP2rS+jkK6LBk2LcbrXi2
         zdxHRbg5iXoJfhh5qpi1yiFByqn58bOzZNM3TXHe3hsLZ3QSQsSEg3sGEK+n4O6rk2hv
         cgo/jDZwUKOX9W7ed8R3J5eMan9L0RiHY+8MRvqWaxQa3OlOb7iK5uVBcrk7h6rcACUQ
         lpwg8GtDcQY4Ggc8h45zitFdwQkYv7qYIw4g5Yk+2yoDlubVowKYTL0bVKgHN3YZ5KiY
         wPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780465181; x=1781069981;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oCMutz/MyDhFR2IPTdBR86gHzqmBqi9zc2xD34Nwwhs=;
        b=iujmDnC+yGDRtpyXzDky6l8oipb5jQ22UACLW35EiFoavbP068JV2K3/yrJlWcSylr
         yvxzroiI1nsAyqU4CvJxYChnH3jk2u6VZLXG0UjTPoYlES2cP+ZDmNEToMSQ2FNJ9Jki
         f7VwuOlQfSVS/zo6g3oWgQ/lQAdofzpXtgd+xLvpbIF31R3fHTuZbDFyBJ0Pym7xKJRg
         QR4Q3tZUzfWMooO3Kl84MSwg0iZy2Z832UJZFgM5V/Hh+TiXe4KeLdGk5ABCWeffiO50
         WYOpN+DkcMGM1c3/FwLy32lZAR7AxrXhRTqwRXqJ1sEUJfz/iLQEy3tod42AwuA8yZua
         zYBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8H1HIrhBONhAfS0Q8rPQBYzNjzXrtFQTOMG7rF8rxvv4cnKTydDZBnwXXWjHvT2NxZi4/I7RKzgYNu3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwarkBIJRiECkcg/sJa6bbYcjIU54x1vgbPsTqMZui2ntQekZBW
	87TmsaIxKyOwDMaEvJHwOquJ1rfMMWSY/U99p337AmntOPHLDoIxtw8d3xdr0AAqWNrDRply1Bv
	5Nd117xzh24BVGmDxf/Nc4xIdldeomxuTYjLNXCJf3VIEa/7eYrOChQPnYa8CAMDjiF4nOXlpZA
	==
X-Gm-Gg: Acq92OFub0tB0yEMRZbk/6L7VhfxQ3UDuhP3b5UuG2J7vFGA4JAj67CNh9VzP7pR0hB
	bJoTgYHT8GKE2GI0YbnPjUSbiM3q5GRQjFOba4m3K8wTZvwF03HiCfQ7mN49PfXWbujcyE1szR9
	pg/vwi74k5VxbZuuUR/iC14sLQGSEoh9G27MRulnhqLjdThCr3YY7b4ujQmszDZJX2oe5UPb3+H
	kWCjI9l/1vLLrMjck8Qy99OV/5/zGzdmStoQo9CN5unRHmoGQvuCXPPZ0uq+oeyxBt+wY7xR0tD
	mcrPKZWfRsIuPBzqDNoXNEWv4iQTKVp5zHH3UBjz35UmIGt5vIv7/C2tKTVozQP1wXlQ1+vlyPr
	CqGC8yMY+T9Hw3evwXAl6nDQJ0g9FQJdl6EGq+sAS+NsIYJWMZ1936J1SKEaD
X-Received: by 2002:a05:6a00:4fc9:b0:841:dcbf:e82b with SMTP id d2e1a72fcca58-84284e19ebamr2089929b3a.12.1780465181480;
        Tue, 02 Jun 2026 22:39:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:4fc9:b0:841:dcbf:e82b with SMTP id d2e1a72fcca58-84284e19ebamr2089869b3a.12.1780465180927;
        Tue, 02 Jun 2026 22:39:40 -0700 (PDT)
Received: from [10.204.78.54] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842829188b9sm1687035b3a.59.2026.06.02.22.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 22:39:40 -0700 (PDT)
Message-ID: <37ae68ba-6639-4bd2-9483-5aa0156fd772@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 11:09:31 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/15] accel/qda: Create compute context bank devices on
 QDA compute bus
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        robin.clark@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
 <20260519-qda-series-v1-6-b2d984c297f8@oss.qualcomm.com>
 <f527lflctqyqjrotd2qerlx4oikg6st6u2seqsjw6u5krkqrab@uhw33gnkp5c7>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <f527lflctqyqjrotd2qerlx4oikg6st6u2seqsjw6u5krkqrab@uhw33gnkp5c7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eE4d-LI1I0yUA7RIq3JqyyKzRJVaW7Qr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA1MSBTYWx0ZWRfX8AVMj+ptI8Ig
 JkWw+PFWDtyy4nwAC80+QjDsqJDcGLGPrN0juyuRDXXwXzmOpMrQhtSZRVpr/vbISzDSwglH8cb
 J9IaAr3LyfdW012sskcBkNAHog4WcQzz2u6grO9amu0GA5EHxf9K41U7fk1+hS4xHRgvemxgDaa
 S5ekMZmR6eq5j+zQA1UOCmz2VcMI6MbMUUqVYjYQADE2yM21O07uK4POABQFP3nGr+k25/r7Vjc
 UiApxhN8rbM/9CrrEgxC2zZ9Vo1Sol5ZN1O2ZaY3h5KKatYpDAJGWLDJxUNn0D9VPRVA/tcmxLI
 Pp/6c02KT0tjVRigpk+VqissxIr1UoQmjMGSQ4iVzZNK23XhkHz7ETf9zfxkEDbohKqGnHsGWqK
 OGAPL9N1hkv18VhEkUGEJoD+9EpXRJnFydrcIdPQDbmDvAGclBtPlkhREDV832kuxEQYtMi9FQ0
 NDOtISvNOGydq3DmJ4w==
X-Authority-Analysis: v=2.4 cv=NYfWEWD4 c=1 sm=1 tr=0 ts=6a1fbe1e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qYmJ1cgbGSsHLxxvYMEA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: eE4d-LI1I0yUA7RIq3JqyyKzRJVaW7Qr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030051
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63482-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,quicinc.com,oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-doc@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 89EDA634531

On 20-05-2026 19:53, Dmitry Baryshkov wrote:
> On Tue, May 19, 2026 at 11:45:56AM +0530, Ekansh Gupta via B4 Relay wrote:
>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
>> Introduce the CB (compute context bank) device management layer for the
>> QDA driver. Each DSP domain node in the device tree may contain child
>> nodes with compatible "qcom,fastrpc-compute-cb", each representing one
>> IOMMU context bank. The driver enumerates those child nodes during
>> RPMsg probe and creates a corresponding device on the qda-compute-cb
>> bus for each one.
>>
>> The CB devices are created via create_qda_cb_device(), which registers
>> them on the qda-compute-cb bus so that the IOMMU subsystem assigns each
>> device its own IOMMU domain, enabling per-session address space
>> isolation for DSP buffer mapping.
>>
>> The new qda_cb.c file provides two functions:
>>
>>   qda_create_cb_device()
>>     Reads the "reg" property from the DT child node to obtain the
>>     stream ID, constructs a unique device name of the form
>>     "qda-cb-<dsp>-<sid>", and registers the device on the compute bus.
>>     A qda_cb_dev entry is allocated and appended to qdev->cb_devs so
>>     that the list can be walked during teardown.
>>
>>   qda_destroy_cb_device()
>>     Removes the device from its IOMMU group before calling
>>     device_unregister(), ensuring the IOMMU domain is released cleanly.
>>
>> CB devices are populated before the DRM device is registered and
>> destroyed before it is unplugged, so no DRM operation can race with
>> CB teardown. On probe failure after population, qda_cb_unpopulate()
>> is called to clean up any CBs that were successfully created before
>> the error.
>>
>> Assisted-by: Claude:claude-4-6-sonnet
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/qda/Makefile    |  1 +
>>  drivers/accel/qda/qda_cb.c    | 99 +++++++++++++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_cb.h    | 32 ++++++++++++++
>>  drivers/accel/qda/qda_drv.c   |  1 +
>>  drivers/accel/qda/qda_drv.h   |  3 ++
>>  drivers/accel/qda/qda_rpmsg.c | 12 +++++-
>>  6 files changed, 147 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
>> index 424176f652a5..143c9e4e789e 100644
>> --- a/drivers/accel/qda/Makefile
>> +++ b/drivers/accel/qda/Makefile
>> @@ -6,6 +6,7 @@
>>  obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
>>  
>>  qda-y := \
>> +	qda_cb.o \
>>  	qda_drv.o \
>>  	qda_rpmsg.o
>>  
>> diff --git a/drivers/accel/qda/qda_cb.c b/drivers/accel/qda/qda_cb.c
>> new file mode 100644
>> index 000000000000..77caf8438c67
>> --- /dev/null
>> +++ b/drivers/accel/qda/qda_cb.c
>> @@ -0,0 +1,99 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> +#include <linux/dma-mapping.h>
>> +#include <linux/device.h>
>> +#include <linux/of.h>
>> +#include <linux/iommu.h>
>> +#include <linux/qda_compute_bus.h>
>> +#include <linux/slab.h>
>> +#include <drm/drm_print.h>
>> +#include "qda_drv.h"
>> +#include "qda_cb.h"
>> +
>> +int qda_create_cb_device(struct qda_dev *qdev, struct device_node *cb_node)
>> +{
>> +	struct device *cb_dev;
>> +	u32 sid = 0;
>> +	char name[64];
>> +	struct qda_cb_dev *entry;
>> +
>> +	drm_dbg_driver(&qdev->drm_dev, "Creating CB device for node: %s\n", cb_node->name);
>> +
>> +	of_property_read_u32(cb_node, "reg", &sid);
>> +
>> +	snprintf(name, sizeof(name), "qda-cb-%s-%u", qdev->dsp_name, sid);
>> +
>> +	cb_dev = create_qda_cb_device(qdev->dev, name, DMA_BIT_MASK(32), cb_node);
> 
> Wrong prefix. Pass the name format and the params to this function. Use
> kasprintf in it.
ack>
>> +	if (IS_ERR(cb_dev)) {
>> +		drm_err(&qdev->drm_dev, "Failed to create CB device for SID %u: %ld\n",
>> +			sid, PTR_ERR(cb_dev));
>> +		return PTR_ERR(cb_dev);
>> +	}
>> +
>> +	entry = kzalloc_obj(*entry);
>> +	if (!entry) {
>> +		device_unregister(cb_dev);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	entry->dev = cb_dev;
>> +	list_add_tail(&entry->node, &qdev->cb_devs);
>> +
>> +	drm_dbg_driver(&qdev->drm_dev, "Successfully created CB device for SID %u\n", sid);
>> +	return 0;
>> +}
>> +
>> +void qda_cb_unpopulate(struct qda_dev *qdev)
>> +{
>> +	struct qda_cb_dev *entry, *tmp;
>> +
>> +	list_for_each_entry_safe(entry, tmp, &qdev->cb_devs, node) {
>> +		list_del(&entry->node);
>> +		qda_destroy_cb_device(entry->dev);
>> +		kfree(entry);
>> +	}
>> +}
>> +
>> +int qda_cb_populate(struct qda_dev *qdev, struct device_node *parent_node)
>> +{
>> +	struct device_node *child;
>> +	int count = 0, success = 0;
>> +
>> +	for_each_child_of_node(parent_node, child) {
>> +		if (of_device_is_compatible(child, "qcom,fastrpc-compute-cb")) {
>> +			count++;
>> +			if (qda_create_cb_device(qdev, child) == 0) {
>> +				success++;
>> +				dev_dbg(qdev->dev, "Created CB device for node: %s\n",
>> +					child->name);
> 
> Stop counting successes.
> 
>> +			} else {
>> +				dev_err(qdev->dev, "Failed to create CB device for: %s\n",
>> +					child->name);
> 
> Unwind, return error.
> 
ack>> +			}
>> +		}
>> +	}
>> +	if (count == 0)
>> +		return 0;
>> +	return success > 0 ? 0 : -ENODEV;
>> +}
>> +
>> +void qda_destroy_cb_device(struct device *cb_dev)
>> +{
>> +	struct iommu_group *group;
>> +
>> +	if (!cb_dev) {
> 
> How can it be?
I'll remove this.>
>> +		pr_debug("qda: NULL CB device passed to destroy\n");
>> +		return;
>> +	}
>> +
>> +	dev_dbg(cb_dev, "Destroying CB device %s\n", dev_name(cb_dev));
>> +
>> +	group = iommu_group_get(cb_dev);
>> +	if (group) {
>> +		dev_dbg(cb_dev, "Removing %s from IOMMU group\n", dev_name(cb_dev));
> 
> Be uniform. It's either drm_dbg_foo() or dev_dbg() all over the place.
> Don't mix them.
ack>
>> +		iommu_group_remove_device(cb_dev);
>> +		iommu_group_put(group);
>> +	}
>> +
>> +	device_unregister(cb_dev);
>> +}
>> @@ -59,9 +61,17 @@ static int qda_rpmsg_probe(struct rpmsg_device *rpdev)
>>  	}
>>  	qdev->dsp_name = label;
>>  
>> +	ret = qda_cb_populate(qdev, rpdev->dev.of_node);
>> +	if (ret) {
>> +		dev_err(qdev->dev, "Failed to populate child devices: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>>  	ret = qda_register_device(qdev);
>> -	if (ret)
>> +	if (ret) {
>> +		qda_cb_unpopulate(qdev);
>>  		return ret;
> 
> Unwinding registration?
did I miss something here? The intention to free up the CB devices in
case the device registration fails.>
>> +	}
>>  
>>  	drm_info(&qdev->drm_dev, "QDA RPMsg probe complete for %s\n", qdev->dsp_name);
>>  	return 0;
>>
>> -- 
>> 2.34.1
>>
>>
> 


