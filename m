Return-Path: <linux-media+bounces-54410-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFYjOH9zp2ljhgAAu9opvQ
	(envelope-from <linux-media+bounces-54410-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 00:49:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED601F8764
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 00:49:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFE1C306709A
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 23:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698093750CD;
	Tue,  3 Mar 2026 23:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iXkpV3qV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kv+aI/z+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2CC372EEF
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 23:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772581754; cv=none; b=EV5yby9PztUzYGQjcfwLwYe/2xB1Ok7igbX0orOK0u7OJOA7LX3wAfAu7uXWxAIyOFjQLYl6kuvISA37+JL/8sPCs0cNWjN9dDgSDjVtheSiMiozyU4ZQ9BWF++arjbTpk2tQKtPD1Vm792/NSnU0cSeosKHC+gAVASOvzVY4zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772581754; c=relaxed/simple;
	bh=mYseUNinpQ80aXuwNfujYcBgWvzlBaXR7x0EHN5dO50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dgOFw0CWDK9/kNVyWSJB/Uobb2fwNNkxpcxt1zUhoVTk/4weSn6+uE7vLvgBoXEzVSNyZ+dy6tqpSLl435nXpS+9o8IMdkuywL4WFhmV7rm35BDLtI8YYlXrdxBeAlkiz+9VsQHFa5pH/DTUSCWD8yK74PC0EQ7Iiv0mtQyZ8KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iXkpV3qV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kv+aI/z+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623J6wG61791965
	for <linux-media@vger.kernel.org>; Tue, 3 Mar 2026 23:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2Ez97QM29kETV19x07hW3SnL
	BqdjTgWdQl7zCr9qeDs=; b=iXkpV3qV8MM4fWHwKy9JmyNB6QmIyqIZLU/cHgMT
	EmGrIv+5u+be0z34JU1T+hYQ4Ago7ddS+6KIAy1CMFD6FP5Dbol8jK4bcOWyvsIx
	hnBEY8kRNv4cSofZdGeJIcOimIn/xjUB26E2JfKpzjYbyTq5KovGk9SScj1pvEpJ
	mVwx6foXwWCVhMUmgZIA8TRwFuTaTq1Im//Svs3JYqrk2oVO7AdsvPjN64rVPbxT
	5ZBqQGNfE7zg0BaLYhTK9KCiO1g84kdfAFmqU+4WVQPT73X58XtP5yziVQBZ03sH
	BqjbUVh5Y6sm8c76GkxMGXpgD5ClSN34nJIiCzU6sEDEVw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp5h28unu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 23:49:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4b8e9112so532380985a.2
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 15:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772581752; x=1773186552; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ez97QM29kETV19x07hW3SnLBqdjTgWdQl7zCr9qeDs=;
        b=kv+aI/z+4O+EEJ2oolyFFmpTMudw2sNL+lBn7+2WbCpDimFlBG/+8lwfLQ9cObkOUO
         TzYjKHRCtnqgSRWgxoPJotdcNkD6ou95Y3QZuiKY/SIdqBTo8qnCa3RdxjLeJB1/Ay5h
         YYDCsNfRr1RYw3pMcT8/08F070LXA4HL6pfoNGcdfGzH7zzOr7vHbeugseAfSJ1EuRGt
         JlszEFBPltnD3gCPW3eOA+ADpFsH4VYe6fCob1q7OcTdPu/MCXQajsGIqZXRPJiZjboq
         tzxGAIeN/4nrnTmRCILI3wXuuT9WPc2hGAXiV5mw1vtE1a4smLay0yKivQ+bpAEkTLzz
         Yzig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772581752; x=1773186552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Ez97QM29kETV19x07hW3SnLBqdjTgWdQl7zCr9qeDs=;
        b=FSTIcgZygLVPCmr3tngTEUhlZBmVNVnqlIp/ofk8l27c/Q4qljsbVTCicZLjUoBsav
         KWs8fQzvdaRFd2/lAxB5rlTS4z8uojSdNO1DgdxjzKvUZwOzTDJLmQMLYzgafYqRARAA
         sNrqWU0M5fGn6KHFNZ0BbaDeeRs3t1I6f5aXGBjyfMdgJZa47bD1pgTfkl/vi6YryJhR
         bOE66IXx0mqtbnF8CqKu8EIsBZ+O92EW9wSipQsjCsdwmNZFlw9iW2gqxn8u8JJ2H6ri
         /rX5v/x+MMd4ZNY2rxEQWAkhFB1TMCUs98BCzr+pJaRFPxhZhFk+YXDVcqpRDWmKF6Kg
         ErNg==
X-Forwarded-Encrypted: i=1; AJvYcCW5D6c/KwCyvid1H/LcTUMCI00BDF6llciAr5gQ6ogHug35sqhQzg3/hc0DuvcKQ5MAUSE/Sz+k8IXiUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyD0sv5FwfXaZB9hqCuDMXiSCgVSwfPef/17aQTxvrB+RmB7MPu
	aaY7ujmtss5FRN3gYvNwa97sjDFTGm04HPJDQmshEAjvIXHmusz4/BasCtdnrV2VyxLyU6Jdz5N
	jITTwH13eTqHoNQqUZ4DIoRYlHpUxX/POQ/QUxv0zoYNLv/OYmPjDt8jpKWWg8iUzNg==
X-Gm-Gg: ATEYQzx2XIu2L82x7hX6S+3NHdsArkUYplbI0+A8dWGUcCnbXQuUh0RxmRq7vyK9CRO
	jZ0ZDPLDkfNjgb/pE946wKjDeI7wmDX7F/LfMRfMNvqLuuWHVlTaTvXGp+al0EocfxjXtZxj69z
	WsTiLKsOY0+s29syVy7Cchmcx/QQNzKjue3kk5MTX8s7jwIMnGmwFJc1Jv3T1z/3ql1Il7xp7Ka
	BBtVnPlBKNEkQOZ322YyaCxfnRYtC0IH4zR8VvsPRC62HDQyTyedp+ZxfObYla9Q/Lyd+uhutPT
	xvXy1yqia/kGG+pz3/85txMNsellg+z2Ru1vS+cTiy7P7Mw+/Ma6QV/g+c7mhf74tt150F/hc/3
	ItdMYfJhaeb/vxcoWii2qZiYTQVf0ReEflBkYy1L9zZASAVeyYhwEMIQvNq+ssQzDenjpLHQ/+K
	mWHNBsyeEY+Mig+2xFejbaODMChXG9AOOpM2A=
X-Received: by 2002:a05:620a:4804:b0:8ca:123e:8194 with SMTP id af79cd13be357-8cd5af16432mr30066485a.33.1772581752120;
        Tue, 03 Mar 2026 15:49:12 -0800 (PST)
X-Received: by 2002:a05:620a:4804:b0:8ca:123e:8194 with SMTP id af79cd13be357-8cd5af16432mr30063485a.33.1772581751666;
        Tue, 03 Mar 2026 15:49:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12357a141sm901592e87.48.2026.03.03.15.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 15:49:09 -0800 (PST)
Date: Wed, 4 Mar 2026 01:49:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Message-ID: <qcrwodgyayhyd7rpfglsxkefrufgqxjcs6n7druwr46wmkojvo@263ooobucj2c>
References: <20260226-x1e-csi2-phy-v3-0-11e608759410@linaro.org>
 <20260226-x1e-csi2-phy-v3-1-11e608759410@linaro.org>
 <c85fe457-c140-441c-93ed-342dce32e604@oss.qualcomm.com>
 <yhatx2iuoofvsqpu5da7ohpyvzhc2y7uq3bhuhfuv6pkfpqrnz@75xei3bawzza>
 <f83f616d-9114-426d-bc9b-42ddc839686f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f83f616d-9114-426d-bc9b-42ddc839686f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JqL8bc4C c=1 sm=1 tr=0 ts=69a77379 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=qA3JjpdOr7iP1nmkw04A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: yGECLxP-PniFsFO6rZY63feotkuiqdKp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE5NSBTYWx0ZWRfXz5qqB6gFE6qF
 V+G2qATYYxA2mf+S9MM0C7k90G11M1sl6/xRvbpeVx+yvBljbJtTeLh9p5wzo4KgSJknTacJAya
 6lNDIU0L5K2oTb6DlmcO1gvMPOupcB1crROe8u+GWR3rv/8mwj6jdWT6JCvyn12J2axFIbQ27ra
 g5OJ8wwJLItxf5EN07TwGvHavm/0F89SDFiis1XGxMYUpt+Bz4h3UJCK5qQoaiwbkGCXUKr4DQe
 JhsQV4aoUHL0s+p/KpdWfyKZU6FMpBhryDZQ8D/gvoeKtBd5nqFjPsy4E/MFsvBAJkLAMIFD0uJ
 yhUudb43EJ2jiywgVR1QuiKSDWExUQX/MBKl2ffG1FMZOHfnHoPj5BmLfeSPMclmDGPN8Xu9tbG
 sazSLEH7qvJm7jNtXimHhnMQmfm6SbpxjgIefzs3g0zFRsMYj/hvja79Dd1AMhiUaGYnf82fG6W
 HC9+niAfGv30RNep8Gw==
X-Proofpoint-GUID: yGECLxP-PniFsFO6rZY63feotkuiqdKp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_03,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030195
X-Rspamd-Queue-Id: 4ED601F8764
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54410-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 03:24:16PM -0800, Vijay Kumar Tumati wrote:
> 
> 
> On 3/3/2026 2:31 PM, Dmitry Baryshkov wrote:
> > On Mon, Mar 02, 2026 at 05:51:24PM -0800, Vijay Kumar Tumati wrote:
> > > Hi Bryan,
> > > 
> > > On 2/26/2026 4:34 AM, Bryan O'Donoghue wrote:
> > > > +        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> > > As we are cleaning up the PHY device nodes, we should consider fixing the
> > > power domains as well. Although TOP GDSC is defined as a power domain, it is
> > > not the power source for the PHY devices. Rather, it is the MMCX, MXC and
> > > optionally MXA based on the architecture (Refer to 'Voltage rail' column for
> > > PHY clocks in IPCAT). There is no
> > > parent-child relationship between the TOP GDSC and these in the clock driver
> > > and it was just working as the required power rails are getting enabled
> > > by/for other MM devices.
> > 
> > Which domains are required to access CSI PHY registers?
> PHY register access requires the PHY core clock, cam_top_ahb clock. So in my
> understanding, we need to trace these clocks in the topology backwards up
> until at least the RCG, and all the voltage rails powering these clocks will
> be the required power domains. Having said that, just register access works
> even if the voltage rails are configured to the min level, which camcc does
> already.

Are they not gated by the GDSC?

> > 
> > > > +
> > > > +        vdda-0p8-supply = <&vreg_l2c_0p8>;
> > > > +        vdda-1p2-supply = <&vreg_l1c_1p2>;
> > > > +    };
> > > > +
> > 
> Thanks,
> Vijay.

-- 
With best wishes
Dmitry

