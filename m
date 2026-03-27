Return-Path: <linux-media+bounces-57372-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHZGL873xmlvQwUAu9opvQ
	(envelope-from <linux-media+bounces-57372-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 22:34:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2894134BBB3
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 22:34:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B96D2301726F
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 21:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B82339890C;
	Fri, 27 Mar 2026 21:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VJWAoEus";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GgzZiX3r"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC26396B84
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 21:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774647224; cv=none; b=ka5XhfvV7deyEArPCzGrfObUwrCAXIpItOHzjdO2CZHyY4QGl0wWsciYkSq/r0NoVI/8U4DnBAaqCG/j/X+bs+wm/ivmMr9AM+0uKLBx3pr+MnMSyhuI9HwUcKlimfUd3r3Ov85Gl95Yk9IyoUqpp1XthScXe1nmzgxZrrIRPZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774647224; c=relaxed/simple;
	bh=G/NWZGW9c3/9L7BRd0J6hKFCfS3MWwJWicxI2gFlW+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YGetC73G5UmiMN2T+9VDm5DIPw20laUqtCQvwSi7CniSJIvLRrGfTzGvaBh3Z253UuKuqdnI0Pg/u+vkRam2HftYdsm3ySSKF97TMySd4BJM6rhrPwjoK/DGEdlyRenKFIb+f4P9uM142RC83seYusM7SKQBGZdbqHu4IJjAzZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VJWAoEus; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GgzZiX3r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RKtZAI2593181
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 21:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JkD5/e5PlfbVCPnIJK6O5WGSSIEFcuniRpfW4c/tKlE=; b=VJWAoEust9LgiZpg
	Z37KSkWXfwn034u+uMeQAxvjcy1pdYlF9dkLZrH0sj+69ppvwFu4brR0tv6PhN05
	6oBVFA+oLpSLZEPH4DvoK+HXIWTmW+fX7Bcrjl0eKH6w57mibQmqLqoRTe2+MLlZ
	3Sc6ADa0srhGyidf95VENQmYQMoMXQ41xdPWUBXqEjYIqREYTKAXTh5dF4Y0r0Ic
	h2Tl58c3MEALhXpoalXDumSnzdomVPv6bcKjzzrvB6fgSIlG4Hmnd2B6TPg7Bajq
	z4i6TAoH8kG0R0fD1sWUXFdT/T1Sf5C0xV7qhYl+Ze7incEuZFfCHHU6P+r5QFlq
	V8cUPw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5w30s0rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 21:33:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b323c43fdso17903241cf.2
        for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 14:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774647222; x=1775252022; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JkD5/e5PlfbVCPnIJK6O5WGSSIEFcuniRpfW4c/tKlE=;
        b=GgzZiX3r4j4wwtk3QFmPXBh3WORITheoaX2xMaNdjyNyPxOdx+208m+tAjdd2jh8Q0
         P5Ms0FA4SezwHRmHesK8rvN8U7xDFiCr+HXFj9zvGzRZHmE4uDdAFZ5yjOl7BUh0ZcEt
         ZdHok44Hn0zRlb8p7r/Efor2kLUF7IjdMvcNAJiX4Z1Wo3LssBh5DF/7i7bayVcUpWP7
         nowX4aSy5QWliKdDFR3wPQ7J7i/SBlGxg2ZyLCpDgA3EON7yegRdgbugSdUwKDsB1SDW
         mwj1yXIbMIMDfLIU0Y3Ho/AXgSoqthWySoNJfe7UoqAB9RAXco2kbIusGKOCM76X5qGW
         vesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774647222; x=1775252022;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JkD5/e5PlfbVCPnIJK6O5WGSSIEFcuniRpfW4c/tKlE=;
        b=NoKHzoGOlmmTcHT6skYTiacvMpD72M91Th7uyZOHsSVp8hwD8RNmc+0pPG2MqhzzNR
         yo919j7mvJmfz9MEwASL2W/uzYwzpzeFQ+LpVfDzCZbATUBxlhR2L2XIWkV9vCUMkNM5
         WcdZU32hAeKPIQOoS7z7cv7U+0MNhN/doWt5qDyiBI4vF4MkyBxhPAeIjSVGvcKNMxTF
         D1jTdB258lMrHLKXQ+dSX2P63BC74IzwA7/mk/uj68OOeO42lKVBrETs96wa1yp6ts0b
         0pbI/9qC3wajwSxqdYIMpcXstt3AItLZlciX8qlR60ryMNXDnphepWcn1o+gJW06E7Gx
         kR5w==
X-Forwarded-Encrypted: i=1; AJvYcCU0Gmgldt1X9+Z+u/sXkmULrFD2hFyyoWDSswnLIJC6xru2A/Wu0RVkO09Tjhyj2/fsAfoE8rNvpjfXTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVYDBScE90ie5ThCMRr/tneQhJSQJ7BW44IY+6J2vwMNbuGl/1
	PrJqCdL0WghxuMUM85Ewlt3syqHy0TdmB6lO5xFRR8Kci8IXAp3PcszYBtFldWednlNCFaY5Vg7
	QEWkFFe3grXFRvYz2i/LjEoeIGPv+X2YdRz7UU/+0KNMx8yLW1TbgkZ4yiM/ITi8W0g==
X-Gm-Gg: ATEYQzyg3+KjIgjHnV2h41tqPr808M1fEzHJYklIVpyOqopM5BDnCMO1ah3U9FW0aRk
	E/CtaUig4B6nB/UqJvgZPLBlJZCJds/mSPcJ6L12Fd5UIbJQ7slaQCZmipu2iuc7u8IiaTUKhs8
	0WNy3oFrOvCrVdZyOEvlfsDLiEUraNNhSW4nZ2vKNpX8FExx1GHTgBR/dzL3erhif4q63V5N8td
	qB06p+jGMVh+UXlyK2PIb+F4LBr1vM3cnFjTbF3CvJOo0SvtZJLreAzlTahBfyxB9BhF8n6ZbVs
	RnAitCe8F831FlwwBDXV6nxK5qv5qE93bokaCxloLaxv43NsRleYLVEOqhQnX6qo59KEq/JPWgQ
	npnLgtTZ2Zwvj273rY06Bt3/CSYbQuAttajrGzd2MSG7S6VGHoyBfV77naY64+gXI7OtzB53L4k
	owoJ10g3pgD8j0wMZvXXsxjsj6ZU2e/PGNypw=
X-Received: by 2002:a05:622a:1a9d:b0:509:1a36:6ad9 with SMTP id d75a77b69052e-50ba3813246mr54400951cf.30.1774647221829;
        Fri, 27 Mar 2026 14:33:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1a9d:b0:509:1a36:6ad9 with SMTP id d75a77b69052e-50ba3813246mr54400481cf.30.1774647221375;
        Fri, 27 Mar 2026 14:33:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13fd008sm40385e87.19.2026.03.27.14.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 14:33:40 -0700 (PDT)
Date: Fri, 27 Mar 2026 23:33:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v11 4/7] media: qcom: camss: Add support to populate
 sub-devices
