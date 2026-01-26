Return-Path: <linux-media+bounces-51550-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CbxBEVId2ledwEAu9opvQ
	(envelope-from <linux-media+bounces-51550-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 11:56:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3476875A4
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 11:56:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3CFF63006446
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 10:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5243314DC;
	Mon, 26 Jan 2026 10:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="im0CFPia";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jV2edqlu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66493002DC
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 10:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769424961; cv=none; b=NI8evz97xDaOekBBu6QEE64I5z2m62rL0XIHwRql+d3n7WYoqpkiflstoUoGbvIpbHVcoYafps5I0TBjt4PLnQTNbPSIMzdzF+81TZBqxgBBhhg7VJrHlBxytY0UZB+1gWV1vZv9Nu6oGxBuV1C2JDY8hQciAJArLNhtmsGRB1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769424961; c=relaxed/simple;
	bh=Kjm2rcSjVyqmGCwnjvAXMccijAXuBlO1MOu68Uo6QCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5nYzgMhT0n8bU9b62TQzWe0SHn3sj5rA62lPslZ1x04CJDGIHmVC201hBEGf8fY//f2EH/wtpGpWGi8o5D9SwcpMQOUDb7xJZe89MCNHPAaeV4wkP99FelvVhjIWvCCXk5WyR080hbN8T8Zf4d3MBagwJLGJUrh4D+1vUJ8o+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=im0CFPia; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jV2edqlu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q8FBbh389525
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 10:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mBxApWBw9/gATF1Op7IC7eoA
	//6lsPvHHF1Do7aOfTY=; b=im0CFPiaSfflPQ66TcnatfOVAIGaHKTfc94+aAjo
	XiH7jxh1nClfXk5HunIimH4u+eYTMdoBQc8TgFxVJqDH/1/ix/a4It43BrD//BzK
	3BhSr2VqdBO5teX98ynr0S1sGioYZIvoBovAVUHgU6xkLTYoY2l0YObbq4vDugXm
	ka6De06KIfrW0r6fdZ3yuFpVQGZQTUsxuUqpkJRSJQPUsezgYNa6UuOkNt1n3MnO
	M7yYl3kyLR7UJu6g6FWG38kPIhOzRIDGZ5q+mxgTw6YeZ9sOtEn1w+BfBxV3VJLS
	Xw5aJV3xEqtx+VakEIRzH7TcorOsyzT6abw/3N6c+V07EQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6uv8y0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 10:55:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a69b7813so1183173585a.0
        for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 02:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769424957; x=1770029757; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mBxApWBw9/gATF1Op7IC7eoA//6lsPvHHF1Do7aOfTY=;
        b=jV2edqluPdQwnUlxFqPNhbXZrQok38EK8rheHeom6Gn57mI70KgvML5OEpUTFS964S
         BdeeRhRyf0SWzJ4+U1Hit/1EonVIkqT5JrgW1KOSgclEc+6ZKBGg6c+fqw31HF+3IVPt
         Vcx4+418v12yX7i3fwi5S4rCesQKn5+OYRApd3bLnhfZ+dzz9p+vBzYgcrynh01ynim9
         9sTie1mrTw5D1QJq9B/zrEZiUFFNpdLzDyIDJtC49G9guc/YzbcycvRlmH+4TPOaWd+9
         0n8hbFtIQ3pbNm0ZJh8QeNwALdjjyj9/8dSbTRptKc6Tx5KHuDr7pRTq0hh9Ufq7xSRE
         n8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769424957; x=1770029757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mBxApWBw9/gATF1Op7IC7eoA//6lsPvHHF1Do7aOfTY=;
        b=vrd+OPeEEl0hx6XOYZV0pG9yQ9+TU/SzVAibGKtrjYwZ52glCca+zGON4ORWnVoTc+
         qhat1kftbNeiyhZFRGYjoFSzzHnb7dNDlVBw0ygGCsK/XZARIzNiCNNO0ZinqeTIucJ0
         kmEGeWLMX+h2MA0N/u3FK2mH959Vl8pELK0a5BtBCxdY2kHxL6dG0I2XiMVG6kOmB8Uu
         VyBfG2tgoR7eJCWLyRCsLnvza7CM6cMvAR14HFbbtD/12THihqZyeOl5vqMkUEKAqV3U
         kgXGqX/ssqm9rJyLZTZQKhFpyE0Eqge1qSmX/OemGoCYjHANxpC1ECVTqXZYjACMwZmm
         Hjdg==
X-Forwarded-Encrypted: i=1; AJvYcCXpjax7oFlaLPAZFnInlztzti32W+n8HDyC6o9zLn+dktCWztk5OKA6MxmbqfDyyBi9RnRoa4x0eWYNrA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz+L6M1ilmSSs+uUVIf1i2wIPMLgMdEaqpY4UmXowxvp5HMKye
	H0AS0R8WDQM8AjCkexsIeOBCvh5opmkltJP+eqHsOKZ21lhjhB70EjX/Gat3qNJNHTtXiAk5RUf
	PDjO/3629LfCqUv06obv4XGlEVFrfTMly1Kaq2h5RBtNBtiCk5G8El9XYD5FZibljxQ==
X-Gm-Gg: AZuq6aIXUE+lWPD+Img0ncRhfbe806Jcva4xQwSFXatkNFy1Trl5DA/iOqLTvIAD+u4
	r7pXqeI+vy/0Jy0xdpYZmQ/c3L954P+gdI/g3O306rE267pI5A2DzcndLH8I0djkVnOO18f9H8y
	6X9kvV4lsbkQoalRIAA/h7YvCBGSHKjuNEKz3+XqhdNCwmvgGbKn+qhRyIR9FrCy/q4nM3aKowR
	ypIuTOTHEdC0Oy5EG9GcxjMf4JLdowvY8lMbGTRyrzuBz1X4UPtT/79QFd4oA1yj59ZmJj8R1Jq
	UygbnadY2V6OWL2Tuj1E57PKDAsyrqxoaCINfj9XQ6I0kuMsQp+CLvBDkCWDRYX40iGGWYb0Q3J
	ZmYDltvJrXyHmZl4NE5MmhIF17XSEYttxSCUkgmny+X6wJB+wakHahXCFydlM1IB2LG8O7sJxNl
	VSeOFKDkybF9g/Cgp328VyA2I=
X-Received: by 2002:a05:620a:1a22:b0:8b2:eea5:331b with SMTP id af79cd13be357-8c6f95c5136mr421045885a.19.1769424957243;
        Mon, 26 Jan 2026 02:55:57 -0800 (PST)
X-Received: by 2002:a05:620a:1a22:b0:8b2:eea5:331b with SMTP id af79cd13be357-8c6f95c5136mr421043985a.19.1769424956776;
        Mon, 26 Jan 2026 02:55:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9fec3a8sm24351261fa.14.2026.01.26.02.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:55:56 -0800 (PST)
Date: Mon, 26 Jan 2026 12:55:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v3 2/7] media: iris: introduce SM8350 and SC8280XP support
Message-ID: <kffcydlqdhkm5q7lip522isb7toa4jtmnzjvmctpsv5pc2ozat@o2laeofbthwc>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
 <20260125-iris-sc8280xp-v3-2-d21861a9ea33@oss.qualcomm.com>
 <b9fb16db-8a16-420c-bb55-850c39301f1d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9fb16db-8a16-420c-bb55-850c39301f1d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA5MyBTYWx0ZWRfX4l+9dROoQ21G
 d+RMHWUgvVNTaRHMyfBuDDO/+5PGbSKWL9NyeeXqNSSETWJgO1aKDeOHHAPKdG8G3BGRHs+4bs1
 DWkQTBLSjHkUQLTkvcYSYTc9Ed0nN2CO0As2dkwR4cZWP2LCOlHUnOJkrEdPusHxLfepyOAWD58
 WR4a3L0I7sqf7LCPlxG2ZQ+VfvkdY7kzUiIf4BdtFQXizHCIrzOUWO5IpU0jMT85jzI/mL2ikQi
 IYd/D3hsuVYaeFoTh1djV/PjlQ7d/UPSMFomOoM6NJh1Aim8jBMBLMspgdc+6OtK3phCpAbR99N
 3nPKNjLKurLGywWGv6/BW4nGsUFPXLx0m27Pe7nQamnWlcUAdFdx6CmgL7pRcX9vcM2cgVzpp/G
 fHlaa+K/r63QUIu+9SsFVy1A+KMRK1EQKYHP2gIZVXAzlgkZGTNwHa93M2UpaBBH/YAZldify8c
 8qSPEUJss1uE+M3jaxA==
