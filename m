Return-Path: <linux-media+bounces-62330-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNzzDybXDWrW3wUAu9opvQ
	(envelope-from <linux-media+bounces-62330-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 17:45:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CC395591267
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 17:45:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 27F10306CCF1
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 15:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02DA53F0773;
	Wed, 20 May 2026 15:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A3lKGGOy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LisuZ38h"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DDA3EFD22
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 15:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779291590; cv=none; b=PNUsVkoFlkkMhGgffu/3Esdv1AxtMifsRYNk1LFXWwvpgv0CaGpZ33sTQ23Ee9F+PPGVAFzsLvGUI6nsW/89M29blk9vKB3iDrRn4bHxyiCMYM9RliseAUZpz+NyBl8hl1sSmhSo6p2vbNkwtbsE9U+KjM96juBZgZgiueySJf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779291590; c=relaxed/simple;
	bh=Nr2JR0dpmuWjfz/WKWJ82bULQ71y+4zZb6kDz6jYenM=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:From:To:Cc:
	 References:In-Reply-To; b=ujg91JnNEpLiZU9ntBLl0Km5ETIwNLfgXN5gACCyASAxeaeCNgpOD1C9itpMhuSJqqhqFrKH+TCUA0scyHuOmFssUQaQ9W0hveRlEEG85oNOsj4/9Fd6NkoLaTkYVyiAGCP+CpE4eIvig/MJoyI5PjuiHHH7f3K0H69ePt5Z6Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A3lKGGOy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LisuZ38h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9oVHY1178167
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 15:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KDEsJl+ouBVmHeKEwleH/vX4
	IKf0Y5kx3a9fe6U5jtw=; b=A3lKGGOyHVCC26b/kKVZSeKENVLeJuhALwex6RqG
	Of4u57otpR+2/FQuIvvyMZnuRB6s7phqVB+Jhp29axK3V107G+owsh1Qq0Kmc3eD
	b9w7gT1kgl0ub9b+CpGpq/DNCtjjTVYiKdn/xTsuPpmQ1CCewTmwFlg/3KRqzRGw
	c2yCZzKlaQSgtiQ++mE0qYMb5BxARRK7xAG2lBMdBckYjkeJ5gqgmqjuQaIEWR/u
	9RF2CUmJ2DMJ4Vm/I5LdLRakXAygBE7yhM5eRrW49jpGoVXwolkKE4W14b3b0dGN
	iD1rzeQLM8eVJEIE5bBkEyBRlAM5/3SjdR3OfHTl3KxHbg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ap6sagm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 15:39:47 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6312aa1d7adso4176504137.0
        for <linux-media@vger.kernel.org>; Wed, 20 May 2026 08:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779291587; x=1779896387; darn=vger.kernel.org;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDEsJl+ouBVmHeKEwleH/vX4IKf0Y5kx3a9fe6U5jtw=;
        b=LisuZ38hB33w6fTjcJuroNKtkOpEhJXCL1fPez2xhm7rn+dBb/nSWyvHI+wsap4dWR
         YF7tpQB6y6xTz3YulCAwv8LavM00YDtNao9eLNmg69mmSJfY2aH1HBru7XvCNLYlrSbx
         L/SEHV+LBhpLDnw5z/I4vFldnqX0/6lGfArxcg7DPO7kqoZsiKqeY1CdNlkAqBlCyJot
         dnRewB64CMCJMpbRPHaSfIMC6SrSuQtO7AKW6DP9NtmEb9fV8Xf2FytbYR+Ug9ro3IEA
         ubtPxTiYVJ6XWV245L7Y7IDYZTBTeDfLC/bgUKRi7fjfQTA9A6JoMbP/+QY2XHBVghdt
         5UKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779291587; x=1779896387;
        h=in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KDEsJl+ouBVmHeKEwleH/vX4IKf0Y5kx3a9fe6U5jtw=;
        b=WKvIUtKeybhOl8kHn0rtCXqGsU0v3ryDcx43UddmdjfAc5P1JhgdhcRA+Yd3suKu36
         ZcG5GnXMK+wf/YAeBUc5tkjdb3xrMGzSuIwREyxUWEyzRz2AfD1yxDQKbP1+QtIgRoXn
         7VkTgmE1Uvw2pEAphauqLQekVlYI6WZLp7ViGh/apVJ04vagP4FCC+9m9BRBsQrfyXeL
         lZOKgi+dB9DR+dcYV/vTRlKpC8hUjB5WGUmui0OnOrUBlPWhU9ivvTsiif9KYO1GqvLn
         MGv7c1xTSGaxV2nWhnaxVddTa+MfiXWeoEh2wLWhfK9tXKQLZ5TjVZ5AmoBHHpmXRNdP
         aXBQ==
X-Gm-Message-State: AOJu0YxooJBBSgmG6inMHY1HRFi7LJb9A+rkrlHI6I+7fLQgQ293wu70
	+14R2fIed6pHrkJwWca9RMIiWwWBdnc6GZr/OQclCFLPJcYjMESkQ+nMDDG12jJgMiTDiNdtP7L
	FP8NtZtkzwPw0lKAm+LWacLNOpgAs81kQcdtwCjtqKOPCcNKha8OkNZovmulKv9I57w==
X-Gm-Gg: Acq92OFQvou+zNFA6CeBiTxspFVy4SzPWhRgiCXJ2ARfWH9LKgB1RRwf6QljOnkxk3L
	3PFwD9C+b0NHPdsixVOrmIEtq7OISB+Tg39tkx3+Bt1s/DXED6OtsBwnz72vE38W36LC6uw6Pdx
	K4zjiKroXm0qJSAO2Zc+uh3axl1g02bZVAGBKnfiMn8wWkuq1hx3kvGtuvvxsZU/sOauiSVtkbr
	P7EEkauIA8ecc6xgD95xZMvMUFeyN//u3CIuWs0MXPNnSWg4R1zxorL7edS4mbmRHoYa+5wCstB
	aByx0u6Bsuw1I4R1p4QO8mcwL/U83qg1+t18p8O6i8dKWQbibi3prARCqwDYZOOlbpdy4LsxSoK
	PtfcaRiM0R3s4sGEmsOGGyzmDOaopsFEZCRf2Uqnpdaip1L28A44uDM6odtM9sTRRucl74SB57N
	2MWy7rS33DSJUEcxlv82dRtIuS0TMpsCQ3HfyQmKABvI4aVOBeSqJfRBvh7mFWpq6BtYjgvc4kL
	TrZ+EGsZFhM3dHP
X-Received: by 2002:a05:6102:3752:b0:631:3bbb:f268 with SMTP id ada2fe7eead31-63a3fea4735mr11679079137.23.1779291586938;
        Wed, 20 May 2026 08:39:46 -0700 (PDT)
X-Received: by 2002:a05:6102:3752:b0:631:3bbb:f268 with SMTP id ada2fe7eead31-63a3fea4735mr11679054137.23.1779291586517;
        Wed, 20 May 2026 08:39:46 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c2a68dsm887643266b.18.2026.05.20.08.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 08:39:45 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------3AmKf01MW2hv0Vhzmru0T8mx"
Message-ID: <038fc58a-7233-49b4-822b-a6d99abf2382@oss.qualcomm.com>
Date: Wed, 20 May 2026 17:39:44 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/15] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
 <20260508-camss-isp-ope-v3-13-bb1055274603@oss.qualcomm.com>
 <3f75dd6a-96d8-4feb-b44c-39c8f5d3492b@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <3f75dd6a-96d8-4feb-b44c-39c8f5d3492b@oss.qualcomm.com>
