Return-Path: <linux-media+bounces-53383-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GI6DJMgn2lcZAQAu9opvQ
	(envelope-from <linux-media+bounces-53383-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 17:17:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C69519A65C
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 17:17:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7DBDE30BE2A8
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 15:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE7C3D9051;
	Wed, 25 Feb 2026 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A8vpJAog";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="erBLMYyD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61CE3D903D
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 15:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772034233; cv=pass; b=V4cZlTSr1b33s6DinIbgqxMeveHB/htMGZXTurhrNm96Dt2eIwCGC7Tp+yFFg+7RbPQonnP4ovm5cIaJMS9BxmeiFLM9Ebx2kfuOywaTIKyTw83jajIRknmuQXIUNGzOZhQFHIu5X0Ezl6zmQda/Nr7oWFVGdrm5fN5Fk5nQ3vE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772034233; c=relaxed/simple;
	bh=uCAPhy/gMCxOqNA6jmJXG0gi9Huxaf2pTtLsI6AZq1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ElM/AMBGwKje0p2xprgp69Mp356L/PtrR2IajQ9ia3D8p6oRfn/peGwQJgG2/NknQsVZA67rnUKuo/EUqTC7jfVi6QrubTzdblJqsKPrnDj0uwDFJDDk58Xcw3njtvV/SkuTFLu1VX2GizYJHh/8ytbW/d8oBoo0Yxl4UP678rI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A8vpJAog; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=erBLMYyD; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9Spwg229643
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 15:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+JvHDDbTYtABDDcCUqp4DyZW+RBdiQ43AT9le7Hg1qU=; b=A8vpJAoggljBTw0Y
	OzyuAbK8V6iqX/g9KfS2ptM8BQBVu5f4dMaN/23UTZR0XQfD39Sd9rQy4wMlVWnY
	zRgIHl2xAcRKMoOyE0uwhyajlhbwScEk8YJqquFllK2aMqod3QG1mMb5KKLdC5ql
	ZePzOiXm8LnAUbQ6rSyjSJoSv8mz/KJanTMdxyfEWVzqjUFEytpmAPRCJH1c06fo
	n5zv1yOFw6DSqZLqnEDgO4Fu/cfuDar1N8aTx+EuKfdpOHDvKiirFYwXBa7MVJqx
	VjIjmHlP5A9giMAaNTlTDEQzbeYMOGXMo4oRo/7talrfGfT2+UiJBgPR2eobjhAv
	I9vmNA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg37us3w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 15:43:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-506b3fb32a1so647966431cf.0
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 07:43:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772034230; cv=none;
        d=google.com; s=arc-20240605;
        b=EPoVBKqYEcwBbqCSlocO/WKENjbcXc/GYzCAFmeRItRGU+AuLFGCTq+ilzU+IapluD
         mgYby6cZDOgrnOA20jIHdGb8rXflc49fyR5csNgX2edh4FvBsKYXb1n6UH+g7i1HffWk
         kjmt7UO2MvDC1/nrvd2EcSLvyMCMPCcYWuOl3E0+2/YLVrKfEqGgHSf5cSFHY37+WAFT
         eC3t5Ssqjpazw/o/Lql54CJPXdwcWHUqTOPS/fXOTsR/eSvElzZ3xOBqmVsGWV+zqVp1
         w6ehf8FJqcGFtY/iX5Vn8MD/lDa33kF8h1pJ1p7KJUDIjgdCnPKEnnVQ8veWBNtpY/RS
         TNhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+JvHDDbTYtABDDcCUqp4DyZW+RBdiQ43AT9le7Hg1qU=;
        fh=ZxDqq46fLoYg/Kor4jd5JYQw5McN2JoIP5y8ohRb+D0=;
        b=WGOG5XhB5JSp65SL/KKoEuw29kS8xRDEqhhQv0Yb13ENpjhBw/Fam+tNC5Zkn2Za/w
         s4IIBkNPulBBbgnIjgnJE1dep1GRqyFNYrSkOobVkOg26iItB4MgIpCvHIF+4FtDhdl2
         m96X/7w7ibu7XaqxQOCWeliZBtFlNCx8IeYDlwMpiaUhiAH40T1Ziww53ZGKup/v0IOE
         DIZLdpiCgmiN166gxczqAeqM+uQFD4JY5+k/tG+yaYba1LbYIeKfDr8AZIooXak2rtdY
         VikL+hd1EZp0W+0j4kKLFNekqT9t6ziVBo0SG7Thdbqzh4RiCKsAAsj3GuND7KMt+Lsj
         UztA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772034230; x=1772639030; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JvHDDbTYtABDDcCUqp4DyZW+RBdiQ43AT9le7Hg1qU=;
        b=erBLMYyD9rL2Ve4TSNfpKVMCicIdXHmRLQHumRWoqkSmejErOuW6xRn/YL3zD1KCsP
         9bc3OnlFTUQINKX9F7qvBy8YmCma1Kh8Tjb3WU7sf6dGFnHnNy+BnAc/4dHn+r2aLv6J
         hgmyArISleq00Nx08RpIi3YYYSpUp/4419MbEzK89183dNyNSl15L0rlK0soNLHh/9Z7
         1j1LSrNdp5udmNO3AqnKy4cxJh58Qo89JiVrycD/sweOCcLAFQlKoRLXv+lNDf9Qs3U5
         8YqnSlYYah884wRrd2vnplPrw5dEZYc5gScwErUHZpBeq4yOaFXCzusdTgNXQZ1NyTQL
         P8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772034230; x=1772639030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+JvHDDbTYtABDDcCUqp4DyZW+RBdiQ43AT9le7Hg1qU=;
        b=O5bjsVaicNQFtqZOx3gsOptHVyam1RqhkoayPAWdFvSOl8E2RdQKbGTYOKg/LyNm2F
         CoRD06kOwAlWHquSvBrAWSpTZKF5MKukYNSxoO/w+jOC6+7Q32yugfwMIlGx0HsaDUpF
         3yEUv37nC2XSp9B1BmBYYg379YsMCQRA+reg9RaxtWznawECaZw9vz5u0muCNfcDlu94
         c9FUNYqmoiokRlY/ZIsz65VHD4TXGKH2QB4/WqgaABn3n6jcZxInQHGxUwzWcgx+qHwJ
         /m9F4E+h/ZjtucjfmSlEiyxOEMqlp4hzjXj2JvnyDfk0KBzBYWY9qtpRpODCrHDvn17v
         HF0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVYuAqq9fao55udwwoOhX+znOfZdfzXnxqi6y3Zso0bzFArUOdnIB1xjPyY1nLja+qSfjtJNZEZfDNWsg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo1kEssffcVH9NczsSHz/lLgBrEzfRjhh+tl5ybmLD+XcnUkA0
	JSnU3XJZA6Y0ZFZMVqH6ruOIr39WpHo61mnjpIyz3zwdAWOIe7owyEQr9vTMydQJjwp4/JmXVro
	zHAV31ZUBREXM5vlSBYxwanZGx6yjKDtbwqzmPLesXSTkZyhHbs6YvIXDJrr0ulv4CBD+UsT5nZ
	/bbrTEZOkDQ+KU+Gd0GphEfp5DgUdWjQswvPs/1pMvJ5JBmoPdVqc=
X-Gm-Gg: ATEYQzy10MkEz7ERKiTtBqyvLIhcpwWzg6uuACjPRmmHP5hE+KV2lNNwgSC3dEDWRCb
	j5JNtbPQkJmD9d1gSag8I1Kkm1ys6Re7qv5HQIYP/JCId4ar1PkIRZ5nLtQmvuOqIvA7kCmxktp
	WtGQnhAEJpQzawxNu3mkasxeV2vmlygTr+tDEJ5NXwSkA6H5damyihMT7PhnyEXheim2XssXl43
	ZjfCfheLA4/cw4pPAWY0Wm99FXWt0joc0lghjEx
X-Received: by 2002:a05:620a:710b:b0:8c9:ea1c:f218 with SMTP id af79cd13be357-8cbbcf54d18mr117063385a.15.1772034230547;
        Wed, 25 Feb 2026 07:43:50 -0800 (PST)
X-Received: by 2002:a05:620a:710b:b0:8c9:ea1c:f218 with SMTP id
 af79cd13be357-8cbbcf54d18mr117059785a.15.1772034230051; Wed, 25 Feb 2026
 07:43:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225152211.766792-1-loic.poulain@oss.qualcomm.com> <11249664-38c5-4cab-998d-f715a4e0124c@linaro.org>
In-Reply-To: <11249664-38c5-4cab-998d-f715a4e0124c@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 16:43:37 +0100
X-Gm-Features: AaiRm51h78gpZbERpRmi0XMPMaiOc9elkIWzQ0KU-GSbmyGcBYsvQPJ17GVEdiM
Message-ID: <CAFEp6-1efjKLY-dimV+Z5d3+Nje5t+zshnrK3HStpAv2p7KnFQ@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: Add debug message to camss-video
 format check
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=699f18b7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8 a=D9TC-kg5I7-vxv7XpYQA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE0OCBTYWx0ZWRfX+JwcM2SP6/op
 Acjn78xsi9GwzaAAnk147YDo4tgtVm+P7j+7QKon5E6lhkIt2/CdBnvASZt/j46NQpenbB7q3B1
 tcwpYsDjQPYQQ2VWDs8UCrN3AN6Q0YsaP5BbwkUNPrfEQE20dpkCOGd08Q0lA/FFrgn3y7BanMo
 N8h+OQRIy+yGLDP/59gZT4XoyzzRtoms5Jrp7PcHuMIt7YcAo2lfnoT14ipjz0B6rcNMNW1qXno
 z0vuVS6PyJr0yrNn71QlURd4GjD96jRcaDr3AFk3SnVV1QY7IMHzu3TKjo1S62e1lYl08qJXBd/
 EBxc4e+Yct935mK+TGjmM19SmP7+SBcmNkkaTvTLyl3mTGs6NEyL0Yyc5j09yBCanPYwPEInPwp
 CzKXZpgl9HLb4l+MW5rIaAdkf3KWEeNjIJDVeyTJXIk25UuaG3cfZ9iXilh3mFs5nQ+kI8KKCnw
 c/Tv5P3Xx19pqTSDNaw==
X-Proofpoint-ORIG-GUID: 4yWBAo066VCIc9kdQZEHxcPH9XuByiD5
X-Proofpoint-GUID: 4yWBAo066VCIc9kdQZEHxcPH9XuByiD5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250148
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53383-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,linaro.org:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 3C69519A65C
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 4:40=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 25/02/2026 15:22, Loic Poulain wrote:
> > +static char *print_fourcc(u32 fmt)
> > +{
> > +     static char code[5];
> > +
> > +     code[0] =3D (unsigned char)(fmt & 0xff);
> > +     code[1] =3D (unsigned char)((fmt >> 8) & 0xff);
> > +     code[2] =3D (unsigned char)((fmt >> 16) & 0xff);
> > +     code[3] =3D (unsigned char)((fmt >> 24) & 0xff);
> > +     code[4] =3D '\0';
> > +
> > +     return code;
> > +}
> > +
> >   /* ------------------------------------------------------------------=
-----------
> >    * Video queue operations
> >    */
> > @@ -218,6 +231,12 @@ static int video_check_format(struct camss_video *=
video)
> >       if (ret < 0)
> >               return ret;
> >
> > +     pr_debug("%s: format is (%ux%u %s/%up field:%u), trying (%ux%u %s=
/%up field:%u)",
> > +              video->vdev.name, sd_pix->width, sd_pix->height,
> > +              print_fourcc(sd_pix->pixelformat), sd_pix->num_planes, s=
d_pix->field,
> > +              pix->width, pix->height, print_fourcc(pix->pixelformat),
>
> The return is static, which means there is one of them but, it gets
> returned twice.
>
> The second call will overwrite the first..
>
> Just use %p4cc - also please use dev_dbg(video->camss->dev, ...);

Good point, and thanks for the helpful hint, will do.

