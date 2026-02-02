Return-Path: <linux-media+bounces-51987-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJZdMQJ4gGn78gIAu9opvQ
	(envelope-from <linux-media+bounces-51987-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:10:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B46ECA995
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:10:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8D06330215BA
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 10:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 130552DE711;
	Mon,  2 Feb 2026 10:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bS9RDIdj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gAbMEZlt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3432DF126
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 10:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026758; cv=none; b=h9kOXHxg4oR9vPTEhh8iwpkozJ62LZSmzT0nicatzDP0Nh77hNqSO+ZQPbAbTFz094z7hfHCDWh/RPyhJMUOJ7eWl60kFa9VbaD+cHR7PQtUffhC2asHdLlpCYr7LCmkHu8+niuxna8SuskTGXCr/t1pVHeLKpsLQ3SDO0ZDr5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026758; c=relaxed/simple;
	bh=htL1cVSiwon54WFPmT5nZ0fXBEdeRbIBIhR+cZygJRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FbQEd827qPlCjA+bufG7rMWYKJ3qsAnnycE9JqtCKqwLgxc5UxU3u1xOOwJfYd35av+Xf7BsWjDde6pa882E9pO8OKI2VSMItk4b7fuHBdh6SyMaBcMxwpZ4P+DvdcMg0sPSvhFH6Ot3I2+TfsBXu3ZUOZuLwUHOuPYeNNmZ+5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bS9RDIdj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gAbMEZlt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612857eg593872
	for <linux-media@vger.kernel.org>; Mon, 2 Feb 2026 10:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lE/lR/lqCoGkbnkAChtl6eTom0kKZQhHcUFHfJrocTA=; b=bS9RDIdj7SKOE0a6
	97fSo0GGr3Pjj5Z9G5OG6aFLssrH48qh+xCrMDAahJM8snkCTbMsqAxA2e8kNA58
	g4LuCoeRSkEXsdUnNykCgXLeTwY5cD3Df0zTQTmpGzgEl3cmNrqnTeSwN/RdHKl0
	c6suByNqSbfFSGNLbmID3UJUfOZ0IZKgbOdIdLMItgLmAWN/RpZTm09G6631/tF1
	bDQVCXb9FEgS+yAWd75p8DOwYziPPSZNhiePYcVk9mF8iEjHTkxR528We8OtSz0w
	7A1Wyti26AYp7EGR7KbK1FGLYA1HOgt61INi76JebCz05kxw8eY3SP9AkUEWM4xL
	EWiN4A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avx4wng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 10:05:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6de73fab8so119410385a.3
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 02:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770026755; x=1770631555; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lE/lR/lqCoGkbnkAChtl6eTom0kKZQhHcUFHfJrocTA=;
        b=gAbMEZltW1QSNApeHkM7IGnOWeTmaI0tJEnziMH6IWNYfSyBoumfpXcs4k3mPLVXnW
         GMS8Yrt3IFlE6Yb7Os69g/ks86POYQURorynN5QdkeatZzZ7Ob6zXAaq7XhaHmBFYzK7
         9Q0RfmeKtUWp2j6lS8IMRC0nyKpNeGcIj+B7UEtrtrng8iKnHtYomM9H8ZbTJjL7V4Rk
         QANJJpJ3YIk9uyyAPGfq/H8w+ArXtYeawpSlx9v9N2gRTNPzPk4wEeD1+X4Bb9hSJfVT
         XXpZIRBg0Il9vZbWAJfT9fLnnb3RZs/SanDzd59gyVxMj40icLhHW+UJsSqckas38Pq9
         YPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770026755; x=1770631555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lE/lR/lqCoGkbnkAChtl6eTom0kKZQhHcUFHfJrocTA=;
        b=AoJi1lslz2h1KtIqcVSvevnptPe25QWr1GsE9q5EnN/Ragd/73wGFaNuHH35D2wJHT
         IuMGW8mjthqgtb+Ht+/b2oFcDvqQG0L4IZSbgSlilg9sN5sixNeC7le/Amrs5T6UOrMe
         OXnbGlF8Me2pgcHmjmBjWgbBT3Lf4JwY47knDlqOigJ6iQ2hoC8ZDdl/XRZOORBEahYy
         oaTVGAKtDGfPEeR6tppPvHiqCrdnfxQ79DrzUyobSX0LV2a/cqNCGKEiQ6VGO7LtCeA5
         kKkN4W4mgw4hCv353wwkGuBNLpFDVt9nZNCEpii10oGc+PiXh2BpX6IgRtXwFy5St4et
         KyBw==
X-Forwarded-Encrypted: i=1; AJvYcCW9S7/DFh4Q2M43oD9ttGDdZZNNj3+zGQhMDz6kuLM04UXY23ms48EqtQ5wf97AxbbUzQP+YEsTC5OR9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjlixkSR5OVHEo/7t3H/UXy2CpuMwG4/NX2der/UTHHGOAWBXB
	Wyo6eJHYLeJA6gmuudElu4vunb7IUSuA/20Svp85G0JOlNCZY4bOmPtWGodtmatIhnLi46VIZei
	L+dcLrqjAvCS8iUJP3102n1cVKA/cyL5e5XE7jhpPB9PUsabvjg4KDxKUccaA5RtJfg==
X-Gm-Gg: AZuq6aLoF+Udn0LJ4OwQVn+tIG35xnpo0/vwHWWmHnpPumCMWIFl6fQKni81AlU3aWU
	gfqjg1KJaUfK4/UrKX2zYirVqQSkDhSeDThaqFubee9LbPaBaIz64P2pNJz8tSp74H3RKjqhUF9
	KCTNkUf+Ix1naAIanEVL7TG207KcWXDvfsdFnX41l+u2cDP1YhuMFNFdFc0petQBRm1gB+GmTaK
	n/OWtbc3CDS93z8Bj0xF3KTmy+i5EbIskbDZIA9f/61lFHTSQYitLooUuTwMh2tdAxOYC3P4JtY
	1CjC8J+b6x2X29sd0OSi12N9KanqBhstJL+Oj5SmJB75lPMxy3c9itCN7C4is3menFpxgUOjPF6
	WW14WDISubM1rXBuy3zdGvr/9XRSivNJh3PviszV9BYBOxObrsIg8t5s/cUG7gk2RNZI=
X-Received: by 2002:a05:620a:4141:b0:8a3:d644:6930 with SMTP id af79cd13be357-8c9eb2b920amr1083291785a.5.1770026755568;
        Mon, 02 Feb 2026 02:05:55 -0800 (PST)
X-Received: by 2002:a05:620a:4141:b0:8a3:d644:6930 with SMTP id af79cd13be357-8c9eb2b920amr1083287685a.5.1770026755123;
        Mon, 02 Feb 2026 02:05:55 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b469e45fsm7463972a12.24.2026.02.02.02.05.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:05:54 -0800 (PST)
Message-ID: <d8826de8-0535-40a3-9b1a-24c2d3fc5de8@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:05:49 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] media: dt-bindings: qcom,sm8250-venus: sort out
 power domains
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
 <20260201-iris-venus-fix-sm8250-v2-3-6f40d2605c89@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-3-6f40d2605c89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NrRhtyDlLne4xAuPxNR2bg3io0R8m727
