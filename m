Return-Path: <linux-media+bounces-51821-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oC02C5iffGlSOAIAu9opvQ
	(envelope-from <linux-media+bounces-51821-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 13:10:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C469BA56A
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 13:09:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 511A130180A6
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 12:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA2F36C58C;
	Fri, 30 Jan 2026 12:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zq1WdLaq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MXz0t+Js"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF1B30FF3A
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 12:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769774987; cv=none; b=Fz0Mw9Zvhx4KsMJoha6+M9j6jfJDtGC2XmPk90e6RBfEJBxfLc4OR89E98VA/+H9jySO6HE+AD1qk3cV8NgMk45QX+bqCqacvd3KlYqNH1uL6Z/lr4NmOQuqRd3G3jNnSSdoqiXSW8O6DLYxCTAgoEm/u0tdyJj5yoJQ86FdqZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769774987; c=relaxed/simple;
	bh=B4E5Rc7ydMSkhCAXk+m65nqa567Uhu5nj9sJQiCD1+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RwGQkCDUhcFL3g5acIDL6jePXAM2QfJmAbPlY5x8YrguRA+9RlB3SIPz5fV99wE0IjIuLZR1qKCZ43yE5gsyTRu6q9cWAMqN/WQPB0E2X3FviWBaEF7MEXimJoDXchhL5iqqmH919WKfo0/YIkB1gqLzy/LBLQtPY6L29iir6Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zq1WdLaq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXz0t+Js; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UC0xL41485239
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 12:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qMp6G8YARvAiVhUzI6fpDM3BETDObdyA/r0aYftYbBE=; b=Zq1WdLaq3JLTRwGj
	Y66/oFEePtIsek5vsCbpD5JGZdP7KCgpoTiIdEShYDlxXD2ubLUYqfSmN7Y53YIa
	3ewRzH/Z78/VGtFPvawg8TF8RhymZLO3NVL0HcgjRnbOTlBIb644tO8TIcBUZ6dm
	IKjAJdt4DrI8OpVP3I/nCqiybZJGrlMnSUu6tB8Ylnk3S+nwU1lphjttA7RQ79SV
	FghrNkAcvtOZnfi0rNiZ+Kuk+VhmntdBvERbRws/IOUZp0xLYotMVMcaPrMQkYa8
	vMLYlG0NO6FJyFSMqeNo7BwT/p7pWD+JvJZvlN03L3gYAgaWW4TEOCZnPVqPDkGl
	VBgKeg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0nsf996g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 12:09:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0f4822f77so54338395ad.2
        for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 04:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769774984; x=1770379784; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qMp6G8YARvAiVhUzI6fpDM3BETDObdyA/r0aYftYbBE=;
        b=MXz0t+JspKBpekhFRRYC1q1mGxKdifaa5VcCK+RrV4HcxvpuB/bwKWWbQavD/YvT3I
         iph6iZk6uoAT6r36AE3DWELH/O9F9Ib6FRgojGKqCPPnZvrpcR013n/+VggjXVSURjwf
         Qew3Ui2U6x3eRfupLumfSfp+btaK6FETXTgbjsXPyggyexWPgqK6s+RqHa69i8ZhuwhX
         y+kuGua4xBuymTgVzYw71WL30uBqadHt13urPn9CAjTp34t9JXLbGoiLqA+BAlcTU+C6
         PA3x351MJehnQvyk0i/rMg8gke0MyWRjby/yLLZzzrnQXQuW8gYBZzUM7Dt35xITgb9r
         BRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769774984; x=1770379784;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qMp6G8YARvAiVhUzI6fpDM3BETDObdyA/r0aYftYbBE=;
        b=M/GOUDnPP0cpyMQNvidQGgaUrJiHV7J0gx0zWQuobbT6pKwVQf9BJqAbuOD82HL0N1
         QKeTVwM90eccGfdve0UONzDlE3vp5yOZHVJiMTVUoZ5FODiH2VilpRdGyN8nVk5q1qG/
         FsIe0qzZQI4gY2baarhjdj/ziZFl4x6+cOuA3mJMRTw1frC2fp5h9Br5e+8QNyyEU7Ub
         7yk7pCm7j062ilZ6qhVFNPdHrXLiT3/C2cjgtkLCcOhSkbIKjq9QvHFlG2rZzik3e6n+
         nbaf2Ak+n1VUPd5nVNO90/xNOwpWFG7ssfz8JrB4EUJRA1rXLiX5vluNZORN1VQ+jkdi
         r/TQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTJ+O5S0axlA7PE352bunJM4PSD5dHP//8pCyGjYHIN0lEMK3SuAqkyUKhuCMdLmgQLxBQjnzEgS2z2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWRVRjIdLjLpMofS2RgSpFTEH+JcDQzN7hK3YPyBx5HR1UZ0eS
	DvGsFt3DIv8jahbwQXqem93FSf3poXISEBGCFNRGU3zQScRpD6wdpqP+HVzFJqKccepmsdHIk7g
	1mImckXa/xxz36kAcaa2LSM6I9z04on5qlv63cKWVROXhFpHZfQ88oqz7MFwFG0LYIA==
X-Gm-Gg: AZuq6aKVBjeauVtzWp9XKb/IfdqCSgJP3ppH6p5J1Jf9Ey0xwQ5UK6CFuwKHXu85KPL
	oZk8uQ9IqYUlkSmOo+OwMyN5nNFKcyPgw9dndAxz5xAid3lmpWtcJCGOzPNPIdAgL8yY5WvJz0k
	BaVzWdIy7xbl4rDM7PoD49X6fRIHFoMSxEtrZgY57BiEDgJm+lgQDrp+uN3y2ZZfNbKL+NqJHFb
	AmWRx/rpOZCOoOWCgbIokSf98dKrpFJUb3aM9XWc6kb2iZgPr4XHHVlBSdl1f+79uLfMKekHIYj
	9sA+m8Kxd87xAcdtxo8ADqSHiiieK4WeGRf2nK/5lOe+kN3NCQlTVqp8YpuOx50tAf3ndZLd2Be
	DYYmen4dgLz1/cgZ/4Ydt2wptLJxMEaNbxcQeuCk=
X-Received: by 2002:a17:903:3508:b0:2a0:c35c:572e with SMTP id d9443c01a7336-2a8d99129e0mr25485505ad.30.1769774984431;
        Fri, 30 Jan 2026 04:09:44 -0800 (PST)
X-Received: by 2002:a17:903:3508:b0:2a0:c35c:572e with SMTP id d9443c01a7336-2a8d99129e0mr25485145ad.30.1769774983963;
        Fri, 30 Jan 2026 04:09:43 -0800 (PST)
Received: from [10.0.0.3] ([106.222.235.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3b29sm71343445ad.54.2026.01.30.04.09.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 04:09:43 -0800 (PST)
Message-ID: <f5c0e401-7053-1fa2-299e-056744daee0a@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 17:39:36 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/7] media: dt-bindings: Document SC8280XP/SM8350 Venus
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
 <20260125-iris-sc8280xp-v3-1-d21861a9ea33@oss.qualcomm.com>
 <7127f32a-0db5-4f30-b1b4-cf72fc117fd3@oss.qualcomm.com>
 <hkiyrszvcnczancdrbxgjkvyy2ifk4fm74v5meba3fiuseder7@yagmskxu27gh>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <hkiyrszvcnczancdrbxgjkvyy2ifk4fm74v5meba3fiuseder7@yagmskxu27gh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Sx-HAVbKba9GLDUD58YVeNgGot3dR-rt
X-Authority-Analysis: v=2.4 cv=EvjfbCcA c=1 sm=1 tr=0 ts=697c9f89 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=6cH4IgXjao/mkWo6W7aGpA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=NYMyJ-crKx8sv3Z3ZaQA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Sx-HAVbKba9GLDUD58YVeNgGot3dR-rt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA5OSBTYWx0ZWRfX2tgQKe42K9RR
 7cqwFk2ROzDShVtSDqy5oO6ie9zhLlBQJwxLXT7JBmDK2Ndm1EQ7+8uMeDSVDo9D5Kb1w1m/iVd
 jkVlP2GwyDGb40vALjx5oRc543e6PbHKIXNphC6SVN6zFfwgfJ4+yM+pvoi/5flC0142AAGhmht
 GHlJpywut2MrTb8lxQ9+oKjK2ORDaaQlYBWTY9+W/Yshk1iXveo3O5h9LHBiIO6rrqX0EJFJpie
 iWLLZNws5fUvVwnjjOdBJVqEb8DBuCHdyB/jCcNy5R2f7z+RZ7GiCW/NgiQvEed3LWc5oxke0ch
 JmsXhYkSlMx6+Kg9UuJMgqGlv9FJLVdU2XSSdv8Qq3bKCCd5BkLKumR4tlXUAOIPeUQdjnD0YKq
 9cvhcfB1FKFRkAAkDbGGlKuGLt/kKvZVBZL9SK3MdB+bYvAh35QmVyC9pFJQ87q75REKeJyQcYx
 D/JCAitUJnNxIeETGOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300099
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51821-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7C469BA56A
X-Rspamd-Action: no action



On 1/26/2026 3:50 PM, Dmitry Baryshkov wrote:
> On Mon, Jan 26, 2026 at 11:00:56AM +0100, Konrad Dybcio wrote:
>> On 1/25/26 4:32 PM, Dmitry Baryshkov wrote:
>>> From: Konrad Dybcio <konradybcio@kernel.org>
>>>
>>> Both of these SoCs implement an IRIS2 block, with SC8280XP being able
>>> to clock it a bit higher and  with SM8350 having 4 VPP pipes, while
>>> SC8280XP having just 2.
>>>
>>> Document Iris2 cores found on these SoCs.
>>>
>>> Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
>>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
>>> [ bod: dropped dts video-encoder/video-decoder ]
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> [db: dropped status, dropped extra LLCC interconnect]
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +description: |
>>> +  The Venus Iris2 IP is a video encode and decode accelerator present
>>> +  on Qualcomm platforms
>>> +
>>> +allOf:
>>> +  - $ref: qcom,venus-common.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - qcom,sc8280xp-venus
>>> +      - qcom,sm8350-venus
>>
>> FYI the hardware is actually named "Iris" starting with 8150/8180
> 
> I'd prefer to continue using the name that existed in the earlier
> patches and which has been used for other chips in the generation. If
> maintainers insist, I'd switch to -iris for the next series.
> 

yeah, pls rename to iris, that makes more sense.

Thanks,
Dikshita