X-Authority-Analysis: v=2.4 cv=UqRu9uwB c=1 sm=1 tr=0 ts=6977483e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=yuvT0TRLOIlni_b0vi0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: kK1tMzxFxPauEyVdwUNxFb2uVsxRVcIx
X-Proofpoint-GUID: kK1tMzxFxPauEyVdwUNxFb2uVsxRVcIx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51550-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
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
X-Rspamd-Queue-Id: A3476875A4
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 10:50:56AM +0100, Konrad Dybcio wrote:
> On 1/25/26 4:32 PM, Dmitry Baryshkov wrote:
> > SM8350 and SC8280XP have an updated version of the Iris2 core also
> > present on the SM8250 and SC7280 platforms. Add necessary platform data
> > to utilize the core on those two platforms.
> > 
> > The iris_platform_gen1.c is now compiled unconditionally, even if Venus
> > driver is enabled, but SM8250 and SC7280 are still disabled in
> > iris_dt_match.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +static void iris_set_sm8350_preset_registers(struct iris_core *core)
> > +{
> > +	u32 val;
> > +
> > +	val = readl(core->reg_base + 0xb0088);
> > +	val &= ~0x11;
> > +	writel(val, core->reg_base + 0xb0088);
> 
> Can we "open-source" what this write does?

I'd leave this question to Vikash. Hopefully he can comment if I can
open these bits or not.

-- 
With best wishes
Dmitry

