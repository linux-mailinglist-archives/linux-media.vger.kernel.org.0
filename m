Return-Path: <linux-media+bounces-50056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8D4CFA254
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 19:28:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3ED032201D7
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 17:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622002F0C70;
	Tue,  6 Jan 2026 17:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jh0WVdvT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nz4sZcfa"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48BE2EBB9E
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 17:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767720875; cv=none; b=msQ7bb2drPPU4zQDTGEAA/dtymBQTGiDNX95gAMwSJwxWV5UCGFyjvGPsbFYrpr+V56OVqifwd1d01xm9JL6shy6/w4Pw7GxTmO1BoDAaPJu4hTalLOyJhhjJyYiY8/e8cU+OX59ApWHhyvzszgXsfT3/ISo9XbfV7/cTJuf53k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767720875; c=relaxed/simple;
	bh=4uAAVaBUqR7XbgPYM+b3TErNU92wyGwrj6qD+m/4Eys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OtawLGHSi4BHxuGcM25MUuQYQ0xZ2smQ/fcRyqlmIm6xupqacaNu+K6Q2j0FGI404Sug1Yy6L5cLiWoD4NcYikYFKA02HXN7/gSArr0FG3ag23c+2L2e21xRjb1YeTjanJs6dfQyYdEFjzoj92PcFJDOKz7YVATDj65TqFrNi4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jh0WVdvT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nz4sZcfa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606GiqGP959394
	for <linux-media@vger.kernel.org>; Tue, 6 Jan 2026 17:34:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jzSTS8fbRs1wSAGF7WUmIraz
	4oEVJgEJtLyxFPfHdeY=; b=jh0WVdvT/iHJCW9ccrMMRQSXa8S7RznjJF2rwsEN
	YKwyXrzMt1PfUGji8KYBTIfsqkOYc3GpQakVO9XP2+xjmyL6iXyXAFfb71sInSdv
	kWR7WbHq4o4RAv6mIDMxZHsbokci3U62YI6Paaf3X2NngzaBz4EKYYB4U667tyq7
	fn1r6oK0Nid52Eg2ESQNbj+OEW++qF/UfR9bcvHyZIrWkZcaUrFsLyPAiE/LR2Pd
	sydRPjtTZOWB7NNLg+Yzs9VHBMmrEhJ8R9K14MnudQhdrTihKF8rlaiHEKxKmnro
	t1+GLHOBC15gk5klSTnDod8Ij2r5Jn4z9szjZqTb4BWpoQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66er500-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 17:34:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f4d60d1fbdso53989471cf.3
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 09:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767720872; x=1768325672; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jzSTS8fbRs1wSAGF7WUmIraz4oEVJgEJtLyxFPfHdeY=;
        b=Nz4sZcfadxHAci8TJaPY7PKYE2OPXJu9G0hJXPaa4bTg6uE4Ezd9zERwAKNQa4lBTR
         6LATPjCSwvJYDdd7GHGAh5ZbuyUeZDYQzcCe0tKaVSWjDAZaTKZYjwg7IbaY0C59JJg4
         60jtQqTPYnQVgzR8cRk5eJHh9M/bCuT7k+WeN9YNwFTtMBY1jZtlgaybbBcXzmWOS3k3
         84sB1Cw1OmKumjscHgQPSzZ4jhMosQJn6YLafe8GqAoufxLhp0lZcvj6lrp4+5XsgKIt
         GK4fctpw3GyoiZ/jR3PEmwsBEY39Jd0ZyzOAGJBALWIS04MF/7JiotqCHd0hUPfLJ/Dv
         ZxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767720872; x=1768325672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jzSTS8fbRs1wSAGF7WUmIraz4oEVJgEJtLyxFPfHdeY=;
        b=O5UmmmBhTgmxH316vkt9cIkKvL7jKeNZdsLS9OUCAY3Hj0MqRkDUpx+rIdPL/Bntzi
         RcKStdNOUoy/C4cfISvS1y+6N8rOFZNC5RVCRgG0P23Dt86sa3VPkns6Sp98QlME8rgK
         1pyHGHpP9qFdG7UhXH4btWeV4LxCxKQOyfrffrn5MrIiWubxQ64/Mx0zoEVc4huc2gNI
         TMdvmW5l3We5PW1oF6Z3wuSQ9/02FR4+2QCZoN6RoE7h45V7r2HTgvAnv8qqygGp27Sr
         71YWyQyaRSHypLokJuddT7vVOhVy6ac4FxDoaOvJ+RZs9pdBHYa5jhtXTmLxXsDYyJCs
         knRg==
