Return-Path: <linux-media+bounces-63272-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIctHeqWHWoXcgkAu9opvQ
	(envelope-from <linux-media+bounces-63272-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 16:27:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 17239620D87
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 16:27:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 163FB301384D
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 14:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D58023BB105;
	Mon,  1 Jun 2026 14:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eYSeQywf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZKFXRqJm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D064F1D61BC
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 14:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780324068; cv=pass; b=FF7LJ9k1ve02yoKPm3ZObH0az+gafTpDAlTi+V5+6K7j82r8i5I1SMnOFTl2hN5yJYe1BnzCDQgl7/NcRm5KzwaMjVW3gID0awsK5FOO4Ipm6C1kQvoBHCukGJXgucKR0PjPr3/ObED3LvbShrDoFFhuZDdaQVbDAZ4n7uJXSGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780324068; c=relaxed/simple;
	bh=9MT//ZKbS3gf8ba9ralh8FSRPAk+r4LO2VRLdZ5zo1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y9F8Gwa70fghXS1TRnP1gsxFQC273senrmBvy+DE6kUerSR97u4jb9v0iviDWHAcS/gn9g/hHNPnKQPT8dvGZKzZkuzuiMZr2hjrRA4sZGr8YzLtCs2te2GQbIKitvp21Raq2m3vmxU61Du1p1UBtx5st+LKM9/arSESUpYyAAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eYSeQywf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZKFXRqJm; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651BB5Mk3127892
	for <linux-media@vger.kernel.org>; Mon, 1 Jun 2026 14:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9MT//ZKbS3gf8ba9ralh8FSRPAk+r4LO2VRLdZ5zo1E=; b=eYSeQywf7FMxqrQk
	od7fVL+a15CjGgOjdKZ9JrJ6YgjM8H3b2KIHu1wZdwESi2mpqdqdk0gEILmxUiHd
	z7cILavNamfurl9wlRFX4dJL7LgBTviAm3kNOZa8ZsZNKq6RmiTRn466q+SngTqF
	MKkap1nUOcXGSGemv+DzXT+Bet7+QpfuoovnXJmrziUq3MPPtbOP587h5B7hJ09g
	w2R4AMcxbr/duIUgGGpmFUBxyAM+pcfI5jDVqBE584F72S/9lAbrV0FpLLF7+8Ix
	W6m3+2XO84Cydmp6MgZg4CdmVCBeXCk20G87YdSUah+HAZSPz3t5QClstxpP5fzO
	O/GUJQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh9010suf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 14:27:45 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8cce0957698so63932276d6.3
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 07:27:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780324065; cv=none;
        d=google.com; s=arc-20240605;
        b=Cq5UzIXHA7RcTogy7FM/80MWKgUnnI3/wMLPYntWjS9UUy1oOOsaPucQZwclm9E0ut
         9yvS0pVn6nOwo7k3+tEFJummM0BuWrlu1x/h6wKqmgB8m0fF4mH1ADlM9drdmUa/ktVx
         My5RbEFkO01Rs2Af/hIMUfV6VsJiI5QrHHs+vsjaCgu/D1Sgh4MmbgGlY7rqzyAQuwUW
         O+94pEvBZxcyfh9j7PimyhXBf9WS+ovd4+UwFu6djdPqHne/eIesLjyBAudUJcdShAmE
         JOfDuy+Z9mCGNId2YUdwxLxDCKjueasGbCRZX2IqZleLSJTCmpHVq8Qx425i+5dSQIpK
         HKMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9MT//ZKbS3gf8ba9ralh8FSRPAk+r4LO2VRLdZ5zo1E=;
        fh=u0SogY7ugBDNxaIviBUR0D4rSZTEuOb4hnl3W6UVSp0=;
        b=FyBGn3T4ySeNcB0tHSZyxC1GIeDtoSA+byUBOr3+h6yHgoVW5v6VZQq+CECmZmzLxI
         44OXVavev1H8tc9AOZrQ5p1x/tH+0T4MF9rnaLV2AH5vHXo8gtUphWEaV58UpnTqhPHR
         IAR3/WcIpdUrIKIFRhOgUhzvxIyD2iXZSzP1fVY/klKz5Te861gX5rAIx7BAOHfwJat0
         LR0w8q+4jfm0kVAIL6193rsXh/ABOtsHjox4QjQnAz/LIRNKDQg516EU53AKGyCxJwWq
         PoGUSjX/tYdsgCLdBGYnn/gpBF0tzNc0U0n3zelfh3ewm+O4ehV4w07LeeTeKO3gXOyT
         22Lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780324065; x=1780928865; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9MT//ZKbS3gf8ba9ralh8FSRPAk+r4LO2VRLdZ5zo1E=;
        b=ZKFXRqJmBAgulbKGv/wfOvm/maOrMwM5ZsLytEhBL3KmJheLaHVfxANoL2gajheQoN
         /J13EibTMuOnY3eUnsuEfBlPSdSV1RxBzNmGTGR3NLyegByMwywSfiL3FKDqdqeuTg8C
         UjLTvMArxtHbY2OZUoQIut/vZk+pedCwq5++fBgKaAN3x0Xevp+ed6ljzAX7FZiQ9CU3
         ISbQMFZZLfOepM2Ln2zuwbW9K/Gdltfj1u0UgHqOc1Av2wKswalFHvI0ZbA8c/V5g5Lo
         LivHI1DF19JnjWNAOq0IbeJ6DBA3vbHz1ul7nxM4yOh1VuWjSgBk8O2aZ1lXQQPeReQb
         lExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780324065; x=1780928865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9MT//ZKbS3gf8ba9ralh8FSRPAk+r4LO2VRLdZ5zo1E=;
        b=jyAzIvwVvHTdPaFsi6dQRzh85FPiREw53XFetAdHipt4UMTvgTpRj1TwiKaPT/gkxZ
         5nlQxU0W238pLujgyYRSpKxZU1y1RjKMJkcX2kVVH7bokDRMfs2EpCl34gtk1LOImdnZ
         TEoIKiF/j+DmFN2p5MuhQiHSjPQ7tUa06st43QnO5sUtlKIV0S5AAeGsywVPbkGL5MNZ
         ol/oCVB5yFWJ/BwNGrKu2pzbFzF5K7iskK4TRHU+0RW+IaSooxVu/+73PPZK3HL/JNYY
         yJL2KOpYzX7Bg+pkiPxouoWzFfK89eGGBGoXDmpbf9tYdLjiQC+IXyHhT9hmkfvS55QQ
         iqYA==
X-Forwarded-Encrypted: i=1; AFNElJ9OlQjnOHIF2lXVn417ITWHUE4Kmh+m6DRWO7szBk2z1B9a0ngSml6ZfFVom/R0tr6NfDWChKbPI16f3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuOWQBnnfMLYmisL5z8J0LR3TH8PlYk9BZQkAnQT3kJ9amImre
	wEQrNlctzrSC8CvkQ7c+z4haFck8eVQkU1CxgQULkkuN5tnbmpRpo7NmE6Q4+iqEhWFALfd6sbp
	V/pAD3sVRsypOZ6UAP/oq3KKF0w+8vHnCSIHeOMYlRU7zSSdz6bSC9zrFePYqcHCEuit0THMP3w
	AbHkjKqSQi3PYgJKiAj0wpglgSkr2M6dKKGe0H8wUz
X-Gm-Gg: Acq92OFtDJgiiLsJPWufxr30EjpGqOqPYW2+zQjmEsLDBCHy/74PM2uCx12KtXODtIC
	znC5UsSN6YT4hne09GSiYOLiYAUD6MgkhFCCjyf3sSeM4heSHLsPp8ax0EvdYGrU7ZzWPl386r0
	JI9QCeDELMMdKKBxNp/MZt2FA8VqBq2lC1Y3n60bKOx9fpeT9GJQLRrpBYlVBFKzd3zqEBwzXYX
	mTo2oYfoc3rx3qj6ID9gMs4YhCWtkl4dYmbvnYr2UOJsw==
X-Received: by 2002:a05:620a:231a:20b0:914:e3dd:17e8 with SMTP id af79cd13be357-9153d938aa6mr1215099385a.8.1780324065151;
        Mon, 01 Jun 2026 07:27:45 -0700 (PDT)
X-Received: by 2002:a05:620a:231a:20b0:914:e3dd:17e8 with SMTP id
 af79cd13be357-9153d938aa6mr1215093485a.8.1780324064677; Mon, 01 Jun 2026
 07:27:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-4-645d2c8c75a7@qti.qualcomm.com>
 <178000689150.4557.11759359941436928903.b4-reply@b4> <df00e8d8-21ab-415f-815e-608eb7ab0967@oss.qualcomm.com>
 <23d2a824-e894-4c26-8bd1-02bbb8a7c6d1@linaro.org> <f7403443-3c0c-45d2-8235-46c70883a296@oss.qualcomm.com>
 <203e09db-ba37-4d75-b984-227298f55d80@linaro.org>
In-Reply-To: <203e09db-ba37-4d75-b984-227298f55d80@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 16:27:31 +0200
X-Gm-Features: AVHnY4LtL5VPWicujYWGAL868BWzmKvPSaREWLjiMCcMMmubijXxiTOJv64_r_I
Message-ID: <CAFEp6-3prh88NTK5U1HAARmQr203LVcbW4hoo_zuK4Qof4BAzg@mail.gmail.com>
Subject: Re: [PATCH 4/8] arm64: dts: qcom: shikra: Add CAMSS node
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>, bod@kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=H6nrBeYi c=1 sm=1 tr=0 ts=6a1d96e1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=6RP30FUjIQ2jcUxmk7IA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: r8kQb3I9y3zH6UxwALBB56kwJDEREw96
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE0NCBTYWx0ZWRfXw8lE2Jtg4qdk
 OCMe5fbvnuFuauqqJbUOqhhEn+unlmpzAkXvK6Z5F+/up67dR2kDeAsY9B4ENBQlqaWz3y+5yoQ
 usMzEAgwo9I5wBR/Tf/dcHWEM8nyq69DGy9fWd9AAEbqRXV9h8GNgWl6ffTp2Eb55KTOePlqil8
 9E6p4SCCxOKVdxUkKAD1aXevq6RrH1UUak5O9V9OJ1zFZPchntGwXYJFNw/CJ5FFWJgftd4Acm5
 lNXba2zacM+YN1s9x80LRPZSDAPXDOIOZDw5wD3AStRWO0KUCAnEFWiHea6gSQhoxUxnUsy/NBx
 Z251srDj/mbKMsgFIqJSP4rTxFq+K2UG+k1f/kkiRpv+36MLkhA+ni6oTmvqFR70b9v1N0NZO3v
 Zzkhx8kCAYqReNRQQddsNHJu2dSqN/fe9ayum2IHf0UoNAxPmmdEEbHelhlHCCCOAKbNgCAmfdP
 /tjlV9mtBBwWGbfixDA==
X-Proofpoint-GUID: r8kQb3I9y3zH6UxwALBB56kwJDEREw96
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010144
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63272-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linaro.org,nxp.com,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 17239620D87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 1, 2026 at 4:15=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 01/06/2026 07:42, Nihal Kumar Gupta wrote:
> > Here is the full IOMMU SID list for both platforms:
> > Agatti (QCM2290):
> > - 0x0400 0x00 =E2=80=94 VFE non-protected
> > - 0x0800 0x00 =E2=80=94 CDM non-protected
> > - 0x0820 0x00 =E2=80=94 OPE read non-protected
> > - 0x0840 0x00 =E2=80=94 OPE write non-protected
> >
> > Shikra:
> > - 0x0400 0x00 =E2=80=94 VFE non-protected
> > - 0x0600 0x00 =E2=80=94 CDM non-protected
> > - 0x0620 0x00 =E2=80=94 OPE read non-protected
> > - 0x0640 0x00 =E2=80=94 OPE write non-protected
>
> What this tells me is that the Agatti binding is incorrect for addition
> of OPE as a separate device.
>
> > Only VFE SID (0x0400) is shared between the two platforms.
>
> Both platforms have the same IOMMU list, its just that you are
> correcting a bug in Agatti's defintion.

Yes, Agatti is declaring too much if we want to go the camss multi-node way=
.

>
> Again only IFE SIDs should be included in CAMSS...
>
> > The current Shikra submission enumerates only the VFE SID.
>
> Great, this is what we want.
>
> I think for future submissions we need to be commenting, naming,
> something each IOMMU entry as we have a problem now in Agatti and a
> legacy problem - already - in VIDC as a result of misallocated IOMMU
> entries.
> > Should CDM and OPE each get a separate YAML binding like [1], or
> > should both be part of the CAMSS YAML binding? If part of CAMSS,
> > please confirm and we will add their SIDs in the DTS in the next revisi=
on.
> > [1]https://lore.kernel.org/all/20260508-camss-isp-ope-v3-9-
> > bb1055274603@oss.qualcomm.com/
>
> Yes I think CDM should be a standalone block and BTW use standard DMA
> APIs with its own IOMMU entry.

Interesting, so CDM should be a dedicated subnode as well, and not
part of the OPE?
Then, If we want to use it from OPE at some point we would need some
'cdm' phandle in OPE node.

Regards,
Loic