X-Proofpoint-GUID: NrRhtyDlLne4xAuPxNR2bg3io0R8m727
X-Authority-Analysis: v=2.4 cv=P4w3RyAu c=1 sm=1 tr=0 ts=69807704 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ybeyijjueW2mqxUJa2YA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NSBTYWx0ZWRfXwF6FxfUcVETh
 TqnQ/L+1XKOMcIPhPXKh7DwE5tbHPLtek4OTRYXeUFZFEIi2SmgmFi1vITiFfqX2JayqsTX6Jmx
 JB87wPBCNBWTVxYjFl9rLsFGLTL6Di/nXwCYw/YlwrXKZ9nfD75a5J44enM1Ur8LDfTaqeRyTNp
 jPmjsNwzvq1PWM5kv6TshdKam24UN0Tp79WcN6itgEGAXfqqWMRdHYy+2nVCIPBS4GpNYmRtPhK
 IsYCr4lzsrMWHpfeDpNv9T7atepQ8RzuxTC+I/qpq48jMdRNC9yv53eRl+uYCArcjiTa4o6F2tp
 lMPLug4OYkOLI9PMXSig5YKCIs5Wcg+XT63McTYKPeW2RZNRyiOJHn/ukzGHOP4GeY3+sy0RIMw
 g8F4IhEr2fR3pjGfjarM9sGSM1esW3G/4rboGctli3l0zYerHJawTBoAzWBpIgMNeKuQP/vf/Wp
 EgbbdvKVj3NAQ5/U78Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51987-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5B46ECA995
X-Rspamd-Action: no action

On 2/1/26 11:49 AM, Dmitry Baryshkov wrote:
> First of all, on SM8250 Iris (ex-Venus) core needs to scale clocks which
> are powered by the MMCX domain. Add MMCX domain to the list of the power
> domain to be used on this platform.
> 
> While we are at it, drop minItems from both power-domains and
> power-domains-names, it doesn't make sense from the hardware point of
> view. There are always 2 GDSCs and two power rails wired to the video
> clock controller and Venus. Disallow passing just two.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

