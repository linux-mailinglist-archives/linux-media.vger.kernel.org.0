Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A35A4280DFB
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 09:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbgJBHTm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 03:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbgJBHTm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Oct 2020 03:19:42 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C9D8C0613E2
        for <linux-media@vger.kernel.org>; Fri,  2 Oct 2020 00:19:40 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id t17so570499wmi.4
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2020 00:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eXLkoTCaKkFzFdlCQExpbf/UPZPndY4duZvrptt9aDU=;
        b=vvg+Cl0WFinXG8SxGVzQBrunVpw0ikon3TeHvCRD5uw2L2gv7zfDPJ1aNJqL4+N31S
         jrMHKFu7awaakD0lMU6rdwjFwqMPwXMirstXdU5RGUZvIFccD8AIouYxLgFwOoG9hz1x
         xO93UbD34EuKmsoJxtFJ8GZmEViwj4FgJYE2q6Eb6uHjKljqL+TcRcBa+ilM6E61Rur+
         gJuzv+d7rcqHQ+9jgeazY7vq3IgtI/bqEG1c+QcbVBjbjmbjYZKKCjNfueMlzkhym9Rk
         i0ttEZtjjOidV/1SDRkTi3LrEvV72x7jBpW42RXSjy2ctTMQ2LrygsWqayHX4rWfvFLV
         X3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eXLkoTCaKkFzFdlCQExpbf/UPZPndY4duZvrptt9aDU=;
        b=lrZbmtiRAn2U9+WZelbYPJKwiF3BaXuYQljgduubngJEL2ijqB3UcS3baDh7IzNaAO
         Wx+SuDnFtrQSquTiwXpvm2vaW0f3vp05LBw+XSizIieR1bXvXO2FG/rqM1KUWO6+N7ep
         iqZre749ag3DLgXrgkEYC5O0PgZDYJGj7uE6o5zFz16m8J+5gEmQMdama7b7evHNbAa9
         QeW8asNqki2TNYXQhebJa/MtR6ZYcq1TUO0cGIGK5+EHvevXUo00J2ptxVPs82tRmVir
         Qdz3Uc4GyXdg3cFaycBhebjFCCexNjG3ODDTYqLKJiMTasrWLyl9JmpW/u57+qkrqBtY
         JVrA==
X-Gm-Message-State: AOAM533FqK1cUjvhcT+u8lTwhXsck4d+wEukUGg8dfB3l80dYQO39pod
        /KCVCKwqQtLmbFj7PiaxLpdm8A==
X-Google-Smtp-Source: ABdhPJw6UdK6EvbrCZR9oI7Y/lj0ixmOJb1GySty9GkBuhkr6xkCMVcUsziw1dtnOiTiE13IAzjMWA==
X-Received: by 2002:a1c:f619:: with SMTP id w25mr1209094wmc.62.1601623178852;
        Fri, 02 Oct 2020 00:19:38 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id v204sm757860wmg.20.2020.10.02.00.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 00:19:38 -0700 (PDT)
Date:   Fri, 2 Oct 2020 09:19:36 +0200
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        mjpeg-users@lists.sourceforge.net
Subject: Re: [PATCH 2/3] media: zoran: get rid of an unused var
Message-ID: <20201002071936.GB15586@Red>
References: <21fd8f12edb27d269eefdbea172aa3a80e2aa6ce.1601544491.git.mchehab+huawei@kernel.org>
 <0425a08a629f50f05159f6c458e0942bf62a7792.1601544491.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0425a08a629f50f05159f6c458e0942bf62a7792.1601544491.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 01, 2020 at 11:28:14AM +0200, Mauro Carvalho Chehab wrote:
> The jpeg_error in lowercase is not used anywhere. Drop it.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/staging/media/zoran/zoran.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/media/zoran/zoran.h b/drivers/staging/media/zoran/zoran.h
> index 7217a64fe59b..945502becd60 100644
> --- a/drivers/staging/media/zoran/zoran.h
> +++ b/drivers/staging/media/zoran/zoran.h
> @@ -264,7 +264,6 @@ struct zoran {
>  
>  	/* Additional stuff for testing */
>  	unsigned int ghost_int;
> -	int jpeg_error;
>  	int intr_counter_GIRQ1;
>  	int intr_counter_GIRQ0;
>  	int intr_counter_CodRepIRQ;
> -- 
> 2.26.2
> 

Acked-by: Corentin Labbe <clabbe@baylibre.com>

Thanks
