Return-Path: <linux-media+bounces-39560-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E2AB22321
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 11:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B23B1882DFD
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 09:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA462E92A2;
	Tue, 12 Aug 2025 09:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AAdFQshg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACED32E889B
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 09:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754990670; cv=none; b=n4wSDySEQ+PBecO7OCe/DPStz6qBdfv+XFjtmXjIFlFI1HJXAAnIoELqHmUV+oXXBNsbFVH5Q93W5dnuBw6X9oXYj4vvCM/T2Azcn6HOlnmSuHK0qZIHoQ0lZgvaSVhRgZTiSHY2/vgXSw9UixIa3QJyLYh5Mq4LcNVTzmeFdLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754990670; c=relaxed/simple;
	bh=DQcGFfWnXmbY3cGH+AQhW2Dqz8CqmcsACn1g+EsVxDo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wghoh3Qziz+mD9eFeOfjUd8MxdWySvtcgdHdRo/HskAxK2AGZ6zJgs6Vq/mT9FqvTc5nSFGqzMuJoCBNRejwZA4/WbSlerESF2BYH5nhfsIAk3I+DUBgDKwhKTc4te2xhiciFlIlk3xdS2DThVIGLOpcwGSflLRQYsegkm3tJOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AAdFQshg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C4sLcb029604
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 09:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JbNwrBojJxdkzYo7Fd0J7AxB
	G4xLKOGzvLpUDuXINjs=; b=AAdFQshgTrya4uNddpws/falCZqWiVjiB3wp709T
	hqK/l+OKzCDqECVJmi5VUnAOoFQ29QPPnjlawlhaIXSu3DiyDv7Aqk5Y0zF8A+qg
	TBrEZ95ztA4HDn8MWi51oMnOSPEUw1vJXwhjMflpTofmWqA7GsAYgtZgADnfTBTM
	KnoDovPt3ZZ+pr4I6pA+iECQUzz9kPmlyL6lC4VZWlyq+m884NAYV+cwhewG/qp/
	COnGsU1+VqCQBliGvPPwiKOayj7aSNY0CxaVhwmfMal68V0/ImTMJQjw1I0oMt5z
	MhSi9gnNaTmTQRKovuDOdKGmcvcUCQNM7nXnXdxJ4Ppm6w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sqr6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 09:24:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b061ad3cc0so161133281cf.0
        for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 02:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990666; x=1755595466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbNwrBojJxdkzYo7Fd0J7AxBG4xLKOGzvLpUDuXINjs=;
        b=QjFuNTzR3394hiLfwyxZGQdJ4XrkvTZch7d94ScEBrCYTdkii5QWoBtf5HECw0Xuqx
         DmdL77gbPh6FuHRah3mZHRQm5zGbZUr5x2HQyBIibFxoBsQ6BJsPc/cCGGHvcp7VfxrS
         dQQrx/kql7lrYDR2mv1xQZ4Jl6eDD8+XJXPXZ8BeH3H2Eedo58TQELDmsVAdVI0m0WVq
         6e0Rxaq+XDGY/mANKMBQ+iHc3kfHGyqlgI/GlFTedUZL7Vt5nEySSuQtddaGsnwQlFiE
         4TU6XRRT5Ic1Hfdy05uhGCT0da5767TUQkh2lJWYdn2GnQHUsjqKJzUSkAGHzS7LUR8D
         dztw==
X-Forwarded-Encrypted: i=1; AJvYcCXRuOqNdSQ8aiXuc0Tj2/4LG/TrBCrTADFn0I3lHtq0AAsMt1j6LGKbR2FdHeyIM8EQMqLeu01jhMG5qw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOkHGF5SE1lM0y7cmH4f8Q42ss/29RshTfGY6/Z/h4Jh0+2byv
	BdGVw1me9PQmjp1MneKX+Q38Xq7ZrwRqoVVXhbEcbggwiolT7WLNZk6RaRgu+AZRxDWUJQXtLlA
	QRpbaSluo4CceMnOy8OlqATPSYfdwSQhoNTX+83LNS0NA5xkpy6BSqQmUU4WohSKkzw==
X-Gm-Gg: ASbGncukznjMhCMYH0HV4ozY0fBn1KX9svYgz9wTCA6usYEHzePbMvAJCEPonU4XXBG
	0NlZv/gwfI5AuU8uM/MTdcsBceo7aZD03eBZL7YIjKqStoKGUdWPHaD6hUzrEtbRsjU52YEHPzX
	uVnnNXROBfa0aTWyrUyw+NYSxoP2VMpToB2Fv6F3KENqkNAnH3EY4Twf2enYwkIl0KqfEGXEht7
	TaGSpJ892CY6pi1lA5aqDPMwRUw763OREk+VwO1AzilIxWWB8g0tRGdZbMLhWZq0nHa/VFQv+5d
	cc6WaZXTBPxSqWoZDq9JZns4V6RdDYYGDIg1qQUEWyipOFcIzvuTofQBVOuuWJ8qRuKluw==
