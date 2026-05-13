Return-Path: <linux-media+bounces-61446-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPbPJc+CBGrVKwIAu9opvQ
	(envelope-from <linux-media+bounces-61446-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 15:55:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4DE534756
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 15:55:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7904E30B7AD7
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 13:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4693101A6;
	Wed, 13 May 2026 13:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k2+sVBYm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JdRADfFJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E0F30AD05
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 13:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778678780; cv=none; b=eu/kRqzLmM1NqHRYI7Zk5TPZFnneE9S+NlIY9r6FRm3dBwtD00YrNDgHVPNDSVCPUt8BSFAVb1TaeAsJSK9JYMfiw5v/x21KMfli5L+fB8NWMofemC7mJDBr7WVjSGfSR42xPvwofAiM19VskEc9/SAQAT1kDN2ndphfx8H2RpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778678780; c=relaxed/simple;
	bh=iAJWuYbMSvTROXJv3+FzvaZZ+BZO08pNZvCxfks3kuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ws9Ivy2dX/C2dHOiSw1sSa4p6xEJ1LQPOc3JVDtBVw/7yzlyFtlNGpjD7lp0two5p+zx539jorEXg2qRBrdxYoFsC1KCc0sPV7DBFYJTngk0XroV/L3LjnoRkQytYPOk2bzNl4fdY65NzuwiINVUz1NXeavztd3RYkrsCO2nWQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k2+sVBYm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JdRADfFJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAeYxo1393072
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 13:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1A2JIuivfxTHNE33J+4ZfrSn
	HuAPEzqRV86Vt32AWoc=; b=k2+sVBYmVZ6IQNmSNTSEz1M1qd4wswCJFFvnyNxc
	kR7lMnI/qoifc5tBfwJtdRKCTTiGgdsMz53yoebwClcfnY4u2z7KDVV8N0s5w8pM
	W8cKzo6Pyw49XSwLNl/sGtES8RtxR5OCVPg+6l6DrndShstRX+wLtSHhICzhmews
	uiyfDo5q4si49V20xzR96tc/NOXPeH4eyVCo+zdiJIPFh4emrffgdjOMqnK6ZoGV
	oJ9ZRRaP4uFdbrNL+30g4uuGP9zSrK3seLT8SuPK1egfaPDPK2XirOkRWhQ/qoyn
	8L7rD/LIjoc0YeAGlxRJ2/m/+QPHuV5C/YWW/sNOMVpgvg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k261tk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 13:26:17 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95f4d5efbe9so4659919241.1
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 06:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778678776; x=1779283576; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1A2JIuivfxTHNE33J+4ZfrSnHuAPEzqRV86Vt32AWoc=;
        b=JdRADfFJg+MGX5JTGsYIaa78a12PCFWERcGH5btDGJN5IOTWtLMMxakg5N5dzimGNi
         6K99e/KOonY4q8djOmbIt5eA4FIlm1QESNQmsiD3R6vTjP8Upb/AKhrwm6Axgr2iT9TI
         0q2i2k/KZBdyxEbPYkrU4WnRroZ6TDuEgTmIZwf+e2gMI7Y6/IMVG648C8N/wik3KKsY
         JRFP356xPrhTBSvz08uS/lgymt3YzzaTzRiq/c9gmBW+AxWmjrzYPVcm0oPP5p9x4Jqs
         Gd1tRVPc2jzXJXZJpc8J2XGtDp4O3ShErtJTFEeSmJArEjEowLwLUDZJJHQbTrmWXUsy
         Q9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778678776; x=1779283576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1A2JIuivfxTHNE33J+4ZfrSnHuAPEzqRV86Vt32AWoc=;
        b=Dl8jZIXOlD29iXqbAunlHwm/wrlgnCvgx0zLKmnuq7uaV3tfi+5Ie8RzM7RG9odbtX
         sCjE9yuVUMrA8JMSryni77M1ohq/IHLDgkM0bGgC3lbEoaZrtAnajPfnQuv1QBfKlylp
         dvwWmFLxf+nY+Nd3wpwe9yeP3IkYho2xU5JPvAaHqVi7z7RVrEeTqbPBP0oovt2BGjQ8
         zns+cFK5k2iT4CJlpONYpHtbA8fNVG0ERHfmGrrU/IgjAe5fx2b6+B/V7D0/7R9ZNwJV
         KqeBdIrsabockFkDlhQn+Mdjsxw6VNIn+GmQAS4YnMzvY63kaw9ix+wogQFhTNhn+oG4
         bzDg==
X-Forwarded-Encrypted: i=1; AFNElJ9lBU+zJ7fm3KWe/5Wqs7NpS1kL5hupu4Iyz0ODUnGkK8hDbZUxuSaf5JC+vgdmMm2EMyc0lL9jdie+vg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Ic/BoxpYuuY/Yw2lZfqD2t4WC3bBdUUDNx4cekYRbhYMalpM
	ErAsmSJmFV/KC8ossQUjBwCRAKXZ7hUdgqj373Ojj7jbn9E76qbJ3gX8eg13n452hrk1AZhn5aK
	+LekEU9nnR06rliO8LXcaMVJreZjImzd3T5CN1PQYaFojviCFTJpZ/Wqh+BgOQs8ZSw==
X-Gm-Gg: Acq92OEFrB2oeUm5Bdmhhs/sjBp8CJR1NAIVKqIR5xtFk1KagrXBWW1vjXMS7u2nrlw
	cvBGbzTuG3ZCP0QaCb2oY3bhsd4fvQHJVQkrysh9mpDwfp+qXFP9hs24iNrxG8EteE3SI9B1KJr
	XuE1Xm4+MuYPovurfXClKwViqlHLS+Y2R7+Ef5x4aWz/n0Z3zilBHxToWu161TiqsITYmC0exrP
	YP5p7HH3mNWfsff8zvqNBG9lgEzjoWImtsLbhyT/DDfDyQpkLI6XMlC/RsEciBVea39LmCgkaBe
	9S5OYWN9SVfg7skcFZuxHO1azFDmoslZttBTwNtZ0ItWHoaWW3rZy3ypcw/k6wj84GOm69jdq4k
	7SmoO1Utc0OdhheNTPxsAn2pNFHA4y982xKkQWKUMbcm7fGb8yiqf2EalZzZx889tP2kKld73eF
	Xb1xfrCAtioM3S9lx7moYNoJNKsflG9MsXl0w=
X-Received: by 2002:a05:6102:c4c:b0:5fe:af0c:79f5 with SMTP id ada2fe7eead31-637733e73b9mr1509873137.5.1778678776037;
        Wed, 13 May 2026 06:26:16 -0700 (PDT)
X-Received: by 2002:a05:6102:c4c:b0:5fe:af0c:79f5 with SMTP id ada2fe7eead31-637733e73b9mr1509786137.5.1778678775359;
        Wed, 13 May 2026 06:26:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f60db2f3sm41011661fa.22.2026.05.13.06.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:26:13 -0700 (PDT)
Date: Wed, 13 May 2026 16:26:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Liu Ying <victor.liu@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>,
        Jackson Lee <jackson.lee@chipsnmedia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mirela Rabulea <mirela.rabulea@nxp.com>,
        Detlev Casanova <detlev.casanova@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Heiko Stuebner <heiko@sntech.de>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, MD Danish Anwar <danishanwar@ti.com>,
        Roger Quadros <rogerq@kernel.org>,
        Parvathi Pudi <parvathi@couthit.com>,
        Mohan Reddy Putluru <pmohan@couthit.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michal Simek <michal.simek@amd.com>, Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Linus Walleij <linusw@kernel.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
        "Andrew F. Davis" <afd@ti.com>, Hussain Khaja <basharath@couthit.com>,
        Suman Anna <s-anna@ti.com>, Ben Levinsky <ben.levinsky@amd.com>,
        Tanmay Shah <tanmay.shah@amd.com>,
        Erwan Leray <erwan.leray@foss.st.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Roger Quadros <rogerq@ti.com>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: Consolidate "sram" property definition
Message-ID: <ldpcnzvloffhiubmv6zxhfzqo4oz3ntkmav6zjprmbnsrxd46z@t72iga4xvaji>
References: <20260511165942.2774868-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511165942.2774868-1-robh@kernel.org>
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a047bf9 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VwfjHJzzgIKQiJfiZN8A:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzOCBTYWx0ZWRfXz4PYnnIVYYuy
 RQEgUhWlBTg719dCshJYJLkVoEb2Jj8Dr2v3RQ3lhvr7G6kwj0yWZVmh4k+q/CwQzGH77j7pVrU
 9fYv/EcpTRMhw83hbTpiRfIqg4UrVP6P958MtZSU3tZFqZDRXY3ZwxkaZzpWvqhbHqKfTEGZNVQ
 hmOizNJ54ygprTQyg7IySgWVtNRR39R7Ssuab1ifDLWo4OpnhFlDn27X3byxvjxSwtr3kppp48A
 1VOBGFz6uTYahM10mJsje4Xwphy2PUJmR7MV1an2I0fyqGuM+Ee1sIta0gCgZqELLpWDb9AiSXZ
 HL1rFAV+4Ow+666QJPufNNU11gsp0sF1EFpTbclDeMZgtlJQEUbiZFOggzpmGweYGZkgLr0ESSS
 54qZbreUkGdjDCU6Se+EjcKEIhOLNbVZ0qcnLt3DAd3mq1/I0SFPFChM+OQbtMgFWAo6A/yRzyL
 4+5Bdcz4G9u6Uqs+nGQ==
X-Proofpoint-ORIG-GUID: SgQXdUEu-Bm56uXxmYDd4Ta2EKbZR4tA
X-Proofpoint-GUID: SgQXdUEu-Bm56uXxmYDd4Ta2EKbZR4tA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130138
X-Rspamd-Queue-Id: 2C4DE534756
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nxp.com,pengutronix.de,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,poorly.run,linux.dev,somainline.org,chipsnmedia.com,collabora.com,vanguardiasur.com.ar,sntech.de,foss.st.com,lunn.ch,davemloft.net,google.com,redhat.com,ti.com,couthit.com,linaro.org,baylibre.com,googlemail.com,amd.com,nbd.name,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.infradead.org,st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61446-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[80];
	TAGGED_RCPT(0.00)[linux-media,dt,netdev];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 11:59:36AM -0500, Rob Herring (Arm) wrote:
> The "sram" property has become a de facto standard property, so create a
> common schema for it and drop all the duplicated definitions.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../imx/fsl,imx8qxp-dc-command-sequencer.yaml |  2 +-
>  .../devicetree/bindings/display/msm/gpu.yaml  |  6 +----


Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # display/msm


>  .../bindings/dma/stericsson,dma40.yaml        |  8 ++----
>  .../bindings/media/cnm,wave521c.yaml          |  2 +-
>  .../bindings/media/nxp,imx8-jpeg.yaml         |  6 ++---
>  .../bindings/media/rockchip,vdec.yaml         |  5 ++--
>  .../bindings/media/st,stm32-dcmi.yaml         |  6 ++---
>  .../devicetree/bindings/net/mediatek,net.yaml |  3 +--
>  .../bindings/net/ti,icssg-prueth.yaml         |  2 +-
>  .../bindings/net/ti,icssm-prueth.yaml         |  2 +-
>  .../remoteproc/amlogic,meson-mx-ao-arc.yaml   |  7 +----
>  .../bindings/remoteproc/ti,k3-dsp-rproc.yaml  |  8 ------
>  .../bindings/remoteproc/ti,k3-r5f-rproc.yaml  |  8 ------
>  .../remoteproc/xlnx,zynqmp-r5fss.yaml         |  9 +------
>  .../devicetree/bindings/spi/st,stm32-spi.yaml | 10 +++----
>  .../bindings/sram/sram-consumer.yaml          | 26 +++++++++++++++++++
>  16 files changed, 48 insertions(+), 62 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sram/sram-consumer.yaml
> 

-- 
With best wishes
Dmitry