Message-ID: <b7hndy63j2foc5iuly4reaunaorvg5asfgeza5ptjytaghc772@6jxgnimkcvx6>
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org>
 <CAFEp6-2s=N9=Z5A3gZZYo+XErBT=gMRHdxB7EQV71wPd3UqYrg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEp6-2s=N9=Z5A3gZZYo+XErBT=gMRHdxB7EQV71wPd3UqYrg@mail.gmail.com>
X-Proofpoint-ORIG-GUID: dTH5HA_oTlVgBxf23uqLC025HQG3d4Fg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE1MSBTYWx0ZWRfX3geUbZLNBrvX
 VVaiNS2PT+iJyDLay0jnv98o43yvlup1uY6v28vA3cvBb5Lw5aKczFnD5FyNfYBzqi65pOmzpOA
 eXNWNtaI98QSvpU+uPNLYg5fipiewoJjNaMgUr4JxOkaJOShhwvWH9uSwOvkptqPWYq3YdYcxki
 5Jee9bcm13nHkJTdZ/96dS6Ovoku5Q+SAokNLkI1Z3V+X2EBe90oanwvNLgjbJbqPs36x+txFoM
 BTq/MHFjrfA++SUjaWBnC5Xe9hvbXjlNM8G0mHOg4in6XIA5Oy89sHOzLLz96LzBGpvLZFKHRDd
 QQNGaphk4EIoGoqvdwcOdjQ6AgVl35WVLQACrdKiu4uC/8lXYCtrBmyo0bIPRp/PRqIgspEkrLX
 Lulfc6ml7w+zO2boxyIQQsZFxbf3TNPSPk01XCt51uxstJ5rbyz4yO0TCo5Igt135GjxAKzKp3Q
 NjaMjYrkkjpZcBn6UKg==
X-Proofpoint-GUID: dTH5HA_oTlVgBxf23uqLC025HQG3d4Fg
X-Authority-Analysis: v=2.4 cv=F9dat6hN c=1 sm=1 tr=0 ts=69c6f7b6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=8sstYimgJ8ds0kvrxP0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270151
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57372-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,baylibre.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,linaro.org:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2894134BBB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 10:22:04PM +0100, Loic Poulain wrote:
> On Thu, Mar 26, 2026 at 2:28 AM Bryan O'Donoghue
> <bryan.odonoghue@linaro.org> wrote:
> >
> > Use devm_of_platform_populate() to populate subs in the tree.
> >
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Other drivers typically call the populate function at the end of the
> probe function. In this case, however, it is invoked before the main
> resources are enabled. I assume this is because the CSIPHY device
> needs to be available early. Aside from that, it looks good to me.

This becomes fragile. The CSI PHY might be built as a module, which
might be loaded later.

> 
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> 
> > @@ -4964,6 +4965,8 @@ static int camss_probe(struct platform_device *pdev)
> >         if (!camss)
> >                 return -ENOMEM;
> >
> > +       devm_of_platform_populate(dev);
> > +
> >         camss->res = of_device_get_match_data(dev);
> >
> >         atomic_set(&camss->ref_count, 0);

And this looks suspicious. What if drivers for submodules are already
there and start probing once populated? Do they have a chance to access
this ref_count?

-- 
With best wishes
Dmitry

