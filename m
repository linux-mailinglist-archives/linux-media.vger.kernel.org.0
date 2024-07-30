Return-Path: <linux-media+bounces-15527-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E86D940A31
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 09:47:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08178B21323
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 07:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7693D190480;
	Tue, 30 Jul 2024 07:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="fsUL2SW5"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D216150994;
	Tue, 30 Jul 2024 07:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722325623; cv=none; b=WhoE/z5u8zLqqNL4Vapq/1McNjnXOOH/gZj6fGG1UJrk5B67BAO+z2zoDziXCxC7DQvYBm8Z2ToxKPqD+i8cvtibXHQdYHqem6T1R6nGlK+hUTFprruR5IIekLo0JxuHdN1RAXFdk5ouavypISqEpyCoG59NOZe8se0vIH/WLcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722325623; c=relaxed/simple;
	bh=x9M7HV/oJMHN9SaUohbVRMTRV7I4w25EQLwnBP6m1nA=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Z5KNcU86lFEtIFrxZ5Vke4JcOcDggWsJSZgOKzcKFNKriFtbniPmA2a4j86toXN8TpgXNhSrs7g6X7qj1pilB/1WbFW1Vju8oHR0HJdUjf1UCQVCO0SdWFbaNEPHjjgz/KY1nEqgjxESJ5P8AQDysSWlEwpyVsT+lx5sBPmXcJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=fsUL2SW5; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1722325603; x=1722930403; i=markus.elfring@web.de;
	bh=x9M7HV/oJMHN9SaUohbVRMTRV7I4w25EQLwnBP6m1nA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=fsUL2SW5qmCX6O3DIYdLGC1B8MWnB0OeZaBATWaUSC+NQkNkZjRZi80SucLuFZQK
	 sgT4nQwrWNhpJAk4ixtW4KXrjdt1xPEQz1JA7gzy3QBaWSou8S/VptA8j4OLu9BFt
	 7LrHQv/aRUhvB2qYkU1s4OauXTYkbF+tXk4cZcMlIQDOKogDTsePIae7NV7fBRWhX
	 fl+YKMbj7Wp/YfcYvb5ZSKa2ME8YIIM+iMobey9JHOqdZF2uIvIq17HHT4r42Jn5g
	 edn4h4rL3ng2R1E1i7rHRf+xtaY1odkUBou84B1/j3c1SyJDCQSdScR3ZIi4KMgRM
	 PnfCQZAAKKeqGr0s7A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MQgl2-1swP5h0zck-00KjM0; Tue, 30
 Jul 2024 09:46:43 +0200
Message-ID: <3a764900-12ef-4026-af03-7e8cd2d09b04@web.de>
Date: Tue, 30 Jul 2024 09:46:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Sylvestre <fsylvestre@baylibre.com>,
 Julien Stephan <jstephan@baylibre.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Phi-bang Nguyen <pnguyen@baylibre.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Andy Hsieh <andy.hsieh@mediatek.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240704-add-mtk-isp-3-0-support-v5-4-bfccccc5ec21@baylibre.com>
Subject: Re: [PATCH v5 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240704-add-mtk-isp-3-0-support-v5-4-bfccccc5ec21@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HxfUk98qhjXor8EeRRmEwu+XEwDZNRk1/c9HrRw62G48QGp0iP2
 pikrkJzo4/SWpXOX5wePvMFYdIdMRWZMzRnkk4Fc1BhNrp+YFt8WyEZTg0Q7+hhF4L7gHwO
 kN0LR+Yi31HgOSaxuz3cBouWcefbb1oiSf6ZBmGQQNARZ+VZaXW1VxVcRaE09Cn52U1/IG6
 ohlr+FpKtk1jR8fJAs+XA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ChkxlR19o00=;uiURpJ3lineKtUAkoX/d6ZXTj8b
 cOzJcVdyHJkd08/1gAx1NJZnaOAFt5YTheV4N1YzLIECN2kRAnBbyKN18rSnlPQPzn2AzQvUY
 5gESyQlxbo3YI9l2VhjC7N42ep2nZQlDvTdhh2QfhQvlzdKUz7Zbop9LdzjdfhZLjwqyzX9mp
 yYl4NyzFw/qjr9qSCCD7/vJGlWkXwshnclAIsU6aKCr6vOxTISE3ksopHAiQmx/ybCXTooan/
 0hIAHvZP+LKlATMr4P42YY+BnoiUbIXntVbzqZ7rVVNzj22b3cLfjUAqXtrw82BXDgbuuww6G
 r7E7UmqDquz5uuxZpHtQbd9pf9A6jg5k1QkS3ArO96QfLrFiXjNyMYlG+y/t1FWKuJOfqMbWq
 gPYzRCu/1fLgSY8T3I2JsUPMlTECsSV6SB++8M1SijaOSikQ4SMIDtfq5A2nzvLyiTV5zYVuA
 zliVMrbJdt9bs14R15T5G+UjC/g0hrEQHv5UMfTRmjDfVejwH6nRZlmgfPrFq6aDe7lZAvRJN
 pWkOeA9x/NONJfEZQfmbU8CD0RlHGEiAxM5LReTv4ruUnB9TAh8Sq10uFHjjPu7poWn/o0WPA
 ZgK7hYY9SqWXFUDqTLfsx1gdUsU2xbldPU7wmCMKCW3pCZh1Y444xXJWhD6UmUfc8IAqSE0bu
 H8wYrnzdgQncGQW/VUqyNIxJf7YfVCyn2LndEmmy4wz9uBS4bIFTZIiSBhph2j/Ifu7atWYSe
 F6mI4NLN6AaGoasT35moG3R2/apGbQ/BcJTosqEW4e9dYISwvpR6NPIvpsD5G2+tUqBFuiLvs
 nszSfL5FPMiTmOrdVq6/ycBQ==

=E2=80=A6
> +++ b/drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv.h
> @@ -0,0 +1,196 @@
=E2=80=A6
> +#ifndef __MTK_CAMSV_H__
> +#define __MTK_CAMSV_H__
=E2=80=A6

I suggest to omit leading underscores from such identifiers.
https://wiki.sei.cmu.edu/confluence/display/c/DCL37-C.+Do+not+declare+or+d=
efine+a+reserved+identifier

Regards,
Markus

