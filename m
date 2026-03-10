Return-Path: <linux-media+bounces-55039-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGT9GnXDr2mfcAIAu9opvQ
	(envelope-from <linux-media+bounces-55039-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 08:08:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FE2246207
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 08:08:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAE7B3022614
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 07:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F21F3D75C3;
	Tue, 10 Mar 2026 07:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bcn7Fgj6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VjO9RtmU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB463563EA
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 07:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773126503; cv=none; b=tMZDxljV62Var/dGEQTEqxikBSYCeqHMMxRNgzYHQFGPGLYa9YUCYgVqJpC9l0TMRYMbeWeMu3vF61ErvwYEERXzWByhO+6XK4NzPMKMr7KcHKPffu9bKSCWbhlIm1frQaJ8RvXtu2LvB74zMoyxLIECPwWbCrb6mkaz1pdcOHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773126503; c=relaxed/simple;
	bh=RhYHXM2kc6dVccmgVDQQtGwFmfvqJL/62i+Pry2FKr4=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=M1guJq1nv+SEuihE+QONLsQ5ghjnZtMQ3Zon6XqTiOqhWi+mNT2RikB/RvgXHQ8Sn1MSVwmdqgvL5WJ/ACGgqaG4Xl3QKlBj2RMI07KWvtJkIaVa0zV+pGDhjo5OBwpxJjBkGRxv08sBzA+R4IzSWPx4UsVTjgy7QPWCAZkx/1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bcn7Fgj6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VjO9RtmU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2Ehfm3087381
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 07:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vtePKHcyEc4PtQGw91imrhnMDPIGumdm1X+oOMpFwHA=; b=bcn7Fgj6JLWL7avW
	XyB7KQ88RIWAK6dg0Czz211KLuNOWPtDTpQ8OgyoDxvE98Lny5THFiYY9I2+QKuQ
	pn2hUuiYiLavqlOFHW+dXFnOmrVrPRGZNCYw7znNQxu9Tk7o4rTJcjr14ir8QRDd
	LFksscAnFIJZASQ0jM6ICZo+2ErQM0TtNOSzx2cIhImOWVbQjHYJ0DvZrDuWSWdB
	c/LqYQP0SGE7/SsdzjnEouhXp3zIPQJIGd2u4eb4bK/4A3WXjLOt2Wq16I7jWjV5
	9D2Es/+1opcE0jW23IiURhnPbvQJ/LMa9a1ZT/RKuLkAz8P2Je/SkaF0T9ZnUOeu
	nlPCXw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csxy837ja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 07:08:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae5031c6c5so445664465ad.3
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 00:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773126501; x=1773731301; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vtePKHcyEc4PtQGw91imrhnMDPIGumdm1X+oOMpFwHA=;
        b=VjO9RtmUUVgl8hC1WXdYRhBnEmQksm1y0oY+Ez0BF4XO0B9J+KfKzdzTFB4MgDk559
         G8foE8+0FXXj4iE9YwrUtbvUoDbeoJ9f6yDQG5Byy0U7eI9Z4fld3wMnhHcw81hDb1DP
         w4TrMINObFdTcN9t5tO8kUF7xh4AEJXgeiDO0wqXtvTYeUMSZ7MnyFX8JyqZB/33SLHa
         VC3VusuYS7OBZcylkATTJwjB5SWZc82svLDYCzGqn7uFgaQl48yFy3dcpOrqov+GNjR4
         FgyJw7ov6wIEogM/muemO0QK8Z+loOcEO6ycTLODtPVlGk72y6wLzIUcA4zisNuzvidz
         pdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773126501; x=1773731301;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vtePKHcyEc4PtQGw91imrhnMDPIGumdm1X+oOMpFwHA=;
        b=YIqNexbatclxXHVAJRIwtjSx6v/6b4XNfEl05lg9Ud/VeYbMPD3RDkhhSWzN6PCByA
         WrTEU7V99SGBBJQZJqIUx+YaSvw8e7pVrWkKAQaMXyvq4uWp52+x9rKUbubN73qmE8D6
         46aqMMOwlNpeayvr2xyW2OWvs38BmDYqBRf1EidOCb0H0gl3wFH4jI9r/F681D8/dIU9
         T5ofV2lvfzPhZz3kutWTCAuDTYlOmWueqBRRVqG0mGHjjnK8ctuN+U6Ywnzkomua4n32
         8+VoX+ePp11Oc3LpfpKDnzcqohM3Kjc6onZ8j1Eu7tfDZ7vgwntLMh7A9sRE0WRmEkqf
         sFIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOaVHjwLfGqzLUWjcF+azxWUjB87lFSqlxfRoMeXgoaRt8hq+vUC8jTyQIKS2LrZIDZtf9PCRVaSTTiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzH8HGORbSdVFS7dsVlA0US8LNBEOlF5HP/S7HaZkF9RZSZmR94
	RVScWhwIq8N3/X6THMoLSqauS35uAh27LALroaTIh3Jwi4KDUyeJpemjS5V7dZmcl56juZiIQXP
	8KJFQt1jldMhSWyU9WcRGExDoXt8VPSdKcS8tov8SkSc+Kvr6Lm2kX3vhQ5lQLnCOtA==
X-Gm-Gg: ATEYQzyC7X0+HkKCPGe5QN+C9f0eG//XBioWeULMno14ljaw2sPICgAILYeBvj7WMNo
	oBtQ0uEMOLUpxUZjDtDq/CjYRgTsltGMM7Ilf+uamLZ3VeY5vaOzLm4wcSV0lzzyMPh6qhgazPk
	Jcjk5xTOLstD6q4cab8YXPK2OcVz/XIZ83YgiL5RvO8NQA1m5RGSKJ/GtuBbbQYQNeAPHe/BIYP
	xuUKqMFRVtr5EeJxFaxbpPSTJ5rFKfW6QFexZHFfvg6tHGsiVK7aSgLpQ6qPYZ/5QEtnoqLrOVJ
	eXdAzjoAb58XLZbEDLNZSQ1oTM0c/OsGWq2dBPaExDm4Ur99VnCmbb0YarB1M6JDPq9rbJljFo5
	3LA8W7gbs2dF11ifDbR1bCS/lNKsOT/qY/Y8MS4Fvi9f8oNUa5N/hwr39LthvCJdPRgMNbDhY/o
	qVNxhTgXAOj04PbCQ=
X-Received: by 2002:a17:903:41cb:b0:2ae:41d1:276b with SMTP id d9443c01a7336-2ae82477146mr161130195ad.47.1773126501394;
        Tue, 10 Mar 2026 00:08:21 -0700 (PDT)
X-Received: by 2002:a17:903:41cb:b0:2ae:41d1:276b with SMTP id d9443c01a7336-2ae82477146mr161129985ad.47.1773126500963;
        Tue, 10 Mar 2026 00:08:20 -0700 (PDT)
Received: from [10.249.19.96] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83fb516esm132605425ad.75.2026.03.10.00.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 00:08:20 -0700 (PDT)
Message-ID: <d002e9cd-fc2e-4dfe-8edc-9d88cad075a1@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 15:08:15 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: media: qcom,sm8550-iris: Add X1P42100
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20260306-enable_iris_on_purwa-v2-0-75fa80a0a9e3@oss.qualcomm.com>
 <20260306-enable_iris_on_purwa-v2-1-75fa80a0a9e3@oss.qualcomm.com>
 <20260307-olive-honeybee-of-luxury-b22bbd@quoll>
 <2e0e4ad0-b012-40dd-8b35-7555390bf44a@kernel.org>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <2e0e4ad0-b012-40dd-8b35-7555390bf44a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SvmdKfO0 c=1 sm=1 tr=0 ts=69afc366 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=eNhI0xmxWCpRIF5FWwQA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: URBsNRFbmt8WW_EESb_21QKfb6ZUeEzD
X-Proofpoint-ORIG-GUID: URBsNRFbmt8WW_EESb_21QKfb6ZUeEzD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA1OSBTYWx0ZWRfX+fNDADSz6VoL
 b9ANagLSPdlawLS1j3uYOeA8uMApok1dItjVFVYyWMoKjECQeGeMr5pMIH4Fh7r/2XYK3DS1wO+
 wijgK6hTk7qBT+qBk2cEedLkZY59nCRChwr8qyrCsCJo1XjOCZnvrhEFmCGZFHwVMGwAnDXgmvb
 hXcF07MzJ1qUi9JPw/w+JAgijV6eCGxp+4WWdlxFQ4QTUX3vroJKOFaIqTo/wX/2Ct862efvwXi
 EnczXJpZxgiUE1plmB6aMmLDAt+IphXgeEoCb/oTx/PsOwGoKPHbX7ar6aGmqKBcn6iC8b2mHuh
 U+/XZsZf5/4U2s2DMVAjJtzk2YusIRBHb9TAZwxXLTEFdSIkvQVg9lB41wQ787pGqOCBSIB29eV
 ImhiN2+/rbVX0OkGZQrCb3h3UV9eNKqXAScf9rpHhhzQPfWC+6CkCpIuxY59gpVGGTD7JSn80k0
 HaQupYBuyFovM7GQe2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100059
X-Rspamd-Queue-Id: D5FE2246207
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-55039-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 2026/3/7 21:19, Krzysztof Kozlowski wrote:
> On 07/03/2026 14:13, Krzysztof Kozlowski wrote:
>> On Fri, Mar 06, 2026 at 04:44:29PM +0800, Wangao Wang wrote:
>>> Document the new compatible "qcom,x1p42100-iris", which is compatible
>>> with SM8550 but adds an additional set of clocks. The BSE clock is
>>
>> Then please express the compatibility. Device is or is not compatible
>> and you just wrote that it is.
>>
> 
> ... so maybe you wanted to say they are not compatible?
> 
> Best regards,
> Krzysztof


They are not DT-compatible. They share the same IP and binding, but
x1p42100 is a separate compatible without fallback to sm8550.

I will correct the commit message in the next revision.

-- 
Best Regards,
Wangao


