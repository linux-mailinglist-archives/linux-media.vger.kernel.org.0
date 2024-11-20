Return-Path: <linux-media+bounces-21685-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26ECE9D3F73
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 16:55:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC6962836DA
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 15:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E07A714831E;
	Wed, 20 Nov 2024 15:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Nnw04bxv"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45A712BF02;
	Wed, 20 Nov 2024 15:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732118118; cv=none; b=MszenzfgbbcZFjIUJVR0HusRVCEtyIAB62IjsfSBPxnB5z4p8Kje8ng+15ijpBUio3uNk1L4L3cfQJJJJGjSVeyXYp4F1x9Yg08PdhyRBr2g0wQDqsVg/KerwBJuh3npL3ztz6HLQS1a1DmW5/Fm6M7qsW50/ikaaQG0v6thbN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732118118; c=relaxed/simple;
	bh=aH1wc23EJWXfqTUsXUZjkafTEKQs81xZn3aG8YiTq1E=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=i/Kkp8h7tCryquePzb8ftgRpinkLd0EbjMo3+KkSPIxB37uXQpeoMTHJ0ThqzphGqsrPan0dE2NxSwGnuJjQSFvNC9o0Z7DOdkvdpRVb/fxP//TxDHBP+hhsgVV/PdT+W2kFb51hGmEd519PuiO8oJWPVp/XoO9glTFwlB05GTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Nnw04bxv; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1732118088; x=1732722888; i=markus.elfring@web.de;
	bh=Px+wp5wWpABFQ3ooT1RXVc/as9DCsxBIOhFrFSKvCms=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Nnw04bxv4M/gIws7YJqT1zt2MlPtFLhjDSh2dnbgFOMoHj+0MkNToqrQ9PH+RwSd
	 frYIAsev2Q+7bj4/hHlxW8TfZiWQXV0KrO/p1pZrdWlj4CGWj54oc5uRGMVNMyCjn
	 z6yOoKFOfWXFFi1uOHyRpiNDfRF1mqXomj/tBQAIRWy+LJ2SuXsE2GZxPdsUq4c90
	 tguncC6jxPZGzoxLSsAehdwHot/SEKcCa8qaA1Vx6wo+usXtQO34qp6JfG3cOCn4h
	 y4wjHsRGMxkQ4Eg1gxvk2D3v6FYxeF358BPQMSb/bBcp+R7B/3XbFU6W4dJZn0Abf
	 1jGUGhGvHwihi9afHw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.88.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MjPUE-1tbcLC02J8-00nlxq; Wed, 20
 Nov 2024 16:54:48 +0100
Message-ID: <5516b4b1-638c-44ff-bce7-aa81928da5d6@web.de>
Date: Wed, 20 Nov 2024 16:54:37 +0100
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
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <20241120-qcom-video-iris-v6-4-a8cf6704e992@quicinc.com>
Subject: Re: [PATCH v6 04/28] media: iris: introduce iris core state
 management with shared queues
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241120-qcom-video-iris-v6-4-a8cf6704e992@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VFqsH1p4TgtOsK9QsSIvSz6wJFN3eL00eRdJ4hHpVaxsIGertni
 mEnJCX8vuOL3MrBj/nqszzojHZr2r1NvamW8k7THJTqH4M+Qv8+EWBBT+yhY1FQx6V8z/im
 ycBYHL9qcsW+7w8JpoiEqqmJwrdgizG1CsQoUpbA6zvEB9+cAfpzJ92XY2WggI7sAISVnj5
 4kmqSe8v6bHkR1P8feSwA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Db70Gs0J4b8=;CSihz6jcYJtBDbRNEZtFikED2v0
 jGT34+myyr2+8HiwRwnLmbqayMZTrxaZjEPvp1R3zVE0UYvzm4T9881i3yMgO3iWuZrEJG2dz
 jgeR136I0DVM8+PgLlmdORKlwp3vKPD1iQVhu8dt+6mLktqqztsqPXhu0SxDZ+3DhspVXe3Vp
 nqJ+vzlvuGcxH1aaVfkZd9aJM8VnLHUtaxh00pI5Nx7HnWYxmhX3goF2JS6hFgwtUwx1UJuLd
 cwsECJShOUC20hLY1q4BmMoiy7ly6GDvbVcJUyFg/iHLLhtZxJoRI5XNNp3LFvQ9vx+lEPO08
 raOcu+jW54v2RvNRzodV660LFYaVTcuOai796O/6RTY8CQ1ZuMKRd7jWrMjgPll4xpz0XsHbB
 BjpULPX+HwBFUQ/j9gH5KFLyg9I7eoWgrsfNITWnEYJR8CTKJX7lEyjnWWTobCi33z58IlVMX
 kmXrLEDpsO9DjX7YOp3qu1bwv9nS55LG+og2mNMNIPwc642Q6hh4xuJVnFETLafoKbjYmMPde
 0gqCC4q3RK1VDFwqerpeliKszZPKz/bTSHWIyAlpiBrxBsFiT1i6OT7f5RjRjDqoGsLhW1sg4
 ZpQO3f/HD++RZ+TMf8OT3Pas1Op2XxxAAaWDua0WHiM1FpN3l90DPjltyZkCvN0sic9QAlqjm
 mDztSSSqAsO/JxkDYhsYsywQ9ZFUFgad4FWpEsQIiARhTAshsYG/hnavExdxoi2waiU2CljBO
 VC0ZZ8giB4F5l48XgLKV4fqGFDMX2RRERWSE2+DNXrlFpDVBoCcimM6dxhnhDXVqr7WxqGQ1X
 iZBOtnGHtAmdA2xdw3oFldxqWZZYUWILJg1/B4+iBzih8QQRkeTD5jL5iTNIX913sObmyvEnf
 R4sZJypfhlM3+XV+7Ha6IfntL0kJI8DYB72GCnjOxX4foHobyqeB/cuuW

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
https://elixir.bootlin.com/linux/v6.12/source/include/linux/mutex.h#L201

Regards,
Markus

