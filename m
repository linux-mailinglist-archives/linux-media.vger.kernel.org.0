Return-Path: <linux-media+bounces-56885-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIlfF8+dwmm3fQQAu9opvQ
	(envelope-from <linux-media+bounces-56885-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 15:21:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CAF30A134
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 15:21:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 82DF13079CE6
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 14:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF543FBEA2;
	Tue, 24 Mar 2026 14:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G9UfWPEA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dwxE8r4O"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62E43F54BB
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 14:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774361359; cv=pass; b=PmWhVerq/f1/OLGxb83fTa+Yx9AepJSEpH7mfQqFgRfeZbW66H/+0BGsJ4B5IWkwYzISt1NIesbWuv+RRj4tmqB0igMjvWGJNodWBYSyNyY/ly6FSFo/DFD+Oubwyh+IHIABh/tIryvJlh35OYqGQJF9rZQ13sB4vd+cQSWknOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774361359; c=relaxed/simple;
	bh=jvZNTe2nCd8pPOKC1Kx36XtBG1TIVfqL0JPVPnRX8zk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rDvkbW16Mf2r/XW8O7TCkuFJZmbVHWK5i7qOcNWrvJbXpmCUAUqhSYQTbxNm6ZFFgwlB0cFSEB+dBj3Z1QqS3w5mzUSdeKZDP80S9hkjSk6xers3j3Zqorn/IszPtRDdxiK7+kTd3CY+u4kAoX7HU3hERsSVL9u23OEJJ2TWWmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G9UfWPEA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dwxE8r4O; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OC38c01817270
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 14:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zJv2J2eGtcRskzlH3URZsEalfKG9Mchz4K6/ldyoiTA=; b=G9UfWPEAOlbxNae5
	mNQz8HG0jaiVvtdbKHqQjkLcMoAN3wzSipj7JrzW3ZmYChx79diwve9ovROOPdsl
	I6T1lAgMPjzUzeIXSMvhPQ6jlr1xxYS7+EgZoCFCoaSlW95sYGSYajWZrSQ66466
	YzL3ewFGyIgBN7hXcWJ3aniDTLW5sqdkj5G2QHEXKu7LurYicc846o8eHASvo+dl
	lHrRGk2AacTUilsT8w9vSPJ5TiyzXxJE9NibLyd6mloZHRarxl0YtskL66AXdZwg
	eRVUnGqN10hc4lQe/C/EuZK3x3d3NMXAs/GSC5kqVSJ/gi/41KEAC/kWULHTlnCi
	2T49wQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3t9egfry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 14:09:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8954803bd74so5458976d6.0
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 07:09:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774361357; cv=none;
        d=google.com; s=arc-20240605;
        b=C4xHgHbYBESCcd6rWppvMov3naj1X/I49v034YEPm74MJo81oKvxtUsACCFMTODYZj
         MxKpxgmMQx2di5r+ZvvrId9mrnkh3YSIl6iN5L1Bx1rUdN0ia5MT7gV52aC1tXnEiqUN
         eMUm5SL301AioHy80MC9mY+s7SI34qNjYxtRwfgT6/WvKTclrXITB/OOb0/sP23nqWSi
         PkSGYHg/BRkgzS73UU6fBsrrLTTALrnMkcGbXlzrgRDzxxtQQzRPbUYeczNUnGub53MD
         azRqgZfrU3IuLxOoG6raOJSFpQS/oKzVCJvC8YY7f7klif21UINMCyJK6XiIicPlSf7Y
         cl5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zJv2J2eGtcRskzlH3URZsEalfKG9Mchz4K6/ldyoiTA=;
        fh=ZYvr/bIKJCLZtDUbwq52O6C2VvYmnuhNh+qT62WQUgc=;
        b=Js4R3D6ui1hf0GJuOxLy97V/bvs1HgRxLY51QuEAzlRB/NJnQFi8Pj+qXYrrZdoO9z
         gjvmSLYpU0XJp3CXvZ7K8DqRkG+wVy0RUvy09v/QEoPSGl8YofBIgBRIsv8dgVUMPRf8
         C2hJmFm5+26PvuSmTKC4JCDdI4z6dYVSYMKQqJvsk6K9459lpUttEyMPu97iEASeYk7q
         z0jmGCdTyloy7rH9vpW/BRfT/vYlr1KfHpC16RHsfnvydqUAkAcXqYiwfk309rgu3UcT
         +qR6q8YqrxaxO42A+YdghS+jqfB5r1+Xu7ZJZ6linlJniP3PHMu2CeQHtETeyzDzAHzs
         eldA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774361357; x=1774966157; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJv2J2eGtcRskzlH3URZsEalfKG9Mchz4K6/ldyoiTA=;
        b=dwxE8r4Oqry1xPnwPeRx8gbqi/OKlrvKYlu82lvlFiQ51B2tKl07V74wFk/n3O2T4N
         fNwSmalDvIvGe+ocdkGOnjQe0bsKfuEbNofV4IejEU1Gwm/imh4G8Np2dTcn2drWoWLQ
         dED3Pc/lYb5HkLr8WBm4dX2nccgDxnowz+AEAPCfW23o8vaAcPpt9+t5KpdTprh7P/i9
         d4yBx7WIAHkhym/yR7uf1E/5v39r4oxbPMmMaNomaQHLAKXilj5VaWb/iKXyrDZdHkV9
         a80CGVJ2iip56XCZoaFUajH1fHP7EfaD0BWRJbfBuGHvgUgMAGpiDNzb/g9korPoRwgg
         l0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774361357; x=1774966157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zJv2J2eGtcRskzlH3URZsEalfKG9Mchz4K6/ldyoiTA=;
        b=dNTTtsTrlivrMJu9tpLiy4V9LOMJ96gwOqXq8BDsbMQ/JFHXVTsoHirJek/IyXKe3y
         xj3ekpqjEesdBCn+OQu9raFkEHAh3+4N2sd6ZMkR82vt3T67jF0WY9MdcB86C19e7sjn
         k0qY5dTUYuND6SfEog79qLGlExxVm3z0FmIhhPn2D6IRMfJ1EB1Y+ulIhaY/EhloMuma
         1ri52ZHK6BEg2zTQEn+iwXwYckV6x1K7TKu+AEy7apKgrTse01fAoTXEQ3OtVfNyFx8w
         wv6BOMO70EBpd9Fxi2eRh4DrShyzaMAPhY7GERgc7MxoqrMg+2vfl2lkTi0wP8gZzAZ7
         nk+g==
X-Forwarded-Encrypted: i=1; AJvYcCWwdswrQmLf3euGzwBMSNaeMgrcJj4DcektqEXZPdd46SrXClcRXtXZZIFf3OyWIkQ1CFgTGyJdESOY0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuwwl11/YAbh0u72aH6DQYNuFFIqNotIQgk0NnQ41qsOrvSXi+
	LsOb0s1jEOpky4YuiF1ukWrRSSYGrL6xM3HbnPfwFrgdL3qOtFqbT1NNICCrPQFN3nQZJJo3fQ4
	+HeVBk925sn+CGoDEze0w/4bA0AoBIFua9ScMXyE/22sqOmGI+6s0rvgfC64O5gKhpn0h5VMjr+
	V7wjHiJcShfYWZYLDU2nve0Qy/Cj0H569bJjF80SvQ
X-Gm-Gg: ATEYQzycdyFWxrLZaPPByo0XDndN6PlsbV4q9J/fwsKR3B1ta2gnIPV2pM583EuQDuB
	Npk72czeLuu7fuSpW+XPjs2HV3LYPAVNEBCb1Z3/nuwm/yE9T1a00Y4lcWLRPWZfmjKHL+E5vSQ
	cei6E8wsRqS0EbGYgJkSBUYhl32b1NHxfTLv72BGFAMMio/nxXYzG3r9E9QsbpWuKf+a3EjD+tM
	y+6pqMgkMWGMmu+0Y7ENriDKWJE1SLmhKB05hE=
X-Received: by 2002:a05:6214:6006:b0:89c:bdd0:93f7 with SMTP id 6a1803df08f44-89cbdd09a32mr18677916d6.16.1774361356968;
        Tue, 24 Mar 2026 07:09:16 -0700 (PDT)
X-Received: by 2002:a05:6214:6006:b0:89c:bdd0:93f7 with SMTP id
 6a1803df08f44-89cbdd09a32mr18676906d6.16.1774361356210; Tue, 24 Mar 2026
 07:09:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319-camss_fix-v1-1-e69a3590500e@oss.qualcomm.com>
 <CAFEp6-2XrMkKzA4KAEkYF0v7XzVefFpUEG98VYa7wNuanbZ-Xw@mail.gmail.com>
 <02ecbd98-01dc-4e56-901b-41783c55d095@oss.qualcomm.com> <CAFEp6-39tUEBqX_FWLdohE2jenoj1ot18Gnhi4Aop9hukGoGQw@mail.gmail.com>
 <93624dae-71c0-45ac-9aca-7175d8771a32@oss.qualcomm.com>
In-Reply-To: <93624dae-71c0-45ac-9aca-7175d8771a32@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 15:09:04 +0100
X-Gm-Features: AaiRm525RnGx5ggMn1-xX2LaDHnmA2WZKOnZmzgoRag164H3rD3ipN0ibDgR6qI
Message-ID: <CAFEp6-35JQPpEy7AE0cx4Qv_y1H0rK08RfiYKA7ChxVQZX+oiQ@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: vfe: fix PIX subdev naming on VFE lite
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 3WEhVw_zIjWk9JQh0ljnEtBIaVc8v7ir
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDExMSBTYWx0ZWRfXymQRiYY3BqAk
 VTpwyX0XKqrlYv22WTsS8dACEkDZ0jbstrVZ7ysrO9vNHQyQAS64B6aEYM+AXx5B9rTI2cXybdc
 MQ37QD63Xm6JDE7n7svK1yaJvp/Z8G1IcadoA53PYyadS1I4qMSALovyBJ1HqPhASbAFIdft8SK
 1S3rKkfee7xBARwbBT+lircGpgkbDekAvijKs87rZf7XbieabAFa8U5vmmqBL6ksEF0uC2jGS6e
 UoR96W/uyp+Y04GtIMg0xL4DIWKmuL96JdmtyIfkZ/wjIB/XHj/tcRyzTH2D7P/wIcEaKTqUqQZ
 l7aLSiZQcXQBE5FxDbm4yJtcdP5THeWw/I3u8VgUjprt65vN6iJGvSf58EzvcKmzY1dL0xNiOfx
 alCiOYIpLxlfymS/ECQXgT1MYADOO+RG2teiXclg9ZgGRnFIMiFrT7+9cmhVT1OQjG073v6vU+D
 POGzDKoyQmv1K3cACTQ==
X-Authority-Analysis: v=2.4 cv=DdAaa/tW c=1 sm=1 tr=0 ts=69c29b0e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=wqd0a-MJmHnC_GMBQ_EA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 3WEhVw_zIjWk9JQh0ljnEtBIaVc8v7ir
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240111
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56885-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,quicinc.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: 95CAF30A134
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 2:10=E2=80=AFPM Wenmeng Liu
<wenmeng.liu@oss.qualcomm.com> wrote:
>
>
>
> On 3/23/2026 5:55 PM, Loic Poulain wrote:
> > On Mon, Mar 23, 2026 at 3:13=E2=80=AFAM Wenmeng Liu
> > <wenmeng.liu@oss.qualcomm.com> wrote:
> >>
> >>
> >>
> >> On 3/19/2026 10:44 PM, Loic Poulain wrote:
> >>> On Thu, Mar 19, 2026 at 10:11=E2=80=AFAM Wenmeng Liu
> >>> <wenmeng.liu@oss.qualcomm.com> wrote:
> >>>>
> >>>> VFE lite hardware does not provide a functional PIX path, but after
> >>>> the per sub-device type resource changes the PIX subdev name is stil=
l
> >>>> assigned unconditionally.
> >>>>
> >>>> Only assign the PIX subdev name on non-lite VFE variants to avoid
> >>>> exposing a misleading device name.
> >>>>
> >>>> Fixes: ae44829a4a97 ("media: qcom: camss: Add per sub-device type re=
sources")
> >>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> >>>> ---
> >>>>    drivers/media/platform/qcom/camss/camss-vfe.c | 2 +-
> >>>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers=
/media/platform/qcom/camss/camss-vfe.c
> >>>> index 5baf0e3d4bc461df28d8dcf97a98dec04fa17ceb..2ee4f9ae0ab50e22f916=
736f1d1664767bdb6a36 100644
> >>>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> >>>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> >>>> @@ -2053,7 +2053,7 @@ int msm_vfe_register_entities(struct vfe_devic=
e *vfe,
> >>>>                   v4l2_subdev_init(sd, &vfe_v4l2_ops);
> >>>>                   sd->internal_ops =3D &vfe_v4l2_internal_ops;
> >>>>                   sd->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> >>>> -               if (i =3D=3D VFE_LINE_PIX)
> >>>> +               if (i =3D=3D VFE_LINE_PIX && vfe->res->is_lite =3D=
=3D false)
> >>>>                           snprintf(sd->name, ARRAY_SIZE(sd->name), "=
%s%d_%s",
> >>>>                                    MSM_VFE_NAME, vfe->id, "pix");
> >>>
> >>> So the PIX path will be called RDI? Doesn=E2=80=99t that seem mislead=
ing as well?
> >> when i =3D=3D VFE_LINE_PIX and vfe->res->is_lite =3D=3D false then vfe=
 name is
> >> pix, not rdi.
> >
> > I mean when is_lite=3D=3Dtrue, we're going to name the PIX(lite) path R=
DI,
> > whereas it's not a raw dump interface, I guess pix-lite includes minima=
l
> > processing engine.
>
> For VFE Lite, only RDI paths are supported. There is no PIX output.

Ah ok, understood, this is RDI3. At some point we should clean up the
code to avoid relying on statically defined RDI/PIX indices.

Regards,
Loic

