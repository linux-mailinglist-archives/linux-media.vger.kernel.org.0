Return-Path: <linux-media+bounces-23417-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB87D9F1FDC
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2024 17:10:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2D46166D91
	for <lists+linux-media@lfdr.de>; Sat, 14 Dec 2024 16:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E2719939E;
	Sat, 14 Dec 2024 16:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="BzLaeqFo"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB50522F;
	Sat, 14 Dec 2024 16:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734192645; cv=none; b=RVdb6JJys9mVErmOg0xrnK5O6cqjSBY9WkTRh0e5AWYrkv3TAmVOhkeCsraz9Emy3gp9+vKo1TtLxXP2gqXZO6u68l/0KF92jLJ64CsOyI5JgsjZcVeMUS0xagALU3HDhdRvhwPCIj2PgLVyJKxu/dAzMnZByO+tce1WJUWIomg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734192645; c=relaxed/simple;
	bh=gsOH6S1w/MwM39WRKOA/S1DUzdxAtZxaYQ8CI1SC66U=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=hrEtw6Z+qJwqQyCBn/0P/LrFGSPCE1vUvNatv+xY31N7CUzKIaeisgTNCO0mSFgy+Q832SNfycLjJ2u1lq1BUh7QIZAR9XWwk/piDwc6+FXZ7afAhG0JoM1ttt/7lR/m11JYoYl5P8G7Kl7ndl5bQqUND6dQbNNfAriyirojWMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=BzLaeqFo; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1734192626; x=1734797426; i=markus.elfring@web.de;
	bh=EMVJcvtYhP8unKke00pjauNVga1ID4yknBL/X2AAzV0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=BzLaeqFot7SqhjqDgS7TYRCSfW2eF6CJbmrIrzHSJqP56mw7Sec7y3R8sgvufpzK
	 YPf+xcZcY5S+KarpCfKQVpUzhNsOoj0qDzN43K/anaVj2G3GIjOhlTSF2r3/7Cg7D
	 1ff0+q9w1xHtuZsJhO992h4IKeXCOaXhwJPfAqOgcQDWLDJvup2qgbJOtewJRPrGs
	 nx3JTpI7dwVvffjwy8SmMfFI0ZQ+gyK6CN1kDcBVWnnfrO8dUeCpY2m2t4UQNI8AD
	 7oaQ9+cGYcCItpcJw81UiCsez65cD4zNhzFgVtoNBEOn2ab8fnf4gZ/zf4wKnUfew
	 KUI/oQNUzD2nEGFvPQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.70.57]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MbkWQ-1tsnGu2dSw-00dujo; Sat, 14
 Dec 2024 17:10:26 +0100
Message-ID: <cd3fda36-7501-416c-9c02-3163c35a2edf@web.de>
Date: Sat, 14 Dec 2024 17:10:19 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jackson Lee <jackson.lee@chipsnmedia.com>,
 Nas Chung <nas.chung@chipsnmedia.com>, linux-media@vger.kernel.org,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Brandon Brnich <b-brnich@ti.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Lafley Kim <lafley.kim@chipsnmedia.com>
References: <20241209053654.52-4-jackson.lee@chipsnmedia.com>
Subject: Re: [PATCH 3/5] media: chips-media: wave5: Improve performance of
 decoder
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241209053654.52-4-jackson.lee@chipsnmedia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:J2lHBvqSaEo8ApvS8GzQBSNblCPbJhwlR/J60hvn3HHUklWhfBG
 2WwJTKqS81szNSN/HJWaeGg9sFWMUS8ovr7iz5KmDalP0QZnk12pGrby/shbTHBdh5T5aJr
 gN4yAkVOoRyslAvOcDwrYwJran4fvUPg+BWbC/FJb/vowWlFRXL94NBc/OOcTKOHPrvTPpO
 YTUgAAEkpIG12umai65ow==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GR4fvji62X8=;CwUb5QPqA3g3eNPQ3gis6K6r3Hl
 CTJwBXuvh5WdNwDeU/DEGCtzgiEpeKBoPl4t+gZCC8spW3kOZGoF+I64kaT+iC9BVsKaB/6di
 pXZ0RuO0Aot/qZfMHXY8dre02EtF+SyV6iVvQOdmb2lq29u9nCoV7tXUfiB6r8qwNTAjnqjwh
 wRkEHGldE+Q9H2BixZvN40yxARwDq8wB1HNP+9ZJMAb04r1YmOTDJoUTsgRXMCwr/KyscKD49
 PDHaK5BTpw4DzwP05U6xFaaBbzoU2LqUZGTk2rRW4aoTT6oMKouFOZK9iVfYIpps/uCwtvcCY
 BN3DouWgRFDiv+Eswf/dKgJWxmd+tSvcxiEWUnFsTHKtLQfd1oUJTImamC5qWJXCCzn3lZTO8
 OWbwK2waUFmBmBty6fQNE/KPB2ZnrUJBN4F26eeYey3vAPJV4A5E0Dr3L5kJmlxc2M5Os4OWq
 nVcDY1B9FJSpjEYR8iwJibTJ3NP/aNvTEK/qZHBHopDmcx7+5db229RRXqm8vyPFnIInxEbAk
 D/9QMslAZKOY5qmqBMGb2C+iZQCn8VfdXDQh+GcJZCCFa8Y409PrcoQZJksjMtGDdgiQoQ3Z5
 JroTYjzqi09wFIKU1OpjXJBCkrEKLeMkwWmTKXGsK1OY/F7yJLLsvJlI8Ywk2JxOntnIkqr0U
 AKzd5Wde8ht0wQ64poCHcqXq6BzBUoYUz3sQHQZ6u/FtTc4v6Mhi2i13xMzE8L+FQ2LIfcAbg
 lA4zNHQZjNp+9CAVb2N2FsandIcu6HZwD4toGXRG0ku8CszFkT2V1e61+cOebtWeVRC4pJr3b
 rRU6JRulDnSLBIqnkw+MGN3BxfTqmw8OjB2oY7lGjMawB/x4wkhEdizDH/e52PwqD/xmH52nu
 dHQ2QZK9Lh1OV0TyKrzjS4VlYQzTdp1xBrM/eIP+2z+WJZQ2ZIQtQc24/IkKApD9578R8MEQG
 xaXp1HZnlvEAFj9sKQruYItZxeiPM0uITjj6/sKa0MezYWE4U5H+h0nhakHREnve2ufsbuvYL
 wX7HKX4/MjHXNyGmZsMJl8kr08l3g+z2oXfgd8P7mUwl7EStdQq9vdnijOJoq88riS7JgSoSf
 KelkopEgk=

=E2=80=A6
> Update driver to use an asynchronous approach for decoding and feeding a
> bitstream in order to achieve full capabilities of the device.
>
> Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
=E2=80=A6

Does a dot really belong to a personal name (according to the Developer's =
Certificate of Origin?)
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.13-rc2#n436


=E2=80=A6
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
=E2=80=A6
> +static void wave5_vpu_dec_feed_remaining(struct vpu_instance *inst)
> +{
> +	int ret =3D 0;

May the initialisation be omitted for this local variable?


> +	struct v4l2_m2m_ctx *m2m_ctx =3D inst->v4l2_fh.m2m_ctx;
> +	u32 fail_res =3D 0;
> +
> +	mutex_lock(&inst->feed_lock);
> +	ret =3D fill_ringbuffer(inst);
> +	mutex_unlock(&inst->feed_lock);
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&inst->feed_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.13-rc2/source/include/linux/mutex.h#L2=
01

Regards,
Markus

