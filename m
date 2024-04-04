Return-Path: <linux-media+bounces-8645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B32C8985A5
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 13:04:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD3371F29DA8
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 11:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529DC84A3E;
	Thu,  4 Apr 2024 11:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncZz3BWq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D96983A07;
	Thu,  4 Apr 2024 11:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712228606; cv=none; b=h1FnSvEk/oF/bPOXcruWJRl+9QHhUVwmicbmQE+mp3Jri+IpMpoooSskfMjwwCVExWDoTxTz+EOhGK9U4C9sIt2myt2toOla8RYPFfJ4wrXBZrStrFYzJEtdE21UZJ4hFU9k+wb4e7KKAXXFZ3R/hxESVUs+wLt9zJks/a6BtCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712228606; c=relaxed/simple;
	bh=+hAeU74QQfbsZOvQyLbhO6tKobZra3FmBs+/7VBvJaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EncSGdVUnlGmIUEGbO2rHKdPiUbBle/CuMCpiQS+9bxRHz3m2d/xx+tf4RrBcV0RECtM8Ey8Zmm/zUry7qW3kEbrYeQw4dBw/Yc6Gy0SWqhMgE7zSIkxX7of5J7hCTbIM6Nj0mpMV9Y6ggw1qssp0O6lUvptFpH3ZLzrhktL5K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ncZz3BWq; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6ecf1d22d78so95213b3a.0;
        Thu, 04 Apr 2024 04:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712228605; x=1712833405; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hAeU74QQfbsZOvQyLbhO6tKobZra3FmBs+/7VBvJaE=;
        b=ncZz3BWqXMnSTxYkZrAbQ457QC7NzCagsI4GgAs0jqX8sxDPA0eu8Hh4urLtGXTuT7
         FvRdSt9Nb385aVFG4/WNdNkIIExPdvdrBHqN0y/UKmVy+jnggpmobIxft81kLjJOWZeY
         8GRDDbo27bfBHLeB3X+5yQHUzVlhKmzfRoZYOW8O1RTPJ/GdK1L2i7DFs2uvdstnNGcV
         nP4l43iGvNjOD5w3GRzdE2431aKERYQTzPBL3CHJrdP0VoTtWT34LR9y1pxNZhoGwDI9
         7icm/aE4ypebqJz7yu1d1Ffhtw45LL4cNd8ToVVKeSsMohN+Bkj6OwIu/opNqchXFydz
         5mkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712228605; x=1712833405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+hAeU74QQfbsZOvQyLbhO6tKobZra3FmBs+/7VBvJaE=;
        b=VtpQF3ourOsk8CbaVx4My3jesVGWNZZqPxm0BQxG9adPH05yAOSdi832YOaW2ZvWFC
         LwFTk+y1yLflDzWcGwSgr1/uET4rV0jqIT/jcNIkdag8rvzo8UwMv1Tav4RGVPOPXao+
         DooNr0RDdxWVpdy3SgzvNF8scj37m6E7Ja44OZEj5beO+uxUmMgaB9/sAYsdBxhiXHbb
         bMTeqlIC7eYJ9X/VGap/nfQmPwWpIZOBqLKmuMQjFZN0ZVEqOLbS5Wz6IRwWvUz7DyLb
         Qf69J0qb6wGrdeZF8JKMuoU0KKLebJqZcYu2pYX3Jy05izpcy6Tr53sSg6YtMXBu3XYI
         4X8w==
X-Forwarded-Encrypted: i=1; AJvYcCWfHD5gGrCSoSwsrRYYznVZZspVzGeO+bn+6h/7Kw3rNJUvIQxf+mtFpudua5F6tNHMhidG2Vgkp+7AQX2weAaEN2khFsOJMQ6qfeuBJ0CAxKHScc1YigfhAKNR2kaP/ODgr2fHNchMlfgAvc05roogwRB6gtvQpCbXVpokBrufrrlTsGqy
X-Gm-Message-State: AOJu0Yxi2pOmMxALkWXQYsQ2cRvmK6DPwI/cBZbZCRJgwZhHA6WKIo8Z
	+Up/t0Y/tZT/AroFH8Z60c9yKMehH5f5WXvXHipuYyNHMfNkcCBGvK54hBZNLFKANO5Lsv8iaD6
	9nHpRUIXw0zHLeNObJaBgwHKtYkQ=
X-Google-Smtp-Source: AGHT+IEiV3mYP5jcL1qYae16r/KN6hqKughbDlZ4LxlcHlZBBb1xETAo6BgRMuLOSJwR/Fy2iLftYZBAuG/Ww1JZaBM=
X-Received: by 2002:a05:6a21:6d88:b0:1a7:199:8ac5 with SMTP id
 wl8-20020a056a216d8800b001a701998ac5mr2303003pzb.4.1712228604634; Thu, 04 Apr
 2024 04:03:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240404035205.59492-1-Frank.Li@nxp.com> <af602862-5120-4717-adb6-694ada09e8d8@linaro.org>
 <f5fa1872-0bae-4f04-aa94-27db937516e9@linaro.org>
In-Reply-To: <f5fa1872-0bae-4f04-aa94-27db937516e9@linaro.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 4 Apr 2024 08:03:12 -0300
Message-ID: <CAOMZO5Dtd_p02YeX6tcWMGzujZ-GwLQMQBPBOx9xLmEgs6VVNg@mail.gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: media: imx-jpeg: add clocks,clock-names,slot
 to fix warning
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Frank Li <Frank.Li@nxp.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"open list:NXP i.MX 8QXP/8QM JPEG V4L2 DRIVER" <imx@lists.linux.dev>, 
	"open list:NXP i.MX 8QXP/8QM JPEG V4L2 DRIVER" <linux-media@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 4, 2024 at 3:54=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> And for the clocks, instead pick up this patch:
> https://lore.kernel.org/all/20230721111020.1234278-3-alexander.stein@ew.t=
q-group.com/

Or maybe this one:
https://lore.kernel.org/linux-devicetree/DB9PR04MB923493D0DA82C9EC4386BC2A8=
FF1A@DB9PR04MB9234.eurprd04.prod.outlook.com/

