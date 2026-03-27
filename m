Return-Path: <linux-media+bounces-57364-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCKmHQvuxmkIQQUAu9opvQ
	(envelope-from <linux-media+bounces-57364-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 21:52:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B5034B52A
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 21:52:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 777B330DCCB5
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 20:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D67D83921E4;
	Fri, 27 Mar 2026 20:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aCTPrkcs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ecWFi0aQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3CE37F73E
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 20:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774644243; cv=none; b=nGIsIsRvAz2IxIKEtCpg96jd+KdH5VGNgWGesqUwcbPzCRpURZt9xOPifiXrSQVEnb6oauV6xEsAKGdeFHRj/x55UJFQE5YYliQDC0i8bmUUWkG3FPakjcVK/8CwnBvDnenNZYkUW/WTUW3EXHe3+bb3UKVfB5m7y3OGwH7SN9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774644243; c=relaxed/simple;
	bh=mOnZZl8eGcDAezHS8Nea7ITicfpyfIqJHsd9TsL2ezo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gpb34aXjtA4SdM4gVg4Sooh9DZs6C7H4uXc9bZ89sMvoWG/9+FBFH4TOMO8PGcIFcEOndhM3QF0vrMVtX+nyzT0QhdJ29uQ4PTiBfp/viTVVo/tPiIXDDNFK5qn6tD1hyx64BDgzOqUhK/MsGH5x8m6LN42j8dTjh5FrEI9QD58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aCTPrkcs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ecWFi0aQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RKWO3I1334851
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 20:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZS7/E2sC1kaZB8E/dQAOcD4c7Mt+5yw7HMOSuN8HZGw=; b=aCTPrkcstZuf7IVs
	MTsiigd3Fq9L+zlA8Ceib+PDYGII/rDhLUGridApZwDV8OA6ked8ry19ldTz6ypW
	4ob0SsbkvLsO3svFvAWj4AafpMWvNyVQVauaNZtd4IY2+fiiMq+hj+W0nR92gyFu
	2iyi0BOHiwCA3yHl/w7IswBX/hftqL8nA1aM5Y+7JbrAG86ATMYxTsVj3UxxIwZE
	5tGOZjlzk/4kfkxER0pJzgl+TvrWaL8QI1kBFWJ+rLbm+V471SvuZlUhUQpIwtk2
	bqNYDMNsBTYQHUTAX9u3Cs+y+XF5tOjW7XigsHGVe/wM5p4jAgnEOOTQOuY65JCi
	tGKGXw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6111g0xk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 20:44:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093a985e21so19372481cf.3
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 13:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774644240; x=1775249040; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZS7/E2sC1kaZB8E/dQAOcD4c7Mt+5yw7HMOSuN8HZGw=;
        b=ecWFi0aQ6a8ErysH70NCEOLl5lxxnywwu7azZMW+5AaDj+1wn1cba9/AQ7uF3s6Ac4
         juYeFcrGJfzxVErMFy4apj3CUlSmxF3FwjZpU1rdrcvd9KM1GN+8QeV8KOfojSo/47nX
         yN+ej2ymuHx8rUj3AZbnp04UixYblvGB7KwWhnZbOo7jlPl2mxN/hel1XeOR6k0K8NCo
         /H9pL2mm4FVvAsAl6Yku3vvFiprD52AyYzIAvoF2/pWbIChJUqvYqfH9cQmXi29ylwsa
         2/GWroYrgGAGhaW6A0/e/anz1g2R3Wut09xsm108LzvRV35K0vvNcbfsUQsMPBG+duba
         Vazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774644240; x=1775249040;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZS7/E2sC1kaZB8E/dQAOcD4c7Mt+5yw7HMOSuN8HZGw=;
        b=lRkUHW6BkTos3HilTfUw+Gk0M5lIzb/pbf4MGRBZEe39nfp7btqTwb//tgTWJiJENF
         6auAl9+YfhIomGUFvdyphvOc4C7U7p7mqXTnkpYR6wEyXLpSX2eMMp+hH5Xnk+emlXNa
         fRx85zn3MoZvtxKUI3HKnxYPuFw4RU7o7DCc5XV2S7eHheShXcOOZs+S3IBvaQne6Fyl
         yQsusi+BnhLevtl0nPc3ecfDzXDi1XJJbI+L5EtItOm+3Wcwp8sXSEFUh9FPOmrjn5s4
         B6SUO7eIoPwkpwsp3aNhrmz1Y1P+76zp3KC8Rv369gV0P11c0HMwjbrh9v+jFQ6aZilN
         sFIA==
X-Forwarded-Encrypted: i=1; AJvYcCXkG1g/Xv6uXuyM/ZHSYiNy+3+w3dvRQjAo0qmyYoGMy7R1fKTPzLx+OovcaBrygFvKbpkUHsgS5yquLA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0i3b2U/lVqANyHugBmHl/cpJFN/+Kl6yzCXM12ouCaOVZdVmJ
	ooGxNVnHP3yk+kbTBj0XQczvU8DW9RJ4ETt2hRnTiQaUuUfdBHCF7nn/2sREqznmzm2xTdJc09o
	RIi+nbGJCHP27tRuK8H08btg4qe1h0r1ha6NbPvRdQUTTtZSKKOqLUwFGKvZI5/Utxw==
X-Gm-Gg: ATEYQzxNcShnTEgF8nMlhb+GU3H2mKr7+dTGEywAOb3a7wqMAD+fhrl2GilioMjIbYT
	B5SHJbJhrA37PcfR1NXT7DjHaKmJaSsYGjkXJQ59c0q/CoJAyTF+6E+iNiI7sJTNgC4LxKDSMhV
	5v7NyCXVv/RveXsNTvyX2gox5SIkjOoGZCLzZkkAHG3QfWaT4aUEZgBG0HNGkcJjqoEkuE/d6xK
	ddt8JyUDJiye6KcpaPTJ8wA+0FqV6OyoyRTNwAOAcLIjrqthsnCx7lwhI3xc1sYmg5eB6bwqLne
	6/3V7unNtOHhdjLkgFwTq3Ujb9Z3ekRmCrWdkZtphTNdH+HmKFYZAIJ1lbsn4FnMsQSuVHGXv3Z
	/2xwjDoluVHJSx3RMiKbiHbYgHXCUXYuDdGO6skPV7rQ0ZrFDJO6gJohT/apVsn+SRlMEzlvy6N
	BbrTRQ3nG6dUqzXdcz8PcPMkLn/AHUJBE0BqQ=
X-Received: by 2002:a05:622a:1ba6:b0:50b:3e64:9b29 with SMTP id d75a77b69052e-50ba3818239mr54281711cf.14.1774644240422;
        Fri, 27 Mar 2026 13:44:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1ba6:b0:50b:3e64:9b29 with SMTP id d75a77b69052e-50ba3818239mr54281181cf.14.1774644239833;
        Fri, 27 Mar 2026 13:43:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13fd743sm14355e87.21.2026.03.27.13.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 13:43:58 -0700 (PDT)
Date: Fri, 27 Mar 2026 22:43:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/9] media: iris: retrieve UBWC platform configuration
Message-ID: <zin7rmeaycp2ewrlc5sgwjomey3kspqknjbkij2g6ztnawukty@66vagyozrtxx>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
 <20260125-iris-ubwc-v4-3-1ff30644ac81@oss.qualcomm.com>
 <56860faf-3f74-daeb-3d19-a35243172317@oss.qualcomm.com>
 <cshlsxb4fj6piuxadtxvxl5rgnl4aljqqrojl5wkp5oew5ynxy@ah3eo4aexe5n>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cshlsxb4fj6piuxadtxvxl5rgnl4aljqqrojl5wkp5oew5ynxy@ah3eo4aexe5n>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE0NSBTYWx0ZWRfX55Ipyo5KdRft
 QklMOGC41+d4YbnCTXGaKsDpU+ju36NqsFf+hpvKG+Eq+SWO2tyLTvDP8C8ELfMcuS2sAoTccf0
 EQ7S3RWyrRKgNzK9tJONH+0w0a3KHPZPpizA/Lqg227beggYY3r9XHz9Hh+W9m/6lS7eeMjQ8rp
 wmuikRcYuznpv0IJnXYU9xntn99wV4K5gaaR2x4Sy55AKuGN45bGggBcXMseiFSKhouskG+dhyd
 nig6oFER6Mpu4CWJkgGxzsHQwUeUwu3nMogwFC+GRxEggq0H1Kmll4iBpbm29ZG3CUdbl+uE04I
 +pjQrbfjK6Af6V3BpVXk+rOktWwBbik4hecqUp3LmTLxwrmu+Wuqzjzv5ZbZ5AqN8M5NWVvUPur
 I9qM5MmFj1k0l9wRFp2Ez2ZYji/IXEr0tjcDqcSD35A7EapLHpEztej59KSobVG7Ifj1ov71YNx
 xbHuliCiB8HqKe4MrnQ==
