Return-Path: <linux-media+bounces-25824-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A130A2D3BA
	for <lists+linux-media@lfdr.de>; Sat,  8 Feb 2025 05:19:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB17916AC72
	for <lists+linux-media@lfdr.de>; Sat,  8 Feb 2025 04:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3259C18CBFC;
	Sat,  8 Feb 2025 04:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N4M784u8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C611684A4
	for <linux-media@vger.kernel.org>; Sat,  8 Feb 2025 04:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738988340; cv=none; b=URSF8GK8iwygK/dpfIOcCdY1bbkR+890mTEzHtveiX0+O4RZIsPVHkwKjFbgOpPYN1/yzkiPva8dUhGdAy6E2YO7EKZEGmGMSx4l8FPgtDYnKpNIU+l3jEuROmkDkeSbrzo0ZFTWs7A0CfYtiUpxPFuWuak36pY482EZ7j7XDII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738988340; c=relaxed/simple;
	bh=KdB7unTaRB+08sCb4aq5s8sHrp/mi1wRkkb0qmR8Ve0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/2SY/x4EDk00IKjupDsdOIaW0QewOfBifidJqmH3cj+fD9XIk1liao31QGGEjfWveTZ+T4W6RW2cDFugeicBwgpQhsXqmpgFtARPKE0GZnnlZN5vVWMaRh6kRbLXjf65u6RAKiHzxv3NITkVCUN00uye41TMWMC0hZaSbKK6vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N4M784u8; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ab771575040so509340666b.1
        for <linux-media@vger.kernel.org>; Fri, 07 Feb 2025 20:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738988337; x=1739593137; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rJnBLg+2EMCubVxOzepIpdcBMB6agbuUnEZ2sZAa12A=;
        b=N4M784u8Raod907ElfgcT1zGd/dtOkC3WJh2PzVgiqRO+0d8JurpuFkx8DRkPdem/D
         jB3qAtfhSAHtHRIXPWBg8wXjJQ2fuXPuBTangUDvYr4agMgwmebwWaPx6eJU2Z41Ywth
         D6uibBT8ZuEHQcyaneW/z9DppQp5pBiE8LKWwMsmkYquRbfO2Ciu6WjKwtUGniezC24m
         cAQ3vNf39FDQAMddyjIYU6z7KBLY+D0+YvFRK2W0zfq0GELfPgbhRtgJLX5cMRxriumG
         6lojtcIiRrMUOJnNKy7EYdAh7PXarEsljs3IaAARcrduP0qh+rUNAwRu9EGk+h99lzO5
         CS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738988337; x=1739593137;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJnBLg+2EMCubVxOzepIpdcBMB6agbuUnEZ2sZAa12A=;
        b=eN7UvkDcnio4E4/y/IKawkd93PRQvkqeWT/FNSZU7qC+2ZWVODnV1tg4ci07BZOu2j
         OCrhEdJ9XdvNf9tSy7DxQ0S9wjWGu2Z6dXyaACozhWSV7q2DT20k+f3xkq4FYaxNemj4
         j0bFXfrDP1YqC4amkHeRCWmXTnTKHXmC55hS+mCzvaJKZIaL1nPL3yLNomsu7/EGUwEt
         VpqZro/1BumNkrWqbvVDOFVxVz7UZ6cyemdbY8KCseozCFzX6dCP365L2pHONcAxWiJI
         APM4rwAnjbdVPbLFaPvpP7sV41hQ+6+qs2jsfH1IeBTxPFA7uwnhUlDnOBMD+3FP3nAo
         zwDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1/gBbDJts2N/qzd2aGU40Q4o/2x2s3gD7gXEjsbXneexgIrvWxPemc0/y8hric1LgyHm954M5GE4W6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdHYtrxd3YIzHwFq6uxHhE/tsjXQyqqo01kVV8487hAIoCRSY5
	WD37KYjuUDEWQPjJc6vjASkKiwJyeHyxpFJkuPUk4/c5zWT/JKs3VsCgJpzqsK8=
X-Gm-Gg: ASbGncuDiEu7nThItm/wvHfF5nwvAX+htCllourQq9l3yWmUN9+ekcuLiirDDvS51Ac
	CNe7AChg3qpygccemDPkf4oj9cRYZf4Diqb+JDkMtWfVok1LOYlB7XjBbl3/c6sjXV9YEMWd3ez
	H/fVJWSJRniimudkElNMVw8D+ASPRyzv/zEOfGn4kIX5B/Y+CusCEfmmDbjj7BzrmsVdqgyesSX
	8ihw5qD2YeOiKyFoJVtLau/gjI/iGqVxmU7JXpOorz1P0A8YX9FnAXKlPGCKevVEXuOPZAqqEyH
	9h/JyYXVLROeqaBaGMWD
