Return-Path: <linux-media+bounces-58046-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNgCFUpD0Gk45QYAu9opvQ
	(envelope-from <linux-media+bounces-58046-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Apr 2026 00:46:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E68F6398D61
	for <lists+linux-media@lfdr.de>; Sat, 04 Apr 2026 00:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 283723008264
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 22:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94E6736165B;
	Fri,  3 Apr 2026 22:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZMx5Nrhs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JDsPMCcn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7EE30B51D
	for <linux-media@vger.kernel.org>; Fri,  3 Apr 2026 22:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775256391; cv=none; b=qTffAcVsWf4pCa9Kl+Tez8S/hrlm8IT/u/rELNM6htlSpw304YzLwhMObQ3tDRT0RAuQUJsYCeOon/abGVCd1VVJ81IvsUXmaswqnJFwjceZo7pj4r2/g/om2zoue5nqtJUn4zXAmIuH/e0asm2Qh5YLhRdQHgVIHPvWEppUoAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775256391; c=relaxed/simple;
	bh=ZUZX9u7faTLUdSbiTG7COPkxbBLbnN2HOrjOhvY2uH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dO7zGYIFrGt4D0mZ26aqHCKzUPArtQL5RuMnqgHsZ5UYb3LX3MJQwKDPwy1+RLWzBTYekxMjyiGmCxCHKd93jwyhZfvOwGBccRijVdy8RH4qE8zgo7DXYex+T4bgxbUBp8vF8WHmhJBileWFunuXPPT3axPmKmP9iyabnU+9PRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZMx5Nrhs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JDsPMCcn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633LD2OQ3803282
	for <linux-media@vger.kernel.org>; Fri, 3 Apr 2026 22:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zv9vOkJ9P1gIHigUvKKjrH3M
	x5Ul7I4ediYEdltY4KU=; b=ZMx5Nrhs8cahlUxZ1JG96IFj4/rPBGHhcUxtjRos
	auBcmEVl1kWmOlkm5f/m+EigdLL1hD2CFGoc6N8FsKYDmWj8I57lr9jAZhtEHYjU
	TV8J9Ji98H7+577UmV219YvQmjmH0mnYcUIMtgaKfV3wmxjVKB4QP5ndnfT1BWUv
	ufrq7CsByRdenfHkUz+APlgncHCECjmos9POdNxmHNhT8LuSoLMH5xSKKx60OOfe
	U2oR5TpuDZyA3kBCPHhnRKVV1oc3Ql0+Hx9kvbM3wwxRF+LExUhEIeVPArkFhKFd
	M4p4CGCSqjp1bRx0jxCYfzImhvlAV6tFaCGJwSSC3uTZXA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dac9f9tfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 03 Apr 2026 22:46:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b802961ecso30377621cf.1
        for <linux-media@vger.kernel.org>; Fri, 03 Apr 2026 15:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775256388; x=1775861188; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zv9vOkJ9P1gIHigUvKKjrH3Mx5Ul7I4ediYEdltY4KU=;
        b=JDsPMCcnNkXrE9cfEexlwHrKn7+PFoH+Wwk79yoYCvxBF6QCSf1AZdcBCFBZKDhuS+
         hrv8I5/+DNvttpgDKWiC0KmEMlQPnPktTvoVuqr7GAUUR6erp2DIkx1DwrSUl3BW6ncZ
         nTjSow4bNGErdkNP9bXVPy5KIzlB5deSNSPulAg+g3LAgW9ANyLJtPBFwUEf3r9DOvak
         uEwWbfE/ODQMk+PaEwx/x0wPejp4HHZzyIbX2tOxfT2WnTKXN6yqDvdowAdqfdnmu6bQ
         umQeaCaVsHE81QulfNIgRML6MNw/OCcvENNh9Wi7BZd8Nkzc4IYxfOG8WX0ce0Hx6iZJ
         GkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775256388; x=1775861188;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zv9vOkJ9P1gIHigUvKKjrH3Mx5Ul7I4ediYEdltY4KU=;
        b=U6hT1aCgazBA4ueKmt0ZVb4wFO8NpeeliTFF/SjOqgeb+914ckiZTT8h8J1jDuFmVC
         /1Jm37R6HDwEKUwdjHC1DVlgVf5Rz5H8XjdkwmxUv0IizQx0H+zf98p2pYBrHTjgscc5
         DreFjikiDdGAAq4PiDoqhV5cvf5YwYto8s/Wd8H1wk2Q/DzmI21OkxgKT7vJpkZ8E3FZ
         EICKA8uzadM4arIXnMNhp4ahHK1+UpEr1hOIa0ShJug/Wu10tVSvv1vLkWDa7KHSFlY7
         jVJN4uktT4ZjkUGzJ/fdYD8mqRj2FWVuhgipbRJ0afwNMxKWQy16RpNhn4kYDgE3mcIc
         OWBw==
X-Forwarded-Encrypted: i=1; AJvYcCXVqCux1lD0R5V9X7F1sjuu25Hl4UIKm1XXx8E4y+aCmgA8GcKj4tFYY9ZGUYww9Yf3te54l+aVzjfJqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1c81q4vgSZtLCg0l4CmKkW3cyQw96X4sQLQQ/hNsO/gyy93l/
	qrr/wAbLAn0D50vUYB2Kqeb+kavrvXJvIDdan+z+t53Vz3DGJPy0xskmsRHTZmXOP0a8o0Qt0b5
	k8ooN+6NoxgssYLltr0zkxa9HsGQ10kSlzq3n/58/nOlSv+LlO02zHqEEtJQ636U6kw==
X-Gm-Gg: AeBDiesX1Mvf8YAnErvCarAa/7F9zBPrY+QVWTI6KJ4097YIZ7wWncZNJv61WHNFDnA
	ckgGghCmD3lavMOyTIaEEM2Oq6C1vR50GHmOzvizPbsjAIemLE9OfvxwTBR13Anwr0WwdkwNLq+
	Z+go17KSCO/DmZvocSRuXmQ5uk+TbwCUMMwtXiKo3EA0W0t9eo5dI8TbGuxhn3sY/JiS/FNVd6Q
	R+rYXDVyfwewHGb4jHo6zZ+LPEU3A+IJd0PjnYsTJrAszGSPaCtxm4YhTjzSVnn7HqgtGdLE+P2
	wje5RYiTlF/BhkcPdVdKzDnD4dC/S4GHXoYApuhLMduIndAkCSJPzgoYELgGR6f8uH0Qa8qn4bi
	V2NewICD7SGYHRevNiWDRAOW43ctGApe7HX00ilUYZnNjNMqWLkiMX800EkF/lsgV1Lr03sFvnj
	SrtsCvZ/yFdxmCPURF9NDD/eukFVj+Fga/Gp0=
X-Received: by 2002:ac8:6147:0:20b0:50b:893f:7d93 with SMTP id d75a77b69052e-50d627725e2mr57220551cf.2.1775256388051;
        Fri, 03 Apr 2026 15:46:28 -0700 (PDT)
X-Received: by 2002:ac8:6147:0:20b0:50b:893f:7d93 with SMTP id d75a77b69052e-50d627725e2mr57220311cf.2.1775256387582;
        Fri, 03 Apr 2026 15:46:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c9534asm1717811e87.9.2026.04.03.15.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 15:46:24 -0700 (PDT)
Date: Sat, 4 Apr 2026 01:46:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 0/6] media: iris: enable SM8350 and SC8280XP support
Message-ID: <kg2sflnuslexbch5lycyl3n2ry72lfagqvtjald5qo4j5jeql3@tryqo6th2wzy>
References: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
 <c7094fbc-deb7-4d76-ad97-9c56b81c7a71@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7094fbc-deb7-4d76-ad97-9c56b81c7a71@oss.qualcomm.com>
