Return-Path: <linux-media+bounces-55600-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPlaCdDFs2kqawAAu9opvQ
	(envelope-from <linux-media+bounces-55600-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:07:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D86427F500
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:07:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A17AD301A9EE
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 08:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9867E366575;
	Fri, 13 Mar 2026 08:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kn0+/3a3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YTjdqXFF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCBF364EBE
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 08:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773389255; cv=none; b=qaEOHS9pGTjg1LYQhT4aoTFfCQh/xTpFuLxpVgLti1sEqgnHSBcXaagpi9Xt2LOok6Fz5j9wMfgwOcmrI24PcRKw45iR+FZCN2EfaAEpAJ3LBxvMZdawpSZtGaIAkRShQEZf/fQNw4nWsTPMBEZyfbYb1of4Qb3Giakvsy0xKkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773389255; c=relaxed/simple;
	bh=GnByRfzn7HZP9uL9oooj13kpLHW7L6/4dF6yOZASX0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tdpozSDJB6HhDKGX3deiTTSKABZ98rfJYmIhkzcPKJD7P+rZdBxKCtBHGjv817D9tR4VesouR+lhkPuw2rdf+5CBMowIWY5QF8H/82JffaKa7xFSXN0UFpgnWHFBpSBjWDAo7SNGeQBzE/j7g53XpXGRWoB3FwA8SHsw9QQUlEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kn0+/3a3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YTjdqXFF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5u2213845045
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 08:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XfBcW3tYoUY8UPrMDwc3QH+qdRNHuMpQoMd6geuaKL0=; b=kn0+/3a3fuLZ7Ejb
	FT4PRy+M5x6dEIM3Wc8Z9Bat/+s+bVSYjsdqb3CmbJTwVxwZTeVT4TI0laDBIVzO
	z6uAfDZcRtUSGAXn1hFvfyT+nkeS6FmUHsiPMMpXSO9Supl6yUN3r+KHj5pbJFp5
	qdy/ToqNGSQfQNrEF8d8OLFMOJ3HfMeT3bO2Od4a4nd38uHTRbKqwI088Tdrmcww
	UUx9x3uMg/gpNqHd4uM8WKeibb4+cuFgg8FWkJF6n+QvQ7IqOammrDvtKjXEIO3A
	VvTYP9V6lAmokif8VmQRjsk3OLXY4jJZOtpcOc8JjRg2lGzMJEPgXpJdMBBuLMU/
	7ONoGQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh54w3wf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 08:07:32 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a08e6cd15so82118226d6.1
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 01:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773389252; x=1773994052; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XfBcW3tYoUY8UPrMDwc3QH+qdRNHuMpQoMd6geuaKL0=;
        b=YTjdqXFFZRSAYwtyPID5QSWMT4+rszHaSf3zBRS/zCKQJag3seU+1njFeXxBd6G+z3
         2TLDb5XuH9CIr9ptwEtQoVl4J0elqylwfCkkWNiQQVKHsan3ctqphWEkjwZ5HE6ZQyp3
         tLJCaQZpr6EDRX6ok6u0ZZVerKhDWiUU0KUHDOTg/7XndRDKZn1ZEZ5+pUnku45sV7wp
         XOjg5mp4jVUxm/sOljL4gYwlWvhNwoGhGjl7bRQPStmfCegY6xPcG517Z0EsU2vsScG5
         yiJQ/NTKGInFqh6dA6jMAvvG9qsfo4S36nDEfH8qp6uwDM2MKnwflEffx8fZUUoa+r1D
         94CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773389252; x=1773994052;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XfBcW3tYoUY8UPrMDwc3QH+qdRNHuMpQoMd6geuaKL0=;
        b=V1d0m/1ruobjrCCD/mGo3KfLSoayTfRrteVaDOmQL0pesB2ZJKGRJYmkWZ3n5NcP7p
         h5NUmzXV6murWUjSUxdSFUZs7eFBw94A4jdg2ZNxvMwdthoMq3sNCRgXGjVUZF2fl6aV
         d9DD1fzZGw5xUU9j8y8DuBqcqgKcooWUXj1mjD7Y/noFtrVzfjqc52jG15/BuRtkwf3h
         cAyr+9g9b6aO7F2HYUWyJUXTkosoi4Ycbx1ji7SUhlpGeAvaXwMmHwH/MLFYeF4u5RjX
         +oqiukEFqg4y0zOv6n/abmpiQSMGTBEqcJRP8cdbkN1XWRb+zfJgk9lxi3xA73p/eOJ+
         Cakg==
X-Forwarded-Encrypted: i=1; AJvYcCUYP9OYSrfm+5gzWE0sYvgOVvPAbeen0r7qyvxdf8hJzFcmnAHQMmBr32gXMDzv7+qGqMnuDnUx12YdYg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yys/dOSS5VPZNzKT2QwJDsdgBE6i+M3cz/rGco2ifrWyeI9TBSD
	LGdwIxzy12ZPeaaZJZO1KD529luRFnWjf56mu55kWlYCLD8h6oM/xjVW82LnEuPWa4rK0/nwt2i
	jIn0brUORV9r39O4JaKiTXuFmWPjkk7jdMMlZp/kjfdAZ1NJoX7o+UjMm51xsTPeYbQ==
X-Gm-Gg: ATEYQzwH6ZpKepgO04WswB0FuyX/HLhOpt+MAPeX7z7ZuXktYXv4V7KzaPTL+7pTJKP
	MbUF0n8cJXjWd8ArZSFNlvab5SsrgebJknCw7wCCy65SI2/2NEI5dAEly9ocysl9JJ2WrREQo7R
	MqUlgIwErB6balcM67KXBx8YxAEBJm52P4XvFAECzsUTwfdNdL3CW9BEY7LOh5csSquh6AAet+j
	GcC9p5D1kY1qr8WaKOrDN3QZMxUsjAuqRajUbNfkKuRgQSM6E0WV7WwjlGpMdxe1DsX33rB21T8
	4pUHztb9nZZf3WZF68eGV1T+7oitihYfhcc+dc05UyEhtkksBq+jFl0FU/kYZ1lKPWlp7/xR9D6
	CrvbKNyNZ85jsm8WWDaJjKFrFbb/RO8H/FU9AhyVpojSq7MfqwH4wXgMjhGFwsXKRxA1JlOd3lG
	V4UJnSe8NllPJSRTBNPUG/5BtHIGqa4YJHrzo=
X-Received: by 2002:a05:620a:3186:b0:8cd:a801:cb1f with SMTP id af79cd13be357-8cdb5a88f90mr319925485a.35.1773389251865;
        Fri, 13 Mar 2026 01:07:31 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:8cd:a801:cb1f with SMTP id af79cd13be357-8cdb5a88f90mr319923385a.35.1773389251369;
        Fri, 13 Mar 2026 01:07:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ed6esm12215801fa.23.2026.03.13.01.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 01:07:30 -0700 (PDT)
Date: Fri, 13 Mar 2026 10:07:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/8] media: qcom: iris: split firmware_data from raw
 platform data
