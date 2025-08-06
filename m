Return-Path: <linux-media+bounces-38977-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C0968B1CC4B
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 21:07:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCA16162B4E
	for <lists+linux-media@lfdr.de>; Wed,  6 Aug 2025 19:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C631FC0F3;
	Wed,  6 Aug 2025 19:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JeWbuwM7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61901A76B1
	for <linux-media@vger.kernel.org>; Wed,  6 Aug 2025 19:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754507232; cv=none; b=PBfXHwAZjkV3LuLpANbXC2TKdfV/uNjHUluPztne2EZ+r7WvsSRe4vXQYMZxEP/RiiD9gBxXs5wbzJaYFVy9/N3VktH/AkROg1EUkKPHrATpHHjSzbHat/HSmnuVXx/URiIsHiDIzkC3tGbmRgzsWBaUOJGlyPnbpVXxv/qWDok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754507232; c=relaxed/simple;
	bh=D2fRxsjumskahvRxe7m7fBnGGGqxjZOKk26cSPbI7OY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dXOM65ATPyq50eWS8cnhYNS9sHFOdMwfarHuLfxHjUNMkklHH2IwZqWzbGXGnC9T0TrTSTfJMSlzN1/pmraHsAc9CkH790aIsq/JRzn3eU+TZ19o65y2n1RRqSsZ2FBS+6iCWaR8bc0awhmgy/pk/oxEkzjBfb5qoT2D6ay8fNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JeWbuwM7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576CPYvZ031608
	for <linux-media@vger.kernel.org>; Wed, 6 Aug 2025 19:07:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pLFDFgtgIMICdEJ792w168OyKixfYM5BYvfWCMHrn0A=; b=JeWbuwM7PL0zAmGW
	+VETreTAUCzm2n053JSNWrko8eWL6LoLI1ezrYAhMJtsVrM+wRZeh3pnIl5k8OV0
	IdE5Y4F2MyaevZLKAcQ5sd9PyxGj8JmMvTgHFxoCGMdr6uUrLo2EfuBT6qdkmKYn
	k3+ifV38vlVJr9NPx6atLCZtMVPbTRo4uzBIFc5v56+rn5NAkjd8IoUV+x4CjQJy
	3baZtNqsShLgsD5rEk8GJMOSGW/wvI4FMys+cNtla66buSDnWRjtmeOMbIKleOfw
	k7X1v0BMLkW/ynYrT1WYBtUCTdbD+D157ShPCNbrdk71zyvtHVbk19hHLzU9mLHs
	4P91jg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpybbuhs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 06 Aug 2025 19:07:09 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b427c287cdfso207811a12.1
        for <linux-media@vger.kernel.org>; Wed, 06 Aug 2025 12:07:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754507228; x=1755112028;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pLFDFgtgIMICdEJ792w168OyKixfYM5BYvfWCMHrn0A=;
        b=odZBFXsyxWpVazqV3Qoph1Cn/OHXSVMnypxPIJr3NsGj3wjiUJOBK4CmHdwA1l3Ri/
         ZAD95UklL1P1RFJqPptzl6E5Z9cFcNBDxo16i3+RglgxRvKkgRXVB8R18OSS/gq+379r
         NcX0aCAtQNdrPe+YEFUkkSAgsG2J4WOJ7wiAY4NT1Tp4v7lkUfqi09TQ62TER588ronl
         FQ5qVxn9QrN3YVMuzlivfWv6EpVs+KrKhBbgOpn9FkRf8EhbqDXqgt4OswrqIApVMTJF
         S1Bz+j0rx+eut4FRj8OiuJLtndfsk0FGwBHxuDxlSQy+Kj2lZlZv4cYCPRPDB/GKgb+X
         fMyg==
X-Forwarded-Encrypted: i=1; AJvYcCVYOw8VN7jtmzk8MimW/PPqT0Hrl+O4U1+YQK65wAtRepMvjOmN5ceNoE1epJcfLH9n2KIyzQU/T9NxPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXr7rhQwegH/lMV3TMA+GqTj5NsAVuu4OgLrtpEUtVmp8Lt2Nw
	IAMepORLLMCZZaJgw8TK2tja81qSR2EvmF9ciB/rDK5Iplre5lWdlvV3A+wFpn5Ka4Nc2a+xRQp
	9YMjbhR+vqsPgpUmo6hyJOlmmMM7y2olLbFGZPATEGKsZ+YJd/4IoRLnko1FINgGELw==
