Return-Path: <linux-media+bounces-62780-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uI08I4eDFWoSWQcAu9opvQ
	(envelope-from <linux-media+bounces-62780-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 13:27:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5E95D4DA4
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 13:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C0753045689
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 11:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AFC83DD521;
	Tue, 26 May 2026 11:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZhvaZp1o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SEmo2QFi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E28D3CCA12
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 11:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779794524; cv=none; b=XPYgMs2ClB5P46drIOuIJ70mVqSnnpnBY+6Bi3C7nB1dgzS5JGUCp5VpjsfXHykdlAemiI75zs3PgG+kpHYZlFTYCNPJyvcL8cxYwR0Nn9FG32nvqhT+5lqfCS6w9flllcWRSQifdvDJGxIp11dswq8IZg21XgmG9F3WKVX5JYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779794524; c=relaxed/simple;
	bh=XJ2u4rAlFKqf3bCwOxTrOirn6TiVORyvCT7JY+6a+I8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YtzlKgzVnH4Xu8LrknKgd18U6ElQWLzvHB8lwvAQCyhuko8O686aaPoA7E9+rgLgUv/0ZjoXONmUu3aap2SBzDkrcni3wpzJrO0G1epmzAJixTiDAiRffTGqp+gPY1udpdTzRhEoeyYBRLWM7pJRE+tjSGvecY831G/l8r5gUec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZhvaZp1o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SEmo2QFi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q8u75k3658113
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 11:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kqsxV/xGmwV1+pwo9CefvjlaBlQyBYs9ZVzmmhLZlaI=; b=ZhvaZp1oPmCOLsQv
	wXGFKPi1dhW8ElBOcdPs7ThevrfynYs898JSbA2082a5FJdxfPj46sJEWKlRKBlZ
	rcw9pnpTo13ZU2zklATcUV3BbSnk4FtdnXI6Xoa/F5UPLFGybmlIh4uLBJZjXTCp
	M0ITFUgjW4IHCKAYUrTDI9ODwZ+1hMywyPTLjsiPnaTCwiwRoe2aOx1qoHawsiKv
	Y4GeEmxpDHiGRpnX+WUjm5NOq7nGhjK1OrRDScnwCqEE+bb6Yv6jPV5LvADIf9+v
	+Ck/4PT/pDZ0sPwLG1JR0EMLF5n5zoP69kfknea3BZ1L/cTtRkV2SvvJrQBZvZI2
	QDEvAQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqynbhw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 11:22:02 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c82894155ceso13581563a12.1
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 04:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779794521; x=1780399321; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kqsxV/xGmwV1+pwo9CefvjlaBlQyBYs9ZVzmmhLZlaI=;
        b=SEmo2QFimkzZYnByr7YiqUnmWtN2+KV/c/YyiVEUK1AmAVpcO8VIhiHfNoj64l3GV4
         KsNy6aXEXQ3To5Yyu73vHW9R1cjpBZUWXPr26h4Q0iZXIRvRRbm4/D8CpdEt3DXcbOx2
         4Eft9NELXTqpPZc8xIXYsJpOeqFhPFP3+4NuiTOl8UjDIpE4IEOswIg7PY1aPkkHupWH
         8hOrmPbZ3sx4JgGqJ+2IaoDBHoMaA1+yjZ4kuthRggQXOofGxXM8r1fqv2qQtlj3+zvS
         sh2K064mdgbvpuw8XK4ZcYS0UCAnt4DwKbDhd89oJm1iwijuccoUPrb7FFEkO/HNP+fo
         wBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779794521; x=1780399321;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kqsxV/xGmwV1+pwo9CefvjlaBlQyBYs9ZVzmmhLZlaI=;
        b=A+vXrP/Ct4oBWVlIGaMVbvmQad+3ozHucb2xUKTtGDzLNF620ZxnPcy2jymgoWCuBK
         RdH01yFhOm3NmzSWZIM8n2r5ndljmMFgEgXagCldocnf0BjzB+yaUT9TJeTWl9UaHc0D
         z0xrre4F7VZ/RzplUUr8Sdd899ZlsbKeP3H4SkgrCKCaUG0TtEpc6nJSVM0j/ebG4QNb
         O6W2dr8klHAKzyV0au6Y7k8GEY0E5AAAUoy6GZbkgVOztb9uaRTtogJrxqB100EhS/2X
         ExxXO+l7oOToPz55+yjngieYcoyt68/7XYwathzqugUdLNWOPnJ/ImX87RaWGdpVtnlb
         bVYg==
X-Forwarded-Encrypted: i=1; AFNElJ+xKaMeYbR6dNh6ua3lwTSDmat79OmJldOC+KftWogZN4RVBP9SIxh89Sf26y0uqZXNjJTsDIMlBKruxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiDvis59UkTL5WA+1/HttbgU3rhiLcbNwIJU5+2E+EqdwI6clp
	lcR1Pzn6FdpoQpKg6UC5N+jwN8muAmU0izn8zE1kJSCQcurUNGJOqmcSwR0Kxfdkcj+tDVjLHdD
	8RiEx9pIDdBaV9i+FYyKkjqFU/JEOX6JGmExlUtY6I+UFF/UB080RbkiSZnbjarFipg==
X-Gm-Gg: Acq92OHj1WDDm/IS3ig6aeDdosZXI3BzilWcgyi38Isj0uialTdEiAAfsFttBfHTISE
	V61tZ3CKvuhWHjzzrnrXJQMFjavsID9lmAH6syNi93wfkTNSpNrhj+qO/MP0FHE8x8GW0LobJLF
	wvumYRlk5SWRNtM+wBPv6drlNpx6Z2+y7HuhZ7dwXpu6Kw4LHd69mI4A2TxvBKiaoEOYBZkTjgY
	+3JYCRUhIolBg0PjkrepEQmSEb0wz2qsurdo4Z6EXPxnhg+aGiB2JKTisH9l5y9kUvq2cAu/50i
	IxFptMMl6MyyG0TFJJJb0GWKtgyFrsDb9MBxk1Isnd/uTN8RaQyLtCw3meRW8/UO/HaZh+Eg/Mc
	Q9xnYJeZYkIhuVeEkI+pn9dr2+Ia4xNbEwW/sqwPVZFAz+Tdqxv6497ses17hPGqN
X-Received: by 2002:a05:6a21:68f:b0:3b1:a9ce:5095 with SMTP id adf61e73a8af0-3b328d940ebmr18161103637.22.1779794521420;
        Tue, 26 May 2026 04:22:01 -0700 (PDT)
X-Received: by 2002:a05:6a21:68f:b0:3b1:a9ce:5095 with SMTP id adf61e73a8af0-3b328d940ebmr18161060637.22.1779794520961;
        Tue, 26 May 2026 04:22:00 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c852057f9cdsm10331123a12.32.2026.05.26.04.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 04:22:00 -0700 (PDT)
Message-ID: <b1888f5c-2613-99ca-ee12-fb4717a40731@oss.qualcomm.com>
Date: Tue, 26 May 2026 16:51:52 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v6 06/14] media: iris: Add context bank hooks for platform
 specific initialization
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
 <20260515-glymur-v6-6-f6a99cb43a24@oss.qualcomm.com>
 <sqjbcmcy3wohzdiftb36i7ztfyt2k7mnxkrzxk5yuocpe7kfy6@ev2ouxxnf6cc>
