Return-Path: <linux-media+bounces-54830-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +B41NmMvq2n6aQEAu9opvQ
	(envelope-from <linux-media+bounces-54830-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 20:47:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EBC22733A
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 20:47:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A911330580B9
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 19:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 748453321D8;
	Fri,  6 Mar 2026 19:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="huoB6ej6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ukz6OMlj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2CF33ADAC
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 19:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772826459; cv=pass; b=P68lBZip1hHa6oPFlLR6Kv6YXAhOdTxC636/whwcMF+I46UfoyEpEGJGBsmIICHyfkQi6u0LJ6kxsdw6xKmuCJTUrNa+IhjGwRcc5mkbSaDLNbIMrc2QOHMdotdD2aIqokTIZxs/9Ms+UacAcRmYQN1vgdo/RpKPppRSoS/HYrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772826459; c=relaxed/simple;
	bh=VegoySy3Hday4UDO63qyf6nrV/TBBf0Vz+6T1SzUDlw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C3U2/DwtvN3IaYECp7xxo9nrIZ290arhmEq/pVdL0UotaoJvP1b+cjBAftRV1Wy2lmfLYFt9Uq3RN8d0ykbPDhjz2f5ITkwcf2GKHwhGqr/G/CVbBD3O2DzP5Fo2YV5VxbtK8EImM5j5zQCc1xJvjQBxhIp15iSwxlemZHNKl6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=huoB6ej6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ukz6OMlj; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H1eMZ238582
	for <linux-media@vger.kernel.org>; Fri, 6 Mar 2026 19:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z5nTFkvWRlBwa8CwoxYQdnOTwfVARN5qGHvtojP0Pu8=; b=huoB6ej6u3TIeCt2
	FhxCRCwxb26B1R6f4DVdQIeAvzD9eUSVU0fhtO49kynPlyu5mfwB0UM7YPuC4vOl
	TdKzQ8xnijDEqvXX9YWvC82MXR9vKJGHNa1+n8CBd41Gcn3Tde9yNDCTonPaZvqt
	G+JQEmNAHyzU+KVYo+1Ygh2Ol3Gc2Cr+5l6ohFgM/q/L1OoUGaITx3LaJwWcTa0B
	WWi0+bYGnxvMaz60QrdEklAWWFN9wnkDUODP4b/K0pKAK92Wf/aTpNdfcFVNzA91
	sTqCphHFtMh9O7oKDv2++OHTSlBdQrwlfZT9BEUiEEj26uEUvKG31HFYYOdbt5nF
	441f8Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv98j00h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 19:47:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb0595def4so6561072485a.0
        for <linux-media@vger.kernel.org>; Fri, 06 Mar 2026 11:47:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772826457; cv=none;
        d=google.com; s=arc-20240605;
        b=N5c+gRkKjLPl2T+CKuhewzdd4hNImz2kLiq0XQfgFkEoGD6A0Azb40B1+sssbzpBkq
         KHyAKGL8QVYi4GT54m8M9WARaEo70v9yLABuuFkLokagRgBRCa9oOiD5AaL9HouVDgZJ
         waGBuBE5VNiv6OwL9NsfWLaUsn2OaR7uJj9WB4PsMLZIBQnFbeXuJKtnKzfzJztjdWJx
         cWH1rtFbaGh2uWQcPdx+JEHnXdcrfBvsuvL0D/TZv7q1OENmOPuaPyztLY2ezcGWNjXK
         AXAKjKdLz1prACOVoNh0xY67r1S8DOyljnmOYMkjxzFYa+54friNu7ScK85M2M40uxWb
         /7SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z5nTFkvWRlBwa8CwoxYQdnOTwfVARN5qGHvtojP0Pu8=;
        fh=pmlLAUT7JMdFctG7bxsMZaSCC2FgGmZ6rNLVbYkcq0s=;
        b=HNY48ZR6F4WrCQgZA9oeMsmwkp/GdlbIYoRQZivLQgeUIYeJ5DAtrT5R26dJUFgL/i
         C7frm1sBUi0UVcT0vHlJfXKlQZNFd+TAkp/lv8pWwfDW+SaHDWexxuy0KDAYEcySmf++
         aF2OthS4Tdh1hHVAH5N/51FaHCaUTZ2QOfSJBcRVSgRjJ2KRf1vU2XLc9Pu+JdmXFowl
         Q5QM6b9KvtJrWvqDD6EF/sWmYL7TblT2pjw9Dp+T7azWB5PfBU6BaupwcKxYW3d5T07C
         lvr6oNlN3772x55WTQ5zyDg/IxeEh47aElB/NzwyjBCWHtbjbKMQ9OsulSPwvNJ4YOCA
         5Dsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772826457; x=1773431257; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5nTFkvWRlBwa8CwoxYQdnOTwfVARN5qGHvtojP0Pu8=;
        b=Ukz6OMljWUhW8wpH5XCBURclA9y+zqe0EUe+//whH8de9dOSWsvmHJKf4FxKSNbCrs
         34xmXNsfu4MoryB9Lk7YFhhKU/5fo3Mv5tAHQB1EY4S24JTcPTnfu7rVvJm8O9mrSJt9
         bIPIQNdzacUAUhin2TP/NomvSJSo6RZNzIrvDrwlBi8Hsaf+7QRlZdFiTE7FmTSk3UuA
         7Xkh2rmRneuPQ20VEZg80fh676PzOQCnTPDRwHhUEDrNZZS0KaOuboRM5ibWY000jRAO
         bog3uSorvVerEMqmzA4E6A/rpq3LxXXx0mKlqAYAD3S8NDFQDw59KYSSqiMPMTMf7f1J
         Pxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772826457; x=1773431257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z5nTFkvWRlBwa8CwoxYQdnOTwfVARN5qGHvtojP0Pu8=;
        b=CNajHochBctTfu3KeHgKZ1XVQfKDnnn51X4icgRH7y4nLtaHPMHdLhBN32rXFmr++m
         O9Jf9zvvqQ4Z7W0mDon10owYHIZbXQ1f9ux1VhdfU55V9dCv3VU2tFS0UhqNhzB8Zkcg
         CvBwzoAPLn2YQJUUC88SUwFiGuw1V5AaEv834njy2aA16dNik+sb+59cBagB0Jbez9kL
         g/yxTGlqEGQCud0ShLwc0cAGutrytfTDEVCrGOdLEcqrGKHZsX9i2arfUEemZmaHzWsK
         m2tO4Z4nebGeyDU5vxhQI2ZJIQTQ0wrNuH2xHT3qBH6HrTF0npKTUzZD3yG3HS3zz30Y
         85ew==
X-Forwarded-Encrypted: i=1; AJvYcCU4Zo8HmvCj17/fJ9ABedN3rI7ysDTdHku3uwQmCaExF+fX95Xyp6oC8zb1NFnK8NIlsLmOw195+927ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzZmiBqNJLvpwin/2foBhxATazWKl0wE/0v1NetgwXWGInyfK6
	oieV0vThAIS68XsZu22OArJose7S8I6j8sLpQ3VCeR+9CNY/KNEEiqF7is9vZ9YADH+GXrvhQCg
	27sSydGWiIC68VOqzqxmFobzpNbHvcAEJBY1eklmAMP/0aB/8bTSu3WvZrLH5VDscjd7wO4H2UJ
	QoKxcArG7RCj4MBSY2mDpsQVvcyCzfJaEt7jk3trLH
X-Gm-Gg: ATEYQzxUjEcQSwbm3Tcdli9o6MTY6Rjj4Hs7F65/z8j/jR4PWE+Y5LZEOdKvoFn7MhQ
	nYDQ+Dc/Fc3SMziVFv/0wZpaH40PYn+nqK419Br+kc1XogrpPUY5bbKZU+kYyyfZzTOWakqS52r
	yF231jTadOkqtiL7hQRhCqp05iqNPCzFZWjtdWvfrXeAIHEcvbmkpp2SRVlxHnh+VTBtBoyh0lu
	/tJ1+mLd65Oo3UaA+ewM6iQRQQCTgVfgDluV5I=
X-Received: by 2002:a05:620a:4408:b0:8c9:eee0:db94 with SMTP id af79cd13be357-8cd634f4eddmr839693485a.31.1772826457166;
        Fri, 06 Mar 2026 11:47:37 -0800 (PST)
X-Received: by 2002:a05:620a:4408:b0:8c9:eee0:db94 with SMTP id
 af79cd13be357-8cd634f4eddmr839691285a.31.1772826456719; Fri, 06 Mar 2026
 11:47:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306140220.1512341-1-loic.poulain@oss.qualcomm.com>
 <20260306140220.1512341-4-loic.poulain@oss.qualcomm.com> <85680596-7e3e-46ff-b361-d6a736558504@linaro.org>
In-Reply-To: <85680596-7e3e-46ff-b361-d6a736558504@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 20:47:24 +0100
X-Gm-Features: AaiRm53ut2_mclrpxRFtW6RBVIDPsI-FBAB2CGdKeBtxWDydNVaJmN8fN3RFS3c
Message-ID: <CAFEp6-2hXCcRoVNzFCJW=mFnQFo2w3Rnxfu+-fH1UzB7iTnmJA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] media: qcom: camss: csid-340: Enable PIX interface routing
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: vladimir.zapolskiy@linaro.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mchehab@kernel.org,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: b62nBICdvCo8SojVlQQhAByvpjlZwcya
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE4NiBTYWx0ZWRfXwFILXEDZoDCd
 9N2ps5V5EiWTUwv7+aYHtjiykk4qvJJPmZ3LkW4U6KDBs/yxwi0ZOKc6rdGhRbz+N7XNStX77Ed
 YpBeeleaTjAfwYKRH+OCFtgCj1U1GfygD2OVntfn7AOM96fBI3oHZfiVSOMnL9fgW1UE8ierxA7
 Kg+sapGSQEpSSKNnGxIPlHdryN/vEt1DO109+vfP5+jlCMw7Mmif+tXqLrNoitkRqHyf3NNJZk2
 fB1vX74G9n1LGOndSyTHJyT6xqMhbQKT2NoqtLDZHgR7+YhHFPncXcBkI010WTgUqvX2adJq/0A
 OkL6JXlS/Ud+yaFtzupcHdtRUufFOLArfhKlxhQpN2EiabgtMdpjtosBF37K6GKmF4q5V0b8jPM
 zSamuzprtiOqDR9mqd8neYxyw9/NUE1Zf9nlHHmNAmA1rPIPSgUsLKoHxsDn3o5v82XobLvU774
 g04T/QryuZ42NJtKj9g==
X-Authority-Analysis: v=2.4 cv=LbcxKzfi c=1 sm=1 tr=0 ts=69ab2f59 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8 a=vIXTMX2UoKCX194zK-oA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: b62nBICdvCo8SojVlQQhAByvpjlZwcya
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060186
X-Rspamd-Queue-Id: 47EBC22733A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54830-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.956];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Action: no action

On Fri, Mar 6, 2026 at 6:54=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 06/03/2026 14:02, Loic Poulain wrote:
> > +     struct v4l2_mbus_framefmt *input_format =3D &csid->fmt[MSM_CSID_P=
ADS_NUM - 1];
>
> There must be a better way to identify the index than a hard-coded
> assumption like this.

For RDIs and in other driver we use: csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc]
So would that be acceptable for PiX:
csid->fmt[MSM_CSID_PAD_FIRST_SRC + CSID_PIX_SRC_STREAMS]

> The params structure.

?

Regards,
Loic

