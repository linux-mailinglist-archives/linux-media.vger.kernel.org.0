Return-Path: <linux-media+bounces-51736-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOwTNNsGemlE1gEAu9opvQ
	(envelope-from <linux-media+bounces-51736-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 13:53:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D05A19FE
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 13:53:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5632A307FC33
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 12:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB84B350A3B;
	Wed, 28 Jan 2026 12:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g5wTO0wR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nszg0aTk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B9834F468
	for <linux-media@vger.kernel.org>; Wed, 28 Jan 2026 12:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769604633; cv=none; b=kCDZOazGcCx/b2AZBwBG4uwlBc5+qeNPA9fYXc6nhto/zOnlAXQyfSfF5OKT2JZz1oxE445GyQKIBzwTKcQ3DKBEjs+weIYcdHBfdSWrr4SiNhU3sNq0W7vqG5znhVe+2jZLU3Vk37Xek45uNaaa9FASjKjhk4QUwJc2FcPvqd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769604633; c=relaxed/simple;
	bh=x05EH6IoJ4/iyPVoHvPoWf1Qp32Y7RrlJkeIkp9TeHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TGjqBLAz99Xrn4ulVkM+BL4iCYOvt+aZWv3bSFJO4DqzjS7WdWq/WF0VmWA9Z0+lA/4mRwSBZHljl8lq2hSokuk9YcwX/sYzMux3vtxNg7zSzxZOT2S3MOzs2TNbRp7ArOFuwxZwunwy1xrSIR3OtjMOA1OsJ/KpmtUwFcLNI2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g5wTO0wR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nszg0aTk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S938Iw3247497
	for <linux-media@vger.kernel.org>; Wed, 28 Jan 2026 12:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qmPSdwD92PL71U20ccvuz7Jt/7HoYLnD/OdLvqYMNuk=; b=g5wTO0wRn1gZ2jRz
	t6FTaG7ilZ0rny3Z3eWEMa95C4Blpfp+jz0dsiLL/O8aklgUGoNJUWBTgPnMzXi7
	tSf+/q1SJiAqq3ksReO7xhvXkJD9g4rKcbr/m06vSQw11GkEXxg76rAMbnriMtv7
	fXp22kVbFZSAMNzO4qYmbe4Dp1xFtzvPDTNED5Cv3k1g8wzS+NYdU+w202vmXB6C
	0pniWoT1E1aeXlEBO6JRVo6yyI+eVKr45SlYFoMUS79o0HOUzaVy1ZlrI0W8AO07
	plXVkY0OqCUe1VX7Tvxw4yCpb3mHAMhXB3BkhYrA7o1palCaldshoDbDtPUjpEBt
	n73WVw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bydfk17gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Jan 2026 12:50:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a78c094ad6so72926305ad.1
        for <linux-media@vger.kernel.org>; Wed, 28 Jan 2026 04:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769604629; x=1770209429; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qmPSdwD92PL71U20ccvuz7Jt/7HoYLnD/OdLvqYMNuk=;
        b=Nszg0aTk7vjSLbqcd3qqetyjLJ9hAj0AncZ0O8rnDZKv20X4bGank7bEzhGfCL3VrJ
         FaU6HjLWI8XPF81dfSVAkZTFDecHsDM2kThYFn0H1iVAXt5USHe3GQVCASaX4kAhUU6g
         DYrsi35G3R53iT/HXTxQRj87wYS1SSfPVv8JnQ8uWlcG8GKoWrFd59opet0VXln49ESs
         hD0olo5aEquZYFY7whiVZRNok0UQJuot9ibbDQpvb22YbDxMG8Q1cE/RjLse2HkGojwF
         l39gkaviV449uc3LvBiIAOsJ8bEgkCM43OzjwZwhyxn+ZXqcWb5wSHN2XwrXZ5KpKIVd
         nkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769604629; x=1770209429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qmPSdwD92PL71U20ccvuz7Jt/7HoYLnD/OdLvqYMNuk=;
        b=Uc2+1yC5YXPTwJPh+xVJiwZPGE6HJYqGAp40Jqx8ev68Yuz3ROa2wUCgUGwoHIuN+K
         TLxLtluv/UvI3D+5hREG3A6ZONt8SuignEgMQ5kJ6t3v971ImSqP8h3HiL+e51UXu/jw
         wm26QJclvzpWZyByPyAk7YAdMObh2j/hz6bLcQ+ccm51tlSv+XnSg7J43FUiu1X4Ric/
         NxA5ALox4etmH2r1RAWqWIPG8+QKZW9w2H9eMpmb4oyOTZOLmbJK3xysDLgFCVf+C5wv
         cDgTr3y5ja+5+Fa1UoWb6xmxc7JTU+umPgbf70o9kOuNaoWmmCVD2qw16RVX3tFLV7VV
         AmFw==
X-Gm-Message-State: AOJu0Yw9faGyvXZBElQvBsrWKyfxGnmTfxbLFSD37hlZhATu0Q3ZbL6N
	nKPztujPQNJVElWtbdiFql8OFGicdAnxUL8JerADYFYSDhgxjQ3vOLYI+Ed/E/hJS4AUAaQ1VeF
	kRVscyp+a7jS1+QbKjRGWeor1a9xqBtFRkSmUmMJH/OfdKdcz0FFiN+/qMTjeSUA8FA==
X-Gm-Gg: AZuq6aKexLaET6zWK5Zoez6U2OS/NwUrz0O985CdN2jIO9/VSE+vM2/m9K1x9R1EY75
	pxUkUwtk/u98Le8wXAMED7tgfsmlF5cijwMf9TbjYBSCkPO9YH3k03LW7jZYqXvB8caYniZWWRV
	E0LCoGxhSB8HMBQTDQmXFpOXRfAsuPO4kc1xuCJ3YYYpodtyoSVGyCfSElP5Y7SHedvgiJj4rCe
	/27FTFTrajvSejydPof0aEzHBlJNjVv7qAZOQPaqEOpr/OKlrZ+yTpM1Xa9cCUEbmLqbr8A9NPB
	vGSVKOsmvXAkxdcj4nYAKb5AtqOAZOquQ5ddUCzEQ5ItLVxKynIgeAxLHENY9P0wTSD9rftsq+f
	A3KOR4vIRAiKBz6GMsRrAi0YXEicAd6NXXZGCu4I1w4E=
X-Received: by 2002:a17:903:2a84:b0:2a1:4c31:333 with SMTP id d9443c01a7336-2a870d645demr52336495ad.19.1769604629328;
        Wed, 28 Jan 2026 04:50:29 -0800 (PST)
X-Received: by 2002:a17:903:2a84:b0:2a1:4c31:333 with SMTP id d9443c01a7336-2a870d645demr52336285ad.19.1769604628714;
        Wed, 28 Jan 2026 04:50:28 -0800 (PST)
Received: from [192.168.0.171] ([49.205.248.59])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3d4csm23365005ad.56.2026.01.28.04.50.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 04:50:28 -0800 (PST)
Message-ID: <a902c741-bc74-49a9-bf09-070ba7b5adb7@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 18:20:21 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] media: dt-bindings: qcom-sc7180-venus: move
 video-firmware here
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260127-venus-iris-flip-switch-v3-0-7f37689f4b39@oss.qualcomm.com>
 <20260127-venus-iris-flip-switch-v3-3-7f37689f4b39@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260127-venus-iris-flip-switch-v3-3-7f37689f4b39@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEwNSBTYWx0ZWRfX/Hs1tWguU7R5
 XfrwsBxleFaClzOJFVB0wT6zld7oh86c1Mv+pgzaHcgeEDo8LUbzx+QwaBkrDrs4+8JbzSQUsOv
 GjkFXzmp2y7zHtRx4RF4W+Gu93M/Xqex4LyIUe/g3Q55qDtMvfL3GJgCMFqPTFrHL3bAjhojhDX
 1uWCnsuI1sXO9fTi6QflsuJ7zkyV8szANsM/UQmjcHByGw/nn26C+Tbljw2JbvWdZ86JMQaUgmC
 UWoyHI5IximcrLjEY70zlHAcTVhAzEErLPrzKTcU6hV1VYkTdEBCb4DCJG2+q2pWn1Qm2pQhVcB
 5XGzrGkIkLeeFPEHb2kOJRgmZ8Htm5eX8eHKdz330xnAN2y9uwrYPFSlfbnWaHQy26G3+gkvtE5
 /0GtEscAkdE4Zzpd7LpkpYItE+xVjh/tLjNFCOTC73FL4OePzHlaNpTwEOFlLo9sRf03lOAu8pE
 f94BGvZx7VQcZb5yR6w==
X-Authority-Analysis: v=2.4 cv=XfWEDY55 c=1 sm=1 tr=0 ts=697a0616 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=4hJEjaH6g9CgPEswoao2AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=taCg-2STDlqsnU512KsA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: guo-vdtN4lOQkguybXSxARIY4Pj42coX
X-Proofpoint-ORIG-GUID: guo-vdtN4lOQkguybXSxARIY4Pj42coX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280105
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
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51736-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 59D05A19FE
X-Rspamd-Action: no action


On 1/27/2026 5:53 PM, Dmitry Baryshkov wrote:
> As SC7180 is the only remaining user of the non-TZ / non-PAS setup which
> uses the video-firmware subnode, move its definition from the common
> schema to the SC7180-specific one.
> 
> These properties do not accurately describe the hardware.  Future
> platforms that are going to support non-TZ setup will use different
> semantics and different DT ABI (using the iommu-map property).
> 
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

