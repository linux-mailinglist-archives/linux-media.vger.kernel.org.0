Return-Path: <linux-media+bounces-67685-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RxL4KX6UV2qmXQAAu9opvQ
	(envelope-from <linux-media+bounces-67685-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 16:09:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7D575F2B1
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 16:09:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UobDZ0hY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VwMpd0pb;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67685-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67685-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8930304D5D3
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845C432A3FF;
	Wed, 15 Jul 2026 13:52:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44672F619D
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 13:52:11 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784123533; cv=pass; b=qfwz6OziyXUeHchJZ8DQRoJJL2uraqn5AeJN87kfBIhXGjaIQZHEIi7b0tCiXmND2EYdjy2a1o5/9mMD3tqmOrbX1sDjrmCcS2JH2QKvrqK4r5q5KJKDG335i8sC0pYHUOo0i5iTwSBONszjLsZCY3s79uYuCgeq1z49X1cirLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784123533; c=relaxed/simple;
	bh=YYg5eiB94mB3VISmVnhcr2eYct6Z9MxOLR3m1ctoO2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ijKsluLGTzvJX1YZZEretGGYB3GJETHsFldBgvnybJWHuXtcEvDiQ/Ru2Bo/ygrMBeQd2guSPZXlXtmXCe+E4Maq/GoGs7Q5uMisVeBLlYeYrDRIBeIflnP91GBUoFkLwCLUC2RVEzLnKIjoaqJuiQws4siXf7gLLM3EfjRacp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UobDZ0hY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VwMpd0pb; arc=pass smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcad53766609
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 13:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HRDnaHbZxLgU003Z7di3xnBpvLkFBoiwrEvgYu4LvWQ=; b=UobDZ0hYC0oTT8v1
	MqjYt1jw6xsTciUAAAuOOHl1CBaIZYNhWApPcIG3ClKjp5CBU71mxUfBXsppzugk
	TI/wcFQUej4R9PlqN4gJJkHvSrdsL9ZcXkuTDUb6OdrJR70CeW3+Av4SlkzglWj8
	cU/V7HKPLIUtO9qqhL9Lm7F52wczok4g1Wmwo99xXwRq7yK6TdyJOl9I8DO8GEg/
	WNb1EtT/cpg4JTVMWle2IgkUrnXgALf+hQvAt5SGDwK8IvEXbynPD9ehgp8zA5Q8
	LxnISjaS2kthG75MG/dMIQVdmKui+IyAUOTeKCFU6Ff5sqW0jJgAs186cxwc7gMT
	D7O6GQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe8558vv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 13:52:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f0867a75ecso130389646d6.3
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 06:52:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784123530; cv=none;
        d=google.com; s=arc-20260327;
        b=CX6pz+sogISZTNCLyDzhh2es3JuT1j0qHxEm17YNKaM/WRQaVp92rf5kFuRXJnUa9t
         uq2vZSQrTbua4FCgJ1OfSO6UOgU/debmzK2Dv/1+lNYFSO+e8h20bnrGeYe8YIg9xFRH
         kBPzQQ0RJbh+H8AWDVsUuasii8bZlIJwOmaiJxfsRuWWU5Z039XAxlRxGc55IEHS/2Vf
         k4pEOW33wVOecYNl6oZGj2iwNHEJ74GjFPFdURm+7ovFiy68tqswVi0JlSbIhTYxqctu
         Ta1+O3iShXETt7azTHgeylhI8zMpHQfMiAs+hWi8rDKAOjmdaq00/Pv+vA3rqcnM95DV
         Q7vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HRDnaHbZxLgU003Z7di3xnBpvLkFBoiwrEvgYu4LvWQ=;
        fh=oArAHAjRY59iaQD5isSAQas+7gG5rXHdx50P8G5t76Y=;
        b=qJQrysxPqd5b6NF36gEndlInz9p6BzG3HtcEdpxlzAqaBqA9b2McWDiMWzyxKL8Usc
         8A4fKtbN8H56vf1DApMEfkIelLmtobuZCSaowKv70PdBF2Lac0V9qYIVEr9cil2zi3tn
         IRMh2dScJJS11TWl+CaGXOb8ByiNiyLJlK+o9wRifhRljnejUwxwJWe/DVA1pYZpysE4
         pbfJ9DH67VUT1GddvCC4XGjL390kRvHLTeFXMwqD9H4ARTPyDvqPitq13CwwC5tJxTsR
         KPseVr8MGSPEmmXQx7rooo4gGUkAQh2H/M2zYH5l0FavA+XkpNuxz+qNMT3Km5iiRQxW
         AuNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784123530; x=1784728330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HRDnaHbZxLgU003Z7di3xnBpvLkFBoiwrEvgYu4LvWQ=;
        b=VwMpd0pbigmF+4b0DLg/NFJvRRCUSfQFIYYQCa+IpM4eK3AU6MHgaPy/daLMPe6/3k
         Y+IQ0saF1Pfs/gBB2ZnogkUSBma3E6coXPlov5D6kViU+JcnkMxzpvGKcP53N9LjVBYn
         i9BQ2d8pPM4XisZDrGPDFUVGIFTVABHp1wTRBld9SwU2jAqgRT4c4KSIZzpQ6Fe2iSxf
         aqdndlMWEI5WopHGr3Tk7c2ePI3255jlB+1RbaHjvvddw0PDA3YaumfvVdgTnsFgJ98b
         9LkVK+7JgsMfOfur6e+x5fB7Ws8Ug/XWToDYdZFVfFw7ZKRDcUZuzbWieM0AmA/NFTSw
         uF2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784123530; x=1784728330;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRDnaHbZxLgU003Z7di3xnBpvLkFBoiwrEvgYu4LvWQ=;
        b=radkSbOrMsK4Oqr6ThrEF3TFjYZaNq394JKFWP1M1+Ibmnxxr0HNPIpOhXQxL2OM5R
         gfgNXjcJv35/dmAeJie2f3y1qRCDr9jv8LLmflQ3kf1SPMaJSZX0QlO9TKHZkyXq8z4R
         44t31MUBZT3TdXbuQxDsrRL8qe/sjqv5TEvLkMM5hMDcjesL2LBM4Rg4nx+XuRLqTFhX
         LAJZk1MMpdzaglcWdr1bRjJBCltu3ptyyWemO98XspdyNGarCDSEL7pQaeW5HEnExsnd
         9eUJVuYsi3fER+NWXPGrgceK1H0KmsgRufuzk1CcF/YGiWnPX73am16o3QfA6YheUfBg
         28CQ==
X-Forwarded-Encrypted: i=1; AHgh+RqaCrrSmR2OEqCSFYSZq+vHPfD2+1QMyaRqGCu/0FlcXhOqekdUGgN57WV7+GAnfkmnwBidLKkMCTOqAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCvX3mEdotHglqmgxEMfqAYB7PI4LHOqtXz1N5ZJGQLUcSZSTf
	AsIoWtfmBzSibvtejyB559YbhxmuxyuIPkOndMenBCIwV8gdhx8bZViLx6jqQg15dFhB8oS+SAf
	g8KEKnU6B4y4VQEiD8dpYr/j8MpNfcrvIttF9OWt+gqaKEDRk39i7aNkYsXIZXey0kqAnRRKSEr
	OZHPunpoKHJcYeDHuXVXz9i9nHO7Fe8O08LZs6QL8I
X-Gm-Gg: AfdE7cm2fv3uDWiy3LIpSNbBjbTVhPAD6uzlYwFW44qJSW6UjF+BN8ODfTkAERykfRL
	vfNyt+TwqG9SuWaZzdhsqNU1bHuFOXJfT2Ss2oeaOOKJiSO9zA8i6VQ/wzcMrdpfGjtoIj2gT/Z
	Gbrll6Rt0HPeArZyTNSZ02WJxPG9l5MsPub+fWuCxaS8+vC/BEsivQTjMp+ZdfPCqeJfEhFGqCt
	zmwgGyAJmkWpP/o6pgc3kYWiqgI9X99qMaSuMluPDgFLaoJ06g3iRRKlOegdR7zBCfQgRX/v9Y3
	ssAqpyuDeLo=
X-Received: by 2002:a05:6214:5712:b0:8db:dd:4d85 with SMTP id 6a1803df08f44-90758d34f11mr30929576d6.26.1784123529622;
        Wed, 15 Jul 2026 06:52:09 -0700 (PDT)
X-Received: by 2002:a05:6214:5712:b0:8db:dd:4d85 with SMTP id
 6a1803df08f44-90758d34f11mr30928866d6.26.1784123528967; Wed, 15 Jul 2026
 06:52:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
 <20260710-camss-isp-ope-v4-6-51207a0319d8@oss.qualcomm.com> <da70ed94-fd76-4105-8071-1ed8d8e41d84@linaro.org>
In-Reply-To: <da70ed94-fd76-4105-8071-1ed8d8e41d84@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 15:51:57 +0200
X-Gm-Features: AUfX_mw9FYNoF0_hfoG8VGZ5UTEorPD_jR7frbEunNBfVR6iyQH02jj9VbYksmQ
Message-ID: <CAFEp6-2nTWjU0VrMQ8D8nDzH9P-vbA1gFPimv8aX+qREWHPNow@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: R7qaHCZQE2aDyzDlQCHmpF2VZ95Ot66z
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6a57908a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=5oiKfTUM-gNaU-HVeUYA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNyBTYWx0ZWRfX2ef8Ue+k2Ald
 hA6siky1QYdMGbzy6xhei3eov5vhpgUrDQOKPpDlU8rSrMeypuu4bqlxcjgQbvCHz6Nau29TL/r
 aCq85wvADSYQdudnqq6w0yo17fl5ZwEdBo8z/hKkip5BII3757K0/coaFIQoL6fwTGNBoQ2LhsX
 GRMt7CQ8kkdlvW2SYFEMo6zX3O0/030icE3VG9llV34gKVeY8S5cKIsAEopxpwbnE6Rd3ZZBmFL
 M/VIllfNvafYoxjaxi4OPZ9YnXa0/Lc8/BpJKAeG5Tta2J3kNd+d/aX3aCuNgQQqksJBgf92/qq
 RXPtPdfVJ2rH7EsPK178O1py9OFVrjsHM5I6d+CrctE/eHBTcPwjb6zFPVrC3X+Lpu7ZEFrsyN/
 nz0Wm08EAvvcNGRthp54ZmSb4+gjsBq2MEWvjxYVhjMWSoG4pOh065Yz8IgC4NZcw5M1TrR4AOW
 BkW8SfIBSuLCJNjtKWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNyBTYWx0ZWRfX82qFVD3n5qFW
 ZWWuw5v7ysFRaq2p11hr6FS1ELmoqnlmht0wPDqmcQDNX82L8jGlaIGLSliPeVEDh98wsPOVTQF
 yrBSXr+UvuDUaRVVpQecMzqTyvOBUh8=
X-Proofpoint-ORIG-GUID: R7qaHCZQE2aDyzDlQCHmpF2VZ95Ot66z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150137
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67685-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:devicetree@vger.kernel.org,m:johannes.goede@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B7D575F2B1
X-Rspamd-Action: no action

On Mon, Jul 13, 2026 at 3:05=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 10/07/2026 10:04, Loic Poulain wrote:
> > Add an image processing driver for the Qualcomm Offline Processing Engi=
ne
> > (OPE). OPE is a memory-to-memory ISP block that converts raw Bayer
> > frames to YUV, performing white balance, demosaic, chroma enhancement,
> > color correction and downscaling.
> >
> > The hardware architecture consists of Fetch Engines and Write Engines,
> > connected through intermediate pipeline modules for pix processing.
> >
> > The driver exposes three video nodes per pipeline instance:
> >    - ope_input: Bayer RAW input (V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> >    - ope_disp_output: YUV output     (V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLAN=
E)
> >    - ope_params: ISP parameters (V4L2_BUF_TYPE_META_OUTPUT)
> >
> > Hardware features:
> >    - Stripe-based processing (up to 336 pixels wide per stripe)
> >    - White balance (CLC_WB)
> >    - Demosaic / Bayer-to-RGB (CLC_DEMO)
> >    - RGB-to-YUV conversion (CLC_CHROMA_ENHAN)
> >    - Color correction matrix (CLC_CC)
> >    - MN downscaler for chroma and luma planes
> >
> > Default configuration values are based on public standards such as BT.6=
01.
> >
> > Processing Model:
> > OPE processes frames in stripes of up to 336 pixels. Therefore, frames =
must
> > be split into stripes for processing. Each stripe is configured after t=
he
> > previous one has been acquired (double buffered registers). To minimize
> > inter-stripe latency, stripe configurations are generated ahead of time=
.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Co-developed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > ---
> >   drivers/media/platform/qcom/camss/Kconfig     |   18 +
> >   drivers/media/platform/qcom/camss/Makefile    |    4 +
> >   drivers/media/platform/qcom/camss/camss-ope.c | 3245 ++++++++++++++++=
+++++++++
>
> I think this should be in a sub-directory.

You mean a OPE specific directory or a kind of offline engine generic one l=
ike:
drivers/media/platform/qcom/camss/offline/ope.c ?

>
> >   3 files changed, 3267 insertions(+)
> >
> > diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/=
platform/qcom/camss/Kconfig
> > index 4eda48cb1adf049a7fb6cb59b9da3c0870fe57f4..895fc57a679655fcb6f308b=
e1565dc6b77bbbd67 100644
> > --- a/drivers/media/platform/qcom/camss/Kconfig
> > +++ b/drivers/media/platform/qcom/camss/Kconfig
> > @@ -7,3 +7,21 @@ config VIDEO_QCOM_CAMSS
> >       select VIDEO_V4L2_SUBDEV_API
> >       select VIDEOBUF2_DMA_SG
> >       select V4L2_FWNODE
> > +
> > +config VIDEO_QCOM_CAMSS_OPE
> > +     tristate "Qualcomm Offline Processing Engine (OPE) driver"
> > +     depends on VIDEO_QCOM_CAMSS
> > +     depends on V4L_PLATFORM_DRIVERS
> > +     depends on VIDEO_DEV
> > +     depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
> > +     select V4L2_ISP
> > +     select VIDEOBUF2_DMA_CONTIG
> > +     select VIDEOBUF2_VMALLOC
> > +     help
> > +       Enable support for the Qualcomm Offline Processing Engine (OPE)=
.
> > +       OPE is a memory-to-memory ISP block that converts raw Bayer fra=
mes
> > +       to YUV, performing white balance, demosaic, chroma enhancement =
and
> > +       downscaling. Found on QCM2290 and related SoCs.
> > +
> > +       To compile this driver as a module, choose M here: the module
> > +       will be called qcom-camss-ope.
> > diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media=
/platform/qcom/camss/Makefile
> > index 5678621efb6780b67a043ec8a2e914cce02d9b98..422eebc0a86301de3f39c74=
3fbc06c437b17ac9a 100644
> > --- a/drivers/media/platform/qcom/camss/Makefile
> > +++ b/drivers/media/platform/qcom/camss/Makefile
> > @@ -31,3 +31,7 @@ qcom-camss-objs +=3D \
> >               camss-params.o \
> >
> >   obj-$(CONFIG_VIDEO_QCOM_CAMSS) +=3D qcom-camss.o
> > +
> > +qcom-camss-ope-objs :=3D camss-ope.o
> > +
> > +obj-$(CONFIG_VIDEO_QCOM_CAMSS_OPE) +=3D qcom-camss-ope.o
> > diff --git a/drivers/media/platform/qcom/camss/camss-ope.c b/drivers/me=
dia/platform/qcom/camss/camss-ope.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..2c0d68cf1a637c998ebe4d3=
afb1fa6dbdb68f029
> > --- /dev/null
> > +++ b/drivers/media/platform/qcom/camss/camss-ope.c
> > @@ -0,0 +1,3245 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * camss-ope.c
> > + *
> > + * Qualcomm MSM Camera Subsystem - Offline Processing Engine
> > + *
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +/*
> > + * This driver provides driver implementation for the Qualcomm Offline
> > + * Processing Engine (OPE). OPE is a memory-to-memory hardware block
> > + * designed for image processing on a source frame. Typically, the inp=
ut
> > + * frame originates from the SoC CSI capture path, though not limited =
to.
> > + *
> > + * The hardware architecture consists of Fetch Engines and Write Engin=
es,
> > + * connected through intermediate pipeline modules:
> > + *   [FETCH ENGINES] =3D> [Pipeline Modules] =3D> [WRITE ENGINES]
> > + *
> > + * Current Configuration:
> > + *     Fetch Engine: One fetch engine is used for Bayer frame input.
> > + *     Write Engines: Two display write engines for Y and UV planes ou=
tput.
> > + *
> > + * Only a subset of the pipeline modules are enabled:
> > + *   CLC_WB: White balance for channel gain configuration
> > + *   CLC_DEMO: Demosaic for Bayer to RGB conversion
> > + *   CLC_CC: Color Correct, coefficient based RGB correction
> > + *   CLC_CHROMA_ENHAN: for RGB to YUV conversion
> > + *   CLC_DOWNSCALE*: Downscaling for UV (YUV444 -> YUV422/YUV420) and =
YUV planes
> > + *
> > + * Default configuration values are based on public standards such as =
BT.601.
> > + *
> > + * Processing Model:
> > + * OPE processes frames in stripes of up to 336 pixels. Therefore, fra=
mes must
> > + * be split into stripes for processing. Each stripe is configured aft=
er the
> > + * previous one has been acquired (double buffered registers). To mini=
mize
> > + * inter-stripe latency, the stripe configurations are generated ahead=
 of time.
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/clk.h>
> > +#include <linux/completion.h>
> > +#include <linux/delay.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/interconnect.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_clock.h>
> > +#include <linux/pm_domain.h>
> > +#include <linux/pm_opp.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/slab.h>
> > +#include <linux/units.h>
> > +
> > +#include <media/v4l2-device.h>
> > +#include <media/media-device.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-event.h>
> > +#include <media/v4l2-fh.h>
> > +#include <media/v4l2-ioctl.h>
> > +#include <media/v4l2-rect.h>
> > +
> > +#include "camss-pipeline.h"
> > +
> > +#include <media/videobuf2-dma-contig.h>
> > +#include <media/videobuf2-vmalloc.h>
> > +
> > +#include <uapi/linux/camss-config.h>
> > +
> > +#include "camss-params.h"
> > +
> > +#define OPE_NAME     "qcom-camss-ope"
> > +
> > +/* Format descriptor */
> > +struct ope_fmt {
> > +     u32             fourcc;
> > +     unsigned int    depth;
> > +     unsigned int    align;
> > +     unsigned int    num_planes;
> > +     u32             mbus_code;
> > +     unsigned int    c_hsub;
> > +     unsigned int    c_vsub;
> > +};
> > +
> > +/* Per-queue format state */
> > +struct ope_fmt_state {
> > +     const struct ope_fmt    *fmt;
> > +     unsigned int            width;
> > +     unsigned int            height;
> > +     struct v4l2_rect        crop;
> > +     unsigned int            bytesperline;
> > +     unsigned int            sizeimage;
> > +     enum v4l2_colorspace    colorspace;
> > +     enum v4l2_xfer_func     xfer_func;
> > +     enum v4l2_ycbcr_encoding        ycbcr_enc;
> > +     enum v4l2_quantization  quantization;
> > +     unsigned int            sequence;
> > +     struct v4l2_fract       timeperframe;
> > +};
> > +
> > +/* -------- Register layout -------- */
> > +
> > +#define OPE_TOP_HW_VERSION                                   0x000
> > +#define              OPE_TOP_HW_VERSION_STEP         GENMASK(15, 0)
> > +#define              OPE_TOP_HW_VERSION_REV          GENMASK(27, 16)
> > +#define              OPE_TOP_HW_VERSION_GEN          GENMASK(31, 28)
> > +#define OPE_TOP_RESET_CMD                                    0x004
> > +#define              OPE_TOP_RESET_CMD_HW            BIT(0)
> > +#define              OPE_TOP_RESET_CMD_SW            BIT(1)
> > +#define OPE_TOP_IRQ_STATUS                                   0x014
> > +#define OPE_TOP_IRQ_MASK                                     0x018
> > +#define              OPE_TOP_IRQ_STATUS_RST_DONE     BIT(0)
> > +#define              OPE_TOP_IRQ_STATUS_WE           BIT(1)
> > +#define              OPE_TOP_IRQ_STATUS_FE           BIT(2)
> > +#define              OPE_TOP_IRQ_STATUS_VIOL         BIT(3)
> > +#define              OPE_TOP_IRQ_STATUS_IDLE         BIT(4)
> > +#define OPE_TOP_IRQ_CLEAR                                    0x01c
> > +#define OPE_TOP_IRQ_CMD                                              0=
x024
> > +#define              OPE_TOP_IRQ_CMD_CLEAR           BIT(0)
> > +#define OPE_TOP_VIOLATION_STATUS                             0x028
> > +
> > +/* Fetch engine */
> > +#define OPE_BUS_RD_INPUT_IF_IRQ_MASK                         0x00c
> > +#define OPE_BUS_RD_INPUT_IF_IRQ_CLEAR                                0=
x010
> > +#define OPE_BUS_RD_INPUT_IF_IRQ_CMD                          0x014
> > +#define              OPE_BUS_RD_INPUT_IF_IRQ_CMD_CLEAR       BIT(0)
> > +#define OPE_BUS_RD_INPUT_IF_IRQ_STATUS                               0=
x018
> > +#define OPE_BUS_RD_INPUT_IF_CMD                                      0=
x01c
> > +#define              OPE_BUS_RD_INPUT_IF_CMD_GO_CMD          BIT(0)
> > +#define OPE_BUS_RD_CLIENT_0_CORE_CFG                         0x050
> > +#define              OPE_BUS_RD_CLIENT_0_CORE_CFG_EN BIT(0)
> > +#define OPE_BUS_RD_CLIENT_0_CCIF_META_DATA                   0x054
> > +#define              OPE_BUS_RD_CLIENT_0_CCIF_MD_PIX_PATTERN GENMASK(7=
, 2)
> > +#define OPE_BUS_RD_CLIENT_0_ADDR_IMAGE                               0=
x058
> > +#define OPE_BUS_RD_CLIENT_0_RD_BUFFER_SIZE                   0x05c
> > +#define OPE_BUS_RD_CLIENT_0_RD_STRIDE                                0=
x060
> > +#define OPE_BUS_RD_CLIENT_0_UNPACK_CFG_0                     0x064
> > +
> > +/* Write engines */
> > +#define OPE_BUS_WR_INPUT_IF_IRQ_MASK_0                               0=
x018
> > +#define OPE_BUS_WR_INPUT_IF_IRQ_MASK_1                               0=
x01c
> > +#define OPE_BUS_WR_INPUT_IF_IRQ_CLEAR_0                              0=
x020
> > +#define OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0                     0x028
> > +#define              OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0_RUP_DONE       B=
IT(0)
> > +#define              OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0_BUF_DONE       B=
IT(8)
> > +#define              OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0_CONS_VIOL      B=
IT(28)
> > +#define              OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0_VIOL           B=
IT(30)
> > +#define              OPE_BUS_WR_INPUT_IF_IRQ_STATUS_0_IMG_SZ_VIOL    B=
IT(31)
> > +#define OPE_BUS_WR_INPUT_IF_IRQ_CMD                          0x030
> > +#define              OPE_BUS_WR_INPUT_IF_IRQ_CMD_CLEAR       BIT(0)
> > +#define OPE_BUS_WR_VIOLATION_STATUS                          0x064
> > +#define OPE_BUS_WR_IMAGE_SIZE_VIOLATION_STATUS                       0=
x070
> > +#define OPE_BUS_WR_CLIENT_CFG(c)                             (0x200 + =
(c) * 0x100)
> > +#define              OPE_BUS_WR_CLIENT_CFG_EN                BIT(0)
> > +#define              OPE_BUS_WR_CLIENT_CFG_AUTORECOVER       BIT(4)
> > +#define OPE_BUS_WR_CLIENT_ADDR_IMAGE(c)                              (=
0x204 + (c) * 0x100)
> > +#define OPE_BUS_WR_CLIENT_IMAGE_CFG_0(c)                     (0x20c + =
(c) * 0x100)
> > +#define OPE_BUS_WR_CLIENT_IMAGE_CFG_1(c)                     (0x210 + =
(c) * 0x100)
> > +#define OPE_BUS_WR_CLIENT_IMAGE_CFG_2(c)                     (0x214 + =
(c) * 0x100)
> > +#define OPE_BUS_WR_CLIENT_PACKER_CFG(c)                              (=
0x218 + (c) * 0x100)
> > +#define OPE_BUS_WR_CLIENT_MAX        4
> > +
> > +/* Pipeline modules */
> > +#define OPE_PP_CLC_WB_GAIN_MODULE_CFG                                (=
0x200 + 0x60)
>
> Can you just map the individual blocks so that we can interrogate
> HW_VERSION HW_STATUS and friends ? Those regs usually come first. I can
> see useful debugfs and/or dev_dbg() usages of those data.

