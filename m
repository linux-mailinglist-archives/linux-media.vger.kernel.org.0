Return-Path: <linux-media+bounces-54493-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABLlAyZcqGmZtgAAu9opvQ
	(envelope-from <linux-media+bounces-54493-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 17:21:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 785A5204202
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 17:21:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D3B4D33A55CC
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 15:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD393359A65;
	Wed,  4 Mar 2026 15:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jhhJxPqt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FWWClg4A"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9871E34BA44
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 15:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772638846; cv=none; b=WtUMI97a+6PJ5y/JlWYafb2DRx8kP9FsE6YpNEqL7sJn5ww92VOAJZRC+MmwVBPYAGxTiexagRtn5SAFsNkfyEQZx4zuSyIjXEnkBaU7yZypHNJlhasCse5Nekxe13KeRJLlF+lvBzI0p63127k263mes+t3jt4nJb1yAUPIc8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772638846; c=relaxed/simple;
	bh=PMGzy0QIhL0vRpNSRHs+DPTQgWtI6ilhEm2+hq5tQXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O5MMKvRPp/yNIkHkq0YxphGyfJEgpK8/8PLiv8OFbtIsE/+xaKPd0TGHcOOQYWZcZeXSKSR25wnSKx+cnqOgp19szsMkMReNx8AuJM7hTKVGQyg7uiPxpTu1OZgVi8Wa1yRrPo4CiqcEzoQUWGuErBI6zPL8DZmkBliq6fcP0AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jhhJxPqt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FWWClg4A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624DnDdj1203263
	for <linux-media@vger.kernel.org>; Wed, 4 Mar 2026 15:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BseyVlfG6qNLJh0pukGQEsnvFe0Y0lazqGGE1966Oz4=; b=jhhJxPqtA5CNygZ1
	hhZPBB3+4LkVrZ/2IrBlz01xpPZcQf7s7oC6SjIYsfGt8t75ZU9MVDVsyiG9iTuQ
	bKbHZHBud3w8ByFGzdYcbYGOD224Zhax+1lNSdGpV9M5OM3uB9CEl3/pbRnTjw6k
	2q1h7PP0/lRyiPHDH6ny9TD6TtNPsEmKMT6dzB3SuT2MiED3CnhKb9ZdTb9gJfFi
	DswqfsBt+T0jxAjHZYnGTIMWJ1zmZmvATvbSZDU80IpF8t37TWHENSC94fqaUHHx
	omg7a7zBtVUVXRqvPFp/z5iSGrjmLH1fH1UTplpGUVFFHhPepOMafiP5CNI/1/Zh
	kTEgsg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpf9c1s30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 15:40:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae50463ba8so156773985ad.0
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 07:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772638842; x=1773243642; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BseyVlfG6qNLJh0pukGQEsnvFe0Y0lazqGGE1966Oz4=;
        b=FWWClg4AV6hqS2rfjwuMjD5GNjGZosJQnJJyvH0D81T3SNtyEiutRwiOi2eW18efdD
         70NlEmA11C7V9lrt4ElH8igclLttflkN03MUzwsL2XJPcc/vewfo301tyUL//sZSd9eB
         XrWQUCbqLZ7gANcKL24vFxfvHZIz34/k0PSE+vNUHhTkLTVSce0Pv9Kl32J+OO/HXGW+
         r27Jl429OajzFOQY/KLk375pX2ErPz6q1EUQkcfzoDGYZOyVbD+f1KjyzaIRK5F7ZKKP
         Yzy2FYIzE/5CaLntbrZZ2+CisbkDVQl/Fi+MF7BgfUk2BLL+Ay4JC+P2Vivoa7aneowN
         OROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772638842; x=1773243642;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BseyVlfG6qNLJh0pukGQEsnvFe0Y0lazqGGE1966Oz4=;
        b=YSPf1N6eaAvt3OajqnRm2Vv1n+1SLr/isy93FJoxAhFIkup/DOkbkjY74rfzybaIzN
         6bE2evLRLYPnjhDl5PnaDdNiNdIrNU6VwnmYaFOJfan+McR3F32VCbjnNI/ngfsALtlG
         Jk9UtW7/8YpXLVEdmDZIzUseU0VSpVUw0WOI3XZqYNMuh0q4pQ8reoXDDppalNJto9kn
         WxiFu/Mak72HTJVL1I4xoGsxeRdkfG2DMw8XTuurGmdSWINZ1xxLOOWFLmu/PY6lXrrt
         9rrTNT0NnQfaitKNco6Q9vjMVAjFy+pOQvJE1ky0V/rmrCfCkbCz5UT4t+Ci/gUGbRM7
         JIUw==
X-Forwarded-Encrypted: i=1; AJvYcCVEwzjE5wU2I2FBteSl73GyBvM4PoQuMP9Sd5Pul8grOah9fUbmq5idLcF+UHT7n6lpseDPeULJ3AuTUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyW6Xq/eik2UlbZr/BIq4CKMPvEvWYUcOcib6NG5uTqZ9ryhPZ6
	vz0B6VlEyfMk9rQsXMs3L+W0U3olpGo8C3exjcaZqoqJPlcnXpxkroD+G4PdTp0YQ0fvPEAXQXy
	TWza7MqYLhkm+18SkJDr1+1b79NWnHDd74eNs3hqHwE+uR6OvMMXqfUNiOhpq7TexZg==
X-Gm-Gg: ATEYQzzFIltt5FMafSBXMlbYB4Xdkj54mQLA8ZgDoy1GYV91FY4DRfnZ90rnDlOlni1
	4JElwiVqHo/jRAbv8UgfRMwUF5VPclf23Vdtimln3TALV5/PFIf+UsrvQk+uqP8eZ1kgSrqqHue
	YKSL1SooMncN02zJFaeuGR2KoKmJN0tSgE1Fl3LTCBkHYwKyaVkMek441952wAm3PbfFPCeiIIY
	uKDnlPj2rfD1KZOwgvmrfcLXoSdd4AE046VVonQpu6f2wWtUN+KlqgBDYPubEd6WehWpLoU7FCp
	01cjNWWxMGl8n3ZaTXtT2kUfRxGN53zAuEsfbUJi81kjHTXcRqQTvtAlUZo45he8hTvV+j8RtLE
	xyHmgayEm6V7e7w/K6kCSokN3VqrQupmFKJUbgtuwPP3u6Y1ky5VCzQ==
X-Received: by 2002:a17:902:f790:b0:2ae:4c9f:4a5a with SMTP id d9443c01a7336-2ae6aa01e74mr24774435ad.6.1772638842217;
        Wed, 04 Mar 2026 07:40:42 -0800 (PST)
X-Received: by 2002:a17:902:f790:b0:2ae:4c9f:4a5a with SMTP id d9443c01a7336-2ae6aa01e74mr24774095ad.6.1772638841774;
        Wed, 04 Mar 2026 07:40:41 -0800 (PST)
Received: from [10.204.101.56] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6df578sm202097025ad.81.2026.03.04.07.40.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 07:40:41 -0800 (PST)
Message-ID: <22534cad-8940-43c5-a7b9-01d002943093@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 21:10:33 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] media: iris: add iris4 specific H265 line buffer
 calculation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-6-850043ac3933@oss.qualcomm.com>
 <cbwz5wtd55enswdi2zvvy3d66nsxlemyzdypheibvljnewmkax@kybx63aveepn>
 <ce80e60e-90ca-415d-83af-4fe2e86ffd91@oss.qualcomm.com>
 <hrjwyqz4r6usqvxhnsvtap4byfu2zvumji6whudda55vuym5yk@u6s4heswm4rc>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <hrjwyqz4r6usqvxhnsvtap4byfu2zvumji6whudda55vuym5yk@u6s4heswm4rc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEyNiBTYWx0ZWRfX91e+JucxJq/T
 yiTAffAbXZvaxobhfxecjjktz5qZdMwkEW+ptOsyhFJ8CP4oXhARMAun1GfXDm7nkFeYuNlYw23
 DQPY1jSqg9D8lSnri7JkordQtNUSM9TrhmW6S94JqZvL34YX2WuETEdsncwWhp/ZfTpB9LzFu9e
 vnjsD5l6gAMyLVidDpALjZbQ9E6zSocWRBhLozKfFn68N+RxrBTqNRq0zag0ydtw5PjxvfgE7wR
 Hv7HkOXD/M2JtJIR1dvoWwnqcgQ24WqmSxT7aZZZQ0GIjz/Y+p6oHZIXKdBsITMxWZWVetlentD
 WMh6mQj4o3cHALOw7FfiloZdbnD1JNmuyx/b4KltB9P/uUXV6Nf+2r+W6CYHmv1hMkrwa9S1ZQJ
 608Jm1sCEvTWQCy7TKzbH6WfUGYYNX4/s9BI1rGrgIl/GuerC6bOTRa5SXn41y24RzazH83SKtV
 gMsL5u7Rd523imKIK7Q==
