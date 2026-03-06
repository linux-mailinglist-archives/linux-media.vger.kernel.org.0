Return-Path: <linux-media+bounces-54832-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKkULrkwq2n2agEAu9opvQ
	(envelope-from <linux-media+bounces-54832-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 20:53:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33592227464
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 20:53:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 486273046697
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 19:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED9B39890F;
	Fri,  6 Mar 2026 19:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iCY4NdxM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W1bbnsDb"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886833EFD1F
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 19:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772826805; cv=pass; b=Y1cnrCG+Ydoq5Ka82XlmUBmSX8DNW+0P8Z6cYmAtrCi5Iwlr3HbzICobBvAU7dG8y12+ZWaVngwtAW0C7y7u/mAE2Du0m69scwqmJ6iuFEhs1+M7LaDerkS16Ua+wbpw7C0s2cabgILtNVHwEebya+LUBzcTq7pBZsQd0AfUsg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772826805; c=relaxed/simple;
	bh=OjfTU+0hklkn3eFr8miMyNuw19Uifl76RY/4T8OKZvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xw17d9If3rk0PZD9RnLwqFTzjDVVBcjTf240yc8gT1XP+qPO5jscggxCbq5pWBFwc/YLA1aryOwCJHXr6cTB6g23D/HjTRHd4p0wv2hjv/SNBvYyAzrLfiRv33D+IlWIRphpbhCVgrJ348af2Jt/5fq708H2+Ce87erFz5gkCtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iCY4NdxM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W1bbnsDb; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H1eee238579
	for <linux-media@vger.kernel.org>; Fri, 6 Mar 2026 19:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dD+tDGfxsTdJfMyPNE7/EVXVwbRU1hLK0aoew3lIXOY=; b=iCY4NdxMkxM3P3/3
	1bB9jCpR98Rg3M/bZYigTlUbZJbzHn3XiAl+X/BlTpjNnTNogdtx9/PpIytAhPtq
	+KuHt793yFPxyh/SYrSZfVoy9uFqZvbJgmqmJY/mIT7jZmsI+8dfQYSwLgWfJm8M
	sA/Ng1AEJmpXTPuuM4wq9/KEaE59Y948YWE8Mz+JFHHs/5MBf3PFyNtosQv5J1wf
	PK9+KtDtYB3zeUM5JPgBBaRIQEFFki5Y2i1bIUE2n6dG4hOl3q5nLasrB5BuItVM
	uN1Leboko+28Mm77nwdaASL0ehKQp/yAbRjlQ/3K4tCuvw9JwkDIOvHZvToXwiR3
	zpXyLg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv98j0fs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 19:53:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70ef98116so6224320385a.1
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 11:53:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772826803; cv=none;
        d=google.com; s=arc-20240605;
        b=TevDOchpPnOC4PlR75mBA+bTMzirZ7Cy/4/nLmA+rUDm5+jOZad9waDNjdn2plx4yX
         /sJIsbWMFEeeLblFoM32bW7aZqjTX+DoIfb8CVK3PCaw1yHQd9D/MGfT2Eomm2hVCZY4
         dpybP3Hed6ZyZnEB/esebM/RVwJL2K6qoezCRbS/JuwK/r+kVO6VDHjFSy1dhJOwPBWy
         5N01T5q0AazmInFUV+BjV/teJfpyZodIfP8yx5owXkTOHoFI0As8m2wqDv7djvg1pPoR
         q4BivDQpPNDAqGehTT7OAzSmzQjfRyhNIosFecA+gdT37HvhoXMEIkeAHv8gsyNHcndC
         S8MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dD+tDGfxsTdJfMyPNE7/EVXVwbRU1hLK0aoew3lIXOY=;
        fh=sRyiJQBq2GkxzdiAxcptnwrzF1LRCR9ZF32rnyDhLQo=;
        b=M+ajGY096992bF7VC/K4iAdPzmXp7KeXtUbywa/v1BWU6fk9KflEhWtb22/TIgGK+Q
         Hf1RriqlhqifNfB5cE5vwHcSVkk4O9LzdEbQ3kyQu8JatQi5FYV5BMYu8lJaVcEylA5J
         mvk75cS9R/oqxxQwjNiLVQ4ZDCxK8rDUvAhI7Cf+CZmFpSfND9j0YaYloROlXeLPYLVO
         /d3lTuI8DAx7z+4qKlhemN0nIDQTlqpR4DikgK+WIkIFcb08r/uKhaUpsEZQ86bgdihj
         ai4dE4trC2NizWHM5aBc8C3bQEBP/E3K2Qk9L9vmQgI4V32I8WFq9NWdzM30yqFaexwr
         e5sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772826803; x=1773431603; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dD+tDGfxsTdJfMyPNE7/EVXVwbRU1hLK0aoew3lIXOY=;
        b=W1bbnsDbrIGNg3G+cubzbXnSgloaeGZKvMAP/RL1Q9OXAMjJgfQqbIfJGnsmmo191N
         P5wZlnzVjQ3hJzGJB1EI+3yryN1bFbDVqO62ws2yd+sqPE2JODhynWuXc8nnX7l6jzA6
         TnG8Tt7G9Nrf8xaGodqdiTze8QLcE6iKHG9x+Q+wFnvuuRzutPNW9BuS/FRkbbd/B/+n
         0KOwFvCXInN5gAiHtrwIssOkd5J0CD1LCDzRfioZR36O8dsGPa+jqtVpPeAdAFrCp8mE
         ulcuLdmT+Tco7lIWd0+f+wPGSOs8lyJjAX94BCUEMB4IJL6lYVJ4L4QA7Kp8EKhkELap
         a3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772826803; x=1773431603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dD+tDGfxsTdJfMyPNE7/EVXVwbRU1hLK0aoew3lIXOY=;
        b=Gp8U2t/YcfAkThi/xxRy8Qe+LkJ4u6QQtIelD5Oa4K42Twzchqgi/YI/ckkvT6SVru
         VnHy9c05LOmUx+Y8pDOjvp0DkPfQc1tVcWKbnI6rZDLUe9W9OysG8aldfrZaoeqkLlv8
         GmKIlqwPocnxJPNIztYkJWLJxWcAhuwbSOH+TOnhnaGiOI4VALlr6IEjH1kYw6ivKexg
         bopQ9RI6hz8VfV99vwtulz4yjbw0RT12CXHFERDb6tOAkEI/N9BR89SS0dwJ4jvuF+0L
         0WkNMUcb2AVbY92C+8T6J8Us5cctdJGydbNVzxuYhZMECxegi3z2+PXC1Qa/WzwonEZQ
         Ts9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTelmp2qRUehvagd67oDnF1yZPtfIFy0C/Rj6PvmS5t2AD5RXEn9vv/zyqRfiLyue3Dt6XbhKKQkyIqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGmPsrT5c9BTyAHZHfgGFnnjfA6sGiyXejvpsWDzq3AArnjhqH
	M+lJIRcfvADotWNe1MclN9mFW/6mjiz95BzkHjZo2Jz2Eg1ovMb1mEiy2h9F7qrO44NxdtBF2Vc
	IKGYfFA4b8cp7hGxo4DVz36P7S/Oi40IY11m/933sMZHI36akauJIHh+k1ZMZz1idW8paVvAiNi
	rIpzT4niNPX0VLZi5yc44yEiuVvnLx1VIsZcpRneiM
X-Gm-Gg: ATEYQzy9xpiuL5p04eRJomGRID8BxiHc2ohZpvtcDVyEx0byke86unSOd8HVXZ7yruY
	J1lWHlP80lpoBb1b4I+HmQxTBsDbwxbrS7aTPSQx4VWQss6yVHOtIb3Wj34YRnPAKedrsxo7fGe
	HunkfOH5Ge7NpYn9yFR05Uz6FkRdZeX5DMFce2eKHIIne2CyCduPFw3V15f3MsynC6ThNorr1dE
	gGDxbD/DNQaK0c2HLuxRstyy1KH66Vj2lh2jrc=
X-Received: by 2002:a05:620a:c4e:b0:8ca:90de:43f7 with SMTP id af79cd13be357-8cd6d52f361mr405114285a.74.1772826802776;
        Fri, 06 Mar 2026 11:53:22 -0800 (PST)
X-Received: by 2002:a05:620a:c4e:b0:8ca:90de:43f7 with SMTP id
 af79cd13be357-8cd6d52f361mr405112185a.74.1772826802351; Fri, 06 Mar 2026
 11:53:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306140220.1512341-1-loic.poulain@oss.qualcomm.com>
 <20260306140220.1512341-5-loic.poulain@oss.qualcomm.com> <c15ce981-a14a-413e-8c81-7ec8521420a2@linaro.org>
In-Reply-To: <c15ce981-a14a-413e-8c81-7ec8521420a2@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 20:53:11 +0100
X-Gm-Features: AaiRm511H0k5u51RsbW7kfh7JFdb_mXCn4xI85_aj-Q-VMcInjAD-KxtBanlQlw
Message-ID: <CAFEp6-2K9kr_2WoA-KuLDfF7wO_p5q1G-pnw-EL6TCS0tfoKag@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] media: qcom: camss: vfe-340: Proper client handling
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: vladimir.zapolskiy@linaro.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mchehab@kernel.org,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Dd9-2cesV3lqCyxxzowtfDIefTR2gl6g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE4OCBTYWx0ZWRfX7BfTpjeu8vhp
 GY9xlqyvuYWN/66+m7XtAVGxOALTRWVRLgHOH6VDEsX/RZEkiyTL+NNlXgX2MAAYZzGBsnE11M8
 ehK9sbSJuCMCzazqIXoIHE8ENCJHzly8guBIa1/lDAl6ve16pyRtEW518slghlJs05Xv/jKJ+Wj
 Frx2YDnCNgF03OLMvQKGh16i7Hl18b2vG3RS78hXHli5xhUwTD85mmLus0V0csNDTZuVs7DNlLp
 rh742V+8rKKSRfTYA/klhH5G9fLLdLwz8hipbgbX8l8GzrzpfnwK6cvX5qQzgQlmH0I+zN86P+t
 CciqC3cbWYRYwc2VdueZ8auilVhhySfSdlhmoyIC+F1K6rlLDgG3TWzU3nDQ7YZwXIH7K3X0rCK
 Cd3SqRgLTowv0OEYRmX6mGUt947cYSR6ZeJVMfaFi0HBYNqbTkVSzbwnLe3Cscef+8XlayyVaYU
 o4dCxUqxayJQijGprAA==
X-Authority-Analysis: v=2.4 cv=LbcxKzfi c=1 sm=1 tr=0 ts=69ab30b3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8 a=EoIaBvceLRfHZLnecOMA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Dd9-2cesV3lqCyxxzowtfDIefTR2gl6g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060188
X-Rspamd-Queue-Id: 33592227464
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54832-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.963];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Fri, Mar 6, 2026 at 6:56=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 06/03/2026 14:02, Loic Poulain wrote:
> > +static inline enum tfe_client  __wm_to_client(u8 wm)
> > +{
> > +     if (wm >=3D ARRAY_SIZE(tfe_wm_client_map)) {
> > +             pr_warn("VFE: Invalid WM%u\n", wm);
> > +             return TFE_CLI_RDI0;
> > +     }
> > +
> > +     return tfe_wm_client_map[wm];
> > +}
> > +
>
> I still don't really agree that array out-of-bounds should result in RDI0=
.

Ah right, I will drop this.

Regards,
Loic
Regards

