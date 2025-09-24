Return-Path: <linux-media+bounces-43058-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F817B99DBE
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 14:33:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98D8A1B22BF3
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 12:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1998303CB2;
	Wed, 24 Sep 2025 12:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="uAOpuzL3"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110152FFDF1;
	Wed, 24 Sep 2025 12:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758717178; cv=none; b=VOSA5Ee2gB2ICWjcoEhnVXDkmJUudKSev5PZDTPqFxOJFFoIpnUypNSpC9O7Omq1tIceeJ6ObsflqY91zaCJznrxvrZZlHmILdN1fvo/spF85HOSAilHKxHWj9bheehTst5f2ucYsDA5nxCQWT/5VBk/ZI8t6QZ0tNtFU45lymI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758717178; c=relaxed/simple;
	bh=ZGxq+Ix5oisLA9COEk0FEELZKMSYR2wygcqx0J1ZhPE=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=D5mgNhhePFf1CrFJXElqTf5IqM/6pGrUB6iNLKVoFqizAhvXOdTN34+uVXRSf0lZK6OZNn7mGIVj8MUn3ylfEiy61kk6+qtYqZbxY1pMa8HNZDiPFeeAynOS1WuVQXq7MGIzfB7Q529C/TbuB4SW85CuacNi3liJVx168r4MNtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=uAOpuzL3; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1758717154; x=1759321954; i=markus.elfring@web.de;
	bh=KWn3nedyIxEDNdo6UJdXvOoLYUbJadV6nhxPIqocgL8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=uAOpuzL3hLrJfAUe+sSW2WUrvniLXgH++55wAcwtIk8j7UvG3hnAVPRYcLdriVY/
	 M49N7QZCDGrnLwA4S4oBto09e+JT+PSLx4g+L1MpMaVLrDjmTw30b3iTS+ZTB6uFp
	 S8POOO4uuDmqwBXOmJQb8RkrEq9g7dL2Z9UqjuXQBBKOGvrKipO3o7hpSYYte7ECf
	 0IPbuEDEctRdbGlCbTlnaeiDrNxvoaRCJfrY34tcT5rrv6Ia8ou27wByK85WyXFAa
	 t+uNK4GktdK+iXumZwXCKrrNdIYHPhko4J3VbYorGra+nHy4ZJZJNFgHHnyKGr2YZ
	 IV91sz3Qae/4krYY1A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.191]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MBB3s-1vCuzM0N7W-007qtL; Wed, 24
 Sep 2025 14:32:34 +0200
Message-ID: <ce08ae79-8f7e-4a37-85b9-d86c10567881@web.de>
Date: Wed, 24 Sep 2025 14:32:32 +0200
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
References: <20250919-video-iris-ubwc-enable-v1-1-000d11edafd8@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] media: iris: Add support for QC08C format for decoder
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250919-video-iris-ubwc-enable-v1-1-000d11edafd8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sGWNiIbdSGaZx3dO1eNBciCn/6VJ4p3IoxgH7KT5ib7Wfx7FaGA
 DtfyzaPHFUmr6a8z0qyUuBkFM6OPBvLm/U570xvVijSIr8eeGcEYhDiM+s2blKPWH9tyAbd
 7gLtnm4GMxlsP3EGIP/nWD2P0iuM/pnATQQ+C1ijxl39q0yz8+9rz2JrNzqQ8WVotem0mNK
 nF5b45YI1dFecSPjV5g0A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aBXKtSFHZ7o=;m4WRmjpnHhyRo5E6ifSaw5z59yZ
 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

=E2=80=A6
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -261,7 +261,10 @@ int iris_get_buffer_size(struct iris_inst *inst,
>  		case BUF_INPUT:
>  			return iris_dec_bitstream_buffer_size(inst);
>  		case BUF_OUTPUT:
> -			return iris_yuv_buffer_size_nv12(inst);
> +			if (inst->fmt_dst->fmt.pix_mp.pixelformat =3D=3D V4L2_PIX_FMT_QC08C)
> +				return iris_yuv_buffer_size_qc08c(inst);
> +			else
> +				return iris_yuv_buffer_size_nv12(inst);
=E2=80=A6

How do you think about to use a source code variant like the following?

			return (inst->fmt_dst->fmt.pix_mp.pixelformat =3D=3D V4L2_PIX_FMT_QC08C=
)
				? iris_yuv_buffer_size_qc08c(inst)
				: iris_yuv_buffer_size_nv12(inst);


Regards,
Markus

