Return-Path: <linux-media+bounces-20801-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D399BB56D
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 14:07:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D990EB21AF8
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 13:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29DA51BBBDD;
	Mon,  4 Nov 2024 13:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="dg6wG72P"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB09E1B6CFB;
	Mon,  4 Nov 2024 13:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730725651; cv=none; b=uOoQwQxQMm9TK+NoCAV7ithwmoC+gCK14g9FUGL6DPk8kIMECXUN4+KQ56kFdrklGSBz16JJVFPWh7UaFyWcRXLg4rh4ZiPLQHw2GHnPd7QEHMMQHAhFnMEfmuTIzRGtYEHdMxZ1YGLBruN8h2r+28h/UILvxtAvH78hUu4ti+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730725651; c=relaxed/simple;
	bh=0n5oPcRcDR1kORlFGe5xEi5VBvf/0YL+KeYz4ezAu4Q=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Et/wtNEc8y8r6pF9Gto88re64G6svdTsUSKZRkksOYTJfGLi3wYl89Et/z47PUe2o32Q6IojOAia5J0Fq4j9VYvd2WL+lkub3dUQYxJfk7gwjfE7VIiGQFxFjETyiEYj6P0lvQ7N+0uGNxOcKUM3MK9DwwSlhhz3wdROXd+nN/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=dg6wG72P; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1730725622; x=1731330422; i=markus.elfring@web.de;
	bh=X/JcBLG9ZRntCDhqwrCH8dA655EdL6Qk+i6w/V5Velc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=dg6wG72PmBCTajz3zqwq23eIktpX+4mDA7NiR/yM9gRFG4w2lO6WZiTrqnG7YI1A
	 CPDw5TVG4ILOZe4bMIqxcBJned5HJM8dyPFWAmErKGc6danEy3DBdlWutRk0h9Aeo
	 sQW4gC8S1XAJ5rK8Na/rck/F53KDmJcigj5Kserk2dTfLnkF4ZrlAKzIIy+0YQRVp
	 /EjasB2ZeU/GK9Ysq0IluAY6GvAwZKQXpGIXjD2aqPsWZ6SgH5J3/FVaDpfDJE8h8
	 wMWwCoNCM8UpJLZKF8fqPWdcPgkGhilRiIPe4WORdj48Eu+2g3CyMiW4NJd305dhO
	 0gt/fHmKH6qIPdH86g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.88.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MECGl-1t0YOh1GC5-004TGg; Mon, 04
 Nov 2024 14:07:02 +0100
Message-ID: <c64a0c92-4528-4c87-ac2e-00ee2ec666ad@web.de>
Date: Mon, 4 Nov 2024 14:06:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Hidenori Kobayashi <hidenorik@chromium.org>,
 =?UTF-8?B?U2h1bi1ZaSBXYW5nICjnjovpoIblhIQp?= <Shun-Yi.Wang@mediatek.com>,
 teddy.chen@mediatek.com, yaya.chang@mediatek.com,
 Yunke Cao <yunkec@chromium.org>
References: <20241009111551.27052-6-Shu-hsiang.Yang@mediatek.com>
Subject: Re: [PATCH 05/10] media: platform: mediatek: add isp_7x camsys unit
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241009111551.27052-6-Shu-hsiang.Yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bRyeFpZaX8wNJrlK6hdPLRc1mevh68UYevrSMj6u1GEWHCvYp0U
 U7WMp+S6fbcCQsjvUzIRvGihCk2wnelpSPybJxv9aPgPvJH/2Q9Bp4FCbLhymk1TJdLACVY
 tNke6VamALyDNd9theYf/QpwhLZShCQDhsO6KJzXj7Aihi1qKCJefHw1nU1/9YGR4Mh0VA4
 3t22eg/S+4Y5juXqsxN2w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:H3ddCuVI+08=;FuKuZdqE+LyO/ovYd7kI/LBYHH7
 1BquZJV7yDnZAq3QrkDvghilD4FPiEtRngTsk3KCj/omyHEfMVhKkX3zjOI6ddAMMKvJtI77U
 v2nNOBon+Y5RKrDtdAKDwNPQpaNmnK8ZnxNzaNBDpkTrv2YLlzkH1YsNtlWAcFR0uy7nQ54c7
 g55gmNEf7mk+GO8GM+b/VZRxtOc/ln1BBa2BE3HMRPZh0dAnffyko2z0yYuH2i7VqK8ZT96zU
 97OeKp0acHRETcR/WuIHP4LWNeq+TqlPa58qYIzc6SpOrAXNpZUGF6/op3zXDQQwrdkcUYABO
 k1qPEuF455UBguUPoXaHmqwrlrrhLQgJfBphfAI/LhZwdNa1UTLafQEF7sCTt09j90rDpEwsc
 vxVb5aQwAOudnybxQaYkHYfkO9+r2iBm7NWmR+19l8uEHJvmBEGA1Ae2jSian+hfwKmsGFfS6
 An8akll0stTcaY3+aXRp36l5L8IgYHqpu43tlR7j6iNxZCl+4TLOmDEX8CyzSi6AwCc/hJhs/
 cIuefjktwSXY0gol2oRmCXTd4+JPpvFoPcfsVUM6xez6Oj+mmpQ2CrmdQHAUHTIi1pueS+7Xk
 3q4/RUqz26ieSi1k+khwxlaJt6sCIYdkXtOPD3BikHFQtWCetvIiU8R+oZa9QGYEvGWNz8a2R
 9v8Ds7T9O5D8//Vnsnt+XFBUzi9f20lvfBG3HDCvxVG+5bmuR4ruvL6lkHKFL6jHUJcHZXUuG
 j0ZN6ro3CkEghF7k9u1sjPWivH8BbyD9PgWXHFUEl7f+HaLB6FPW5F4ayuvpAns38oY6knOiB
 TRqKsdO5ojH//9XY5JYKHO3w==

=E2=80=A6
> +++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam.c
> @@ -0,0 +1,4168 @@
=E2=80=A6
> +void mtk_cam_dev_req_try_queue(struct mtk_cam_device *cam)
> +{
=E2=80=A6
> +	spin_lock(&cam->running_job_lock);
> +	job_count =3D cam->running_job_count;
> +	spin_unlock(&cam->running_job_lock);
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(spinlock)(&cam->running_job_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.12-rc6/source/include/linux/spinlock.h=
#L559

Regards,
Markus

