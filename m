Return-Path: <linux-media+bounces-13620-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5358C90DDB5
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 22:48:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C7501C23454
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 20:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14793178CEC;
	Tue, 18 Jun 2024 20:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="PZ3z2vaQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79F61741FF;
	Tue, 18 Jun 2024 20:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718743633; cv=none; b=MJDqsze8VpmD0HZzVF5f3RjwZ+DW0snxxNCxkYBy0MGIljUObQoGmj/yHxvvGd2rIjZEpTFFHO32QEuVE5VE+gOU3SSDD33rloEAUoiE+zvYK50/irP2dFT7MjUDGsAAOZqYXBUHao/09kTuL834eSj4/kHuowbbVoi+zk9sUzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718743633; c=relaxed/simple;
	bh=VRiPPn+VTLkhAiQA9Zh7a1/UmbTAaW9I7g5e9G74OBs=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=A8YoVwuqQHDzeZXZVp+6HXezEGyoMIHaCdhDOVMVHw/5LaNrwSG9pNNQKxJdlo7wLqgSQpHcNMWfOF7U4tmIpDFbMt2L9Uk5tJfVlx0OISlJ07yuUX/CULlU+pPZAiwS8m0c2nU+aShth+CEZnoeo29udv6i98aozuLrfERffgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=PZ3z2vaQ; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718743596; x=1719348396; i=markus.elfring@web.de;
	bh=7SVn046GRXwum9/obUlRK64bfmhFkYAqL+r0he2hVC8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=PZ3z2vaQG9aupKmIeFv80UHAofhbRE8SzMWlvGyOLT4JTk2ms2xfY/Etd1Wuj20R
	 yFFWFpw2H05Mh3HYyeeU3oqdqe1NbQbv8VPEHCANs4yWb4+S/9TEKhKLTCtZaASDn
	 mvoToayBJyRR1BrQX+gbCJ3zEvt9UR1Lk+H1MISn0JDQrZt+5AJbHtNz+Qj+rZDMY
	 KdSB1qdaiYgVXDx5JqosFb+57JfafH35oZtWOQD9r30jd7b+nfVTGleSAit+FvOfT
	 B5qHopxqzJ+N2psyBrMZZ8m8nWezDxF7nDXx9CKOyRD5sWn989kXI8BJo3n7K0WGd
	 nxkbZ55Zjnx37REdwA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N6sBv-1sROvz2ip5-00wTNH; Tue, 18
 Jun 2024 22:46:36 +0200
Message-ID: <2fed4937-e9ea-4635-a061-5c5a0533b152@web.de>
Date: Tue, 18 Jun 2024 22:46:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: David Huang <d-huang@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Brandon Brnich <b-brnich@ti.com>,
 Darren Etheridge <detheridge@ti.com>, Jai Luthra <j-luthra@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Nishanth Menon <nm@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Prasanth Mantena <p-mantena@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Vijay Pothukuchi <vijayp@ti.com>
References: <20240618193651.2771478-3-devarsht@ti.com>
Subject: Re: [PATCH v14 2/6] media: imagination: Add E5010 JPEG Encoder driver
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240618193651.2771478-3-devarsht@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wzwXm8OOJj/8pn6nEtnfr8d1OPM87N8PKLZGrJG7AtRwShPkJfv
 goefJPjAshUT3KsMHaSIJQDd0ojyS5GvAIHdR4fEZg8oMnlhxgvA1C0Kp+/7GyLJcG4BmUN
 AlRXIpUfvfLdxf5hn/SCicFgPKGdKOfDHCA7TNkkTDjXRjDrAOS9JjvNMmTJ6CUtdVorwKz
 K+2rGUcvcssXRacxWf/nQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:at3o+ErF39k=;WGKgmK/fxWBBs7JOx1gu5uwL1Fg
 w3dEk/evutMPDtSR9ATEgVKc6CMn8or+qhyyNtFQvevcSpMgGWPLm5DO6MiLJs/OqF+Evpdly
 6Mglv6FhKARWZuckuOr9Iybh5x4MqrVczmAvFNXh7WMgAepf0SSeKvU9OWhn4yNeUViLqRiwm
 A2+NpVJOL25KIkZtDY1LeSLkG6a/9cHTBBCNIEsQL/m9vg7U6UMmill9pFUxYRwNXkqKXhWOv
 xNhV7P82jnNjzhVXn8pddKZ4yPb8nutPAV3tB0r3CdMYUUVrfuhXQSFZ2qrA3eR6ZiN3XQJJy
 jNbbxHc710Y136fB2lylt8WVp4c8WBVNYF0E9HLHDz67vCcqqE2zaUTtL2Pe2KJnFI+5D1Gfb
 92ULx7M26WSsCvN34Bzegc5ZlXneYuI0EAU46kKbTlriaJjnrsbIgG519xAsIa6aM5UBotDLm
 L3pL4g0USy30zNYJFkdZMDhMdVbgAjgMF2UY+S0AHR5sq6O40vwwX3jxLS3oXuobDf2IDQAUG
 jkiECxQvpUlndBVrVaSoPGp/eTFgyCuY9oxb3V9AxT9oV+Qbv6rjIydlOXcMBcdUcfyzH+vNs
 6EIYp5rx+WBeEVGrYUdCpXEW0KqpPbWH5EMXB1oPsj6Tc1ILlGh4XHE0ZOTGDYeQJS5qDyO7e
 Si4782B0anEsqxL9qaKWRUJ//15GUlRcXnVM88qA0olrQ/4Bxmzbc9hJgIhLXaFEbLKZkTdZt
 ZWjyqmK4lVqx4M97OU/0MZg2mW7bn0gBGthEgmQ/5q4gnXFLUCf7zKxuZykOVvBZD3sD2AGSb
 yEEj4nCVqkAqSKcHHjMY6TaSLA3vooQmF06pjR9HljAY0l90sChdu9rf/Qi9oATSAf

=E2=80=A6
> +++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
> @@ -0,0 +1,1741 @@
=E2=80=A6
> +static int e5010_release(struct file *file)
> +{
=E2=80=A6
> +	mutex_lock(&e5010->mutex);
> +	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
=E2=80=A6
> +	kfree(ctx);
> +	mutex_unlock(&e5010->mutex);
> +
> +	return 0;
> +}
=E2=80=A6

Would you become interested to apply a statement like =E2=80=9Cguard(mutex=
)(&e5010->mutex);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.10-rc4/source/include/linux/mutex.h#L1=
96

Regards,
Markus

