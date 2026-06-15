Return-Path: <linux-media+bounces-64925-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LYVjA/E/MGqdQQUAu9opvQ
	(envelope-from <linux-media+bounces-64925-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 20:09:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFC4689129
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 20:09:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IpemTdun;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fhKOB5ai;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64925-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64925-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 18BBF30471D7
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2026 18:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3881418CBE1;
	Mon, 15 Jun 2026 18:09:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD682BE035
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 18:09:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781546989; cv=none; b=fLm+gDx1ultySSG9KHydmCI2u2yj38g+bZwX7EmRiOQsBzKZ/0D4ft1BdkJh0M3on6GoIHaCP4TwocwHJPpYrnakRQluNraYFtw0fznEJWL1Gu9Mp+vxlw/KH/qIXyPNigP2OIS/UiSLPk+UvX2oVAQ8u+u/hyKFuaZdTBfff8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781546989; c=relaxed/simple;
	bh=+/YIfAZx6Y1TDdcNE4r7VNCbv7pZjjigABYxTNijrxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d6Z6GiV9AUqIMpow6TTv4xJzDFqVnjQ3i/GgH64Z5cZa0QzvuvqukyiC7ec4sSG37KmkrHk0vbI/yjuxWhgI0Fc3PfKrpHRZpua8pSsA8kFEY7l71hxNZPZU9v15scJGkTvxSGkLzjcTxx9Cik/gZ5jD6xgGCBxdyW02kQokyuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IpemTdun; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fhKOB5ai; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FFhMA8446911
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 18:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OZXH7NQPKLN5DjAC/OW8MEpdTAtaJcMt3HJcX6yL1CQ=; b=IpemTdun7BE4c8aM
	G6fZoFhhPOLEPP5lstIw3n4cwYIrk3xrb4FW9e65UKhxXWlylVWLyBPrtTCm3xBc
	NNZSY4rCfBVEiiLyvZVssDD7+lEtafo6qK2ef74/Vw1nC3OK4mLEL1pRSZs6K+VR
	jw+9zYofXd9aJfzR59fYbcqXpZgFoaxvr8dKnPGy3lFCUNINRfHidm4IYMvNtDZ7
	6++Ko5QqRDZcMIDzUWDL4KMLMXHNeiGspqJfvEkCloZ9leneZ8Le5RSgtM2Txkng
	rYhp7SzBv+Kq+/pnPHEWSGuuiRys6ki7+Scc4u/DpQKT/uACkQmXJ4bPpqVOFCfl
	L4Qoyg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etew0j881-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 18:09:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf11699875so42868925ad.1
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2026 11:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781546986; x=1782151786; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OZXH7NQPKLN5DjAC/OW8MEpdTAtaJcMt3HJcX6yL1CQ=;
        b=fhKOB5ai1F4PYg7vn29LzT85DzXwgg69jNQL+8bn9V95EsE5IP8eB2fTYk8CzyqgVT
         2tLBc/wFvFwiefRRMB5a5LxnqhctekgdvgKizi0yccbKMdz3/zVQ5FNUvhyhHkSdHR4V
         KVnpu3qE9WnG9Q47cJUg4hhiMAcabRJkV8UWj25yD4iDYRyxUxvqquVdOWYPHfediVnN
         JMxTzVWhstSOXFDKg9WC+oBcLcQZ/83s8vdK3aUqheFmDyEEmVHDeiX3/smUQRVUuE3q
         Tj9nyeGu0llUul5r8aT/UMzplL9zGCDnOpH9NTVdvq76d9dKfng5ItUHaKn6ovsWvhtr
         yOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781546986; x=1782151786;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZXH7NQPKLN5DjAC/OW8MEpdTAtaJcMt3HJcX6yL1CQ=;
        b=YrB6Pv3coNQHr7gbA84aFluV/zqGzV2T0dqdBQEmbU1rRW7daonsR4FG/Si/+JG0/A
         aIIuXmBLNoXKXUjkG/O9WEA+TclWBqDnCc5xK+tePvd2lO19AquGgs1i2zOsGOMcIhwG
         7rprSMtp5RXEZsKnZaQ6/1qXU/iMGdBBKpbAMeSP9cnINHH6f6pteVBH42Juy6ELGSAJ
         TH8o+r1tuvOOsGSOFwNMrJ0Tu/+cVj8nyYQOIlLOUwmjBAr+XvnTgQgsi81aoxXVoZlU
         cbPARjEG6pccT5olSZunFpsLmU1uiD6dN326h1OR1BKASzG48IWT164mBehC9ZO196K/
         M2PQ==
X-Gm-Message-State: AOJu0Yxqh68+ThTlYaGxNAxLKOAZDaMVELespFrEiS0e8Kx8HL1Mo9P9
	vmZprLzoYyBS5SXFMWjG9NPKosKbyZSpDwBapkJVfhM+GvRITKpjHAXZO0/WOElqqGMbyVSTb0U
	lKRMr/aAzcuq1AYTW/vWUdH7f40HYqJYaNd/qJaxZinJKYPg6IChgpaQCsd16bBx1qg==
X-Gm-Gg: Acq92OG3N7BemLBLXcDktx8IyCiTIi1hBb7I9q3qyshxbMWub1Q1Vvfhx4AqoUfGsbx
	sBlEQUex3AHkDkRw7FsAadfZfFZdQT5ZvpLFmlkcrDWfLbCwTIhJ669VAKAiRbcvDd0XOWXS8Px
	8mdevkCUL6+k98pdsTGcx30DL9wwDSKemUcf3WFn8AfUs4a1JmhjIOlgMLAsGdI5wnYySmllevV
	EwcSR5NuNGa/yNL70hUEFu+AdYHV3ntulU/X+dRJ2A9f0PiIKv5aJ2g6bDb6J64tohzn9MVjcXI
	b6CVv4/5O/tclK//tiuXgulzLy8ugRqCg7qUHu5KM/CK6XYkxLmZ/916sQMQL0lDvzJiDEwruav
	68ZqHHYWT6L7BY1aE9x+xETE6OMOk4l0Y3Ta9t8qsxOcpflBt1Bw4H5Z/
X-Received: by 2002:a17:903:3a8b:b0:2bf:2d0:8877 with SMTP id d9443c01a7336-2c699b739efmr3749555ad.23.1781546986466;
        Mon, 15 Jun 2026 11:09:46 -0700 (PDT)
X-Received: by 2002:a17:903:3a8b:b0:2bf:2d0:8877 with SMTP id d9443c01a7336-2c699b739efmr3749245ad.23.1781546985957;
        Mon, 15 Jun 2026 11:09:45 -0700 (PDT)
Received: from [10.187.126.18] ([106.221.183.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e535csm103379135ad.6.2026.06.15.11.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 11:09:45 -0700 (PDT)
Message-ID: <f4e0a95c-bd4b-9eaa-f06e-5b5dd7c6ee84@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 23:39:37 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 07/16] media: iris: Add platform flag for instantaneous
 bandwidth voting
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
 <20260612-iris-ar50lt-v4-7-0abfb74d5b3c@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-7-0abfb74d5b3c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE5MiBTYWx0ZWRfX8S5OmudlcIRP
 dMf1+qvvlQDM+n4u4WlpS4ZlhNycQ4uh9EnSYD57w9EHplRnhEC+KslcSFBvHQv5e10zfGyaAc2
 G7fzJwYIL2Dx/ZhZQgRzqEPcnpJnUd0=
X-Authority-Analysis: v=2.4 cv=QLlYgALL c=1 sm=1 tr=0 ts=6a303feb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ym48ABLkKUHSTpi9L/JoRg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=jI4A6vEBTXP-BcUGSgUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE5MiBTYWx0ZWRfXwsNe9gVGkVc/
 cz/eaMII8kfMvc5bltAEYzEmiT8HHylacB4xYCvv49FrbGj97gSetU2SEzkuYITZ4pPdkoR26k6
 YRn4lyTUqHLT/CmhR0SPJRtN7MHzymVp++FRfWJKJat/atSfLsQnhRpnmoMsshGY+RnwuHhD99w
 x397B7ApzJVjwBINT+X/5CaBkfeszyNY3gYrvMSh/YDFPJOy4APH/+5VLTWM8zQTRQtemu4owC2
 1HSis4/ZbxFFlMlxJ8kOlsYCL5/aGYgnH5rUIY9Nk8yJTVUgjAw4fwlTImF94jWCgIYS9ajMqMt
 +p+yC1HRrKSnUSejlMs7Iz35bn31LAz7yjQw9M0K8r9m1qPGZd6htuQ/6J1/jG7KiNeWZ2q4b5n
 gtOS0tllCb/gUgWXiIT8ffcetj5Z94SvA4TIjXhg0aKZWvT9ZEO6KaRbmgZcE1mrkJyAqQ3AnZB
 epbcLobBqPKS4PsNByg==
X-Proofpoint-GUID: uYv9EisehAjTrF5xlX-VeWpU2WpCjRG4
X-Proofpoint-ORIG-GUID: uYv9EisehAjTrF5xlX-VeWpU2WpCjRG4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150192
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64925-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6FFC4689129


On 6/12/2026 2:55 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>
> AR50LT require explicit instantaneous bandwidth (IB) voting in addition
> to average bandwidth (AB) when configuring interconnect QoS. This
> requirement is due to QSB (Qualcomm System Bus) 128b to
> QNS ( Qualcomm Network Switch) 256b conversion at video noc in AR50LT
> which is not needed for other IRIS cores.
>
> In preparation of adding support for AR50LT core, introduce
> platform-configurable IB multiplier and enable IB voting for all SoCs.
> Existing platforms default to IB == AB, while AR50LT requires 2x peak
> bandwidth.
>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_platform_common.h | 1 +
>  drivers/media/platform/qcom/iris/iris_platform_vpu2.c   | 2 ++
>  drivers/media/platform/qcom/iris/iris_platform_vpu3x.c  | 4 ++++
>  drivers/media/platform/qcom/iris/iris_resources.c       | 2 ++
>  4 files changed, 9 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 81fcb2854772..accc1627defd 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -316,6 +316,7 @@ struct iris_platform_data {
>  	u32 num_vpp_pipe;
>  	bool no_aon;
>  	u32 wd_intr_mask;
> +	u32 icc_ib_multiplier;
>  	u32 max_session_count;
>  	/* max number of macroblocks per frame supported */
>  	u32 max_core_mbpf;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> index eeef453c583f..e2fddc29abc7 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> @@ -97,6 +97,7 @@ const struct iris_platform_data sc7280_data = {
>  	.num_vpp_pipe = 1,
>  	.no_aon = true,
>  	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
> +	.icc_ib_multiplier = 1,
>  	.max_session_count = 16,
>  	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
>  	/* max spec for SC7280 is 4096x2176@60fps */
> @@ -128,6 +129,7 @@ const struct iris_platform_data sm8250_data = {
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
>  	.num_vpp_pipe = 4,
>  	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
> +	.icc_ib_multiplier = 1,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K,
>  	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> index 261db38a013b..64cf182d67cc 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> @@ -116,6 +116,7 @@ const struct iris_platform_data qcs8300_data = {
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
>  	.num_vpp_pipe = 2,
>  	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
> +	.icc_ib_multiplier = 1,
>  	.max_session_count = 16,
>  	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
>  	.max_core_mbps = (((3840 * 2176) / 256) * 120),
> @@ -146,6 +147,7 @@ const struct iris_platform_data sm8550_data = {
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
>  	.num_vpp_pipe = 4,
>  	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
> +	.icc_ib_multiplier = 1,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K * 2,
>  	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> @@ -184,6 +186,7 @@ const struct iris_platform_data sm8650_data = {
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
>  	.num_vpp_pipe = 4,
>  	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
> +	.icc_ib_multiplier = 1,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K * 2,
>  	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> @@ -214,6 +217,7 @@ const struct iris_platform_data sm8750_data = {
>  	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
>  	.num_vpp_pipe = 4,
>  	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
> +	.icc_ib_multiplier = 1,
>  	.max_session_count = 16,
>  	.max_core_mbpf = NUM_MBS_8K * 2,
>  	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
> index 773f6548370a..caeaf199cef7 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> @@ -18,6 +18,7 @@
>  
>  int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
>  {
> +	u32 icc_ib_multiplier = core->iris_platform_data->icc_ib_multiplier;
>  	unsigned long bw_kbps = 0, bw_prev = 0;
>  	const struct icc_info *icc_tbl;
>  	int ret = 0, i;
> @@ -36,6 +37,7 @@ int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
>  				return ret;
>  
>  			core->icc_tbl[i].avg_bw = bw_kbps;
> +			core->icc_tbl[i].peak_bw = bw_kbps * icc_ib_multiplier;
>  
>  			core->power.icc_bw = bw_kbps;
>  			break;

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


