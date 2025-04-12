Return-Path: <linux-media+bounces-30076-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D9AA86DAF
	for <lists+linux-media@lfdr.de>; Sat, 12 Apr 2025 16:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 942908A5E15
	for <lists+linux-media@lfdr.de>; Sat, 12 Apr 2025 14:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 455371EA7CF;
	Sat, 12 Apr 2025 14:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="upkh0UPb"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126321FDD;
	Sat, 12 Apr 2025 14:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744468106; cv=none; b=Ed7NX+zCrMiiqQYolZMi/IWiam57gKd4GHTebqOYE++OfxNKAcmJST4ikeSFk4B1iO6Fo6HZCOxLxREE62JP0u1eRYBD51O+ozohs3aMnyHKcEfP6kVbYk77VtE9KlNXlebjU/9JEgbYSabLuC89Kw1MIcnssvuoFPHN9xZLoIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744468106; c=relaxed/simple;
	bh=vmztPP/1esSKAxnm4b2Tct+Q32/hBncSnITegjELKWw=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=gdMnFIeR0GwNK07SEEOpdxYS6ilzvQ32J2sskdq6vC32zQAl9/T6cA+VQuZq41D/zGNIy8JLFyqtB2UIckRXHgig/cK5UbuVeKxOuuY0lE4mLkmHoE96GfoM0xpIlqpRL/5NQqci6grAzhSLaYvQKDEVOwbmhT8V4gtP4WzlF/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=upkh0UPb; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1744468082; x=1745072882; i=markus.elfring@web.de;
	bh=VRUC+sJ4zHMKef2PUfwVU1bMhUaNY0Sm7Aw7nUjDO4c=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=upkh0UPbfrat9YCJythFOFa5KMZv7fAk1x/Cwsz6sMfJfX6zrd+vL/97Y3L1mEP+
	 v/xwwrnx7fcPnH3JWpIQ+TU1y+ue6CwMDCgHSG9ZsYGKoo2fru8YQEjURydAL5kE8
	 l+sHovTBZzGwWKVF1/W/sNIp2bcg7h9hV8kfmPM9rR1uYSeN4RiTJYmgGgdGISgNo
	 FpoYMxuyKfwu/CB3/RBud8IL4/nN9dWryN1tMSaSkqQpGcTVe4CkhsiWe4S61GoVL
	 O06R1uFHjZ5dz1I7fyyCs32/hqKkVIaLAe/1FZ2/UOOuAmGkpP20s6TUWxHdMBBfE
	 LKYmHY/LT8WghfifMw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.84]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MhWkh-1tPrQv1dX1-00oxB6; Sat, 12
 Apr 2025 16:28:02 +0200
Message-ID: <d4ec6adf-02db-4937-a483-5655f70aa205@web.de>
Date: Sat, 12 Apr 2025 16:27:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandre Courbot <gnurou@gmail.com>, linux-media@vger.kernel.org,
 virtualization@lists.linux.dev
Cc: Alexandre Courbot <acourbot@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Albert Esteve <aesteve@redhat.com>,
 Alistair Delva <adelva@google.com>, Changyeon Jo <changyeon@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Gurchetan Singh <gurchetansingh@google.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Jason Wang <jasowang@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <20250412-virtio-media-v3-1-97dc94c18398@gmail.com>
