Return-Path: <linux-media+bounces-12086-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B15D8D1ADE
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 14:15:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 441EA1F23C35
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 12:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9BA516D9BE;
	Tue, 28 May 2024 12:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ce0sU6II"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D272A16D9AA;
	Tue, 28 May 2024 12:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716898491; cv=none; b=OfYDpdfoAKjfkgRrYI0+bLvvEo5Ypw8tgoJZegT+/KBuZ8/pXoOe7QtkDtBwduD12ElAzRGzsSytqke/wGbWsyP1J7IR7tWuhl+1t5s3xcscIVZp4DUzhb63IClLLcEtrnRKAq21pPptyEq5BcD3oYNB1qbzckSvB9I/VxvIgSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716898491; c=relaxed/simple;
	bh=L39FFAsBDHkHQVYAW/Ix5OFoXJhPv4wzbtSy45KM1iI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZKbk2x7fz5bWy488SVO/TKmUthRLT78ifE/JEchW5zSVEhrAxxvhlbmMrT8BRMs3+wlHyCULD73/mlgc0I5dHfODkknHpSNVShHo3Mjo95lxQfzpCORtz67xKJNpj1oJ2kVP+LgUpdPSYyIuzI7FNX8uvCnrR1E5vyN4hELzSgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ce0sU6II; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-66afccbee0cso554085a12.1;
        Tue, 28 May 2024 05:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716898489; x=1717503289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UieDD2+MqhqP6aiIKPwGaG506R3jOmJuxnuUxcg0fe4=;
        b=ce0sU6IITdqr+6KaMNcekXdJLlrxghDt5X8XxnfFOMDXqEU4i9kf+0g9heN3YxWS7g
         pA95jKNcDcjrrz3OjqHeon14gx1dPqKuVZ38xXTgU4aYWTubBKgZ8qrwxMd98HR+z4dr
         22O1QiWbPqMJjvLMEOMa0156IknJmvjo4Qqq88XhXOHYS807dSy73ysJEPsAAOMlAgga
         Awu69NF5oTqEE/aTGj3QW4+PPSwD33tMN2b2z36MVCgE2Gj88xcCgPxedw/WcgYmLjoI
         hb6i6C2wUsYVP+r+SWP79na1tokDvSXcTXdiNFht0lt/D/rDyzIsrfOUjDZGrEhyE+84
         fYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716898489; x=1717503289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UieDD2+MqhqP6aiIKPwGaG506R3jOmJuxnuUxcg0fe4=;
        b=kp96npnt+7NJAPHVy3Lae4yTyl6++YTrd8FTPCYAIbkPzIUnYAPdvb1WiCwhLAfrRA
         VHJX1JWptsVPxifT+KmXNcXYlY6ZkEiyzFy/AjXMdQlIuVnpxx9nOup8zYVukjulyNw5
         c1VKMNNe9tOXcs3YGrIiLO+BiFC6DiE/BCXwnPT2LmgJftwkBe5JIhANwAQvprir5gkk
         sPwbMh/Qk0ghjNwVaRVjTqZWGUCjVWjkG7R6yp+mUMEeh6B86thaC4jinTX142mYnJks
         4gic+zX9FRutiWawtcpm3MxFgb5DIilJ8IiRvdb/U9SX1uJCF1G8ccVlHmUGwvgyJ7SA
         2Tyg==
X-Forwarded-Encrypted: i=1; AJvYcCWgPngWrJwBAWwWbBKN3LhnODUDTFw6ywxmbneACUpUyv6NqeoprNtuUP4V7TLdeKBS2BfYEmNqIlXqPIo4lZXXK3N/wOLiXrwsmGTm
X-Gm-Message-State: AOJu0YyzSjSDNCYCltR8UDdfUBRc3w1K4qK3SQMEFIQ5vhfOl8+4VKvu
	TcfGyBi1vaHA6evaTkIbukeNOL40bViTSaXIrXMGKTVLK5yE7T+DCg2yjruI0bviwUU15inoY/S
	idiqCVbzpX0hdKZ8S+4aCrR+QzJM=
X-Google-Smtp-Source: AGHT+IFl4OX11PN1S6gDoGJ4yyQ47x2DwJtENvVxXqKfNBdUsWrUqGNtWzRw/CPEBWgD1RgosLspC1FIhfa/iTXzgGc=
X-Received: by 2002:a17:90b:4d92:b0:2bf:e6f1:59ed with SMTP id
 98e67ed59e1d1-2bfe6f15b4amr3547022a91.32.1716898488882; Tue, 28 May 2024
 05:14:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240308121338.1983-1-yongsuyoo0215@gmail.com> <eda2a849-c23a-4624-85da-78a2fdef4fe9@web.de>
In-Reply-To: <eda2a849-c23a-4624-85da-78a2fdef4fe9@web.de>
From: YongSu Yoo <yongsuyoo0215@gmail.com>
Date: Tue, 28 May 2024 21:14:37 +0900
Message-ID: <CANXPkT5ggr8VbYdRy+uSnfHxDRES5arJJ8p+ist1CBTm-1xaUQ@mail.gmail.com>
Subject: Re: [PATCH] media: dvb_ca_en50221: Add a returing EBUSY logic into CA_RESET
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-media@vger.kernel.org, Hyunwoo Kim <v4bel@theori.io>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, YongSu Yoo <yongsuyoo0215@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Markus Elfring

Initially, I sent this E-mail using the below command
"....git send-email --to  mchehab@kernel.org,
linux-media@vger.kernel.org, xxxxxxxxxxx.patch. ..."

In response to what you suggested, is it OK if I use Gmail and attach
a new patch ?


2024=EB=85=84 5=EC=9B=94 28=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 2:38, M=
arkus Elfring <Markus.Elfring@web.de>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:

>
> =E2=80=A6
> > For preventing this problem from happening, we make CA_RESET ioctl do
> > nothing and only return EBUSY if the ioctl is called during the
> > "transiting" states.
>
> Would you like to avoid any typos (in the summary phrase)?
>
> Regards,
> Markus

