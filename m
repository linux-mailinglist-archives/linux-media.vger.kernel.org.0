Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDD49CF558
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 10:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729784AbfJHIyd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 04:54:33 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54412 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728866AbfJHIyd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 04:54:33 -0400
Received: by mail-wm1-f68.google.com with SMTP id p7so2214041wmp.4;
        Tue, 08 Oct 2019 01:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:subject:in-reply-to:date:message-id
         :mime-version;
        bh=jPjc7kEf9F+Pv9xjqePtdYZ594Xw4pebrrSpcO4H5N4=;
        b=VXbQXbEiRyeIqlW0AZpSfsqRElc3PukoxYh/xW9e2HGTceQ5yawq4mum9YQutGvzhI
         0RLQSx6WZ33d1ebeiZyKWg2KdYU/hzjwfAl++HsNPCDFIQqrqlqOsSoazQWcJlJL01tZ
         38ZpAVJ1R0scyy+S3wEqiI4JfYYMuasN8lYUUevJ4vsryturfwddfvGSXJzd07fbiyan
         7tOI/H0Ghup0R9vvIp6Fg0bYBmAbF4+7ZfZ+Z+wLJBwr0dnnvfeVNXxhGu/uNm6c7ShG
         N01T7YXz96jpOGivMBq7UDtFKrLnuzCJc1p78wOZXdkkJnsUNR4RoJvNiZh0w37P0yiw
         wGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:subject
         :in-reply-to:date:message-id:mime-version;
        bh=jPjc7kEf9F+Pv9xjqePtdYZ594Xw4pebrrSpcO4H5N4=;
        b=lTAPMoZURrCtcI0+kqfEAgDDZ0SWDzuxQ53S5dzerYFqugd+FJMFngrqkFxFeFfkZh
         cJp8CJUI5yOEd+dF/RLVFrcMDM6hb9TQLk60oDaQvXOIxZi09pmXMIhK//HMGmhLOOHR
         UPVoDRiZK7LobeMP2mqeAfLFaOhaHWPP11U/snh1xCy+fqtoTZ3Ib5hKEksz5xWibUeb
         ab+DgqR/dXrVXNlH8HtX5nG6/xYitDn+sOEBeeliu4k2f/rOZq9rS8iLfZ8bAt7KvFAI
         4STjppObRDrZiXh2GxW9gwGtSgy2N4iQYP/3krkvUgLK+3I4Bp8ZKMP6Zii9PdkO1HU4
         wXEA==
X-Gm-Message-State: APjAAAUtCExvXk6TzwOWHmWXNqMD8Pu1QkJXkqggJfbCJo4jeyXNtqEV
        Z4r9uh5Fv87G9k2gdLuAgPRero39
X-Google-Smtp-Source: APXvYqy/HvGfAU/ArSF6LuxodfAOeqkQ5yg5iRJ5pMsJAj0kWWuPbGswQqfOhH3/3PSGAbUKm97rGA==
X-Received: by 2002:a05:600c:305:: with SMTP id q5mr2772331wmd.67.1570524869566;
        Tue, 08 Oct 2019 01:54:29 -0700 (PDT)
Received: from arch-late (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id g185sm1948555wme.10.2019.10.08.01.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 01:54:28 -0700 (PDT)
References: <1570515459-25609-1-git-send-email-hariprasad.kelam@gmail.com>
User-agent: mu4e 1.2.0; emacs 27.0.50
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Hariprasad Kelam <hariprasad.kelam@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: imx: make use devm_platform_ioremap_resource
In-reply-to: <1570515459-25609-1-git-send-email-hariprasad.kelam@gmail.com>
Date:   Tue, 08 Oct 2019 09:54:26 +0100
Message-ID: <m3lftv62il.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hariprasad,
Thanks for the patch
On Tue 08 Oct 2019 at 07:17, nobody wrote:
> From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
>

Something went wrong formating the patch email, no To: nor From:

>
> fix below issue reported by coccicheck
> drivers/staging//media/imx/imx7-mipi-csis.c:973:1-12: WARNING: Use
> devm_platform_ioremap_resource for state -> regs
>

Sorry, but someone else, Jeeeun, already sent a patch for this
[0]. Thanks anyway.

---
Cheers,
	Rui


[0]: https://lore.kernel.org/linux-media/m3wodvgec4.fsf@gmail.com/

>
> Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index 73d8354..bf21db3 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -947,7 +947,6 @@ static void mipi_csis_debugfs_exit(struct csi_state *state)
>  static int mipi_csis_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	struct resource *mem_res;
>  	struct csi_state *state;
>  	int ret;
>
> @@ -969,8 +968,7 @@ static int mipi_csis_probe(struct platform_device *pdev)
>  	mipi_csis_phy_init(state);
>  	mipi_csis_phy_reset(state);
>
> -	mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	state->regs = devm_ioremap_resource(dev, mem_res);
> +	state->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(state->regs))
>  		return PTR_ERR(state->regs);

