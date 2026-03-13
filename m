Return-Path: <linux-media+bounces-55583-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +A9OE2W9s2kCagAAu9opvQ
	(envelope-from <linux-media+bounces-55583-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 08:31:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBD427ECF7
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 08:31:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 91EE93035E31
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 07:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 144241DF751;
	Fri, 13 Mar 2026 07:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KKFQ6l2K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cd2mSw+Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1758933B974
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 07:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773387103; cv=none; b=igrS0mqm2TDI3mNoHBSVl655YUFCFVagZCCbM8oFZMg1gxUfUfjzZR3/AyUW+aIS67zFJ7utsmmaigJiceUioeDmBAHyZFdj/Jc5aaUl1acv+hOc6qW2l/MW0fMsEcCfmjZ0a08UwZAxpmtTRHX0SVeskkeZrSd2aA5ZJKzCyCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773387103; c=relaxed/simple;
	bh=scCJ81L9iVcc7LEABPN+FA8JKFizphVaooOcPo9pd6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RM6d7TXEKPCxdfKpXslhRWRl80JwZyX/e7EXA8QmsEUn9bgFVGPK29rzqlHDeqs7s3p3HnUeaBfXbD+pstEJ1C2ZX0Uh1du7GKC6wgYN1z5SrBvlPcyoTOZ3v3bbDauAPGDOUTWfkFGFxriuHhYoYHgVRn+tcYWVgHw9xTQ6pss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KKFQ6l2K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cd2mSw+Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tc8N1014847
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 07:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WU+b6FamcN4OCxnXqSF11W6F7ikxsFbR7a7cxUznfMs=; b=KKFQ6l2KlSQjgpyq
	2Spbw3CKSXPUP2bs03CBJTmuEDTz9qAHzCMdWieCRWWyWfIvMuqm28lH0V/fgJhG
	W8I+EpvqnOPahHkNX+UhfdQlfNAwf671GHuUyPWUHcTnpllBv5Yn6YQYIvuOhA0U
	CfqptXItG2zJxg0Qi/EMeiNFKRvYOWRA887CRp+sdl+Aj97I7BVKI0JALRSjKPLo
	i/DOBVdqkBEMNgagXojzJhKDRhurhNgrDvRkRZmQqX75cqU5MVN//YToGNwk5/Hr
	Ex/mBiOKxnZWo3H1L5kQWxL+PCZ5FacvpRc/VFqeW5piKkx2lGMlf+eibC3HLQYg
	Y6xAZw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvdmc0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 07:31:39 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c73a4983fc0so1103158a12.3
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 00:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773387099; x=1773991899; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WU+b6FamcN4OCxnXqSF11W6F7ikxsFbR7a7cxUznfMs=;
        b=Cd2mSw+YEQDry2geRjvRq3PxUET/DdpLzMHM31vrqMJekpaKNjRDzfBBnTncVLuWIF
         jzwDBuJxFDAb9ec1Zpsc+VCDUCxB/oF24YbISODykrpvZ1t6IrxHtnQxDtksXVXrqbCD
         JOjyMupkxlEvPTx9Xvx9rHq/txfkwA5PIxfp8mXMs7lR/cq6YFgIDM7xvcjwrLZeB2wC
         OupzMaOJZ9LIt7lWx91IspS7p5zStFHdsHkm0brvWGFeYdj4DHr5rlIGkR/zKXCiV8i5
         /O6sTb6ATpJ6Zka8luP/n7iVJqE6+wR9zmaOAJe1jfwP6ITrK9GrbDk0OipMHfg1QkZD
         Zn6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773387099; x=1773991899;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WU+b6FamcN4OCxnXqSF11W6F7ikxsFbR7a7cxUznfMs=;
        b=c6jwFXY0GZdvKjW8XQ6OunzSuv4nNLFRJ+y7DUtiZusPjG0P7dcbRMUGJDBAlkLB0t
         o0Z0mUdyKyxiQq2fzwGSOyGbzmg7/Jt7CWd/q/J4WMkwBaacTO9Z08Fm3QcZsAXFhtJ4
         ZCqYlt7JHmTXm/6ZsuSqC6IUk1SZgX0P1Tlh1n1ZEDwfitTFIFovoC/lgdpznZDZdZ+q
         mtQecK1pRLmCU8lsR2u7j/yInoknojqcowL7RLe02Sz9thjt+kNjgbrnyva6Wk4iT63H
         f0r6q59Psubwk3Uq8ziclIQ6GRvQhfacom6UlOwKRymR3uBCK3zCi5DJx5O6SJDFWBtU
         Fu2g==
X-Forwarded-Encrypted: i=1; AJvYcCXFflG3sN20FYtJUXdAMWJUJlc/T9Bn4KF2YZPZPeYXnj7qdRvbrg4TqZwgedj2Zhn8gpvJ4ZcU3t7b2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNKrQmttRNRmltZN4i5zA17/8QJ8W1LKX8nUACNmcM9SqaRS0t
	raXuCCkEMRXXLC2VuIgYc8JX5EKPSiRgtFFq0RiQJXPn57Yh/MCOK+N6Oxle3oXY1bgs6NqmbPq
	nNep4E24orj2EjCBM61BUe2Cuvh9ier7rASu9ms9/sNWeeebs4cLjdxlpPRk0DK9+IQ==
X-Gm-Gg: ATEYQzzhOQ8GrxV/s5sjE+zpzLCNQuWZ8/O/hQya8VJOPJcGjK16UWLpZJBISLDsIFM
	LjOEnggMEbEILKEoalpnaAmOI7Y+QDa3E5cpxdxQnUPCP1JS7QFEC7EryoGf0Wwm36vh3Sjb4KX
	m/LG4Px26xa9bbeIcz7i+B1LF5iqVHsOtyZJuRDflSuXUIiZwB2RdZEeFAisPDsDHT+kxqnA0yN
	8qlWDo36oP5MhSv8hOGNVuqc9jBPLUeNKsdQ8lgkan/C5SvIJDCQyg+0SS9qkvfu6lXrMkYrKuS
	DmCCQUxRL5dPcfnPpflz9+RZK/QzqXK6TEZFiDBwkuIQKUGe/sm3PwCGo2+X7y8IkimraoTEPAp
	5wFTBwy25PhiSiOmBLhvIWWNwelNaX+iDihj+MNPREMX+B+sc
X-Received: by 2002:a05:6a00:a803:b0:82a:1161:18d9 with SMTP id d2e1a72fcca58-82a19924881mr1890219b3a.58.1773387098630;
        Fri, 13 Mar 2026 00:31:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:a803:b0:82a:1161:18d9 with SMTP id d2e1a72fcca58-82a19924881mr1890193b3a.58.1773387097807;
        Fri, 13 Mar 2026 00:31:37 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a073b265bsm5305340b3a.65.2026.03.13.00.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 00:31:37 -0700 (PDT)
Date: Fri, 13 Mar 2026 13:01:21 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v2 02/15] firmware: qcom: Add a generic PAS service
Message-ID: <20260313073121.qb7yq7tcga3sshcr@hu-mojha-hyd.qualcomm.com>
References: <20260312062756.694390-1-sumit.garg@kernel.org>
 <20260312062756.694390-3-sumit.garg@kernel.org>
 <20260313072450.sx7vqtvh62nflhff@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260313072450.sx7vqtvh62nflhff@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1OSBTYWx0ZWRfX6xQQ7q1OBIe9
 OvO2H4xcAisddvqYKNdnXSD7MC1ASI/oGx71YBNhhW++tEZ6TAyrnZB/Ka84YuhPw3Tb1lSYVeE
 ZVv9PGJATI/nHVs4UMZGlTzGQjcDKkZ0TIM3etdQPYBGDygZZt2y7HfWzio9Db7+qMVe6JWIrw0
 p53EKka1+T6YziV0jqx/O948QlNOGWtJug9xjSpg0NvHncc56m2wFRXltrCgo/4Vw5NlvBemP5v
 8oDXwlp5uoTpl/eKGeggoCryv1HbPB5rY6m1lY/HTzfSUIfMSsqiZCSHCXXs/B2AjoVumYmjO+y
 RsjvltXiIeRQeXTXIu8AWpzMpZwIgO11kOphiQKlOWiBkB2jSe0cSDUqXc7qTb5OO2/urr3JDMO
 0Xk7Jt+AjgMfTQQgPtg3KKhYEFfQwFWdN0sbxlq1JLnWDQn3ufEuPLkRXVpcwxA1wKtuxkrvUnO
 m0XvktFojxw6v55g48A==
