Return-Path: <linux-media+bounces-58683-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6O26GUJM3WlYcAkAu9opvQ
	(envelope-from <linux-media+bounces-58683-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 22:04:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A41193F2FD8
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 22:04:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BB21302E418
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 20:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6286B366573;
	Mon, 13 Apr 2026 20:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UedR2vFA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eCjkWYfw"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3D9221FBD
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 20:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776110649; cv=pass; b=azNKoZi/20rZyeJrAX1owt5oC2cM9LR4O4GWu4W4fQpf2vxi/5PW9C/W6Q0jt5EGn9BbfAJZSiwx28tlUowSbYV9aiCIu0ob/xzNFRurUlBdN/e2EulwVhP+qRTVCABLi+bT8NJ69fg4TsKwdPs78R2jtataLk7ajHm929AC3Zc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776110649; c=relaxed/simple;
	bh=n4MMUPRdpyd83+d3+MLhE1JPLmZEMIKfYFaImn1TIPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H7oeWf8ubmiFyWx9HlJTvdRrkv6KPP2PXs8UHTHU/JWYzl1dUoIj2p0AjAw+RRLKTesM3qfsGpgcwanwh/kvHr2wi27LSU0i01sin2e+eNKTBKk5kUMRyh9yp10fTiFBnLZ+v3yCl0ehPWAYkkz9TF8Q/6rgFEsgWxPbAwouyqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UedR2vFA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eCjkWYfw; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DF5NSX3750466
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 20:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	huhLAADrb+30kVAlXbMrHoo6hf68ihQonVvKPcWPUEs=; b=UedR2vFA4Fm2JSVp
	B3JzRIDXjlzK/eikstVd7e8AIdkSA+T6qmz1AFJ5hNnWjFho+jmmLU22p2OuLG3z
	dWyoyyAS68hgnppMHopi5dGEwsICpKLcEcAMETlvLQFW4/MvH/PFbg8byxYmvzOP
	pZTxrvD7lZ6BEpYOdD+HMO9zZVvKRop0xNNgyIIMhAVZMgVUIG+UWnf4Vc+p8Yzk
	dL86QoP4JTXPbDN8i5x8FtzmnsdqncdYk9XZAgDssUK12F9J1TwBmlPT8cqWPiUw
	fWI/ibuf94Hi/jazs4G8dDyZaRYcVHXs5+ypJz9cHUQIjltZcb2Pbb/+C7I+qtP6
	PyFCIg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh2tu92q3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 20:04:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d5d1c2289so63149741cf.2
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 13:04:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776110646; cv=none;
        d=google.com; s=arc-20240605;
        b=aHKLguQk+CQv0FMBzL2qP61B8jBj4K+mAyug+6OYPq0ss/uQIW0vJRRCOCOP0310tB
         lXqjhIAKUvM/uGt3nfo9ITLLlFFZxSJY4k1f/GWFzVoOiHWX9e5GTOnRr9aHMVrmTht6
         vsXbriTI3IRWFLsHfuRB0ZTZ62xljovR0cza2rIEDIwIiBnbWQNVpEXcI2tj7/VdqhpZ
         ElIjtkrgf/7bRlW5Frhnm4lhPtbbGs8hDs0IRt9aYHYS9LOZh3AdjFDKg072uHMps0hA
         7f1wZOUW9lFWmOMj+HSV0PSrpEPQ5chbJSqgTC4r7x7D4XXpBWrV3kdPCjI+mRLcmddO
         K5jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=huhLAADrb+30kVAlXbMrHoo6hf68ihQonVvKPcWPUEs=;
        fh=F362HeAxYATdxtts7pqRaemlvQ/D4LebHV562J63IDw=;
        b=YZAVHTytg8VpKWZKYBA0Rw7NMPbXqASFy+33m6XYAZxqtTCZAI6RjlMeo8hGIBUzQx
         A/2leezc3oAs45p/MFuQK+8shhBFwwk1jiFa4SKSEb2Qqg3x+P2DR3k6fv9MAz6kP2OS
         SF2LljwL1jEZaWwCnrrXUbGruDE6T3uKXgcaJmlpwVCwVTIZ36o60dFWV8kjpQ1drrwp
         W0AVWoV9x8U3oatgoO+byyybV/oYwQ2FvdaH/+p4+bMqOtNgxtzZAy2nh5odZ2EwwvYU
         zK/9kXJgmif+bJKnNrUWDP6zHRwbPA9Hez5A3rTai3JtcPWwllTKVXpN6XqvnObanDlM
         0+nA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776110646; x=1776715446; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=huhLAADrb+30kVAlXbMrHoo6hf68ihQonVvKPcWPUEs=;
        b=eCjkWYfwffa0ET47dmNp80I4m5a4Hpsdjl6ZwhRZu5NIGI3Tl0/IXH9+MM+Nb/2nxv
         7aCADQGb5zutXzCHMTkzpoUGiwJlgP/UOVIO/X5X/fUE0paXvjyPf1PFHUnOrCRZornf
         YvuKSNppUnxJZHCNGo6RP9JXucVdZm7UFSeHeO0MXN5BmzOXpxYWIRI9o0rRBDGVxGpl
         glJOKRUpwaluXgS7uZWJTdyXpY2RXsSCt0DXnou146STCZIB5svEYTcguDPXlUajV7NS
         vH01PoS/sg/ikguk47W1Mk3OxgRqWyvKIDgW1jl3qzGX291btnyyzLNaD5EANyQnukHJ
         MtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776110646; x=1776715446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=huhLAADrb+30kVAlXbMrHoo6hf68ihQonVvKPcWPUEs=;
        b=C0eTlEyWJfPak2+YssjkTm8fDjXB0zs4VyU3tDj2ZJ3HFid8v+aNCPaMb/U6PZltpv
         mqT9yugCocQtBYCxISw0II3US13OjyYerLo08A8AT3pYqcQz65p2oqVx0K2JmGUSFu4Q
         MpPav7O+WeMg2j9+BRxSnKhGymWVyfflz5ibtFlmX2hmWHhLpo/kVU2rkLKrej8HhIBB
         1DxOZXf/rrNG59w9DsSpPI0WpQLeDwaFwO/ffbnQyulcQ6d0dDE4fzP71Pw3cNIWAnYE
         IrHKBc+1Xn4Q36ITeePyzzqcH+hivo5jKOAmCq6EoBuM0PK8cBOSg1bnzb9OGJ/cFtqK
         nGmg==
X-Gm-Message-State: AOJu0Yxt4LX9fe7LqK7g53CT8nxJlsWBvq5f/dqj/X4hc3uyjKx7w9WS
	Bv8JjgUL4EmzCjpdQU/clEQdNoCAB2XWfvwY8qsMUkVeiOI3groRzo8w6bhv18Xlu8pPmo8SGV2
	P5kNl34CDnwNbZWbbGQ+3yEBDT4HvQURuyWRrIsvzR18FOw7OxG1BnTZf1DMnmv5i/lCzIxB47J
	Qpo+S1oaS9arSAeH/1LlHKL27dgXvESANwqQKI9GPr
X-Gm-Gg: AeBDiesus2bf3ARDfWzf+mrHlTFI0nvS8Imz5G7DnAG6Jv3E5JwJvCnsKCtiYX8cPZq
	XJkNIt4eyCOsBNAEGOKDq1mpg43AdbjaC/FpqBXd2CTU3mnT57fLWSzBpxSP+VzgLofpd89nEC1
	Ay6xsAELEoog2UMKPhO5+U94ZtNz1GRNEMbriWyfJxGI8sjxLsVSW0EieW+7fVpk+oumpkojswC
	iB0r3alZrkiOPxPAOib6ZvIWXA1gSfRuMYYJ2VX
X-Received: by 2002:a05:620a:711a:b0:8cf:e32e:89fb with SMTP id af79cd13be357-8ddcd9ebde0mr2179141385a.21.1776110645721;
        Mon, 13 Apr 2026 13:04:05 -0700 (PDT)
X-Received: by 2002:a05:620a:711a:b0:8cf:e32e:89fb with SMTP id
 af79cd13be357-8ddcd9ebde0mr2179127885a.21.1776110644697; Mon, 13 Apr 2026
 13:04:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0f95419b-93c1-4c4f-873b-43bd2a9853f7@kernel.org>
In-Reply-To: <0f95419b-93c1-4c4f-873b-43bd2a9853f7@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 22:03:52 +0200
X-Gm-Features: AQROBzAFa0C0CTlm5yJ1-B_JTtsCkFSXFznh6VLzLrGRAcyDx2TThCGGAe_fmJM
Message-ID: <CAFEp6-0_BdVDqB-re4AghOrRpwZ6H0ZQ9Vw9hv-hgZ+4Dz9HkQ@mail.gmail.com>
Subject: Re: [ANNv4] Media Summit on May 26th in Nice, France
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sean Young <sean@mess.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Tomasz Figa <tfiga@chromium.org>, Steve Cho <stevecho@chromium.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Hans de Goede <hansg@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Brandon Brnich <b-brnich@ti.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>,
        Michael Riesch <michael.riesch@collabora.com>,
        Devarsh Thakkar <devarsht@ti.com>,
        Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
        Jackson Lee <jackson.lee@chipsnmedia.com>,
        Jai Luthra <jai.luthra@ideasonboard.com>,
        Mehdi Djait <mehdi.djait@linux.intel.com>,
        "Padhi, Beleswar" <b-padhi@ti.com>,
        "Donadkar, Rishikesh" <r-donadkar@ti.com>,
        Rouven Czerwinski <rouven.czerwinski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: _heZggjUqfpST9dTnZYSUzSC0XaHChif
X-Proofpoint-GUID: _heZggjUqfpST9dTnZYSUzSC0XaHChif
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE5NyBTYWx0ZWRfX+ZZ+hMrxJLSr
 OsyYfAC+v1TnITUHA5mJ7RZ9tQwjDweZVbxdsl6kqMSvw668C2qVbPbz/vTSRBI+ZDviRAtb45P
 AiaC+CCEWKinZq6BvGkRjAKVM2UJx3DtViTOITqafi8RhFsb99Xoq+rhE/qChmfeRfVdz/ZYSK9
 GvotZdF8plBgCd8YKgEBSc2Me3uPiD4y94N309mXyPLxs4EEj7vn2TvVjZpFb0aWW1i+Ujs9+xX
 66DUKDlTwsdOep/2D8e9y9DWuEOG6DKC0aq45MlI6kmrufUkjISA9kebL62lDXcpMiJu62dcnVl
 DEupkUZbGkD9rBA6ohJpCjLbfR3NwSTop6FVfZ6aTFKwfm7Ah5dldT3MQHotH56u+KbesLaI5ky
 hNFmBd1NZeaP0mnQH0zVqct+0pZfuXgx0ten7qUIFlrcNFbcZI4h/QBrUukqmwglstzUg+nJZD3
 eqrHLuapCJyY3yqMo8Q==
X-Authority-Analysis: v=2.4 cv=RJ+D2Yi+ c=1 sm=1 tr=0 ts=69dd4c36 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=8s3bVdB6AAAA:8 a=VwnfekaSAAAA:8 a=VwQbUJbxAAAA:8
 a=WN6_cwnCAAAA:8 a=QyXUC8HyAAAA:8 a=P1BnusSwAAAA:8 a=sozttTNsAAAA:8
 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8 a=8b9GpE9nAAAA:8 a=EUspDBNiAAAA:8
 a=cm27Pg_UAAAA:8 a=PssDBZGIAAAA:8 a=RF00TdSWAAAA:8 a=PKQVhnHRhMDOLcClMiMA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=mX_46NTfp5VFrLZRzBmZ:22
 a=eAomlcYGng2R2mZ923rV:22 a=ndfOWLLM0rR49n6Yv1rF:22 a=D0XLA9XvdZm18NrgonBM:22
 a=cvBusfyB2V15izCimMoJ:22 a=AbAUZ8qAyYyZVLSsDulk:22 a=T3LWEMljR5ZiDmsYVIUa:22
 a=HJRSn2hXXqGixlvEXVkw:22 a=_nx8FpPT0le-2JWwMI5O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130197
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58683-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A41193F2FD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans,

I would be happy to discuss this if a slot is available:

Title: Generic V4L2 ISP M2M framework
Presenter: Loic Poulain
Time estimate: ~20min
Description: During early development of a Qualcomm Offline Image
Processing Engine (OPE), we relied on the V4L2 memory=E2=80=91to=E2=80=91me=
mory
(v4l2=E2=80=91m2m) framework, which is widely used and provides solid suppo=
rt
for buffer management and scheduling. However, applying it to an ISP
use case exposes limitations: ISP engines often require a richer media
graph, with multiple pads and metadata flows, similar to inline ISP
pipelines (params, stats, outputs). This talk proposes discussing the
need for and design of a common V4L2 ISP M2M framework to factor out
shared functionality across drivers, particularly around buffer/queue
management and job scheduling.

Regards,
Loic


On Sun, Apr 12, 2026 at 12:25=E2=80=AFPM Hans Verkuil <hverkuil+cisco@kerne=
l.org> wrote:
>
> (Please pass this on to anyone you think might be interested in this!)
>
> Hi all,
>
> This is the fourth version of this announcement, updating the list of att=
endees
> and the tentative agenda at the end: please let me know if you see mistak=
es.
> Note that there is still time for one or two other topics. Also please ch=
eck
> the agenda if you need more (or perhaps less) time for your topic.
>
> This year's Media Summit will be held on Tuesday May 26th the day before =
the
> Embedded Recipes Conference in Nice, France:
>
> https://embedded-recipes.org/2026/
>
> The Media Summit will be held at Hotel Campanile and in the same meeting =
room
> as last year (Nikaia):
>
> https://nice-aeroport.campanile.com/en-us/
>
> It is close to the Airport and to the Embedded Recipes venue.
>
> The meeting room can hold up to 30 people and I will provide video confer=
encing support,
> just like last year. The location and the meeting room was quite nice las=
t year, so
> I saw no need to change it.
>
> That said, in-person participation is very much preferred. This yearly su=
mmit is meant
> for active media developers to meet face-to-face and to discuss media sub=
system issues.
>
> And it is also a good opportunity to talk to each other during the Embedd=
ed Recipes
> conference to discuss topics in a smaller group. But if you are an active=
 media developer
> and are really not able to attend in person, then remote participation is=
 an option.
>
> If you want to attend the meeting (either in person or remote), then send=
 an email to me
> directly. The deadline for in-person attendance is May 14 as the hotel ne=
eds to know the
> final number of attendees by then.
>
> There is no registration fee, the meeting room is sponsored by Cisco and =
Collabora, and
> the lunch is sponsored by Ideas on Board! Many thanks to our sponsors, it=
's very much
> appreciated.
>
> If you have a topic that you want to discuss, just 'Reply All' to this an=
nouncement
> and give the topic title, a short description and a guesstimate of the ti=
me you need
> for your topic.
>
> See last year's Media Summit Report as an example of what to expect:
>
> https://lore.kernel.org/linux-media/21769183-ca57-4f8f-818a-6a1ad089298d@=
jjverkuil.nl/
>
> Regards,
>
>         Hans
>
> PS: Be aware that May 24 and 25 are public holidays in France. So many sh=
ops may be
> closed those days.
>
> In-person attendees:
> Sakari Ailus <sakari.ailus@linux.intel.com>
> Kieran Bingham <kieran.bingham@ideasonboard.com>
> Brandon Brnich <b-brnich@ti.com>
> Rouven Czerwinski <rouven.czerwinski@linaro.org>
> Mehdi Djait <mehdi.djait@linux.intel.com>
> Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Marco Felsch <m.felsch@pengutronix.de>
> Paul Kocialkowski <paulk@sys-base.io>
> Jai Luthra <jai.luthra@ideasonboard.com>
> Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> Beleswar Padhi <b-padhi@ti.com>
> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Loic Poulain <loic.poulain@oss.qualcomm.com>
> Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> Ricardo Ribalda <ribalda@chromium.org>
> Michael Riesch <michael.riesch@collabora.com>
> Devarsh Thakkar <devarsht@ti.com>
> Michael Tretter <m.tretter@pengutronix.de>
> Hans Verkuil <hverkuil@kernel.org>
>
> Remote attendees:
> Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> Rishikesh Donadkar <r-donadkar@ti.com>
> Jackson Lee <jackson.lee@chipsnmedia.com>
> Dave Stevenson <dave.stevenson@raspberrypi.com> (tentative)
>
>
> Agenda (tentative):
>
> 8:45-9:20: Arrive, settle in
>
> 9:20-9:30: Short intro (Hans Verkuil)
>
> 9:30-9:45: Status of ISP support in V4L2
>         Presenter: Laurent Pinchart
>         Description: Summary of ISP-related development in V4L2 since the=
 last
>         Linux Media Summit. This includes a brief overview of technical
>         developments, and a summary of the efforts to engage with vendors=
.
>
> 9:45-10:45: V4L2 Stateless Video Encoding uAPI Progress Update
>         Presenter: Paul Kocialkowski
>         Description: An update on the ongonig work to support stateless c=
odecs in V4L2.
>         Some of the remaining open topics will be presented and discussed=
.
>
> 10:45-11:00: break
>
> 11:00-11:30: Vulkan Video Codecs
>         Presenter: Nicolas Dufresne
>         Description: Vulkan video codecs: what are the viable options for=
 Linux Media
>         and what is in preparation outside of our subsystem. The second a=
spect is
>         informative as these discussions don't seem to lean toward our su=
bsystem as the
>         foundation. But I think it's rather useful for everyone to unders=
tand why and
>         what is included.
>
> 11:30-12:00: Protected Video playback on i.MX8MQ
>         Presenter: Rouven Czerwinski
>         Description: Introduction to protected video playback
>         on i.MX8MQ and missing bits for linux-media & protected heap inte=
roperability.
>
> 12:00-13:30: Lunch
>
> 13:30-14:00: HDCP support for HDMI receivers
>         Presenter: Hans Verkuil
>         Description: I have been working on adding HDCP support for HDMI =
receivers.
>         Specifically the HDCP negotiation between sources and sinks.
>
> 14:00-14:30: AI patches
>         Presenter: Sakari Ailus
>         Description: What is our policy w.r.t. AI generated patches?
>
> 14:30-15:00 Overview of Media CI: where do pipelines run?
>         Presenter: Ricardo Ribalda
>         Description: How are jobs in pipelines assigned? How does the inf=
rastructure
>         for Media CI work? Are there things that can be tweaked to make i=
t more
>         reliable?
>
> 15:00-15:15: Break
>
> 15:15-16:15: Discussion of the media subsystem development process
>         Presenter: Hans Verkuil
>         Description: Review of the multi-committer model: current status =
and next steps.
>         Are there any bottlenecks, any ideas for improvements, w.r.t. the=
 development process?
>
> As you can see, there is still some available time for other topics.

