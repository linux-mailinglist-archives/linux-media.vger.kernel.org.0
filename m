Return-Path: <linux-media+bounces-15580-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2925F94153D
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 17:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8B61284FE6
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 15:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C2AA1A2C01;
	Tue, 30 Jul 2024 15:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="u2BG2S5f"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFCF29A2;
	Tue, 30 Jul 2024 15:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722352545; cv=none; b=Q1sUMkJfQ7M93HBOd+qYDu2CWssJGnue8LILQZo4XMS0j2AZ0wyhczvNEL6BmoJ/2WIJgBUc+SbTgRfzxCfFcYtZ6Mf099sktBeDTd+pA61b/e82iDQWcRN7gYMVNxQGIf8gmz2oqdMaIJj8/mBcan27SJzXv72+7yMtyalDWgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722352545; c=relaxed/simple;
	bh=D5LVzzB7kowWJcR0ltmplTWIAFHKASYh/zNFa6qeTwk=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=ZEZqrE8nCJbWu7oaT4M+ilQsn8UqCxZzrGT7v2gLwsoZ7jORk7iLA7dkAtuPa9O0/JyqmXptVczilOq9zzoFEh14hRHvk6rFsLZCOgx0guhX7VCIPOQTYB16P3f4P88VdVdxvLj7LtiV2QaGFoOyk4j/i0lZVjKfOhqHvLuTxM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=u2BG2S5f; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1722352525; x=1722957325; i=markus.elfring@web.de;
	bh=D5LVzzB7kowWJcR0ltmplTWIAFHKASYh/zNFa6qeTwk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=u2BG2S5fShfrTz2KSbLCvSFXFwItKYCMdoIxmASSv9b8s2xQCV235GafUv6vUldP
	 3KHlmW6FNFT6YUNaPHKPaxLr9pwBnhk/9NwB3Yyqu4olL0143qZmOXk28Li4/fDd6
	 gamQN79EM94ih2w0faDWdRAwZ2gfaoHz48snPD2sgdIGvZqKk8lgWgLg5Oppm1YXD
	 vx7pDt3kro8kM21sk1WEICxNBmoF8w7CnOTMP0w7xFNRcA0LOe+z0yz1tUClO/AHH
	 RbzL//hjSFEJjmqDuctnUF+AXecMR2o5b5LFILpK2dggCo8OOyEJP5/lC3/yXvJVg
	 RevWNc1SOmNAEMNN2A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MsrdM-1sFELl2X1M-00yGFk; Tue, 30
 Jul 2024 17:15:25 +0200
Message-ID: <51bbc95c-00e7-41fd-a3eb-65a4eba5ebd0@web.de>
Date: Tue, 30 Jul 2024 17:15:22 +0200
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
 Louis Kuo <louis.kuo@mediatek.com>, Paul Elder
 <paul.elder@ideasonboard.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Andy Hsieh <andy.hsieh@mediatek.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20240729-add-mtk-isp-3-0-support-v6-3-c374c9e0c672@baylibre.com>
Subject: Re: [PATCH v6 3/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 sensor interface
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240729-add-mtk-isp-3-0-support-v6-3-c374c9e0c672@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:21Jmp9I0A53wGyh/tH2upxHfxiNe9xt5HKxVrv5eI5sABo4Y9ZX
 SFCQ8eDdb7WPzamqdlBCwf/uRhdkRTfE8F3gdhpI65/dJxQuSeG4hnd3dzheZ8R9AJXdjcy
 FYxBBRSOy57Oa6UHLvPoXwbHiTIBDmWjbiJ4EEd5rqS2CBHOK3HjPzThNvGQ241L8CrxfE+
 bBfb/BENESk4mfJSyeGDg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bInlfz3A99s=;5rCP1cLLs+hEWLWLOFuvYTh2W3B
 H+RWSvGjnEOgHOGsQbuqVGOODQ8+cVXrLJdZ5tRZGYeFH2sANVGAZjDHzrszwRFgc1CNw+j3G
 jR1WEZ9png0gtiMAsecQBAcSlRti51RZN61xEdR0l+qciQbrOsE/rEGSHAaTo/KhX5iw6UHAf
 CsFRXZo/7o9jtyuS3OaGrUs4eGJp0XZYkzJa8HFwk2xws7VjoFI6WZcAZb7XiM1MqJ3PvH3f1
 XrPnFONOT/6SFXuK8pjYA/+9bIE5/N2sXok8h+ORRH2ztoHz0DJ5P/DpkLOkW0rp8FrG/S0pE
 TibRD5Agx5CEeqQL6mjgnwpdY2kjUpusSUg9rqE0U8R982Z10VBBScv2955a0qpwH+0BmIN8f
 REui6T2VdWAFfkFih5O5C94STBlDdX9e+udkojjjZDlywOs1wn+EYr0ahdkRHW4R6M7WO0csU
 EXN2wD2qGH56+ItmH+EvtQvGeBY02Z1TIv2Euj12tUhLyi4j2/VBtTJEwJNtPDba9rfIlQUSs
 deJPpkkOXPDXZTh7BYjf/jEqpvxY/gl/YEN9Tsv/r1Rl0eiJuSK10c8E3y3wFW10FUCG6N3rl
 XhpY9+YrSWj8iqtBp/YU8Cr3ya/M+Q9iN7sNHAzpornNYui6dWwVndj9Sh8VU5gruCtBJtdW+
 8HhmDgd6R/VilktpnM4LVJE8Dm6Bx4ZAhajd/xYLF2+izVgYQmbmcY+NpTyF7OtcDmEkfLgjD
 ddoxLNAefhIZpivlWOpWasTQr+e2pwtRPGbwNB8hEiE5i9Y2FymtLozy0XV8S3vDKJHqvOOyP
 Uqh2/xmGPlcv+rNzflaNt6Kg==

=E2=80=A6
> +++ b/drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf_reg.h
> @@ -0,0 +1,117 @@
=E2=80=A6
> +#ifndef __SENINF_REG_H__
> +#define __SENINF_REG_H__
=E2=80=A6

How do you think about to omit leading underscores from such identifiers?
https://wiki.sei.cmu.edu/confluence/display/c/DCL37-C.+Do+not+declare+or+d=
efine+a+reserved+identifier

Regards,
Markus