Content-Language: en-US
In-Reply-To: <sqjbcmcy3wohzdiftb36i7ztfyt2k7mnxkrzxk5yuocpe7kfy6@ev2ouxxnf6cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wpwb99fv c=1 sm=1 tr=0 ts=6a15825a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=93t1r52Nw9wdlAKC5OAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: HEnngcAgl0ew2_Jy3CXsnMpUzBuTZSsi
X-Proofpoint-ORIG-GUID: HEnngcAgl0ew2_Jy3CXsnMpUzBuTZSsi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5OSBTYWx0ZWRfX6tQscdJDgQBI
 /5gpQITEhe0yls8TY462aC/V6vb9VOwQd3T3mM00593rQ+gfnzOqfFzScR1AoJHXcmih1dnCiKT
 bnK8fonUZVdPy9sg0FE283wRQ4KQ3tLBYOPEdNNx9GnCDy5WiWOuR2UTHaJNeWaR//2uFlUQqZ5
 DVVC937H9foxjlx0Tt3Ihy7TrBm03Z7Awk9KXvIaUwR7YlJqyc/O2kGgWwkXA1J5+wDOcGDcuQA
 YhlJoxj3mAY8PrN+mZdVukpZkjBuDwAtdWfPQMWShFREOii5uoSlfb7V4ElmGQtc8EZJH21AmKk
 6VgTYF8GWvjN4braEYd+33SQrr3hPn0I6edGct6BbQf40aM6KCDSpGWcKfUrVL/WSDueGVnemQ2
 1XYAYAXkccBEM3EKj4e60apblwRwsQJYydhnc0TL11ow7K4GIxQ02p3ZuI73Zb0nZ3OY8gDQeoz
 sKUI+S/5Dln4D5FdJBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260099
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62780-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DA5E95D4DA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/17/2026 11:05 PM, Dmitry Baryshkov wrote:
> On Fri, May 15, 2026 at 04:51:21PM +0530, Vishnu Reddy wrote:
>> The Glymur platform requires a dedicated firmware context bank device
>> which is mapped to the firmware stream ID to load the firmware.
> Why is it required on Glymur? Is it _only_ on Glymur?

It is required for firmware booting on platforms where Linux runs as the
hypervisor (KVM/EL2), where the driver needs to manually manage the firmware
IOMMU mapping via a dedicated context bank device. This is currently specific
to Glymur.

>> Add init and deinit hooks in the platform data for context bank setup.
>> These hooks allow platform specific code to initialize and tear down
>> context banks.
>>
>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  .../platform/qcom/iris/iris_platform_common.h      |  2 ++
>>  drivers/media/platform/qcom/iris/iris_probe.c      | 23 +++++++++++++++++++++-
>>  2 files changed, 24 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index 6a108173be35..84fc68128c70 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -263,6 +263,8 @@ struct iris_platform_data {
>>  	 */
>>  	const struct iris_firmware_desc *firmware_desc;
>>  
>> +	int (*init_cb_devs)(struct iris_core *core);
>> +	void (*deinit_cb_devs)(struct iris_core *core);
> Why are they being added directly to iris_platform_data? Why not the
> vpu_ops?

Some vpu_ops are shared across more than one platform because of same
power sequence.

>>  	const struct vpu_ops *vpu_ops;
>>  	const struct icc_info *icc_tbl;
>>  	unsigned int icc_tbl_size;

