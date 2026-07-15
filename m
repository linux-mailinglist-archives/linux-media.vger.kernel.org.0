Return-Path: <linux-media+bounces-67626-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B2alGlM9V2q/HwEAu9opvQ
	(envelope-from <linux-media+bounces-67626-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 09:57:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B41ED75BA72
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 09:57:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Sz+G2/VC";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EmYkvSsx;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67626-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67626-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7583302FB63
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 07:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657AC3C3C0E;
	Wed, 15 Jul 2026 07:53:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022033C3782
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 07:53:04 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784101990; cv=pass; b=Q9OJ/9QE1cvORPsto+T3HfGkbuXkwFD9zcxDvaqtKCJRPTvcE4B0JDuM/IjaJNjwIblnlAZjfLjGcWUyu7a5J5vAXhV4kwD2E/qiL4beq0HYRBoUf0wgKXCze3xQStilK4gGNJQNHl0do/slbIn4nOXItHKnGYqORIyizkB7NTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784101990; c=relaxed/simple;
	bh=9YX4dE+yfNDLsdJvZJbsFDglIGvjVkjjw2Mk4BuFTmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cx2ra2Oob2m3j+DuwBN/DsppYhy9IJBvdm1VFtx+fi/7TtYomggdEu0GgPwtLUJE4+VKaPv4ODMI2uNUs+lTfthPGUTJn8RNKGENJL7B56r8OuAz3rtn+T9jBk4zESf3Kkmh/Cc+LBad3Ujr2yuOFC+/jbysbmq4BJTzBMdPfJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sz+G2/VC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EmYkvSsx; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lJxd2528196
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 07:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pLek28axscsCPFWO/Z/JAne78HjenYIUsRjAVNxPzWo=; b=Sz+G2/VCYAbYlEVg
	GWsJHKNm/x1ElQWVGvbElyl795HC6WCN4WOhRCllGM8MOAU9YVPnUWr8nfjcAj6i
	AfSomJ/oRUOA3Mpk3ehnz7XD8cWUfB+0uWBqAwm3idNoqVq1AmKS1wwbYXZGoOFr
	r3KTmwK91J9i6vmnou7C9BY4g2JzkWu0XEGw7BC13GwG8SLrMptnde32Ho1XXUGg
	XA+F/DEH3kkYbV9gzNSVNTxYbS8tG+fOBnscHcvIuEqpcfffLy2HYYhbUoiu8Vuq
	Vd7b2v6BncOCq6mdqgj3DU4gg6I21hUDnOF95n2wcQAb4eMkyvFISLWK1xBypWod
	pKDHNA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnr3myk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 07:53:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e52306621so711790885a.1
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 00:53:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784101982; cv=none;
        d=google.com; s=arc-20260327;
        b=LZzKNn2mDVdhPhhnWZTH7LY5w+qwzUT46iQKCU/gbSBxdfKpGHlJwbre4zOtDD6Ccq
         LPJ7xfbt9HjseEgnjSs6eyriK9vnGGjWWRSRNBVHcnyIbEqUI3GXvJnZZMq56rprgzT/
         0dWpEn0x685DGmBueo3xmUMe+8mD8rC76o9TKL5vk+sE0JFDQuPgM3WEBMGU7LXyjpZe
         DL72BiqOMLINiC+ysvVUtuPWKwZj1XC+sQU6Qp3wLkccX+9wt6Okj+D86Q+F81/r7eMg
         McrJm3eMe8EbdC6EQ6sg3XJ2HkP+0jOrpDrKQyBAljWiNB6ji57SBA4EmoTC1LcPLgaJ
         rVnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pLek28axscsCPFWO/Z/JAne78HjenYIUsRjAVNxPzWo=;
        fh=wyWoSOcZ+xpSJwmmbEgKbPiCu+dXPEMZeMSChD37WXk=;
        b=P/X2WlT3aekQavrQ+tPaM8TXoP671qGv9vCSTyPoxr6ri5+soa/BF6qexlBLJpQTgt
         ft8W0rtwcwATMH868e9e+wRIYRJdE6h6kCBPsXTLJTwFWfgE6GPuehPufR5tT21dXzAx
         QRDqgKc17u8DRn+/izKW96vFtqsoiTWKb6z6NdHMCncaDcZMLwfVfUCUrO4b2qkkYjvr
         sbvX8onUFKD7vhjRvJ3tJragNHFsivpjP6Vkq20N/jXRtsBE6nwBKXxuEmjBqEemGovb
         ftetsFQJrHrW9etzagKHduGR/dZllM/OG/Btax5hyONeGL05qHRxp94LgzL+ggIvprmz
         gpqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784101982; x=1784706782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pLek28axscsCPFWO/Z/JAne78HjenYIUsRjAVNxPzWo=;
        b=EmYkvSsx+ruwWVPb/DqC+gX/hZ1JtW5YYJtNgfehs8w0SVr5hWvxc26ids2qfh1IjD
         D/plVyrM01xgSFD4gRwxApo9r30qVITQukya/JN46/MPvO3BMPhsw1j4V7igw9Zqnoir
         ExfU+tjwIPXBY9PvvBQkagHZ7y6w4r/WyW2YrsbTOXLQKvGHpXgz0fOpfh4jf9ye+BZO
         zMeI0bsUZuKe/aIbvB8EqgvD1oNAR2K6oqzjg9Pz7UC3KNPMFGBBLbL5m2oT4Aop2EBz
         0kk99Wcc0Zs5DqnbmjchvRRxGhOlsG0kdjNQjnuR7NS0D7tX2B9ilnOT0kLhK/Hokwiu
         1y7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784101982; x=1784706782;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLek28axscsCPFWO/Z/JAne78HjenYIUsRjAVNxPzWo=;
        b=DI6HGcoe8OThXHCSurn2Mq1B3UeECzM8uRLztwvTdknfVqc95hN3A8b01wpE98v6zl
         DRSLGJexGKnokS6PjSnkOp3v24Ykg9KgyucO9ThdCDYQS/l4cwX8uwR6aj6gISCEGrVY
         K0tD3kY2w82b6poznd5dpjLuEcH7l2vzCS1VcXWsEhyLK02OWa6qi4ZiDImritzU4RYO
         HRf2EUgZFvO4wYA47rE6t5Z7dKquHMDPelxSUWFHgI4xLoujHFay9FYKrwXVPR6IDcrh
         bwiulRHhYOASNgJQy3u3icNWz6qhD01M5Wg+MgmAC87PESZGQJlTAKpQvumIAccQ1iQb
         ZRLw==
X-Forwarded-Encrypted: i=1; AHgh+RraE11XXKPDRi+pHxRkaPHXkjZuEaIrfAoWrNkhWJB0HVgYpaNMsjiGiXg43bsJ91SMAlVWE1DI7G+NQA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6DREYNGKmcNyBwB/gzVafMd2tL1BCCKHAeQuZOeZCmLTv39yq
	eomIw6zNFkd/aPCAzqH7vmLCsnp0xm8hW0nwq8m3b4BSLB1fvGPy6zSL66w/3Md5hEEhQemT+oN
	JxTBNzxRC5I1VAuIuydS3E/2aAFjH8Beyrs7dxzml5t9s8JrTeQC0dr0Sa3jk2vHtan6sGg9j6m
	JtLO3jXZD4YdYhZUVZU1SVL4kA724XHTiiowcZhD3b
X-Gm-Gg: AfdE7clhMfQCRQBObtyNnXCEEf1qwMJMBmNsdD6WLfeAz11mimaxh8TyCrCYJjB7hne
	6h1leDZVVGueBwiNfAkv+tj20N3Shyw/j8TIb9Si6xrTW4HZgl+2dtpubFsKhnBDTFYMm/I7C1M
	yy7bpVjihNpFsuEYsf00OriZreYho6T/RQk3jkL2PLYqlQBXDkdFBQHsiHytU/disyoRbSHjSrN
	dZA1n/W0f6mTTPoM7rNknU09ItKe0InS9LM7vVr/eINt66MHcn5LFjgs3gZ1e6hLdVV//yOYN6f
	ZuorXhYEQY8=
X-Received: by 2002:a05:620a:600f:b0:92e:8210:fff9 with SMTP id af79cd13be357-93086bea55cmr545863385a.56.1784101981785;
        Wed, 15 Jul 2026 00:53:01 -0700 (PDT)
X-Received: by 2002:a05:620a:600f:b0:92e:8210:fff9 with SMTP id
 af79cd13be357-93086bea55cmr545858585a.56.1784101980599; Wed, 15 Jul 2026
 00:53:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com> <20260713-shikra-camss-review-v5-3-db53be15dc4f@oss.qualcomm.com>
In-Reply-To: <20260713-shikra-camss-review-v5-3-db53be15dc4f@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 09:52:48 +0200
X-Gm-Features: AUfX_mylGXRGoAJ8WLPXjHG-LrYjgeK28hgV3O_EXafPt2RbMf7pLiI-38KOrs0
Message-ID: <CAFEp6-3MrGLyTQ5+qaZ2nF=EWLgOhepTB41CwEEQZwJ6zQh8Rw@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] arm64: dts: qcom: shikra: Add CCI definitions
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
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA3NSBTYWx0ZWRfX9VxVQ7dKcxRE
 5nPzExZDqvgfmbu+IQIl3PCHnQU30NIFbTrc9XZPtEcSwviMxCdQmQckkgneNjP+lBpk2kHBnlQ
 hnqVmHkjvLbTUvr5T+GpJ/lpS15KgXg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA3NSBTYWx0ZWRfX+0gcIgQyvIeh
 SXhclVYN+3smLgeThLVpbn5nXTHehab9rqw3Pv96gS0yc0RwWf8y879Nl7oUn5Hdi+l4VuTWxrF
 twBByit0gdupxkFUibC7ZBIyJxe0gI+S4lW4SdMA9UoXQ0v69rM1D9F0q7oQqhO9Xsen6cFQUFX
 0/C0gzY8NCnyRt+kI2Sd7g+Y6X8D2QiCsJ3oENWCE0x/B7fGqnHJ/JPRueTlCz8I0kXzyKEXzGD
 ufz9CIAMSy5o+HNqGMombbTYge1vGW9J6zWgHeLSIvz40lid//HvR5/PLcl+oxH2RBmhobwmoEC
 9dXGWdpBwHUV8w5FMfGiiKFsfDiQSyMkbe3EIQhP7gT9FupBtZLp2brQoVvuk/o0v7fJixGMr2K
 T6NDeIv1zVRf6mhG/7BV3daHhCYISf3AcwQRc4w33j5ehlM4c2wPtc84pUkfbx9ZtsQuH2t6ZLq
 gTtrHhODw68m79SgssQ==
