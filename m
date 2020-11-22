Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D71132BC573
	for <lists+linux-media@lfdr.de>; Sun, 22 Nov 2020 12:51:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727444AbgKVLvB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Nov 2020 06:51:01 -0500
Received: from retiisi.eu ([95.216.213.190]:56270 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727318AbgKVLvA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Nov 2020 06:51:00 -0500
Received: from valkosipuli.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A4F7A634C24;
        Sun, 22 Nov 2020 13:50:28 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kgnsy-0001Fz-Vy; Sun, 22 Nov 2020 13:50:28 +0200
Date:   Sun, 22 Nov 2020 13:50:28 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, newbytee@protonmail.com,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-media@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/2 v5] leds: rt8515: Add Richtek RT8515 LED driver
Message-ID: <20201122115028.GB4351@valkosipuli.retiisi.org.uk>
References: <20201113124239.2667502-1-linus.walleij@linaro.org>
 <20201113124239.2667502-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113124239.2667502-2-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

Thanks for the update.

On Fri, Nov 13, 2020 at 01:42:39PM +0100, Linus Walleij wrote:
...
> +static int rt8515_led_flash_strobe_set(struct led_classdev_flash *fled,
> +				       bool state)
> +{
> +	struct rt8515 *rt = to_rt8515(fled);
> +	struct led_flash_setting *timeout = &fled->timeout;
> +	int brightness = 4; /* max 16 */

Just a question on the unit --- did the other spec shed any light on what
the relation between this setting and the current might be?

But if it's not known, or even estimated, then I guess you could use these
values.

4 seems like a random number though. I'd use maximum as the default.

-- 
Sakari Ailus
