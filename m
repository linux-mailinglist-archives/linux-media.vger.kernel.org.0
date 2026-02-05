Return-Path: <linux-media+bounces-52250-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPT7Mp+ShGk43gMAu9opvQ
	(envelope-from <linux-media+bounces-52250-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 13:52:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26442F2D4D
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 13:52:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9225D305B0AC
	for <lists+linux-media@lfdr.de>; Thu,  5 Feb 2026 12:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9F53D5238;
	Thu,  5 Feb 2026 12:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XFqtnzeC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fDsOXOdg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAACF3D3D07
	for <linux-media@vger.kernel.org>; Thu,  5 Feb 2026 12:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770295785; cv=none; b=n9+Iq7vnxqCAe5CB8DyO/Xxws+ra8rhIS91Zd+LBJT8s3NFzLktAE12DV3asWcu+xovg27HY5i0cFjWgSJ+L9Yoz1yA/iOOCBVepHbEN5PALM5O9XEEdSfzU5nCTqpmMppC5O7ZgpqcvcAe9dDp8Rksa30lnc5KnTAc2Vj3kHfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770295785; c=relaxed/simple;
	bh=3BMWBWBLYFJuTIk9jxxHWUhtKnlzfCa7NOIKVhev42U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yn+Sfv8k15+t5W5/6iekxWiRz3ZwOfLpbJps8KqGWcbgvC4kD46A3qVU0QeH1q9V7MqLD/r4orrt6e/2ON1YwIItOVDHd3vmWCuGWrPoiW2utVWZBkLk8qJX7lV7NUbsNg3OjeiMAxKopf+u9g9ndNY9YSg32GFdrO53+JPhweQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XFqtnzeC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fDsOXOdg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615B22lB2713125
	for <linux-media@vger.kernel.org>; Thu, 5 Feb 2026 12:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=l1k4aGSlFzlT21lOBJiY1974
	fFVxElBmKlaBUd8j7G4=; b=XFqtnzeCQOBzkAn447CntU/nkcsKTuXII6vv2K01
	OrApMdyJgxjzbmcGLNRnUApFJoOivl3VcjQp6X3qfkJ5g5DJk1lt34eXscCWSiVz
	/b476sFUbAc+1s18KWOdEhxNSYv7eox6ilL/9DOQ2/7KYOL03Ps4g1TVywJjNgW/
	eCxlKGYO/1OfijeHjaGfeULqA49qLtIHH7OfS4ee9du1ZKo7y4+PN+uIamTT2goT
	U5GtlK5inkrglPKjGNsI1F97vNxqqgy1z9Ww0rsJAJymigcmG65hmUO9m1Pd9s9J
	30zPKLFts6xIk6TgyEtW28ORb4Hmrhe4L93jz4ZxZvCS9Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c47ja3u60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Feb 2026 12:49:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8ca3e7722f1so359502885a.1
        for <linux-media@vger.kernel.org>; Thu, 05 Feb 2026 04:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770295784; x=1770900584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l1k4aGSlFzlT21lOBJiY1974fFVxElBmKlaBUd8j7G4=;
        b=fDsOXOdg4ZLcCFbOfeSsEN3MPhFf3gU0nhMk8uCsmZ064kXsLxnaDYe6D/KzElIvGo
         INuqv0Hje4Vce+xeu+eQ2G37M4UbqodBKp/uaKbhskguSSTK0VY81SiEMX1rLtfTCxgT
         UNQnN39+6/eAiGLT0u8QLqgPSZU7DjeR94W+bRWmYkGf0yPpybqCtlAdhbBEv/w/BecH
         siIn+HmpiKI50m0JhVzjZsMlUPFzASLQoHjeWPcGVst2T8t1MX+2Ok0aeUhuGWQ5NX+Z
         3VD0JmBQgz1hsRNCwz+fPknr3VqhGbkeyEh6xMlbed9NTytW+H6qKlplsiKaArzxO9NF
         X1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770295784; x=1770900584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1k4aGSlFzlT21lOBJiY1974fFVxElBmKlaBUd8j7G4=;
        b=P+ixpb8tKAZJsPWSBobWjCaofUcM+ZlQSIz1G+Cpouxu4WSMH7r1IsNxxFqcJTSYOD
         XplcZ8/gV4dcJkHZK2VzdlLBGk5Y4m8IuC1jSdxMSDGYEWE1cYaakawDS8xaJaOfbL9A
         iUX3P7NcfsTFtKyR5++xNW/KWY3kKI0pfKcxHWFd5dMsBtd7ioFhRBv3hfn6njcUZEPS
         /D269EPvmBrHgxWOXPvK9WgROiCmcgwnk+XbFd51UHXbMN060019UgdMFJc/tine3oWt
         LtIT8sfnFdt8I7BfnmveTXHtEr/aUSixT1SGYZo1C4ZiOcDq0upsk0H130fWwNQgZ6Jt
         hn7g==
X-Forwarded-Encrypted: i=1; AJvYcCVD/23Nam1rsGktZjLaKWeNgM1k2vPLMkVXCTnWMNkQgTZcFzluAm5rj9Kgi7PQVeNGemteIl5YkSorVg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxczqge5vpSdlYTMgZLP7eULe/N5vOnD+CikFegqRFF38CmT4Ao
	Il58Mi3r19MpA4fAeC/xbZXtQTCv6164lMyBjCfN4fS0W9Nh5nasVUd3yT8T/IZC2+3CleBAo/q
	cG9AMN1bpbZ35eq8uX1JXIEGLkMIn0hR569RRLJ5z9f13lM4yIJS0gh5c8VMXmZESYA==
X-Gm-Gg: AZuq6aKuLWezAdizfDe+zyoLWILUQdlgeGCLFmXmugiUSFWj6Cag6qJEZn3q4xVXELB
	H9jfh71Gx95jJulnsWsC1CalnjnDsIcy572s6pgNz7Q5q8SntCOhzG35+na4PSqZYIbrx4O6InH
	xdQlTjjJUA7Ug/Mk2++Pz0IDdt/FFHSrWDKQtwNvjToUfDUE+kP72O9B8z/+56j6kb42f+u2mot
	Nyn1l3DcVF0FAkuYZI3C1du9mVodHIobWOiN19jK65gJ1ABl3fW3vCYXI1RRVWPs6celcXR3nkN
	Mw759cKUc84qt0n3T3DfydqcrRFug8q4gRNJm6bMp6xLYBlN3wZiz31UsiGcUJM0D0BR1hZ4sXS
	zkN3GaP8r+DcdFd4hWP2f+tjfMECQlb8LnjYq33D2CUmNwCUTUQ3Cp2H+VyXZ+7tUYmamIL+5mI
	NIUO5+3Pj+RaQFfcugU127/tM=
X-Received: by 2002:a05:620a:d8c:b0:8b2:e0db:e639 with SMTP id af79cd13be357-8ca40c40774mr363156885a.32.1770295784046;
        Thu, 05 Feb 2026 04:49:44 -0800 (PST)
X-Received: by 2002:a05:620a:d8c:b0:8b2:e0db:e639 with SMTP id af79cd13be357-8ca40c40774mr363152585a.32.1770295783495;
        Thu, 05 Feb 2026 04:49:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e3882dc32sm1362201e87.89.2026.02.05.04.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 04:49:41 -0800 (PST)
Date: Thu, 5 Feb 2026 14:49:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
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
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/7] media: dt-bindings: qcom,sm8250-venus: sort out
 power domains
