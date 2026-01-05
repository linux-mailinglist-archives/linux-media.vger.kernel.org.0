Return-Path: <linux-media+bounces-49894-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 01475CF2D91
	for <lists+linux-media@lfdr.de>; Mon, 05 Jan 2026 10:52:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 02BB13008F52
	for <lists+linux-media@lfdr.de>; Mon,  5 Jan 2026 09:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA592BE62E;
	Mon,  5 Jan 2026 09:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="ZFlJOfp/"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D862E6CC7;
	Mon,  5 Jan 2026 09:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767606167; cv=none; b=HdMYFtYbQ9Uws+VmDq6/XxLEmFpbgvEmgJnEZtlUIPFL9YhaVqO6uGr9hsQ9aw8528DgJTyaq9GFkARngVb0EjXSUZje13rSw8/8kq8NcH7MDldg5JZQq5Y7pXBshWKUlTBeq7A8jg8tYonTLiFcUZzMbg4J6fXLvn6RjIbJ7lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767606167; c=relaxed/simple;
	bh=w/CAFBpyvbmqbTn79K86CjA2kpdqkRDtQMOZd7qaevo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Ml+mYdtc2bpo6BUgGJWeOl+pKstmPb+iiRuH6UN54Vlv3UI3M0XHVenDR2md3nnXIK7bzCZQrsCVG/NJUQhg3zgZpXzKX3TQ5mDJsDD180hgF/dItHI5ku0c0cZm4F2xbWnNwR3jq3CkC61rQxOwB8KQ6AeOVGC6IiTcErtO2n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=ZFlJOfp/; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1767606142; x=1768210942; i=markus.elfring@web.de;
	bh=WWiA4vf+jEoOfa8h0KtLn83SGsy8urJIcVZJJ2S7zsc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ZFlJOfp/KFcmEqhibLNLoGdi4CW8HoaCJDtBmSEPu8/OP9PFQwgkIMZvayFP7RrI
	 Vn5AYS9St204jk88IqVw0gxIlZ2BDB0PpzCZZpzMGQXiO7UeLK7Rz9SoxLfJa9MzP
	 LI3CTXxniuoGRpLXcZgPuLOCrQ6rreFt3pChnMC+0Jk536Zkggfxn0+HT+UPT/hxI
	 +uSB5ETGNfyLWJeMKF0u2hTxqQzSNxDqWfkf1kWbwRrMxNvkBlOLD9TCIpd3bnGLs
	 6YMLr0Jxg4h1XwVp4SGse7OlhjhDAi10POp2kF7OdZ69WSXTylBx9OkFfW9cvIDGQ
	 Qd5JsHtyftauwMNYug==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.232]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MODiX-1vEJWR0RrN-00RRS1; Mon, 05
 Jan 2026 10:42:22 +0100
Message-ID: <2738ac2f-a8b4-4d39-8bda-dab9927828c4@web.de>
Date: Mon, 5 Jan 2026 10:42:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chen Changcheng <chenchangcheng@kylinos.cn>, linux-media@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260105005617.37511-1-chenchangcheng@kylinos.cn>
Subject: Re: [PATCH v2] media: uvcvideo: Use scope-based cleanup helper
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260105005617.37511-1-chenchangcheng@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:u0zP2msgINvXUIg2+DwRQyKf30W8tPyh/WcJz8uyR3cJWR+kYM5
 yZvBkH/8oVmUZoa/v0DP6twKUMCXkdHijI7wMKQOGp2WsrPdum17k0RCKUDJx38Z540WZND
 ghgWuHyKKMTWsVo4lL/comgW8IQyQfsud7RvMQ5dyM5x7TxcLYcMuIxvlJ9YpeHZCcmd1dh
 ENhbJcraZQ4i3g6jBTt8w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bU7uN2rDum0=;2MX+e8J8e+tJ8uwDoYmakgBbP5o
 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

=E2=80=A6
> Replace the manual kfree() with __free(kfree) annotation for data
> references. This aligns the code with the latest kernel style.

              Align?


=E2=80=A6
> ---
>  drivers/media/usb/uvc/uvc_video.c | 23 ++++++++---------------
=E2=80=A6

Some contributors would appreciate patch version descriptions.
https://lore.kernel.org/all/?q=3D%22This+looks+like+a+new+version+of+a+pre=
viously+submitted+patch%22
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.19-rc4#n310


=E2=80=A6
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -291,7 +291,7 @@ static int uvc_get_video_ctrl(struct uvc_streaming *=
stream,
>  	struct uvc_streaming_control *ctrl, int probe, u8 query)
>  {
>  	u16 size =3D uvc_video_ctrl_size(stream);
> -	u8 *data;
> +	u8 *data __free(kfree) =3D NULL;
>  	int ret;
=E2=80=A6

How do you think about to reduce the scopes also for these local variables=
?

Regards,
Markus