X-Proofpoint-GUID: JrH13GNBKKLPbKCuu-P6sBcbebaoDt1C
X-Proofpoint-ORIG-GUID: JrH13GNBKKLPbKCuu-P6sBcbebaoDt1C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1MSBTYWx0ZWRfX3xt31Gy3+PKe
 KJ0iNOOJxknhCShVBFfyXcxlmsz++B/xZ8TlQ8xQX3opj8SqKmJB85fMJcUWrzACUkihG2QJCvE
 BzBBU5dQLPuyL8jZFF6G1yE2yqZQosYY70iEo4o9HxQ5gf4Gxiwb7kgpd5IrHgMJW6g9FqcUw3H
 MxZW7tTrKlSzx/9C6jJXX2Sl9yDV3V08Yb5iSklyuMvBi9/5/WGYPIxGoypPeKD7dqbwSEk11AF
 Alf6tnOfWHumckgb36ISrBpU3wCfkC7MSch7WCJWIf3FOsoUdVLBiCLtGJ6dUFoC7hDXqXPrg0U
 2PAh8gxMc/GgInCaWZAvx73wRhd+H6fXONM85HhMU+QaFAq677/AJTYkmYvRqnQCH9tGSOhb4WZ
 J6JsCEZWdlD6Dc4OxuRhraa8qqc0jpARLkWBbsrOZSdyr53MpSyV36HYxfZDuRf9OMXfGg7+FPW
 Pq2X5ARmx+kXwJXa7Sg==
