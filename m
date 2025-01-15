Return-Path: <linux-media+bounces-24777-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A8DA123F4
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 13:45:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 841B03A7842
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 12:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8EF241695;
	Wed, 15 Jan 2025 12:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="AJhLBlcK"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA7B29A5;
	Wed, 15 Jan 2025 12:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736945124; cv=none; b=TIzMqZnYFxA3lmfhU9AincMHj7WJF560ExKQ8kMORJn+406/zLgL2h77J3nFVOAxRyhQrWsf0bxu1cHa4ySNC04TUz9pwybrNC64Q0kXGZTzIYYrc/wPREhTyreS0JsCulHcP7BJxoU531WSDz7k36KKpRINC6jtJV4jL8a6zUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736945124; c=relaxed/simple;
	bh=sVZWOH6Qg1lI3XjCXIYJGnn5IrFpUgQnSnkLNLVQ19E=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=rWtLXWLMuyBEeYGP9O9AzxrTcrzHFuRS71agM5WAhNlurh90tkm4NlGo1w2a0viWBhiB4FrIpzHOKzvXnV7OFUC+lcjIe9aHFL/zHI+THXu5/XRxVSyFw4Dz0pvjEg/kKYNDjq7kB+zs+ggePHaXUEmwYiYBIbJyFT+fsxFNgEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=AJhLBlcK; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1736945119; x=1737549919; i=markus.elfring@web.de;
	bh=PfYuicklKpnwwSihmTChKz5KSlWES8Hjhq3fpAi8sXs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=AJhLBlcKnfEAESTyyHnB9mi83FGNl2k3FzeZJbTfETBcvcuyuGN0ez98Gh5CQUIQ
	 Vqg/MljDsvj8Gx3Ix5BpqV6d/xIq33cEOTmMtXFHcX58JYBQc3DpMQPffxbzFPUR6
	 ooAVzkeae4X9j8qDJ1jrIwzmSlY1FiptAIl/JAIkqFtg/mVepqwDipphDKnMontmU
	 /IIqE03eblAY9HWKtZ4GxQ5raaFzUptd/oPE+lq5rwMef1oXwaIrGf3Z5xFwR25sl
	 pkkl4C3Cx4+xJujsQVwveybwyXyf4M9/UGr1UoEv3Un9OG6WsMIJe6YkdmSxcPFq8
	 sMuPp9UAI/75QbREfQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.41]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MhWkh-1t2IiS3Bxr-00cYgd; Wed, 15
 Jan 2025 13:45:19 +0100
Message-ID: <305ea388-936f-4359-957e-2533462b5573@web.de>
Date: Wed, 15 Jan 2025 13:45:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Jianhua Lu <lujianhua000@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <20241212-qcom-video-iris-v9-4-e8c2c6bd4041@quicinc.com>
Subject: Re: [PATCH v9 04/28] media: iris: introduce iris core state
 management with shared queues
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241212-qcom-video-iris-v9-4-e8c2c6bd4041@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vVSMiNn1HrwFRDe9m2xzi690cAUQXVBoSK1ct+dt9umA2Oh/4EK
 X+HfhIypWhxz6lT5HwtCoAgVTdi88nSVZni09GwrV6rzInFLAVzbpAQSFbCZ5VH/ql0jnjS
 Go41iUk70cNLK76jLlZVVcDrWh42a8amOuOTKX3oXbjy1q4JmU8F5QZyLi1ENyytojqbl3v
 M4Ef4H2dIV3EZiubAN1kw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:D8YW/Wgimm0=;ddUW6coqwjvlCXoJkUi+FgMYNew
 /ykho6nkSP1aacHLC9/HsWb0VFu3ojWrKN08agYAmHRnlmIchHpHO+nIQk1cNtdDkeOZUyqng
 zvd3bmqJRiMiX/40jQL6EjtPLyhQM41nAPvnRBHXohY830j6BLuocUze984N6yhvfdanxu13R
 RjBxgrqfTyL4v9MklD6KKJNS/Qoux+fOTY/J+s+oSJV+aywVMRtRu0F+7+rqXV8BVptUpb6On
 OebaMkeXV/9CCu3fHfLZ828Xfu3uizKKzEg/7evngp6Q25enuDSMsUhxOlJi1628H3Pb/5qmJ
 uFKdU4Yu4NMD9OccqcmfEgsPKA8l3LsEPxrHv+aVejsJ3L8n7nQIbmM51iSU+WaEkz5HLpAOq
 onJ0JEfZtLU98HCpQpKFqTFJDMS6hPeJ7tyoRSIcMIN6nK2BnGR1rm5IJ9e0gOOyW+hnK1SyI
 cMDah4XxfBSzLRJZvZkt2sxpKsyJDxvtHdwRb2UAv+llFLU7pN1+iokZAr0wSAd0qlv/qrMwF
 oUxuw5Lia5nVfNM2M45Up/L+N3m2b22TynOuWn9kDpj+Bhr4C1ZgmK6wga66n4b9qdNYU0lkl
 yslIY5wT8AoVNiJHS2CTS0pERcXL6anVNxfLxQdU1/SkB+5cuPSKykdZnF5g/R8V3VwTqQyyW
 Tf6p8MlAaV7AoZSS14grlUGo707GwWEIPx1hvvzEFYYVZ1VX4w46qmlSRHtIZQzCYgVOCKgQk
 2Zr9XqO/G3PzDppVm9PiGTRGzhrw0MPeMpHLVnHzcveL4AAajUUoRAq5JSQhaTw8k+CFAvu++
 pFhwoGh7RlbNvdG4biuVZ/WUIhZ95lSrfJ4v9WzGlG8Z2a93R8vdJYvAZFigHBZZbn6E0Hk7w
 HZ7hridnfQrzebZm5yWGzL72PLxU6sDHKWNZwe6ziwoe+EIARZuOY7MADa5a+22OqyBt/sXk6
 /XzohAN7hCOgcvVTKLLh7Ll42jMOFHZfHRHhFmw0bfpVQ4Hzw6fslT9j0fLWRTcfoNPJURTlU
 Vhx+QR7+E2wfwwT0hx03xwih9POLmtAGaSz9A7HceG51jtXhYxx4iSnfxuj8e7JcvJpHh70qi
 XsCIrs62Y=

=E2=80=A6
> Initialize and configire shared queues during probe.

                 configure?


=E2=80=A6
> +++ b/drivers/media/platform/qcom/iris/iris_core.c
> @@ -0,0 +1,46 @@
=E2=80=A6
> +void iris_core_deinit(struct iris_core *core)
> +{
> +	mutex_lock(&core->lock);
> +	iris_hfi_queues_deinit(core);
> +	core->state =3D IRIS_CORE_DEINIT;
> +	mutex_unlock(&core->lock);
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&core->lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.13-rc3/source/include/linux/mutex.h#L2=
01

Regards,
Markus

