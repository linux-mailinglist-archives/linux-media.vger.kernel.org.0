Return-Path: <linux-media+bounces-61077-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNWKJy2pAWqFhgEAu9opvQ
	(envelope-from <linux-media+bounces-61077-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 12:02:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF0450B7E7
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 12:02:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 780083035897
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 09:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E153C454F;
	Mon, 11 May 2026 09:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AG85DNzf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xnqj+RZn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB52E3B9D9F
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 09:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778493495; cv=none; b=lxFqTeRMww7nd7iZr2z4BzNKk5NwLP5UXz5NVlJVDmRvpRuBP2KbQUYlnwAowTYzxuFyH/U9gg9XMC1BXB6h5zjeKdSX4FV/GGm8cDfmirHjzKSlzWf2F8V1ZSnAAEMfY0USt+HQD+SpPcsv0BKN7zwUo9Ig2PlBBQ+kYOBUR9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778493495; c=relaxed/simple;
	bh=7GutQd0hEer4bg66j6HNdj3RnmvU5iow0kHbDL9cf/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UdedwrgjiIkTZRJkpqI8dXiy/SuoTdbql8YbXLGp0h1C7UuDvbS9eEaUJag1GRYkmwx5xqgEgmPCqaoTkfw6VQyCytOVTAQbzU3esJyXMK8uiaShLntoZ+NkALlFm3yx18xznzG3aB51aDN/riiRsM4WR4skZ9rbV1U/B1sYYjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AG85DNzf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xnqj+RZn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B5Notb1421182
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 09:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zEpuyen7+kC5KI0RT3TvREn2myR/hx/t021Xi5ogWok=; b=AG85DNzf1OvYu/Xz
	qNT4MZs43mnEuVdTgVcpk84JGph9P/5IrY8IW3ivBpxlNgpVtxLBNvB+uBipq+sI
	iLSiYx1HYr4PN9wqNANjVyfCkiecE4u3QAkOKeCam9Zaas4LBRsH/0O0kxcPwBnn
	Oo55na+6o5ChNaqTgnbF7nQ1B1nkeJE2CVUgWYHFuCiZk9brgHZ5F9njR9MfKkhO
	R4ECNEE0Nt3QvLtSOqcGejyE5+/ORAn12kwgdVL+oPAJWgMR2cM0mR+bpUjKv5w+
	jS+DdzgYutH7ZdwSSnKkOnHwNsluD2avj4Dgcr6BoaFX3DWZG2yPo+sfORxc2qd1
	4WXJlg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1x79ncf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 09:58:13 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-575296be5b1so373863e0c.0
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 02:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778493492; x=1779098292; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zEpuyen7+kC5KI0RT3TvREn2myR/hx/t021Xi5ogWok=;
        b=Xnqj+RZnzCaE5xW0RVFZ5qIZ2cRXNGaXPYq+jxVo8QARsFMvXwW71X2g6sDdWGnFWO
         1/Y5GTtge2dkF7JvtbrUnHWO9w18aGUbPq0jWpdlY2/ZnFUlSV9QJ2YQ+NnvcM5hU1JV
         B8vKmmNDh6JisCLRGTizyeBXuJ5s30MB6HVBYCLp0Wgj3qneMyd8YbaCT+qTZF/HU68t
         9AHFrSAmZBVS279QogsnOPu+yU1PjG1MzNZTbyumU/+4bpIYmjJXNOyVaAmNC3jTaJzK
         UE9B9JBdxLTyMJtHbSnT6QUly/+pFowZmfxtQBBjPQKiwPWYBz1ymuiMSsEaE8KjwzVZ
         ckpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778493492; x=1779098292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zEpuyen7+kC5KI0RT3TvREn2myR/hx/t021Xi5ogWok=;
        b=EjSbOsD/U/n87WGct5IjhNBF6LwTXdIg5WUOHYPcu970pLZTCnkr2Xlk/Q0u24r4T4
         Mtb9xsWsZFgIPd2XGvsgunM5c7yAd1YHgg5wPICA80UxM3Ix03QnMsoNQW3x7Gmn75+7
         9si5SOfRT6UH3aacFwoCdZEeYbQgMmafpbLm/lb9uzi3WQny9xqiYLLBI0iMOueGfxPO
         L+b6FiHREfybP0ysR8yCbrBobYMHYlFbcF7wkwgvo3PrTZFqlmPkj602JpWP4Ojv/uhm
         8HWl6AVgoc5GeMDLGD4lRKEtI3v8rsE/ZaFu46pivNWs4NysBRUDZLi5HWBG1L3Axx9D
         zsuw==
X-Forwarded-Encrypted: i=1; AFNElJ+N013uQFe6rKHZ4WzPzrJqxNzvdXp/UbaDfPamKh7SBVi5H0+08ht4hffvq0t3bdGKhulW2+aCn10Bew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2vA9TlzeU4vecMFMwauf3JVv1hWd4CfKxSeHATfA48HpCU8pz
	qEqPpP2u/rF3/8lnAPxk20CmtR7+IIiF2F+Vceo7OzyFG76KNeKnmyi8ccRuoiXL11/k5e5IbA6
	OEpQ9+en7zBhmNgWOS1P9JqNItRXGHgSr5vyglXqEI9g+VsWOBkbYbdCI0EACNEnBtg==
X-Gm-Gg: Acq92OHZbDwj2CS9OFLWO3SmmJ7/Y3hlMRmTYW6rjUTbeFNgQDKhQ/K+SSZ5fR3ByxU
	RHn3Pgg1mqtsOP6e3r1eXpToltiaDze3sGnq4fdkVZ6Irah0ZJVxXlfMrEfCsuR0ikdTm4BNjP6
	FO607Xbw2TDEDmLzu0idNcVT8T+rkfeoIqGmHwAJqw1gHKdyqG51IEv1iB+mlCShanTTLsy7ooc
	3DOBA/B9UmJeZRIxZb9YOXa11W63qPb2eN12K92n7BgY/xFD0YjZRyebGjS+1PuaOSCgwgvDWj6
	6JA7y2VXBIkY/PUNVq9pyxVbMaCdJdQfDhWFVlSgjn5Ml44yGBhCe+yMML6xngSMD15ysfQnYtR
	vWcuTuyUbOI0QxoGlq6BEtU2qHQgO7rQIO1ncBEoL6vCR1jH2Tii6sMap7CnqLTeX1EFhPQ9y0y
	6F6IQ=
X-Received: by 2002:a05:6122:510d:10b0:575:a13e:b33f with SMTP id 71dfb90a1353d-575a13eb799mr762072e0c.1.1778493492236;
        Mon, 11 May 2026 02:58:12 -0700 (PDT)
X-Received: by 2002:a05:6122:510d:10b0:575:a13e:b33f with SMTP id 71dfb90a1353d-575a13eb799mr762057e0c.1.1778493491857;
        Mon, 11 May 2026 02:58:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac11b7084sm468593866b.28.2026.05.11.02.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 02:58:11 -0700 (PDT)
Message-ID: <774aab58-0825-4acf-99db-dd88df0366a2@oss.qualcomm.com>
Date: Mon, 11 May 2026 11:58:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: hamoa: Add camera MCLK pinctrl
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
 <20260508-hamoa_evk-v2-5-3ebdca3e4ae2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-5-3ebdca3e4ae2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QETKub_ZsxYMDnpjcKZs-hQNHGgb5zt4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEwOSBTYWx0ZWRfX+yPooY4cW4Mi
 P0vHVqMx2V9U6JS+ayblBTm4yAOqx0yHTg66PrLJstfajnLW/hLqDPN9OQ7fUv5zEP4ZfmpS/eo
 h8UN22/jZKG+hPc/u3kFtv4/GOcP6Oct34yUTdY53wVfRW/KuTcWnpLZ+gSoLJdpkQvRufFBu7c
 RsBmzN5yMIkaiO+5PsUYjTOTobzkgFbbknAahQtXoSvZROKq29i/Mj1vVnavKxTf3xG33xbVtiO
 0Wqlgr3Jy8IHhzdJrbruPvpHqFMsbw8nug6d0OMOnY0NKTv/6pFoTbu95zNmswe2qpwpiLQJCRS
 4iYZzzvsrfq/LI/JXy9Cs/KMDaAZoOLqKC3Tzde3x8ZvBxGI+IDMupg3580ZLxZCTu/H+ehGvYx
 DMyKDdkm/q/PM4Asvc4qrmFjPIvuyhvNB1uyIJrfmMhoYnOH+7I+eGSFgbadE6ZoH5GPK/pgksV
 flamwtTsst4Vrquss+g==
X-Proofpoint-GUID: QETKub_ZsxYMDnpjcKZs-hQNHGgb5zt4
X-Authority-Analysis: v=2.4 cv=Yvo/gYYX c=1 sm=1 tr=0 ts=6a01a835 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ZkPnaNv3TD41VdVxMYYA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110109
X-Rspamd-Queue-Id: 1AF0450B7E7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61077-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,nxp.com,pengutronix.de,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/8/26 1:40 PM, Wenmeng Liu wrote:
> Define pinctrl definitions to enable camera master clocks on hamoa.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

