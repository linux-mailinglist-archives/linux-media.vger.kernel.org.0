Return-Path: <linux-media+bounces-55671-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFgyOgwEtGnjfQAAu9opvQ
	(envelope-from <linux-media+bounces-55671-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 13:33:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B39C2830C1
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 13:33:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28419317B7B9
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 12:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDFDE391846;
	Fri, 13 Mar 2026 12:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dkZ0MYVE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gF/p2q6X"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EE01C861D
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 12:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773405037; cv=none; b=RfpZfoUtwUcQS9Zwz0hxbFPSMv7RV4C3cV4q956rGSlEc71VOaomZ8BDzkaM7EbS0UPHbk4yDjMNqmJNBgEgkSIS0hDyauK1RaHnLco6SHVd7ZFqLs3CwCoOd01DhfcA95Pby+xf6lAj/TVONjydnEKd6YivfssnLJYqn6+duJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773405037; c=relaxed/simple;
	bh=wUYaao9N554DKjtnrft29y8GPGyASDsSgMMgoiGJFHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gGEm4F0PjPMmvPryXAAiPjs9jKENy79SF7i9gf5Vy3ujiCbyjpQEhulrXH+7LaSV/lBCcu1dmakqlc9wMNeYfMkGxpUln3hYC/DBBGX6tv2nLeGBoyVWMQt66BJK4akkI4p42q4m27yBbGMiHlzx87aV/o73rkJiKrXaDj5IfWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dkZ0MYVE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gF/p2q6X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DAmplL2390203
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 12:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C3GFh0qpkwl9z7+vFu6yN13UEs6c8A9nSty3yTW7bzI=; b=dkZ0MYVE1XaZIF4W
	kX/eAhUvYvHQJn35HFqzHhOV+U7YpJkR6CW0E0SIhpGQs8+9cvJXYUec3ZWk08sT
	hmBpTDjNzhu6jwK6zDiHmSnbpfwMCP/ozvcUR6XqGWF+lZUhyD9H0iQCtU8iRw0e
	yECg9elPsfD7Wac49obwZebosEyK5xKN4hD9irp0I6U2yg+nMSKkhFWx99QDwbaH
	jAlVnNuSd4JhY8B2yjRaachK8+L6XemS5TK5K2ouxG7VTE9jN7YISEXrl0lKeJJg
	WD8N/jdTNtGQj+En6uH63tZ3t9ax3yl/A1hcFoOHKtndRWSl21C9NHhEtBwwCaoL
	4brd5g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvh5m897d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 12:30:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7a2c535eso101388985a.3
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 05:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773405035; x=1774009835; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C3GFh0qpkwl9z7+vFu6yN13UEs6c8A9nSty3yTW7bzI=;
        b=gF/p2q6XBRx6KZMVPHzb3QWLNK6zX2txBGvwmnhs+AGwfC3hB4Tleh13fy4Rj4/7x5
         6Rmqt1LjEFLlTfz65elrorhpecCuUOLK9gzHaP7E8ncRma18FU1oWaiCeiRUIbX3YMuY
         k5L1XnPnN8aSmA0EfP+7qt9dinblJN2X1NZYy2R1Map6yB6mtwJOeQdqlkJA+Pj4GpfO
         KwujqqSsnPtoIjGWt0XUJab48UuSGU/5een+CvlMUpLLEbc9XSh86ikPQwAbhf083Zj7
         EhoNakKGSr2hl08vNSt7ImdSEjfgx208qXHd+SWPs2Aa26WP9e0kfpVR+ol8/bjvviGP
         iSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773405035; x=1774009835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C3GFh0qpkwl9z7+vFu6yN13UEs6c8A9nSty3yTW7bzI=;
        b=oT6QqjBSEFd/RVd+/e0Rf8ZWtlNJlyVOY6kOg86wnr0LmHELZKHcoEQk3XGvdNyTUz
         uXN94rVfP5FB06NEolcMMfrRDiwCSpzC6+lO9+CLfFT7yoq/QLXqF+k2DblAIhllCh2j
         bzCFS9dvc2vEDfqW5dlWO5vophE9UdZr95yWNT5BV4elFM9RMz47sQV6hj0YUX2PDo2t
         AhvA1gE8t7TtELoBkv4/EbYQB7XqFDkOAywF5kwQEAWyaYPXdKd2ALT1PP/8ckHQGHVa
         AYYDEBtPYbyIMC4mwF0tXxiy2lRjZes9Y4cFj2LsQS4ERVN6q11fE1UQeEMGvgz0FGv3
         4spg==
X-Gm-Message-State: AOJu0YxMs4sB8+81yzQ4prbgCIvDGEifWMS5D/cC2HbVTYA6phr9Ftac
	ZQ8Hul4ZWJ5pAZoLcA7sPXXpOOjPn8pNMyYogUnRKn9To1nVq2adQ9Ibg9XNiB3T1YW1r5RLsg0
	ubyO2X3LxV4q0IXvg3L6/uS5WZNRPs67O2CxDIk1dkmaR2YSxo98JGytFCeo/fofIkQ==
X-Gm-Gg: ATEYQzxKwX7447G3Mx8tKNcH5ww5h+FmrBlR1TjiSJpfFNVVTooxwWVS4/PIVO0NacZ
	8AifAs3E99/QqGwS/AwBMGMbRczUKSzbpyVuZ0p/I/LiVPEkxryT+VBO3pUL4tzV7mYGs5DyLCB
	Q9HAyfX7jDeCaHEY7y70yoFBbNfyhtHd2rh3u/RyE7faF8SIwSxnVXFAS47krEs47To6TnVwmb0
	yZ5e7gmOYPM6l0MmFQXIm5RvGtdgG8Ee84EsWS+bXSvp90QTXrdQtXYG+A2XlgMwDduOQ+4jbGV
	ko2eO/EP2a5SJQdmdlIVEG79E1jfPTRKzrFv1+9zk1gM1QLTReINBIoGjo2z8UG1ePthrtvjUrU
	trC29dAbnTqyLgbuEueRNvsfsSu79isdkZbr5piO8qSmXGfHEYhuFFy5mn19tQL2rKlALJO8PiW
	yKOlM=
X-Received: by 2002:a05:620a:a0a:b0:8cd:b6e4:81f8 with SMTP id af79cd13be357-8cdb6e48742mr186909585a.6.1773405034531;
        Fri, 13 Mar 2026 05:30:34 -0700 (PDT)
X-Received: by 2002:a05:620a:a0a:b0:8cd:b6e4:81f8 with SMTP id af79cd13be357-8cdb6e48742mr186901185a.6.1773405033923;
        Fri, 13 Mar 2026 05:30:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6639fe6dcb5sm781766a12.18.2026.03.13.05.30.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:30:32 -0700 (PDT)
Message-ID: <a4ed652e-163d-4723-a6d7-b942d4acd9a2@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 13:30:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: sm8350-hdk: enable Iris core
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>
References: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
 <20260312-iris-sc8280xp-v4-6-a047ef1e3c7d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260312-iris-sc8280xp-v4-6-a047ef1e3c7d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gtvtZNi5pMJUXIEzFJRublQCyexM-xMF
X-Proofpoint-GUID: gtvtZNi5pMJUXIEzFJRublQCyexM-xMF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5OSBTYWx0ZWRfXzDf0MahqpUAT
 1dNyP9MkiJCy8LiUdt0Ss5PHWk9kGnYLq1h+5zyxHRUsEi5YDOboNWH+zU8wOhtjQwenMDdt+as
 8uNRnEAb+1+oWbDMtJFnyfxAVsoU8KW3WqIUwWxDiCSr+BB3Eez1mS79x5Y+FUwyLsm/2UgmqIX
 O34PIpuvLeXVGxJ4a4C+ta5Uyn5Zc3JafriGZnlD0bK4+mS26eVuvKQfxCgfV7+Kc28dcOY58XR
 XyDZdJtVpBkHUMfhsUu2uDNHSgnSY4Dv06a4XdVBUGhx+N1hdUi6JjnwZerg59Fm9YzdOBZAQXw
 9WKcwWsxJV2K2eNpf5gSdbBxJSbjkW8Kp80wHfQYYLX9B0u8+1rMA6TxqGKznlBGzKm2QD5iclY
 5RY4iJcUCErN6GBzwXQroks1Kzh6xk2rHn2H6U5GuG5t4mx2f0vxFmwM7fqafI0QziABpN75dwC
 sbBJAkAgBLtzoBje2Yg==
X-Authority-Analysis: v=2.4 cv=S6TUAYsP c=1 sm=1 tr=0 ts=69b4036b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=NMZvMjamZalpy3N7dnkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130099
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55671-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8B39C2830C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 4:14 PM, Dmitry Baryshkov wrote:
> Enable video en/decoder on the SM8350 HDK board. The firmware is not
> (yet) a part of linux-firmware and needs to be extracted from Android
> data.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

