Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3885233710
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 19:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727727AbfFCRqz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 13:46:55 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51147 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727677AbfFCRqy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 13:46:54 -0400
Received: by mail-wm1-f65.google.com with SMTP id f204so8127781wme.0
        for <linux-media@vger.kernel.org>; Mon, 03 Jun 2019 10:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:cc:subject:message-id:in-reply-to
         :date:mime-version;
        bh=qKNlVeAyFTbklreXBwf9zfQH2XJQXbRztPyMtcmfFi8=;
        b=mOhSyhW7iGHeTeU2DvH2vJASeZnsiUTxuzJR+BCBZp6tT6kMNTWkPBuT78Fj93Fsbd
         om/z68dTo7+XdfArYANfXBULFw0FaGFHohzDgcRlvzIsSNh5rBkcuOlSIUceAm2a839C
         TlsFv7VCW+AOvTJdfpuD1zISLKx8Y0ro/R5wlF4A0vT/intx9rYXaCas13yKV5pF9P67
         txVrmPThivFaumjpZMc/iK6jvWlUckt1Mn2SE3YIjStoqsxVeUcp53wTH0Ifc1/08zrE
         6hov8z04AMeM/CrsagHk4VtfKa9K3jI7puT2MNn4JPf4DGZOrxoefNRLRX0fDPDUyBOW
         pChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :message-id:in-reply-to:date:mime-version;
        bh=qKNlVeAyFTbklreXBwf9zfQH2XJQXbRztPyMtcmfFi8=;
        b=gbtJR/u7+pcl1y3pfNdVjH3iN50YO1F9D99nuoJwXYcfC39qNgPvfL8Oze7HL3KY38
         h/gZ0j8wfQf3AkLeEm7h+Ug8JnvuGeHIC8nfmebGp6AqJP4R+1CCrfKku7+bvzIzDa/r
         tl+VQLbH863dZ36kVHiQ570R0LqrQfYLNnhRj9vdIWOSv2zw3zt2cPrAS6ShAqKyZ67x
         n2tU3wU1szsfX/u4yZDAf121y8CgNnE9QUx/fOCKgM/pKz5wYhbWOTdtj7a/nzQdDVPC
         TEBqAtpY6oMCTihBQM0nvJIjWMfRJC8STt6Zy0wLSssImQOtzhbAcFfQq7mudr/yGA3Y
         DZ+g==
X-Gm-Message-State: APjAAAXv+cZxBuldep1FMeHYlk1niSHvWGLLuf0HHIfBf8mAHuFgyMai
        ZeGdWQ7HN/LBR8T+jtRtvooEHIV2Owc=
X-Google-Smtp-Source: APXvYqxoEC1aXJ0AW03c1SY13Q1sRcOQ4bamPjxUFUFgeacYPSc85pRzg0tXdTUc3U9vLrQ7Mv/AGA==
X-Received: by 2002:a1c:c8:: with SMTP id 191mr3154274wma.6.1559584012538;
        Mon, 03 Jun 2019 10:46:52 -0700 (PDT)
Received: from arch-late ([87.196.73.160])
        by smtp.gmail.com with ESMTPSA id a139sm25350225wmd.18.2019.06.03.10.46.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 03 Jun 2019 10:46:51 -0700 (PDT)
References: <20190531174506.13251-1-festevam@gmail.com>
User-agent: mu4e 1.2.0; emacs 27.0.50
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     hverkuil-cisco@xs4all.nl, p.zabel@pengutronix.de,
        slongerbeam@gmail.com, linux-media@vger.kernel.org
Subject: Re: [PATCH 1/3] media: imx7-mipi-csis: Propagate the error if clock enabling fails
Message-ID: <m3lfyia7fg.fsf@gmail.com>
In-reply-to: <20190531174506.13251-1-festevam@gmail.com>
Date:   Mon, 03 Jun 2019 18:46:47 +0100
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Oi Fabio,
On Fri 31 May 2019 at 18:45, Fabio Estevam wrote:
> Currently the return value from clk_bulk_prepare_enable() is checked,
> but it is not propagate it in the case of failure.
>
> Fix it and also move the error message to the caller of
> mipi_csis_clk_enable().
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Thanks for the 3 patches. for all of them:
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

---
Cheers,
        Rui

> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index 042837b8ea28..1b538ae77364 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -456,13 +456,9 @@ static void mipi_csis_set_params(struct csi_state *state)
>  			MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW_CTRL);
>  }
>
> -static void mipi_csis_clk_enable(struct csi_state *state)
> +static int mipi_csis_clk_enable(struct csi_state *state)
>  {
> -	int ret;
> -
> -	ret = clk_bulk_prepare_enable(state->num_clks, state->clks);
> -	if (ret < 0)
> -		dev_err(state->dev, "failed to enable clocks\n");
> +	return clk_bulk_prepare_enable(state->num_clks, state->clks);
>  }
>
>  static void mipi_csis_clk_disable(struct csi_state *state)
> @@ -989,7 +985,11 @@ static int mipi_csis_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>
> -	mipi_csis_clk_enable(state);
> +	ret = mipi_csis_clk_enable(state);
> +	if (ret < 0) {
> +		dev_err(state->dev, "failed to enable clocks: %d\n", ret);
> +		return ret;
> +	}
>
>  	ret = devm_request_irq(dev, state->irq, mipi_csis_irq_handler,
>  			       0, dev_name(dev), state);

