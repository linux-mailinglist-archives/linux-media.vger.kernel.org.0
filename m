Return-Path: <linux-media+bounces-50055-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A21FCF9D7C
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 18:50:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3713131FE91F
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 17:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A0229C33F;
	Tue,  6 Jan 2026 17:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g7Tf7qlm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hMTHRVYd"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AC52874F5
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 17:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767720713; cv=none; b=G2i4RlNsAb5oqUsaPw5ZxJ6A5eucxBnf4ZEhD3lt4+sZgabgLiJUxSPeSZ1W7OsJnJyw9ejQuN43IgQ9doQm0MsCscoxe5FXSdJgA/msDqdqpNqk//nq+llAN8CFFA7tX7Q5obcbSuo77VDsGgX2EAyTZydF38ASTNMO7G9qBbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767720713; c=relaxed/simple;
	bh=EGL0IOjXzoy4ERSdqnDv6XXP02+jdc63zjGvHi+5D/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bOsES+wele3H6PJ/9RJXV/APkf1jWYfiYEWSWmEBL6gk5vRbGrfaA3DkAFLWI0/djV4afxGgLnC3HaKtRge3uRnOJnj8C9NoTO1W/pf4azgYMejzItTM/f9qf2RJAUQV/qhMW3joA1qTyTeYxtt5eKQrowjmW3iFsZfY5hz+EOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g7Tf7qlm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hMTHRVYd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606GrmpE4090722
	for <linux-media@vger.kernel.org>; Tue, 6 Jan 2026 17:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tR7f3o3xDPesUQHU2saQhPf2
	QeydtE64EkpRoTZj7tk=; b=g7Tf7qlmPp+umH1OgIEt2FQrpO5qwZlUUNF3FQZl
	HX1biqamPP+S3QFifEQzy9jaf2AY6vUJoF35oiXAOiRcf7HT/JpD4/pZg72K+t3C
	meDtBuSkuPUtpQRnlMI+BCeSgCLoRWGj5N8RRhOo6SsvbQAXRKQ5aOtEhqcE4YPR
	ygNhShsgBjdp+RDjAGGEWH+YOvuR9jhO2qYJ+ElfM8hMEzKhE2ZNzViBqTb49Tjw
	g8keG8le3o/HfvDI8obGawr+Rnl4TKuHIH1Kg8+DmX3jYJUlfvHZ3VLXqFo4lL1H
	x1kiM89xYc8xh3TUYxYELjFWUpGO4KxiTuAZ++/yYVIrPQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgyun9c0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 17:31:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee0c1c57bcso42870991cf.2
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 09:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767720708; x=1768325508; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tR7f3o3xDPesUQHU2saQhPf2QeydtE64EkpRoTZj7tk=;
        b=hMTHRVYd2Gffm7CO+R3mIjmgQU6ouV5rqGmY0YyIhFNC+TTNFoEWOt9QUg9od6M3fz
         m+iwYed1eAq6BRJ1HJ8ziYkHr5SQAqqLmVUyWHNjnJVFexoTSzSSwlfkHRSP8vUuVUGt
         yXcNUoOA4Wwh7pRgG/OF93H2n3Z6gMMA+hI+QtedlJorI4tV9tutrPedGcXzfzVdpTI/
         QdqBF17V8326BeqUuRdIhqWrsmBeBgMALVptR4hRQ2ErUQD4YFHZ1JO9LBfuHqDqFXjr
         Se2EvLCgM0KwOcH8BLlTHtB2ZgUhceZpLxVt4toAh77Ys/XmwNX+u+sUGFqQT5VeIUG2
         6LJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767720708; x=1768325508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tR7f3o3xDPesUQHU2saQhPf2QeydtE64EkpRoTZj7tk=;
        b=jgBAoSwJEzUM4TqhPwOqX6Nhk4+2B9qPpnXFkOL9CYAUYnvGm/6evCB6uoqQ8qFfcj
         rTyp14pgdpYZGNLO+vKR20StOJANHX2jb1qURKXPYx77L2oiwae7xzs97BeK6PWo12/N
         I0t6sWRmnV7e57I1aS8szLu+7W8nbvdAxXN/YenY/gEOxGw0B/RCjZ3Xebt14+cvRp3G
         po0VRzNzgN21IerfrNpKBypX2WB5SHjk8jMgEjgKX01iT1pO8pQ17aGQF/y8O8RTpkFJ
         6sHyaRrgk7cUHQvUbG/hNiu1BreVZbtyFtcn99jM0LaMW3QQaGsMtWX1yGXc0pOwgVMd
         ev8w==