Message-ID: <dqjlapoby4jdei7sewhoc56hwcctyp4lerhkvspreh7k6dlsl5@y4crjbcnxbgq>
References: <20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com>
 <20260204-iris-venus-fix-sm8250-v3-2-70fa68e57f96@oss.qualcomm.com>
 <20260205-vermilion-chupacabra-of-teaching-f964eb@quoll>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205-vermilion-chupacabra-of-teaching-f964eb@quoll>
X-Proofpoint-ORIG-GUID: JY8lx711a56BAg1qmw3VinSsthatLHlM
X-Proofpoint-GUID: JY8lx711a56BAg1qmw3VinSsthatLHlM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA5NSBTYWx0ZWRfX+g4wxHCdHOg4
 uOPjQjOfY4E56TzelKCJVvZoJj5wq6DUpO0PsmIgbKmeooU8FyyMBSL8CLgLzPs/TIE13rKDZtl
 i17OERsHX39pZCK5H8yBr8Uc2t4VrYYc44xjd+LtZ5sYBMfjEQHziw+wQDjr1WFXxH4Sy508Tsl
 Oj8vqnSZPttD/cb1ua3lUobOEiHjaSURJOL2dYJgMIoay1JXS7r4aRFBfIqAj+dXZd88XWAZ9Gd
 smV6ndDOxbwOlJHkN+siYvEwVuUSj0D98nAGqhvt4wB3/8NQnMpRhS3A0JnyjVTSBILnxEvC7kg
 a4H9cFCDvC97uf5L9V5CFfCHq1kYLPHBcvWTRmpLzGl3iwi3IdxDkVfwdWi0Sux8sGhCJ9+Qug+
 83xokK/MruTFifhepNq2jovIpWEtVSmPr4+KMol9cml+Wt1kz7wB+fMokV4Jsv4adgqEQc3ESLa
 nAnaunWn1WxjleCyxxA==
X-Authority-Analysis: v=2.4 cv=a8E9NESF c=1 sm=1 tr=0 ts=698491e8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6wHPD0OzadKXDajM_xMA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_02,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52250-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 26442F2D4D
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 12:32:56PM +0100, Krzysztof Kozlowski wrote:
> On Wed, Feb 04, 2026 at 02:59:50AM +0200, Dmitry Baryshkov wrote:
> > First of all, on SM8250 Iris (ex-Venus) core needs to scale clocks which
> > are powered by the MMCX domain. Add MMCX domain to the list of the power
> > domain to be used on this platform.
> > 
> > While we are at it, drop minItems from both power-domains and
> > power-domains-names, it doesn't make sense from the hardware point of
> > view. There are always 2 GDSCs and two power rails wired to the video
> > clock controller and Venus. Disallow passing just two.
> 
> the min-items were also serving to preserve ABI which you now broke.
> Same comments as previous patch apply.

Old ABI wasn't supported by either of the drivers, so there is little
point in preserving it. It has been broken ages ago.

-- 
With best wishes
Dmitry

