Return-Path: <linux-media+bounces-43059-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC19B99E74
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 14:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80F121B25E69
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 12:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A97A8308F2C;
	Wed, 24 Sep 2025 12:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="eGgO9Ty5"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB033093A1;
	Wed, 24 Sep 2025 12:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758717661; cv=none; b=OcX6NSJsugXTJSSXM5+tQESwdZpaQDJUwfO6oM3mE5xVRl9kvUVnTUCnx/ZhG8ksdntgSMXDkvdXYTq48kZbVTfzyxnnUdajR+IM2oBFxKE31nqjen6hLkeyC7hv3j1gCodJ6qsbBYlNlFwoht5llfuV5e/fqw0xX9ztTNzkO50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758717661; c=relaxed/simple;
	bh=ukyBehHJORSa87e6ZCtwuhVWbEtg7QA9ZDX5n3I/q3E=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=QC8nhA7GcZ188UaQ7w6JtnpmlnZTSJCVMkpxIi52EbEyWUQVn4gTPmuaWIlAPsWeZ4I1MF3MuRsgDZI/OECu/mIydHOlv33TyKS+/vcr7itoRPCj9dRLTZom7gY/VjBFgvOJAuIvmQuUWafv1giLHtyyIN2fmc9cpZZz1kSPGc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=eGgO9Ty5; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1758717640; x=1759322440; i=markus.elfring@web.de;
	bh=z+9jx41Vbyd9vBOhmx25zrE08I9rRDvZfvVWerZXzy8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=eGgO9Ty5SCFUxsTOG+LwYXjch6LFLH6+HnPVWpT1csCVRyDo47qm4PakvwZACekK
	 OYRWl6kYwa6jidKXDgaQyHIjA3FwlCi4L4XcNyA/dvg2U/crqt5uxVC0GRLZp2wZ3
	 EdS8U1CNr0VrB6BDnWiQt3BjwbITOynoNSmJKfBeGrOwkXbt1vF74SYeJ3UbCac+A
	 zkD7wsOfutyHiUIHoWixxgUQujzn6xVbJ8kdBxAU1BuuzhTK8tB85EyfGj7Tv3z4+
	 tWmI/YQ3QsURklRYgnB6u4F8Vye7Hv/eEyZD+Fvv3/qiB89n8DXmlvr1jU7gOvFa6
	 xMfHJa3ldyDL8lhgvQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.191]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MXGOC-1uqrk13I9W-00K7Yq; Wed, 24
 Sep 2025 14:40:39 +0200
Message-ID: <5c0f6b8e-c3cc-492c-9d94-3b79eaca0628@web.de>
Date: Wed, 24 Sep 2025 14:40:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>
References: <20250919-video-iris-ubwc-enable-v1-2-000d11edafd8@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] media: iris: Add support for QC08C format for encoder
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250919-video-iris-ubwc-enable-v1-2-000d11edafd8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8Uj+YXmcuu8K4eDtiqKLNAV2mE1QjI27gJFZBrFJpOKyl4FYnAm
 GHh/muyOdOXoFeYtLt29+qn+/jwqTIzA/ZEEXWpdkmIaWndvm9665frXX3GSxC1ZxxPrdqZ
 Tlx/zlrpk4ZgkFKndBlE1BrRKy+4x2tT9kA0XjR8x1Kr6OWf4SXXQAvt6OXK4YxMZLTFcJw
 e7qJd3fhRS4VD6SzOyFDA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BTDtERsGNYE=;FRNonvllRKBZ5APRe770LNOCBmN
 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

=E2=80=A6
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -171,9 +171,14 @@ static u32 iris_yuv_buffer_size_nv12(struct iris_in=
st *inst)
>  static u32 iris_yuv_buffer_size_qc08c(struct iris_inst *inst)
>  {
>  	u32 y_plane, uv_plane, y_stride, uv_stride;
> -	struct v4l2_format *f =3D inst->fmt_dst;
>  	u32 uv_meta_stride, uv_meta_plane;
>  	u32 y_meta_stride, y_meta_plane;
> +	struct v4l2_format *f =3D NULL;
> +
> +	if (inst->domain =3D=3D DECODER)
> +		f =3D inst->fmt_dst;
> +	else
> +		f =3D inst->fmt_src;
=E2=80=A6

How do you think about to use a source code variant like the following?

	struct v4l2_format *f =3D (inst->domain =3D=3D DECODER) ? inst->fmt_dst :=
 inst->fmt_src;


Regards,
Markus

