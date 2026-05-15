Return-Path: <linux-media+bounces-61710-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLoSMY8VB2rgrQIAu9opvQ
	(envelope-from <linux-media+bounces-61710-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:46:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 272F654FDAD
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD54F31DDEBE
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 12:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4150337C11B;
	Fri, 15 May 2026 12:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B3e5JxII";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TlIr2TdK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5674547B401
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 12:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778847144; cv=none; b=qkv0xzds0fZsGgS3G5kjQZ8oerUZm9R4dod62Sl0aZv+HngDzOAISqdgsm3kGGPUOHsSJEY32W0NudTeRvDuSDGl0HCKBkeDPRXNgLpeQR6YFA1w3zEsll0uFrss7zhVz4T005Rw+RK1os51gmJeBZx1X3QBGXUnmm/89450lRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778847144; c=relaxed/simple;
	bh=Ka3qm8iBE8n8zjZnG+YFbup1oVW5hThp/IzT8vNc3vc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fVkUs/Fhga9EjYD4QHkjWDa98xgo2OticdEgAsG+P4++P7oKUmR+FaAr/r4SbaDcNkNbXmDaBCrC8sH3ybupWpGR3abQmQtxkxODWVYcyzxzHN292eNmn9ykubtRGLX6jJwHRLxgWqQwfLTz06rtmBTX43rMwaZDPbRsg7rLiKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B3e5JxII; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TlIr2TdK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBp6IG3670428
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 12:12:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sUlqYvl38wfA6UHhPWcG67kFeqamI6p0XEhh5Bosy2U=; b=B3e5JxII3qlc+mbV
	iDmDtSmXezgny0Jg3dyc74B6ICWqVk0iyyOTha7tl+tWOj2dvZLFlVPXcrxl/E5y
	N+UlCwhmOqJOJMtu9238g8MTuPA7KjW+Kr154C6rTJdFQK2g5zxonNXH14d+eGVy
	LBimhj9sZkfm9NXndRTQTDgO+/MNMRldPXfkhNmQiBlL29lDK+DFEYzIalspp/41
	0P0H2T/A3i/6vnyt+pYDApQV0xXbJyKaBnZBH5QGeF+IHOXGynuZe8RhXFhKethg
	l+PX7jn2nZpeUEech5ow8rx8b4uelrbUeGebGe2ONr+l71wtrpraSAAMQjygcnN0
	AnMyRQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s37xs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 12:12:22 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5751eff95d6so511927e0c.3
        for <linux-media@vger.kernel.org>; Fri, 15 May 2026 05:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778847142; x=1779451942; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sUlqYvl38wfA6UHhPWcG67kFeqamI6p0XEhh5Bosy2U=;
        b=TlIr2TdK8NQC1EY8c7FqXwV3mN6RwitNB3lL5UEb4aPH7JBILHdDCgU92zbkfpCoX2
         4Wt7LQql3ZVqTcH0yQXEiSLPY40U33qDaBYnN52tdrWp35vGlFHaUznDy4+wR1Bu9geQ
         rVtgIZbtoWFgSH4w310gyIWLCESoDww0d/adp8a4QW0TJy1KQEV8+Wyg5YldBrA/ge4l
         Mua7lHSyhH321XCz4R8lA5bR6D2QPWwUrXNTt3G0d4bLvBTzUqgVW+VOXcUmR6ARMlhT
         uZ/2EDDHBEyB/byLU2ZDyMXkp8n8Trw/87e6wtUqhh8QchMjDBt8SainDePnm9N5b9Ep
         pzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778847142; x=1779451942;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUlqYvl38wfA6UHhPWcG67kFeqamI6p0XEhh5Bosy2U=;
        b=NdOfymNA/0RECibIUsM4zqygkKV7zCi8cHdxKhpmZ8eqj2tGiBuLxXgzAtLab5XkX4
         PYUmeWhVh7JWDEdXuq6LxdZHzCxhIuTioVyLGYD8WhBT4n69HWnRZ5K2RXE3r0gYnX0f
         nMsm9B4/OR7iamhiXdKWpmL//GxlRveMXs5qQmsydHuhNmw5yaTnkur6vpsD5C/riXV0
         swTzbzNHAAUNVvh0QLARUtJRAua8P+eflgTyheqGwlllsNH3L+jGPsHDz24uOPB1hFBT
         0Hrnjr2dNGMsLiQHIqCtK5rOBWZpVAvJ/farrSaDvm8gPunVQkDpyDOCV7ia0ijfqi64
         5csg==
X-Forwarded-Encrypted: i=1; AFNElJ9oVm02QYRuFp/+QU63yGsbEWtxnwbCA9rmbHxdpWfj2zlf7J/e4eIMvOzNFG8OmmeGVKPgy6dblbmL2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw28rdbbieJ0TVS2qv94d1Cf+/av/4pP2XiYBDvMcGMDlk/3xk2
	mFzpYm3hGAfv5eCxIaRU0Y30jx8O4FDUuVEet0GhDp1HzVrnY93rWs0LP0Z1k43YC0BXiEh2mOl
	LhXP+6JFZPt4xbFZgWFlkx4IE0WbA5fEEgyDxudp215Y5k4jwc2q831qN68f5QrQtOWqA8oNueg
	==
X-Gm-Gg: Acq92OHHGtd8kXQHuj+0612fpRVKi4ByG0ulQWose19nBNjXlTdejbQjpAjrPC1rdnH
	32i0BJSEUgnb1pr5DlKmm7vY7ZZ02saIXr1n6aJwh2AywJPsvm5W/Hk2TkewgG0UYK4Az+swCFo
	0sziu7LHO3ssYGG/PT0TyRUSXakbZZ3wEc/B7AG5wEATwYavzt/EH3tbb5/Lj4NlSQ6J3aBYQ/t
	wobnx+JmW578/nSrqxEKfqXKB7ea7bLe34WY46A8EscltgMDOjsqKhjBQT9OZnSdrn56Eegl+lI
	DeMDroAFhIJ7n9vEfeyvKjcM7pBozMfRNebwoJzLCmYzkOdpNQooj/rBRjnX1ACxyALf9xVkwFJ
	pTF+TIkeLCkEkrgqTJ6jqi497oJHyutb2gwA36UNdtHGGNU605Tg+QwhLhUXdmwkBayQaVdqrOo
	L2oCo=
X-Received: by 2002:a05:6122:6117:b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-5760bc49d2emr582277e0c.0.1778847141534;
        Fri, 15 May 2026 05:12:21 -0700 (PDT)
X-Received: by 2002:a05:6122:6117:b0:575:dcec:efc1 with SMTP id 71dfb90a1353d-5760bc49d2emr582252e0c.0.1778847141135;
        Fri, 15 May 2026 05:12:21 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c631e2sm214670766b.28.2026.05.15.05.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 05:12:20 -0700 (PDT)
Message-ID: <34f80a3a-1b8c-4c2e-8773-c0169518df60@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:12:17 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] clk: qcom: gcc-sm6115: Set HW_CTRL_TRIGGER for
 video GDSC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
 <20260515-iris-sm6115-v2-1-2ab75229de61@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-iris-sm6115-v2-1-2ab75229de61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyMyBTYWx0ZWRfX5AOGRzqo8qWw
 tQfC4Afxz/iJqrvz0YkqZE8S2OyT6KiFCE/mosKGX2yERzqlyh9R4QUd4+ZdRK4ywebFIq7go7B
 tep9OCJbd8H0rsfN4HZzgYKtkmS8lKnVFa5VRq7mVqHBZfjU/E+dtfide8HihaDej3+4f06u+Oe
 dg1wxn/oeqrK442aaI4hDxtj5glHfwRi8SP2m2mKijRDsMeJeJKN2/Go4r+FYqsZsYOyR7LxF/j
 uGe8SLgrsLkQs2Y2OYCTi6gRezrSX5SPKqMJ7brqY5iFLNr7yqo3YJG0K0Ss3h3fI6NkAHQ2IAm
 g6n+F6xCMN8pTHrmc5hsWflXjhJQBjBGdJ7+SH1J2xEqp1absXmyE8gFZzurbo7kyqJPceXf9dv
 f/PxomPmD4g1B16hAYO6scbcBn3+RxB/CKuAyonwmvvc0Nt0m03ADQB5mqVG/loNe+eXvFbGWVY
 UAoZjQx7XbOsKM0Co/g==
X-Authority-Analysis: v=2.4 cv=Md5cfZ/f c=1 sm=1 tr=0 ts=6a070da6 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=V4j3QN97b3vMt8JjJHsA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: Kkpa4ZjjE0dtwKs5xcouJLZsR2vJwmwh
X-Proofpoint-ORIG-GUID: Kkpa4ZjjE0dtwKs5xcouJLZsR2vJwmwh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150123
X-Rspamd-Queue-Id: 272F654FDAD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61710-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/15/26 1:59 PM, Dmitry Baryshkov wrote:
> The venus video driver will uses dev_pm_genpd_set_hwmode() API to switch
> the video GDSC to HW and SW control modes at runtime. This requires domain
> to have the HW_CTRL_TRIGGER flag.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

