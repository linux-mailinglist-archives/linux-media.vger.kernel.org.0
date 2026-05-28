Return-Path: <linux-media+bounces-62955-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FKLHTo0GGpwfggAu9opvQ
	(envelope-from <linux-media+bounces-62955-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 14:25:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F0A5F20D6
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 14:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4531F302DF88
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 12:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126DF3ED114;
	Thu, 28 May 2026 12:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="prEfC2i4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QZMuzG8B"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B243ED109
	for <linux-media@vger.kernel.org>; Thu, 28 May 2026 12:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779971120; cv=pass; b=kFyHZ4ZY/MOTNAkRJt8zS1NNXo8Dv3mxY2TqRORV+fFSHf2yyOL3aIMZCApE1dZc2HmnBw7KTIA2zi989SdtbLbtaskfL0ZPTnVorU17us4Bm2yu/KaGE6G1ttu7Yrv60AaCa9cf6VQSv9EVSMUhNApUfm6bqn/IESFegwShwk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779971120; c=relaxed/simple;
	bh=rjGKcaiPzzE9XfowjPUEZRn6zT+jUKQFamebPp3qZ4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AoBdEUVvyIFIOhj+sQo1kBMgmoVdsybaGMcDAA+MgHIjntaawABzMap7orCPKLwJ8209LcXCRdzO7IBlEi4pueKMtAvHx8p3huwWGF9RMbC7RPQcWlE63tSrTwaD/6Vphw4HadbTuMc7zZE4458cCUI7c5bPvxi46+NtbJ/LDgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=prEfC2i4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QZMuzG8B; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vTaL4031237
	for <linux-media@vger.kernel.org>; Thu, 28 May 2026 12:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d3417W+FQetIJ6t9E35gaP1Wyhl0UtZ7U9jN1sdRzUY=; b=prEfC2i4IyXES7BC
	cmHulPI14uPbrVtMetN2T5yu4ICQO00WgaK+A6eXmgJI1v7hE9fii++rwodl+CgJ
	mST0ZvEIHGyhietuMO6fYzSAJNAzRD8ppMDX5EdMynHhNRkTmvNeu5bXYvzPcKdB
	rA6oIBqgnEmljP1Z0rxr7yVDRlNHKXT0pivyyFO5kR7FlVfxbwaHpqz5Ta0WTbp9
	6BnOI1vOHCLXZDz//RqETpdeYe9/zaf6TLaJHqlz7Bdkrx1h3kD3pMG95XEDk2MC
	DvpNyX4lbx3Im5Mx5bc6unNLyEB6lrMTHPd+XBXSQFjT+C1Wg9a7joPe0d9r3EBz
	WzGJmQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y4tncf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 28 May 2026 12:25:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-914f037b7dfso599718385a.3
        for <linux-media@vger.kernel.org>; Thu, 28 May 2026 05:25:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779971117; cv=none;
        d=google.com; s=arc-20240605;
        b=JdG3CEV1YkWG3NaQEVBL1FADZJwQkkoZQ2MVEnGmkmUdqQd9ytLUYIRZpIrg1cUFia
         xYAAFpnCbaGHdfg0fsQdACi5Ni7bCuKi6piod1xNTH9eTgDI6kUoxtN/ZoYuS+Sd+4U+
         bTiQ6jBe+E/PVrGNea2xdX7u/V7NxgFHKTj5aE+NWPpERLVtA13oVEfYNoRRH1prJg9K
         aP2Q07eAeISl6nuigkyoHyUvqGi/kaEHtyAqPncByfIaOu/o6BpVgGOhwrzNtjsMKoyz
         3SAnsrrE7JEPID4E7yoH0NeLIqM46IJw1+Ibhy5i8RDFkUxzjr8yrSWk/kzRlgfUq3XN
         NsEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d3417W+FQetIJ6t9E35gaP1Wyhl0UtZ7U9jN1sdRzUY=;
        fh=dfqeVkFI949DgQXrKLpVOBaZmbgBre4FWamSVtAdhA8=;
        b=H9FRKmbhT52crs03X/h9Kx3s0I8Me2d1QKtNymFkVOoaBzZzWo2PhT2UjOwzE8E58z
         RhYN9fYyMSF2LL7rsgvDbzwmrb0dOfbX2EyZvnE9ycSLZbqDMhsmxeL9Wp72hwdgR5XT
         PPmU9/Qxc+xi0uk5rhkTPgvUoT7rqZasFxsanKSCfnZ0FdLcUG+ieIYyWabZ1YCTt4G7
         0Q7nI1MH0RPkHPG3v5m144gFh6Nug4bzUcLHFuPZXCyfuwdpm47S1ITznBsfJ1Ng8LA3
         4zeYQ6vsxufn2oYyD8Zo7xHTm3S0w6winPSBhPMxk8gbIY9bMWtMmJWr3b4As/X4wzO6
         /9GA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779971117; x=1780575917; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3417W+FQetIJ6t9E35gaP1Wyhl0UtZ7U9jN1sdRzUY=;
        b=QZMuzG8BzyeJWyVaeoG1d3GykAoRlxajPSwjX1kPY3Q94GZF0NUbZhCiZhhQg07QcO
         AOtQ0IraRos0+dASszySCYdA2jDXAURWgr91VRnbBrOYxS4iKPppD9E3ykQR0vUZeG43
         L1a58Gnd+Xs4j6B4A3mIjiyttHz97UJi7Ammp/9y1lTP94gd0x3q1zq1dHjTkf46U2Zn
         DtAe6PgsygUCYa/7ByQvom2IZ/lyRM+SrADua4O9b7tMP3iJVnZw0TD59eda9SpB/1tK
         m/y6y1tAPlfvFLUsfyFMb/UuYy3ijLxNIDFGUKoB/1nTuy9dDPnkfoECypOZLkMPJoC/
         mU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779971117; x=1780575917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d3417W+FQetIJ6t9E35gaP1Wyhl0UtZ7U9jN1sdRzUY=;
        b=JjXOdjVz7E0d7nq2GU+9oPyTnuNFMzVu+hrbXoFkkooDplypgFI6b2n4tKEWZ6OdT0
         U9G3rnabO4b9RfOHdqyzb2WEW/KzGEb+fw/RGx2mepsPtQ4VvYy4ULLArynnrh8z3bgu
         Rw5jCyAkR2zSZTBxtiQKNohsQ99GYzmzLtrtx74OWTuf1ui7dWaWT9Hpq6IoxLoqZfPO
         p44S1+ehPm5AKdMH7JlRwbAVOhQj+N9zejb0EbGvgAynrOPi/NCtNiYANRxm2+Ur70tP
         i2/+eBnBfV3humGB0EkI/iVXMUZIRQcFtkDENDPwRWpLV3TBIY6IGrX+ZsHfwGK3xoxw
         75Cg==
X-Forwarded-Encrypted: i=1; AFNElJ/Yrt93Ejvlku02vp3+bqpOuRPkloqqY9x3MtarBA8+O5XyEdPtg6rUJoZrddnIvPkWsIOOHrqNh+NIhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxju6IkzJFsKiQgIeN5qavHIcHkIFGMWVmrglEfQDwPb6GDKC3o
	O1jj3LX2PAW0w9n77CACR0Af86LCnR3XmNxXIJ54OcOj5ZUv/vbkZBU1ZvXoe4c4K4HXq2/Vv5N
	fKlXelsBX1CVXL5LD/nt3U7bSnJQm1jDn7I90qIqzGtcgwcLupISpasCT9nFKqdJnk1gu3hXKHs
	0GjIAPlAR06LAHWDrxDRj2KW5o5YZcNgwCeY+CDQVK
X-Gm-Gg: Acq92OFcDXhv0CbfvaRhmo0Fq3Pnej9Y0kaxKErW4AhnsWfPgqyk2B5+uugRCVt5JSP
	43cb0hpkM9fIrPBGL00bNHKm++jHQFJkRF9LSxQN8xwSYktOzUjbVsCJ3s77MH85y//gekvchRk
	vUkUIrAnCAxM1gqZZBYLyOYzvHAM4N8fOTNlDPosYRpNipku+XkhRbntucpTbYcQ8WDrJ+wtZB3
	wnsj79Ovth3sz6amL2hntmMS5EApQnVj/Cxo/+jnFJ93zWF
X-Received: by 2002:a05:620a:84c4:b0:914:c0bc:a7cd with SMTP id af79cd13be357-914c0bcaf11mr3886830185a.48.1779971117101;
        Thu, 28 May 2026 05:25:17 -0700 (PDT)
X-Received: by 2002:a05:620a:84c4:b0:914:c0bc:a7cd with SMTP id
 af79cd13be357-914c0bcaf11mr3886823885a.48.1779971116654; Thu, 28 May 2026
 05:25:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com> <20260526-shikra-camss-review-v1-3-645d2c8c75a7@qti.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-3-645d2c8c75a7@qti.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 28 May 2026 14:25:04 +0200
X-Gm-Features: AVHnY4JO8P8GLceB0VuUyA9tvcNmn11LuhgjLHguxnzI4BEUk6ZkF0V4tx2XITE
Message-ID: <CAFEp6-1VAW-S2d3q3uN2n1weMOoSPXtX_k_6msQ-K_5A5mZVLQ@mail.gmail.com>
Subject: Re: [PATCH 3/8] media: qcom: camss: add support for QCM2390 camss
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEyNSBTYWx0ZWRfX+GDHgZPH0QuO
 cUvtbCVxNeQON1KaJSvChXymM6GixwRIu+E63JoeMhjRMf8rk2QfCzBW1uvWBJ7YUGtAY0dx4ax
 Eoab9iULKQXrqsqB9Zq1RLoCB5FHk2zL1GS2zVKfQoNvuSfY0uGUcxorK7e/VuzUKfAYuplgmNM
 DyWnSFEgfLyrXo7IYmfPI/gqN/ixc6AXr2DEaM2XvtaVU4yTANVeBPbXEtqMsV7TrI6Lquzs9wt
 mAs9gJJg4SOHZrrB06M5AW1xqjjjQm0EknCMNyHSdoDmW+2NN4YEragiKD/r7QOCAkx4juJwjyu
 dM8hg63HryhCXtJmksos6HcLCUPQkjii9uo92zI/YCbKmHWx+pz/d/nYppCIDGvwE494fzYEtXg
 4yqkAm2MFYz7VJeIqLHL44NXmOdDc27ReC/YZObD9EA5LV9BqZLo9dKDdfooiU6vtkUmJUwiABb
 lRJZ3c2BQsPws7DVJxg==
X-Authority-Analysis: v=2.4 cv=feidDUQF c=1 sm=1 tr=0 ts=6a18342d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=8qkcLw8Gk86Nxc3JiHYA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: BBzdBCZ8YzygMZeE2K0FKm80pqxlD24K
X-Proofpoint-ORIG-GUID: BBzdBCZ8YzygMZeE2K0FKm80pqxlD24K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280125
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62955-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,quicinc.com,oss.qualcomm.com,qti.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 09F0A5F20D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 7:13=E2=80=AFPM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> From: Prashant Shrotriya <pshrotri@qti.qualcomm.com>
>
> Add CAMSS driver support for Shikra SoC. Add high level
> resource definitions for 2 CSIPHY, 2 CSID and 2 VFE instances along
> with the interconnect bandwidth votes for AHB, HF and SF MNOC paths.
>
> Signed-off-by: Prashant Shrotriya <pshrotri@qti.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c |  2 ++
>  drivers/media/platform/qcom/camss/camss-vfe.c            |  1 +
>  drivers/media/platform/qcom/camss/camss.c                | 13 ++++++++++=
+++
>  drivers/media/platform/qcom/camss/camss.h                |  1 +
>  4 files changed, 17 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/d=
rivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index dac8d2ecf79957dc05c5524dc439791ce097c785..62208f5c4f17bd6c9a8fe5613=
649920e6ee1a1f2 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1130,6 +1130,7 @@ static bool csiphy_is_gen2(u32 version)
>
>         switch (version) {
>         case CAMSS_2290:
> +       case CAMSS_2390:
>         case CAMSS_6150:
>         case CAMSS_6350:
>         case CAMSS_7280:
> @@ -1222,6 +1223,7 @@ static int csiphy_init(struct csiphy_device *csiphy=
)
>                 regs->lane_array_size =3D ARRAY_SIZE(lane_regs_sdm845);
>                 break;
>         case CAMSS_2290:
> +       case CAMSS_2390:
>         case CAMSS_6150:
>                 regs->lane_regs =3D &lane_regs_qcm2290[0];
>                 regs->lane_array_size =3D ARRAY_SIZE(lane_regs_qcm2290);
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 319d191589884777bced456867e5a2a4211a2770..b152f8d48e003d8eeb0cf19ad=
57419b25cdec087 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -342,6 +342,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u3=
2 sink_code,
>                 break;
>         case CAMSS_660:
>         case CAMSS_2290:
> +       case CAMSS_2390:
>         case CAMSS_6150:
>         case CAMSS_6350:
>         case CAMSS_7280:
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 2123f6388e3d7eafe669efd6b033e22d8eb5cf79..f67ecff53f15bd213dc7736d4=
e5fe880007d1ee7 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5565,6 +5565,18 @@ static const struct camss_resources qcm2290_resour=
ces =3D {
>         .vfe_num =3D ARRAY_SIZE(vfe_res_2290),
>  };
>
> +static const struct camss_resources qcm2390_resources =3D {
> +       .version =3D CAMSS_2390,
> +       .csiphy_res =3D csiphy_res_2290,
> +       .csid_res =3D csid_res_2290,
> +       .vfe_res =3D vfe_res_2290,
> +       .icc_res =3D icc_res_2290,
> +       .icc_path_num =3D ARRAY_SIZE(icc_res_2290),
> +       .csiphy_num =3D ARRAY_SIZE(csiphy_res_2290),
> +       .csid_num =3D ARRAY_SIZE(csid_res_2290),
> +       .vfe_num =3D ARRAY_SIZE(vfe_res_2290),

So isn't it exactly the same as 2290? wouldn't it be easier to have
the shikra simply fallback to qcm220 (via compatible string)?


> +};
> +
>  static const struct camss_resources qcs8300_resources =3D {
>         .version =3D CAMSS_8300,
>         .pd_name =3D "top",
> @@ -5752,6 +5764,7 @@ static const struct of_device_id camss_dt_match[] =
=3D {
>         { .compatible =3D "qcom,sdm660-camss", .data =3D &sdm660_resource=
s },
>         { .compatible =3D "qcom,sdm670-camss", .data =3D &sdm670_resource=
s },
>         { .compatible =3D "qcom,sdm845-camss", .data =3D &sdm845_resource=
s },
> +       { .compatible =3D "qcom,shikra-camss", .data =3D &qcm2390_resourc=
es },
>         { .compatible =3D "qcom,sm6150-camss", .data =3D &sm6150_resource=
s },
>         { .compatible =3D "qcom,sm6350-camss", .data =3D &sm6350_resource=
s },
>         { .compatible =3D "qcom,sm8250-camss", .data =3D &sm8250_resource=
s },
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/pl=
atform/qcom/camss/camss.h
> index 93d691c8ac63b2a47dbb234856b627d8911a1851..8ba8a38113dfc15849fa333d0=
5b2c3853f3a7714 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -82,6 +82,7 @@ enum pm_domain {
>  enum camss_version {
>         CAMSS_660,
>         CAMSS_2290,
> +       CAMSS_2390,
>         CAMSS_6150,
>         CAMSS_6350,
>         CAMSS_7280,
>
> --
> 2.34.1
>