X-Proofpoint-GUID: OUknU239wPmDN9wdhT9BDr6Kd1CW3ir0
X-Proofpoint-ORIG-GUID: OUknU239wPmDN9wdhT9BDr6Kd1CW3ir0
X-Authority-Analysis: v=2.4 cv=BO++bVQG c=1 sm=1 tr=0 ts=69d04345 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=F3jmmAGWxxlI1FSMdasA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDIwNCBTYWx0ZWRfX84dK1fHIOdK9
 y9ioyqT2i00BG5atkiDwFVwEPBfDAik1mfPWu9Vo3ny1Q+NvmzQ6ihdrjQhXMNR5YSuYy65vsdw
 HHKE++dzTR/t3qcSQ7qR7qx6wVrGT1WzDIRtVt66ssVCJxG4gloep5xiuIQ59nEnTtI7vvOsAV0
 E3vlW0nSX4S8dtt6KUfda+33Z7bqHkKkdvYmHuFJ8oe6i42043Z9KYddkQD7yw9PUZkWISCcZcp
 oD7ez7AiQEg+4+xXYqz8uK1I5/fHzXeKD4yO2xZQLWHTZTyk5NdePLNqoxohd6nTBHRD1mDpo1t
 2R0G7lfe4bBqGiUHAc6gT7Sh9vGo1aOut2wo4isBUryOfpb4JBWII9wjeZ8pfi9vYOs8UwnyJOA
 7NaozIyU2uMwc2XUWB0FK/vNpp6RdGsI9lgDFspT68zy1ev6QRm+s3sA4KNO7lrkkbw8CmuWULM
 Goa5ib9kvTdduYkWImQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030204
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58046-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E68F6398D61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 12:51:30AM +0530, Vikash Garodia wrote:
> 
> On 3/12/2026 8:44 PM, Dmitry Baryshkov wrote:
> > In order to enable wider testing of the Iris driver on the HFI Gen1
> > platforms enable support for Qualcomm SM8350 and SC8280XP platforms.
> > 
> > Note, this has been tested only with the Iris driver. Venus driver fails
> > to boot the Iris core on SM8350 pointing out the UC_REGION error.
> > 
> > Note, the firmware for SM8250 isn't compatible with SM8350 (nor with
> > SC8280XP). Please use corresponding firmware, extracted from the Windows
> > / Android data.
> > 
> > On SM8350 with the Iris driver:
> > 
> 
> could you list the failing cases and compare the result with sm8250 ?

Failing on SM8350, but not on SM8250 (note, on SM8350 they also work
with FFmpeg, but fail with Gstreamer).

- AMP_E_Hisilicon_3
- AMP_F_Hisilicon_3
- DELTAQP_A_BRCM_4
- SAODBLK_A_MainConcept_4
- TILES_A_Cisco_2
- VPSSPSPPS_A_MainConcept_1 (this one timeouts with ffmpeg on both
  SM8250 and SM 8350 and fails with Gstreamer on SM8350)

- vp90-2-14-resize-10frames-fp-tiles-8-4-2-1.webm
- vp90-2-14-resize-fp-tiles-8-16.webm
- vp90-2-22-svc_1280x720_1.webm (works with ffmpeg, fails with
  Gstreamer)


-- 
With best wishes
Dmitry

