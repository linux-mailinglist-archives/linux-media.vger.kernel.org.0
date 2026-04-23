Return-Path: <linux-media+bounces-59443-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SI0RLQOS6mmE0wIAu9opvQ
	(envelope-from <linux-media+bounces-59443-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 23:41:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E81457F0D
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 23:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B8150300B5B7
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 21:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72EEB288C2D;
	Thu, 23 Apr 2026 21:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGt1z0Bb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0FA332EA0
	for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 21:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776980478; cv=none; b=rwjD2BSwI0DbG7LbT/aGO7NJYm7/P4BYmzz+CUFsxW9TsJkdzrwqZmRPSM2mvo1dyQDrZ98pizevIxPWbkoFX5H+1pgv02oz0nK5HPvbXPVhUQwUUplktEPMDTE6N60sNoVDPwSLhkOnX+E7wscU4ZLbdW23X5iL9VOkOxL3yPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776980478; c=relaxed/simple;
	bh=JEKsVBcRrDVMqqbEs7/mfp7dXa3KIoMMkKfmuqiHclA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cc0pc3KD2LPpn5rj+eRIGXkQeSleEB4uspbu1w18CK04AIfw4hMAmJFKuKypZQ5fWV7DNZt3zzyVE6kZFLSVIyJP4KjCLNDnLH10+Tk4y6cNkknJO85/Uoe4tHZ+rTC8WLEbjqzncRGshU+hTu3Qk4P26WNpDNTwzkWzVjHF5LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGt1z0Bb; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso57073885e9.0
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 14:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776980476; x=1777585276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rqvuiv9xtBmAtPWBpCuwRI/0uOECtqSe1ZKpqdrsv0M=;
        b=dGt1z0Bb6OCe4GXdGDr6aS37EcNhZY90lPrto8aEpcG1zcBkMQJAKgwpAfnDsuWpAc
         xGEA11WQiyk7qswzig4UYpB3P/EJsOfzCf6E/JC8AdxYUVMjfodAglvhmjZXSxREXMpU
         ycw4Mc8vRvrPV8sONdOm09uFzZNBjdXiaDSRCL9qJ0uaFmnkWl3eZS5WZqTYxvXqC6vP
         VtUSZb625EPMp2lMBI/bTpMcG+So0mYbt9ewEniSnjpv5qoG86Uab73K2VGw+px64l6R
         p+Fpp3aBwgtt/slWoG0V10Gh1Jf7Dy9AuVt/3Ha7Mf6dVImzl0UB9Visumg/08z9KVLJ
         MOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776980476; x=1777585276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rqvuiv9xtBmAtPWBpCuwRI/0uOECtqSe1ZKpqdrsv0M=;
        b=lcEq6Mta8EIcoVSy16XJ9POUuCTKBNUPPs1ZrVduIu5XAS2J718QAZxof1RTq5FkW3
         ct6Djky8e0Mz2kMAT1QbZ/AZml3si8ifUIWjgs3M6zxny0fHgNP/L1BZRQrbEUPS34zp
         5H73hJvpk1qLpmZGwMCQNcXJ46hlCpQ0bcp8epG9ZfiYw3NjmkNBUkYdBWPNHPorwqlh
         wLB974kZS4fW9xKz/PLacv9MxQflfX+4I8MgQXMnak7dXd4kRRNc5SbqJWd4QNOkZhmE
         SzCPhMdM2fXm7xfyADKJbz9vvsEO95mqh0AlfKdX4siqQEl1dO7e4QiKpqJ8NnigIc1i
         d70g==
X-Forwarded-Encrypted: i=1; AFNElJ80QtZH3x2fyrmAU0qZU5UMpuwwetxauqmrez2WT3ZEAD7ZXcY14GDp+cGW+HvjJ42+2cscbUWuAsPLNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdIbsVOX5cEKhxmRmSvgbvpFz9mXrc+fGZI1bmaQFOHW4Z3UM0
	p/NlmSItbRa9rAeAACS3XNR1qXuyu3n8Amr3oZLvc/t22pR2MclpvwN9
X-Gm-Gg: AeBDieu1EAAqLjfTWFq4fuO/bhoUvW5HFs6C4L3jzJ2q5GThwGwlaPuwC+JKXhSKiy9
	uSsUyOKgVkFiSwhubHNqFhiFJBn7qTBBHRXYN1/dNcFvqPnqZWDm167YeSgui2BVOvPtjGk5YWH
	D6T4tuvoM4YsC72nhIU/oH529JfYBIypR9PbKN6S96ryOmSV6MsKqhbzPreC8uTN7EoCwgk//eB
	PSwWYebIdt15U7UQoiA8A3r9hQecq7KBZvtPQUQaNI+LzeWVbq2UNfqGBWYCgaSN64DfRzYuK1X
	70gYhCsL9xj3mu1DMdpJ/W8MXT+Of5H+sZBE37MZ6vt1DBaTwgMXCXUPN3Ehq/GqLtsTx5HceZz
	XyMyLD2tbkTk3s91yt8HKGzJ6U9Oj/c4M4w1lc5VFvHFxxpzLRwxDbYYLA/n0QnUx2o3vN8AInc
	kFouysiQHiJocLy70+Evzc69J3gG5H+osHLlvGLdj9gvl75+1FLuAVxD6eTvA2ncsH5a7wPhQeh
	7I=
X-Received: by 2002:a05:600d:8454:b0:48a:5970:2003 with SMTP id 5b1f17b1804b1-48a59702216mr106747235e9.3.1776980475822;
        Thu, 23 Apr 2026 14:41:15 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb75a913sm166466805e9.12.2026.04.23.14.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 14:41:15 -0700 (PDT)
Date: Thu, 23 Apr 2026 22:41:13 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nick Spooner <nicholas.spooner@seagate.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
 andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: media: atomisp: Use str_on_off() to fix
 Coccinelle warning
Message-ID: <20260423224113.643cddc5@pumpkin>
In-Reply-To: <20260423194727.3200344-1-nicholas.spooner@seagate.com>
References: <20260423194727.3200344-1-nicholas.spooner@seagate.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59443-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,seagate.com:email]
X-Rspamd-Queue-Id: 58E81457F0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 23 Apr 2026 13:47:27 -0600
Nick Spooner <nicholas.spooner@seagate.com> wrote:

> Fixes the following Coccinelle warning reported by string_choices.cocci:
> 
> 	opportunity for str_on_off(on)
> 
> Signed-off-by: Nick Spooner <nicholas.spooner@seagate.com>
> ---
> Changes in v2:
>   - Include "media" in the subject line.
> 
>  drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> index 4026e98c5845..322eca4a3755 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> @@ -13,6 +13,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/gpio.h>
>  #include <linux/platform_device.h>
> +#include <linux/string_choices.h>
>  #include "../../include/linux/atomisp_platform.h"
>  #include "../../include/linux/atomisp_gmin_platform.h"
>  
> @@ -917,7 +918,7 @@ static int gmin_acpi_pm_ctrl(struct v4l2_subdev *subdev, int on)
>  		return 0;
>  
>  	dev_dbg(subdev->dev, "Setting power state to %s\n",
> -		on ? "on" : "off");
> +		str_on_off(on));

While someone went to the trouble of adding the 'helper' and the Coccinelle
warning; I'm not really convinced it actually improves the code.
It doesn't even do &"off\0on"[on_off * 4] - which might be an excuse
for a helper.

	David

>  
>  	if (on)
>  		ret = acpi_device_set_power(adev,
> @@ -930,7 +931,7 @@ static int gmin_acpi_pm_ctrl(struct v4l2_subdev *subdev, int on)
>  		gs->clock_on = on;
>  	else
>  		dev_err(subdev->dev, "Couldn't set power state to %s\n",
> -			on ? "on" : "off");
> +			str_on_off(on));
>  
>  	return ret;
>  }


