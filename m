Return-Path: <linux-media+bounces-60414-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHquFOrt+WlqFQMAu9opvQ
	(envelope-from <linux-media+bounces-60414-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 15:17:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D92C94CE4D5
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 15:17:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 19D9C3056697
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 13:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A158D30B50C;
	Tue,  5 May 2026 13:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EPFtpj7Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dQ4VS7J+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913FF40DFC9
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 13:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987027; cv=pass; b=YwGjnDu5gtkfJMAbdLNfOIH3+0yn7z53oIXt82wdDpn1t6eFxx37IYIXIddXBaUMvBZ2soquwnhtRtXPlOBW3cG2TuDtm0YSujJtFmfVYRUmw2Bm+NYFmrmKvZSeE/dnMDRI6odlUKfzSfqtwlV/sqDz792BF6z4jeE7oWWI/0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987027; c=relaxed/simple;
	bh=RINXaIomji3Z5k68WUVEnL93Hz5H4UongOpfpintwjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TpLBRnDkLDOP59+CjM+DFivhgYCJ5RU0Dl/fbBFbYWEWQ/jHqgmn+1dDvZJnfyKCLIy1DMKh7Ihwr59COLJeFZnd1bo3tSagwCpNoZ0CA8CNEH7WnFHerDHiICC/9QBm9qUtMkbyhQVFjsfvmsebDLVoWlGFzAmSi+kdOR7YpSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EPFtpj7Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dQ4VS7J+; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645CE2492187468
	for <linux-media@vger.kernel.org>; Tue, 5 May 2026 13:17:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AD798WH8YaKhVfp/Kav0sq2C2jeCeH7HoyLFibDPvLE=; b=EPFtpj7YXNJxCs7X
	HJwZFiVLoYL6T1l5DiF60DoP837ay+JVBPpk9po9f7fDQ4tsGp0eTtCVyAEr/mnm
	CqXSuSleUA/r38a9U+iEwWVIx4DOr7BgOHdTO7H68+6N+wem0sD8vzgq9fiZpckp
	1vWFHhe8HOUaJfEJ7x7pnl2CyodAN9Rd4rzmKEaofo9HThcwAyHL2Sea14I2CdHv
	DIg9nlmSeHY8rZv3cVyJJuWH7pmeiL3P/u3X8ltmyuhtlOSIVNeVC6cUrRRrHDE7
	KiWzC21NKF9EDEGlgV4SOWXqA+zP+3uAsmZDif/ODfvfQh47VftK/nbBu/J0gbbE
	//GMEg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dygce06yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 05 May 2026 13:17:04 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95862466f3cso2798136241.2
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 06:17:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777987024; cv=none;
        d=google.com; s=arc-20240605;
        b=lmb3tZHXdFTqZGPGikddt05kBVHEKyBhkKzPGHPPAyi9OyK49M9YXYkPXc53PUIkXD
         BZrOUqwjux/ujzWBCmJvUEos+/KkoZ8UpmRNuljGanleiIObJLgEoQQyS5lc8dD54vIW
         AHQOfrWQm2uYdinZQYCJD5JYU50gVQf+LohDUvClHpU3KApBy4g+4jiqanGcHpsIVXfa
         fRTkTxvzC1vF7S6rXBbGnI5w1GVW6Qsvutb9cXVN8VYvxc2BMPgAygjx85PjxE9O/H5u
         m/pNNnAqr48/Uu5/n7zGFbZ6t9/3g81X8rYLLt0HyGmAcJaE1Mw9v6YGnDCtQl4/p9Yr
         wslw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AD798WH8YaKhVfp/Kav0sq2C2jeCeH7HoyLFibDPvLE=;
        fh=dIZZfka2fwEdq3AVhbk4Yar9uFiJTWkHLicyY7oL9xA=;
        b=NwNYuYHTTxzKIa5YjXKiHD6H5842e/tWp83VBN6y6xPzbQJ4v4IeoxLYhi3iO9MK6m
         3Yv+3wx0Xz92hPDBoz6dTogr5I3llCsZhanZBcxi+7uFMyI9aDQrQe8yyFCYSm98V1dK
         fmobg+aICDR+aQCv4u3A7nL8fXgAlzli6N6S6kU4+pSbYJF30iSNY4G0PVoNcAWPP5ag
         fZegKigPKsTe4JbmIMBmvdZPp8m3+zUaKXVfeOUfecORx3iWe0QUV5xUX+cbdo/li5js
         xHyrq5g+M1iscFGZdgbNvvuX4majZal9BPK5527y6zPpSwEp+sAeqFwvyUkDkotsQ2fI
         i56A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777987024; x=1778591824; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AD798WH8YaKhVfp/Kav0sq2C2jeCeH7HoyLFibDPvLE=;
        b=dQ4VS7J+gNJr6CkiRBYZ3uvaC6G3V3TbEYI7eSWAK9nEmgdnwsIVVHZuRfypAnHXT7
         6KjWwR+gYhaAZgDsXYPo/Bwi+9+6y0P1ezzDPfsBrBUj/lR+l06dtsRF1FmngPN+TCk7
         UIyF6/bom+jxOAlKKeKZnF9U/P0MhGQVGJGnJe+s2v93NW4NWy3dDw74URqvuODVbGfB
         S/b23RAOVWag3bgbZ7esKrsd2dGA/rBHmbJp/qxRmlJRy+VpWQyODWvhvvXcueUe9BqB
         r1SXWtqcNfJf/m/rccwoUXZJxqHRpOQgHEdUO7ic/b9UIwnPZAUkhjaKIl1Uq8L02lbV
         Hq+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777987024; x=1778591824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AD798WH8YaKhVfp/Kav0sq2C2jeCeH7HoyLFibDPvLE=;
        b=RW3Mcqc/3zZIiEIk8Ez5+bTNZZI2xDR7F9fPKyppZX8hTCxnRHdDrBiByPO3wqQ1IE
         IGL1jEnMeLZpR/WlJnPBSx0JMbNGmYs+MqfS91+iLNzW8qNNpbR028GsmKlrd9w2ACgR
         +1e3LwmnhPrw8Gy+EvoKj9V3QmKlnSEBixKM3lzij97yJ7tDbG5Eg+8Z0jVQvVPxi6Dp
         8gKprCSDtCV/Om3lsdb+5B/uuS1zCpywWrXwoPPhJTd0AFD+/0VN61Tra3/mvm0tTJ6E
         uJpLRtljx8cPpdwO8qnZJWe+evnYktnZrZZsvBf5T4gpXpCdKQIOoywfbxomeyMVCOuv
         +yqQ==
X-Forwarded-Encrypted: i=1; AFNElJ8mTDlsbVnX7lLCiS8gL+yOyQ1C6u8f7saCFNMUdgiRtuN7KqMkZs5m5+/HQKBMckQxaPJS07GKuk6GuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFJ8IWsQwmK/x5Fy/HPOVmXXYJobQon+kHsa8TB96MPBERb0Vx
	UJPxDoI2AktLG/madoiGf3sdqyWW7C+2StUIivynlCNZ1h0Se/VH6krdrjX+0jPX0oRQ7FD08hH
	F+nYVtPbFMLfco0vwfmywx4LcHywnLzx9DbFjXswHkcp8Mu20O6P9Zd+DCGl2Lwvxtxd0gSfbG1
	HmlmMYCRVIqHw5dSsbbpnFd5LbrHNvyUUB1nveYelp
X-Gm-Gg: AeBDieszXVCtwNSCm0VR5QObGM1HKCQPULEpNYJMSW/0yAnh4vrAXsYGtC9nOBUtlK2
	CNTyymmou0ryvHsgtTjJ2c1Drs6ulvW+BiLZZcrGcAxo1m/awxpIjfFM1b/l7Wp1m4V9Kvi4cnB
	LvQVEBRYUWieXpvCXgLO9QLiCBL5fURuLwDyEg1PuCIC3EdsReCMWm5fSk48hfIebTy8fHUVgLu
	/W+q8FhMSh6dKBaSy/k4wJmHW0xAritSncbjMSHIlHq972Xf3Nzn7KAKGDC/3R1RqZCNzz/ggFI
	ZgA=
X-Received: by 2002:a05:6102:5e84:b0:612:7ddc:52ee with SMTP id ada2fe7eead31-62f591e15f8mr1334736137.15.1777987023600;
        Tue, 05 May 2026 06:17:03 -0700 (PDT)
X-Received: by 2002:a05:6102:5e84:b0:612:7ddc:52ee with SMTP id
 ada2fe7eead31-62f591e15f8mr1334635137.15.1777987022558; Tue, 05 May 2026
 06:17:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-10-f430e7485009@oss.qualcomm.com>
 <aead10a8-45be-4f7a-ac6c-35a99a716b3c@oss.qualcomm.com> <CAFEp6-38=hcUOvW1yd+hRZ2nHV8sLxiLeB18uu-au=LgA2bQTw@mail.gmail.com>
 <0c6c9366-a190-4143-a0fb-2aff38ed8804@oss.qualcomm.com>
In-Reply-To: <0c6c9366-a190-4143-a0fb-2aff38ed8804@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 5 May 2026 15:16:51 +0200
X-Gm-Features: AVHnY4LGEhfsUlkX4TOjzlp790x-TMEYbGtYBxNjEt1Hs1iHIIf3wT5xSTTbtjU
Message-ID: <CAFEp6-1uDO7UzYm+5ejRH0fCtnFZSA3z_Xa+4ibDEbXBh38ueA@mail.gmail.com>
Subject: Re: [PATCH v2 10/14] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDEyNiBTYWx0ZWRfX5BVyuWESYJu6
 rNCsPm7Eh+e5tzpEN9xwAwp8M2vCDcIbmZGLExeBYTN/lhrXWAfMv4vjoF2JRBXhRPb2URcL3jq
 Wuojgogw/oo4sLZy8x+7KnTqINc7x/zkH2BN99dcak7pYmMBmDEd6YUAoWiLvtC70SgDuY9BZDp
 72YIMghyBUF6b7BY8QDKJ0xmR/FH8aQN2XU3Qxt6KITqCUzFL+mJ9To1ZiyTRA94SRZqLG5qdye
 07VvOEJjtPM97Yx3T4x0hphpU3QDxeO8pA4KredR94Omkto/5hkQN/Eteu1GTT2gXd6V4oSJtpQ
 7SUIjhS+nVRaFV66bl9Ibf2NuVM440TfCq12HM4rkdiBLFxt2AKtV7yHQvnkAS+SdFLvnFr+XoZ
 uMensbjF+ZUb2v91IQXMY2Qi6SY5256bJ8371vRahKrgJt0hkzoXRDxFLuHxZHhO7ZyZWwSQFc8
 EhKOsmWujNyWbiRgN6A==
X-Proofpoint-GUID: HP44IwW9VBZiC5uS-Cxut_p9pNsIMHwt
X-Proofpoint-ORIG-GUID: HP44IwW9VBZiC5uS-Cxut_p9pNsIMHwt
X-Authority-Analysis: v=2.4 cv=b6KCJNGx c=1 sm=1 tr=0 ts=69f9edd0 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=_2yBmY5WZcee53Sj_MsA:9
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050126
X-Rspamd-Queue-Id: D92C94CE4D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60414-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim]