X-Authority-Analysis: v=2.4 cv=FesHAp+6 c=1 sm=1 tr=0 ts=6a0dd5c3 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=r77TgQKjGQsHNAKrUKIA:9 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=H1Te7B14W6HF1q1WNAgA:9 a=QEXdDO2ut3YA:10
 a=wa7H0P_oPzXo1QdaWhUA:9 a=B2y7HmGcmWMA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200151
X-Spamd-Result: default: False [-1.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62330-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CC395591267
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is a multi-part message in MIME format.
--------------3AmKf01MW2hv0Vhzmru0T8mx
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

On 20-May-26 17:32, johannes.goede@oss.qualcomm.com wrote:

> 4. The v3 driver limits supported capture formats for the ope_disp_output
>    node (ope_enum_fmt_vid_cap()) to those matching ctx->proc_mbus_code, but
>    this not how this supposed to work. For media-controller centric
>    drivers, userspace is supposed to be able to enumerate all supported output
>    formats, as well as output formats for a specific mbus-code.
> 
>    This is controlled by the v4l2_fmtdesc.mbus_code field, if this is 0
>    then all formats should be returned and if it is set then only formats
>    which can be outputted for that mbus-code should be returned.
>
>    No active driver state like ctx->proc_mbus_code should be queried,
>    setting a compatible mbus code on the sink pad which is the source
>    for the /dev/video# capture node is userspace's responsibility.
> 
>    Also see:
>    https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-enum-fmt.html 
>    "Regardless of the value of the mbus_code field, the enumerated image
>     formats shall not depend on the active configuration of the video
>     device or device pipeline."

FYI attached is a patch fixing this, feel free to squash into the next version.

Regards,

Hans

--------------3AmKf01MW2hv0Vhzmru0T8mx
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-media-qcom-camss-OPE-Fix-ope_enum_fmt_vid_cap.patch"
Content-Disposition: attachment;
 filename="0001-media-qcom-camss-OPE-Fix-ope_enum_fmt_vid_cap.patch"
Content-Transfer-Encoding: base64

RnJvbSBhMTMzOTI3YzI4ZWQyNGRiZDVmZWMwYjQ4ZGU4NzE4ZTY3YTBhZGEyIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxqb2hhbm5lcy5nb2VkZUBv
c3MucXVhbGNvbW0uY29tPgpEYXRlOiBUdWUsIDE5IE1heSAyMDI2IDIxOjQ5OjA3ICswMjAw
ClN1YmplY3Q6IFtQQVRDSCAxLzJdIG1lZGlhOiBxY29tOiBjYW1zczogT1BFOiBGaXggb3Bl
X2VudW1fZm10X3ZpZF9jYXAoKQoKVGhlIHYzIGRyaXZlciBsaW1pdHMgc3VwcG9ydGVkIGNh
cHR1cmUgZm9ybWF0cyBmb3IgdGhlIG9wZV9kaXNwX291dHB1dApub2RlIChvcGVfZW51bV9m
bXRfdmlkX2NhcCgpKSB0byB0aG9zZSBtYXRjaGluZyBjdHgtPnByb2NfbWJ1c19jb2RlLCBi
dXQKdGhpcyBub3QgaG93IHRoaXMgc3VwcG9zZWQgdG8gd29yay4gRm9yIG1lZGlhLWNvbnRy
b2xsZXIgY2VudHJpYwpkcml2ZXJzLCB1c2Vyc3BhY2UgaXMgc3VwcG9zZWQgdG8gYmUgYWJs
ZSB0byBlbnVtZXJhdGUgYWxsIHN1cHBvcnRlZCBvdXRwdXQKZm9ybWF0cywgYXMgd2VsbCBh
cyBvdXRwdXQgZm9ybWF0cyBmb3IgYSBzcGVjaWZpYyBtYnVzLWNvZGUuCgpUaGlzIGlzIGNv
bnRyb2xsZWQgYnkgdGhlIHY0bDJfZm10ZGVzYy5tYnVzX2NvZGUgZmllbGQsIGlmIHRoaXMg
aXMgMAp0aGVuIGFsbCBmb3JtYXRzIHNob3VsZCBiZSByZXR1cm5lZCBhbmQgaWYgaXQgaXMg
c2V0IHRoZW4gb25seSBmb3JtYXRzCndoaWNoIGNhbiBiZSBvdXRwdXR0ZWQgZm9yIHRoYXQg
bWJ1cy1jb2RlIHNob3VsZCBiZSByZXR1cm5lZC4KCk5vIGFjdGl2ZSBkcml2ZXIgc3RhdGUg
bGlrZSBjdHgtPnByb2NfbWJ1c19jb2RlIHNob3VsZCBiZSBxdWVyaWVkLApzZXR0aW5nIGEg
Y29tcGF0aWJsZSBtYnVzIGNvZGUgb24gdGhlIHNpbmsgcGFkIHdoaWNoIGlzIHRoZSBzb3Vy
Y2UKZm9yIHRoZSAvZGV2L3ZpZGVvIyBjYXB0dXJlIG5vZGUgaXMgdXNlcnNwYWNlJ3MgcmVz
cG9uc2liaWxpdHkuCgpBbHNvIHNlZToKaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRt
bC9sYXRlc3QvdXNlcnNwYWNlLWFwaS9tZWRpYS92NGwvdmlkaW9jLWVudW0tZm10Lmh0bWwK
IlJlZ2FyZGxlc3Mgb2YgdGhlIHZhbHVlIG9mIHRoZSBtYnVzX2NvZGUgZmllbGQsIHRoZSBl
bnVtZXJhdGVkIGltYWdlCiBmb3JtYXRzIHNoYWxsIG5vdCBkZXBlbmQgb24gdGhlIGFjdGl2
ZSBjb25maWd1cmF0aW9uIG9mIHRoZSB2aWRlbwogZGV2aWNlIG9yIGRldmljZSBwaXBlbGlu
ZS4iCgpOb3RlIGFzIGZvciB0aGUgc291cmNlLXBhZCBmZWVkaW5nIGludG8gdGhlIHNpbmst
cGFkIGxpbmluZyB1cCBmbXQgLwptYnVzLWNvZGUgd2lzZSwgdGhpcyBpcyBhbHNvIHVzZXJz
cGFjZSdzIHJlc3BvbnNpYmlsaXR5IGFuZCBzaG91bGQgYmUKY2hlY2tlZCBieSBjYWxsaW5n
IG1lZGlhX3BpcGVsaW5lX3N0YXJ0KCkgYXQgc3RyZWFtLW9uIHRpbWUuCgpTaWduZWQtb2Zm
LWJ5OiBIYW5zIGRlIEdvZWRlIDxqb2hhbm5lcy5nb2VkZUBvc3MucXVhbGNvbW0uY29tPgot
LS0KIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcWNvbS9jYW1zcy9jYW1zcy1pc3Atb3BlLmMg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3Fjb20vY2Ftc3MvY2Ftc3Mt
aXNwLW9wZS5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9xY29tL2NhbXNzL2NhbXNzLWlz
cC1vcGUuYwppbmRleCAxZmViZTNlNzQxN2YuLjQ5NWQ0YjBiMTAxZiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9xY29tL2NhbXNzL2NhbXNzLWlzcC1vcGUuYworKysg
Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3Fjb20vY2Ftc3MvY2Ftc3MtaXNwLW9wZS5jCkBA
IC0xODAwLDcgKzE4MDAsNyBAQCBzdGF0aWMgaW50IG9wZV9lbnVtX2ZtdF92aWRfY2FwKHN0
cnVjdCBmaWxlICpmaWxlLCB2b2lkICpwcml2LCBzdHJ1Y3QgdjRsMl9mbXRkZQogCXVuc2ln
bmVkIGludCBpLCBuID0gMDsKIAogCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKG9wZV9v
dXRwdXRfZm10cyk7IGkrKykgewotCQlpZiAob3BlX291dHB1dF9mbXRzW2ldLm1idXNfY29k
ZSAhPSBjdHgtPnByb2NfbWJ1c19jb2RlKQorCQlpZiAoZi0+bWJ1c19jb2RlICYmIG9wZV9v
dXRwdXRfZm10c1tpXS5tYnVzX2NvZGUgIT0gZi0+bWJ1c19jb2RlKQogCQkJY29udGludWU7
CiAJCWlmIChuKysgPT0gZi0+aW5kZXgpIHsKIAkJCWYtPnBpeGVsZm9ybWF0ID0gb3BlX291
dHB1dF9mbXRzW2ldLmZvdXJjYzsKLS0gCjIuNTQuMAoK

--------------3AmKf01MW2hv0Vhzmru0T8mx--

