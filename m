Return-Path: <linux-media+bounces-43078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 567B2B9B80E
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 20:36:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0172E322811
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 18:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE41F3168E3;
	Wed, 24 Sep 2025 18:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtBmNeMB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E787629DB6E
	for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 18:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758738973; cv=none; b=RyyiOdPqF42Kug0g1UJvgvBGTXywPySYd8VI6PBMAzjM33AoN6tnDnAxNMU24/oEXuYBRKfENUhFQ6wAvAhWHMif7pcK4rSLfHtf6TmfQ1uJr5G0noSyZCyDISmuvnEujGXSDDJp7z20eLN4vKs/GtRJ7bpzNmtaOuVRGEf00lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758738973; c=relaxed/simple;
	bh=2aLfX7a8qrLe04EEuCsSWXOjT7NO0ExrjFnQIBlHj04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TcFyAN2+1dMzti2uSybEgpCnhcDPzoMdRJCX0BkT7+PUX8CJeILcQpKMS3VC40yNqtIzgkUOT14R4VfnEFiQBbPA9a88Llf/PoLYSIpYg3OSsJ8ffoXU7zfAtDSkelc2FPumy42FhbBmKIYZm591dMEvNJwBtBHI4ZKa+kUwB1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtBmNeMB; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-279e2554b6fso1004935ad.2
        for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 11:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758738971; x=1759343771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RuMDAryKyhqMDr6B+XSq4gaOR0tjLhHQ+hf5EwbyoXs=;
        b=FtBmNeMB04FY3JGB6PNvtOFMiiWfAj4garK3jVjddYu+aBCpnKJv62bLvq1W//T70a
         y4kpNyp7rAle3Axx60PHhi6UEdug4mVpmTWaiXKH7HrgfEK/PWpxCcW0GSz76SJe4Dr9
         occhHLHIxPq0kTA95Jz5yBEygNFimb1rEmkA1gh+VV5Pqlk8iMz81SJJZ0+AJISXUxZt
         wdtaeEH1wwkn7kSP5ttEoRqBmeHlsXKKhB8JQMcokPHbGgOVheMDGjqihXZULw08wYio
         ZlNFk+yeDUGN96q/XFWEIvy11lkr81KqELV2YRixghqOF9U1I8bvBJ6ZhOrkKSss3XPz
         GONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758738971; x=1759343771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuMDAryKyhqMDr6B+XSq4gaOR0tjLhHQ+hf5EwbyoXs=;
        b=XflFBM6ihV2RlgeG8X8H1QUpbLnAI/pFQNiuWPj2xBLtOutC89LxWXcscJc7FQoIo0
         +7Q7jfJzM1UvVFIONLZ31O2JXLzAUohXEaSCphUUh8+k1In4F+S9jrPVIhNwD8dXRLXm
         GrFmIU9ZS+ZPVc76JIVePXCvjIQ0qoPM3fpTfde0Zup0WVFf7FBg9Bke01uKS2Lkh8U5
         WzNjst/UTiQJJoxdQwViMUhgIb/PtRbModRuC28KjZ/8Uj4C/jWzxCIHsj2UvX2j0c4D
         WCMD3NS/Hx+dxrRBXef8Ao9ipkisOOL6Qm4wbD8O7mryV9+ZcM2KsPytzKrUDseYLXbp
         Zgrw==
X-Forwarded-Encrypted: i=1; AJvYcCWhePMsYAqjV8A90v+Jj5qvJNM317IVj+SDgb8Vl6WMMI3TEhydAeZA7zr4dArxVlbA4sVinoZIkFIrbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoQ7TniLxiqkb03qQ+V6VAW9exXNVwdJgO6SDYHYaEbDlBvx1I
	zLuElRYUTaFPvyScYvmQlSd6kKWJ58+0e2Jr0QbP+4L05ukSawuipxwi
X-Gm-Gg: ASbGncttvNIE+hxBCu3V2Ea7vPFGRd4+bUVOib1dOHaJPsJK29lbbAfjxYUc8BTQKje
	wMi1n2UEM2YvlwsDHL5wjviAWU+KHFrMeV+K0LzeOXzyelIYmf7mPPood0TAsvNuJLVItxwEW4A
	eXLso8ePdUh6uhAcL9luKbMdd6MLKbQnoKN1u9HAb8Kicd6WjGum+kC5eNx5mpz099KFkRG6f6G
	uaWVxFr/KpE3mDfgJ4I2cgImaqDBu7M0hgLRw/EEtEPNzWt8rDbZG03lUNImEew6KHmGCnu5IdX
	IkyD0bLDPbKyfFJq02bcMmR96vLUG7sAkw9ju7+B/RmkTqdGittAVHrfuNGQSeY4VoRWYQTyqqO
	kDKaoNIFdzrx3BZNalWp0H4w=
X-Google-Smtp-Source: AGHT+IFpCuPX+NdIWL+u5IkcBx4+VbKV/4827jy+s9/WEKKxG/dZ2BXBXewNNRlOFgtg+akJrLG03A==
X-Received: by 2002:a17:902:dac5:b0:27a:6c30:49c with SMTP id d9443c01a7336-27ed4a56ba4mr5732905ad.27.1758738971104;
        Wed, 24 Sep 2025 11:36:11 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f4c4:bad6:f33e:ddc9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341bd90367sm3096304a91.5.2025.09.24.11.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 11:36:10 -0700 (PDT)
Date: Wed, 24 Sep 2025 11:36:07 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, linux-media@vger.kernel.org, 
	netdev@vger.kernel.org, linux-spi@vger.kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Javier Carrasco <javier.carrasco@wolfvision.net>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Matthias Fend <matthias.fend@emfend.at>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, UNGLinuxDriver@microchip.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Mark Brown <broonie@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v2 11/16] Input: touch-overlay - Use
 fwnode_for_each_child_node() instead
Message-ID: <amnjiro7qhreys4upoh6ggqurom6gudk2gw5ayrfjhj243wqwh@o4hf6txhsm62>
References: <20250924074602.266292-1-sakari.ailus@linux.intel.com>
 <20250924074602.266292-12-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924074602.266292-12-sakari.ailus@linux.intel.com>

On Wed, Sep 24, 2025 at 10:45:57AM +0300, Sakari Ailus wrote:
> fwnode_for_each_child_node() is now the same as
> fwnode_for_each_available_child_node() on all backends (OF, ACPI and
> swnode). In order to remove the available variants, switch the uses to
> non-available variants.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> ---
>  drivers/input/touch-overlay.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touch-overlay.c b/drivers/input/touch-overlay.c
> index b9fd82c4829d..7eaaaef1bd82 100644
> --- a/drivers/input/touch-overlay.c
> +++ b/drivers/input/touch-overlay.c
> @@ -82,7 +82,7 @@ int touch_overlay_map(struct list_head *list, struct input_dev *input)
>  	if (!overlay)
>  		return 0;
>  
> -	fwnode_for_each_available_child_node(overlay, fw_segment) {
> +	fwnode_for_each_child_node(overlay, fw_segment) {
>  		segment = devm_kzalloc(dev, sizeof(*segment), GFP_KERNEL);
>  		if (!segment) {
>  			fwnode_handle_put(fw_segment);

-- 
Dmitry

