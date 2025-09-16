Return-Path: <linux-media+bounces-42618-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52485B59504
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 13:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 675311BC0E56
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 11:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 776932D5419;
	Tue, 16 Sep 2025 11:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="bn6eD17Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739BC27702D;
	Tue, 16 Sep 2025 11:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758021714; cv=none; b=VKA1epLOkKQj2R3796RUjqqMxm1RiD48WRd6hwQPla3U9RCA6Fy9rl/0oelhg2JtxvgbXP+WjMZXSvjVFPCZFXbt6ITbPdJCvYQygwqBtLxlUZ5mCHtr15hkSc+k6D5YbXF3DBBsQr2CzRAMKgkTHQSOK13ZiKofIAc16QTlwmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758021714; c=relaxed/simple;
	bh=+N8U2hbJuYB1LGVm3MtQ0AS4GyyerL2+nbuybAKVuq8=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=q5ZuUxqbO5RN7Tpx1p/DyaIpcd8nS+pen3GyyPqzu5v5dtbJW2X9hBYQEg71xwWIjp+TwlSyQomM5ZlkeNP06elS4lb4pZ7qrxMlnCR72Pc0B57os2f/qwpcp9js8sdW6C1PJr6CcOHcIopCk318aXoRFQjl5MLUSwLyeWK+Puw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=bn6eD17Y; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1758021691; x=1758626491; i=markus.elfring@web.de;
	bh=wtFQDeC62jBvQ6tY+YKhepCbN0b7OEvw1LGadDXZz1g=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bn6eD17Y/mgSIdkivL8H0fPJOoSeIfHGLslE+yDBeEXrGdwSnL7ZftkUW5Y2QZYn
	 XbCapHUBUJHyZQ6cgMk+Zf3waQrn7OwESedJ00yr/mSMAdFc3GpVDJeuaAB0CkAD7
	 lFJbh4KiOeNb7osp8b6Qvb2fD2HAkG2Bzay60Ko1leyF7inKYqWXO65kpRNk4elAH
	 6zIBCwPC+Sh94PC72fatl+KIC5BpvQywFwmRm5hi2Scx60bOSQeihsq731k6NMi1m
	 wnm4U4+yh19gofPx6jBAhcWvQG0btZHc1KShI+ZnsJ9jzF0BSip9LHECuMS9iiLYA
	 uUKlPGDm5LaD8KIoKw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.197]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MKMA1-1ufz9w09fz-00Yd3K; Tue, 16
 Sep 2025 13:21:31 +0200
Message-ID: <f27c03e0-732b-431f-9127-1da9f0771135@web.de>
Date: Tue, 16 Sep 2025 13:21:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jackson Lee <jackson.lee@chipsnmedia.com>,
 Nas Chung <nas.chung@chipsnmedia.com>, linux-media@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Brandon Brnich <b-brnich@ti.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hans Verkuil <hverkuil@xs4all.nl>,
 Lafley Kim <lafley.kim@chipsnmedia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Robert Beckett <bob.beckett@collabora.com>
References: <20250623002153.51-5-jackson.lee@chipsnmedia.com>
Subject: Re: [PATCH v3 4/4] media: chips-media: wave5: Improve performance of
 decoder
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250623002153.51-5-jackson.lee@chipsnmedia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PTG51f3VFWdgYUNL5uDlBznqv9dCTXfUuzKzwMKnFIs1/XWIYBQ
 L2+EQRGal5rV8QqH37dd8itZpUimIlBGewEQTq8qKEpHaBWs0Y5w7M/BRgLBDg+iCmk89AN
 +vTBCFDT0brt/I0TjgxB8G8+chAN6BiIbCuVneB9PyhARVAhhd82OLL8KVNAvveu3N4JLKJ
 ZdftPUSxGgZn5YLzzI2TQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2OSYHMZHF5c=;3F2NwiffyiTptE6zrInb0ouQGda
 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

=E2=80=A6
> To archive this goal, the device_run() calls v4l2_m2m_job_finish
=E2=80=A6

     achieve?


=E2=80=A6
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
=E2=80=A6
> @@ -1236,6 +1235,11 @@ static void wave5_vpu_dec_buf_queue_src(struct vb=
2_buffer *vb)
>  	vbuf->sequence =3D inst->queued_src_buf_num++;
> =20
>  	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
> +
> +	INIT_LIST_HEAD(&vpu_buf->list);
> +	mutex_lock(&inst->feed_lock);
> +	list_add_tail(&vpu_buf->list, &inst->avail_src_bufs);
> +	mutex_unlock(&inst->feed_lock);
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&inst->feed_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.17-rc6/source/include/linux/mutex.h#L2=
28

Regards,
Markus