On Tue, Apr 28, 2026 at 12:16=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/27/26 10:33 PM, Loic Poulain wrote:
> > On Mon, Apr 27, 2026 at 4:22=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 4/27/26 2:43 PM, Loic Poulain wrote:
> >>> Add Devicetree binding documentation for the Qualcomm Camera Subsyste=
m
> >>> Offline Processing Engine (OPE) found on platforms such as Agatti.
> >>> The OPE is a memory-to-memory image processing block which operates
> >>> on frames read from and written back to system memory.
> >>>
> >>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> +        clocks =3D <&gcc GCC_CAMSS_OPE_CLK>,
> >>> +                 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
> >>> +                 <&gcc GCC_CAMSS_NRT_AXI_CLK>;
> >>
> >> Should the two AXI clocks be aggregated by camss-top instead?
> >>
> >> Otherwise we run the risk of the OPE driver setting a rate of A
> >> and another sub-device setting a rate of B
> >
> > On qcm2290, OPE appears to be the only consumer of the NRT AXI clock,
> > while the capture path (VFE/TFE) relies on the RT AXI clock. That
> > said, this may not always be the case and these clocks (AXI / NRT=E2=80=
=91AXI
> > / RT=E2=80=91AXI) seem like they could reasonably be managed at the
> > camss-bus/top level.
> >
> > The open question is how the NRT AXI clock should be enabled when
> > required? enabling them unconditionally (similar to other camss PM
> > clocks), introducing a dedicated CAMSS top=E2=80=91level interface for =
voting,
> > or leveraging an existing framework to handle this?
>
> So, interconnect, or some internal, smaller version of it?

Downstream, there is a CPAS driver that handles these clocks in
conjunction with the internal CAMNOC block. Dmitry also mentioned the
existing icc_clock mechanism, but we likely need to investigate this
further to support proper dynamic scaling of the required clocks.
However, I don=E2=80=99t plan to address this as part of the current series=
,
as it would significantly increase its scope.

I believe the current approach is acceptable for now because:
- This NRT clock is required by this specific sub-block, but not by
all CAMSS sub-blocks (unlike, for example, camss-ahb), so referencing
it makes sense here.
- At the moment, the OPE only enables this clock without setting its
rate (i.e., it uses the default), so this should not conflict with
introducing a more complete scaling framework later.

Does this sound good?

Regards,
Loic