X-Proofpoint-GUID: n3RJcaWAaAM5KjHKhZZGLLZW-gPNcNQy
X-Authority-Analysis: v=2.4 cv=S4LUAYsP c=1 sm=1 tr=0 ts=69a8527a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=_JvEU8PJbtvYPaoBJaoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: n3RJcaWAaAM5KjHKhZZGLLZW-gPNcNQy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040126
X-Rspamd-Queue-Id: 785A5204202
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54493-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bootlin.com:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 3/4/2026 3:58 AM, Dmitry Baryshkov wrote:
> On Wed, Mar 04, 2026 at 12:18:58AM +0530, Vikash Garodia wrote:
>>
>> On 2/28/2026 1:58 AM, Dmitry Baryshkov wrote:
>>> On Fri, Feb 27, 2026 at 07:41:22PM +0530, Vikash Garodia wrote:
>>>> The H265 decoder line buffer size calculation for iris4 (VPU4) was
>>>> previously reusing the iris3 formula. While this works for most
>>>> resolutions, certain configurations require a larger buffer size on
>>>> iris4, causing firmware errors during decode. This resolves firmware
>>>> failures seen with specific test vectors on kaanapali (iris4), and fixes
>>>> the following failing fluster tests
>>>> - PICSIZE_C_Bossen_1
>>>> - WPP_E_ericsson_MAIN_2
>>>
>>> This reminds me of the commit fixing SC7280 support. Should SC7280 or
>>> all VPU2.0 platforms also use separate formula?
>>>
>> for vpu2, there is already a separate formula
> 
> It was more of "do we need separate formulas within vpu2".

vpu2/3 uses the same one currently here [1].

vpu4 seems to be using quite a different formula to consider it within 
vpu2/3.

[1]https://elixir.bootlin.com/linux/v6.19.3/source/drivers/media/platform/qcom/iris/iris_vpu_buffer.c#L313

> 
>>
>>>>
>>>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> ---
>>>>    drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 51 +++++++++++++++++++++-
>>>>    1 file changed, 50 insertions(+), 1 deletion(-)
>>>>
> 


