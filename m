Return-Path: <linux-media+bounces-44987-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D852CBEFB12
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 09:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83A243B7ECF
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 07:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A99CC2DC79D;
	Mon, 20 Oct 2025 07:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HxlqG6JV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6088C2DC77F
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 07:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760945832; cv=none; b=sZ4GfWnBh2SWlU0FjAnng50zzoq1ZfoESmu4Lbr1zRIfCC+0XdC5oDfueBc/RiEl/CI8hWiJh6cTSBDd0138yN6W5sspdodS4HBgroqAIsvVcW/4S7oVHMS3+6OegixEqJGTcnOlluR+ql4PhoPBIIFq3xSv1GPiQCVi5Z46kHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760945832; c=relaxed/simple;
	bh=VQoaozExOmqioacf5/q3vnaqih0NQ4fstgfjAkmu8vA=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:
	 References:In-Reply-To; b=NETiaqGDTCINHedHVul2iK5wKDlTTHLi6YLPBzYIUJy220AjxHd0EZVzWa/rVJ/S35UNEwQdszQVNpwu4zy3h0MZxiyjEqldhWMYph+wYdJzcRxGLWU0avK7vnAJU9hnRKYafTqWLf7oeVgLSYof5IFWgP2A+R52Jl2LEAD9jDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HxlqG6JV; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-426ed6f4db5so2679722f8f.0
        for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 00:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760945827; x=1761550627; darn=vger.kernel.org;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4ILWPeza03QIvY2XtFV8lZT4kG8ISpnp8pogSjcHDw=;
        b=HxlqG6JVEnLwfo6yTqBTak/0XQ79b6KoCfC5tqUeA1XCau0BuRHBp0o2QdMUn4595O
         j3yxX3ztY8YiFPGmPTVUk9vOlf5fe7dxduRdpk/7qhr7Gfpea3E2v1vW0OZM6miuqoKv
         SKiL8AbAN8Ji3mqr7ICjEuSfwUL5HSEXCm8D+N0PSOk3KmVdONWxvQXF0atiGR2Q4qAT
         9d+NkGbemCZXZSYJXTPB+iKxlPJudFItl4swvXEiln+pbClefpkqSlNZpfXQ1RVA3tr4
         isMVsAZny0AWON7VSiHaxOR7lE5uX/iJSIgFGtwIWv3iVkIQR9MocG8hRAsprk8GTtzc
         pTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760945827; x=1761550627;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z4ILWPeza03QIvY2XtFV8lZT4kG8ISpnp8pogSjcHDw=;
        b=nDfOhROKonYfkp7SU57QrCzT8RQ0rSc/YiR74RiD9XEa0cHagnf0cBSg3iCYwqt7sN
         O0elaAUIo0/c8caVLGNwLpcE3DTZlm0Dhs02g9oJYIBzOk1NyVWcNLQk59ZKPB/RUVyT
         57/UOUuDJeyV7iRb308WT+Rt/eJ0QIwzkCyYuDWuuz5UtjhnrZ6BySuGLCx0xn7PjjVY
         0yXYYyy0JySGD+HalInWIWEbLkB4VIkteb+aaznn0mEL0czN2xupbvAD2jD+uPdoa+87
         o1kIAXXHvUe4FxNcmhXK6sr4NsPUPkBHPTk0CR4PhP5G+Z9KilPU+tRK1pSh6UEzwBHw
         OPLw==
X-Forwarded-Encrypted: i=1; AJvYcCWyXMKmphDRjj8BCEuMzsE8UWc2DWL3E6e37wAFJ0o9drRV+lzYL8uow7m1PXzpjWx7KJ+e2fO5IRvtxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwL4KG6HkUII1Vp+o1afttglJbJgnLYUXjTC1qVLjK0O6uM2fQF
	3+Thhw8QGPdvF32TYteBe5ip6piuXku/Hj3AcVRYy45M8lY6nvsKYx/iYMrKskrEhwk=
X-Gm-Gg: ASbGnctQ2Efip1YXI6pna1ycIZltvx7e/oTDt+wjf2bSbcog5J/HINmQrZMkNjprXPt
	ywpnkYHEmv3x4K8pYZ3yajvCfIpH6X4Q2kDCv+zBHExuEYnX45PywAwpRWMfNlJId7hM4aRFzht
	93epDkISzdU17MGzTxvx/QrJzaVyivxz1V2AzQ+4+qSd74pUbGfG7Khj+tQ1kaQ2Oy3Wi9BwlHr
	ww/OhrrjXnhglPxHi/xbaQWjCu4vtx6JoKRZDSIiEVSvYBK/KtcEEZSkSo9S0sf3gMdh7691P8G
	ThU6c7ed01yBOdFu8TK+rSDfp1FclmqEJIj2DBRUolaGmZr1AuZqpbcZyya9zqdkpJ/2E+ON02s
	v/aK7INjen896/pPW0910APCEl77ia5sbyMihQd6X8XlUn8+GaRmdBmyuUGxmzOapa7qjLcVTW+
	ekIDBCeM6UqATCWJgMfuUbj1GoRmCihGBTlSckPuI=
X-Google-Smtp-Source: AGHT+IFruxApxCltSmU/r+PckQq1O1zM1pHRQoakcvOeekeeFen0XIHT681Gzcv841mSlTj/NhYjSw==
X-Received: by 2002:a5d:5f95:0:b0:3f4:5bda:2710 with SMTP id ffacd0b85a97d-426fb6a7461mr10296981f8f.9.1760945827270;
        Mon, 20 Oct 2025 00:37:07 -0700 (PDT)
Received: from localhost (a95-94-245-170.cpe.netcabo.pt. [95.94.245.170])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4283e7804f4sm11716854f8f.10.2025.10.20.00.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 00:37:07 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Oct 2025 08:37:06 +0100
Message-Id: <DDMZ74PREAED.3H70WMNYIA0KJ@linaro.com>
Cc: "Purism Kernel Team" <kernel@puri.sm>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, <linux-media@vger.kernel.org>
Subject: Re: [PATCH 2/3] media: imx7-media-csi: drop unused module alias
To: "Johan Hovold" <johan@kernel.org>, "Rui Miguel Silva"
 <rmfrfs@gmail.com>, "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
 "Martin Kepplinger" <martink@posteo.de>
References: <20251017060051.8204-1-johan@kernel.org>
 <20251017060051.8204-2-johan@kernel.org>
In-Reply-To: <20251017060051.8204-2-johan@kernel.org>

Hey Johan,
Thanks for this.

On Fri Oct 17, 2025 at 7:00 AM WEST, Johan Hovold wrote:

> The driver has never supported anything but OF probing so drop the
> unused platform module alias.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Acked-by: Rui Miguel Silva <rui.silva@linaro.org>

Cheers,
    Rui

> ---
>  drivers/media/platform/nxp/imx7-media-csi.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/=
platform/nxp/imx7-media-csi.c
> index 34a92642bbfe..933a5f39f9f4 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -2290,4 +2290,3 @@ module_platform_driver(imx7_csi_driver);
>  MODULE_DESCRIPTION("i.MX7 CSI subdev driver");
>  MODULE_AUTHOR("Rui Miguel Silva <rui.silva@linaro.org>");
>  MODULE_LICENSE("GPL v2");
> -MODULE_ALIAS("platform:imx7-csi");
> --=20
> 2.49.1




