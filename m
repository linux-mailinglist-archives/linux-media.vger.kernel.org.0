Return-Path: <linux-media+bounces-66837-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k7+TCCbsTGp0sAEAu9opvQ
	(envelope-from <linux-media+bounces-66837-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 14:08:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8392771B378
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 14:08:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=go+XicZp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="NsoM/IRs";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66837-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66837-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4BFF304AA11
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 12:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84EDF3F23C5;
	Tue,  7 Jul 2026 12:07:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6793FA5F1
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 12:07:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783426067; cv=none; b=E3Td1rIOCW841qNfimJgfQSzwOH0P4QCXuGuLZ8/d6kj341POHgkkny7XpDuV1wDpuXpyo8NhmsH6qSsN71rvGKt+OpceKrNd0eLNW/+EZ8JlIn7Rwq1nFcuD8tWvCnW6iTKV3QvNJdWf4M1OeOKWGXGgn9lo8ysdNOrFfP4HK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783426067; c=relaxed/simple;
	bh=sx8vAXwqtM2BF1RSMU1Bl5a+jAMRY4rgd8VoA4MEKH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eECzCnkMe3uGFVGAHK6+CH86JXyg/NUXoPb3ZhF4MUCj168liYQHo3lnHxCJe5jHVUiu0IeE2GpqRH/ZrXI1u1izcWtV9XoJL8v9T56y5J2zmskfaGOj/fBuvwrgcC7U1ixqqT4g9bOKYqu9R7Tqkt49nB+QeS34W4J20ZwuEdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=go+XicZp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NsoM/IRs; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DaDm3243046
	for <linux-media@vger.kernel.org>; Tue, 7 Jul 2026 12:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TSZCpVJgYGNPn1Ohux957EKWIlXyg6nTTccZRFciuH0=; b=go+XicZpWJFxQRlD
	q0EUzpDkuXG7BOzDsO3p6LrAZ8TKf4BxfuGYViRgyBuKbXB7E/XEb+yH0WLd3QBh
	9YtUZFlHi+9sxl9rVRRpjZeYEPSb9fuOlOE+7d2pBtrvGAZVqxopGXu7PzFWFKyF
	XEfkDfk7Xaz6V2dtpmj4qWI6JkeW/KU7JQOaAr4skymQA0gVc71JaaTujABrld3K
	z5HOWBuaqA7JEBugDGD0atRrgsTkdrNCwdnze1jKdYzSvmAZFsQgCMpvuxWMhLAE
	sXjDGV1VD1HkALkWTxiPC5pjx+m7s/Xt0yzsCGNv5xWx2DdjnTqX16bjqLN5QJx4
	e4RvZg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w11s38q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 12:07:43 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso8330766b3a.1
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 05:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783426063; x=1784030863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TSZCpVJgYGNPn1Ohux957EKWIlXyg6nTTccZRFciuH0=;
        b=NsoM/IRsBD8cswNnh2zuMADu8DfXNj0fn+a7JPtGcSXn5LZbrEw1pSXc4nY9r9boqD
         MBFn8tAzI7u5Rnp0Va2Cer92oyTHdpHd/3UZoLYo6b4kQuKL/o7cnR3hVUE+IOb2UYU8
         Vi/PlNBDZ/ntguZyFxrlx4O5ZvgoY1CdW7zAzJX7MAnCfkotffex62R76jeo8chntDyM
         b9tYtjF2kW6129ByyLVEV/nU7l7UCYGZQie3cVxGBP2giRxuaFrAq/NXpEqFaRK1G6r8
         E8DX4jORNNafA7y39gtOSYUG27gYnVsFBHuAP8sqeoZmZeUsyoqoMhu20BN3jCkjq6Pt
         BPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783426063; x=1784030863;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TSZCpVJgYGNPn1Ohux957EKWIlXyg6nTTccZRFciuH0=;
        b=THgjM+vz5zUohdo+fXvIYV9LO5t23i5SCw4CKgwvuTsBjk/M4/ceDYAclf+vQ0dKUM
         NOpLKWKt3A+zK9NkH3quRRaV8PVhmzfBti7C+L5m6ISZUuz224qEAj63Kcppw59G8UXl
         uvg63aqsHkoLzmu/slFpDzsteZnFQiLqUP1mLQcVW72WHzzNdyi7AY3DORLYFVtq5HH8
         iwG48SKGOhfrAsK75WAcb11G69n90g+ebFw2WZFM1PXO1LyP0CpPllrDdxSmeoCBRQR2
         JKVppxo4abFoQcl5z7rA0fAk7hNDqr6GRWamlhfpiGJBkmBgE5J8fN3YlUyA2W2u5AdM
         lQOg==
X-Forwarded-Encrypted: i=1; AHgh+RotXeP5nF1/ZvlCHFF5H8dExP4SQaB449hvlULwKlHfIOj1yDsVmaElFBINLMMEFn79+GA7qTeidc8nLw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0+M8My7SHSvRORPoXByIu4mw/x5SxOAlGXdolsaH9oAsv9z3e
	eOGf+Z7gtqwsO1WqBAX8L3OzoDX2mFIkiIL5KrarNT+XoqGNMmFy3VRElERhe+W4Q35Q2izaXI8
	O+k2IeMto1wvhwNwWdZ/PqN4YrdTVHRmv50b5e5SeKtGa9pOAFBC2PfcFEIibS76o0Q==
X-Gm-Gg: AfdE7cnA6jrQXZtn5kHGgsO47RkfDDPZaZNJfL/npRVI2AT/k5Oqhwl1D7cZAveozGy
	PBUOjrE6MKUXduukSefjoiB4TQmb5KjAqUK1cGRo2o1uzbD21201V+1UDqSXPPuGXtDhYfNFfcw
	ElcNr7k9YKyESu/mg/sOQkKqn70B7UlSwB3sDqR54xapbPfGNAFpUYV4bmakX3NaHcce7fMSJSm
	XpYj+k0Or6yFxTRTFLZEGPO3DSo8kkszDV3XLCoHn3a3LM0d9/QDIa4+aR0ptmy8qNeTGp3ppAi
	EJWJki/ZiE9s0VgMkEs9VD+99ui0ERNYw0FtEoTihxZhzyRT44aJLUo8gQV6gRTI6q8gGSjEWnV
	m9GSjB+kPKFb0J4vT+NXd+uwj/u0lS7cVhICT6pzFxA9Q
X-Received: by 2002:aa7:9a88:0:b0:82f:9407:d167 with SMTP id d2e1a72fcca58-84826db0b6emr4883530b3a.38.1783426062775;
        Tue, 07 Jul 2026 05:07:42 -0700 (PDT)
X-Received: by 2002:aa7:9a88:0:b0:82f:9407:d167 with SMTP id d2e1a72fcca58-84826db0b6emr4883488b3a.38.1783426062170;
        Tue, 07 Jul 2026 05:07:42 -0700 (PDT)
Received: from [10.217.219.87] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6dbfd41sm5359873b3a.57.2026.07.07.05.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 05:07:40 -0700 (PDT)
Message-ID: <81e84294-b438-415d-82ef-a523c4381eb4@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 17:37:35 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: qcom-geni: Add dynamic transfer timeout based on
 transfer length and frequency
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org,
        sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        naresh.maramaina@oss.qualcomm.com
References: <20260705135739.4038826-1-aniket.randive@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260705135739.4038826-1-aniket.randive@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DMe/JSNb c=1 sm=1 tr=0 ts=6a4cec0f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=5YGwSrtyFkuD1B6sRKIA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 1gw0o_s4aVfFfrCjrXGPtbxW1EB7L2vc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDExNyBTYWx0ZWRfX0SP3gD+J5cVZ
 Ak8UjF08jQVxb7WYTpJ+hCkdJ7WgaBVxvPrenIv6WTi+zxdJbl8OEIA69Nh10qSwezXizYkpa4o
 FdELa1NOc8uYpUYumu5quQJkOsTmnLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDExNyBTYWx0ZWRfX9m1ZYX279Klb
 y5REn8ANOp/wGeWKjWjUftmKuMQodkw35/HNzX8RtMaRAGwyqc2XCqIfOhmdQ8tKgd+lSZwHmt/
 maO8ne5xs8HyGtcsugiL0NIDBlP3JlYGYdAV3mfWKQDM8ll9DKCivhimQBu5FKbek6p4uw+gfNH
 INfpu1m2DFZLq/vzmtM3eR8kUPcu5Y3olBsAt0yy23KfDml5gRdxwE75EWNOD7itHK2XGhIaOP4
 lJSt0JrEq+Q7Q88P9Cf0itbS2ovzKFwIEUHJf06qhLIaFehy71xNrLiNA2j+imMoyl/MR/NJ7zI
 vY7FF8LE5vtDo7ahqsi9QTmgBheC772u3bk8GoNlaXkoS5Rb+G93G3ME37KrMbhGXrzBWIiPrRD
 tK0P82/Fu9FrWUniEtO1IaA1qEc9ufA7YBWtwalri6lVCjCcz1A8fr1j66MQ6NF8YhOWdArKQMI
 ym+h1nsHPWvYXgaGmsQ==
X-Proofpoint-ORIG-GUID: 1gw0o_s4aVfFfrCjrXGPtbxW1EB7L2vc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1011
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070117
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66837-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:aniket.randive@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-i2c@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:naresh.maramaina@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8392771B378



On 7/5/2026 7:27 PM, Aniket Randive wrote:
[...]

>   static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
>   {
>   	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
> @@ -471,7 +484,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>   	}
>   
>   	cur = gi2c->cur;
> -	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
> +	time_left = wait_for_completion_timeout(&gi2c->done, geni_i2c_xfer_timeout(gi2c, len));
Simplify with timeout = geni_i2c_xfer_timeout(gi2c, len) and use as an arg ?
>   	if (!time_left)
>   		geni_i2c_abort_xfer(gi2c);
>   
> @@ -513,7 +526,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>   		writel_relaxed(1, se->base + SE_GENI_TX_WATERMARK_REG);
>   
>   	cur = gi2c->cur;
> -	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
> +	time_left = wait_for_completion_timeout(&gi2c->done, geni_i2c_xfer_timeout(gi2c, len));
>   	if (!time_left)
>   		geni_i2c_abort_xfer(gi2c);
>   
> @@ -591,7 +604,7 @@ static void geni_i2c_gpi_multi_desc_unmap(struct geni_i2c_dev *gi2c, struct i2c_
>    * geni_i2c_gpi_multi_xfer_timeout_handler() - Handles multi message transfer timeout
>    * @dev: Pointer to the corresponding dev node
>    * @multi_xfer: Pointer to the geni_i2c_gpi_multi_desc_xfer
> - * @transfer_timeout_msecs: Timeout value in milliseconds
> + * @transfer_timeout_msecs: Per-message completion timeout in jiffies
>    * @transfer_comp: Completion object of the transfer
>    *
>    * This function waits for the completion of each processed transfer messages
> @@ -601,7 +614,7 @@ static void geni_i2c_gpi_multi_desc_unmap(struct geni_i2c_dev *gi2c, struct i2c_
>    */
>   static int geni_i2c_gpi_multi_xfer_timeout_handler(struct device *dev,
>   						   struct geni_i2c_gpi_multi_desc_xfer *multi_xfer,
> -						   u32 transfer_timeout_msecs,
> +						   unsigned long timeout_jiffies,
>   						   struct completion *transfer_comp)
>   {
>   	int i;
> @@ -612,7 +625,7 @@ static int geni_i2c_gpi_multi_xfer_timeout_handler(struct device *dev,
>   
>   		if (multi_xfer->msg_idx_cnt != multi_xfer->irq_cnt) {
>   			time_left = wait_for_completion_timeout(transfer_comp,
> -								transfer_timeout_msecs);
> +								timeout_jiffies);
>   			if (!time_left) {
>   				dev_err(dev, "%s: Transfer timeout\n", __func__);
>   				return -ETIMEDOUT;
> @@ -736,8 +749,15 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
>   		dma_async_issue_pending(gi2c->tx_c);
>   
>   		if ((msg_idx == (gi2c->num_msgs - 1)) || flags & DMA_PREP_INTERRUPT) {
> +			size_t max_len = 0;
> +			int j;
> +
> +			for (j = 0; j < gi2c->num_msgs; j++)
> +				max_len = max_t(size_t, max_len, msgs[j].len);
> +
>   			ret = geni_i2c_gpi_multi_xfer_timeout_handler(gi2c->se.dev, gi2c_gpi_xfer,
> -								      XFER_TIMEOUT, &gi2c->done);
> +								      geni_i2c_xfer_timeout(
> +								      gi2c, max_len), &gi2c->done);
Simplify with timeout = geni_i2c_xfer_timeout(gi2c, len) and use as an arg ?
>   			if (ret) {
>   				dev_err(gi2c->se.dev,
>   					"I2C multi write msg transfer timeout: %d\n",
> @@ -852,7 +872,8 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
>   
>   		if (!gi2c->is_tx_multi_desc_xfer) {
>   			dma_async_issue_pending(gi2c->tx_c);
> -			time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
> +			time_left = wait_for_completion_timeout(&gi2c->done, geni_i2c_xfer_timeout(
> +								gi2c, msgs[i].len));
>   			if (!time_left) {
>   				dev_err(gi2c->se.dev, "%s:I2C timeout\n", __func__);
>   				gi2c->err = -ETIMEDOUT;


