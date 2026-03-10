Return-Path: <linux-media+bounces-55044-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPI5HmrJr2nWcAIAu9opvQ
	(envelope-from <linux-media+bounces-55044-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 08:34:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD252466B5
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 08:34:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 83046302D735
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 07:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95D37292B44;
	Tue, 10 Mar 2026 07:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kis8Ct9G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bcAl6O5y"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDF12C0F6C
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 07:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773128034; cv=none; b=RcQSXJs62xtRuIA5DmQaP5YUtaMFqkCaqb5BZ3ax+42obzZ6CzqWrFFsHqB3tQ6n7gGOjuOrO7qCiX1s0R348Q4HaIWLywTKm0VLZLJOJMmPgNRw0DcjCu8BKk5gsGwPECWUYzS3VQQg7kqjC+Zsi0yhNDoQ/mUvktIhSaOdZ08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773128034; c=relaxed/simple;
	bh=sa8N0Q0K4fy60XBSi8KfgsBfmmSt8g8gD08mTtR33J4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aGeVlUEo6AELLsWtrutZ5A9uTHJ1lDGa/LbH8R3g+za0BxNQQG3SVmyxlCU9CutriHqGAzzw34GsaeiQjLhI+B9+T4lRwmc3QWbRdal5DoAKZk0K1DM3uzdsHXm/AXj7eEV+eI8J6du7/gF2ddz/aBJuaEh3SIFgOplRmxDgfQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kis8Ct9G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bcAl6O5y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EVtn2373292
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 07:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6jGZMz8cc7oYRoVY8qQfu8RJQuvfF597ul+4q7rukKg=; b=Kis8Ct9GRpNmKtwJ
	DyqBDWDrEjtOX6ie7KU2k4gGiK6S1xJnr/EMX8A09/MbLt6LYEq4cHuVIFVihy36
	hvZ8umOrJM2qHjWLwwBnZ3ME5SUkiQlmBnwHw+Fw8ZW0NAWQb2Fj9m7I3GCbc8z6
	B1kiQa2ZhdvLozL49xc9r4EArybe3waENlPry+rHf0tlU7vkPmHnm1tFbHwGD3Q4
	5LQl24b92P0mP1QvwbvaR8TXolpX7F5C7a42euRwpoVmvScFy06ftvc1o0cIetmk
	skOJToP807conUhcupSLAlv2eGl0B9Y/7bdYqn/673W6OJZkkHPjgEIlLbK0nPmH
	OT+mpg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cswwkkecr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 07:33:51 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-46724f3e25cso504663b6e.1
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 00:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773128031; x=1773732831; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6jGZMz8cc7oYRoVY8qQfu8RJQuvfF597ul+4q7rukKg=;
        b=bcAl6O5yLkGsL8Pk0RUBWyqxjtXa42isSmGb85Nc4p/mvgzi+SFXMpwbccDyqz+dLk
         4EnjGKamV3M1kLvD9S34X75je9lQhHi1/WtH8ilHbDymvsyi+VlsGAJfB1luJEzAUAO2
         CrR7dFB+SgkVwf71ohrEG55SPj73EUAR/kr9n+QRT4nY05oLVjvSKqqOsZo8aYb/Uiof
         m1R/gjhC28DY2lek+ipXZoGcDxPFXbpjDu3uZVAGYTwAoVMOUK7VLcpWZ0JptiMjv94V
         NZIfGZbQtVQR9K7tyXqCjGpsSXN2EuJuHaBi+Oc09BcVHUYfm5zb2YsY7XgOE9i8G4VQ
         fB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773128031; x=1773732831;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6jGZMz8cc7oYRoVY8qQfu8RJQuvfF597ul+4q7rukKg=;
        b=vbaW9YdS5bdv6uQFc3mGaQqMtIkUn7tawdsAc2MGclDjhmp8OrpnUQwgiWhwjpuQoz
         sN3Kf6WQOtcdPbUThjogVY/R7/CMymDgc2foEUzoflbb8AC2XDvGlzrbTDcBWzOFiJWL
         Oz+fSaUWT92kks0nittEICt40ZpilSpoy3iItCS8NQ1wuhIT/qEyGtmlLopmQ/1/BO2r
         4d1mermr1LNUV3fx8loU0DrCS7lu1XKEmD+LebpQxbzF5QslF06JiMwm2mfStZ2hjPBl
         9uE4QR6oPgXS0C8OiJIvXGHVuswSCYFN2daeb55sLNIYD4HfgZD/z3nvEq5EzjOlUSqV
         Ottw==
X-Forwarded-Encrypted: i=1; AJvYcCXN+156cDglUQ4y0Dg7KrDUbBfIiKN9v92X3WRvsi1G//hzEn0cxx0l4Fq1AHBbxUImzZDQ9v+TZYjteA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyV+wORiLv34of5emjkB2zgehWDZ0d5rjf5rD3yzyVqlb+shyDq
	KwRDr9mQ0AuCsC5YE1w5+8be5Xl0KTEFkiu/81HRgBeW29u9PsTuuSwI7c5ldayoqZ7MI3GjsoD
	NfYerBFwkgH53GwUWUjZR+5AZR43Xplg3kqVKmUFYzzzl6TltazeUnXH0uQ2G+1q/Mw==
X-Gm-Gg: ATEYQzxGEkonFVQd82GjAi38BAfyyVP95d6TIjJQI6LkPyVJpsQM06YjyfnLbu95qXR
	XwnawasHwdLmu2/ZeZIgH2AwLAkRlAEh6izBT0eEzVDKIKTjjNlJsSL/yreJJGpFdbpkvWXJkoK
	R/OCRxkl1v9Q9eJrCYbMQnoree6zLnSy/aADh24VVrjQFRsieMTIhsjw6JNRelbdcgB2sSoYsI2
	UW5nsiM7cHBzH+8/h+cDoPoW5rgj3FtfrPwI0OM9ZkpWZJKa9q/lof1bGIKuCWpgsdNhZgB+5cP
	bSpBRgGFfXmpwD64WjdjmylaxXe6CfEc64MSs4VEWYpTJUPlyue+cLt8sCMWs7gEOmGEE6bnnMI
	NP7MyvpzrQfHLwUwAC0wHBZJ01hggGB5uMVw093hjBYm7LvgJdjOScZc=
X-Received: by 2002:a05:6808:1189:b0:450:275b:d942 with SMTP id 5614622812f47-466dca7e59fmr7695402b6e.10.1773128031279;
        Tue, 10 Mar 2026 00:33:51 -0700 (PDT)
X-Received: by 2002:a05:6808:1189:b0:450:275b:d942 with SMTP id 5614622812f47-466dca7e59fmr7695383b6e.10.1773128030815;
        Tue, 10 Mar 2026 00:33:50 -0700 (PDT)
Received: from [192.168.86.165] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d755603798sm2041412a34.29.2026.03.10.00.33.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 00:33:50 -0700 (PDT)
Message-ID: <e0532de0-40a6-42b9-8936-933c31251d5e@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 00:33:46 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] firmware: qcom: Add a generic PAS service
To: Sumit Garg <sumit.garg@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-3-sumit.garg@kernel.org>
 <e0a86461-c136-4371-99cf-c0b0d31443a3@oss.qualcomm.com>
 <13091f47-938d-43fb-a8c0-4b081818b557@oss.qualcomm.com>
 <aa5qdscMRq7abfwT@sumit-xelite>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <aa5qdscMRq7abfwT@sumit-xelite>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cZ/fb3DM c=1 sm=1 tr=0 ts=69afc95f cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=zqicFvc7-s5f9fRnGKsA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: UBEzKiZZXms-02npu1E-QcbJUwxy88GB
