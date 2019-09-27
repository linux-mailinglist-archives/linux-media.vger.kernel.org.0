Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF49C0CAD
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 22:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728262AbfI0Ufw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 16:35:52 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44005 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbfI0Ufw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 16:35:52 -0400
Received: by mail-oi1-f196.google.com with SMTP id t84so6295999oih.10;
        Fri, 27 Sep 2019 13:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=86XODwKrlVopUkndt2vCBDWtscRr9iPDGHIPZ2Bvuuo=;
        b=SV7Kh4kHFdsnSQv5lv8w1TDNdx5Vkq7Gqu8OKtbYMf1uA3zyRXqrYTtCXU97ro69Ha
         y+eZP1hPjdC39nbw07sYb34CSn9RGowUIi4ikmlsJloZjCxP1E+CUgzteHHDFoHKFLz/
         8ZA02dx7ln2OArTwYSlCNPSsjmm76UEipYE9tFrwRex0nEA4r6n62dayB8R092ZGaYJL
         1IBJ7NmsR/WNj7D1IVsgJgZeswqVXen3LTPw3oz5wZpoRD9HCdc+/4l8Kj6sReS5O0SN
         qzClYTok3I/IKiSDqGjH8fy5Fkz647JkhrkGjj2UsDg4h/6f+TdAh5M6RP0mwV0Fm8S3
         jW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=86XODwKrlVopUkndt2vCBDWtscRr9iPDGHIPZ2Bvuuo=;
        b=K/Q5DhgQ0OxtgCT32WshISEBgj31Hnhi/P4BkRhalE+F+2Bfj+11rZ4l1lUWLgVwDg
         ZFBHiy2ye+RFrcysA+LxVlcVNr5WYTVB+A3EUF6XHJLPDNHaEobWKsNR97TkcxY9aPYX
         7OIRl92z1ZTMTKXwQiqA4AdowrmYK5bXbsisHHdXakKWTJLsGvl0DcBU0vlWBz9VhloB
         hJm2CnxyMxMj47JiUBq27GwZ0BdsbwkX+LWmaubDEvkTOG4vJpi/ffyAumivWOJGlYzR
         xMcP6mE2LtM/sJdM2Lr67XCCbsZCaBkP/IoL6Id4w0DKbjeZGlUNU2DMNMpudJ2JyKcR
         a+CA==
X-Gm-Message-State: APjAAAXanNyRsmqiWU+DCcUXoZ/i+QcGu9H6rCF3a8rcIQyeHRuIoFjW
        F9+gE07VMWtyRVrYtslkNrD/kIqd/JtyzPqxUuxcv1+eGk0=
X-Google-Smtp-Source: APXvYqygGR0IX/K6yV8ctEudWER2wZ56ckPAvYTdYy0LK9fPCCAfFI6smWFlyJw/mzinR82U6qfFB6/f/0+1X3rgIKM=
X-Received: by 2002:aca:5ed4:: with SMTP id s203mr8476773oib.101.1569616551443;
 Fri, 27 Sep 2019 13:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190927184722.31989-1-bparrot@ti.com> <20190927184722.31989-3-bparrot@ti.com>
In-Reply-To: <20190927184722.31989-3-bparrot@ti.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 27 Sep 2019 21:35:25 +0100
Message-ID: <CA+V-a8vOLaD74i2tNZVE9-+=1AfDBmhix6Lo-q1LcDN0jSDOuw@mail.gmail.com>
Subject: Re: [Patch v4 2/8] media: i2c: ov2659: Fix sensor detection to
 actually fail when device is not present
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 27, 2019 at 7:47 PM Benoit Parrot <bparrot@ti.com> wrote:
>
> Make sure that if the expected sensor device id register
> is not recognized properly the failure is propagated
> up so devices are not left partially initialized.
>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> ---
>  drivers/media/i2c/ov2659.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
Acked-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
--Prabhakar Lad

> diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
> index 17573257097d..efbe6dc720e2 100644
> --- a/drivers/media/i2c/ov2659.c
> +++ b/drivers/media/i2c/ov2659.c
> @@ -1330,11 +1330,12 @@ static int ov2659_detect(struct v4l2_subdev *sd)
>                 unsigned short id;
>
>                 id = OV265X_ID(pid, ver);
> -               if (id != OV2659_ID)
> +               if (id != OV2659_ID) {
>                         dev_err(&client->dev,
>                                 "Sensor detection failed (%04X, %d)\n",
>                                 id, ret);
> -               else {
> +                       ret = -ENODEV;
> +               } else {
>                         dev_info(&client->dev, "Found OV%04X sensor\n", id);
>                         ret = ov2659_init(sd, 0);
>                 }
> --
> 2.17.1
>
