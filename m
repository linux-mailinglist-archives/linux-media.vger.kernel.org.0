Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 510772E9B60
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 17:55:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbhADQzM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 11:55:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726019AbhADQzL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 11:55:11 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38EC4C061574
        for <linux-media@vger.kernel.org>; Mon,  4 Jan 2021 08:54:31 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id m5so32822898wrx.9
        for <linux-media@vger.kernel.org>; Mon, 04 Jan 2021 08:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=RzTuoUDoBn5Bb1r+GxfSIluUvd8nw1+p4UY0jg2OjzA=;
        b=BDaYHBfo7gwAe+wIsABQ4+OIkNZBBE4n7VzK9qvf7L44MQHd8mAImvqzAW6TuRAese
         56S3AauUwcdElFxuifBxhet0eiwYzQRzILs7tPp+rRjmlY6nLXNwDWvXUBEFRyj5jcQ1
         +857qpuAQ73q0JgOXXHk9g6WN4/ldNGlOUtFGR5EBRU1i038jRpiqDQ4aNhfHklM8QEX
         2XZU0uBBfVw4L0N7Yxx5IJ+hLHZ42KBNYgbEYqaYx9bb9IsNWLDAxL4MGVIkIYdFNhOT
         N4kPuZUA81XfyqPaZFWOilrBxkfbFBzcu4B8Z/PFah4LraQKk43q/ppSwDp+LN46veOU
         OeoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=RzTuoUDoBn5Bb1r+GxfSIluUvd8nw1+p4UY0jg2OjzA=;
        b=F8ieWMiPB9T0YxEyRsX+6ZVIzY0VrDjxh1JvshS9ZkDcUfJcyDsKgwLsKy9kiDLCIW
         u6LVYDjuPR92WujwpNjy8hCQxrhZSvjcvhwnp5CYQGObRHxhoRjjESN7HiscEhcMunZf
         HjJgKmDqLB3AG8CdE13PtxiWpxxknOKOKkV9Tw39G/VSl5f243cdt1Ks/KxIgIE2luCs
         4RuavaamDlKphczUCzB4tC+y4qwd5CsBpfMXHICjLWqro5ZA0cwYultTb5/PUfUx5tnv
         0OfZ2MqfrRxf6mDgeTF1SYht8XILzm2IfVYdQ+fiq4EdeeaAqyniK1ZRJ6jKfMmjGOcV
         2YmQ==
X-Gm-Message-State: AOAM533WgUMtChJNuQdxvF+29J+SviUh5xWQLrF6IjGe4yg0z02QBGSc
        zpG7XXFBOhgtgLxCCeLpvLNN8btKHEfsTQ==
X-Google-Smtp-Source: ABdhPJyvVGoSDzIy96/DIqFDXSQ1OWIzutoecu+HHECK2V1MlR+hTcNxQo2TrLmxkPDVKNY05ChoUQ==
X-Received: by 2002:a5d:4d4f:: with SMTP id a15mr80805873wru.315.1609779270022;
        Mon, 04 Jan 2021 08:54:30 -0800 (PST)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id z15sm94202950wrv.67.2021.01.04.08.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 08:54:29 -0800 (PST)
Date:   Mon, 4 Jan 2021 16:54:27 +0000
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        linux-media <linux-media@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        =?utf-8?Q?S=C3=A9bastien?= Szymanski 
        <sebastien.szymanski@armadeus.com>
Subject: Re: imx6ull capture from OV5640
Message-ID: <20210104165427.sajgkcr7ss5wrmow@arch-thunder.localdomain>
References: <CAOMZO5DTW_YgVgyXqtccxQUm0A2kLLVcw_EhfsN0kZ9s2hgt7Q@mail.gmail.com>
 <X/KwKikMayH8AHnG@pendragon.ideasonboard.com>
 <CAOMZO5Dh-AKveQneMy5cuvWAX2PwTuC9Xq9rXMfAMD3WUoVGsg@mail.gmail.com>
 <X/MTatdI+tDQ/PQI@pendragon.ideasonboard.com>
 <20210104134511.4on6y6o6hdwdbthd@arch-thunder.localdomain>
 <CAOMZO5BtQsM+wR0i=bqLMhAXqdwJ5Eag1DNzUHCf+oGmntVoOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5BtQsM+wR0i=bqLMhAXqdwJ5Eag1DNzUHCf+oGmntVoOQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,
On Mon, Jan 04, 2021 at 01:21:53PM -0300, Fabio Estevam wrote:
> H Rui,
> 
> On Mon, Jan 4, 2021 at 10:45 AM Rui Miguel Silva <rmfrfs@gmail.com>
> wrote:
> 
> > I really only had the warp7 board which only had the csi2 as video
> > mux input, never got the chance to test it with a parallel input.
> > And the driver expects that we always have a mux. I was not even
> > aware that an imx6 would have the same csi ip.
> 
> Please check the following commit:

yeah, of course I am aware of this patch, when I said I was not aware
any imx6 had the same csi ip was at the time of creating the initial
imx7 driver, not now.

Now I know it, but I never test in a parallel input scenario, the
changes from Sebastien in that patch were very small and specific to
setup csi for a parallel input and I think they worked fro him and did
not break the mipi-csi input type.

------
Cheers,
     Rui
> 
> commit 0486a18ce82bd00d69ddc0fab8faa4b80df2117b Author: Sébastien
> Szymanski <sebastien.szymanski@armadeus.com> Date:   Wed Jul 31
> 13:33:30 2019 -0300
> 
>     media: imx7-media-csi: add i.MX6UL support
> 
>     i.MX7 and i.MX6UL/L have the same CSI controller. So add
>     i.MX6UL/L support to imx7-media-csi driver.
> 
>     Signed-off-by: Sébastien Szymanski
>     <sebastien.szymanski@armadeus.com> Reviewed-by: Rui Miguel Silva
>     <rmfrfs@gmail.com> Reviewed-by: Fabio Estevam
>     <festevam@gmail.com> Signed-off-by: Sakari Ailus
>     <sakari.ailus@linux.intel.com> Signed-off-by: Mauro Carvalho
>     Chehab <mchehab+samsung@kernel.org>
