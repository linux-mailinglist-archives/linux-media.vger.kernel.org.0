Return-Path: <linux-media+bounces-51636-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNfMJy2keGmGrgEAu9opvQ
	(envelope-from <linux-media+bounces-51636-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 12:40:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1881793B68
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 12:40:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9FB2D3014C48
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 11:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB753491C7;
	Tue, 27 Jan 2026 11:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hAHBy+sG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GDD5oV66"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC3D2ED846
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 11:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769514024; cv=none; b=G62Y2EOhYClJwqF+2xebcgmOjWlcI8xdERxpWchmFzBRyaTjNboytUa+wuy3mGx2s7GxDKQv34B2fyLNZovGv6WJDLeRc1u6Sr/OfpJ3aOI4IRJBpFbLSq2r8Lp+av5VL4DgYcYpvLhZnvjl2PweKHOXprkFPAR66qo+ZWcVjpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769514024; c=relaxed/simple;
	bh=Z34XndASaBYSPIlyXDDXMGIrowF0LIEMraPJAbcOFN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q1O9bdPT9DwL8G0BLCbMlbP9ae6gC63tVOHvwA9hT6R4UaPm39cdUxSsOpj5b3KozG+nq5yedjFJyg4LfdzM37AHDW5X4gKYvIc3T60RYT9p3wL00m66ZDGVMCQyG/jIh9K8KYazUSezosKkA6LtEVHVydy5t5Po6gG453UYA3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hAHBy+sG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GDD5oV66; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R7S7Eb113343
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 11:40:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pyTXE/4ktfP1wNLAIJ7/zW9REPL6MyuWS6OZkwLnWWY=; b=hAHBy+sG536gNtP6
	pXAUBOxpm+99bB1rqlGmzL0Bi9E4T0En53RYgJ6/K7Ipq2UKgzBZt1YY1vkVAyEO
	KOEif28qlK55eehNSqsGLjuDXpsEFaLrtXUHQWOjxkVFePdwdB89074hPJelBEPp
	dQGB0EV67CqhHTS9/AkiQLrEfpAbC1ZQDJcbPVJ+YTUkIgAdsQ2TzzfG1Q+Enor2
	T4q328U2+M9pPwkwIiseDODEmcJl8DOVe6bI9KQfUmo+UWdPe7TmNjrQB+fOr1Ph
	9/0hDMnznNST1oQ/NP9se5wp2+YvBh9eIPeAxinElBl64EVY3NfRD4EPCmJi9RrY
	vVZnIA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxs0e0w66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 11:40:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c710279d57so786785a.3
        for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 03:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769514022; x=1770118822; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pyTXE/4ktfP1wNLAIJ7/zW9REPL6MyuWS6OZkwLnWWY=;
        b=GDD5oV66+O/Bub9GGusy7cEfXGoZdJ3OG++34u1Ow2LEer5FBPXPlyTQI+u4ReEfBo
         +3yWFRAHVbd7H2HyTKQtn+1e8kNwm0zJrzFdYsOrmCAzeaiPjSsAwJw8SObfz6qxyKB/
         04U2cY22mXbyDM2xJ0GS2q08orHWuWu1hD6Owwr+CKyA3zSnlt9o6MX/oFZebzWO5TLs
         /CBQ1mM5I9NKJWRgR9fE8XdGabUoOGxSMkILfA9c07bXs/SWoyXXy/vVerWYA8EIk5Vk
         MQiCSDWTtZddbtGZYkxxcjAvxx7TRW1z/UIrwZ2rnQxDZhbEXJUdBeJuxJr7jRCj89lC
         Jpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769514022; x=1770118822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pyTXE/4ktfP1wNLAIJ7/zW9REPL6MyuWS6OZkwLnWWY=;
        b=UVJVLukTvz/6pu5EzwYfrY3JvvL1uALzFqVxRoEOZ6vNH/qOFYyTctxHTspaqPRohW
         XqrBYfiWYZGt3ixTPBbBRKo/+iy2liVXvw1sEpzqRZZ2vyNnkMg0U0o5TLj0vYY6FyKW
         GfFAW8ZSx/Xd4Y+KDkX2XLGlkVW6Sv5+bcCIEfnCYOlAMWHDT2m6EGIQ+1dccJOBKXtL
         mcHblCeWOgGyBAgcHf1nb+fOjODCBsG/Qsn75IGdQ5dfJiA1uP/e1JGLuQzznEeuYxLd
         B8PYeXVoO7w9MyWVz7/cr43NV+S0GXinysZqBJcZNYfOxjKdO8shAFQjubk+vlkupvD3
         a9Ag==
X-Gm-Message-State: AOJu0YwO3u0lBqRHi4hw2Sk2B5JzIT8CY5g1HVxDzVxqz2KfGttDTj5u
	LYd72Wr2yVKFr2oBc80c+Od01aO4g+DJodovgKTZq6jLJS23IcsacXCu0LEsx736nhE2EWdPHX2
	aqyoPEWQQGT6swoDYFiaRI6fQ1dmtLPqVn8Gv1UZ46t27+vB7IzXYdeBU2FHoCmWf3A==
X-Gm-Gg: AZuq6aJwyTq1/45/kWUwrvsw1LG/BaaQ9ko3uG5AVzLrOX+mcBvKQYjmRC0BDTHP5na
	iiukYDootN+zQ4dZ4sgPr7hA+7nYh7BU1q3IQRoahd8wqOVuGsyyBNP+J4oErEAjUs5zkv8fzM7
	p4dVau2nvvG8zSYM76eV5BHrjnWJU92XvpT/NMcNVuUB+23OcknY02Q8Lfivh/mJxz/7fJWx54X
	P9LpVBDI47fNtW1IEFRTXoR/bMce+6nJIQcgx2/uYDYXBRSSefLhvXNQ3CAHDSON1kSniFCeekR
	QnFnJ/UlPJ3LYZeMjEjXRhkyTISEIw8wcZb7Zr0kIZ+WT3X92KKurHZqqZGwyL+VJntjtfc6ONF
	bWyV2/km2Zj3lDTx2YHX/6/kLz8MNVSuljeNIe933cCS6Hw3Y4cUFqBj+3cMkgVuzHDM=
X-Received: by 2002:a05:620a:28c6:b0:8be:7dd7:f041 with SMTP id af79cd13be357-8c70b9821b8mr101512685a.7.1769514021907;
        Tue, 27 Jan 2026 03:40:21 -0800 (PST)
X-Received: by 2002:a05:620a:28c6:b0:8be:7dd7:f041 with SMTP id af79cd13be357-8c70b9821b8mr101511385a.7.1769514021556;
        Tue, 27 Jan 2026 03:40:21 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658666bbcc2sm4473866a12.9.2026.01.27.03.40.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 03:40:21 -0800 (PST)
Message-ID: <721580cd-b493-479f-bd1c-6fd96df1d46d@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 12:40:18 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] media: dt-bindings: qcom,sc7280-venus: drop
 non-PAS support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
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
References: <20260126-venus-iris-flip-switch-v2-0-b0ea05e1739a@oss.qualcomm.com>
 <20260126-venus-iris-flip-switch-v2-2-b0ea05e1739a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260126-venus-iris-flip-switch-v2-2-b0ea05e1739a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5NSBTYWx0ZWRfX13+0otmuyGmB
 UtfNPIIb2HrHRTlku8QoUSb8IQmK2YVvAviW/Ww274a6y/L1cWbUgh0fY73q0MOcc6IDhs4Gddp
 YKW6jvtQd4bYE5Ss2kh58M5wn4usK/ThGzU9tT/Pfl07FDU2mN2T/VMleOhJiOwprNX47NEL6n+
 DP8eIRZVP6p9vew005qTuKV6BPAwsehraxfpJ70RolJHyeoNaJEhRHvtQMZ4KWOIKIRqfUVzHXO
 K1vo2UuRC9lwQeKtZJs/4VS6wszjwuF/C7v5NCsjsSyEmV8k1w2KSUfPDNXX1m6MWulXNFfjjnc
 GmJqzhrylbiLZsNTjDmwRX96oGTX4QtvIFZSk0iiyRrhARM/H15/+wcyBHDwmopYawk8zK4ClL9
 RFpVE8n/+R0gLqAvCv8JlxG1LHeiO+S1fjzOD6PmK/MWNE/NyKeZ5vpwASjK7gRopyz5ip3KXgV
 yc19MbcMMATcjl9vL/Q==
X-Proofpoint-ORIG-GUID: KqCTb6kgWeNzDzQhrVuw8fM810uis-Kr
X-Authority-Analysis: v=2.4 cv=Hvh72kTS c=1 sm=1 tr=0 ts=6978a426 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=oktRuHzOpdk0QsFJu6YA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: KqCTb6kgWeNzDzQhrVuw8fM810uis-Kr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270095
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
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51636-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1881793B68
X-Rspamd-Action: no action

On 1/26/26 3:09 AM, Dmitry Baryshkov wrote:
> The only users of the non-PAS setup on SC7280 platform are the ChromeOS
> devices, which were cancelled before reaching end users. Iris, the
> alternative driver for the same hardware, does not support non-PAS
> setup. It is expected that in future both Venus and Iris devices will
> use different ABI for non-PAS (EL2) setup.
> 
> In order to declare only the future-proof hardware description drop
> support for non-PAS setup from the SC7280 Venus schema (breaking almost
> non-existing SC7280 ChromeOS devices).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

The commit message could highlight the *actual* problem ("iommus"
entries aren't treated like separate entities which is exactly what
we need to avoid for this complex hw)

Konrad

