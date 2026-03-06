Return-Path: <linux-media+bounces-54833-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLIAIpoxq2n2agEAu9opvQ
	(envelope-from <linux-media+bounces-54833-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 20:57:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E31F62274C7
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 20:57:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F1BB305C2A6
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 19:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D8994279E9;
	Fri,  6 Mar 2026 19:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KhWM456f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ID2CJWGK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70AF43635F
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 19:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772827027; cv=pass; b=PRW7X680w/jaP05KPEWC7VFTDaLmT5B6VXFoMmF+dNtQGvaPAZfAyY09MQNrft/CRPAzAaoDjlzuoW6KXxijXB63r/HdPB85fOlnJX+Wxyg1Vtkyi16VjfEl6Eqc4bJExfdKGYAOKjqQTlOVxUHuL8TuN5KThmIEyJGELr7cdFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772827027; c=relaxed/simple;
	bh=F1GXEAKFM9HW+kf+pB+r//7wuIewmU4KkClEAaN8ggw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vaqs5b75WmluFxrm85/qqU1LR4oyzVD9NxE8qodxGqdp+WykcGYb9mQwM70QZB1x+EsViuZHmY+7OOq3eHkE5NXBwPJQ027rS9NU6snuT0ZOucp1rbzggpZCZMfoWCrkiRQtCfcewqQocHeP/fIeGQz78xls/j5yh+7sXonDpls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KhWM456f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ID2CJWGK; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H1nkt707442
	for <linux-media@vger.kernel.org>; Fri, 6 Mar 2026 19:57:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HJm5CTn9K0EbKcz8SL+/IOSRZ5jZauflQp6fYppVzZs=; b=KhWM456fIFWD89ie
	ah+ZMSosj07JXMeCh80dSQFGNxUFgJpUGYmdchgW0YOESp/GYbrcHa+ztv9MGe8r
	WL5ubHBLptN5DfWPdCkQK73yJwCAtDqo5CfRmdmXWHXF8zzebBn7hBLNFJ+BEpui
	LOBKgZfTWwBPRuGyafufLoeDZV2LtqvAbNPEuWNeEfrxyDvKd5w5oV7/VReTKvaP
	4M1T8tuVs4FlOBGN+ERRA8S4/dIA9RUlM39CXqubbk93rUIoT7FgZzYZTnZ/4WnL
	DYNLsCg1issMNow6jFOJ7gqpSQvsS5gzvZcstxF/YK/rI5xpykqHsXhRmbB63knp
	h+2Xiw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqrukau2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 19:57:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd722c1a69so239833985a.0
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 11:57:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772827024; cv=none;
        d=google.com; s=arc-20240605;
        b=kplwI9DJJKMxIpz4FhysYb3DLG4BzifHZ5VCL9Gc0L1V+yadiDrXADcPf5HNS0czkY
         w+QAf8DOkPqGn6nkNs1J7+q6o/pN23vDuiZU+uakBnvOtQQUyFeUZ0U5hgcj6M1m+XCb
         cRbXOUZB3zQRdhfs/xnLkb/Av49lvVWJIS4erGB23ZeDZIC+lZt2e/y9nDVc0iveBstv
         zqDqi8RJTCPIuWHg3WLv2m3I1WxxR7BNYRaHSMWg1XozeRiB9wAe/QX6LsuEZJi5Q83j
         iU1o1PedIJ478IkIVzNq08x15TS4DUMvjsCiZ7HWrCASOj/Hc8zYaFyAZQjsuvtBJE5u
         YVjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HJm5CTn9K0EbKcz8SL+/IOSRZ5jZauflQp6fYppVzZs=;
        fh=hrdtHt5oG0jYMB9hworfQqGktXiQmIOmbYGDfKXbK4Q=;
        b=IiPt60rSbu6V4jNmJJYzYagUXcQ3CeR3hIj98Nia3Z6JoZ16ssyjJtf03EZV8DL4hM
         1lluIU/KFhNaq2uuLIbp8fJVMNqjiox34GswCi7bo5DUcDGh5UIsFkhYQZNHxW+SobN9
         7IrfXZJ3e+ij61qXh/Z3KVfN3RnJo1SA8VOS5pViU1Ek44OdLJwRq4RS4NmlnYdMJdyn
         OAF/vfgfFhB2B2b5b2MZ+/x8tEk6m4b4aeCM7K5Ar0cYSaqeT5kWPc3tYRYoIhf516z1
         Sj6b04wRSnt+Gw1s7Tn1+/r0+Vm3D6hexngXE/+PPxcHJA7YkaRVoXWzEh2HPM6+shaZ
         ll/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772827024; x=1773431824; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJm5CTn9K0EbKcz8SL+/IOSRZ5jZauflQp6fYppVzZs=;
        b=ID2CJWGKMpFwCF/jfSlqkZkCvRjHX5SH7En1OpUdr82qYA2MiTceU9oLVvsAt8fcAF
         VEm0abw8XoioNekNnkbjAlxNsWk7PVNm1xMNS2XKGYy42bezE/bjIfoMjBUC28cEFrFY
         S11b9x5VdR71NLPjNwlvVj5fFw3LAOgyo6Bt+xWhoyuWTYk8QSXdE8xiHR5w2vY6+qBB
         Hbv6CMWqKk6mFxeR2Z1Gl19vQSX7wuYK1PLmB3aYoXO1ArMBWNdTYvL5EluL4CacjRNk
         /vziLGb05gbPCHA3yuYE3rXv4LMtu9xlW7ShJnIiT+pAdth9kKKdc/l/BqoHQ1JnbRIh
         1PfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772827024; x=1773431824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HJm5CTn9K0EbKcz8SL+/IOSRZ5jZauflQp6fYppVzZs=;
        b=G6lwIbnszihUxuB+w2vupnAU7fNiWgacZNQDrlvOSrxI51sUCDdmxJOwKVT23/sD+S
         jPxgSMb8okKQH5MgQmRm0zQ1nU++L8dK8IbXKdAlnvl5sCOTpGxUdqFgoTCmEj6Nkylk
         iMr7VZZ8muJnzkwHiyLOWpOhYa4jLJOpU9f4Na7rQHbwVMVh1HpT+tUvANG3PntkjpqU
         gA9blN+8NX424RM+h6su+hFl38EVZCAEgwoLTHB8XQl0+dvfMAUugZHVc6VS4DdqRDMv
         S8hjYNKzmUIIGviHdk3Px4/QABulMyWIhQC1dPqk8Lk0IpDjs7sKO+LLwbezJhumbYX3
         3ZaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxE1h8YlwVAZutn/hEEVL23qDW6rSUPoBmQgkyOICXW/CA9VqTpu2qh0IJMjQ3Wsi3qLu1IuixC+50Ww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+SJpT82ALXvW6wfaq0TR9fjLjJi/QBFbTzN/Ep5iH6bKt2kza
	M61AWQVyYvwvMmER+YQLHbnM6j33JcMXvf1Kr7Z3TjL9jLdqS3BRj/mumY12vxcsiA1WATH/FLh
	KG5EFGJQOI99yCtMZEZB74qnTWnXGidbSb93NSg+0qF89Lyxmi94yEoeQlJaBM9xLHxYEtGhQjx
	BiYPxGeaXDRmf+GJxxUakRmPA2j6jeYU79QVQrce2s
X-Gm-Gg: ATEYQzzdqXM4asJmNllXdMSCJsdL4KqlwFbX8yV0cckBjpEGLLZjEG/DHLtCjTAMn5/
	wHlg+8uMInOnTC28Rmxz4bnvdE4uQqu7zMCgxP9egDp2IosECDFdL7XtUppeESdWq+sY54ZU1O2
	fnN4v5qwqSxZ/G1iAsLjPVN4FtZ7cttyoZ/OO5qmSIXS5SfucpuGdIo+BBtcYbz3eLbDqscupoC
	MgV1JrJdcY6n3IVDSUY1lU3d2u3L68wMS4BGD4=
X-Received: by 2002:a05:620a:199b:b0:8c8:82a1:11bf with SMTP id af79cd13be357-8cd6d336123mr425693785a.2.1772827024211;
        Fri, 06 Mar 2026 11:57:04 -0800 (PST)
X-Received: by 2002:a05:620a:199b:b0:8c8:82a1:11bf with SMTP id
 af79cd13be357-8cd6d336123mr425690485a.2.1772827023804; Fri, 06 Mar 2026
 11:57:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306160006.1513177-1-loic.poulain@oss.qualcomm.com>
 <20260306160006.1513177-2-loic.poulain@oss.qualcomm.com> <273f0a36-599f-43f3-ae88-6c332fcec21c@linaro.org>
In-Reply-To: <273f0a36-599f-43f3-ae88-6c332fcec21c@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 20:56:52 +0100
X-Gm-Features: AaiRm53CDR5xigeVlLB_GfOidpJ32PIHvo34yoPy5FfuD4m0MAQ9A_TaJlqBwtc
Message-ID: <CAFEp6-19iFC3=mKj0GsyaUmLfa7MSp22hLH2q4UJn+aZGFACzQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: camss: Add per-format BPL alignment helper
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: vladimir.zapolskiy@linaro.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE4OSBTYWx0ZWRfX7TZkO1xYCW1Q
 xnBL6LbYLNijbRPLH6sMBdEV4Fh6yThLpt4O6Icw7G9g6IDxl59+mZLBJfqvBejBSsttEfFCUm3
 4CEo6XY5TvfVt1/OEwNZyhX3ifGPh/Hv/JcLpphJrSPcgyOcF8JHVHTTvXXy/PY7p4c31fvfbUz
 IHQwzXuusWQEoTViY8IL6WMxhib20m+5ncgEsqwFq1cHVjnh0Ow2bwshcUezNdZuvEc5jsW9IQf
 AgNDTZN4vmwM8pn9mV50XeeR/nhyxvs0H1hKX8xueCyiQJ5Fy54AhuHnpviYAN8Y7jK+eCqxlk1
 WtIgV7qbhrJ05CSjpfOMYXjXNFi+u5JfdbRc1O7VNiCtngAqhBXUnj4Q7jF9GB/hxVXIbuaEUo6
 mm+Aigt8VGOCaPo+gdIO8wfuU/Vi2tyoaZGZrOVeOXCLTI69+2elyJ5kV9eDi/OteMLeRp88ar3
 t8ZFSN7+shu48E66zpQ==
X-Proofpoint-ORIG-GUID: H5HbFMb16ZXfp2beWAxFM7kWeukcQeht
X-Authority-Analysis: v=2.4 cv=DvZbOW/+ c=1 sm=1 tr=0 ts=69ab3190 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8 a=yoG-TFf7P2EgAD0aYroA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: H5HbFMb16ZXfp2beWAxFM7kWeukcQeht
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060189
X-Rspamd-Queue-Id: E31F62274C7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54833-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.963];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,linaro.org:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Fri, Mar 6, 2026 at 7:00=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 06/03/2026 16:00, Loic Poulain wrote:
> > +     default:
> > +             WARN(1, "Unsupported format/bpp (%u)", format->mbus_bpp);
> > +     }
> > +
> > +     return 1;
>
> An error should return an error not a default.
>
> -ENONOTSUPP, -EINVAL, -ENOWAYDUDE something to indicate failure.

Yes, here we return a 1=E2=80=91byte default alignment with a warning as a
best=E2=80=91effort guess. However, it would be indeed safer to return an
error and let the caller handle it.

Regards,
Loic

