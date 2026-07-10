Return-Path: <linux-media+bounces-67235-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QckVILSuUGqS3QIAu9opvQ
	(envelope-from <linux-media+bounces-67235-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 10:35:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8C4738884
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 10:34:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="LTK3w/pf";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UFbUO1Z0;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67235-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67235-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D21773080B39
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 08:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58DA73F12E3;
	Fri, 10 Jul 2026 08:27:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AC933262F
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 08:27:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783672078; cv=none; b=nQZubMATX2y8u+x+GXSB//CGd0/cQfZ7uxm5TVIYMtPm8WgpTi21h8ac7sx8TPSWOqxRL3Lj8HcHwtAx/eP2KrnGFFCFyYVMdzOOd4RzP4Z8/Qk6SdoDwOWEmv3RQ6zJg725ZkTDSKdkHVDFH2Y7O/7MXNpGrO3oSqD+MwhFYC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783672078; c=relaxed/simple;
	bh=w0XukhUGcMXl1pfRJDXW4iErHU1Kq89lOp4vXId0pfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gn/UU/p7SjZ/SGNDLXFRP9uzn7YuoX7dpUjd3Z2iaKB0+p3bD0dswvdHcptjoNZVV5CKldoP6wTmJfo1kqdWdo4R/kuaG9TH5k/x+7GixjpoFbnRqSroxKr3J6q7F4/MtvmBin5hbeD/STPgvlY/0plUUAMpI/6VGEtTjCvZGrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LTK3w/pf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UFbUO1Z0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dcSr056648
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 08:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fwL26Vdu8eHV+0HZPUj6SDG3AZi2maZop/sTus1frl4=; b=LTK3w/pf3y2Iwjay
	ScD6QLWv15XwLvfa+FLdeLfN4OlKhxIRNGhpmo1qec5K4gDHlsNxK9tmeazt5uED
	JiQJGEG8ZD0SnkJ91uuLUs1m+dWSKRV/KgnrEHpmC8hlhxa6I3VvaCVhzqy5tgS8
	TTu+cTF8uJlQgkZsoZfRZeSRHromjAdPhGS7vrr0/Oe6g0fkTAF3dlrwQYbnCVFY
	k9IY1n9ADtRlUYK+sAw6WZG5LIOcWKyUbjbSLGEJ19Dyt1cYhJgDAwpRBR0HOq32
	Cl/P/LkEtnZ+0ihDpFs71ZmTR4tnqCgVLsWo+eggL86azB2OKYcynoOQ4IT+X4tP
	NwgJDw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajwta445-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 08:27:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e55f0613cso52624185a.3
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 01:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783672075; x=1784276875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fwL26Vdu8eHV+0HZPUj6SDG3AZi2maZop/sTus1frl4=;
        b=UFbUO1Z0SbktgJraAzaZQ9Dwep8vLk9+QLIXmOI33SflZZEjiP7zvgMHlF6BuxmEwu
         ajG/4EVB11rnG0MbkrFywwLsr2KjnbCmAdmApgvA/VnAELkkAv1MLFtKDhxo/CaIcwWQ
         Q6pPzV40nBTt8rng4ORb21ZVK+Uftozl1+NCVF5qphLzosISAATqIjBYDj+WEsbakzqN
         ylg9WEakZP6ykfBqJ9wzjf5wkyx+i2n00viy+K1tiaS9Yk81S6sSDhbT+Bw1PmPwPJuI
         A7tLhQH6824UGeY3ZVGrqAC3erN6sWpTYSIEBbP9EdfT61m00AlWNK3hCMMeraBzH7B4
         qg0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783672075; x=1784276875;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fwL26Vdu8eHV+0HZPUj6SDG3AZi2maZop/sTus1frl4=;
        b=akgHYowT58feVTm9rBXUPpWRgD4kA60qd45tanu+GLRysc9t5Zb1DfI/sfdbKA1uGA
         kQJOKB5zm/ClnlkGeIAnZKKRw8lnBQHhZOxkU72sUEuwXPEA6AI05pT5+fJ7FhiLc3WP
         1Ca9w2oZ1cg9YgQQYKmOcJ7xQjeD2Bs/f8+gzUsJW2ZCy1Jooj1dHHwWHfCxL8yreKs6
         fF3WSSBnuZdbgJxqv3ITSctp3Hgh1j8e3HbWY+M/Uc6BPBKsprcYBYAaU4sdnJ6hksHz
         r6vye2zH3pdaliAb4Zm12+E+b+zYmKZ1GNhH/sA4TA9262CgCCW5n9C6pqPyKh9hge3T
         sN8w==
X-Forwarded-Encrypted: i=1; AHgh+Rr6StpHQ9wWOrGT+seBA8ZR33ElzOyUjSRJTVK97/uvTjIbtJZFuAQnpqa+Tsn07nvyxmhQIcGD2qkpGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDHapi7AgCZAx4MXn2Vs58DCgLhGBfoinyQjvXoxAQ8hbDx019
	Ljzuii8OQXG7BzRR+2VnTsa0fQk0Au7B8AOBd7UW1y1TPnv/MmrT5GmwZWV1q6cVEYkmOWKClAh
	abgBp8wikdiDPjHpoE/yOBQ7+crV578T5CHDPKuLFkzUiJanrvIuQxZP3HphkJHHN+A==
X-Gm-Gg: AfdE7cn2cIcirpAntUX2VPF4rl6tcya1shfbcNZgUUTi137x73VuKL0Pf0eIgpM35n5
	400unwk4fxF8TwODHuiKkI5xk2Y3arPriv1buO296QFzhChBdWRh+d77/cmJWFwMHdsBHiH8Ij2
	I6xlP+cqoAykE/DHGFNDeBGkihQlSZvd0BOJN+dOVh9O5uyugDOOEd3hijETZtHUqpD6lQqoVgg
	0CMkpsT0eGODdNFNJgWC6hYZi3g9GMwCWji8gUCi0nRdTPdnpzBpNF1Rx8dQBNgf3lNEi415rWG
	bdVb1ng9SxNHke6ldv5WYNHgLPz6TOE60pAIBwtT5yUh7jeNAlyxkM9tqB/gq41CKGH8veGSbL3
	Xg9B7u/0duqkAqUwIubAj5qg2AiIgLoWpPoc73w1lDq8pCQ==
X-Received: by 2002:ac8:590d:0:b0:51c:2190:3b56 with SMTP id d75a77b69052e-51c8b433337mr114544561cf.21.1783672075647;
        Fri, 10 Jul 2026 01:27:55 -0700 (PDT)
X-Received: by 2002:ac8:590d:0:b0:51c:2190:3b56 with SMTP id d75a77b69052e-51c8b433337mr114544311cf.21.1783672075114;
        Fri, 10 Jul 2026 01:27:55 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.253.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c38c164asm429906566b.3.2026.07.10.01.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 01:27:53 -0700 (PDT)
Message-ID: <ea0b16a3-0c44-433f-9404-747feff3b19c@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 13:57:43 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: iris: avoid bit depth validation for
 capture formats
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260710-qc10c_fix_and_disable_time_delta_based_rc-v2-0-701d6dfd1ac1@oss.qualcomm.com>
 <20260710-qc10c_fix_and_disable_time_delta_based_rc-v2-1-701d6dfd1ac1@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260710-qc10c_fix_and_disable_time_delta_based_rc-v2-1-701d6dfd1ac1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XOYAjwhE c=1 sm=1 tr=0 ts=6a50ad0c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=MoCqpHF70WjPNMFBpltNPQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ukklFZUiyCJfO1Kbj-UA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: rU_IW6YLEd6cWr49blp-nWxmyTAgMRzN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4MSBTYWx0ZWRfXyZfrjfqT1SIh
 2ARpdyVcOD9+QKu07X7nmFCSIX2PnpNVwk3v+dQIpoesX92aKc5wQgItZ0FWHF/4jq00F9MNB52
 gkp5reb7N0CATDEOGE8l+W67hoXgf8E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4MSBTYWx0ZWRfX/m/5Ch2IgakX
 mDh7nLwHzkqbNSE4rWhfehQ0gwCQo/L9KyDgeuobur4994XmJcHe7rDDgqdP04sROL5vknuviDS
 DdYYzLvi1p5Cf8SHIJ3RVmAXCaDpiVJQNApDOLFdwvLOwdUBqGrVDPkWUFNvWiAZo5TBzs3wtbq
 cwfSIWf2a+4axNQuM1Ycs9LVxYkL5QA8TLyU9F1TqNYVVGFYtSUUO96WyhziEOe4RY7X5dpJ/KR
 lMNgQ6n+1ByP3PhCDIGgbpQZzKr2EIYAKsU3ArZ8oZjVA+Ilc6juwuxz4TUpRnvIZ7WV8FNw8+R
 60/v+NerSEWv6MvyAQnaM6eX5njK8CBx7pUU2+bnMECIh9F0EQuXK38VR3F7djhP8uhmS9wtFH9
 hhqEWG88NBmyEkfGFf/khdOwriNLK86JBDYNxOAmITqLuSYIob/CgYkFJX9JDAvthGxKjQCQFQQ
 vp/SXN8tEHCweJq4XbA==
X-Proofpoint-ORIG-GUID: rU_IW6YLEd6cWr49blp-nWxmyTAgMRzN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67235-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:busanna.reddy@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:bryan.odonoghue@linaro.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD8C4738884


On 7/10/2026 8:24 AM, Vishnu Reddy wrote:
> When validating a capture format, check_format() compares the requested
> pixel format against inst->fw_caps[BIT_DEPTH]. However, the bit depth
> capability is not available at this stage and it contains the default
> value of BIT_DEPTH_8. The actual bit depth is updated later after the
> firmware reports stream capabilities through read_input_subcr_params().
> Because of this, a valid client request of QC10C format request is
> rejected during the initial format negotiation. The driver then falls
> back to the default capture format (NV12) and stores it as capture format.
> Later, when the firmware reports that the stream is 10-bit, the driver
> sees NV12 as the selected capture format and switches to the default
> 10-bit format (P010). As a result, the original QC10C format requested
> by userspace is lost and QC10C decoding cannot work correctly.
> The bit depth information is not reliable during the initial format
> setup, so it should not be used to validate capture formats. Remove
> the bit-depth checks from check_format() and only verify that the
> requested pixel format is supported. This allows the format requested
> by userspace is handled correctly.
> 
> Fixes: 20c3ef4c7cae ("media: qcom: iris: vdec: update find_format to handle 8bit and 10bit formats")
> Cc:stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vdec.c | 10 ----------
>   1 file changed, 10 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

