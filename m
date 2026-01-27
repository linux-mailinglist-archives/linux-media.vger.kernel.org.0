Return-Path: <linux-media+bounces-51639-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id k1GtH/akeGnVrgEAu9opvQ
	(envelope-from <linux-media+bounces-51639-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 12:43:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1E693C8D
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 12:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B5EAD3004D35
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 11:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE5934A3D6;
	Tue, 27 Jan 2026 11:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GtbTemLz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jbD6w1wn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6366F346E71
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 11:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769514222; cv=none; b=MdCpxdQUxhzA67zPdvnQhs7vFZQL8qiwfaUZEaQtjG17DCsCioHRz4C/Idsv0ppo5u44QJwoP950IOV5bRlE8e7ur/7IH9h7wsxA6wBBLAUWrlfr0FqwpgTptwRk+hfkV/AoaxLk3qj/LRuva756CtGg/EPp0bzLcrwGcBTFQPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769514222; c=relaxed/simple;
	bh=Dx+JXjWmn8tss6+tA97yVAXutH4vdk4F7/NoQwAyWYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hHWx/JckpU2NNUeOXxEXz7fLfotOowy6lhg+Efxpyf0DS4SEuRnARMH/ZT00kImoPEJxYPRw3jzLr5EHQM3tXEpWCFZTCJcZEISqli12qsgZo/bj8t0tQ5PHfcbExgBKel5M58WB9QnnatJseW1qPb2WLQnKUW8kRL/l2iArMVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GtbTemLz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jbD6w1wn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RA0fm2184791
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 11:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QJjtcXc5Ltv6rKoUwcNDWqydHMEMgmd0ypnLUx1rCNA=; b=GtbTemLzbpkjSDLv
	18jr9UOrS3kuZma8/F58VwTI9I3YdLVUw8Axk6I0+nMK4vNSO7HENd3dubnsOteS
	kwF6xSCkVNxsiWSqRMg24iVpVirZnbDOBE6TgovJ5SEjbZLyL77/fXPTbcE6623i
	Gbx421swiJGC5NVvOzIFZwcDY6rzBN8plSA5PFFV0eJm7VIvKpplmSaG4vLlMu+i
	tMHhzuIC2tXsHMRlJBLmnvekfwLSuHv3AgvQ+WaDUaQpEl4cSFG6ujWpNvxdSjrf
	DztaT/5W86h7SWk3lqlYNqwOQkciO/UWGFG4YmNNA62t/B3lgtGpeB6fex4pAh5i
	n+JLPQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv9jw6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 11:43:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-501468a59d6so6693431cf.0
        for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 03:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769514220; x=1770119020; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QJjtcXc5Ltv6rKoUwcNDWqydHMEMgmd0ypnLUx1rCNA=;
        b=jbD6w1wnLi5BSi6xOdGcG9IMOU+Zdf88o1MBstDh5QDrtH6nEptOcpTpS9MQJoTnmK
         bPsD9RaMB+sDaS0W0VbVBmUk0iU0U90ULZw8Q7nR3tG1coHv2KKYBfVX7wmhSnTt6778
         O+F4UJ+U/UNYpGQibDIYIG4hI/gxzxqmsp9x9B3PPNhx1v5UBbwzFjEHepriTzmdFeXo
         cQf1q2qba1w4ttZkg+Lp+OKFskIbVRxEJPkxzkrIBYJrJstzFh2mspJMWa2vLP0GaZSn
         9qCRUj2ncTn4e7yT5shXp+3YlyNhEtiI3acTuus6CeG88nrQEqRo1hy1qflI4QIbz9Mt
         sfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769514220; x=1770119020;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QJjtcXc5Ltv6rKoUwcNDWqydHMEMgmd0ypnLUx1rCNA=;
        b=UeLLYUYN4AOTPKv3cXi2B0CajYcO4fRZ/Q0+HZqV/W0aQNz/8yVuKQKoPmaqw4gslk
         byLKHLKzW6lh6fqcEUP7pWu9n1i3AKg8RbC4wUebD3c5KCVb1VA6z7W7OMyrGU+RAXz2
         hBMit5J0ZXd6SpSDRl88Z27somfSgWcDhVIsT4al1iH6dc6Fe5UkIKieI890p9sQUyUM
         irQWtIX7HqUnlsO3O5+DhTsHFhwFC5Pk069R9n69SMlTV4JmaWeLBQ7yH0IztS3gwbUo
         F3l1f+nWf0QKK8yoPTaFuA9txydtpl+4E+XnemM2VvZpMi9UO2/BMANLHT4vk9GNThX8
         t5iA==
X-Gm-Message-State: AOJu0YzLBaZfkpVCxl0ozs960C/c6d2gv6MYeUugnEhp5ZIghIYepUU0
	fPKXRSAf4D/Sdj8U21DrsQ+Uxw35mPc+EWINrUYKsdT/7gYPjEg84V1zhvAcbpHCBcbwjL39oB6
	8q60THvIN8BEyKmUI/ngpaeLf4AXQKV4yhAsdYixhC6P8B23SmlCwIl6D7nbk7NHUYQ==
X-Gm-Gg: AZuq6aLcDLf8CCDg+gkzLNSCQNsuIGHgsFhmQREfS+sD3r0WQWJQaL0XpjBghmd+2ac
	Gzgkbmokyo9iDzFSKzOl29uAp/Pdlr6JLnij/0mXZTsLMRFfQYrVacswphJjOZvYgIObUmTQwuH
	XfqSc1l+PAP2iJdykQnjFcK2DmcmdSAWD+gnBrygGEQEj6WTj71QbNEltr9yo0ODe41Zz9jlnFC
	ecKMXRP3RksX/NbXsyOQS9Zbtm2BaQdzQOJtIw+bKxK1ThSRTdqAA6HQ1VDTydobWB1pycrHJ6/
	WIn0AlUZBaBxBU/GTba0OBZuBosnKLbF42AQouV1Wf00FtGWmHRkhOzoDHCCBxz8BzRyyJ3VBiQ
	JY9elDtdHpBR1eoVsy+b0gY31L2uSiornohz4siJvud8YP7MfWTaV1RZUYkajsumEVec=
X-Received: by 2002:ac8:5a82:0:b0:4ed:b409:ca27 with SMTP id d75a77b69052e-5032fc17265mr11027621cf.10.1769514219788;
        Tue, 27 Jan 2026 03:43:39 -0800 (PST)
X-Received: by 2002:ac8:5a82:0:b0:4ed:b409:ca27 with SMTP id d75a77b69052e-5032fc17265mr11027431cf.10.1769514219370;
        Tue, 27 Jan 2026 03:43:39 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b92b5efsm6629444a12.18.2026.01.27.03.43.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 03:43:38 -0800 (PST)
Message-ID: <83198eae-088e-41d0-ac5f-2346e422a25d@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 12:43:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] media: qcom: flip the switch between Venus and
 Iris drivers
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
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
References: <20260126-venus-iris-flip-switch-v2-0-b0ea05e1739a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260126-venus-iris-flip-switch-v2-0-b0ea05e1739a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OYOVzxTY c=1 sm=1 tr=0 ts=6978a4ec cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=aFFQHNQvxcfBljpNvT0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 08LUN3taIsGuxxN4znf6xZc8RxOGicjZ
X-Proofpoint-ORIG-GUID: 08LUN3taIsGuxxN4znf6xZc8RxOGicjZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5NiBTYWx0ZWRfXxiMmJHjhRFff
 yaxkPHZqOh3YdmVfkinQGFah4+5okEeG4Nf6FkHDVSmxS5+CcyXqhIDGLjXFQ0jM5yamsdbVnL4
 2kv7wZCxd0pn/hJAJ0B+jzYI7Kv68JuJ5iCQJ8WvlzRV/Di93bXVWfA1crUCymRabPU5Q08WmeR
 Hhw5KLotIYRVsVpsIII9ZnoahbvfCQ3D4Q//Z/Cozf4wLx95Bz/+iCzAV+rk8drIKiKULvpA7mX
 W2om/NHITYD14Jx7MiNJThfzFEO2HtcTqLYgjcC3/nMA5bf94qaHeNvJ+Dra5L6qScUro8D+bGW
 CtQCz5BuVSs3zv2r3T2tSF4Tif4aaftCKC0nAtIh1p433bGwbxWqQ4HceUJpzQmEsxC/YAa/zQa
 pWRclKnNYW7oe5m/6oh3xMP1MXUYQ/84eJbCUy150Nu/htc2QrGuYAbd1FVAPDcnTGUage9dZA5
 z30uPiuCs9fVMh17uQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270096
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-51639-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[out-h265.md:url,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 4F1E693C8D
X-Rspamd-Action: no action

On 1/26/26 3:09 AM, Dmitry Baryshkov wrote:
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
> 
> $ ./fluster.py r -j 1 -d  GStreamer-H.264-V4L2-Gst1.0 -s -so out-h264.md -ts JVT-AVC_V1
> $ ./fluster.py r -j 1 -d  GStreamer-H.265-V4L2-Gst1.0 -s -so out-h265.md -ts JCT-VC-HEVC_V1
> $ ./fluster.py r -j 1 -d  GStreamer-VP9-V4L2-Gst1.0 -s -so out-vp9.md
> 
> For H.264:
> 
> Only the main set was used on both platforms
> 
> On Venus pass 126/135
> On Iris  pass 78/135

This sounds a little bad..

[...]

> For Venus several tests crash the firmware or crash the device,
> so test-suite was executed with extra:

But this sounds way way worse

[...]

> For H.265:
> 
> Only the main set was used on both platforms
> 
> On Venus pass 135/147
> On Iris  pass 133/147

[...]

> For VP9 codec:
> 
> On Venus pass 174/311
> On Iris  pass 232/311

These two give me hope..

Ultimately, I think it's the right thing to do, if only to prevent the
crashes you've described..

Konrad