Sure, will do.

> > +#define              OPE_PP_CLC_WB_GAIN_MODULE_CFG_EN        BIT(0)
> > +#define OPE_PP_CLC_WB_GAIN_WB_CFG(ch)                                (=
0x200 + 0x68 + 4 * (ch))
> > +#define              OPE_PP_CLC_WB_GAIN_WB_CFG_GAIN          GENMASK(1=
4, 0)
> > +#define OPE_PP_CLC_WB_GAIN_WB_SUB_CFG(ch)                    (0x200 + =
0x74 + 4 * (ch))
> > +#define              OPE_PP_CLC_WB_GAIN_WB_SUB_CFG_VAL       GENMASK(3=
1, 20)
> > +#define OPE_PP_CLC_WB_GAIN_WB_ADD_CFG(ch)                    (0x200 + =
0x80 + 4 * (ch))
> > +#define              OPE_PP_CLC_WB_GAIN_WB_ADD_CFG_VAL       GENMASK(3=
1, 20)
> > +
> > +#define OPE_PP_CLC_CC_BASE                                   0x400
>
> Is this actually the correct register base for CCM ?

Nope, you're right.

>
> I think you should check again.
>
> Same comment for each of these blocks HW_VERSION should be the first
> register.

Ack I will define generic macro for them.

Regards,
Loic