X-Proofpoint-ORIG-GUID: X1PzdspPnoNa_vIRkV1uhDuiPhEcIjPq
X-Authority-Analysis: v=2.4 cv=aoW/yCZV c=1 sm=1 tr=0 ts=69c6ec11 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=W6jageyznww4trKTX_sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: X1PzdspPnoNa_vIRkV1uhDuiPhEcIjPq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270145
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57364-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C0B5034B52A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 09:42:05PM +0200, Dmitry Baryshkov wrote:
> On Thu, Mar 26, 2026 at 10:36:05AM +0530, Dikshita Agarwal wrote:
> > 
> > 
> > On 1/25/2026 5:00 PM, Dmitry Baryshkov wrote:
> > > Specifying UBWC data in each driver doesn't scale and is prone to
> > > errors. Request UBWC data from the central database in preparation to
> > > using it through the rest of the driver.
> > > 
> > > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > > Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > >  drivers/media/platform/qcom/iris/Kconfig      | 1 +
> > >  drivers/media/platform/qcom/iris/iris_core.h  | 4 ++++
> > >  drivers/media/platform/qcom/iris/iris_probe.c | 5 +++++
> > >  3 files changed, 10 insertions(+)
> > > 
> > > @@ -244,6 +245,10 @@ static int iris_probe(struct platform_device *pdev)
> > >  
> > >  	core->iris_platform_data = of_device_get_match_data(core->dev);
> > >  
> > > +	core->ubwc_cfg = qcom_ubwc_config_get_data();
> > > +	if (IS_ERR(core->ubwc_cfg))
> > > +		return PTR_ERR(core->ubwc_cfg);
> > 
> > Afterthought: This change assumes that the presence of a UBWC config
> > implies Iris UBWC support. However, some platforms (e.g. qcm2290) do have
> > UBWC data defined at the SoC level but do not support UBWC in the video
> > firmware, which could potentially surface during SYS_INIT if UBWC is
> > advertised unconditionally, so this might be worth double‑checking.
> 
> No, this change implies that the lack of the UBWC config is an error for
> modern platforms (which it is anyway).

And that's not to mention that Iris doesn't support Agatti / QCM2290,
nor any other UBWC-less platform at this point. Those platforms will
need additional chagnes anyway, so you might as well include a patch to
skip sending UBWC-related packets in iris_hfi_gen2_packet_sys_init().

-- 
With best wishes
Dmitry

