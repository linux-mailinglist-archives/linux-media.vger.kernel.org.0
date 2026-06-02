Return-Path: <linux-media+bounces-63349-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TBepLBySHmqblAkAu9opvQ
	(envelope-from <linux-media+bounces-63349-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 10:19:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4088962A66C
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 10:19:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EE7F53010BDA
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 08:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D113BD64E;
	Tue,  2 Jun 2026 08:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bltWx2wo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kvy+Luk4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03F23BB10B
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 08:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780388332; cv=pass; b=RFNPR/Eb/HSktoOdzilb49cR6A7EojTQna+tWvmd6ipVRbqI/96h0QmMp7LApVpGJt5pvWYIlgm4Utj8wL7nk6Xt5fooRqrE1ux5tsnUtMADuSUBamAiam+EyQcPdf4PteslofmrQIGGqMnfJiag1HaoN1t8Hyd62YaD/oDAT1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780388332; c=relaxed/simple;
	bh=k0oD6Z7ztloc6sXo61tpaoAvgwJGyTdgeriid3nFKcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lh5IC9RrL960KICkEN1UrElSPlpN8soP31bQoyIP9MQ/sNgejUbqNajqpCDhjBXlWt394f71fAjuQEYt9E3OWUdmmjDhqlLoNUaOOxO/CL1vTyJWZ6YVYa+tEcH+W3YVr8LVFhwudw51vWhKSB+H+Zi8j6f/g/Cet7RoV0VWk7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bltWx2wo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kvy+Luk4; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525tjXX1855059
	for <linux-media@vger.kernel.org>; Tue, 2 Jun 2026 08:18:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3iUu4L21LAlXVsP+02y1/H3ClBYBhsezW4mj2Ux6mo=; b=bltWx2woQ5a6jsMD
	msMiXA/39eqxmmDU6nJVuLFiXV+F0PVpqhZHxmCQJOnzETrU0fT4ThNuuDejKW6R
	fkCfmqp9lUMagGTmQwASyuCJxzniEJbQt5MX3poZEVNMp8P8EfIMhht8rrxrixh+
	8PLweXhyjmajcmUF+40ytKv7lRcC+Oa0GTvFFVIL7gI2xOSrIscUQ/VSG3gyI6Pf
	QzqlDU7eVWczwkqIaROwf921JTtSy3DCDjzCksKejLKi5Kf85hYVmjtdvLyrWSka
	BwziUZZdt52G2JASYTjUP5ZtsW6aFT2jsuzf6ZCNV28rb6m4urcGoeOSKL3Ang1J
	7GJUig==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsf78jdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 08:18:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-914d0204c67so2004467885a.0
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 01:18:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780388323; cv=none;
        d=google.com; s=arc-20240605;
        b=ijJTvJ5Y7uigX5u3hgZ4TslVbvjRN3Rqs9uTPSyW0zdcQIcKQHOnftQ0P4KfpDhlHf
         TqSugqqclHYqiEQRXeEv0Ka9baJmVUJI1T33u4hflMvY87NfV9I49o0cPVSwJvJ7ZKN8
         oChxkCmWawmo/gxZNzYrVpUsMsEAgKWBv8mONmMyHzW2cV9CnycybmL5JuUfNJVuMiKE
         BdwbX9x8gJrBwdtPrljYCgHHqYGZK55QQ40SbyRwPic0AyHEGCHTzoGFa2hUWe8dBJOa
         jqYyrWHmOpzrKKRrexdEIAsjcRC8B/X7/wumnGWfGEqk1DmeFBKRFE6ZngIluLHN0v8E
         4l3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t3iUu4L21LAlXVsP+02y1/H3ClBYBhsezW4mj2Ux6mo=;
        fh=tUpbm9i0w2SFdpoP2mYAUEKD8ZZbbRKtK6K0C2JaNMg=;
        b=NbOXQECWbV/AybhSFSIfBsWz9XrLx7oPxw4fXJzl5lYuKJdGz9UbwGW0yoiyO2EH5v
         mhO/WWzbHyJ+AOyuxs15LKN/0akTFWyNBF2EmQak1yy3HwXSpd0AhB8J972l3QM/jNPL
         i7QcDAiwwVVEJDkxTEsqRWZIPJa+iZ8VC5jtoa/VjYtE1uUhuQwU7DptphG5lII/I40z
         6Dh5lvp95FTvjMbNTPT2w2gR8baOhYvixvVhSzhp60y7GO2U5ZzHYdfj9u803JjwWOnw
         XlrXR8WTSzbjlh+LSbKDLQ2BkN6KMfoVNrYPFtRe8R9kttV5UflvVo+scmgCdyu7Unv2
         IFgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780388323; x=1780993123; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3iUu4L21LAlXVsP+02y1/H3ClBYBhsezW4mj2Ux6mo=;
        b=kvy+Luk4t9YRpfWlodUWczrLIdLmIFq/pUITUGSF41hxiVChYIup/Au16nYpAZydzJ
         PJeqJEoFSZjxNmzADu3cCa3QiuAE+hkpbllCWNLc2pkfFyuJ8nBmb6T/zCyyI+Vwh4Zv
         PeSkcgEY50TIVbB4mQ4Zik2fj6tpz0NsFlk+QipfN0jO96MpyMMZocgWhwDvlshTTms5
         PDzlr+gz8rajUJFrYF4KrVZPVMm6k7vGxq2MsU3JD3ukw8ny7l+VQO8xpiss3NvyCamU
         ieNdE7Y0thRDzty+KWvaVmgamOdkndX4ZTvJ00B5/AMP334nU+x0ERWIHRUzAF5mseOI
         5oLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780388323; x=1780993123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t3iUu4L21LAlXVsP+02y1/H3ClBYBhsezW4mj2Ux6mo=;
        b=pXo0X2cENOkIx9JWvLjVaH8vbl9+uj7MvKCQDo19/mlVtbvaabQMV6AQQcjOhAjsxI
         jpEgMCUjIugbH7iNFKw1klRHe5eBNVQmaRxqzSCJS6ZhAX1+rj+P1/8BEQgiG/Y89e9z
         HzfrD/0ClbOPiGRZCKEWcxvOOIMM0ca+35/DXTy68PJpxF+VeYYzUy9wnbde0/O6qIRV
         O+A1HRAGt0kpXArUKJiwjEzFhs7nnKY+CZHMWZVgisYbf9qYN8yzrAzz+tfqs2Yo5LQs
         AjAlcz5IwtXphiRRZyGteOB4+8Mb/vWCIPHjElwCCaLarQJL7oiIlqnOxzIL+f3tAUoc
         7bfg==
X-Forwarded-Encrypted: i=1; AFNElJ/Bh1YNMHamXEHIpJuGD1rcA2MZDXKKowGKQcbmyPwUHFkzfsI7kYoXblZ6F+dx2Egyyplr5M0dlxoWAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfIIrohy16GeiiJNN6m7jZLdz2HPpAD0rvUDocNPZ/h2/RWxkN
	oEoyPKD6sy1vp6NE+FFQcPUjezsW3T25UzvV2G/toNK1sAiRcZQbap72OJFGWqcVcnBcf3tJdzL
	ZE3p020A/8L1B+K7GJwa5704D/KOd3ts/BNhUlhh/MtipejOPMhVASuwq5xrQV/ly77tCHpzmBQ
	TfeQA2DaTAfd547qNqc0vUJVlsOulay7RekY9IcA33
X-Gm-Gg: Acq92OFePIeai8yWGEhhVPHgDAwoB8s75uft/2arhYHFgelQB7z/nS5PJeugvDdWnt5
	JGAZeCBph1OrGJLuhQBnu833DEPxGixBPc2/nhVE9QIAefxeGBVr4Z9lfmt92bhgGwtZ+kLVdBE
	KQIccscNbLmtdMR73NuWN7slEXXcKtA64ObX40Rl+lOPJDB1RbjH53nwnR6oN4NHWPZ2PfngjdL
	Pprus7OywlYBISH/NqJMrBMyIghPlS5+eYZvo8cjTbgQIRVJPY=
X-Received: by 2002:a05:620a:450d:b0:8cf:ed8d:20a3 with SMTP id af79cd13be357-9153da2bb41mr2211462185a.42.1780388323057;
        Tue, 02 Jun 2026 01:18:43 -0700 (PDT)
X-Received: by 2002:a05:620a:450d:b0:8cf:ed8d:20a3 with SMTP id
 af79cd13be357-9153da2bb41mr2211457985a.42.1780388322463; Tue, 02 Jun 2026
 01:18:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org> <20260523-x1e-csi2-phy-v8-2-a85668459521@linaro.org>
In-Reply-To: <20260523-x1e-csi2-phy-v8-2-a85668459521@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 10:18:31 +0200
X-Gm-Features: AVHnY4JnfyIf0RnK8bxJ6KeAbNS_m6arDItOe01x2Gsp607TUIsUXplZCVW75vs
Message-ID: <CAFEp6-13Nr7GGB2_pXDsonFRq2Afd1oLna_MvXqkswrH5o2g+w@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=WKRPmHsR c=1 sm=1 tr=0 ts=6a1e91e4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8
 a=DERpxpyBHw47QhZkAgwA:9 a=b5241zE0TQxO9l7o:21 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: HPpkyTJLIvMci0zudjQTSNe2kT5NZpbK
X-Proofpoint-ORIG-GUID: HPpkyTJLIvMci0zudjQTSNe2kT5NZpbK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA3NiBTYWx0ZWRfX4fdqUc3+wWPs
 FrefN6w4H4jER4n8P7L/l2qyVByk22sJFoUTESGJj4PABNA4enbQ2O4FfsxqCMfACJD+Vp0993H
 4/OeavSmllXOl4TyN4AFt4Zm7NiWYvQiLn9kH9TUqI1hU4G6swrUyVXriln/gVWT5ewo2Qie6G7
 jr/6ZxZ4GO5RqGWV/5Th98bJ6qtlLDusi0sIXtyTeuJYjohsRfeebJX+8IK/6OZSTdr4UXgVvcL
 WIVJxecGrAO2oGnE7aq3k++4n9QrmL+YGRImdAl6rlN6C8t4C4YjtrCyvft0xii/e72iHxjxmTG
 62yQ1p5r3qz9PFSc/DI6RDKKM4moP3uSbRBPm4lDjecCjAJiVq0yJNREqhsn0//zLb4nhklQCT6
 ATmL66EEm1rMf1mJbtF+sIfsZi7CNczjrstS6eJ2LV1+xOUjBOfg8KqXOUFtvAIzyy94z3NH86u
 HMsg2/WA7SmLB/u7e1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020076
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63349-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,infradead.org:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:email,oss.qualcomm.com:dkim,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 4088962A66C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bryan,

On Sat, May 23, 2026 at 4:53=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Add a new MIPI CSI2 driver in DPHY mode initially. The entire set of
> existing CAMSS CSI PHY init sequences are imported in order to save time
> and effort in later patches.
>
> The following devices are supported in this drop:
> "qcom,x1e80100-csi2-phy"
>
> In-line with other PHY drivers the process node is included in the name.
> Data-lane and clock lane positioning and polarity selection via newly
> amended struct phy_configure_opts_mipi_dphy{} is supported.
>
> The Qualcomm 3PH class of PHYs can do both DPHY and CPHY mode. For now on=
ly
> DPHY is supported.
>
> In porting some of the logic over from camss-csiphy*.c to here its also
> possible to rationalise some of the code.
>
> In particular use of regulator_bulk and clk_bulk as well as dropping the
> seemingly useless and unused interrupt handler.
>
> The PHY sequences and a lot of the logic that goes with them are well
> proven in CAMSS and mature so the main thing to watch out for here is how
> to get the right sequencing of regulators, clocks and register-writes.
>
> The register init sequence table is imported verbatim from the existing
> CAMSS csiphy driver. A follow-up series will rework the table to extract
> the repetitive per-lane pattern into a loop.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  MAINTAINERS                                        |  10 +
>  drivers/phy/qualcomm/Kconfig                       |  14 +
>  drivers/phy/qualcomm/Makefile                      |   5 +
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 376 +++++++++++++++=
++++
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     | 402 +++++++++++++++=
++++++
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  95 +++++
>  6 files changed, 902 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 63389fea5d150..3b5da8a40383f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22018,6 +22018,16 @@ S:     Maintained
>  F:     Documentation/devicetree/bindings/media/qcom,*-iris.yaml
>  F:     drivers/media/platform/qcom/iris/
>
> +QUALCOMM MIPI CSI2 PHY DRIVER
> +M:     Bryan O'Donoghue <bod@kernel.org>
> +L:     linux-phy@lists.infradead.org
> +L:     linux-media@vger.kernel.org
> +L:     linux-arm-msm@vger.kernel.org
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/phy/qcom,*-csi2-phy.yaml
> +F:     drivers/phy/qualcomm/phy-qcom-mipi-csi2*.c
> +F:     drivers/phy/qualcomm/phy-qcom-mipi-csi2*.h
> +
>  QUALCOMM NAND CONTROLLER DRIVER
>  M:     Manivannan Sadhasivam <mani@kernel.org>
>  L:     linux-mtd@lists.infradead.org
> diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
> index 60a0ead127fa9..779a3511ba852 100644
> --- a/drivers/phy/qualcomm/Kconfig
> +++ b/drivers/phy/qualcomm/Kconfig
> @@ -28,6 +28,20 @@ config PHY_QCOM_EDP
>           Enable this driver to support the Qualcomm eDP PHY found in var=
ious
>           Qualcomm chipsets.
>
> +config PHY_QCOM_MIPI_CSI2
> +       tristate "Qualcomm MIPI CSI2 PHY driver"
> +       depends on ARCH_QCOM || COMPILE_TEST
> +       depends on OF
> +       depends on PM
> +       depends on COMMON_CLK
> +       select GENERIC_PHY
> +       select GENERIC_PHY_MIPI_DPHY
> +       help
> +         Enable this to support the MIPI CSI2 PHY driver found in variou=
s
> +         Qualcomm chipsets. This PHY is used to connect MIPI CSI2
> +         camera sensors to the CSI Decoder in the Qualcomm Camera Subsys=
tem
> +         CAMSS.
> +
>  config PHY_QCOM_IPQ4019_USB
>         tristate "Qualcomm IPQ4019 USB PHY driver"
>         depends on OF && (ARCH_QCOM || COMPILE_TEST)
> diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefil=
e
> index b71a6a0bed3f1..382cb594b06b6 100644
> --- a/drivers/phy/qualcomm/Makefile
> +++ b/drivers/phy/qualcomm/Makefile
> @@ -6,6 +6,11 @@ obj-$(CONFIG_PHY_QCOM_IPQ4019_USB)     +=3D phy-qcom-ipq=
4019-usb.o
>  obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)    +=3D phy-qcom-ipq806x-sata.o
>  obj-$(CONFIG_PHY_QCOM_M31_USB)         +=3D phy-qcom-m31.o
>  obj-$(CONFIG_PHY_QCOM_M31_EUSB)                +=3D phy-qcom-m31-eusb2.o
> +
> +phy-qcom-mipi-csi2-objs                        +=3D phy-qcom-mipi-csi2-c=
ore.o \
> +                                          phy-qcom-mipi-csi2-3ph-dphy.o
> +obj-$(CONFIG_PHY_QCOM_MIPI_CSI2)       +=3D phy-qcom-mipi-csi2.o
> +
>  obj-$(CONFIG_PHY_QCOM_PCIE2)           +=3D phy-qcom-pcie2.o
>
>  obj-$(CONFIG_PHY_QCOM_QMP_COMBO)       +=3D phy-qcom-qmp-combo.o phy-qco=
m-qmp-usbc.o
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers=
/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> new file mode 100644
> index 0000000000000..86ec405820e62
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> @@ -0,0 +1,376 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Qualcomm MSM Camera Subsystem - CSIPHY Module 3phase v1.0
> + *
> + * Copyright (c) 2011-2015, The Linux Foundation. All rights reserved.
> + * Copyright (C) 2016-2025 Linaro Ltd.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/time64.h>
> +
> +#include "phy-qcom-mipi-csi2.h"
> +
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(offset, n)     ((offset) + 0x4 *=
 (n))
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL0_PHY_SW_RESET   BIT(0)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE     BIT(7)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B BIT(0)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID    BIT(1)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL10_IRQ_CLEAR_CMD BIT(0)
> +#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)   ((offset) + 0xb0 =
+ 0x4 * (n))
> +
> +#define CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(n)             ((0x200 * (n)) + =
0x24)
> +
> +/*
> + * 3 phase CSI has 19 common status regs with only 0-10 being used
> + * and 11-18 being reserved.
> + */
> +#define CSI_COMMON_STATUS_NUM                          11
> +/*
> + * There are a number of common control registers
> + * The offset to clear the CSIPHY IRQ status starts @ 22
> + * So to clear CSI_COMMON_STATUS0 this is CSI_COMMON_CONTROL22, STATUS1 =
is
> + * CONTROL23 and so on
> + */
> +#define CSI_CTRL_STATUS_INDEX                          22
> +
> +/*
> + * There are 43 COMMON_CTRL registers with regs after # 33 being reserve=
d
> + */
> +#define CSI_CTRL_MAX                                   33
> +
> +#define CSIPHY_DEFAULT_PARAMS                          0
> +#define CSIPHY_SETTLE_CNT_LOWER_BYTE                   2
> +#define CSIPHY_SKEW_CAL                                        7
> +
> +/* 4nm 2PH v 2.1.2 2p5Gbps 4 lane DPHY mode */
> +static const struct
> +mipi_csi2phy_lane_regs lane_regs_x1e80100[] =3D {
> +       /* Power up lanes 2ph mode */
> +       {.reg_addr =3D 0x1014, .reg_data =3D 0xd5, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x101c, .reg_data =3D 0x7a, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x1018, .reg_data =3D 0x01, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +
> +       {.reg_addr =3D 0x0094, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x00a0, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0090, .reg_data =3D 0x0f, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0098, .reg_data =3D 0x08, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0094, .reg_data =3D 0x07, .delay_us =3D 0x01, .p=
aram_type =3D CSIPHY_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0030, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0000, .reg_data =3D 0x8e, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0038, .reg_data =3D 0xfe, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x002c, .reg_data =3D 0x01, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0034, .reg_data =3D 0x0f, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x001c, .reg_data =3D 0x0a, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0014, .reg_data =3D 0x60, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x003c, .reg_data =3D 0xb8, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0004, .reg_data =3D 0x0c, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0020, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0008, .reg_data =3D 0x10, .param_type =3D CSIPHY=
_SETTLE_CNT_LOWER_BYTE},
> +       {.reg_addr =3D 0x0010, .reg_data =3D 0x52, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0094, .reg_data =3D 0xd7, .param_type =3D CSIPHY=
_SKEW_CAL},
> +       {.reg_addr =3D 0x005c, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_SKEW_CAL},
> +       {.reg_addr =3D 0x0060, .reg_data =3D 0xbd, .param_type =3D CSIPHY=
_SKEW_CAL},
> +       {.reg_addr =3D 0x0064, .reg_data =3D 0x7f, .param_type =3D CSIPHY=
_SKEW_CAL},
> +
> +       {.reg_addr =3D 0x0e94, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0ea0, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0e90, .reg_data =3D 0x0f, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0e98, .reg_data =3D 0x08, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0e94, .reg_data =3D 0x07, .delay_us =3D  0x01, .=
param_type =3D CSIPHY_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0e30, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0e28, .reg_data =3D 0x04, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0e00, .reg_data =3D 0x80, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0e0c, .reg_data =3D 0xff, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0e38, .reg_data =3D 0x1f, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0e2c, .reg_data =3D 0x01, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0e34, .reg_data =3D 0x0f, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0e1c, .reg_data =3D 0x0a, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0e14, .reg_data =3D 0x60, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0e3c, .reg_data =3D 0xb8, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0e04, .reg_data =3D 0x0c, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0e20, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0e08, .reg_data =3D 0x10, .param_type =3D CSIPHY=
_SETTLE_CNT_LOWER_BYTE},
> +       {.reg_addr =3D 0x0e10, .reg_data =3D 0x52, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +
> +       {.reg_addr =3D 0x0494, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x04a0, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0490, .reg_data =3D 0x0f, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0498, .reg_data =3D 0x08, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0494, .reg_data =3D 0x07, .delay_us =3D  0x01, .=
param_type =3D CSIPHY_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0430, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0400, .reg_data =3D 0x8e, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0438, .reg_data =3D 0xfe, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x042c, .reg_data =3D 0x01, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0434, .reg_data =3D 0x0f, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x041c, .reg_data =3D 0x0a, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0414, .reg_data =3D 0x60, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x043c, .reg_data =3D 0xb8, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0404, .reg_data =3D 0x0c, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0420, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0408, .reg_data =3D 0x10, .param_type =3D CSIPHY=
_SETTLE_CNT_LOWER_BYTE},
> +       {.reg_addr =3D 0x0410, .reg_data =3D 0x52, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0494, .reg_data =3D 0xd7, .param_type =3D CSIPHY=
_SKEW_CAL},
> +       {.reg_addr =3D 0x045c, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_SKEW_CAL},
> +       {.reg_addr =3D 0x0460, .reg_data =3D 0xbd, .param_type =3D CSIPHY=
_SKEW_CAL},
> +       {.reg_addr =3D 0x0464, .reg_data =3D 0x7f, .param_type =3D CSIPHY=
_SKEW_CAL},
> +
> +       {.reg_addr =3D 0x0894, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x08a0, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0890, .reg_data =3D 0x0f, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0898, .reg_data =3D 0x08, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0894, .reg_data =3D 0x07, .delay_us =3D  0x01, .=
param_type =3D CSIPHY_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0830, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0800, .reg_data =3D 0x8e, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0838, .reg_data =3D 0xfe, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x082c, .reg_data =3D 0x01, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0834, .reg_data =3D 0x0f, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x081c, .reg_data =3D 0x0a, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0814, .reg_data =3D 0x60, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x083c, .reg_data =3D 0xb8, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0804, .reg_data =3D 0x0c, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0820, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0808, .reg_data =3D 0x10, .param_type =3D CSIPHY=
_SETTLE_CNT_LOWER_BYTE},
> +       {.reg_addr =3D 0x0810, .reg_data =3D 0x52, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0894, .reg_data =3D 0xd7, .param_type =3D CSIPHY=
_SKEW_CAL},
> +       {.reg_addr =3D 0x085c, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_SKEW_CAL},
> +       {.reg_addr =3D 0x0860, .reg_data =3D 0xbd, .param_type =3D CSIPHY=
_SKEW_CAL},
> +       {.reg_addr =3D 0x0864, .reg_data =3D 0x7f, .param_type =3D CSIPHY=
_SKEW_CAL},
> +
> +       {.reg_addr =3D 0x0c94, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0ca0, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0c90, .reg_data =3D 0x0f, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0c98, .reg_data =3D 0x08, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0c94, .reg_data =3D 0x07, .delay_us =3D  0x01, .=
param_type =3D CSIPHY_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0c30, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0c00, .reg_data =3D 0x8e, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0c38, .reg_data =3D 0xfe, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0c2c, .reg_data =3D 0x01, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0c34, .reg_data =3D 0x0f, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0c1c, .reg_data =3D 0x0a, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0c14, .reg_data =3D 0x60, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0c3c, .reg_data =3D 0xb8, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0c04, .reg_data =3D 0x0c, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0c20, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0c08, .reg_data =3D 0x10, .param_type =3D CSIPHY=
_SETTLE_CNT_LOWER_BYTE},
> +       {.reg_addr =3D 0x0c10, .reg_data =3D 0x52, .param_type =3D CSIPHY=
_DEFAULT_PARAMS},
> +       {.reg_addr =3D 0x0c94, .reg_data =3D 0xd7, .param_type =3D CSIPHY=
_SKEW_CAL},
> +       {.reg_addr =3D 0x0c5c, .reg_data =3D 0x00, .param_type =3D CSIPHY=
_SKEW_CAL},
> +       {.reg_addr =3D 0x0c60, .reg_data =3D 0xbd, .param_type =3D CSIPHY=
_SKEW_CAL},
> +       {.reg_addr =3D 0x0c64, .reg_data =3D 0x7f, .param_type =3D CSIPHY=
_SKEW_CAL},
> +};
> +
> +static inline const struct mipi_csi2phy_device_regs *
> +csi2phy_dev_to_regs(struct mipi_csi2phy_device *csi2phy)
> +{
> +       return &csi2phy->soc_cfg->reg_info;
> +}
> +
> +static void phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_devic=
e *csi2phy)
> +{
> +       const struct mipi_csi2phy_device_regs *regs =3D csi2phy_dev_to_re=
gs(csi2phy);
> +       u32 tmp;
> +
> +       writel(CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID, csi2phy->base=
 +
> +              CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, =
6));
> +
> +       tmp =3D readl_relaxed(csi2phy->base +
> +                           CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->commo=
n_regs_offset, 12));
> +       csi2phy->hw_version =3D tmp;
> +
> +       tmp =3D readl_relaxed(csi2phy->base +
> +                           CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->commo=
n_regs_offset, 13));
> +       csi2phy->hw_version |=3D (tmp << 8) & 0xFF00;
> +
> +       tmp =3D readl_relaxed(csi2phy->base +
> +                           CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->commo=
n_regs_offset, 14));
> +       csi2phy->hw_version |=3D (tmp << 16) & 0xFF0000;
> +
> +       tmp =3D readl_relaxed(csi2phy->base +
> +                           CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->commo=
n_regs_offset, 15));
> +       csi2phy->hw_version |=3D (tmp << 24) & 0xFF000000;
> +
> +       dev_dbg_once(csi2phy->dev, "CSIPHY 3PH HW Version =3D 0x%08x\n", =
csi2phy->hw_version);
> +}
> +
> +/*
> + * phy_qcom_mipi_csi2_reset - Perform software reset on CSIPHY module
> + * @phy_qcom_mipi_csi2: CSIPHY device
> + */
> +static void phy_qcom_mipi_csi2_reset(struct mipi_csi2phy_device *csi2phy=
)
> +{
> +       const struct mipi_csi2phy_device_regs *regs =3D csi2phy_dev_to_re=
gs(csi2phy);
> +
> +       writel(CSIPHY_3PH_CMN_CSI_COMMON_CTRL0_PHY_SW_RESET,
> +              csi2phy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->comm=
on_regs_offset, 0));
> +       usleep_range(5000, 8000);
> +       writel(0x0, csi2phy->base +
> +              CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, =
0));
> +}
> +
> +/*
> + * phy_qcom_mipi_csi2_settle_cnt_calc - Calculate settle count value
> + *
> + * Helper function to calculate settle count value. This is
> + * based on the CSI2 T_hs_settle parameter which in turn
> + * is calculated based on the CSI2 transmitter link frequency.
> + *
> + * Return settle count value or 0 if the CSI2 link frequency
> + * is not available
> + */
> +static u8 phy_qcom_mipi_csi2_settle_cnt_calc(s64 link_freq, u32 timer_cl=
k_rate)
> +{
> +       u32 t_hs_prepare_max_ps;
> +       u32 timer_period_ps;
> +       u32 t_hs_settle_ps;
> +       u8 settle_cnt;
> +       u32 ui_ps;
> +
> +       if (link_freq <=3D 0)
> +               return 0;
> +
> +       ui_ps =3D div_u64(PSEC_PER_SEC, link_freq);
> +       ui_ps /=3D 2;
> +       t_hs_prepare_max_ps =3D 85000 + 6 * ui_ps;
> +       t_hs_settle_ps =3D t_hs_prepare_max_ps;
> +
> +       timer_period_ps =3D div_u64(PSEC_PER_SEC, timer_clk_rate);
> +       settle_cnt =3D t_hs_settle_ps / timer_period_ps - 6;
> +
> +       return settle_cnt;
> +}
> +
> +static void
> +phy_qcom_mipi_csi2_gen2_config_lanes(struct mipi_csi2phy_device *csi2phy=
,
> +                                    u8 settle_cnt)
> +{
> +       const struct mipi_csi2phy_device_regs *regs =3D csi2phy_dev_to_re=
gs(csi2phy);
> +       const struct mipi_csi2phy_lane_regs *r =3D regs->init_seq;
> +       int i, array_size =3D regs->lane_array_size;
> +       u32 val;
> +
> +       for (i =3D 0; i < array_size; i++, r++) {
> +               switch (r->param_type) {
> +               case CSIPHY_SETTLE_CNT_LOWER_BYTE:
> +                       val =3D settle_cnt & 0xff;
> +                       break;
> +               case CSIPHY_SKEW_CAL:
> +                       /* TODO: support application of skew from dt flag=
 */
> +                       continue;
> +               default:
> +                       val =3D r->reg_data;
> +                       break;
> +               }
> +               writel(val, csi2phy->base + r->reg_addr);
> +               if (r->delay_us)
> +                       udelay(r->delay_us);
> +       }
> +}
> +
> +static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *c=
si2phy,
> +                                          struct mipi_csi2phy_stream_cfg=
 *cfg)