X-Forwarded-Encrypted: i=1; AJvYcCUt9UDq/Ab3F8tTt/nlwVdjmArzQIg4rcx10HwAxaGAC+D7o/KxuOKv2wrr8d6vXcYPBLExiziq13KStg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQUoSr/myTaiqGZWK/eGHVj16pnQXbmm7ierE+tIJqQCCpfRSt
	LbMzYhNMxvMSL8vsbeIPebPt6epxbhbK7jwxKT3g6IZ8oAPykGaZDYVdvCT4f66KI/kbbhtBhKU
	hH99BMRr7rXveD66KTy/8Q3rMzsmc29NOKpN5r/q8P8uhFvE9yovey+S9YXkccFKmqQ==
X-Gm-Gg: AY/fxX5nRFPwNC6qpLyZZTVnQJN7i7ou6/z+N2bURku+h6w79TkZUtoB3lFkTICAM+E
	VyfaDRx9WmLm71nXTZ/DxV+6s/nAyJ2HKJxtYN0rrRLJTfihgshgYkDf70lMpgWMvU/t2gsj4j5
	fGMDqtEEXyuju0Z/e/RTWU0SsUixOO+bbrQ49CwWZeSswEhG8Kr0zAoF+M17i2sZelYKi4mNNu1
	A6Ufe6F1O7h7FA/y06Hk9d4vqsDIl2HcINvcaxDaecAQNNcfpA/76VXYEsqRiLyAApeoBDcEZdd
	B47n8HvewwvCYeSHTCWEeLWK4WJQ95+gOaBCTlYoxi09/C2qxeZVcuwEUAsTrm116RIVxf0lOkG
	mB7/EgjcDf/kGfiPo53Zb
X-Received: by 2002:ac8:57cb:0:b0:4f1:b9fc:eeda with SMTP id d75a77b69052e-4ffa77597abmr57403151cf.37.1767720872025;
        Tue, 06 Jan 2026 09:34:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsS5Q8M4Ax4uLqCekfjuM/TS7dC5bAY2/2l4KJvBIfjf+72ZUp+kPt+lte2C5fe//DuAlvyA==
X-Received: by 2002:ac8:57cb:0:b0:4f1:b9fc:eeda with SMTP id d75a77b69052e-4ffa77597abmr57402111cf.37.1767720871283;
        Tue, 06 Jan 2026 09:34:31 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d5absm2551707a12.33.2026.01.06.09.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 09:34:30 -0800 (PST)
Date: Tue, 6 Jan 2026 19:34:28 +0200
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
Subject: Re: [PATCH v2 07/11] clk: imx: imx27: Simplify with scoped for each
 OF child loop
Message-ID: <pbmxwpyohpq3pi552pjwwgfe5wcj7qq7fx6lofpod5mq4bvmwj@sn4yfn74sgiz>
References: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
 <20260106-of-for-each-compatible-scoped-v2-7-05eb948d91f2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106-of-for-each-compatible-scoped-v2-7-05eb948d91f2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE1MiBTYWx0ZWRfXwDbIrrQoVWyr
 YVLzUBE/FRojTH9MhucPUAQGgvCg6Y/E9W3B5loD9yI50qGt33w2EO7u0UtkFezAOxigvUyfWU0
 wXsEWgb4Svbo032xX4SDpgUaNm89v+pi3L59ZR35kudD6uMBekx7MhjTiJ0yEZVa8TcurAixY9Y
 cjGxALANXcTbcp91wlgKwhLaAcPv19PwHYKAGTw/s5DvC3xadCEqWy+otxnrep5oZTztHHLDcV/
 T91nMvOMHoDR0AmMMJuc5lPP1oXQB02J/YuPy5cVUR2yz9EwhamPijbwzH+mHirHMby5PfsVuqX
 fNwy/Qhi8pGOv2lkNRiv0HR+cFmQDjCbQuflOtUtKwtlOIzx9kUp1R/zF/X+I+habkjHqYyo7u8
 eb7wBcoiW8xK5CSOKWpbA/Imn8CZg3evyKFYK79PG+mU5dq8jaeSuVtWsqNIk3JWRAqh22bWKnD
 25tgbEgKGygRomSAjPQ==
X-Authority-Analysis: v=2.4 cv=HccZjyE8 c=1 sm=1 tr=0 ts=695d47a8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=_Ixbbux_C5oTi3JCwyIA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: 31KDpKDXagm6CPNutdBZn04KpoyRgR7u
X-Proofpoint-GUID: 31KDpKDXagm6CPNutdBZn04KpoyRgR7u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060152

On 26-01-06 10:15:17, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Abel Vesa <abelvesa@kernel.org>