Message-ID: <24oq4plyvburuufxs6vt2kt7e3mlwlis7dekszjnxson245amy@muyu5fpohhfu>
References: <20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com>
 <20260313-iris-platform-data-v4-7-14927df4906d@oss.qualcomm.com>
 <726439a7-cf5a-74e6-1768-1bc6fb907ffc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <726439a7-cf5a-74e6-1768-1bc6fb907ffc@oss.qualcomm.com>
X-Proofpoint-GUID: lBQ5WHdaD2x5NzpXlkiuIM8P6CzWSXpm
X-Authority-Analysis: v=2.4 cv=BNG+bVQG c=1 sm=1 tr=0 ts=69b3c5c4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=b3Z81DpSoi8iBI-dQggA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: lBQ5WHdaD2x5NzpXlkiuIM8P6CzWSXpm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA2MyBTYWx0ZWRfX6HSu6Pa5EDg8
 4Rh4Q51GQzOXYahjMFicyjmRmnNk0OnPLjFzsFOCn+SYD2+JAME1EhGr+N7uqRtBvZvtb57XRBH
 GEj6FUxsCifknPt2jr5/s0LQm9WeG9Tt4Z2rgQHooHLKR2ZDK0wVSqUoYCGvMLNQ1LF1aQw6Q+K
 6Aj30tpy+kezZFRs6KvNmmdOlTw5Jh3wud9VVEfivz9lbfhOXNp3Ne+wgrwY4GLtRNDQgWBkhXn
 7wAZO53eznWPZJDnnIZnaBIN1jVqRvZUA4riGFBbS54jvYndHkdOn9hFzG1jQdJtiRc8oivv6lH
 baS9XmF88yFlUuNY/j1wQP3/x6mu3oqqBOiYqv83XRYL+vBnAHJk60dLsECp0yaixLTOBBmaP5i
 lxwKbl0EiH+J7kEN7FAVhEHQ671XOXqs386UiiZMphgsILAxvub26Wfg5oT7h57YgfYvn7mMwv3
 hQnFcVbwLV5bsw5vmaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130063
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55600-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0D86427F500
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 01:19:21PM +0530, Dikshita Agarwal wrote:

I'm sorry, I've refreshed the series before receiving this email. I will
send new iteration after settling the discussion here.