X-Proofpoint-GUID: UBEzKiZZXms-02npu1E-QcbJUwxy88GB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2MiBTYWx0ZWRfX3Cr5HIcyzfzT
 Uie3UKFugfJVfAWzdQBQ3Ka8d8i9BOR5xLZgxfo0zX4EIOk0aDYvLsh6mjjPp3CCMiolccYAVmG
 IdYmNuSAghgNta1QEeH8afQ6HUDz6iPDTQ79XO5F5GARVWmya9c3V6M45MQLat44vLswdeBQXav
 IKbdEt/ayPkmhAI9gg/HyQsof1mUxp0qkaGR11YWSjYTI3R6+Lyt/UkmgpF4fm27dcohe0dE+BR
 XxEd70UX2A0bfcr+3PMp3PmEq3/NtW6thB0fBg12v54a5zQgUDtJWq4iKex3TQBAbCBhDYZRpJX
 5v6MqXEg/o/HL3d8eDq15LgxfEoqnI3IzwVNfXzwHQpatTdp82ELT9oayOS9/T4Gos8O9EQU/yI
 EVLo1SOuVzA03qCsncYGHEIPjG7keCGRM9cWxs03D9hcvrD+asSGxig6eMrh6hC6HEwlm7lE8GV
 zJkFtEo0i/gLsxNJQkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100062
X-Rspamd-Queue-Id: 5AD252466B5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	TAGGED_FROM(0.00)[bounces-55044-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[trilokkumar.soni@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/8/2026 11:36 PM, Sumit Garg wrote:
> On Fri, Mar 06, 2026 at 02:00:48PM -0800, Jeff Johnson wrote:
>> On 3/6/2026 11:47 AM, Trilok Soni wrote:
>>> On 3/6/2026 2:50 AM, Sumit Garg wrote:
>>>> +MODULE_LICENSE("GPL");
>>>> +MODULE_AUTHOR("Sumit Garg <sumit.garg@oss.qualcomm.com>");
>>>
>>> What is the convention for Qualcomm authored drivers? In some drivers
>>> I find that Qualcomm doesn't add MODULE_AUTHOR. Can Qualcomm community
>>> clarify it here. I prefer consistency here for the Qualcomm submissions. 
>>
>> WLAN team was told to not have MODULE_AUTHOR(), so ath10k was the last WLAN
>> driver that had a MODULE_AUTHOR() -- ath11k and ath12k do not have one.
> 
> As I said in my other reply, it is quite subsystem specific.
> 
>>
>> And in reality it is very rare for a given module, over time, to only have a
>> single author. The git history contains the real authorship. So just for that
>> reason I'd drop it.
> 
> Sure, but you would like the driver author to be involved in future
> maintenence of the driver. In my experience that's how usually the kernel
> development process works. If a separate maintainer's entry is fine then I
> can switch to that instead.

I would prefer the maintainers entry than MODULE_AUTHOR.

---Trilok Soni

