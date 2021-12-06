Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F8514697A4
	for <lists+linux-media@lfdr.de>; Mon,  6 Dec 2021 15:01:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245003AbhLFOEa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Dec 2021 09:04:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231828AbhLFOEa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Dec 2021 09:04:30 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DEAAC061746
        for <linux-media@vger.kernel.org>; Mon,  6 Dec 2021 06:01:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0C3DFB810A6
        for <linux-media@vger.kernel.org>; Mon,  6 Dec 2021 14:01:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3429C341C1;
        Mon,  6 Dec 2021 14:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638799258;
        bh=xcASyWKxGrPws4hVBTQ7dIrqxE5ere1hTU4KHIlXEQs=;
        h=Date:From:To:Subject:In-Reply-To:References:From;
        b=l2KfzGNRl/QK6CG6QXqHf6e4XyKZOOQCj8cpHZvVh4vJjP384E7/IzO//VZddyZWp
         cvr51yV37JNcRu2xB7+kkwuR0xJILXzLXMic9rHKUmp5B0hzHo7TiDnapyBS5TBzG+
         pVnCZipyTKXQsoSsFX/bNCTIuNDaJVBLTk7gyNkS+1DJb7dIYuD7cO7rP0q3ZehE+d
         FXPf1IAD26p0/hz2HNXQRf+/MT7tIxHBhCKXl4b4Ow+hCei+Rf7iPsHbItAt7mbUk1
         mMS0KHuAf7pU5Zv98Flgtswf6xhwIsJTwFoxf4Ak1r+CmnjwB2QbqXdpYeNc9SOU/U
         3bBS7M4093B0A==
Date:   Mon, 6 Dec 2021 15:00:55 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Robert Schlabbach <robert_s@gmx.net>, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: si2157: Add optional firmware download
Message-ID: <20211206150055.43043b53@coco.lan>
In-Reply-To: <trinity-0a2519c2-0c5d-4006-9aed-48fcd48cff8b-1638393058526@3c-app-gmx-bap03>
References: <trinity-0a2519c2-0c5d-4006-9aed-48fcd48cff8b-1638393058526@3c-app-gmx-bap03>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

Em Wed, 1 Dec 2021 22:10:58 +0100
Robert Schlabbach <robert_s@gmx.net> escreveu:

> The Si2157 (A30) is functional with the ROM firmware 3.0.5, but can also
> be patched at runtime, e.g. to firmware 3.1.3. However, although a
> firmware filename for its firmware patch exists, that has only been used
> for the Si2177 (A30) so far (which indeed takes the binary identical
> firmware patch).
> 
> Add support for downloading firmware patches into the Si2157 (A30), but
> make it optional, so that initialization can succeed with and without a
> firmware patch being available. Keep the use of request_firmware() for
> this purpose rather than firmware_request_nowarn(), so that the warning
> in the log makes users aware that it is possible to provide a firmware
> for this tuner.
> 
> The firmware patch is probably also optional for other (if not all)
> tuners supported by the driver, but since I do not have the others
> available to test, they are kept mandatory for now to avoid regressions.

This patch seems too risky. While I don't know the specifics of this
specific chipset, usually the ROM is on a separate chip that may or
may not be present. It may even have an unusable or problematic
firmware, depending on when the firmware was flashed.

What it could make sense, instead, would be to have a smarter error
logic that would:

	1. print an error/warn message if the firmware file was
	   not found;

	2. check if the device already come with a firmware that
	   it is known to work. On such case, allows the init
	   to proceed;

	3. if no firmware or too old/broken firmware, return an
	   error.

Regards,
Mauro

> 
> Signed-off-by: Robert Schlabbach <robert_s@gmx.net>
> ---
>  drivers/media/tuners/si2157.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.c
> index 75ddf7ed1faf..757b27d1605a 100644
> --- a/drivers/media/tuners/si2157.c
> +++ b/drivers/media/tuners/si2157.c
> @@ -85,6 +85,7 @@ static int si2157_init(struct dvb_frontend *fe)
>  	struct si2157_cmd cmd;
>  	const struct firmware *fw;
>  	const char *fw_name;
> +	unsigned int fw_required;
>  	unsigned int chip_id, xtal_trim;
> 
>  	dev_dbg(&client->dev, "\n");
> @@ -151,6 +152,10 @@ static int si2157_init(struct dvb_frontend *fe)
>  	#define SI2146_A10 ('A' << 24 | 46 << 16 | '1' << 8 | '0' << 0)
>  	#define SI2141_A10 ('A' << 24 | 41 << 16 | '1' << 8 | '0' << 0)
> 
> +	/* assume firmware is required, unless verified not to be */
> +	/* only the SI2157_A30 has been verified not to yet */
> +	fw_required = true;
> +
>  	switch (chip_id) {
>  	case SI2158_A20:
>  	case SI2148_A20:
> @@ -159,10 +164,13 @@ static int si2157_init(struct dvb_frontend *fe)
>  	case SI2141_A10:
>  		fw_name = SI2141_A10_FIRMWARE;
>  		break;
> +	case SI2157_A30:
> +		fw_name = SI2157_A30_FIRMWARE;
> +		fw_required = false;
> +		break;
>  	case SI2177_A30:
>  		fw_name = SI2157_A30_FIRMWARE;
>  		break;
> -	case SI2157_A30:
>  	case SI2147_A30:
>  	case SI2146_A10:
>  		fw_name = NULL;
> @@ -184,6 +192,9 @@ static int si2157_init(struct dvb_frontend *fe)
>  	/* request the firmware, this will block and timeout */
>  	ret = request_firmware(&fw, fw_name, &client->dev);
>  	if (ret) {
> +		if (!fw_required)
> +			goto skip_fw_download;
> +
>  		dev_err(&client->dev, "firmware file '%s' not found\n",
>  				fw_name);
>  		goto err;
> --
> 2.17.1
> 



Thanks,
Mauro
