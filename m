Return-Path: <linux-media+bounces-51995-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AAWADN7gGnE8wIAu9opvQ
	(envelope-from <linux-media+bounces-51995-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:23:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91473CAD33
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:23:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B0CF3007495
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 10:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10DF23587C6;
	Mon,  2 Feb 2026 10:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fTuI6cCG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WCVtdW7m"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31818358D14
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 10:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770027821; cv=none; b=B6mdDRcl/AEYbiDFZAHs+z3MTWtTXrwb9Z6HFOoSRkwkHyanlUIbddKQpNp5acDdyA+9ip4EePynIQ09KqStglfFJyaiaY48iNXjfFopnncbBdcKKmhJ/9Su1yTEYld8JPMvmJ5Q8mlVGt9fxfsS4PPG5uXah3DYaixg+xtF6is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770027821; c=relaxed/simple;
	bh=pIZITcj25wsKvhmdYdBtu6+GgTflgSEUTVbI2jUl8XI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dOmazY9q6PPDUJvA4GyjkTXoH0tGgAgTaMTyK9K6j+9KlB/0KJmU7ht7PH/ohjsT0HBXoNeP4uofubfqTyzqTzsLk9rwNu2BUW/x7yepjtmvbsCoZ8eLMjYa/X8sFJox32jVzADwYD8+eUl57C2flEMzqBeKTUcH/H1Fi/p/pko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fTuI6cCG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WCVtdW7m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61271pRT523179
	for <linux-media@vger.kernel.org>; Mon, 2 Feb 2026 10:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	60Gtl61u9szV23kiNEfQyeK1IjsNzPwJCAQmzlir8q8=; b=fTuI6cCGly41adYu
	yLjItYvxpBFlyEdQ+v2cTHJlDMiQLZJbk4LL37y2TwZ5gHcK5lmtNq/Bg4VDPAf+
	Hc+rw/HeeW8lZFUXpjvkmuh8sLQJUh75FnFkwMnwcT6KtwDtakDlBUFfR0g6CXQZ
	F3/4dmcCdTd4Q8j6t0qW6EtdzxPWv4BRIRu159EJhoe6/hmCmRbhA0UZr6t3IQQh
	8V0FwMlqGuIlWfRm/xc52wfU5U5aJ9woEtd8a+Z95/ubamM7obnP4NmQsRvskiw4
	u3zTmTd0Usqn7I7ULg/9erZUBkghYcffTvBIIcCYiWU9UwneQPsIWf4h8qOba8zJ
	kWhZCg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awnw3as-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 10:23:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52de12a65so74172985a.2
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 02:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770027818; x=1770632618; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=60Gtl61u9szV23kiNEfQyeK1IjsNzPwJCAQmzlir8q8=;
        b=WCVtdW7mKD9wtdVYH/uzQqYQQeXTR1BdnkrIeRekZqblc8VI/r4nXeCqUS7Eh4jIol
         OAqUCV03ON98tMPrLgeAAVrpQsCbvD8i99ZdbrHpRfnKsmciiDZVufq6WfqWu8/Y2bOW
         rhPOFJvq2YiMWGFa1u58B+4pgbNmEWjHHL9XMtogGIBVLrNsd2iHNpJAekNVbr/6Gh1e
         Ju4io5msnfp4vYG2XGHCDtQmW6WrEHJ1bw89qTjlzjzFNMuulRoVm5aE706kXD6DojWy
         6AqdyR++dLYHH8Wrt61eLOkaimVASmdYBhLYhvDBsSH2faoZWRamB1gVBZFf9AAHrdC5
         /uGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770027818; x=1770632618;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=60Gtl61u9szV23kiNEfQyeK1IjsNzPwJCAQmzlir8q8=;
        b=mlQ7C5b+s/gokF9SosFEw5+xpKbetsTpCd3Wzw+Ftjxdvk1AhedMz666Y96k3lWNvE
         WvLVIWXai1FoX70csfLCj2A/+5NTCM7gm7HZ2k9W3kiLJSUg1GTfym1bt9nqpeaqGvbd
         EYovfvvJjXVxAqsSfMbbYXQ6KuqOBQEqRp6ITx/qKU++UTrBc/lJyyEKm/SkkfuwObdH
         7XGzcQeV6UmoP5ZuSFHcDF0/txk4n2c+6vtAsqwli0SmnStc3kFB26T35CRylnQJYFmN
         cb4HIBEaTcllVvudwCZEV5p3B4ionapH3xja6liq6bBymaMUgk7z4RUq51OCeIrSRJ+X
         h1yg==
X-Gm-Message-State: AOJu0YzcuosoavHeCXaPAL8M6R2jLwvnp8XXwZxN9w+zfBvAz0Ci8mzE
	DerwX4qwezV7brD/OAQyAtF4ZpUI/SU3YK13UAjiJjVOPN3tYgjkQ+0Pbntjxf8DgIMNnj7igVB
	hRUjEwr6HzHsTw793AGkSiUNPJ8ym6MRMwFY1O7SFN+T/Aqv2eKJj2fmm+r9xGANCLA==
X-Gm-Gg: AZuq6aJ1Aegg7k3vzgqMwInWUMWe98ZX/5Dx0+WG6oFdns8UfJu368gy4g0MWY5NQro
	V7kkbR/x9YMM7YxwRBbuHE8EExnrO778MgrUBs2WIB69eJ1o4GMNNAAie3epImoRMmHugfmUN4l
	8iIpOkyUWPmIYIFuEG80C5Ptvk/ThHte4nXjxmAakPKqclyk7s47g2b3W/LY8dXbO9Htyh2Y1tI
	mduDbvtN4dH2ZaFL4uA9g9H724HJGj3UKxEuYKJ3iGI9OdArj/7eqfI69dig3FF++ga9YN5US0f
	A76/gIGGKBY28VW0vJJM/nQ4WO67g+nYLU6Py91lvrbN90frQe8BXubTSVwff0GYqYwKmpvteb/
	ovkU6jURywtj5YV7k7m1YNm7H1/gf4WoyfymsuDPlPuh7I2kB1adGVhRlZ+jYEu2lFzg=
X-Received: by 2002:a05:620a:4086:b0:8c0:c999:df5a with SMTP id af79cd13be357-8c9eb2fa331mr1081612685a.6.1770027818471;
        Mon, 02 Feb 2026 02:23:38 -0800 (PST)
X-Received: by 2002:a05:620a:4086:b0:8c0:c999:df5a with SMTP id af79cd13be357-8c9eb2fa331mr1081609785a.6.1770027818003;
        Mon, 02 Feb 2026 02:23:38 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c02d0sm827884766b.55.2026.02.02.02.23.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:23:35 -0800 (PST)
Message-ID: <70517c7f-92c2-4b2d-ada9-9cf0fe9371a4@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:23:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] media: qcom: iris: increase H265D_MAX_SLICE to fix
 H.265 decoding on SC7280
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
References: <20260131-venus-iris-flip-switch-v4-0-e10b886771e1@oss.qualcomm.com>
 <20260131-venus-iris-flip-switch-v4-4-e10b886771e1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260131-venus-iris-flip-switch-v4-4-e10b886771e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MNltWcZl c=1 sm=1 tr=0 ts=69807b2b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=BT5F1K3s8IvAzqF_nA4A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Hz63lKoyTRmxKaSljK4JgH02aL8S767K