X-Forwarded-Encrypted: i=1; AJvYcCXJWdDjL+O6bGa/2SwwNfurI0rU7JmYrko8yCjIPc+PzdEMdQzg3Ra0lvmeSj9qdXhx9/GUNyVYIpV2sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLX6HbifoFKaPcNtLtLYrD2ivrtXYLUIhPrtrn/ch1Y3T7ryC3
	gqW5laDAHjI5UXxAhzqFR3NpvoTYkwOHiGkJjMLm3AL+1VwjoKKwg1vG9/Z9jgPQZaCAorkiCAH
	qtBdlAdtrZ5qlrwhkAmXq2NDRcVYOf1Ft7DVTX1pkUjbk/alTBp4S6TO2+rlLGmhIEQ==
X-Gm-Gg: AY/fxX5Awsv/AmJz6rDi4XT9GkQdhREsywcjLcqU0cV+UdyT7AShhAxjRPxEEoor3Qn
	k5OaMUIvJOYo7Ij/HVqZt38FxBtLEdCHJ5Qrbvts/31A1IT8YTnR7QzghyyIZsS+xVqE6FJlFtO
	WwHT3NL8LpkfaOlgUTc26jGmxe9vCw4GntPxIGPtWABZwOUjPW6RaW1xyaWNfwfxol2AVVedD1S
	4u/21GggA8fOqYOQHlZITobI+JpxPBEcEjQPNMmRMirWP48h4zmwep58Yp3l+T/pKxcjrxT3yvF
	XCjGD6c9OK6KN9pKqE5RrLDnORACsUACMl2gD+NrKVx7cXfyVzPk2S5fta+/DTG+DFEhBsilAph
	+9GiHlqMElOUN5vr2E4xJ
X-Received: by 2002:a05:622a:60a:b0:4ec:f969:cabc with SMTP id d75a77b69052e-4ffa76a115emr42210991cf.10.1767720708505;
        Tue, 06 Jan 2026 09:31:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjf7OwaOn3HaZf8IWNrZ2eDSIxGAY9pKKIzvqd/zwCSP5LN8zraKCLgL67UkescNPyjj5pgA==
X-Received: by 2002:a05:622a:60a:b0:4ec:f969:cabc with SMTP id d75a77b69052e-4ffa76a115emr42210511cf.10.1767720707970;
        Tue, 06 Jan 2026 09:31:47 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a51183asm282053766b.49.2026.01.06.09.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 09:31:47 -0800 (PST)
Date: Tue, 6 Jan 2026 19:31:44 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, llvm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 08/11] clk: imx: imx31: Simplify with scoped for each
 OF child loop
Message-ID: <x2md7iusj467bjmmysckbkehooua3he652qqwr3yzaoka4sjm4@pk6uy7hq2lku>
References: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
 <20260106-of-for-each-compatible-scoped-v2-8-05eb948d91f2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106-of-for-each-compatible-scoped-v2-8-05eb948d91f2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE1MiBTYWx0ZWRfX5wxErVe9OKCV
 UTk0mp5zf/bD+rK6quT1dkIC2CGfIDTbcy9CkWHqHWUSkd1xu1LYFshde9viB23m17PJbQvdjFD
 qKvSUuMtP4MotMFOUUkBAyvata7fz09hOdSraqCZgEIgjNaIO/xmaBwJZM34ClHwr9MRGkL/vmJ
 U13mQeyTsVpeu3n06OyOFdXJ8P9AasLOVmKWWBRKfXXhuqLAzFWLHoQEvoAibCLqIXn1H1tUvpu
 x3iy8AV2MrCXjpv/rTPrv4pQNR6Zn1LCHQNpXDgUDsViHtTuDc9kPVdfbwehtLy0GlY10OlUVGh
 ZMHBu/QV15+mBkDxkdbJe0r4+KHNttKED9JP7lYnuGtu5MW4g+wkrzbHBNkehUs+ngPB5Fsdr+n
 zqB2Q2KPMMiVbfEi6g6fplLpVXdihYhlDEspyVvUzYEt/B24i9+M4YCiarNmESAMkXf5I4WZDGQ
 QXzafXDvBnvOahIHuVw==
X-Authority-Analysis: v=2.4 cv=YqIChoYX c=1 sm=1 tr=0 ts=695d4705 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=_Ixbbux_C5oTi3JCwyIA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: tNZ67d6PQ1epSavYYCQJRvIYgubbRPJL
X-Proofpoint-ORIG-GUID: tNZ67d6PQ1epSavYYCQJRvIYgubbRPJL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1011 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060152

On 26-01-06 10:15:18, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Abel Vesa <abelvesa@kernel.org>

