Return-Path: <linux-media+bounces-18154-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 680819750C9
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 13:28:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28CC828285B
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 11:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3867187342;
	Wed, 11 Sep 2024 11:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="v7O+hv0P"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD92185B7A;
	Wed, 11 Sep 2024 11:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726054112; cv=none; b=rwja0joepd7prVIYHzbCe+cCBmVnrhm95O5lgEapyoRhmvImO7oKARseOb3u7LZtcjkf1DRmE84oAmNZnUihuzXG9rk//8Z3uCyC4iSGKMH8x2hqjIVbmHDzAu9VSyZwcX3Xjd3xs38F1OIhaFqkw9Cnc42Jsy+TxoUaOXLE3ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726054112; c=relaxed/simple;
	bh=G+RdD7E+bzW4iedtiBzQQENI8h25tsSLHurvSrLM67g=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=BVaI0G0bMIpVVUgJ/QFhkxG6wD4OLAS+6fO2Juf+lNe7Cd6QCb3/xbMm9NzzEBHPxUFqIryDRGY/wNz0td2xxMQvI00VIUlUXJ6nd4Q2FZ8GQ/9PWL5Yq9b4C8GiFdC8XUirqCW+RdLZLyzF5ouGHKRv7M89BStoU0xz41PXNvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=v7O+hv0P; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1726054066; x=1726658866; i=markus.elfring@web.de;
	bh=yTtZxWE0JHb3TnA6oJ50YzGe95/FIcKE44d4OiLu6iY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=v7O+hv0Pzxur6hSXyQsSyzWcSvALNs8t7DoMepgzk/EIvE6coR6h5wrLCiV84VP2
	 yWGTGdFq8d2lGn4B1OfVqsyFJgIlfpjHymgYNYA9yUAbtorOqP1EDndL+reSaKsTq
	 k2v7NX1ZLhl23YUlMOJdlb5ylRrT5MdmNXZWkukOPFBKHTuTNAo0BuLPirsHOpmWS
	 /Zun4/Bg1c4xr2nhs0HQspM7IqYmhm+nX7Tg6byaFLaP4bnIonedU5zYWDrGyMMBY
	 1NhZNIQxfgE143BOpBQ/oxj9Lw2QAh3jvx9vKvlcY8SiZ5Q3eZEsgD5W41Fwbrdt9
	 5HLRQpxflVyC3BLDMw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.86.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MSIF2-1sQ2I61AYC-00NmSK; Wed, 11
 Sep 2024 13:27:46 +0200
Message-ID: <50b75b24-afbd-46cf-af4d-01e6ea4832dc@web.de>
Date: Wed, 11 Sep 2024 13:27:30 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>
References: <20240612-6-10-rocket-v1-8-060e48eea250@tomeuvizoso.net>
Subject: Re: [PATCH 8/9] accel/rocket: Add job submission IOCTL
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240612-6-10-rocket-v1-8-060e48eea250@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YmCb7NXdmFPxc7xnbYpPH3gDEvf/+oJCB9LfDAxISh25xOGXJhX
 xJqwC0k2vwG8Wg4Ljwp7J46b69w5H04HZv2saRwka7NMsngHoOuHBmnF99t40n/HTDcyhGv
 OrfeycGLIHZUB7lOU6SsqIQpHvz9/XbkMtydirXYtDwk1N8Bm+5VGFHufghtREbqgs5ak67
 RyCZOjWVRgOrA3ww41D7A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vOiVie10tQI=;pJqeoruLOD0q7PLKWjhqjCwpMIi
 wUbyfof0VkY56VFhYv5E8enK/5ratFGUpbica8CWkS3qKC1hdYt+nL1C9lBq/QYL3ggZ7tHMK
 Ay6RFBIY1peAsoplJfuNsFcf5yc/+e0a1vH3K54FG1XxeFO/KyBd1FagIie5cpHn4hag4+IGq
 Fk9XkUeWuK/w2igQAWvqKiRbdKvW4FrMZDe29pyjluya5cnGhRG6ymxugx0zGew4ta+fGLMAs
 c9e0y95ig0wgeGxExJx7DlNodPGaWckOHFx1DqwNW/ebOYhaKCljiQCWBe26rXyLX3QKbRNQB
 OD+26NpEXB3m31Scmy6ikiA5W31Fn30ExYO4LYL+yvtad8t1VygAI+DPUEOo5HsWylUeIQSJ2
 ZpAD586s5jnQmq4W3Vc9+Hf098axsiatJr+6qwvvHzrWzBLI2erE2nmpWo2hcgATmBTSUwZT4
 GM4qWb6SKc7gxH2I1Ye0b9Z+gc6ZDgFSu2HDMr9DGS5qWGTpQJfJGuV1VNaLqEFGeGQwkvUwd
 giCNsWeWCkGNvKws6NOLjWJUhsjYO6jLNeIIyjD4oWwKikAujz/MpjFh9H7AXFtJgTkdUvov/
 ra0USbAlz9O58lp7DkyTQtNap5DGe9arwchl5QkVTe8pGtvxjMhJFb7frOH2X+fsPNCINrQFT
 y3amKgwJB2dzOEWcwV84QlydNzgJQhe86O2ihbbEBl5Buiz7slG7BWBF//5tzRxwmyOoA5o4F
 YIZExP3lWGJX0GcnA7zpzTCgIAqCRuoqiG+/TnWhl2oVEQloxmjuIMK5APcPETjfdyRYsdvNM
 ufMAAL+QG9jA4fAnPdJj9w4A==

=E2=80=A6
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -0,0 +1,708 @@
=E2=80=A6
> +static int rocket_job_push(struct rocket_job *job)
> +{
=E2=80=A6
> +	mutex_lock(&rdev->sched_lock);
> +	drm_sched_job_arm(&job->base);
=E2=80=A6
> +	drm_sched_entity_push_job(&job->base);
> +
> +	mutex_unlock(&rdev->sched_lock);
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&rdev->sched_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.11-rc7/source/include/linux/mutex.h#L1=
96

Regards,
Markus

