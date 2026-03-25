Return-Path: <linux-media+bounces-56964-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCROElqsw2nAtAQAu9opvQ
	(envelope-from <linux-media+bounces-56964-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 10:35:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EA73224BD
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 10:35:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2B5D430346D4
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 09:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 639C8359A8C;
	Wed, 25 Mar 2026 09:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QvawEJ5Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YQjwTTI/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E76347535
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 09:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774431059; cv=none; b=H46nR7BZ3de6FW8+Oo/JVQTNBUHlQHNCISZBbHnSbuCOsKoYlTjmUBx4dldkRWTjv4Sz+TWrz38yQP6SsViTGdusQN+t4me5VyATMyp6avz5SOGcc+/xyQcocI26uGug4YHecjIselIXL6zCiQCWqIkMUIDFXMkVqoAXrJHPp90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774431059; c=relaxed/simple;
	bh=kl7xPW9zd45V1YnWgHNJd6LjUZUW+y4mNo8sc58jbac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hNIlNyGxJ/X6V15man8vxw26jqVXTsblS2uSPIOuCCUqkp5qcFLfF2MSJ/GCZV3mEaI4RK+2BzGSnSbbA4NFPNqhRQvr9jnuLBsG0IXIZRtBfp3Ev9MIF3hW2gjpI4juiO/ZLbzUCjlPlPKoXFq1fqUhtemMnSv4VrRmIsMhBJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QvawEJ5Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YQjwTTI/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P5QhpU1862785
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 09:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PK7yYDGVe2d9199JIVWvQ56RE/9bId5CfK806NVhSrk=; b=QvawEJ5Zn8SGlLVx
	UVsfF9I9TfuxISloti/l+7/Sjk2cCZZwQJV+kNICVjfiwom/+smKpgsXAqJPz0CT
	Mh2e92XBHQ5e6XDKXjVadsC4nx9RDDb11296UhWSzebX3E0+rFhY+vEmkPI4YQAh
	N4jln+45PizSbYgRYUM3vhHgQe03w5ab5Z9n4B9xi4mSx5TwLxLDmBOEOGMOijdb
	l+T4/msnvvF/NJqjMHp0g84DkUoh6VMll4NbkpSPR0cab8P8gsdXOnx1WvzvkzuJ
	o+Z3awRHo9Jwdj6MI5tKpBoe5w4FRkq04WEaRUQFWXHLN1xfUGC4DscM87kNsbaZ
	DcNG3w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40rategm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 09:30:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b27636835so55662831cf.3
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 02:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774431057; x=1775035857; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PK7yYDGVe2d9199JIVWvQ56RE/9bId5CfK806NVhSrk=;
        b=YQjwTTI/dY55imLRGqVaEl27XJR+IqqLt6d/IbFRvuOuDH8wrYoU3PtJZCb50ZXwzQ
         N4B3+c1GnC3jrJWxw1Y94Ij5SKEb1Dcrn/xmnOu1EdBnvaEkP+JiFe09Punotjs9P4qT
         4hQ6ESDFK/MkWWiz2ivdKsETDzbsg0tsorGW3zwZK65fbLj6vlg7Lnp4EjU36AUqB2mu
         706Ym2RpyviNe26X6LJ+lBCLwWUybHzt0sfhoFKzNRRpkJ64/BTaFlc79dxkTrXvKBo2
         vNWvVJbxAdY5VB8S31jb43tQNsCL3f3xxzYCP2HOrt0C1DCIPOm1wqlgG70G3dvEq1uV
         o98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774431057; x=1775035857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PK7yYDGVe2d9199JIVWvQ56RE/9bId5CfK806NVhSrk=;
        b=CqKvxGaOejDxtpT0CbY1bdwqLLWQadenVsRLXhwTV3dnOMJuf+/67ZJhakKJv7W/kO
         ZBqB+126FP0awLlSXsNhwajg9l9B9tlpHwPw1SnxUmWiB/u44jAKw0S5/M1kP65Jp1X7
         32e2pbv16tX4+xyosmk498V2H4U3dRC/+Q9n/ioHR/7udm5LFkkSw00oKK51UBuWikQR
         YvLAfOJAH0maMry7TphkxKaKSqd68XGKO2nky79pBEuU+XyjfzCNtMDxHBpgIsK1oaLk
         Y4Mvf4cyohGEI3fd3D1T5ysUKcOKfMFQndtSY7FcFj45BPVDhOTqybgg2XJ9gdIF26Ea
         a0fg==
X-Forwarded-Encrypted: i=1; AJvYcCW7DoIKlqqlqkM/H3R+GZQgFAfVaZDI0H+v7abVnB7v1nKJi0dZ11F2qtbX4nLnPwrMKG8MzxtrBCyz3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZTx1qxkXC7NEcZjexFDxdK8ag8etIN7cqyD+k/zaKlmPWERrp
	3mdfvYbEmJejwjo2tmCZcF9D13Pixse2+uVBvjZYUpGKpgZuQHG8Um5PNl+7TZwhjv9c2pw8egW
	SyxNUeEoDA1esCkEpuuXo+oNesa5ja0COMESLqMhMMZZMmqoDUJjVN8feFabPmbbp2A==
X-Gm-Gg: ATEYQzzaLPZviMu6gI8PsewXsrx9eU19HPDW3pOFlf89MUsdi/FsLCIjBFGztnuR2GA
	Qz6wUxhPpWLH5zsTX1fObqFFGP5eqZ2xcBrlb7Qfc81swlGgV3J8sAk7lFvA2yUQncSdfnnZor0
	MHVxp8xKzoLrOdrB9dWPFqM/5db1FgWJJqpvVhgCsOX6/qffifSaLDZ6aKdvmOuuf1+fJVfpteG
	0ueHCUDNlQMFuUQ/mt0GtQcIRoom3+V1/s+QGI5jWMIiVCQFMk0vyG+92gd8wnecMsSDbbCFNBf
	5F3jAbMimYkiVmeFm9n9rDTIti0moO+cHY50Tf+99GSr7s40lbRSPwdrSN+dOrZjmdTahUjNfcr
	JacF3n8Y3ZuE5oIFjiz04dWDe4gU33UgQRp5wFVkMEtAoxxmBanZVeYl/dKVSAXez+69YvhCK+z
	DtSFw=
X-Received: by 2002:a05:622a:5b06:b0:50b:51eb:c355 with SMTP id d75a77b69052e-50b80e73582mr24824731cf.9.1774431056693;
        Wed, 25 Mar 2026 02:30:56 -0700 (PDT)
X-Received: by 2002:a05:622a:5b06:b0:50b:51eb:c355 with SMTP id d75a77b69052e-50b80e73582mr24824321cf.9.1774431056166;
        Wed, 25 Mar 2026 02:30:56 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f43a65sm754692866b.7.2026.03.25.02.30.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 02:30:54 -0700 (PDT)
Message-ID: <4920d196-9002-47fa-ae92-c6f14e99c958@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 10:30:52 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
To: Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        johannes.goede@oss.qualcomm.com, mchehab@kernel.org
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <m61yNNvSrw6AIq7_-g2h7VQLmGJ_5iCLg5JTlfQDcL5LlBq37ifAeXw-K3AlRBck5Mb4uVQq0pzeBNAybQNk4w==@protonmail.internalid>
 <20260323125824.211615-3-loic.poulain@oss.qualcomm.com>
 <1ba54ec0-be51-4694-a79b-f272e76303d2@kernel.org>
 <X-Lw_zi1o015-V1Cv4dY_ik6SfTB8TTcLmn1l-Ta7UviYTJ6gwMBn4B4ulYwjd_Aetul5xUt0T6ln9E-Hl5h4g==@protonmail.internalid>
 <CAFEp6-3ziXJTYADOFj--rZL5TumroXuW+=SnUQ9XakRxHT-ypg@mail.gmail.com>
 <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Jvr8bc4C c=1 sm=1 tr=0 ts=69c3ab51 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=MAgzBORBeBVPlHHXK98A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 5jlxPCigocCb_0YAWY-7l3SwyAtXak-e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA2NyBTYWx0ZWRfX1jtqQfIJasIX
 NMy2PDW4JzV+zYK4D87sfzK8cJLVaRtv4W1iPNKPJLJjV5gCK6BsAxOioZNjjhZSMRow+EIg4U8
 ARieik7vQ2cmLA+Ru6o0FXvj9JjaNxc+HpOYAljVoV7qJanEo8oN05Tj072/QrN/IVtn7rwJ0bD
 dLYr6DOT7VJ7ykn+hoDhol0T3NVjbjJqBuy3ayqV0aTmKO2P1aEeY7G+7I+Qz7BnpmjfBSm1d9O
 3gt89eOMzrEH1VemOnw9dA1rvklTVKnRJ1F0OUeCZHF2ub1hrmcBwL1EHzELda7tMsw01no7yFU
 hgkYdTfW5SOX4xAwSwQop12JsHul157W+ACqeygsjl6PDGI26jZYNoQe+/fFI+NuxeHYwW6/7ec
 VPtXTAQ29emrUmrORMH6fY3qxjIGvbRKDfqtU8r+D+WHLw18Soq6YwvPVpzuaIchDkKUnCz2RhF
 ezWZSPQzNzYVTgHpOnQ==
X-Proofpoint-GUID: 5jlxPCigocCb_0YAWY-7l3SwyAtXak-e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250067
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-56964-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 51EA73224BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/26 12:00 PM, Bryan O'Donoghue wrote:
> On 23/03/2026 15:31, Loic Poulain wrote:

[...]


>>> So - this is where the CDM should be used - so that you don't have to do
>>> all of these MMIO writes inside of your ISR.
>> Indeed, and that also the reason stripes are computed ahead of time,
>> so that they can be further 'queued' in a CDM.
>>
>>> Is that and additional step after the RFC ?
>> The current implementation (without CDM) already provides good results
>> and performance, so CDM can be viewed as a future enhancement.
> 
> That's true but then the number of MMIO writes per ISR is pretty small right now. You have about 50 writes here.
> 
>> As far as I understand, CDM could also be implemented in a generic way
>> within CAMSS, since other CAMSS blocks make use of CDM as well.
>> This is something we should discuss further.
> My concern is even conservatively if each module adds another 10 ? writes by the time we get to denoising, sharpening, lens shade correction, those writes could easily look more like 100.
> 
> What user-space should submit is well documented data-structures which then get translated into CDM buffers by the OPE and IFE for the various bits of the pipeline.

Would simply switching to a threaded irq handler resolve this?

Konrad

