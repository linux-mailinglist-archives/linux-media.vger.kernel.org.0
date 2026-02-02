Return-Path: <linux-media+bounces-51986-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFs7Je15gGne8gIAu9opvQ
	(envelope-from <linux-media+bounces-51986-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:18:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C798ECAC1C
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:18:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 93FB6307488C
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 10:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9F23587A4;
	Mon,  2 Feb 2026 10:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SUloUebv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aDYlI1SY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4827B357A5D
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 10:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026698; cv=none; b=U9zviDq1IxiCPKKyA+5Y1bv8w+8205WHPWBXXz/HVtlajNUQulOmjPTn3tvU7TvuG5uU0gAPiq4UDAbPq4b//5GIWChn/PIJbgbuwbNOyiyowjOE40MziN081oAFYTvVObWw75BkUOramUtLx5Us9K+OX5anOB87+P2a6QnOz2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026698; c=relaxed/simple;
	bh=m+Pz+g1MKmpagp4K1y973dUYQLdMnLtzIyPiHxKzHnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XnOYmvTAx1jwvJK0Gl+BKcvaqO8rnI5ugU+2o8q+8/vfls8Yr+wunEiLLDupEU8hfyJD/8R3GXiXWUylUbI0kgJsbpCoRb9lvp8KyLmFEaAlo3hZ/tV9k42t4HSeEpT1eSKZ9IL5hbAtpsHHHjj6VbsU4jpmezBuObCi7/4vRaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SUloUebv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aDYlI1SY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61285k0e1377584
	for <linux-media@vger.kernel.org>; Mon, 2 Feb 2026 10:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PU4kYGujVwJTzzKhrRzpqzSA4ZPHoHG0oriVI8+8rHo=; b=SUloUebv3I3Nsc6s
	rHuIEYafxQ8lN8YW90y1h3SSvFu0Hjm1mB2v1KP0FZYo6lkyeVFtjkSHwWebo+QW
	HFo7L4nDR2TJgpG3QqIt6SqnhzAZaKsfjYvCuUP6E0q/sVob3W8E1poHt5BAXGfI
	YvI5ViNJbjENJ/bWNhSXpqB0/UDepajHdQCI79br7TMDhd5V3/8K2oaUNeYgdlVy
	0NwESNEBCTjUnEJZtLXJJRsEHkcfNcsRTm7MSnori6KrusBjTlLZp7msy7w4BSPQ
	x9xGZGIjXachV7vMFJ71rjW3fN9vYWpZz2IH6LSQ2BSmuqw5g0H61EFdP5UcR0nt
	1JuuPw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1as0w0jq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 10:04:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c710279d57so110073885a.3
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 02:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770026695; x=1770631495; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PU4kYGujVwJTzzKhrRzpqzSA4ZPHoHG0oriVI8+8rHo=;
        b=aDYlI1SYVn9TUhR4AJWgvfgkH957dtXw8xi+GRH2f+wKoH6bAvkq/yRYdLnAn+rll1
         WQarPZOnKh+142uXvxmbIpsSBW5GcGs4/i9AAheUf5bL7kXBgrrOosG5jC5EHbYmSWcc
         I+mLuNbutrP9B43R5sExs2yV2jB8RRKShN4cpFs5bn6tE+7vJQkNaiX4Ord8anBFw7ac
         JOAcZ7iLGej2uSEAiC0sFpTIo3f2+HLMm5J1SkzsPaFuzNldX55y0k1pDQrQ4lIXrjkf
         TSHLT0XZ5HPNlXDu26aPiOb/GYPAzD5z8n1Q6sJX8jENI3cAfKDdkYDw7jqUD3zIMWO7
         v4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770026695; x=1770631495;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PU4kYGujVwJTzzKhrRzpqzSA4ZPHoHG0oriVI8+8rHo=;
        b=UjCiQRxsWpkulLcjLc+vpBv8AyULBf3iKCb3XD7RoN0RnO7gcBJnphpU6nQXmQlOzt
         wo3rAOH7ECbhPOV7YDHqf6U/qU2jYMVthDD4c30zVdgk6NcN79/dEPe6ypVWilL2JXZc
         lYH/7nquVlUnh4RKBpQBzohIYLS88hvHUP/DbuDIlpf/ytGcYTWQZJrG10ksnbdUUw/+
         0zVxE7vqZ5KbTHzjvYnLUPk4lmhgQc6sIpd1pZ3yNWNHadJ1HGa0vpSHNPa+uV+X/nsZ
         e63Q9omCbhEcDu+jwqHE2kCCeVrKeHc/utG8PD7DRoszm8TvvAjNoWO1D1ETMSxM2Xaz
         vbaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ5p7mSnOyDdXK51TUqiP/ZYPZkzgMq2Krb3cNP5D+ZBf0I14OTGORgRSmUEEXjQdJwjdUtAV0ir6ALA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbFz5nnwneWbg6+BziLV+iMf2oL++6nCZpf6YBz+fGm1QzMqGL
	WjOKntqHK15JkpMSwtkAWIURzORUYX0anK9z73MiAMQoPLnSjgT+0Bln1hD4CBxCGDI4UOBwe+r
	cc+OjzVAHNENVIlSTVJQ69+SyE1jUgrgqVYPPsXDoV1VQ1kwk6w2dR7cMdCc1bmwJig==
X-Gm-Gg: AZuq6aLZdUrQUMLLfGgk6Ey9zPYSOTQSIb5Zk5ICB+QNtH5YkcZEkWUDhuzj5pkcxsf
	X5y3Gvd2YOczMpKj+5DEMIShHrNovfj/SHnOdg6c/oFt3XXVRu251VgUlrE0Di33lsw1kjoM8AQ
	OOZD7bwPlESMIwLHJtH3RFdbQOdVKEVWOTFVg/8D5SX+18clMF50iECq4EsRJIZjxdfiA1MrmlJ
	vcvBVZiZH5WnVLazhUsw+wBKIRHViOMlDoeHq0/h7ldMUmkDxDTWYJ8tKLGmCI20U4rajS/NUUO
	f6Clx3xd0ewTaWfD5NzSaJBBm2YyWWyF4/anJ/5Vd83zc9p4wj2/9Zfin3CCPFTDPgXsZBoAlr9
	3nkOyGX4rpe0VbkfyJHhBCh8XUQri0QjtdJyJwsZSWKTgFS8n86cRojqEMtt4HGfgQqs=
X-Received: by 2002:a05:620a:4506:b0:8b9:fa81:5282 with SMTP id af79cd13be357-8c9eb27a8camr1050099485a.3.1770026695463;
        Mon, 02 Feb 2026 02:04:55 -0800 (PST)
X-Received: by 2002:a05:620a:4506:b0:8b9:fa81:5282 with SMTP id af79cd13be357-8c9eb27a8camr1050098485a.3.1770026695052;
        Mon, 02 Feb 2026 02:04:55 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2f3e26sm854116366b.67.2026.02.02.02.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:04:54 -0800 (PST)
Message-ID: <354670c7-2845-4786-aed9-40b08020c19e@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:04:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: sm8250: correct frequencies in
 the Iris OPP table
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <20260201-iris-venus-fix-sm8250-v2-8-6f40d2605c89@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-8-6f40d2605c89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NSBTYWx0ZWRfX2ZWZhhF68qUq
 GIosSS0bqgpt2b5+6oilPOc32nMgqBm7IEBD+0HPz7BYI5IwVUb5JB3b/uIZ6E7VxM/vNqM1csX
 xCH2391nZuEKM6CqjBPZkZ+EVqjTRsyhW5gnABusNec6dX5h0kJfKKhySkbVzHHARVqt8eS31Vv
 o2riO4l7CDWNUf+RSFkJ3U1izA+NbuEyCmrcxoHKYvHfywpSPD7qPU4lF7lpu6SJRqCZS6rnG0Z
 1PSHFo+71uyKkgefDY/AAwNT5aoRRYSTRtpv2VsskpKlXiv/RC5qVu3WLoadBS6XT6FeworyKf3
 hNIIlR7wiDopcnzuQUPlerowZCHEWcK+LZ4r9seMDTNlz3gwjDh815Lynw87/R6PYU7rd5rxziC
 vgt66Rc2sIZsYuY+6PEFHsASmktmunexCs0qL2jAL62IAZmhboZ9kNEcIT5NqvhOAbDarhBapgs
 ECF7qCv+OEQBU5O8J9w==
X-Proofpoint-ORIG-GUID: ut1iNEv7dtRHo0Duw--pHStDocvxaJ_9
X-Proofpoint-GUID: ut1iNEv7dtRHo0Duw--pHStDocvxaJ_9
X-Authority-Analysis: v=2.4 cv=MYthep/f c=1 sm=1 tr=0 ts=698076c8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rhtRbuhOeWVFly8G_7UA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51986-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C798ECAC1C
X-Rspamd-Action: no action

On 2/1/26 11:49 AM, Dmitry Baryshkov wrote:
> The OPP table for the Iris core is wrong, it copies the VDD table from
> the downstream kernel, but that table is written for the
> video_cc_mvs0_clk_src, while the upstream uses video_cc_mvs0_clk for OPP
> rate setting (which is clk_src divided by 3). Specify correct
> frequencies in the OPP table.
> 
> Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

I guess 'reported' is more fitting for this series

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

