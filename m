Return-Path: <linux-media+bounces-39821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A0EB24C7E
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 16:52:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B860188CC76
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 14:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BBFE2EFD88;
	Wed, 13 Aug 2025 14:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gakrKsDA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5FC2EE296;
	Wed, 13 Aug 2025 14:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755096608; cv=none; b=rKT1quOSZ69lCbPKmDFGeW4kLLE5xXMVfbzUDo1yFY4z6h0W6M0QGPF67BZQ/oohFYpJTXm1WwKfz59fSVbx4sg/5XyLXTnF9JJX4jR3xAan7o4dU5zTePHb2VTzDopN+4jE0PfH8yY9UNc2HeGaAAkMXzkQt4dX/sKfOx2x+p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755096608; c=relaxed/simple;
	bh=kiPbq2yuers8ONVE4vELV/HFIzjx8z2LBCOCrgs/3mw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gI4M1sfmMD/7yEx3dEA4/dB0Fjety6meQ4xCcUr+Vhohq6kyV4MD3h0OyaIjlME4dn6QEsCh0V4FOMemxxHHRlUV07Mj1GFWEa6yohbMb3TSbtcBGYOACJ8nPDM3LNjw+tLaq5qgfL2kuqZJY7pUgrdVOjrEoTp2n39iShTr+HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gakrKsDA; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55b978c61acso6543411e87.2;
        Wed, 13 Aug 2025 07:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755096605; x=1755701405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIKXLEPNlesB2U05hQtb6a2B4R7/fXq7kK7C7dR2GO0=;
        b=gakrKsDA5KfWoP7gPUVtwZzvQyNTX/taD90j7ITkTBaLNFdpa2vO1ztVHco6I0iAex
         pHnQM0yWWsqsf+F3PSBQB0vAvU7pSzC6KRszYQUdaiAee4L/uARljP8GG9QzOqrGsuVA
         1OpA2WBHUAfBX+o0hYEK6v7kSTujFntsKBK5kqriHhoqIWOKii7YWAop9lnPqwmtCvfT
         Ypk/J2AXKlwRquZxfxery4MdJJqYqaZoC0n8VpIqXsnQ+3R4hRohzpZTcorTDPNjtP09
         mq4KlrkOeh4b7OHpgXzNm0IgHkKH+pnT01tMYeQviFnlL46stjZIre+w12YKkGFAwh3J
         E+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755096605; x=1755701405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nIKXLEPNlesB2U05hQtb6a2B4R7/fXq7kK7C7dR2GO0=;
        b=ArLR7qlW7mOyfdLTdQVYpsYY62iPRQNuRwSpwSH33XOabrxGkQ5bNmYYaFoPup/wrU
         cC1fwkQta+kjuHfTNS0pSJczPFUu9TQjr85fn1nhRUdRteXyjAoNKNgDV5Sn0xgaHE/r
         2kc502Msnm213RE2NRYEyHrUD1Y4Xt1ifk9fqqB+4/QNbJCwq6nZWpvrtWtzIOxCJpSn
         LSyHnPxzoQgt0xMVkgWmS48cHJSdUA6Y4hvht3WahU1B+hfDWxUHXrLbY+Svf75A1vsh
         CcWfUay3s05wErveVTUbOH65UrHVitRJJ2vwDBRLmc0KMJ3GGzUfmzrWftXBPiqtH/7a
         fvmw==
X-Forwarded-Encrypted: i=1; AJvYcCWAOx6N7Mbrgedb5gPwZRVustHWPd1oo4eNc6zpLUx7C0GecIpbdMMuDQJp2pbJihV1FFByt8dvhGwfWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaGNAirQtI0PEMn20UZm0WzJHweQd5f3egRtOIBf5dlLqFOoVe
	DOCTFyq6EmcI6CnaR5tial5BJer5CvGNa4/YsBZLzIbi+PcQl88eQiuM
X-Gm-Gg: ASbGncum+VeFaqNnFQZqRr3btKpDWfrkbkJu/kTi9YxilTMf8OE4/pdLDfDFedjJCL8
	5EB5SD9Z4zKY2pXXDMAFB3THtaWGlJ5DJ90j7LDh/tGGX4T+bU7sUV7ZeJ8MjpJE3f2LEJ6/95D
	BUrHL4KzSA+6C/lXdltEvg1hLd40GB4cyZvRKPjM4bBqjpVky7ZiT4CEC2eGtaOYzfvPS/Z3ZCy
	JvJNn3OQBZiJZbhH428z8i74WOXf/E4EKtLWUTfIoZ6hJWlYmG157/rwp4uZg9kiYNTAQy3ZC7M
	AF7ofSFub/AN5VscImUaPdAqRbsVh/he241xQHvKx1twNbo/2MsvEsHZfijFhwAyKzqD0gg3PP4
	3YPgNeVky9T2EZhPEiB5s6DWLa8vWVKZ8w+g=
X-Google-Smtp-Source: AGHT+IGDkmKuyXD+17t2o5yhmvXYNwfI25ZFwrNfuDfPmZcgv5OFoiur0nQUWZUmsCDW5EgSL0XRIw==
X-Received: by 2002:a05:6512:b9c:b0:554:f76a:bac2 with SMTP id 2adb3069b0e04-55ce036cde4mr1105461e87.17.1755096604610;
        Wed, 13 Aug 2025 07:50:04 -0700 (PDT)
Received: from foxbook (bfd208.neoplus.adsl.tpnet.pl. [83.28.41.208])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889a03acsm5279770e87.51.2025.08.13.07.50.02
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 13 Aug 2025 07:50:03 -0700 (PDT)
Date: Wed, 13 Aug 2025 16:49:58 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
 gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com,
 hdegoede@redhat.com, Thinh.Nguyen@synopsys.com, Amardeep Rai
 <amardeep.rai@intel.com>, Kannappan R <r.kannappan@intel.com>, Mathias
 Nyman <mathias.nyman@linux.intel.com>, Alan Stern
 <stern@rowland.harvard.edu>
Subject: Re: [PATCH v4 3/4] USB: Add a function to obtain USB version
 independent maximum bpi value
Message-ID: <20250813164958.6c6c34a4@foxbook>
In-Reply-To: <20250812132445.3185026-4-sakari.ailus@linux.intel.com>
References: <20250812132445.3185026-1-sakari.ailus@linux.intel.com>
	<20250812132445.3185026-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 12 Aug 2025 16:24:44 +0300, Sakari Ailus wrote:
> From: "Rai, Amardeep" <amardeep.rai@intel.com>
> 
> Add usb_endpoint_max_isoc_bpi() to obtain maximum bytes per interval for
> isochronous endpoints in a USB version independent way.
> 
> Signed-off-by: Rai, Amardeep <amardeep.rai@intel.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Hans de Goede <hansg@kernel.org>

Hi,

This is practically identical to xhci_get_max_esit_payload().

Couldn't xhci also use this helper now, to reduce duplication and
ensure that it has the same idea of ESIT payload as class drivers?

Note that this here would need to also accept interrupt EPs:
> +{
> +	if (usb_endpoint_type(&ep->desc) != USB_ENDPOINT_XFER_ISOC)
> +		return 0;

Regards,
Michal

