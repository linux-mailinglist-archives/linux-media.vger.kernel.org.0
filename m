Return-Path: <linux-media+bounces-52971-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMB7Eq1YlGkXDAIAu9opvQ
	(envelope-from <linux-media+bounces-52971-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 13:01:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1B614BB67
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 13:01:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32402303744C
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 12:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0321F337BA1;
	Tue, 17 Feb 2026 12:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ifSnJ1ej";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d+5afWpC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D0A2F3630
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 12:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771329682; cv=none; b=PooKUDFaIy2I1KXt9V//9FIAg+A05/KAzjyrbr5xUfG1TKeFoat3cHuWBpYcUV4E5y9+OU/DhM69ek08mWdrGHbo5GkD1utEkNBib9b2fEug8DD7I9ZbvBl8boDm3hQWH1TmsAMf3HWFnQPWljBAyIfW/+21YK6Nx/y6TCbc6Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771329682; c=relaxed/simple;
	bh=wyi/2K/PMgiBnA9eO9+b6JgtXV7Y4MAa2MEv05gq3no=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fxmULMMJeymv1SoUzhEi9c171rEG9UUN67y7TLAQDvnqaigBBz4F6wdKtLjjP+Cv57IfPxJVnxQKiAFSSxGIMx9hKkq1Gfc9058kRG1wx/Md65VDO2o+wEIrFJVr038F4JaxifdVJxbREiZhEyxD36Wmwvgu1+4cTdF9ZbPfwns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ifSnJ1ej; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d+5afWpC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H1ldap1232466
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 12:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qcoxJfqP8hTwWTWUoRtoBVPz62wL8BplEKMyIUX4f8A=; b=ifSnJ1ejb87BvdQZ
	byFrF3BA43EMtnd0P5sXvejeW7KYbJOi7PG03N7TUUgxWnILGIl1YjcR5/HZhyNH
	xNf03lcIcEPCAfSiFbXD5TuOs8NGmV6Npy4EaszDCr47/bxxzJvNy6g20FqrBsE5
	rL3IZRuEhCwSSjWVSKA7ECBvROh9ublKLVuRteLDaiUJf3YpexoPEEVdjhHBIr5l
	EVqXI56GASo3je2jY+r4wkHupV3FsN+Re7cWlPL9hhRd4u49WSacJUnbBTsvZHfQ
	qOfUNLzPOH7NCdM7lLFRocBDO7XmZTHRSujNRWycoR4TS1ExrysKbVa01R0a0h4W
	JifaSg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cca361px7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 12:01:20 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5674a0e6953so1150556e0c.3
        for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 04:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771329680; x=1771934480; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qcoxJfqP8hTwWTWUoRtoBVPz62wL8BplEKMyIUX4f8A=;
        b=d+5afWpCQZwcC5s07HiD6f3OxJKiY2C/uvHXpshP2FykSnnZnGl5wFtS4oNXzLdjIR
         SGwg7v0+QHiDtFEGPTHEWLY4GNe0ANunNPg5IbIoMhQo0nPvDSoiaU1IRAhKTPP8QkYb
         L1sS39nK55/qW5xd6W/+sk0jBXygCQkc3AT0554QIRNCywSkQbXAquVkwEFaqoohkg/A
         rjMhNPrfA4mHh3uoLZ10W6pyyolwWBheY7um6JqPz5omNpBOMKwNJjZJGh96dSRcNZ2L
         AE5mUIHB9LIIWv84MdItWHI3vtKqvyCCGjnms43TGi4sMSBVoU0JodiyO7ZlAkmt/Pxx
         WUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771329680; x=1771934480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qcoxJfqP8hTwWTWUoRtoBVPz62wL8BplEKMyIUX4f8A=;
        b=R15r7PDqUVi1iOK7v0FYAUS4+xXYXTW/u+oYi/6qXmDKVTL7LTgZi0vchf8n8l/Coo
         WIwrA30Gor2HQbFm8Mb4976mzPsab+Wz+f3OBfL10XsgY4oBKgEsalTkMFWPzDBbrXuy
         qusIjFmzNNF/Z/CTk2i21JQjpzsEp7iypez3dHdjDGFCEdrY/Pov8jVkcgC9JYRFeF0A
         N3DA3usBThdGcEOeheV4DxYMcrPCaz01CKqLteHE4y62NepFJAhHnMOQLVtSV0SaIleP
         ur0ob5YEyLTF8ULLeuWiebG2vTwLg07TL02+WZtXu8O/yM9ZNhsxWyCdSZk0DyR+cg7P
         FPCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKO3wDmO952IBYxc1VtbQKc4HlhEQPAjGJ4yVJtvWFj8x6jngT6maOKCwLVtFCdBUuBml2xa45zzLemQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyX05Yo32s6aGA1BfmOGS2DsJScCi7cr8V0vwhaomtIZcdH3tML
	EC0JHhf3K8NSiimdFBeKcYFGlqf0Y+KT4rdEMta82tYZ+j+EGTphYfR7Sm4TyUw8dP4sOsewvuW
	SnE2EpzJXIoOJiZavTY7EP0db/q5qqKZRKJtihOv5Tul6OQVhl3xE3RRCXk4TNswBMQ==
X-Gm-Gg: AZuq6aK4vC/nKMefZPvUcHimDbp0hotM7WtLrZMSPGU+iy8SkSHT0pvIv8DMPc0J+v+
	Dzn7K6bLMbFixl3VxTx/CWOuNXlFSvCVlGCIDLh+EaLuDAH9BlGi9lXwHf8BT11pA7uq0DbOBe+
	fPxJVCNSwibn6BEkt28JWlo+OjLtr3h5DBphW2xjulPoa25C0fxWA88Hi2wGWDK9T0KZBpWrKwj
	/Pe5JDQSwVE0EjZfhwNj9y0JLEH3wUvNoLFyybphUT2i9vIbmCkKAguYlj6Ex4OhmAnD4sIGrA1
	jbRUDfCMa71Cw9kEI/iBeWJRENcvXsPbx+Yh4WmvxsxO1kIDoEcVcg9iZ23plD/bgc+MUwCXNLN
	wZgGEjMypH1LsjfY2PXyQyDx4w6XtFR2hRbel9rnutX2CJM+/qNj3YOZktX9xx2uNwjM5Y1l0NM
	A2txw=
X-Received: by 2002:ac5:c89b:0:b0:559:5ac3:4451 with SMTP id 71dfb90a1353d-5676f436ba6mr1603019e0c.3.1771329679408;
        Tue, 17 Feb 2026 04:01:19 -0800 (PST)
X-Received: by 2002:ac5:c89b:0:b0:559:5ac3:4451 with SMTP id 71dfb90a1353d-5676f436ba6mr1602994e0c.3.1771329678699;
        Tue, 17 Feb 2026 04:01:18 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc735d2dcsm351116166b.12.2026.02.17.04.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 04:01:17 -0800 (PST)
Message-ID: <124c661b-db25-466a-a163-99ca336a3e70@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 13:01:15 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add CAMSS support for SM6350
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
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
 <caa870e2-3795-40bc-9f0e-c93e313c8c6e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <caa870e2-3795-40bc-9f0e-c93e313c8c6e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5OSBTYWx0ZWRfXzu4RpoHUhbHK
 O1ubfNmmvKRnK5xPOGn0G7cbRF6DF5S+PpEcRzy8qX5+dmn/EcLollNwXRje3YBo7GAjrmGSQ1K
 KsROiHXeScVZSd5onVeOLULX6An648FR3f/RcZ4JG6gO2ZRVtFqk+xG5vpPSVL5rkVGJTbppLH5
 JsFfpU7n0pOvFGA8NN+Mw5dpN2LIFtAZc+7eFFxj5g8ru2pUN1jpECpy6uqZhPpKVAXB/qdIsSX
 rMAY3W9BVvqizTHrkh7eQJ6NvrVXaGPxR6dmevBj3duS16KBgj2cGCW3CkUJs8SJA5t/rejk8c2
 HPVrK7v/IdbTmfd6i/wL6VjCJVm/S8p+w8HbkKd7OuUTCtPCLJPBW85uck7r+lqWfWh6AnhKQ/O
 uqStTKQJdq+5k0XHQ63YovbEouDJQEphc7kYYMeDiTd3/Z+9XLWDvYfX8ypMz71RKVkBOdLyKBP
 MovnhksV221aOpka4Rg==
X-Authority-Analysis: v=2.4 cv=b+G/I9Gx c=1 sm=1 tr=0 ts=69945890 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=fxqAw4-zz0YW6xlzh2kA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: -vDY_gfPO2QokY4KAla6ApoVrmef49BS
X-Proofpoint-ORIG-GUID: -vDY_gfPO2QokY4KAla6ApoVrmef49BS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170099
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52971-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,fairphone.com,kernel.org,gmail.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AB1B614BB67
X-Rspamd-Action: no action

On 2/17/26 12:56 PM, Imran Shaik wrote:
> 
> 
> On 16-02-2026 04:34 pm, Konrad Dybcio wrote:
>> On 2/13/26 2:15 PM, Luca Weiss wrote:
>>> Add bindings, driver and dts to support the Camera Subsystem on the
>>> SM6350 SoC.
>>>
>>> These patches were tested on a Fairphone 4 smartphone with WIP sensor
>>> drivers (Sony IMX576 and IMX582), the camera pipeline works properly as
>>> far as I can tell.
>>>
>>> Though when stopping the camera stream, the following clock warning
>>> appears in dmesg. But it does not interfere with any functionality,
>>> starting and stopping the stream works and debugcc is showing 426.4 MHz
>>> while the clock is on, and 'off' while it's off.
>>>
>>> Any suggestion how to fix this, is appreciated.
>>>
>>> [ 5738.590980] ------------[ cut here ]------------
>>> [ 5738.591009] gcc_camera_axi_clk status stuck at 'on'
>>
>> FWIW 845 has .halt_check = BRANCH_VOTED here, which translates into
>> 'dont check the state at disable', this one has BRANCH_HALT (i.e. spin
>> and keep checking the hw state)
>>
>> +Taniya would BRANCH_VOTED be fitting for 6350 too? ^
>>
> 
> The parent RCG of this clock is under NoC control, and seems like there is no vote on the NoC while disabling this clock, hence this issue is observed.
> 
> The BRANCH_HALT_VOTED/BRANCH_HALT_SKIP should help, or if the NoC voting is removed after the clock disable then also this issue should be resolved.

This is very useful, thanks for the insight!

Is any of these solutions specifically preferred from your side?

Konrad

