Return-Path: <linux-media+bounces-14727-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF47F92B17C
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 09:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F19DF281F0C
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 07:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA02514EC5E;
	Tue,  9 Jul 2024 07:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Yyg4ZAUa"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A4214388F;
	Tue,  9 Jul 2024 07:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720511305; cv=none; b=EJCgsrvPf2B1BKgGRe99HOWUSLnR5m5wk2pEBDk4bRCjs7rN/N+ai0FBMS5DDy1MlsQlMZ3InDLDvRjM9/yHZBUWkmhE+bXlXwwJXAxIoIXakwH9psvP3IvM5rHf7HWmaqKXYVABrjVDuJaABDyAdMMunQr5DGwBa07hH/UzPmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720511305; c=relaxed/simple;
	bh=gXm2i0HYYuSYuh7qBSALjsI9yozo6/+CEZoWaEWLEnA=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=eNIdhS4Qk/0LQjAGprHlSvZHJf66sY/NwO79xUyt59mNe8gAC7OWfg2I8iwGPQF5YFJOKuRHS6jbcB2RSLu+vlYuewUtBAWULwMZSynqhATR9CE2GZHpo8f+TT9Ok80C9zfDZLv9Go5AA26Wg7TE+Y7EqADg6ChIs6WIfOM1d1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Yyg4ZAUa; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1720511257; x=1721116057; i=markus.elfring@web.de;
	bh=KfdwP98EfLVBzYD3qX1tlsoJ0XqC4M1TEOLBCI6Bfuk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Yyg4ZAUaA5Z1YNvxDSxwh8XKxPvQOPx2fsVIKBesdumBqOQnwF7BqeIiOOM5qYnB
	 89K4BRAycDKVwz5mMnljU8g2H1HXUXkm3v/UEItLg1+nWPaJv3IbBjnL/95dmJsVZ
	 YUw6/pp8lER4jVmXnLcjek/2SSjcXPH0ROhPgXqfrTP3VqDc5JbEf9Bc5PWEsbTjE
	 L/n/4GJV2MX87JbZho8ZuamvTMNtsycrnsJDrrwEhLM1Gl9hlVqz7/jHnwOxoetv2
	 Fj01JBUnARwn5Vm2z8bYsfA1/p4QcJvRW4jh9jHlOl8GSzhtaKI1GrZR0k1n6YFzm
	 o5Wq0HsMP5SyxEwnBQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M7ell-1sSTXo1T2r-00EvLU; Tue, 09
 Jul 2024 09:47:37 +0200
Message-ID: <582f0e6e-7f8b-41db-b08e-5783943dddde@web.de>
Date: Tue, 9 Jul 2024 09:47:31 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240709000848.1108788-4-yuji2.ishikawa@toshiba.co.jp>
Subject: Re: [PATCH v11 3/6] media: platform: visconti: Add Toshiba Visconti
 Video Input Interface driver
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240709000848.1108788-4-yuji2.ishikawa@toshiba.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Nk5sjzAT/pxzJb3qM00jDkhnh7o3I4KoR7i1lj7yiWJly3w+/j/
 ipzs5mjnxzKA+mrnqKxIpRs9hyzf8m4SsQa+16ILhCuvSCCVDB1JNSSWLeGMUxH9Ln7vdZF
 5XNPDIHUI99jXOchyPrDvtD3cjXJMdWDSWCljoQsJTDFe9YEzTQ9ChL4TAToGtDeSTM0B0j
 2MDYDJrBoLtT2UVcP8ULg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tTIW3jN3Yyc=;Rmz+amz7iK/+Ny8+TEsgDgS0/DN
 pPg4rtpQxsw43f7BhiK4WYjw00/F8GLJvslF2M59qWskUKCVYa8Uly+aTKGWjp7Hx1Qr69cpL
 5L+TMMtxvCQ6La6LBKqRvrN++1G/VnSxpFHGzdVw6ewMIrWJ0z3XYf5cmjkuiLiCI6IBobjIh
 tPIBtJGFsBQkO339KXB8pexE6EsWhe0iQHX4B2lcO6AZsVAGG5xNKKnc7t/L3Tv58J6Y+HidX
 J6D0XHSCHac9mBn80XTkQvP2XYZDfizJv5ip5LnNaVwS8/n60Q3qcWS2dpeuX+4asmiztRVjz
 x8Wsr7CpCmjoIEJ9bQs2g0ca0CDPizuhyj/eqskmukekdAzplQ/qQ+GPgdo9ctGxo8i6J/jIL
 nohDo94IWuQhqab490q6Wtuu4q3TZ6LMdqEXUQPwqZYHgEYtt1E+VIRQNMBIIvi9EQJN5ysO/
 P5BhZpPYjra2AtdippSQiyFQOOxXYNjRwowAHyySxhtLjU85np2ArKIDmBpEmeMLOkAdpweQ5
 aBvblOCVL7q5qdBTnEZoABpeCrlNe0vaXd6QzjFICfYOM+KTthy1LJ9M/uZMA95QMBrjPuk3o
 90Z47DGOtMQt3DF1wMXfAnoDswW60rHb6+pENVn2+3w/axugFVa1f5s8NjqprL10Y8Ew//o87
 eRGkGBsPFsGe4mP+hnzBlimH7VEEIqYcow++OD9Q2kf2bOtVjX8O9W0gqdOs6/38zNjuzGrXR
 FkvokByZJMK2dcWbJjilPq8evSf0IHOVCH//cD8LtwdXnoxeT/2DmEKvWYBBCM4dLdRwQNVxf
 DxLOOt0j5dL0lwHJotckwXMqx4YFzstnYOcID5bZOf1h0=

=E2=80=A6
> +++ b/drivers/media/platform/toshiba/visconti/viif_capture.c
> @@ -0,0 +1,1431 @@
=E2=80=A6
> +static int viif_set_img(struct cap_dev *cap_dev, struct vb2_buffer *vb)
> +{
=E2=80=A6
> +	if (cap_dev->pathid =3D=3D CAPTURE_PATH_MAIN_POST0) {
> +		spin_lock(&viif_dev->regbuf_lock);
> +		hwd_viif_isp_guard_start(viif_dev);
=E2=80=A6
> +		hwd_viif_isp_guard_end(viif_dev);
> +		spin_unlock(&viif_dev->regbuf_lock);
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(spinlock)(&viif_dev->regbuf_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.10-rc7/source/include/linux/spinlock.h=
#L561

Regards,
Markus