X-Proofpoint-ORIG-GUID: d8fOagVp73fPMVMlKsMnZLtUZ9gIgHcu
X-Authority-Analysis: v=2.4 cv=NfPWEWD4 c=1 sm=1 tr=0 ts=6a573c5e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=U2PIo7JDszhCzVx53KgA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: d8fOagVp73fPMVMlKsMnZLtUZ9gIgHcu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67626-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:nihal.gupta@oss.qualcomm.com,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,quicinc.com,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,linaro.org:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B41ED75BA72

On Mon, Jul 13, 2026 at 11:29=E2=80=AFAM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> Qualcomm Shikra SoC has one Camera Control Interface (CCI)
> containing two I2C hosts.
>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 70 ++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 70 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/q=
com/shikra.dtsi
> index 6335caca329808ee04d9067f1f95e8075e2fc3ed..18da1380e52acdd8813625eac=
eac796e342efd16 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -355,6 +355,38 @@ qup_uart0_default: qup-uart0-default-state {
>                                 bias-disable;
>                         };
>
> +                       cci_i2c0_default: cci-i2c0-default-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio36", "gpio37";
> +                               function =3D "cci_i2c0";
> +                               drive-strength =3D <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       cci_i2c0_sleep: cci-i2c0-sleep-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio36", "gpio37";
> +                               function =3D "cci_i2c0";
> +                               drive-strength =3D <2>;
> +                               bias-pull-down;
> +                       };
> +
> +                       cci_i2c1_default: cci-i2c1-default-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio41", "gpio42";
> +                               function =3D "cci_i2c1";
> +                               drive-strength =3D <2>;
> +                               bias-pull-up;
> +                       };
> +
> +                       cci_i2c1_sleep: cci-i2c1-sleep-state {
> +                               /* SDA, SCL */
> +                               pins =3D "gpio41", "gpio42";
> +                               function =3D "cci_i2c1";
> +                               drive-strength =3D <2>;
> +                               bias-pull-down;
> +                       };
> +
>                         sdc1_state_on: sdc1-on-state {
>                                 clk-pins {
>                                         pins =3D "sdc1_clk";
> @@ -702,6 +734,44 @@ port@1 {
>                                         reg =3D <1>;
>                                 };
>                         };
> +
> +               };
> +
> +               cci: cci@5c1b000 {
> +                       compatible =3D "qcom,shikra-cci", "qcom,msm8996-c=
ci";
> +                       reg =3D <0x0 0x05c1b000 0x0 0x1000>;
> +
> +                       interrupts =3D <GIC_SPI 206 IRQ_TYPE_EDGE_RISING =
0>;
> +
> +                       clocks =3D <&gcc GCC_CAMSS_TOP_AHB_CLK>,
> +                                <&gcc GCC_CAMSS_CCI_0_CLK>;
> +                       clock-names =3D "ahb",
> +                                     "cci";
> +
> +                       power-domains =3D <&gcc GCC_CAMSS_TOP_GDSC>;
> +
> +                       pinctrl-0 =3D <&cci_i2c0_default &cci_i2c1_defaul=
t>;
> +                       pinctrl-1 =3D <&cci_i2c0_sleep &cci_i2c1_sleep>;
> +                       pinctrl-names =3D "default", "sleep";
> +
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       status =3D "disabled";
> +
> +                       cci_i2c0: i2c-bus@0 {
> +                               reg =3D <0>;
> +                               clock-frequency =3D <400000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +
> +                       cci_i2c1: i2c-bus@1 {
> +                               reg =3D <1>;
> +                               clock-frequency =3D <400000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
>                 };
>
>                 qupv3_0: geniqup@4ac0000 {
>
> --
> 2.34.1
>

