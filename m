Return-Path: <linux-media+bounces-58490-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFViMWm42GnnhAgAu9opvQ
	(envelope-from <linux-media+bounces-58490-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 10:44:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D6D3D4461
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 10:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6E2A3064673
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 08:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9CD53AE18B;
	Fri, 10 Apr 2026 08:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dNnmzlkB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MspDM5Bg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF896279DC8
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 08:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775810316; cv=none; b=bqXKnLl9cWhffs87iEqkYh85BB2e9q+u6OglkzF4n/mtMYw1cxFSUKiGWt+4dseE3Hq97aTlbrzMvQ0OJQzYXku6bmpSimgRWDrbiWmKCgrHu6Z4SQsyQ4SphvBv4hSVxvR4UjuaF81+J1nn8msLXGt1am9ey4bW+ktECexQIZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775810316; c=relaxed/simple;
	bh=pcK0cy4d1QLHKuoWlb4imXsxURLwhcTmKyJq3/4B8m8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R5NUrjyf67IGzPpuYWNrLAeSRvR7EqQ4qALAR9NdfCxlkN2hlO9sxrn8eHXDk2557kwzGuRJqDgqhtOYV9TNLbAKwq4D2M1a0xZjkuCjkNaf44uQBCHBBg5yk4K85WecxVP5QUlJ0SJpJIbIK/XY8hVa70QbtUg0pbOlO1LLg3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dNnmzlkB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MspDM5Bg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5oM2n4148029
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 08:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cyF6cs0TT9c7KJt5G+su0PloFsHOpnqMxU6VEDcmB7E=; b=dNnmzlkBDk/e7TbV
	d0mw7EEVXK67gANahGZyJNiObTHgT45/7fgyMHdrRjPKQrPCnThFaDmpeORjuP9r
	9i8NWnVZny5Rb1wf3Dyi5DIOAeBVwatqVrGdONwr4eZ4Mw+tsXQtvWf/J2RiGavY
	1yHXHFOMruU0QaYhomRB6tbHIhK4TrfvE0n8mulEtisqVLSnq/LcNcrQPIVBLZsT
	bmCA2N0DtHKmXW/7uIue2XyqVtAd5jS3AaKSjq1f7yr0wmYNTyLX5uMVMkn++caK
	qVh8xzCYKCpZ0kRY8wjN0VO4L3qnpMNHx3BYD6M6l6U3rK9MtTJK6iyLV0BAE0bm
	rrbI7w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudggjc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 08:38:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8d3e4c19307so2025285a.1
        for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 01:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775810313; x=1776415113; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cyF6cs0TT9c7KJt5G+su0PloFsHOpnqMxU6VEDcmB7E=;
        b=MspDM5BgDKkSLBUi+QE842FMjdreDqqTv+hLVKz5KCcXpf66dcOsjJlONvNv5Nuy3P
         CPPcpq/f/iPDZmG6Zu94WLSOlQx+yR7wnWzuEiwKIb/xsIIFmeTbK4pbBEGMvSX/cnCo
         mQzQGX4Yhnfrq2aAuYX5uq1vvEaqeUzIZ1cJjybuoLuj0tdZul2H63++Rzfb+H2qmwj0
         hC3GEDb2Q2ur8A10Fiqg0i1T2LNz+zQm1mIT4zdwv8VHR0Q1cBnuHnPwdKRjt4Z0xefF
         QQvxa70U0OpVaCuSVkgY1Trj3nXwlK6rHONQnyvUXDDp2/Y5h842zU4msREdn17h929+
         t1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775810313; x=1776415113;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cyF6cs0TT9c7KJt5G+su0PloFsHOpnqMxU6VEDcmB7E=;
        b=TTxgtjxk0gA8ooTxbtbU0b0lEHxgKsZHWVCVPsvFQoOtnMuA1mcio/7N7Hh/pv0z/n
         xTf94DK6QgQ45HJt3+1YFzNgaPeZopPiaO6Of43pR4bL0BVJbA0Fyhe8z4+HGZaYVNpp
         uJe7aznZjMpzEGweriknS4QETu2M+sWpovC1BC4LbqjeOgH5fJeSeBSAL5Nf+USS7xms
         U18RPTlWf6NU5cYCgmHW8At58JZ4TeTz/NmjC16hmaQL3vDJOar8/9u7I62sVEE9PuYx
         hQRNf6oK0qpSoy8XdnUVr7oLnJCaN7DuvT6lWVRbtjIuRddxAxuqoQRDrrAyaznsoDm1
         MlAg==
X-Gm-Message-State: AOJu0YyIbeG3Dg86MECudeGRdWMZqG6NAlZk+sjt71Rk2vxMlmt2A1Nn
	csIiQEIxQnJr3qgnNorv3Nxy79fQofjeKwyvhA9HVhBt2v5rs5vNa9A93rMDDCWpp/mTz6P2zOY
	zg7bujGHKBuZCfIQqU4LsuaWzLPsGOsS6ldnbXFeTYzaGk1GvsJtga8nt2iK1qiNROkYqQXwkK1
	tm
X-Gm-Gg: AeBDiet4QHoK+X227hOhHKdbLGMT4LTAly6IGNwWpjuPzn98zH02/xMD7rLln0Qjais
	OY3HcPvsVp5wE5kPiIGEUdrsIHcpoE4OAASpbATuF21RKH1anvoO0j0IUNFusgUaSsw+eFFv8Tt
	Lfsx5gc45n5bKhQdx5VRZYvMfRa5q+vOz0l3XeSVKSdMVjAWZazUP2dgJbNIyt8P1PQ2yhq2NVg
	/qPg7R87bMTrwiXwmB1cZoSUhulAgaCNx5zbAKSfPl0ZP4NSf/z0CqJUfGanZ/cVJqXlnzetyPt
	kvvoEanUcdMDgFpQ5Munh9TCNEQqhq7WZVj/k3Q7qFpzDLEugwEjs3l4aoNA6y2QfAelSoOXI0f
	c1Xeeuc9u/4Pne2qqZ+eN6yc0YVurAQstqVQZJgqlOe57IHVq4MxPJWkOAn6gfpIlJJ9f4mG1yz
	vn3UnvEZ+7
X-Received: by 2002:a05:620a:2586:b0:8cf:c218:739b with SMTP id af79cd13be357-8ddcd6fda32mr272172585a.18.1775810312779;
        Fri, 10 Apr 2026 01:38:32 -0700 (PDT)
X-Received: by 2002:a05:620a:2586:b0:8cf:c218:739b with SMTP id af79cd13be357-8ddcd6fda32mr272170785a.18.1775810312268;
        Fri, 10 Apr 2026 01:38:32 -0700 (PDT)
Received: from [10.111.174.66] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8de94216e90sm3026185a.1.2026.04.10.01.38.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 01:38:31 -0700 (PDT)
Message-ID: <c9cea1d2-a51f-4c38-8ae9-db868b86a928@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 16:38:23 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: purwa-iot-evk: Add camss node
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260410-purwa_camss-v1-0-eedcf6d9d8ee@oss.qualcomm.com>
 <20260410-purwa_camss-v1-4-eedcf6d9d8ee@oss.qualcomm.com>
 <765e4740-cf13-4d4e-ab69-c1abe1c39d34@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <765e4740-cf13-4d4e-ab69-c1abe1c39d34@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Ti1-lSEBVuTr1VL8ychEPXVZ6rpZOVoc
X-Proofpoint-GUID: Ti1-lSEBVuTr1VL8ychEPXVZ6rpZOVoc
X-Authority-Analysis: v=2.4 cv=H/brBeYi c=1 sm=1 tr=0 ts=69d8b70a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=HSoUWuXAm51uA-1-LAMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA3OSBTYWx0ZWRfXyKSyNEks+ElR
 Bwxmvl/7ZdHQLdi59q6DlnaCAkfgcoKlXB32odK2j4xt7tlQoUxeKgxwaminonrJtCTiFk23lYb
 08xC7rO7a7I8cWYASPTg72BBsMQ/+ZnzWJA2uqlhMQE9w+O5JMTEtHdPhvfh7T+5e5WyUqrLUJO
 Qe984RhiJ6mN3ndoPORqQPcuOl9BtRBwHo8bYGk7ixGmhDxEVRF1gtash1mcL2Hbz1oImczxYz9
 bJI8GsD46kZEn0GOh27RNcnQdxLrMqA8EQVE1MP5bR9CGOx2fnev+kZ1LMju0D+xlOR1AOcofE5
 T38CrNVv63xD2MUGUumDsYK/8dUC4olTdGURv98vN3YE/jnt6VZVnbNa+qiJce+XA9DEIg/Ho7u
 g4T7SWiNn0jKO2DU4l3aKhbW3WZHDOD4MfxsveQrXt2HoMCZHUOTiWdv42UW9Wy3ooOPyfcjcY/
 M7PFl+yeNr34JuFZHkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58490-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 46D6D3D4461
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bryan,

On 4/10/2026 4:16 PM, Bryan O'Donoghue wrote:
> On 10/04/2026 05:25, Wenmeng Liu wrote:
>> nable camss node for purwa iot evk board camss tpg support.
>>
>> Signed-off-by: Wenmeng Liu<wenmeng.liu@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/ 
>> boot/dts/qcom/purwa-iot-evk.dts
>> index 
>> ad503beec1d3d8c671d3564942a74c484de762d0..eef03f1eb2a950c06294159be3f97169fb487265 100644
>> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
>> @@ -734,6 +734,10 @@ retimer_ss2_con_sbu_out: endpoint {
>>       };
>>   };
>> +&camss {
>> +    status = "okay";
>> +};
> 
> Hmm.
> 
> I don't agree with this. Enabling the CAMSS node with just the TPG is of 
> very low value to an end-user and doesn't "prove out" the CSIPHY, TPG 
> and RDI path - which is the minimum entry point in upstream right now.
> 
> I don't support less than a sensor at minimum.
> 
> You guys must have a sensor you've used with this board ?
>

Yes we have, but both not upstreamed sensor, we currently have no plans 
for sensor upstream, perhaps this work will be carried out later.

And ack comments on the previous patch.

Thanks,
Wenmeng


