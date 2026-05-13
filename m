Return-Path: <linux-media+bounces-61462-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kO+DEH2NBGoALgIAu9opvQ
	(envelope-from <linux-media+bounces-61462-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 16:41:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CDF53546F
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 16:41:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8BD0930626C5
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 14:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C3974418CA;
	Wed, 13 May 2026 14:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZzQAQr1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eiKv4drg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BAE175A7F
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 14:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682858; cv=none; b=hNNkw9ELwJ10WwHtCTBN7QLC0haZPQbmINxA1ohQ7UuYxUfEOqpE8s3nJ8q2Dhz6s9GnroWmwje9PrM7HPqHdoyH/fuJ8FzJAbc6iVwgyznEJTORoo3oGo4YFotFxraahiz03Wc4JyUL5IhYU9j181fmrmjDPFdfYgQjuYpjKks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682858; c=relaxed/simple;
	bh=k/u5KgCL2CVsyFgdxCibadBVnYrtE2ck0FKgg4tNW64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TqxLTi/l4Koy0VGFkY1vXtaZTfjURNR8e9ZHVLjSaSPnDxlA4YqnKt9QZdbFUgvWm8YxwM4lREGBIAFk1MyFISOA4ZJuw0N74mi1hKzLMj3Z0SdEBeDBl/1n5j1q0CdhpDRBgqW52YbOI/1wDvVCQudwUeBtWu6xfSgtu3E2Exo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZzQAQr1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eiKv4drg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DASYUL2338932
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 14:34:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k/u5KgCL2CVsyFgdxCibadBVnYrtE2ck0FKgg4tNW64=; b=IZzQAQr1MvtSXHUy
	nRdk6TEH621Bx70vtptShrLmWNeTkDRyEIkp1Eop9QpHyJk9P5vrWN9L0zhlJ8rZ
	/VxPepHbsTE9xUrPTEmpEGzyqtyERytihoo64jn6UC2BHoR1jaemg+A+ZgGQQj2b
	rYuGxLnNZnz32ZOCaCtX9uDIFr5nUUpHQqOGNWKZ5ZVYMk+psXbv+Ct6DWLGahSf
	tFoOix36xfh7TeU9LuzJq1SyvFhIh3OOjGQi1OwTFT+tRZteVNhUWgeAA/M4XFrc
	FVsrMKgDLnZx47nnrxIajf44uICFqXhJaD1ojfXUgFguHWFktYfc6lap22jR3Adn
	w3R64w==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e49vxbwrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 14:34:15 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-575296be5b1so662541e0c.0
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 07:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778682855; x=1779287655; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k/u5KgCL2CVsyFgdxCibadBVnYrtE2ck0FKgg4tNW64=;
        b=eiKv4drgbkMVaMhPl8cVMTsoofOHn5/EhDP4QX/5e0t95MUlEUP9RX3XpEbxOxnigH
         Z6CbwyqXFBLji3BcxJMNGghSg6+X0RkJswuCFFdF66S73XOgrsVXcCQeZPWOeq6Ysaba
         13gvYVAq9RKdTPlgyznHP2O/Ef48sZSMNBtAjlA8ZFt8hOCpEJs+zzTrXaW5ZkiTXhVD
         KVd+XLUrNOazsau7tskJoRXptJzuNnyaCxj9eYFlFmvV/GnRFctnxcIe1jFQLB/6bw9H
         SA2BQAKzEYgIbwwttzNv8XdCZHX0EAeKJv6pXTryQro7s7Mv99pkx00OcXOMxH8ExENX
         NrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682855; x=1779287655;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/u5KgCL2CVsyFgdxCibadBVnYrtE2ck0FKgg4tNW64=;
        b=LkAjzN2vQL17V4j6pnDqOViwUpHm/Hz4Bu3MIQRvr/qBVYRL3Rs+byaw17K2SIpDEc
         93ltt4rVmbOVNlO7lChowOpxF+HXEWDqu2dS7yrq4gJaxzpHJAuJqmxrIkNUJm8Cga//
         RasMr8NEGVyXQpjLt8/RuK8ThGJXpywE9kzwj82/aNaQej3hm0/GI5lApiZikdvLg2iB
         k2+L+qd6GZE4RU7i5Kd28wlYPoKx1cBhu+97jd9R5z54EhENkXDLNyQI2jXNungiqUm6
         xQJBjYIwQRHk83ORoySKoF1ozrzws6VvR50XU7QQlZDGjQscXWgBvNSWQUgLItMA+aIg
         FFGg==
X-Gm-Message-State: AOJu0YyXqprmJ47YUV4/HKS3cm6Wppe89cKANOxmajh+UNueYBFCa0MU
	pxU1IY3TaZpzmbDUkCx5eX3/RpOWqrCI9esN0WZyI/zEOA+X+PZQYlvvIhD0cFgeJX27wOuCWPT
	1EC5MTugubm088vjSEsObNsn/53vOVE9+GU3V0uzvmGTLJUKscgbrFwWiNdClxnvHiA==
X-Gm-Gg: Acq92OFHW9HRM0+dE8pk81j3jn+a+LoW800oQP3IVk5pmMWbLfHQaLg9+BZK4U4FOm8
	3xBzHjS8KETYbiydiN5+CwB63YVUpMfJNpUSKnOSRAlkc0mvBT385D0blUMbVfWFhTOpmYzLOiB
	iL3PfeUMVfd1NQsygv2Afyn+9XpHfcUy2ZfkutZh9XGU69XZp0Yyw2DDK0jy0PEHJu8VLGF5SRc
	5ebvH3scqhRSPnhJrwuHwRaAmIJZLQ7sw6mqIRHomyFBb7CS9oSGK679crVLXgRkhsoPWyDcGUl
	/uh/IuFgOxqzpjsEPfZDiGnNM5exv/8H7VNjIGIoz9poHb8/pNj8Rgi79dMDx3TlLQTgPbqVQJo
	lEyuWiXyU71c1HrMQeZPfX7hACcpX73lILmkeuW7fAPCKnmjfn82XG9uumjwrUgtdXfP9moAM/q
	jKBe8=
X-Received: by 2002:a05:6122:6d07:b0:56c:ef9c:f9d8 with SMTP id 71dfb90a1353d-575e6b6f598mr758302e0c.0.1778682854754;
        Wed, 13 May 2026 07:34:14 -0700 (PDT)
X-Received: by 2002:a05:6122:6d07:b0:56c:ef9c:f9d8 with SMTP id 71dfb90a1353d-575e6b6f598mr758272e0c.0.1778682854220;
        Wed, 13 May 2026 07:34:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0e1a221sm6338794a12.24.2026.05.13.07.34.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 07:34:13 -0700 (PDT)
Message-ID: <08d40bf1-2bde-4184-8792-40342112f3d0@oss.qualcomm.com>
Date: Wed, 13 May 2026 16:34:11 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/16] media: iris: Add AR50LT core support and enable
 Agatti platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ofs1-GBFH64BKzy5jWbuffY3zM27Yt8p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0OSBTYWx0ZWRfX3uKyB1vzzDCC
 DiiHbn4Ft7of4zhG/WMtwvLTAaNw6WphTvPhebaop92H3BcrYaNzJdOTBYSCHfgeXu15KKlT/EK
 QIoQGygZjkLVSCgYijL/co7jyWVCDB/Wf63kRqFiFWh6aMCndcYuAxaMNRxHhSs0JD/vaDjGPKb
 LkShXowOuddctU3JGRgU4ytwo1+Wz/VmFiQvln6N/ttQEkC5xHAViRXekCeJGEKzZV31yKn1uYI
 b2iH8bCwlfZXupWjZxrpTHOKUkIb10snpGiw4a3O6UiAf3pHcRp5yG83/LJM+N0upebNY86Zugl
 mQYIbX6yj0E6wTtfQ/U32lyBv3yjRZBWidDjFMSTnRA9gVKV8r/aaI3zGEzeJ17Nh8xiZwfurEK
 Li6yYBhtJnwTnchyoY0zQbalfoOAQpMjWx0xH8Q7QbunFRE81qA3zV7lBdjNtDmmxpxCUe0sMLP
 yUEAMxxfZ5Bd1BdAjjQ==
X-Proofpoint-GUID: ofs1-GBFH64BKzy5jWbuffY3zM27Yt8p
X-Authority-Analysis: v=2.4 cv=A8Fc+aWG c=1 sm=1 tr=0 ts=6a048be7 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zU_0Paue0AqbtnCKBaQA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130149
X-Rspamd-Queue-Id: D6CDF53546F
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
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-61462-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
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
X-Rspamd-Action: no action

On 5/13/26 2:45 PM, Dmitry Baryshkov wrote:
> This series adds support for the AR50Lt VPU core to the iris driver and
> enables the Agatti SoC to use Gen2 firmware and HFI.

[...]

> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260507-iris-ar50lt-06228469aa5b
> prerequisite-message-id: 20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com

There's 6289 prerequisites listed in this cover letter (probably a record)

Konrad