Subject: Re: [PATCH v3] media: add virtio-media driver
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250412-virtio-media-v3-1-97dc94c18398@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Nb1C9m69vNmoctkPjPGPYvOhYSts2Z4HKu1+JCjHY4/iIAngSYC
 6yng0eTPDoyT+fjf7svFuLr3o5sII/WapBQbvjRGfxaiieowQNKWjcHtXDkg04CHyC5hfDV
 Jarf3atIHTM8Ql9DwnlLuqf2hd/L1LCXpmMUJNW+93rYiLr7eSyFqW51SqWgJMp6U/yDJsv
 zPyO1hSo2/Rqr6s2txBEA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jhk7V8fLhek=;O6ZwHegHmu5XDjfj6VbWSlNksmX
 v47WOSaJoN06jXTpshw6ZpXy9z1xpSuSEx44NJEFlOSNG9GmgXA1yDp8wmsptL6PDRY9pKX83
 S4BWAs6cEUwEQksgJhfn70eo3AuKihLjTqIOH3LoDp1psvqSU0Y9U9Umd6KQxRWB97ef5hGXz
 Xk4jjBBHvW/OU2kGG8yJFu7FYYXoIHhdlhpUkEA6Zy9mbQ0zeXF0HLs4DVhx1zT8DR7yRLSwn
 Il4GeZChw/nSumvMCm0jnWgBokmVS6bQEPPL62MltNm1fhNfZTncvwKIMcZfsFin3rLsWo9kL
 fNJ0kmZmqwdHvx2Olt1Rfif1laSnuA8FSLU/+X7y6uqAIZHE1cx6T4nug1vhPUkYmuG2wmsD0
 3x1+VsbuyGYxZkw54ZHMF3PBsJAfXAw21fn+fJ2CaRcec3+LrTN/NPPFuPhpYExwiYqYEaKye
 3/M/CudK07uu5hjWY/lxfG/nnaIVME4ByVeLdr1dh18Fuc9tdRlXA4HjB/xC2pUh1awqB7BHf
 Te6Ub3We8iIK4sTagDtUXzG6PzKdM9OEf1W+27WudCQR68OWp/f4zgw6w0qUSBbhHnW53eHLU
 Bqlf8f55lRIlNfRl0jlN159dZpv8p7QSYvv0LHZdpotJFYRashSUErPP48zqK4Mzww4iLMvs1
 TsyrTpi29a+AIlC9m89gLwLeejDZWXkxJVHcoWYdBzBIeUyVcTfZlFy4JKNta7+6Y2ErCER48
 uMh1bHk+2rJzKWO5Z91zpAWwpsX84wBedrcxBx+52eH88w6Q8SVo7tLe4Skom83WguWvYTuIP
 dKRsy/44MlbX36UhBUvm0PN9fjN2fNkXYVw1BQsazr88fsC8x4WpijpBntDDRtnY/ZKYbhPy2
 V1YTyb6E+dXk2rpNirpesmfvQxjeYTp4OptDxw+4sYEdnWOPNJ5g0jlGNF84d552OB/IfcD75
 c2EmLb+CUbfBB/9rTczeJXvt8GLqOn0UCocdhwH46SLo1+hAIKfdCUIanwNU/xK+O0evp4ZoC
 phA443/9sYSf4k3FYDSLVAtTbUCt//51C1Vv/N9AoOEzS7B0MtI8KBic/NIuqpJpMALfBnNuo
 FNxw/4jr+DaLM5yxKLYfPodmkpqKt6SSZSRw+AiMtViJjxbPidK+iMWxg6XE0SeDbp0YadJR/
 Yd0ZK1QzBOGV0NUzalRuuAHys/QqO2L9tDUBkax/Z5qT68HgfCvWQ4ZqgZrSAyyW1pXLDBTU6
 TlLwc/UM24ZL4N+ULodlXJ/AszWI/hKt2eMg2BRJCf+X0qMahnp1DOdiUB5UVsbwGVsLxv1aU
 +rXRWP7zCbhtTedFC5ZSUtPBg8FGAJrVxlGaeTRaFOz1B58CiY8vTzkQJGqc16gMfWEnG+0y4
 5sBFvUTXKdA/T57uuppGBOY9RF/OS7v7qQqOOTKVz9n2nYgRwPzxOqG4Gsdf4+Vi+3ErtG4GA
 wxvMdSL8W7YYxaqiNYAghWcJAqYdNd6e7hyM6DJSx0M/ZMjcUsixYXjEkv4HOyCoGQ8mr4g==

=E2=80=A6
> +++ b/drivers/media/virtio/virtio_media_driver.c
> @@ -0,0 +1,959 @@
=E2=80=A6
> +static struct virtio_media_session *
> +virtio_media_session_alloc(struct virtio_media *vv, u32 id,
> +			   bool nonblocking_dequeue)
> +{
=E2=80=A6
> +	init_waitqueue_head(&session->dqbuf_wait);
> +
> +	mutex_lock(&vv->sessions_lock);
> +	list_add_tail(&session->list, &vv->sessions);
> +	mutex_unlock(&vv->sessions_lock);
> +
> +	return session;
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&vv->sessions_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.14-rc6/source/include/linux/mutex.h#L2=
01

Regards,
Markus