X-Gm-Gg: ASbGncvJQjb5IoxF5RqM80LA8Hrie4xDFKF/t93ircaHLy1jIsyer0/UvC/Br/wgXvU
	JimbH0/OzZ/IjinZ6t3hIKfPKcdNXVu+ek88EiLDDoQkC1WPLNUBWHDWUz90fiNzD3WasFFbmPZ
	Z65s4BScdLcmoUXcwLRz0vm9IgnQegtUAcmWyOVbdbk6DuYf3ft3KuFuC8w9+kMYbfR5sL16X1F
	SYguQ80x4u4yzI41xBxABhWdNHRxg54OQ75ecqo0J2oJ8E6YlK56WAI3o8bV6Na0RuxDd/Nujui
	tYRl2EIy0UZgGOPXqSbMV46Agw09e01QmEmBdK+8BKfiWQt7/Q5cUEZ/bvGO1u9HPZ0geb9RGqu
	W9KQJnH+MmGG4n4yB/wAMjo2/P++HJ9eK
X-Received: by 2002:a17:902:f612:b0:240:469d:beb0 with SMTP id d9443c01a7336-242a0b6fc4cmr58557425ad.31.1754507228311;
        Wed, 06 Aug 2025 12:07:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHw/V0KLHuGmmP97g4XfNxYYUiYQuA+Las853A79Nu5Cd7FLuHDuerRqAPRejldbNHXAC6rXA==
X-Received: by 2002:a17:902:f612:b0:240:469d:beb0 with SMTP id d9443c01a7336-242a0b6fc4cmr58556965ad.31.1754507227919;
        Wed, 06 Aug 2025 12:07:07 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef75bdsm164814515ad.11.2025.08.06.12.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 12:07:07 -0700 (PDT)
Message-ID: <c9d761a2-7121-4ce6-84c7-232a6c4ce976@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 12:07:05 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] soc: qcom: mdt_loader: Remove pas id parameter
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
References: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
 <20250806172531.1865088-3-mukesh.ojha@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250806172531.1865088-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX4EDtwXcGT1Wl
 +6TUjKn6cgU166U0pQ2z4Pcy6OzVd049oBWMH9ouvP7NFaNI4jlboaTYMlpyiDpW3Mw2x56+aNi
 Bcxkibl7MS/qe1m0nYPD9FhK/aogT8y4F/pYel75q4pacUFXZeh+sMoyOWNlbnDpQuuWAcAvzQ/
 wBs7sN+Bi+MKUaHXLunem7SJjrNW+VD84hh3sDHxCNpKkdMuqL2BvcQplRgf13LMZO502NgAesO
 aqtQ36Z9CBKHUQABp5fS3MBhw541hVN2ASc6H60tLaZSXHSwF6RYDO4Lg2q5vhUYPE6GqV/rYYt
 PdkjVoENndz+6uhpMps2Y/GeNXm9MvKTx1tdTwz4HbdVW/sFl12S7hozC/iUyvNPudGjzIH24KO
 /cU67hlf
X-Proofpoint-GUID: BYz26o7Z0MLAUvCL1xCNAJ2nEpPRIxRc
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=6893a7dd cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=IDvrs2r2PCma8_SM7s4A:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: BYz26o7Z0MLAUvCL1xCNAJ2nEpPRIxRc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On 8/6/2025 10:25 AM, Mukesh Ojha wrote:
> pas id is not used in qcom_mdt_load_no_init() and it should not
> be used as it is non-PAS specific function and has no relation
> to PAS specific mechanism.
...> @@ -353,7 +353,7 @@ static int __qcom_mdt_load(struct device *dev, const
struct firmware *fw,
>  	if (!mdt_header_valid(fw))
>  		return -EINVAL;
>  
> -	is_split = qcom_mdt_bins_are_split(fw, fw_name);
> +	is_split = qcom_mdt_bins_are_split(fw);

this should be in the 4/4 patch