X-Proofpoint-GUID: teVtuOk85gd-7WZ7jmU_utLw9yp8kZG1
X-Proofpoint-ORIG-GUID: teVtuOk85gd-7WZ7jmU_utLw9yp8kZG1
X-Authority-Analysis: v=2.4 cv=XsT3+FF9 c=1 sm=1 tr=0 ts=69b3bd5c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=S51orvrWavICeMSpryUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603130059
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	TAGGED_FROM(0.00)[bounces-55583-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,hu-mojha-hyd.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DEBD427ECF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 12:54:50PM +0530, Mukesh Ojha wrote:
> On Thu, Mar 12, 2026 at 11:57:43AM +0530, Sumit Garg wrote:
> > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > 
> > Qcom platforms has the legacy of using non-standard SCM calls
> > splintered over the various kernel drivers. These SCM calls aren't
> > compliant with the standard SMC calling conventions which is a
> > prerequisite to enable migration to the FF-A specifications from Arm.
> > 
> > OP-TEE as an alternative trusted OS to Qualcomm TEE (QTEE) can't
> > support these non-standard SCM calls. And even for newer architectures
> > with S-EL2 and Hafnium support, QTEE won't be able to support SCM
> 
>  using S‑EL2 with Hafnium
> 
> > calls either with FF-A requirements coming in. And with both OP-TEE
> > and QTEE drivers well integrated in the TEE subsystem, it makes further
> > sense to reuse the TEE bus client drivers infrastructure.
> > 
> > The added benefit of TEE bus infrastructure is that there is support
> > for discoverable/enumerable services. With that client drivers don't
> > have to manually invoke a special SCM call to know the service status.
> > 
> > So enable the generic Peripheral Authentication Service (PAS) provided
> > by the firmware. It acts as the common layer with different TZ
> > backends plugged in whether it's an SCM implementation or a proper
> > TEE bus based PAS service implementation.
> > 
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
> >  drivers/firmware/qcom/Kconfig          |   8 +
> >  drivers/firmware/qcom/Makefile         |   1 +
> >  drivers/firmware/qcom/qcom_pas.c       | 298 +++++++++++++++++++++++++
> >  drivers/firmware/qcom/qcom_pas.h       |  53 +++++
> >  include/linux/firmware/qcom/qcom_pas.h |  41 ++++
> >  5 files changed, 401 insertions(+)
> >  create mode 100644 drivers/firmware/qcom/qcom_pas.c
> >  create mode 100644 drivers/firmware/qcom/qcom_pas.h
> >  create mode 100644 include/linux/firmware/qcom/qcom_pas.h
> > 
> > diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
> > index b477d54b495a..8653639d06db 100644
> > --- a/drivers/firmware/qcom/Kconfig
> > +++ b/drivers/firmware/qcom/Kconfig
> > @@ -6,6 +6,14 @@
> >  
> >  menu "Qualcomm firmware drivers"
> >  
> > +config QCOM_PAS
> > +	tristate
> > +	help
> > +	  Enable the generic Peripheral Authentication Service (PAS) provided
> > +	  by the firmware. It acts as the common layer with different TZ
> > +	  backends plugged in whether it's an SCM implementation or a proper
> > +	  TEE bus based PAS service implementation.
> > +
> >  config QCOM_SCM
> >  	select QCOM_TZMEM
> >  	tristate
> > diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makefile
> > index 0be40a1abc13..dc5ab45f906a 100644
> > --- a/drivers/firmware/qcom/Makefile
> > +++ b/drivers/firmware/qcom/Makefile
> > @@ -8,3 +8,4 @@ qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
> >  obj-$(CONFIG_QCOM_TZMEM)	+= qcom_tzmem.o
> >  obj-$(CONFIG_QCOM_QSEECOM)	+= qcom_qseecom.o
> >  obj-$(CONFIG_QCOM_QSEECOM_UEFISECAPP) += qcom_qseecom_uefisecapp.o
> > +obj-$(CONFIG_QCOM_PAS)		+= qcom_pas.o
> > diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qcom_pas.c
> > new file mode 100644
> > index 000000000000..beb1bae55546
> > --- /dev/null
> > +++ b/drivers/firmware/qcom/qcom_pas.c
> > @@ -0,0 +1,298 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#include <linux/device/devres.h>
> > +#include <linux/firmware/qcom/qcom_pas.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +
> > +#include "qcom_pas.h"
> > +
> > +struct qcom_pas_ops *ops_ptr;
> 
> Should this be static ?
> 
> > +
> > +/**
> > + * devm_qcom_pas_context_alloc() - Allocate peripheral authentication service
> > + *				   context for a given peripheral
> > + *
> > + * PAS context is device-resource managed, so the caller does not need
> > + * to worry about freeing the context memory.
> > + *
> > + * @dev:	  PAS firmware device
> > + * @pas_id:	  peripheral authentication service id
> > + * @mem_phys:	  Subsystem reserve memory start address
> > + * @mem_size:	  Subsystem reserve memory size
> > + *
> > + * Return: The new PAS context, or ERR_PTR() on failure.
> > + */
> > +struct qcom_pas_context *devm_qcom_pas_context_alloc(struct device *dev,
> > +						     u32 pas_id,
> > +						     phys_addr_t mem_phys,
> > +						     size_t mem_size)
> > +{
> > +	struct qcom_pas_context *ctx;
> > +
> > +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> > +	if (!ctx)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	ctx->dev = dev;
> > +	ctx->pas_id = pas_id;
> > +	ctx->mem_phys = mem_phys;
> > +	ctx->mem_size = mem_size;
> > +
> > +	return ctx;
> > +}
> > +EXPORT_SYMBOL_GPL(devm_qcom_pas_context_alloc);
> > +
> > +/**
> > + * qcom_pas_init_image() - Initialize peripheral authentication service state
> > + *			   machine for a given peripheral, using the metadata
> > + * @pas_id:	peripheral authentication service id
> > + * @metadata:	pointer to memory containing ELF header, program header table
> > + *		and optional blob of data used for authenticating the metadata
> > + *		and the rest of the firmware
> > + * @size:	size of the metadata
> > + * @ctx:	optional pas context
> > + *
> > + * Return: 0 on success.
> > + *
> > + * Upon successful return, the PAS metadata context (@ctx) will be used to
> > + * track the metadata allocation, this needs to be released by invoking
> > + * qcom_pas_metadata_release() by the caller.
> > + */
> > +int qcom_pas_init_image(u32 pas_id, const void *metadata, size_t size,
> > +			struct qcom_pas_context *ctx)

please, align this with previous line '(' for all the functions.

-Mukesh

> > +{
> > +	if (ops_ptr)
> > +		return ops_ptr->init_image(ops_ptr->dev, pas_id,
> > +					   metadata, size, ctx);
> > +
> > +	return -ENODEV;
> 
> 
> if (!ops_ptr)
> 	return -ENODEV;
> 
> return ops_ptr->init_image(ops_ptr->dev, pas_id, metadata, size, ctx);
> 
> 
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_init_image);
> > +
> > +/**
> > + * qcom_pas_metadata_release() - release metadata context
> > + * @ctx:	pas context
> > + */
> > +void qcom_pas_metadata_release(struct qcom_pas_context *ctx)
> > +{
> > +	if (!ctx || !ctx->ptr)
> > +		return;
> > +
> > +	if (ops_ptr)
> > +		ops_ptr->metadata_release(ops_ptr->dev, ctx);
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_metadata_release);
> > +
> > +/**
> > + * qcom_pas_mem_setup() - Prepare the memory related to a given peripheral
> > + *			  for firmware loading
> > + * @pas_id:	peripheral authentication service id
> > + * @addr:	start address of memory area to prepare
> > + * @size:	size of the memory area to prepare
> > + *
> > + * Return: 0 on success.
> > + */
> > +int qcom_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
> > +{
> > +	if (ops_ptr)
> > +		return ops_ptr->mem_setup(ops_ptr->dev, pas_id, addr, size);
> > +
> > +	return -ENODEV;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_mem_setup);
> > +
> > +/**
> > + * qcom_pas_get_rsc_table() - Retrieve the resource table in passed output buffer
> > + *			      for a given peripheral.
> > + *
> > + * Qualcomm remote processor may rely on both static and dynamic resources for
> > + * its functionality. Static resources typically refer to memory-mapped
> > + * addresses required by the subsystem and are often embedded within the
> > + * firmware binary and dynamic resources, such as shared memory in DDR etc.,
> > + * are determined at runtime during the boot process.
> > + *
> > + * On Qualcomm Technologies devices, it's possible that static resources are
> > + * not embedded in the firmware binary and instead are provided by TrustZone.
> > + * However, dynamic resources are always expected to come from TrustZone. This
> > + * indicates that for Qualcomm devices, all resources (static and dynamic) will
> > + * be provided by TrustZone PAS service.
> > + *
> > + * If the remote processor firmware binary does contain static resources, they
> > + * should be passed in input_rt. These will be forwarded to TrustZone for
> > + * authentication. TrustZone will then append the dynamic resources and return
> > + * the complete resource table in output_rt_tzm.
> > + *
> > + * If the remote processor firmware binary does not include a resource table,
> > + * the caller of this function should set input_rt as NULL and input_rt_size
> > + * as zero respectively.
> > + *
> > + * More about documentation on resource table data structures can be found in
> > + * include/linux/remoteproc.h
> > + *
> > + * @ctx:	    PAS context
> > + * @pas_id:	    peripheral authentication service id
> > + * @input_rt:       resource table buffer which is present in firmware binary
> > + * @input_rt_size:  size of the resource table present in firmware binary
> > + * @output_rt_size: TrustZone expects caller should pass worst case size for
> > + *		    the output_rt_tzm.
> > + *
> > + * Return:
> > + *  On success, returns a pointer to the allocated buffer containing the final
> > + *  resource table and output_rt_size will have actual resource table size from
> > + *  TrustZone. The caller is responsible for freeing the buffer. On failure,
> > + *  returns ERR_PTR(-errno).
> > + */
> > +struct resource_table *qcom_pas_get_rsc_table(struct qcom_pas_context *ctx,
> > +					      void *input_rt,
> > +					      size_t input_rt_size,
> > +					      size_t *output_rt_size)
> > +{
> > +	if (ops_ptr)
> > +		return ops_ptr->get_rsc_table(ops_ptr->dev, ctx, input_rt,
> > +					      input_rt_size, output_rt_size);
> > +
> > +	return ERR_PTR(-ENODEV);
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_get_rsc_table);
> > +
> > +/**
> > + * qcom_pas_auth_and_reset() - Authenticate the given peripheral firmware
> > + *			       and reset the remote processor
> > + * @pas_id:	peripheral authentication service id
> > + *
> > + * Return: 0 on success.
> > + */
> > +int qcom_pas_auth_and_reset(u32 pas_id)
> > +{
> > +	if (ops_ptr)
> > +		return ops_ptr->auth_and_reset(ops_ptr->dev, pas_id);
> > +
> > +	return -ENODEV;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_auth_and_reset);
> > +
> > +/**
> > + * qcom_pas_prepare_and_auth_reset() - Prepare, authenticate, and reset the
> > + *				       remote processor
> > + *
> > + * @ctx:	Context saved during call to qcom_scm_pas_context_init()
> > + *
> > + * This function performs the necessary steps to prepare a PAS subsystem,
> > + * authenticate it using the provided metadata, and initiate a reset sequence.
> > + *
> > + * It should be used when Linux is in control setting up the IOMMU hardware
> > + * for remote subsystem during secure firmware loading processes. The
> > + * preparation step sets up a shmbridge over the firmware memory before
> > + * TrustZone accesses the firmware memory region for authentication. The
> > + * authentication step verifies the integrity and authenticity of the firmware
> > + * or configuration using secure metadata. Finally, the reset step ensures the
> > + * subsystem starts in a clean and sane state.
> > + *
> > + * Return: 0 on success, negative errno on failure.
> > + */
> > +int qcom_pas_prepare_and_auth_reset(struct qcom_pas_context *ctx)
> > +{
> > +	if (ops_ptr)
> > +		return ops_ptr->prepare_and_auth_reset(ops_ptr->dev, ctx);
> > +
> > +	return -ENODEV;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_prepare_and_auth_reset);
> > +
> > +/**
> > + * qcom_pas_set_remote_state() - Set the remote processor state
> > + * @state:	peripheral state
> > + * @pas_id:	peripheral authentication service id
> > + *
> > + * Return: 0 on success.
> > + */
> > +int qcom_pas_set_remote_state(u32 state, u32 pas_id)
> > +{
> > +	if (ops_ptr)
> > +		return ops_ptr->set_remote_state(ops_ptr->dev, state, pas_id);
> > +
> > +	return -ENODEV;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_set_remote_state);
> > +
> > +/**
> > + * qcom_pas_shutdown() - Shut down the remote processor
> > + * @pas_id:	peripheral authentication service id
> > + *
> > + * Return: 0 on success.
> > + */
> > +int qcom_pas_shutdown(u32 pas_id)
> > +{
> > +	if (ops_ptr)
> > +		return ops_ptr->shutdown(ops_ptr->dev, pas_id);
> > +
> > +	return -ENODEV;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_shutdown);
> > +
> > +/**
> > + * qcom_pas_supported() - Check if the peripheral authentication service is
> > + *			  available for the given peripheral
> > + * @pas_id:	peripheral authentication service id
> > + *
> > + * Return: true if PAS is supported for this peripheral, otherwise false.
> > + */
> > +bool qcom_pas_supported(u32 pas_id)
> > +{
> > +	if (ops_ptr)
> > +		return ops_ptr->supported(ops_ptr->dev, pas_id);
> > +
> > +	return false;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_supported);
> > +
> > +/**
> > + * qcom_pas_is_available() - Check for PAS service
> > + *
> 
> Name of the function is self sufficient, we can avoid for one liner
> documentation.
> 
> > + * Return: true on success.
> > + */
> > +bool qcom_pas_is_available(void)
> > +{
> > +	/*
> > +	 * The barrier for ops_ptr is intended to synchronize the data stores
> > +	 * for the ops data structure when client drivers are in parallel
> > +	 * checking for PAS service availability.
> > +	 *
> > +	 * Once the PAS backend becomes available, it is allowed for multiple
> > +	 * threads to enter TZ for parallel bringup of co-processors during
> > +	 * boot.
> > +	 */
> > +	return !!smp_load_acquire(&ops_ptr);
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_is_available);
> > +
> > +/**
> > + * qcom_pas_ops_register() - Register PAS service ops
> > + * @ops:	PAS service ops pointer
> > + */
> 
> same here..
> 
> > +void qcom_pas_ops_register(struct qcom_pas_ops *ops)
> > +{
> > +	if (!qcom_pas_is_available())
> > +		/* Paired with smp_load_acquire() in qcom_pas_is_available() */
> > +		smp_store_release(&ops_ptr, ops);
> > +	else
> > +		pr_err("qcom_pas: ops already registered\n");
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_ops_register);
> > +
> > +/**
> > + * qcom_pas_ops_unregister() - Unregister PAS service ops
> > + */
> 
> same here to avoid verbose..
> 
> > +void qcom_pas_ops_unregister(void)
> > +{
> > +	/* Paired with smp_load_acquire() in qcom_pas_is_available() */
> > +	smp_store_release(&ops_ptr, NULL);
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pas_ops_unregister);
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_DESCRIPTION("Qualcomm common TZ PAS driver");
> > diff --git a/drivers/firmware/qcom/qcom_pas.h b/drivers/firmware/qcom/qcom_pas.h
> > new file mode 100644
> > index 000000000000..4ebed22178f8
> > --- /dev/null
> > +++ b/drivers/firmware/qcom/qcom_pas.h
> > @@ -0,0 +1,53 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#ifndef __QCOM_PAS_INT_H
> > +#define __QCOM_PAS_INT_H
> > +
> > +struct device;
> > +
> > +/**
> > + * struct qcom_pas_ops - Qcom Peripheral Authentication Service (PAS) ops
> > + * @drv_name:			PAS driver name.
> > + * @dev:			PAS device pointer.
> > + * @supported:			Peripheral supported callback.
> > + * @init_image:			Peripheral image initialization callback.
> > + * @mem_setup:			Peripheral memory setup callback.
> > + * @get_rsc_table:		Peripheral get resource table callback.
> > + * @prepare_and_auth_reset:	Peripheral prepare firmware authentication and
> > + *				reset callback.
> > + * @auth_and_reset:		Peripheral firmware authentication and reset
> > + *				callback.
> > + * @set_remote_state:		Peripheral set remote state callback.
> > + * @shutdown:			Peripheral shutdown callback.
> > + * @metadata_release:		Image metadata release callback.
> > + */
> > +struct qcom_pas_ops {
> > +	const char *drv_name;
> > +	struct device *dev;
> > +	bool (*supported)(struct device *dev, u32 pas_id);
> > +	int (*init_image)(struct device *dev, u32 pas_id,
> > +			  const void *metadata, size_t size,
> > +			  struct qcom_pas_context *ctx);
> > +	int (*mem_setup)(struct device *dev, u32 pas_id,
> > +			 phys_addr_t addr, phys_addr_t size);
> > +	void *(*get_rsc_table)(struct device *dev,
> > +			       struct qcom_pas_context *ctx,
> > +			       void *input_rt,
> > +			       size_t input_rt_size,
> > +			       size_t *output_rt_size);
> > +	int (*prepare_and_auth_reset)(struct device *dev,
> > +				      struct qcom_pas_context *ctx);
> > +	int (*auth_and_reset)(struct device *dev, u32 pas_id);
> > +	int (*set_remote_state)(struct device *dev, u32 state, u32 pas_id);
> > +	int (*shutdown)(struct device *dev, u32 pas_id);
> > +	void (*metadata_release)(struct device *dev,
> > +				 struct qcom_pas_context *ctx);
> 
> I think, some of them can be unwrapped to look cleaner..
> 
> > +};
> > +
> > +void qcom_pas_ops_register(struct qcom_pas_ops *ops);
> > +void qcom_pas_ops_unregister(void);
> > +
> > +#endif /* __QCOM_PAS_INT_H */
> > diff --git a/include/linux/firmware/qcom/qcom_pas.h b/include/linux/firmware/qcom/qcom_pas.h
> > new file mode 100644
> > index 000000000000..ef7328ecfa47
> > --- /dev/null
> > +++ b/include/linux/firmware/qcom/qcom_pas.h
> > @@ -0,0 +1,41 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> 
> 
> Should this not carry all copyright coming from qcom_scm.h
> 
> > + */
> > +
> > +#ifndef __QCOM_PAS_H
> > +#define __QCOM_PAS_H
> > +
> > +#include <linux/err.h>
> > +#include <linux/types.h>
> > +
> > +struct qcom_pas_context {
> > +	struct device *dev;
> > +	u32 pas_id;
> > +	phys_addr_t mem_phys;
> > +	size_t mem_size;
> > +	void *ptr;
> > +	dma_addr_t phys;
> > +	ssize_t size;
> > +	bool use_tzmem;
> > +};
> > +
> > +bool qcom_pas_is_available(void);
> > +struct qcom_pas_context *devm_qcom_pas_context_alloc(struct device *dev,
> > +						     u32 pas_id,
> > +						     phys_addr_t mem_phys,
> > +						     size_t mem_size);
> > +int qcom_pas_init_image(u32 pas_id, const void *metadata, size_t size,
> > +			struct qcom_pas_context *ctx);
> > +struct resource_table *qcom_pas_get_rsc_table(struct qcom_pas_context *ctx,
> > +					      void *input_rt, size_t input_rt_size,
> > +					      size_t *output_rt_size);
> > +int qcom_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
> > +int qcom_pas_auth_and_reset(u32 pas_id);
> > +int qcom_pas_prepare_and_auth_reset(struct qcom_pas_context *ctx);
> > +int qcom_pas_set_remote_state(u32 state, u32 pas_id);
> > +int qcom_pas_shutdown(u32 pas_id);
> > +bool qcom_pas_supported(u32 pas_id);
> > +void qcom_pas_metadata_release(struct qcom_pas_context *ctx);
> > +
> > +#endif /* __QCOM_PAS_H */
> > -- 
> > 2.51.0
> > 
> 
> -- 
> -Mukesh Ojha

-- 
-Mukesh Ojha

