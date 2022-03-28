Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E87E4E9856
	for <lists+linux-media@lfdr.de>; Mon, 28 Mar 2022 15:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243273AbiC1Njd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Mar 2022 09:39:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243274AbiC1Nja (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Mar 2022 09:39:30 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FAEB4CD74
        for <linux-media@vger.kernel.org>; Mon, 28 Mar 2022 06:37:48 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id q20so8422786wmq.1
        for <linux-media@vger.kernel.org>; Mon, 28 Mar 2022 06:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=X9xolOBuBIa4R0vTxvv45W6wXO+HEw6pqnTDDTRpzds=;
        b=oLet0tANev/NadSGG5WygX6a9PHbV48R0OGVzTFAK66vgaFAFv+6FEqLK0G3/3ySP4
         b/d5orpZAPqedkx1AD7rtFEyiwXnPvIQaUt3cb5bANbLFAp1PP9b3VM5x83B+LE5bpZX
         Mqfb0YdcPylnkm3GgwX0FkcVIyeIpzrHW1Ztm1YCPJWhtEm6b0R7UxTKqyLkp9X86tDh
         RTML6mUvAc9b6cJ7rPhuh5vgMUf407AdVPTSrPRQBy/Qnb76rcY+JlipO/P3K/LBqKBX
         q692XNYucimXULVF/VqoaavfK2r3MAlFNO2DaqNE8kM6/YoLSPlUhjDCWMHA+GVsdYK9
         BlPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=X9xolOBuBIa4R0vTxvv45W6wXO+HEw6pqnTDDTRpzds=;
        b=yLh4a/ab8kZ+pDdbmqgP2eLKUiVVwzF453Db4n263su34ub8R8eZmBJSUunls2W1lm
         cuQJ/MMSF3anQT2zpTuEgEWS1XEdpezWNBkvtKWy5gmMgHRaHjkUmyt5B8FYSLZ9s6I/
         oLFm7qOl6PRVnm76qZwy7m1mWKtvLiGgwdrwMTqnAmZ2jBksQ7+5mIbEYMBoDmpvt+dU
         7OPZZppT78Fb3ow5p7W73C2Va7ZpMMNIGXFbGb6G/d7VPeVgCabDUqPwnF1x0kQbZBrY
         37t898cR+YSv3HcrQZfIW6H8eVbhhV8iShcpVuO+kTWjUgDerRP5VFWK7+F2sUIBL9je
         qjaw==
X-Gm-Message-State: AOAM5315LHRf+uFxY963hBWLSZjHW5+9u0SHK0+IHiwoa6sHnQyDBeHu
        oY5aYRUva3F9qSNpxTXjTUmViQ==
X-Google-Smtp-Source: ABdhPJzgqImTJvpGFyUqZPtbBODfMsZThR+EI0nK3Vy5a8rcSuNNZ7ZoSJ0lC0b5BDudwRR5EvwIkg==
X-Received: by 2002:a05:600c:a08:b0:38c:93c8:36e9 with SMTP id z8-20020a05600c0a0800b0038c93c836e9mr36701865wmp.97.1648474666793;
        Mon, 28 Mar 2022 06:37:46 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id p14-20020a5d59ae000000b00203dcc87d39sm19694611wrr.54.2022.03.28.06.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 06:37:46 -0700 (PDT)
Date:   Mon, 28 Mar 2022 14:37:43 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Benjamin =?utf-8?B?U3TDvHJ6?= <benni@stuerz.xyz>
Cc:     andrew@lunn.ch, sebastian.hesselbarth@gmail.com,
        gregory.clement@bootlin.com, linux@armlinux.org.uk,
        linux@simtec.co.uk, krzk@kernel.org, alim.akhtar@samsung.com,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com, robert.moore@intel.com,
        rafael.j.wysocki@intel.com, lenb@kernel.org, 3chas3@gmail.com,
        laforge@gnumonks.org, arnd@arndb.de, gregkh@linuxfoundation.org,
        mchehab@kernel.org, tony.luck@intel.com, james.morse@arm.com,
        rric@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl,
        mike.marciniszyn@cornelisnetworks.com,
        dennis.dalessandro@cornelisnetworks.com, jgg@ziepe.ca,
        pali@kernel.org, dmitry.torokhov@gmail.com, isdn@linux-pingi.de,
        benh@kernel.crashing.org, fbarrat@linux.ibm.com, ajd@linux.ibm.com,
        davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
        nico@fluxnic.net, loic.poulain@linaro.org, kvalo@kernel.org,
        pkshih@realtek.com, bhelgaas@google.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-acpi@vger.kernel.org, devel@acpica.org,
        linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org,
        linux-edac@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rdma@vger.kernel.org, linux-input@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-media@vger.kernel.org,
        wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-pci@vger.kernel.org
Subject: Re: [PATCH 02/22] s3c: Replace comments with C99 initializers
Message-ID: <20220328133743.xhdzmprlc7a6jxxy@maple.lan>
References: <20220326165909.506926-1-benni@stuerz.xyz>
 <20220326165909.506926-2-benni@stuerz.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220326165909.506926-2-benni@stuerz.xyz>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Mar 26, 2022 at 05:58:49PM +0100, Benjamin St�rz wrote:
> This replaces comments with C99's designated
> initializers because the kernel supports them now.

I'm a bit puzzled by "because the kernel supports them now". Designated
initializers are not purely a C99 feature... it is also a GNU C extension
to C89. This language feature has been used by the kernel for a very long time
(well over a decade).

On other words it would be much more effective to advocate for the
change by saying "because the code is clearer and easier to read" rather
than "because we can".


> Signed-off-by: Benjamin St�rz <benni@stuerz.xyz>
> ---
>  arch/arm/mach-s3c/bast-irq.c | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c/bast-irq.c b/arch/arm/mach-s3c/bast-irq.c
> index d299f124e6dc..bd5471f9973b 100644
> --- a/arch/arm/mach-s3c/bast-irq.c
> +++ b/arch/arm/mach-s3c/bast-irq.c
> @@ -29,22 +29,22 @@
>   * the irq is not implemented
>  */
>  static const unsigned char bast_pc104_irqmasks[] = {
> -	0,   /* 0 */
> -	0,   /* 1 */
> -	0,   /* 2 */
> -	1,   /* 3 */
> -	0,   /* 4 */
> -	2,   /* 5 */
> -	0,   /* 6 */
> -	4,   /* 7 */
> -	0,   /* 8 */
> -	0,   /* 9 */
> -	8,   /* 10 */
> -	0,   /* 11 */
> -	0,   /* 12 */
> -	0,   /* 13 */
> -	0,   /* 14 */
> -	0,   /* 15 */
> +	[0]  = 0,
> +	[1]  = 0,
> +	[2]  = 0,
> +	[3]  = 1,
> +	[4]  = 0,
> +	[5]  = 2,
> +	[6]  = 0,
> +	[7]  = 4,
> +	[8]  = 0,
> +	[9]  = 0,
> +	[10] = 8,
> +	[11] = 0,
> +	[12] = 0,
> +	[13] = 0,
> +	[14] = 0,
> +	[15] = 0,

Shouldn't this just be as follows (in order to match bast_pc104_irqs)?

+static const unsigned char bast_pc104_irqmasks[16] = {
+	[3]  = 1,
+	[5]  = 2,
+	[7]  = 4,
+	[10] = 8,
 };
 
 static const unsigned char bast_pc104_irqs[] = { 3, 5, 7, 10 };


Daniel.
