Return-Path: <linux-media+bounces-43264-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BECBBA3E21
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 15:26:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 728621C01B9C
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 13:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA4A2F60B6;
	Fri, 26 Sep 2025 13:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uowzFMr3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFA8270EBB
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 13:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758893175; cv=none; b=S/2cSB92+86T5UmqwPOWBEleLUHhMtLlt4rAhwvaFkOE1gWgDzuJln8JapxkrBADoLhor4QekFlsmv6Ij9hktGarJWPcPukakrn8FnrP6ZG1ewscx7FKUP4zLdSGHKK2x0K7ErQBidN21NyN8w9l9RhCkj8jzsZvsVPntQ8WXGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758893175; c=relaxed/simple;
	bh=RtXPjsjkrsab9AzdPVjUAFvhF8lfBADbbM1lZm7ePns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MhvTxcA2Pm0jYn4j4stZENzJ4hC5t7VO1d7+tMRCzsm9gkZk0ct9yHAn5u8CynHnByP/6LGUmzHg3d0htFM31MUQhLdZKpJ/T3N4aMMUaaEH5pPDwiDkKH7QjgcsVEGXDtg9KWajTAegkORfIciEF1njeR/Xq7Rj+V+VMBFvkoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uowzFMr3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD0CC116B1
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 13:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758893175;
	bh=RtXPjsjkrsab9AzdPVjUAFvhF8lfBADbbM1lZm7ePns=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uowzFMr3aPwMrD+qmaHtgWSWq/LP/U23DAhgkfB3IcoYyRWaBKktEkqVRk+ITvkcW
	 uQ6/D3OeE9L1Q8qY9/uEkqCuCQiaahrQF11jXjEhXN+W+yZkLhYNnVkn+NOTSMdjq7
	 PLTPbCNS33BTTaND/RP0lI+EqCEhnluIfkPg2Hzl4hxJse6cHq+2wfOj2Ya+D98tNG
	 /pwcsBN64zOdOZVmptsjG+Rp58uKe9CfwbmqPwG6ovlPgZBCDZcPcfwr/9+7UF3OLB
	 r4kqdO/XEtU6FimH9Nq6xA+zwL6XKWD8RU4xy2Mf6dSUNnnwjIu0ctnnTHsRYMz1F1
	 PMcBmZQ5iOGdw==
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-30cce86052cso1636219fac.1
        for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 06:26:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV0L3sTfU8hxykI7dUCHFAhnPcRmETHmMuSaWd/UbXpyp0PIslwcpsVQtkz+CJyqL4q9WhUFDxwijV+Yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoSsVTdApUrkMNwjadzf+8mwfSJIKmnKSwqweuyg6UM3Gp2icR
	C0fj5o9a9X5kj/swUL4VY5YSSvHxDGdoJIW64PimIeZrIlWuVCM5iYsly/aUeeBkFQ54B5/uBO7
	IP+Z2u2lHGkkTgqEOEtPl2nn6nZoe178=
X-Google-Smtp-Source: AGHT+IEAPK2bkLAJrqItJrUnz3u7H4h7WLpVc/QAmqqZi2roEZiZ2R8aR50xvhgG6xSTlBvthyD74alKb7Prh5eyrzs=
X-Received: by 2002:a05:6870:c1c8:b0:341:d42e:6b42 with SMTP id
 586e51a60fabf-35eef026582mr3949561fac.38.1758893174218; Fri, 26 Sep 2025
 06:26:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926-uvc-orientation-v3-0-6dc2fa5b4220@chromium.org> <20250926-uvc-orientation-v3-4-6dc2fa5b4220@chromium.org>
In-Reply-To: <20250926-uvc-orientation-v3-4-6dc2fa5b4220@chromium.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 26 Sep 2025 15:26:02 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hz+mkr5WT7TSzL_n7YoOkMmJh0oe5Hz1U2Ggf22NibEQ@mail.gmail.com>
X-Gm-Features: AS18NWAQwaDtnuOl4gR2HFE-6ZWt0LS5S0cYFageANOj7ELddWPtez7e8-mpMWQ
Message-ID: <CAJZ5v0hz+mkr5WT7TSzL_n7YoOkMmJh0oe5Hz1U2Ggf22NibEQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/12] ACPI: mipi-disco-img: Do not duplicate rotation
 info into swnodes
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, Hans Verkuil <hverkuil@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
	acpica-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 26, 2025 at 3:11=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> The function v4l2_fwnode_device_parse() is now capable of parsing the
> _PLD method, there is no need to duplicate the rotation information in a
> swnode.
>
> Reviewed-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

and please route this along with the rest of the series.

Thanks!

> ---
>  drivers/acpi/mipi-disco-img.c | 15 ---------------
>  include/acpi/acpi_bus.h       |  1 -
>  2 files changed, 16 deletions(-)
>
> diff --git a/drivers/acpi/mipi-disco-img.c b/drivers/acpi/mipi-disco-img.=
c
> index 5b85989f96beeb726f59ac9e12e965a215fb38f6..b58b5ba22a47a4afc52129980=
74d322f0b7586dc 100644
> --- a/drivers/acpi/mipi-disco-img.c
> +++ b/drivers/acpi/mipi-disco-img.c
> @@ -617,21 +617,6 @@ static void init_crs_csi2_swnodes(struct crs_csi2 *c=
si2)
>
>         adev_fwnode =3D acpi_fwnode_handle(adev);
>
> -       /*
> -        * If the "rotation" property is not present, but _PLD is there,
> -        * evaluate it to get the "rotation" value.
> -        */
> -       if (!fwnode_property_present(adev_fwnode, "rotation")) {
> -               struct acpi_pld_info *pld;
> -
> -               if (acpi_get_physical_device_location(handle, &pld)) {
> -                       swnodes->dev_props[NEXT_PROPERTY(prop_index, DEV_=
ROTATION)] =3D
> -                                       PROPERTY_ENTRY_U32("rotation",
> -                                                          pld->rotation =
* 45U);
> -                       kfree(pld);
> -               }
> -       }
> -
>         if (!fwnode_property_read_u32(adev_fwnode, "mipi-img-clock-freque=
ncy", &val))
>                 swnodes->dev_props[NEXT_PROPERTY(prop_index, DEV_CLOCK_FR=
EQUENCY)] =3D
>                         PROPERTY_ENTRY_U32("clock-frequency", val);
> diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
> index aad1a95e6863d443a45985ba7ec7be4acf8664fe..296716875a3e7977abb7b7dfa=
89f78664aebd61c 100644
> --- a/include/acpi/acpi_bus.h
> +++ b/include/acpi/acpi_bus.h
> @@ -389,7 +389,6 @@ struct acpi_gpio_mapping;
>  #define ACPI_DEVICE_SWNODE_PORT_NAME_LENGTH    8
>
>  enum acpi_device_swnode_dev_props {
> -       ACPI_DEVICE_SWNODE_DEV_ROTATION,
>         ACPI_DEVICE_SWNODE_DEV_CLOCK_FREQUENCY,
>         ACPI_DEVICE_SWNODE_DEV_LED_MAX_MICROAMP,
>         ACPI_DEVICE_SWNODE_DEV_FLASH_MAX_MICROAMP,
>
> --
> 2.51.0.536.g15c5d4f767-goog
>

