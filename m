Return-Path: <linux-media+bounces-51737-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +B3VCnUKemk82AEAu9opvQ
	(envelope-from <linux-media+bounces-51737-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 14:09:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D290A1D7B
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 14:09:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A51330751BE
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 13:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1814352959;
	Wed, 28 Jan 2026 13:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="poH3XJ2A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z2UShES/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A124313535
	for <linux-media@vger.kernel.org>; Wed, 28 Jan 2026 13:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769605513; cv=none; b=K8bVvtQJyoosmwSgZqhm5XrQQ3G6qfDDOHR2MRVdJwE4a2/2wo4Fn4sB5fYSma5LLwVhDuBU8A1ZHDkR8yFjmnbFzWxZogHSIflaTZrLrHM+AFpcUEMjrzdCFZdFnCXH6jsXEyg5RjXavQrFxmFTma/n42J4ztn9cYHT5erATDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769605513; c=relaxed/simple;
	bh=IfUVJCWZJtR0OPWS3Rfqb+4Gc48O43zL1jeJrkqacOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RqIX3V+jr/KdOsUBhLstbRgkiUZuyMAItraCp/DCb298UBQGYqwH17LTFquq5BJY8mumPdLfggueZg7v/2bmJZk5s7mu6unchGnR1gFzKF2pfseC7DiAZVh0BHgAhf7WsZ3amYrOIqzM3vtKdQdE12oQjomhM0StyKvTkMwUlXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=poH3XJ2A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z2UShES/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S92WSA254625
	for <linux-media@vger.kernel.org>; Wed, 28 Jan 2026 13:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g7+4dvO7yoB7tlTrFHNDQLfZsfKMQXFFnZNIMEfs6p4=; b=poH3XJ2AUTSQxC5y
	dj4v4XY8EPqKnLvWi8jk3Hbg9EYiiUGWiLCRYl69MaecN1Mv17bChdNoI+8RTO6i
	k2yeLNXjDMDgOMGUhZFNVXWQLLZRRbTw7jwUJ86NHQb5LSxtoYcbTeELlYZ4Izit
	SFzIh7BtoHDqe+Bt2jPsTZeFqeQAZoauUmvIs6Mh3c9YOungIIrgWOMDwqj0mR4P
	tdmE7Y0f/4PHQVinMaqV/oG9a90eQ9hf4hk/FDbjcz7v5kb+8igD7xt6su0Fii9a
	RgOexKYz3q56MY2ecCZ8dY1aV/uW0C8fBT4iPHwUIOsieR9qRgC7/vJQdVWQqaOw
	5pGtIw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by20y3eq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Jan 2026 13:05:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a13be531b2so68642305ad.2
        for <linux-media@vger.kernel.org>; Wed, 28 Jan 2026 05:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769605511; x=1770210311; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g7+4dvO7yoB7tlTrFHNDQLfZsfKMQXFFnZNIMEfs6p4=;
        b=Z2UShES/9hjMOexzlqz+U+g/AHlRjWOMYt0bKHkCp1HzS/Plwir8OWveiwV/jiF7lk
         VPEf/o0hsSiwnwTh422gbOxhkozs6L8DC5y/fhkYXj2KtNy397iWRln+I3zj4yAOoae1
         Py39bjheXU6dT7IqKF5P/cenHUPyrtSAFyQSztZ9Jq7rMZRfdB74GAa1DS+3AxjmGnNC
         XVF4OnTEuSeWBic3peV7DlilOGuhHL2jy4gsPc3+R3IZbjvyZUs5+KWW2VqOz4Qh6rg3
         EOMheLRQ+Q0iXLusK/mTJ/RwGeyanbXZXrlzqodw77wxftPCR/gEhk6gULz9QiRNtU3R
         olKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769605511; x=1770210311;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g7+4dvO7yoB7tlTrFHNDQLfZsfKMQXFFnZNIMEfs6p4=;
        b=A9DFBNho0GvzxcTYJicPCe0QGiO111UjlKS8/OOfKdEmUElE6X5+Jw/tI31Rlqiece
         /N4O/M0EBt2WupP4+EKlnWFYxtijsZZM64FOkDCFix0ghtToceXH/n9LCdb6pxpmtC4R
         R4F367V95KUL7xAtEjcKAe2c45+5s6wtIDFTsiAl3AkAcyQ5OG/JmoP9ijA8iH1ZOQ2T
         qo9NWtwh/+yz5sn7gy9CHeuABMEj8GBnbh5feS7WrWRwPj3GmIbg3gwBAR6SCJnQXa6n
         Cqp3ifDWq5z3F3FJoyuR8kb69YrmH9+ZGfCKSh0h4GX5cP6pjS+pEFUUhKIFDd3ufg+F
         DmaA==
X-Gm-Message-State: AOJu0YweMmbu+8A+LGiVU2Jb/Tnii8eiqBHRmnmfzHGeCGOanxhvmKwb
	OA0n74tLxSmrTj5I+X/CtAINxDC23qkAJVAsFXnQUOBCS+ZI8M52CJnNJFeEE3Hiusi7WlpfzEH
	yTpBplXSRYiBsAlqzHcmvOVY6YkOEGMR7qHUrAUgBkeG1ezsn/XLZDIkcZWWlBcB7mA==
X-Gm-Gg: AZuq6aKtAf8F4gqik5G9+FNZI/mvkg7K8KyQqUIfmwsGpgLX5abbV88LRhrGhFGWNon
	pYhWT87chjvkaDx6vNbWJNvNW7EFH89VJIhZtuH185aDv9dDiXnuHZvbJoJow/8ZBSQBbQH6ETX
	ke4/kUm0JxmuOIHBL7URN0OyDNlblaXmH7Ps3FHoM1kB8OeBh4+8AUhFMvuCh6mirIqLlYrL7xV
	2Pto9prtn+LrfyP2udkd2r4oeRKkS3TW3FgpLuDBZzOPAkozFz5eFRqyPByjNvKcomYFN0oX7dU
	nJYcpy1awrShctuj7d6X53HA7fHXNzP5NxFWjnKx9CaCRaKCTkYnDD25wimvMiFMIDUCu9RsRTJ
	PBpD+IZbzQ2YZc+NG0eDXXo3FqT6AfOKYku7vVB5d5xE=
X-Received: by 2002:a17:902:ec8a:b0:295:8a2a:9595 with SMTP id d9443c01a7336-2a870de207bmr48703725ad.39.1769605510592;
        Wed, 28 Jan 2026 05:05:10 -0800 (PST)
X-Received: by 2002:a17:902:ec8a:b0:295:8a2a:9595 with SMTP id d9443c01a7336-2a870de207bmr48703465ad.39.1769605510118;
        Wed, 28 Jan 2026 05:05:10 -0800 (PST)
Received: from [192.168.0.171] ([49.205.248.59])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3eecedsm23189435ad.15.2026.01.28.05.05.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 05:05:09 -0800 (PST)
Message-ID: <22583dde-caaa-4d64-bcb6-ac7f09916a8d@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 18:35:01 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] media: qcom: flip the switch between Venus and
 Iris drivers
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
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260127-venus-iris-flip-switch-v3-0-7f37689f4b39@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260127-venus-iris-flip-switch-v3-0-7f37689f4b39@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DCFPcvwqpy19GiWlrndqp6dVe2tJOz6U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEwNyBTYWx0ZWRfXxH7j9i5T5fEm
 NN/QcKRw+gh0Ps1LwZ+9xb/W2fjAIP38vrXKutdQ8guvNI25RtR5WYeCUV+nxnYBwOITRH04ujd
 Qj3tO/5aw82ZTvV8nonr0gvCO2hKsYjX9bO3N5rmlxCwbXE0zvB6lCk9//6wuM9kY7UvQY7NDku
 w1dxM0DE5hMiWMDJDI2J1HIT+ZfwOXFNCskSlsK++V/8RvkIY5RmQa0MqCk9eh5jac6g5ZCbNcH
 9AjhIJQ100amiYSJK2tl0NfYbnTlLuvpwP4N+x/yPbTXiY3djdHpVF9ZKMIiE9+iAF5LAL5YnSp
 M5RZ5Y482/8CM7GS1qTGk20cZyPZNjhk2vMnkhHUWj2BuIpY65Hlae/yqA4YfMI4mQ9kRGo64fd
 nKBkLGljk57qTns5P3bqQ15kuW9R2zTtLldDSkOxFSVvYYnip0mTbFDbAnTF0I1HJeSfdx0P50s
 BdohaDJRnWFJeH5k86A==
X-Proofpoint-GUID: DCFPcvwqpy19GiWlrndqp6dVe2tJOz6U
X-Authority-Analysis: v=2.4 cv=IKgPywvG c=1 sm=1 tr=0 ts=697a0987 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=4hJEjaH6g9CgPEswoao2AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Ml86teEJwu2bBuIv-asA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280107
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51737-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7D290A1D7B
X-Rspamd-Action: no action


On 1/27/2026 5:52 PM, Dmitry Baryshkov wrote:
> As the Venus and Iris drivers are close to the "feature parity" for the
> common platforms (SC7280, SM8250), in order to get more attention to
> squashing bugs from the Iris driver, flip the switch and default to the
> Iris driver if both are enabled. The Iris driver has several
> regressions, but hopefully they can be fixed through the development
> cycle by the respective team. Also it is better to fail the test than
> crash the device (which Venus driver does a lot).
> 
> Note: then intention is to land this in 6.21, which might let us to
> drop those platforms from the Venus driver in 6.22+.
> 
> Testing methodology: fluster test-suite, single-threaded mode, SM8250
> device (RB5).

Could you run fluster on SC7280 as well ? Also please share the v4l2 
compliance results.

Regards,
Vikash