X-Proofpoint-ORIG-GUID: Hz63lKoyTRmxKaSljK4JgH02aL8S767K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NiBTYWx0ZWRfXwkKcesGIJGWh
 Q25hdaNTBf70oL+cobQSTNnKrou4z8F+vx7PnyD3zcMxrdW35+7Vv6a7tCpvj8hsXu/ILZzrSeN
 rGM/L7HlE4VyOInZ/MNAHQQycl9Q0VUD6QcmptFUKNfB3wxJZ4bxl2F535zfmQOKV1sx2amAC2L
 M19K8p/y+/v8G2U2E/QCI7xPcqPasLBWdznnSL1+XcVNhlNIpEzWtx4IeM6w1qWitXTYKu/CGYL
 TvC22FSHmHPk++SE7TgjDuvNS50oBFc4Pms/bjMF7q+DcrZExfe56nGShJG5pA+5W53/no7Q1VH
 v4MugAFmwIFKK8r30hLjw2gStw4uYRmAQvSKJ204BrqXoUd5DRqP8abSezgoiaYRSC5dMexZMBu
 RaIS8gFi4V8mOVrjGemBP1cEc/hSYWGGhwcgFAILsseIeKchrwFkbMpZKfst9Pk+H4TCQPS7GL0
 z06t9sANgTuQYlQ9RiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020086
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51995-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 91473CAD33
X-Rspamd-Action: no action

On 1/31/26 2:58 PM, Dmitry Baryshkov wrote:
> Follow the commit bfe1326573ff ("venus: Fix for H265 decoding failure.")
> and increase H265D_MAX_SLICE following firmware requirements on that
> platform. Otherwise decoding of the H.265 streams fails withthe
> "insufficient scratch_1 buffer size" from the firmware.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Since it's matching venus:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

As a side question, is there anything wrong if we allocate a buffer that's
bigger (or say, vastly bigger) than what the fw expects?

Like, if we allocated 10 GiB for $reasons, would the fw just happily
take it?

Konrad

