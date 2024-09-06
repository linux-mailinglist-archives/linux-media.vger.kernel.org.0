Return-Path: <linux-media+bounces-17822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F32D196FBCE
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 21:06:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B989284AB1
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 19:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF7181D279E;
	Fri,  6 Sep 2024 19:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="FVx3eV8z"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C482613D899;
	Fri,  6 Sep 2024 19:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725649585; cv=none; b=YcIwBJacDtouxvsP8wIK+stvX9ULW4hWaxAWtNka7zYiQj+0p6kGI8m90iE+nGE6zYVBYx+ELr8KOqTVmBaKA/rSqwbBM4Dnp55SRVunB8vDs30Zkufgq57xIezhu+clcSxJ0J+oCEBvRIqta2mVpe+oFno2nwsIx63XR85grUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725649585; c=relaxed/simple;
	bh=nr6OX5UedFpgxYakr+FAYRZIVUTAKAr0Ym9FJ7B5DNI=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=qq+bY+0zxLfYims6090NfLlq31BksxOgNOFSVtOjyMcJIqeVOIhwCsmxewAFwJwn/a/3MYxXRgSl+zV3cJoBOlcKyla6INZVTYZTwl6BZSvV6LSIdR5W9ChT0S7/9derfsU//fSBmVzoDDQ2RmfNl0s2nfwKlt2zAn7LWZsuiRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=FVx3eV8z; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1725649557; x=1726254357; i=markus.elfring@web.de;
	bh=tiX2YP3egz3aDYEiqN04/pLGavK4NnAFCP8ntbEUtO4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FVx3eV8zyGY86PThuNOZ/UWwKbP48MBxkx9f8utvAPN9sQIAKYkfPR8hUBS1Ot8Y
	 8+sdxH0ZfoXBEaSmRSbuV0VTWuviKJw++tM7fTtsr4V0/c66eO6JRmuRUN1ibXNtY
	 U/qZi/e/mM9tHS5b0CvDPjQcCHxsBaVYavHU9GtmYbENjegmNaqqdmdRkmxTBmtNM
	 qmf0DHmoFsxW1LIU0+EM+273JZM1aEw/ngexSMdr8nVzZT0VIbKjuBOfhVjy6Rdv8
	 DGxxRiHzXYwuS0S6Q2Hg1wNWoESywKl6y3fZzCoQbcK5ZUHifpHFY1724IaxS+StL
	 R06aQbNhrdzO3u9GMg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.84.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MKdLK-1sTtVZ2ii4-00XRoT; Fri, 06
 Sep 2024 21:05:57 +0200
Message-ID: <08d9a783-2de1-4658-b617-5e6e6947ac2b@web.de>
Date: Fri, 6 Sep 2024 21:05:44 +0200
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
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240827-iris_v3-v3-5-c5fdbbe65e70@quicinc.com>
Subject: Re: [PATCH v3 05/29] media: iris: implement iris v4l2 file ops
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240827-iris_v3-v3-5-c5fdbbe65e70@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kOT5rk8SrRtRtib6YRMMzjISI8NWVzWAqga/vXC5ot8h2UzXvzq
 JARjg7GAEzgT+SnhOTMsGMdV+SFw1a8yk3J/G/bkDHVVI6B3AGadE/QE4xFRjZ4A18CXmil
 1xZPBrPiAbiEqy35AvfhlA6ETSUYxMYz6FVIXKHJoqL6CekTVo0l56+aPWujjegoisVzlBN
 ccRYPwiS85cfrQIGJse5g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/ODuNcg3LSo=;lYa8jdaHlEtgHfAfnYzz0F+9BHv
 iAKVzgaSzQ2UGPQ7n3WtpUTLCu27GWvo+VQNpEJLNYgw0dynez2zx48QSjMnG18rhzdB1AWor
 0Iw/45MahnghVeAhE5VpOTrN/6iUEDY+9w2v6qYjSHDYn1gkQO6Zap2mm0aYXse9a+kAxZUMx
 5YEyO1xhHpGnhMckG8hXFaqOfLktlkCFarb2wMLPJE5eV2p6aZOME7GaHdyLGpkyh3qjUjWw2
 nCmZ0VBtOMAxWqkGeIrrdlQ7DcJ670mli6FwoL+UfmKQSzJN7tF8oFpzpt2MLpccpXFf0g3hm
 djpgKFLIY/xx9bw5CZfKCu0c/NSz5HQ6KG2hicSvxbJn45BjMPgZu0W0LuMTUNN4VhnCUN1ti
 LOTZ3Xb38aHerEx1JdOIRQ95ZiP16xnKfr2JxiUWNLjfUTz7rrXDl4A2ilkoQvF3/Cyou7UUO
 0H9TZYHKMBIv+k04+0sSmdsWaWuirJVy27IAnGB4smyXGfqVPfIEpamK1QhGJgPAHkndAoR4W
 16wc5zwe3KJvOi0+DqB6Ne+ZqfErrDEfmRy86qPNU5J8E/wGLAOTOdAkP07VQ2vWfuSWWoKKa
 60QfsoeDnG5D7NuOn+wX/BVqLLhDWeWV2bVtKuX9E0WhYUYZebTnb5ytfTyaUQcYChrpN7qkE
 iBXdNOcZKxqmZrQCDzagD6vxTJ6oTLc5Wm4nTkw7dkahLzuHb8eQi+WE0HeLekkvwSjGg0teh
 8PnojDKYArmRVPXW4HBuwZ4h3oJl8aHk8rY4i18Lp+0bZjAMZYOlgPvUlclpFRnXzmaCDUy4V
 nf85wGKrWet3ZFUCZGtGT9hA==

=E2=80=A6
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -0,0 +1,174 @@
=E2=80=A6
> ++int iris_close(struct file *filp)
> +{
=E2=80=A6
> +	mutex_lock(&inst->lock);
> +	iris_v4l2_fh_deinit(inst);
> +	mutex_unlock(&inst->lock);
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&inst->lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.11-rc6/source/include/linux/mutex.h#L1=
96

Regards,
Markus

