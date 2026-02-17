Return-Path: <linux-media+bounces-52970-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBr/I5tXlGkXDAIAu9opvQ
	(envelope-from <linux-media+bounces-52970-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 12:57:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E28014BAA7
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 12:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 586833033210
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 11:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55617336EC7;
	Tue, 17 Feb 2026 11:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zm3rVc8Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BOtbN1ps"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDC7334C27
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 11:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771329400; cv=none; b=YWKPR4Sa/vn3r2ZVS0ECxPzFupS+SQhiqqIWp4xnrIxIl/oPA/z4KUxaERiVMRS7MN5eEuRmFqO+kXWyucwGGandbmAulZmGJMFkIzuSWR2aHnLwpV56IjYpNgtsFj7aT/W9pnEAcvcn77ArLQjvnSIZFb3Nyk5dDz1ObD++p/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771329400; c=relaxed/simple;
	bh=CfAR57z2aVgzx0jNoBJko0yuCR6WfqzxE0KUwxCbFvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pCtMCFCm6qMixUbCkXeyIAdYuY+uK9UfbS5Cz9v2e0klQb7vdyhJ5w5gJwT/mMROKps8cbl1xSd+9w7I+JNACuVozWOJeAmnrvFpoIz/QHVkaqnjtgQowdM4HZn4aBzGjoEp3W3yHZkgp24P/Lh7bSt/QLVAxsNRZVw+3Ppdi3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zm3rVc8Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BOtbN1ps; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H9CsgS985203
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 11:56:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	abZVH24cGewfyKGRj1gUBCi7aVoXPrWtU4+xmjBoHOs=; b=Zm3rVc8QPDpY+TZZ
	mx9Ya/bnKHD96jZQGK5eczSQK/o8gIvOYwkjrSY2KkdNxiK/1DPVaUZcU2Wd67X8
	4+QfhNIrp9rykx1aPTurddjDaSTjyAt8EvVxTfl+6NPnEjvaoXvdr6bKA6tvplM5
	gS/PuNDCDzcWVdQb3ZkLZ6i97LU5MM8w86b5TrniPLwYlHcb3kRYw48ipgogMevn
	pZ7o1vxaXjLt8tf1L5QqGgfVeDF04pdc01WEppI12L+rn3HlyRQlbIYZ/6mBOfCT
	9rAbrw6OwAvUMBDasqXfU9AVCFMhIGqXDWBG8EwcPCCZkaLx27mW5anxAkh/byKz
	hfPUvQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ap23gw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 11:56:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35449510446so3996897a91.0
        for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 03:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771329398; x=1771934198; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=abZVH24cGewfyKGRj1gUBCi7aVoXPrWtU4+xmjBoHOs=;
        b=BOtbN1psE/gx/AFwC23yCzFnXNI4UxdfIs3mITGS+c6ZUVPeXI/ly5+kYsUSB9i7SX
         tWaPUgeBSk01mJ9PQw1O/TCB+spWZiyCpWFt7w3kirtjqO2PZLaFoBbWVayH8o9fezoF
         uA+9vTCyN1SsP5hfdtoONYNQfhZz4UYxTVZhZeMLSjnJCKXX83C7+sQ2g9znDSSSjMCh
         SW3Le/X1XFKHYMhu+0MzVxb8VmNvaOnHu0m5KaozuVzfxWHR8nQdPffNRZ+lSipQ1fnH
         8AWj5VFE9E0S2qMEh838qwX9GLV+S1ryPT28OA9e+F2JsW5B7o+6j3YqdUiTcM30EYE/
         s90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771329398; x=1771934198;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=abZVH24cGewfyKGRj1gUBCi7aVoXPrWtU4+xmjBoHOs=;
        b=uaqvEiXImGYESh7eLljcXovmJG2mFD6fst4Gwk3myoQ0XP3O23d7HjiSTIu5YVSU1Q
         9g3s/jTIZQEpRHw7ca95S7fCykhTXTWZ/fSlTXDMML82nPlWJrCo+TgDFCAf13c/JmXA
         wE8YPfwje122wutzWCwQqukUUHdHrD5ty68RmcqTmtPNKG/DgqpJ0bNvrH2jIlOkYslh
         sIKzxd5oysuAT0gm3PYdRVfn5L0GxRu9Vl1j4vaskGGguQRUraihknVsTpBDhrHvXLzv
         4qU1R83yK8M1a6H9Z47QmxI3eFf7niZmKrryI4ItbqdzioWlM+dDLVYggSW5Dv6msq68
         JH/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXY90uI9ROr13HzTZBnTz3N3Mfl5osSZuKUMmYBax4raK90PRszjZ6k+PSJt5RMfN4jEW8cfGhtJU8cMw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwv86j8gbbkTBnFB2viinTXRjahR4Myc7YLb9OFC3EeD/jPdHk
	VeWEjbx8vCYmsc4bPYJIGlZ0xzAs/TnVqiKquZm1FJfI2qxLmbhf818olPF8STBDsHsDxd+F7+7
	9o3n8NDj9fdYJJbQsgW4rVGJqtQqTr8Ado4Qy4IpCCp4Bpl981huoKrf7DlJoAZRiTA==
X-Gm-Gg: AZuq6aK4yNIP8R/H2pqMc6YH9hLfYnmqPN/oGuWzU3foBELxPUHHiE0ekbicDxjQN6+
	KI6fBBbgBnxf17Oqg5yezB2PC4FB4YqUCCtdvAaegE4CCZLia1bmOwYVkygo+3CThUQwA123ZI3
	V59MUXMX3NJzkyXRuKpHhdVQoMgA4lG0b/0QGpmyeVfVUvj5INWhEoFGk4qq4KMlKGM9a4z7sQ7
	fwE51wLe6yVFQ96l2LgQQMcPlfWHr06oSSP4rBr4a5hcBwMlTtdMZq7U7mL5e5c9k8kqDcHacbC
	CJgha6iu0Xi0C9x53yAAenueW4+1OWj9/4C5CauQyYYQ/0p6iMZWtAbfCL0QuvQULYCiaEzH5vr
	vv2DgFFX9SCF4EmM8ByiLGFPwK0qLJz/lMq27pz2OVULBXNTpqA==
X-Received: by 2002:a17:90b:35c6:b0:356:23be:7ecb with SMTP id 98e67ed59e1d1-356aabddce6mr13377703a91.12.1771329398130;
        Tue, 17 Feb 2026 03:56:38 -0800 (PST)
X-Received: by 2002:a17:90b:35c6:b0:356:23be:7ecb with SMTP id 98e67ed59e1d1-356aabddce6mr13377670a91.12.1771329397655;
        Tue, 17 Feb 2026 03:56:37 -0800 (PST)
Received: from [10.92.215.127] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-356a69b38ddsm10428379a91.0.2026.02.17.03.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 03:56:37 -0800 (PST)
Message-ID: <caa870e2-3795-40bc-9f0e-c93e313c8c6e@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 17:26:10 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add CAMSS support for SM6350
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260213-sm6350-camss-v3-0-30a845b0b7cc@fairphone.com>
 <c83ce76a-1c83-40eb-9c67-d26b7e6f68f3@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <c83ce76a-1c83-40eb-9c67-d26b7e6f68f3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5OSBTYWx0ZWRfXwlb82vQ6mPlO
 ukwWNH30DYol8b0rIUquaaz9IwKLYMN7Od4ToLlmwbqjesK6OStUuYR4t3QL6HPx+0RKEHLSLnB
 CcF/6KI8RtLlyaiwwBHq6YhAgpfi3SZsjj7xnaaVanlRy1k5M1+26NkCOcCrvLXNYZvQQKaDdoU
 i/5HQNqQdzGLdPZzNIH2WbY+d8b25C0ktEo1NcBYu8DtW43MCWxhmFP14O9nmGpt1pHJgiLgtO1
 yhqQBoF7XkY9eqR/sQFG08aA5wREOBl47JwEkQdyfTSmlhc+CcSMYRUgTnMFggjelKexlXeBj7F
 xliZDuDlWbfxVD3Pyn7VYTE5LPIaLARyJ/UzUYj5T59nvJw9lfiIcR1/erYzXmrs82UFsReGB6C
 5C4BkulgNxkNK3HwV7xSfo4lkufzIgZP7sR+1Q8umQIaZC7nGwgWKoxmIHOlZr9hduhACcAC61Y
 7hXpaqk3kz7QAZAvwag==
X-Proofpoint-ORIG-GUID: 0l9uLeFCTUqte6v9hlIONrW473fR9WJ1
X-Proofpoint-GUID: 0l9uLeFCTUqte6v9hlIONrW473fR9WJ1
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=69945776 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=yXsjsA-mUSMGIjApI5AA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 clxscore=1011 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170099
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52970-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,fairphone.com,kernel.org,gmail.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2E28014BAA7
X-Rspamd-Action: no action



On 16-02-2026 04:34 pm, Konrad Dybcio wrote:
> On 2/13/26 2:15 PM, Luca Weiss wrote:
>> Add bindings, driver and dts to support the Camera Subsystem on the
>> SM6350 SoC.
>>
>> These patches were tested on a Fairphone 4 smartphone with WIP sensor
>> drivers (Sony IMX576 and IMX582), the camera pipeline works properly as
>> far as I can tell.
>>
>> Though when stopping the camera stream, the following clock warning
>> appears in dmesg. But it does not interfere with any functionality,
>> starting and stopping the stream works and debugcc is showing 426.4 MHz
>> while the clock is on, and 'off' while it's off.
>>
>> Any suggestion how to fix this, is appreciated.
>>
>> [ 5738.590980] ------------[ cut here ]------------
>> [ 5738.591009] gcc_camera_axi_clk status stuck at 'on'
> 
> FWIW 845 has .halt_check = BRANCH_VOTED here, which translates into
> 'dont check the state at disable', this one has BRANCH_HALT (i.e. spin
> and keep checking the hw state)
> 
> +Taniya would BRANCH_VOTED be fitting for 6350 too? ^
> 

The parent RCG of this clock is under NoC control, and seems like there 
is no vote on the NoC while disabling this clock, hence this issue is 
observed.

The BRANCH_HALT_VOTED/BRANCH_HALT_SKIP should help, or if the NoC voting 
is removed after the clock disable then also this issue should be resolved.

Thanks,
Imran