> On 3/13/2026 9:00 AM, Dmitry Baryshkov wrote:
> > Having firmware-related fields in platform data results in the tying
> > platform data to the HFI firmware data rather than the actual hardware.
> > For example, SM8450 uses Gen2 firmware, so currently its platform data
> > should be placed next to the other gen2 platforms, although it has the
> > VPU2.0 core, similar to the one found on SM8250 and SC7280 and so the
> > hardware-specific platform data is also close to those devices.
> > 
> > Split firmware data to a separate struct, separating hardware-related
> > data from the firmware interfaces.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/iris/iris_buffer.c     |  84 +++----
> >  drivers/media/platform/qcom/iris/iris_core.h       |   1 +
> >  drivers/media/platform/qcom/iris/iris_ctrls.c      |   8 +-
> >  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  10 +-
> >  .../platform/qcom/iris/iris_hfi_gen2_command.c     |  66 ++---
> >  .../platform/qcom/iris/iris_platform_common.h      |  79 +++---
> >  .../media/platform/qcom/iris/iris_platform_gen1.c  |  68 +++---
> >  .../media/platform/qcom/iris/iris_platform_gen2.c  | 268 +++++++--------------
> >  drivers/media/platform/qcom/iris/iris_probe.c      |   3 +-
> >  drivers/media/platform/qcom/iris/iris_vidc.c       |  10 +-
> >  10 files changed, 246 insertions(+), 351 deletions(-)
> > 
> 
> <snip>
> 
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> > index d1daef2d874b..1a870fec4f31 100644
> > --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> > @@ -201,45 +201,16 @@ enum platform_pm_domain_type {
> >  	IRIS_APV_HW_POWER_DOMAIN,
> >  };
> >  
> > -struct iris_platform_data {
> > +struct iris_firmware_data {
> >  	void (*init_hfi_ops)(struct iris_core *core);
> > +
> >  	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
> 
> I still don't think it's right to keep vpu_buffer_size in firmware data as
> this would change mostly for every new VPU variant.
> 
> The buffer sizing logic depends on VPU generation (vpu2, vpu3, vpu33,
> vpu35) / SoC constraints, not on whether the HFI is Gen1 vs Gen2.

Okay, so how do we solve the SC7280 Gen1 vs Gen2 situation? I can keep
the function pointer in struct iris_platform_data for now, letting you
sort it out in your series.

> 
> <snip>
> 
> > diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> > index 10a972f96cbe..a83f6910f8b7 100644
> > --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> > +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> > @@ -906,41 +906,15 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
> >  	BUF_SCRATCH_2,
> >  };
> >  
> > -const struct iris_platform_data sm8550_data = {
> > +const struct iris_firmware_data iris_hfi_gen2_data = {
> >  	.init_hfi_ops = iris_hfi_gen2_sys_ops_init,
> >  	.get_vpu_buffer_size = iris_vpu_buf_size,
> > -	.vpu_ops = &iris_vpu3_ops,
> > -	.icc_tbl = sm8550_icc_table,
> > -	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
> > -	.clk_rst_tbl = sm8550_clk_reset_table,
> > -	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
> > -	.bw_tbl_dec = sm8550_bw_table_dec,
> > -	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
> > -	.pmdomain_tbl = sm8550_pmdomain_table,
> > -	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
> > -	.opp_pd_tbl = sm8550_opp_pd_table,
> > -	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
> > -	.clk_tbl = sm8550_clk_table,
> > -	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
> > -	.opp_clk_tbl = sm8550_opp_clk_table,
> > -	/* Upper bound of DMA address range */
> > -	.dma_mask = 0xe0000000 - 1,
> > -	.fwname = "qcom/vpu/vpu30_p4.mbn",
> 
> Should fw_name be in firmware_data? as this can be change based on HFI
> versions?

That would fail because then each device will have to gain its own
struct iris_firmware_data.

But... Maybe we can do something as simple as:

struct iris_firmware_desc {
	const char *fwname;
	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
	bool (*checK_fw_match)(u8 *buf, size_t size);
	const struct iris_firmware_data *data;
};

and then

struct iris_platform_data {
	struct iris_firmware_desc *gen1, *gen2;
	// .. the rest as usual;
};


struct iris_core {
	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
	const struct iris_firmware_data *data;
	// ... the rest as expected
};

During first open the driver will try loading firmware from DT and
identifying it using the check_fw_match() callback. If DT doesn't have
firmware-name the driver will try loading gen2 and, if not found, gen1.
When firmware loading succeeds, it will set the pointer and the callback
in iris_core, settling the interface between the driver and the
firmware.

WDYT?

> > -const struct iris_platform_data sm8650_data = {
> > +const struct iris_firmware_data iris_hfi_gen2_vpu33_data = {
> 
> This proves my above point.
> 
> iris_hfi_gen2_data and iris_hfi_gen2_vpu33_data become identical except for
> get_vpu_buffer_size, which forces us to create multiple “firmware_data”
> variants just to carry a hardware-specific difference.
> 
> Also, it will scale poorly going forward. When we introduce vpu4 /
> vpu5–based platforms, we would need to add more copies of essentially the
> same HFI Gen2 firmware_data, differing only in the buffer sizing callback.

Yes. I'm not sure, if there is any difference between params / caps as
implremented by the firmware for those generations.

-- 
With best wishes
Dmitry