X-Google-Smtp-Source: AGHT+IHn89AYm8QeUz9PnuTAmBi0sjoUrl44qsoKpOAlveTucLfggPm9SdbIhHVoYrkXGlxj1n8EoQ==
X-Received: by 2002:a17:907:2ce3:b0:ab6:f4eb:91aa with SMTP id a640c23a62f3a-ab76e896c0cmr1077297866b.10.1738988336641;
        Fri, 07 Feb 2025 20:18:56 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ab7732e7120sm391127366b.91.2025.02.07.20.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 20:18:55 -0800 (PST)
Date: Sat, 8 Feb 2025 07:18:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "zhangzekun (A)" <zhangzekun11@huawei.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>, robh@kernel.org,
	saravanak@google.com, justin.chen@broadcom.com,
	florian.fainelli@broadcom.com, andrew+netdev@lunn.ch,
	kuba@kernel.org, kory.maincent@bootlin.com,
	jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	olteanv@gmail.com, davem@davemloft.net, taras.chornyi@plvision.eu,
	edumazet@google.com, pabeni@redhat.com, sudeep.holla@arm.com,
	cristian.marussi@arm.com, arm-scmi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-media@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	chenjun102@huawei.com, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: Re: [PATCH 1/9] of: Add warpper function
 of_find_node_by_name_balanced()
Message-ID: <be93486b-91bb-4fdd-9f6c-ec295c448476@stanley.mountain>
References: <20250207013117.104205-1-zhangzekun11@huawei.com>
 <20250207013117.104205-2-zhangzekun11@huawei.com>
 <Z6XDKi_V0BZSdCeL@pengutronix.de>
 <80b1c21c-096b-4a11-b9d7-069c972b146a@huawei.com>
 <20250207153722.GA24886@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ZyGJHelXDmJEw393"
Content-Disposition: inline
In-Reply-To: <20250207153722.GA24886@pendragon.ideasonboard.com>


--ZyGJHelXDmJEw393
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 07, 2025 at 05:37:22PM +0200, Laurent Pinchart wrote:
> I'm tempted to then rename of_find_node_by_name() to
> __of_find_node_by_name() to indicate it's an internal function not meant
> to be called except in special cases. It could all be renamed to
> __of_find_next_node_by_name() to make its behaviour clearer.
> 

Adding "next" to the name would help a lot.

Joe Hattori was finding some of these bugs using his static checker.
We could easily write something really specific to find this sort of
bug using Smatch.  If you have ideas like this feel free to ask on
smatch@vger.kernel.org.  It doesn't find anything that your grep
didn't find but any new bugs will be detected when they're introduced.

regards,
dan carpenter

--ZyGJHelXDmJEw393
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=err-list

drivers/net/ethernet/broadcom/asp2/bcmasp.c:1370 bcmasp_probe() warn: 'dev->of_node' was not incremented
drivers/net/pse-pd/tps23881.c:505 tps23881_get_of_channels() warn: 'priv->np' was not incremented
drivers/media/platform/qcom/venus/core.c:301 venus_add_video_core() warn: 'dev->of_node' was not incremented
drivers/regulator/tps6594-regulator.c:618 tps6594_regulator_probe() warn: 'tps->dev->of_node' was not incremented

--ZyGJHelXDmJEw393
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="check_of_find_node_by_name.c"

/*
 * Copyright 2025 Linaro Ltd.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, see http://www.gnu.org/copyleft/gpl.txt
 */

#include "smatch.h"

static int my_id;

static void of_find_node_by_name(struct expression *expr, const char *name, struct symbol *sym, void *data)
{
	if (!refcount_was_inced_name_sym(name, sym, "->kobj.kref.refcount.refs.counter"))
		sm_warning("'%s' was not incremented", name);
}

void check_of_find_node_by_name(int id)
{
	my_id = id;

	if (option_project != PROJ_KERNEL)
		return;

	add_function_param_key_hook_early("of_find_node_by_name", &of_find_node_by_name, 0, "$", NULL);
}

--ZyGJHelXDmJEw393--

