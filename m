Return-Path: <linux-media+bounces-55706-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIBjM44rtGkEigAAu9opvQ
	(envelope-from <linux-media+bounces-55706-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:21:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFB9285D79
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:21:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 93B97306E182
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 15:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773023A9620;
	Fri, 13 Mar 2026 15:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6wFI0Kg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gIDGAdSv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83EA3A8740
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 15:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773414147; cv=none; b=pyQEU8LiQaynfx/XJ37DS+ObGQciGJEe3apiD4p9VGeIcXpQUlirxO+oJ71alw3Zkz81f+vnbzQh+vOYekgvuGia4VKma3pfAj3MzFOcMifpsK8JDsNu8ZP/ZcMAZ+E8J6745Aw+SKJcAkILWbABWztkHWFDRpbgn3w8kTQy54g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773414147; c=relaxed/simple;
	bh=mzZtPop+kd9wHX66geTaApsjeGRa3Ox7dMES620e74M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZzqlRxOzyJvsAVg4RBDkB4x9eUbTUxPl0Z9GPAMXhk4xosPwAmm15IigNHMHYSvFvf6enMmxNee6tK7B91DbKfFwseXvELdEKTtIHIMQetcUtWx2YdOOKMv8nc/gUcLfh9HiLk98LV3oi9MMhzKkHhddui6edI4VUQyxKQ8PyYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6wFI0Kg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gIDGAdSv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D9U3EC1499525
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 15:02:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WMUq5P4ypLEyeKmuS5tsKloR
	VL58fpkquz0oY5oAxeI=; b=E6wFI0KgMwmyFaLzBNeAR8bTpbglXb2Nd1dAYC+V
	pegAe8uqUFODo/Ezs/mofND0DIxT0of5gcxkR3LF+O3An4mx1eOc+FmGLBD+xZz/
	zIMX9FJO41XWy7TSjkvgbR9ZXs9ObIVhK5vb+Xpng5L+rrFtSu8qtSSTLJTuZgYR
	+xGtA90qf3kHBRDyUC1BitX7rK8jtJSB1k+ssgz46WgpLMxa7GhbjIhTT++0yNM4
	eZ9rJcbVPVpqcg67/s43vevPJdCfqEbmj4ZXYsqm67swWanxJxCnceRNtH7sVfxA
	W/6GofkjWrXR9+zvIwt21hY3apBgYsXEOzRGfIOPAOuUvw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvg0hh3h2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 15:02:25 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-679c5ed0942so24762951eaf.1
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 08:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773414145; x=1774018945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WMUq5P4ypLEyeKmuS5tsKloRVL58fpkquz0oY5oAxeI=;
        b=gIDGAdSvNmu3dGMvhTzoKQYwpmynOo9t8PHYL2i3S+hZM9QYQWO/MbXV4TqUBsyr/4
         3OYTKa6Z+/zUJ6IUu1zpgWN1n4eWF5q5k7XHFdpZv8qsHccf6ru8SXPNkYKURLAJ5zYz
         Wm3CWwqOjyZt8pfwiDku/MsYOw21kLetEXwwj8PDKJSEThLipv4xOkimARUSntdgjoa2
         iPjyZPTmUEe+OcFJLCtZi38vEz6u+KqJ47fYGcnLPaSQDGcAGRMDqqteEvxshicVfTZJ
         KclAcO1IKzlAU8arGqpFU6D2le/m5TaoEhOcAmqUa7DS9cC3kp97sdKvlv1NBQejpUjo
         M/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773414145; x=1774018945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMUq5P4ypLEyeKmuS5tsKloRVL58fpkquz0oY5oAxeI=;
        b=Jj4VeFpXEaj7wtXlLCsc1et/1QGRK/Ot9JLUepsYTdqKIcXrdQjvsIcB7d4sbtCY+X
         okctb6RIJg/ZeRJ92hHBZqAePGe6jKshUYQwCEhWU/+bNdkyqRyW9G6E2HyZ0wmiq0Eq
         /jKqeWcOSiUoIJMdah1qUtzUSJCx6oAei+ik/yFmRqqbHcDrss3/ZqyISTXRTMSGy0IZ
         UuPLWNXociYBsCIqvNsowcs+p36VmPk6ZNAGvkRwpSzIhX/dvDGI3oTcw9hOtnMoH/z6
         MlcaNRWuIn3Yc8IpvxRMI1kMvEfrv7UkolZEs2fmlOWpTtx4oedTR3w//tDsBmWmuZFh
         C6WA==
X-Forwarded-Encrypted: i=1; AJvYcCWBoIY5pK8tQCIqDGMqBx5++vSjDo9+b71lDvkF+PkLckynZ+UnXo+GVE98k6sp3y6JJ6me84cPcp67rQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8OWewGZ+TUdV8F8o8QCh3Kl+lm4ys+0xqnP4/VpheUFKHkBez
	0bBYWWYV4klMUICnoJxh2BfO9dwQKtYZkFxwClZ71XbZqlcCfSqHST7P/OIiHdyWErKpYjw98CJ
	aMnqxltESzYgzFBN09XBuStlQNl1NzB4TUILwS86aTSKJ9nx7VubNo6LFrI7HDq7Alg==
X-Gm-Gg: ATEYQzzJn47ublC7wC2cO9I8a0Sh0ciOJ4WSz6OT6phSlHm6P2meazRN3rstVh7Lzb0
	CJBYgAUhb/ulzqeZV8SfIsDMf7CCYrHEc9ByIHTSFMJSr3AG+pXmOPJb9l2KbR5QjwumT5Y2Ypw
	w6oWf8Df+ElaHhBcrtO6C2TuRgZqdPusGLx61cmXvXlrVxB81b9fPUethZXoIPAwas09V2eBdfs
	VBGvjyFOLQYIITOSRPmnF0OIul+HWBkCPprmXdqEz4A+v8JEDYJlMcG0H+609AgRFaC/9X8CAs1
	NKSaHTSHeU5gcjFaRz5CsT4wPq58PsLILq245Q/uou+6FrMZkDPHuJosQWh+DehfUP1V+cu3La4
	kwKv2GrgTM2V69RRlcv3YP3WIcm5deFIh5AMNC4WgS5NT+XW+wrKmvlGFk/nVMtBTNttvD2/c4r
	MCQn16k9XoLIVtMhOD0J0SYel0LnQPaVlz3HE=
X-Received: by 2002:a05:6820:6ac8:b0:679:e930:b553 with SMTP id 006d021491bc7-67bda9ea0a4mr2208385eaf.32.1773414144581;
        Fri, 13 Mar 2026 08:02:24 -0700 (PDT)
X-Received: by 2002:a05:6820:6ac8:b0:679:e930:b553 with SMTP id 006d021491bc7-67bda9ea0a4mr2208321eaf.32.1773414143791;
        Fri, 13 Mar 2026 08:02:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15635786bsm1534849e87.61.2026.03.13.08.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 08:02:22 -0700 (PDT)
Date: Fri, 13 Mar 2026 17:02:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Message-ID: <hfuqu5uwjuh4ie55zwaqqbsflhf5yn55hnjva356nivoq46m2i@o5pkjnfrwycq>
References: <20260313-kaanapali-iris-v3-0-9c0d1a67af4b@oss.qualcomm.com>
 <20260313-kaanapali-iris-v3-1-9c0d1a67af4b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-kaanapali-iris-v3-1-9c0d1a67af4b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=T6eBjvKQ c=1 sm=1 tr=0 ts=69b42701 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=aeCAS9ip0PrbuPtrNpkA:9 a=CjuIK1q_8ugA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: OeZnu0I8YLhsiZK6ytCvA2Rzjmoc9Pjh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDExOCBTYWx0ZWRfX4dk6PZW/eB7V
 GHh/aPictbVz/KyDAHYwN484x/hAfTKtV3Y7oSsPzSWv5I7fHwLgiXID6sZj3QXJ3rl0pUer41o
 TO+fpSDLPN9r25B+pbfC2wU6QWhSFb5OrSc2gv0iSsmSzcRWZR+YDqcXmAXEAROxzHWd8P0f6qO
 00swrk1LrJ0SwXTNyH5FsGPjVLZLVsfCgjMJwisk+vg7VoxLhzkwtdB2b7sAfkCNa4H8TC4/eQ0
 FxpLiJBYKKCH1U1X5cBapuA2f3BFHK2iniUSDchR4dPM7wh3h2+GkOEVxIA32mGCjmUOrlPj/XX
 UbhkVANT/p0ArGxA/rdnE19wA+7r+KP8ApzhbH/oOlQScm0mceUtjCZwxm4MqRq7ihXNaG8I+4A
 phEPEvIcnZ8RdjI1jYdvtwpJLuJN4ryME7qRSHivlSogkirsESROnopnMA1jOwtdJzkw66sla1M
 RrPTWFzF6dXApQVrfMQ==
X-Proofpoint-GUID: OeZnu0I8YLhsiZK6ytCvA2Rzjmoc9Pjh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130118
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55706-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.30.132.128:email,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CEFB9285D79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 06:49:35PM +0530, Vikash Garodia wrote:
> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
> compared to previous generation, iris3x, it has,
> - separate power domains for stream and pixel processing hardware blocks
>   (bse and vpp).
> - additional power domain for apv codec.
> - power domains for individual pipes (VPPx).
> - different clocks and reset lines.
> 
> This patch depends on
> https://github.com/devicetree-org/dt-schema/pull/184/changes/d341298d62805bc972dfba691da6b3b62aa3ff15
> 
> Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,kaanapali-iris.yaml        | 254 +++++++++++++++++++++
>  include/dt-bindings/media/qcom,kaanapali-iris.h    |  18 ++
>  2 files changed, 272 insertions(+)

> +
> +    video-codec@2000000 {
> +        compatible = "qcom,kaanapali-iris";
> +        reg = <0x02000000 0xf0000>;
> +
> +        clocks = <&gcc_video_axi0_clk>,
> +                 <&video_cc_mvs0c_clk>,
> +                 <&video_cc_mvs0_clk>,
> +                 <&gcc_video_axi1_clk>,
> +                 <&video_cc_mvs0c_freerun_clk>,
> +                 <&video_cc_mvs0_freerun_clk>,
> +                 <&video_cc_mvs0b_clk>,
> +                 <&video_cc_mvs0_vpp0_clk>,
> +                 <&video_cc_mvs0_vpp1_clk>,
> +                 <&video_cc_mvs0a_clk>;
> +        clock-names = "iface",
> +                      "core",
> +                      "vcodec0_core",
> +                      "iface1",
> +                      "core_freerun",
> +                      "vcodec0_core_freerun",
> +                      "vcodec_bse",
> +                      "vcodec_vpp0",
> +                      "vcodec_vpp1",
> +                      "vcodec_apv";
> +
> +        dma-coherent;
> +
> +        interconnects = <&gem_noc_master_appss_proc &config_noc_slave_venus_cfg>,
> +                        <&mmss_noc_master_video_mvp &mc_virt_slave_ebi1>;
> +        interconnect-names = "cpu-cfg",
> +                             "video-mem";
> +
> +        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        iommu-map = <IRIS_BITSTREAM &apps_smmu 0x1944 0x0 0x1>,
> +                    <IRIS_NON_PIXEL &apps_smmu 0x1940 0x0 0x1>,
> +                    <IRIS_NON_PIXEL &apps_smmu 0x1a20 0x0 0x1>,

It think we still haven't settled on letting iommu-map to have several
entries for a single function.

> +                    <IRIS_PIXEL &apps_smmu 0x1943 0x0 0x1>,
> +                    <IRIS_SECURE_BITSTREAM &apps_smmu 0x1946 0x0 0x1>,
> +                    <IRIS_SECURE_NON_PIXEL &apps_smmu 0x1941 0x0 0x1>,
> +                    <IRIS_SECURE_NON_PIXEL &apps_smmu 0x1a21 0x0 0x1>,
> +                    <IRIS_SECURE_PIXEL &apps_smmu 0x1945 0x0 0x1>,
> +                    <IRIS_FIRMWARE &apps_smmu 0x1a22 0x0 0x1>;
> +
> +        memory-region = <&video_mem>;
> +
> +        operating-points-v2 = <&iris_opp_table>;
> +
> +        power-domains = <&video_cc_mvs0c_gdsc>,
> +                        <&video_cc_mvs0_gdsc>,
> +                        <&rpmhpd RPMHPD_MXC>,
> +                        <&rpmhpd RPMHPD_MMCX>,
> +                        <&video_cc_mvs0_vpp0_gdsc>,
> +                        <&video_cc_mvs0_vpp1_gdsc>,
> +                        <&video_cc_mvs0a_gdsc>;
> +        power-domain-names = "venus",
> +                             "vcodec0",
> +                             "mxc",
> +                             "mmcx",
> +                             "vpp0",
> +                             "vpp1",
> +                             "apv";
> +
> +        resets = <&gcc_video_axi0_clk_ares>,
> +                 <&gcc_video_axi1_clk_ares>,
> +                 <&video_cc_mvs0c_freerun_clk_ares>,
> +                 <&video_cc_mvs0_freerun_clk_ares>;
> +        reset-names = "bus0",
> +                      "bus1",
> +                      "core",
> +                      "vcodec0_core";
> +
> +        iris_opp_table: opp-table {
> +            compatible = "operating-points-v2";
> +
> +            opp-240000000 {
> +                opp-hz = /bits/ 64 <240000000 240000000 240000000 360000000>;
> +                required-opps = <&rpmhpd_opp_low_svs_d1>,
> +                                <&rpmhpd_opp_low_svs_d1>;

It's a DT and not the schema question, but please cross-check the OPP
points here. If I understand Taniya correctly, we should be using
corners from the PLL type rather than from the video_cc clock plan (they
differ for some reason). Downstream videocc driver also should have
correct rail corners for the PLLs.

> +            };
> +

-- 
With best wishes
Dmitry