X-Received: by 2002:ac8:5751:0:b0:4ab:751e:9d97 with SMTP id d75a77b69052e-4b0aed720a2mr256867341cf.49.1754990666363;
        Tue, 12 Aug 2025 02:24:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBBYPf5IiNltyvzhJjTZ4jKDXmmEi9Yg+eQEVvuuplz7NeEAprCbyMCK3NFdwyFBTEoCSfJg==
X-Received: by 2002:ac8:5751:0:b0:4ab:751e:9d97 with SMTP id d75a77b69052e-4b0aed720a2mr256867161cf.49.1754990665913;
        Tue, 12 Aug 2025 02:24:25 -0700 (PDT)
Received: from trex (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459db3048bdsm390721525e9.29.2025.08.12.02.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:24:25 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Tue, 12 Aug 2025 11:24:24 +0200
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: iris: vpu3x: Add MNoC low power handshake during
 hardware power-off
Message-ID: <aJsISDlgx1EZCzKn@trex>
References: <20250812-sm8650-power-sequence-fix-v1-1-a51e7f99c56c@quicinc.com>
 <acdff7a4-bd9f-45c1-b620-25e667d1f628@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acdff7a4-bd9f-45c1-b620-25e667d1f628@linaro.org>
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689b084b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=Ovw8jLjI9PxWGIGDV-AA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: DgXOrrMvO5Dwrtww8hgF1tprZ3-OcXvJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfXxXZ1L+STCcAD
 7Ux8pxVVVlgzhPx3gX3cJCyWWFvRgr1iS2YmpNN73GbAV5djm/Z0B1SAD0UA480sWXtzt/X507t
 L8tO/9AlIAO8mgIZM81hr6jAHnzXFLCWfR58QiPETtLWqt16KrM0ahUY1y7RuMFo7YYkZ/QHx3J
 4om2piake7l7Mz9y09gYc8IhjOLYjARq82g1EdutXtzEK4KmgFwzd0FBjmOV+Ry9f0vV8sE5Lip
 4Gq/gKtUy6KIPfZkqeg7VAhd2WyPbtJ0J73smDFwp03uZnh5VRxd6f5qhMisP75wrN7NC4Kvwct
 xoW90Gn/bipMcWt6B1KDcEP6uQYutlbHzpgLZxndwtxFy/ZCwvW3rXN41UlBDfP2bEMRlo6ZhwJ
 ScsYzkJE
X-Proofpoint-GUID: DgXOrrMvO5Dwrtww8hgF1tprZ3-OcXvJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

On 12/08/25 10:06:40, Neil Armstrong wrote:
> On 12/08/2025 09:48, Dikshita Agarwal wrote:
> > Add the missing write to AON_WRAPPER_MVP_NOC_LPI_CONTROL before
> > reading the LPI status register. Introduce a handshake loop to ensure
> > MNoC enters low power mode reliably during VPU3 hardware power-off with
> > timeout handling.
> > 
> > Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> > ---
> >   drivers/media/platform/qcom/iris/iris_vpu3x.c | 23 +++++++++++++++++++++--
> >   1 file changed, 21 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> > index 9b7c9a1495ee2f51c60b1142b2ed4680ff798f0a..c2e6af575cbe4b3e3f2a019b24eecf3a5d469566 100644
> > --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> > +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> > @@ -110,6 +110,7 @@ static void iris_vpu3_power_off_hardware(struct iris_core *core)
> >   static void iris_vpu33_power_off_hardware(struct iris_core *core)
> >   {
> >   	u32 reg_val = 0, value, i;
> > +	u32 count = 0;
> >   	int ret;
> >   	if (iris_vpu3x_hw_power_collapsed(core))
> > @@ -128,13 +129,31 @@ static void iris_vpu33_power_off_hardware(struct iris_core *core)
> >   			goto disable_power;
> >   	}
> > +	/* set MNoC to low power */
> > +	writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> > +
> > +	value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
> > +

for readibility purposes, could this code be restructed a bit
differently? maybe all the write/read operations in a single do while
loop with the exit conditions assigned to variables with an
identifiable meaning?

maybe also check/report errors outside the loop itself?


> > +	while (!(value & BIT(0)) && (value & BIT(2) || value & BIT(1))) {
> > +		writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> > +
> > +		usleep_range(10, 20);
> > +
> > +		writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> > +
> > +		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
> > +		if (++count >= 1000) {
> > +			dev_err(core->dev, "LPI handshake timeout\n");
> > +			break;
> > +		}
> > +	}
> > +
> >   	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
> >   				 reg_val, reg_val & BIT(0), 200, 2000);
> >   	if (ret)
> >   		goto disable_power;
> > -	/* set MNoC to low power, set PD_NOC_QREQ (bit 0) */
> > -	writel(BIT(0), core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> > +	writel(0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> >   	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE,
> >   	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> > 
> > ---
> > base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
> > change-id: 20250812-sm8650-power-sequence-fix-ba9a92098233
> > 
> > Best regards,
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> 
> Thanks,
> Neil
> 