> +{
> +       const struct mipi_csi2phy_device_regs *regs =3D csi2phy_dev_to_re=
gs(csi2phy);
> +       struct mipi_csi2phy_lanes_cfg *lane_cfg =3D &cfg->lane_cfg;
> +       u8 settle_cnt;
> +       u8 val;
> +       int i;
> +
> +       settle_cnt =3D phy_qcom_mipi_csi2_settle_cnt_calc(cfg->link_freq,=
 csi2phy->timer_clk_rate);
> +
> +       /* Lane position enable in common reg offset */
> +       val =3D BIT(lane_cfg->clk.pos);
> +       for (i =3D 0; i < cfg->num_data_lanes; i++)
> +               val |=3D BIT(lane_cfg->data[i].pos);
> +
> +       writel(val, csi2phy->base +
> +              CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, =
5));
> +
> +       /* Lane configuration for polarity @ CSIPHY-base + CTRL9 */
> +       for (i =3D 0; i < cfg->num_data_lanes; i++) {
> +               if (lane_cfg->data[i].pol) {
> +                       u8 pos =3D lane_cfg->data[i].pos;
> +
> +                       writel(BIT(2), csi2phy->base + CSIPHY_2PH_LN_CSI_=
2PHASE_CTRL9n(pos));
> +               }
> +       }
> +
> +       if (lane_cfg->clk.pol)
> +               writel(BIT(2), csi2phy->base + CSIPHY_2PH_LN_CSI_2PHASE_C=
TRL9n(lane_cfg->clk.pos));
> +
> +       val =3D CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B;
> +       writel(val, csi2phy->base +
> +              CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, =
6));
> +
> +       val =3D 0x02;
> +       writel(val, csi2phy->base +
> +              CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, =
7));
> +
> +       val =3D 0x00;
> +       writel(val, csi2phy->base +
> +              CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, =
0));
> +
> +       phy_qcom_mipi_csi2_gen2_config_lanes(csi2phy, settle_cnt);
> +
> +       /* IRQ_MASK registers - disable all interrupts */
> +       for (i =3D CSI_COMMON_STATUS_NUM; i < CSI_CTRL_STATUS_INDEX; i++)=
 {
> +               writel(0, csi2phy->base +
> +                      CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_=
offset, i));
> +       }
> +
> +       return 0;
> +}
> +
> +static void
> +phy_qcom_mipi_csi2_lanes_disable(struct mipi_csi2phy_device *csi2phy,
> +                                struct mipi_csi2phy_stream_cfg *cfg)
> +{
> +       const struct mipi_csi2phy_device_regs *regs =3D csi2phy_dev_to_re=
gs(csi2phy);
> +
> +       writel(0, csi2phy->base +
> +              CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, =
5));
> +
> +       writel(0, csi2phy->base +
> +              CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, =
6));
> +}
> +
> +static const struct mipi_csi2phy_hw_ops phy_qcom_mipi_csi2_ops_3ph_1_0 =
=3D {
> +       .hw_version_read =3D phy_qcom_mipi_csi2_hw_version_read,
> +       .reset =3D phy_qcom_mipi_csi2_reset,
> +       .lanes_enable =3D phy_qcom_mipi_csi2_lanes_enable,
> +       .lanes_disable =3D phy_qcom_mipi_csi2_lanes_disable,
> +};
> +
> +static const char * const x1e_clks[] =3D {
> +       "core",
> +       "timer"
> +};
> +
> +static const char * const x1e_supplies[] =3D {
> +       "vdda-0p9",
> +       "vdda-1p2"
> +};
> +
> +static const char * const x1e_genpd_names[] =3D {
> +       "mmcx",
> +       "mx",
> +};
> +
> +const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e =3D {
> +       .ops =3D &phy_qcom_mipi_csi2_ops_3ph_1_0,
> +       .reg_info =3D {
> +               .init_seq =3D lane_regs_x1e80100,
> +               .lane_array_size =3D ARRAY_SIZE(lane_regs_x1e80100),
> +               .common_regs_offset =3D 0x1000,
> +       },
> +       .supply_names =3D (const char **)x1e_supplies,
> +       .num_supplies =3D ARRAY_SIZE(x1e_supplies),
> +       .clk_names =3D (const char **)x1e_clks,
> +       .num_clk =3D ARRAY_SIZE(x1e_clks),
> +       .opp_clk =3D x1e_clks[0],
> +       .timer_clk =3D x1e_clks[1],
> +       .genpd_names =3D (const char **)x1e_genpd_names,
> +       .num_genpd_names =3D ARRAY_SIZE(x1e_genpd_names),
> +};
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy=
/qualcomm/phy-qcom-mipi-csi2-core.c
> new file mode 100644
> index 0000000000000..dfeff863a406f
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> @@ -0,0 +1,402 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025, Linaro Ltd.
> + */
> +#include <dt-bindings/phy/phy.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/pm_opp.h>
> +#include <linux/phy/phy.h>
> +#include <linux/phy/phy-mipi-dphy.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
> +#include <linux/slab.h>
> +
> +#include "phy-qcom-mipi-csi2.h"
> +
> +static int
> +phy_qcom_mipi_csi2_set_clock_rates(struct mipi_csi2phy_device *csi2phy,
> +                                  s64 link_freq)
> +{
> +       struct device *dev =3D csi2phy->dev;
> +       unsigned long opp_rate =3D link_freq / 4;
> +       struct dev_pm_opp *opp;
> +       long timer_rate;
> +       int i, ret;
> +
> +       opp =3D dev_pm_opp_find_freq_ceil(dev, &opp_rate);
> +       if (IS_ERR(opp)) {
> +               dev_err(csi2phy->dev, "Couldn't find ceiling for %lld Hz\=
n",
> +                       link_freq);
> +               return PTR_ERR(opp);
> +       }
> +
> +       for (i =3D 0; i < csi2phy->pd_list->num_pds; i++) {
> +               unsigned int perf =3D dev_pm_opp_get_required_pstate(opp,=
 i);
> +
> +               ret =3D dev_pm_genpd_set_performance_state(csi2phy->pd_li=
st->pd_devs[i], perf);
> +               if (ret) {
> +                       dev_err(csi2phy->dev, "Couldn't set perf state %u=
\n",
> +                               perf);
> +                       dev_pm_opp_put(opp);
> +                       goto unset_pstate;
> +               }
> +       }
> +       dev_pm_opp_put(opp);
> +
> +       ret =3D dev_pm_opp_set_rate(dev, opp_rate);
> +       if (ret) {
> +               dev_err(csi2phy->dev, "dev_pm_opp_set_rate() fail\n");
> +               goto unset_opp_rate;
> +       }
> +
> +       timer_rate =3D clk_round_rate(csi2phy->timer_clk, link_freq / 4);
> +       if (timer_rate <=3D 0) {
> +               ret =3D -ENODEV;
> +               goto unset_opp_rate;
> +       }
> +
> +       ret =3D clk_set_rate(csi2phy->timer_clk, timer_rate);
> +       if (ret)
> +               goto unset_opp_rate;
> +
> +       csi2phy->timer_clk_rate =3D timer_rate;
> +
> +       return 0;
> +
> +unset_opp_rate:
> +       dev_pm_opp_set_rate(dev, 0);
> +
> +unset_pstate:
> +       while (i--)
> +               dev_pm_genpd_set_performance_state(csi2phy->pd_list->pd_d=
evs[i], 0);
> +
> +       return ret;
> +}
> +
> +static int phy_qcom_mipi_csi2_configure(struct phy *phy,
> +                                       union phy_configure_opts *opts)
> +{
> +       struct mipi_csi2phy_device *csi2phy =3D phy_get_drvdata(phy);
> +       struct phy_configure_opts_mipi_dphy *dphy_cfg =3D &opts->mipi_dph=
y;
> +       struct mipi_csi2phy_stream_cfg *stream_cfg =3D &csi2phy->stream_c=
fg;
> +       int ret;
> +
> +       ret =3D phy_mipi_dphy_config_validate(dphy_cfg);
> +       if (ret)
> +               return ret;
> +
> +       if (dphy_cfg->lanes < 1 || dphy_cfg->lanes > CSI2_MAX_DATA_LANES)
> +               return -EINVAL;
> +
> +       stream_cfg->link_freq =3D dphy_cfg->hs_clk_rate;
> +
> +       return 0;
> +}
> +
> +static int phy_qcom_mipi_csi2_power_on(struct phy *phy)
> +{
> +       struct mipi_csi2phy_device *csi2phy =3D phy_get_drvdata(phy);
> +       const struct mipi_csi2phy_hw_ops *ops =3D csi2phy->soc_cfg->ops;
> +       struct device *dev =3D &phy->dev;
> +       int i, ret;
> +
> +       ret =3D regulator_bulk_enable(csi2phy->soc_cfg->num_supplies,
> +                                   csi2phy->supplies);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D pm_runtime_resume_and_get(csi2phy->dev);
> +       if (ret < 0)
> +               goto disable_regulators;
> +
> +       ret =3D phy_qcom_mipi_csi2_set_clock_rates(csi2phy, csi2phy->stre=
am_cfg.link_freq);
> +       if (ret)
> +               goto poweroff_phy;
> +
> +       ret =3D clk_bulk_prepare_enable(csi2phy->soc_cfg->num_clk,
> +                                     csi2phy->clks);
> +       if (ret) {
> +               dev_err(dev, "failed to enable clocks, %d\n", ret);
> +               goto unset_rate;
> +       }
> +
> +       ops->reset(csi2phy);
> +
> +       ops->hw_version_read(csi2phy);
> +
> +       return ops->lanes_enable(csi2phy, &csi2phy->stream_cfg);
> +
> +unset_rate:
> +       for (i =3D 0; i < csi2phy->pd_list->num_pds; i++)
> +               dev_pm_genpd_set_performance_state(csi2phy->pd_list->pd_d=
evs[i], 0);
> +
> +       dev_pm_opp_set_rate(csi2phy->dev, 0);
> +
> +poweroff_phy:
> +       pm_runtime_put_sync(csi2phy->dev);
> +
> +disable_regulators:
> +       regulator_bulk_disable(csi2phy->soc_cfg->num_supplies,
> +                              csi2phy->supplies);
> +
> +       return ret;
> +}
> +
> +static int phy_qcom_mipi_csi2_power_off(struct phy *phy)
> +{
> +       struct mipi_csi2phy_device *csi2phy =3D phy_get_drvdata(phy);
> +       const struct mipi_csi2phy_hw_ops *ops =3D csi2phy->soc_cfg->ops;
> +       int i;
> +
> +       ops->lanes_disable(csi2phy, &csi2phy->stream_cfg);
> +
> +       clk_bulk_disable_unprepare(csi2phy->soc_cfg->num_clk,
> +                                  csi2phy->clks);
> +
> +       for (i =3D 0; i < csi2phy->pd_list->num_pds; i++)
> +               dev_pm_genpd_set_performance_state(csi2phy->pd_list->pd_d=
evs[i], 0);
> +
> +       dev_pm_opp_set_rate(csi2phy->dev, 0);
> +
> +       pm_runtime_put_sync(csi2phy->dev);
> +
> +       regulator_bulk_disable(csi2phy->soc_cfg->num_supplies,
> +                              csi2phy->supplies);
> +
> +       return 0;
> +}
> +
> +static const struct phy_ops phy_qcom_mipi_csi2_ops =3D {
> +       .configure      =3D phy_qcom_mipi_csi2_configure,
> +       .power_on       =3D phy_qcom_mipi_csi2_power_on,
> +       .power_off      =3D phy_qcom_mipi_csi2_power_off,
> +       .owner          =3D THIS_MODULE,
> +};
> +
> +static struct phy *qcom_csi2_phy_xlate(struct device *dev,
> +                                      const struct of_phandle_args *args=
)
> +{
> +       struct mipi_csi2phy_device *csi2phy =3D dev_get_drvdata(dev);
> +
> +       if (args->args[0] !=3D PHY_TYPE_DPHY) {
> +               dev_err(csi2phy->dev, "mode %d -EOPNOTSUPP\n", args->args=
[0]);
> +               return ERR_PTR(-EOPNOTSUPP);
> +       }
> +
> +       csi2phy->phy_mode =3D args->args[0];
> +
> +       return csi2phy->phy;
> +}
> +
> +static int phy_qcom_mipi_csi2_attach_pm_domains(struct mipi_csi2phy_devi=
ce *csi2phy)
> +{
> +       const struct dev_pm_domain_attach_data pd_data =3D {
> +               .pd_names =3D csi2phy->soc_cfg->genpd_names,
> +               .num_pd_names =3D csi2phy->soc_cfg->num_genpd_names,
> +       };
> +
> +       return devm_pm_domain_attach_list(csi2phy->dev, &pd_data, &csi2ph=
y->pd_list);

If strict domain/name checking isn=E2=80=99t required (is there a reason it
would be?), we could simplify the soc_cfg struct and pass NULL instead
of pd_data in the above call.

> +}
> +
> +static int phy_qcom_mipi_csi2_parse_routing(struct mipi_csi2phy_device *=
csi2phy)
> +{
> +       struct mipi_csi2phy_stream_cfg *stream_cfg =3D &csi2phy->stream_c=
fg;
> +       u32 lane_polarities[CSI2_MAX_DATA_LANES + 1];
> +       u32 data_lanes[CSI2_MAX_DATA_LANES];
> +       struct device *dev =3D csi2phy->dev;
> +       struct fwnode_handle *ep;
> +       int num_polarities;
> +       int num_data_lanes;
> +       u32 clock_lane;
> +       int i, ret;
> +
> +       ep =3D fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 1, 0,
> +                                            FWNODE_GRAPH_ENDPOINT_NEXT);
> +       if (ep) {
> +               fwnode_handle_put(ep);
> +               dev_err(dev, "DPHY split mode is not supported\n");
> +               return -EOPNOTSUPP;
> +       }
> +
> +       ep =3D fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
> +       if (!ep) {
> +               dev_err(dev, "Missing port@0\n");
> +               return -ENODEV;
> +       }
> +
> +       num_data_lanes =3D fwnode_property_count_u32(ep, "data-lanes");
> +       if (num_data_lanes < 1 || num_data_lanes > CSI2_MAX_DATA_LANES) {
> +               ret =3D -EINVAL;
> +               dev_err(dev, "Invalid data-lanes count: %d\n", num_data_l=
anes);
> +               goto out_put;
> +       }
> +       stream_cfg->num_data_lanes =3D num_data_lanes;
> +
> +       ret =3D fwnode_property_read_u32_array(ep, "data-lanes", data_lan=
es,
> +                                            stream_cfg->num_data_lanes);
> +       if (ret) {
> +               dev_err(dev, "Failed to read data-lanes: %d\n", ret);
> +               goto out_put;
> +       }
> +
> +       ret =3D fwnode_property_read_u32(ep, "clock-lanes", &clock_lane);
> +       if (ret) {
> +               clock_lane =3D CSI2_DEFAULT_CLK_LN;
> +               dev_info(dev, "Using default clock-lane %d\n",
> +                        CSI2_DEFAULT_CLK_LN);
> +       }
> +
> +       /* lane-polarities: optional, up to num_data_lanes + 1 entries */
> +       memset(lane_polarities, 0x00, sizeof(lane_polarities));
> +       num_polarities =3D fwnode_property_count_u32(ep, "lane-polarities=
");
> +       if (num_polarities > 0) {
> +               if (num_polarities !=3D stream_cfg->num_data_lanes + 1) {
> +                       ret =3D -EINVAL;
> +                       dev_err(dev, "clock+data-lane %d/polarities %d mi=
smatch\n",
> +                               stream_cfg->num_data_lanes + 1, num_polar=
ities);
> +                       goto out_put;
> +               }
> +
> +               ret =3D fwnode_property_read_u32_array(ep, "lane-polariti=
es", lane_polarities,
> +                                                    num_polarities);
> +               if (ret) {
> +                       dev_err(dev, "Failed to read lane-polarities: %d\=
n", ret);
> +                       goto out_put;
> +               }
> +       }
> +
> +       for (i =3D 0; i < csi2phy->stream_cfg.num_data_lanes; i++) {
> +               csi2phy->stream_cfg.lane_cfg.data[i].pos =3D data_lanes[i=
];
> +               csi2phy->stream_cfg.lane_cfg.data[i].pol =3D lane_polarit=
ies[i + 1];
> +       }
> +       csi2phy->stream_cfg.lane_cfg.clk.pos =3D clock_lane;
> +       csi2phy->stream_cfg.lane_cfg.clk.pol =3D lane_polarities[0];
> +
> +       ret =3D 0;
> +
> +out_put:
> +       fwnode_handle_put(ep);
> +
> +       return ret;
> +}
> +
> +static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
> +{
> +       unsigned int i, num_clk, num_supplies;
> +       struct mipi_csi2phy_device *csi2phy;
> +       struct phy_provider *phy_provider;
> +       struct device *dev =3D &pdev->dev;
> +       struct phy *generic_phy;
> +       int ret;
> +
> +       csi2phy =3D devm_kzalloc(dev, sizeof(*csi2phy), GFP_KERNEL);
> +       if (!csi2phy)
> +               return -ENOMEM;
> +
> +       csi2phy->dev =3D dev;
> +       dev_set_drvdata(dev, csi2phy);
> +
> +       csi2phy->soc_cfg =3D device_get_match_data(&pdev->dev);
> +
> +       if (!csi2phy->soc_cfg)
> +               return -EINVAL;
> +
> +       num_clk =3D csi2phy->soc_cfg->num_clk;
> +       csi2phy->clks =3D devm_kzalloc(dev, sizeof(*csi2phy->clks) * num_=
clk, GFP_KERNEL);
> +       if (!csi2phy->clks)
> +               return -ENOMEM;
> +
> +       ret =3D phy_qcom_mipi_csi2_parse_routing(csi2phy);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D phy_qcom_mipi_csi2_attach_pm_domains(csi2phy);
> +       if (ret < 0)
> +               return dev_err_probe(dev, ret, "Failed to attach power-do=
main list\n");
> +
> +       devm_pm_runtime_enable(dev);
> +
> +       for (i =3D 0; i < num_clk; i++)
> +               csi2phy->clks[i].id =3D csi2phy->soc_cfg->clk_names[i];
> +
> +       ret =3D devm_clk_bulk_get(dev, num_clk, csi2phy->clks);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Failed to get clocks\n");

Maybe it would be simpler to use devm_pm_clk_create +
of_pm_clk_add_clks ? then the clocks would be automatically handled
from the PM core on suspend/resume. And you wouldn't have to specify
and handle per-platform specific clock names/count (if such strict
checking is not necessary).

> +
> +       csi2phy->timer_clk =3D devm_clk_get(dev, csi2phy->soc_cfg->timer_=
clk);
> +       if (IS_ERR(csi2phy->timer_clk)) {
> +               return dev_err_probe(dev, PTR_ERR(csi2phy->timer_clk),
> +                                    "Failed to get timer clock\n");
> +       }
> +
> +       ret =3D devm_pm_opp_set_clkname(dev, csi2phy->soc_cfg->opp_clk);

Is there any reason for the clock name to differ from "core"? Since
you're introducing a fresh driver and binding, it might be better to
avoid making the clock naming explicitly dependent on the SoC or
platform.

> +       if (ret)
> +               return dev_err_probe(dev, ret, "Failed to set opp clkname=
\n");
> +
> +       ret =3D devm_pm_opp_of_add_table(dev);
> +       if (ret && ret !=3D -ENODEV)
> +               return dev_err_probe(dev, ret, "invalid OPP table in devi=
ce tree\n");
> +
> +       num_supplies =3D csi2phy->soc_cfg->num_supplies;
> +       csi2phy->supplies =3D devm_kzalloc(dev, sizeof(*csi2phy->supplies=
) * num_supplies,
> +                                        GFP_KERNEL);
> +       if (!csi2phy->supplies)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < num_supplies; i++)
> +               csi2phy->supplies[i].supply =3D csi2phy->soc_cfg->supply_=
names[i];
> +
> +       ret =3D devm_regulator_bulk_get(dev, num_supplies, csi2phy->suppl=
ies);
> +       if (ret)
> +               return dev_err_probe(dev, ret,
> +                                    "failed to get regulator supplies\n"=
);
> +
> +       csi2phy->base =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(csi2phy->base))
> +               return PTR_ERR(csi2phy->base);
> +
> +       generic_phy =3D devm_phy_create(dev, NULL, &phy_qcom_mipi_csi2_op=
s);
> +       if (IS_ERR(generic_phy)) {
> +               ret =3D PTR_ERR(generic_phy);
> +               return dev_err_probe(dev, ret, "failed to create phy\n");
> +       }
> +       csi2phy->phy =3D generic_phy;
> +
> +       phy_set_drvdata(generic_phy, csi2phy);
> +
> +       phy_provider =3D devm_of_phy_provider_register(dev, qcom_csi2_phy=
_xlate);
> +       if (!IS_ERR(phy_provider))
> +               dev_dbg(dev, "Registered MIPI CSI2 PHY device\n");
> +
> +       return PTR_ERR_OR_ZERO(phy_provider);
> +}
> +
> +static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] =3D=
 {
> +       { .compatible   =3D "qcom,x1e80100-csi2-phy", .data =3D &mipi_csi=
2_dphy_4nm_x1e },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, phy_qcom_mipi_csi2_of_match_table);
> +
> +static struct platform_driver phy_qcom_mipi_csi2_driver =3D {
> +       .probe          =3D phy_qcom_mipi_csi2_probe,
> +       .driver =3D {
> +               .name   =3D "qcom-mipi-csi2-phy",
> +               .of_match_table =3D phy_qcom_mipi_csi2_of_match_table,
> +       },
> +};
> +
> +module_platform_driver(phy_qcom_mipi_csi2_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm MIPI CSI2 PHY driver");
> +MODULE_AUTHOR("Bryan O'Donoghue <bryan.odonoghue@linaro.org>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qual=
comm/phy-qcom-mipi-csi2.h
> new file mode 100644
> index 0000000000000..e7c1ce00916e3
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> @@ -0,0 +1,95 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + *
> + * Qualcomm MIPI CSI2 CPHY/DPHY driver
> + *
> + * Copyright (C) 2025 Linaro Ltd.
> + */
> +#ifndef __PHY_QCOM_MIPI_CSI2_H__
> +#define __PHY_QCOM_MIPI_CSI2_H__
> +
> +#include <linux/phy/phy.h>
> +
> +#define CSI2_MAX_DATA_LANES 4
> +#define CSI2_DEFAULT_CLK_LN 7
> +
> +struct mipi_csi2phy_lane {
> +       u8 pos;
> +       u8 pol;
> +};
> +
> +struct mipi_csi2phy_lanes_cfg {
> +       struct mipi_csi2phy_lane data[CSI2_MAX_DATA_LANES];
> +       struct mipi_csi2phy_lane clk;
> +};
> +
> +struct mipi_csi2phy_stream_cfg {
> +       s64 link_freq;
> +       u8 num_data_lanes;
> +       struct mipi_csi2phy_lanes_cfg lane_cfg;
> +};
> +
> +struct mipi_csi2phy_device;
> +
> +struct mipi_csi2phy_hw_ops {
> +       void (*hw_version_read)(struct mipi_csi2phy_device *csi2phy_dev);
> +       void (*reset)(struct mipi_csi2phy_device *csi2phy_dev);
> +       int (*lanes_enable)(struct mipi_csi2phy_device *csi2phy_dev,
> +                           struct mipi_csi2phy_stream_cfg *cfg);
> +       void (*lanes_disable)(struct mipi_csi2phy_device *csi2phy_dev,
> +                             struct mipi_csi2phy_stream_cfg *cfg);
> +};
> +
> +struct mipi_csi2phy_lane_regs {
> +       const s32 reg_addr;
> +       const s32 reg_data;
> +       const u32 delay_us;
> +       const u32 param_type;
> +};
> +
> +struct mipi_csi2phy_device_regs {
> +       const struct mipi_csi2phy_lane_regs *init_seq;
> +       const int lane_array_size;
> +       const u32 common_regs_offset;
> +};
> +
> +struct mipi_csi2phy_soc_cfg {
> +       const struct mipi_csi2phy_hw_ops *ops;
> +       const struct mipi_csi2phy_device_regs reg_info;
> +
> +       const char ** const supply_names;
> +       const unsigned int num_supplies;
> +
> +       const char ** const clk_names;
> +       const unsigned int num_clk;
> +
> +       const char * const opp_clk;
> +       const char * const timer_clk;
> +
> +       const char ** const genpd_names;
> +       const unsigned int num_genpd_names;
> +};
> +
> +struct mipi_csi2phy_device {
> +       struct device *dev;
> +       u8 phy_mode;
> +
> +       struct phy *phy;
> +       void __iomem *base;
> +
> +       struct clk_bulk_data *clks;
> +       struct clk *timer_clk;
> +       u32 timer_clk_rate;
> +
> +       struct regulator_bulk_data *supplies;
> +       struct dev_pm_domain_list *pd_list;
> +
> +       const struct mipi_csi2phy_soc_cfg *soc_cfg;
> +       struct mipi_csi2phy_stream_cfg stream_cfg;
> +
> +       u32 hw_version;
> +};
> +
> +extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
> +
> +#endif /* __PHY_QCOM_MIPI_CSI2_H__ */
>
> --
> 2.54.0
>
>

