Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1979D19FBBE
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 19:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727717AbgDFRg5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 13:36:57 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35375 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbgDFRg5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 13:36:57 -0400
Received: by mail-pg1-f196.google.com with SMTP id k5so302134pga.2
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2020 10:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=m9Z2CJj+yJrYFAzu14y9i6EVhHGD3zxJHlnCyIOpWp0=;
        b=VJM+FBYADvctjc8djwTYbbJXE5Ra+LPDDYVUTKNGOGmppvSTvcM7BpQ0I62QxUQAJL
         kTLWY5CqSfV4gcJN/xJpZbrRwxJnAPg72tRl7fyamh+7zHYbsKzdxEJWFVdwgA1b8LFq
         DTNE8i5AS/F9mr++D49SkIP2caUDOfo+KM4C2YytdxUFTVsdcX8ErbVsXbpXUgD0ULBW
         4QpH5YvgOfneJS64LOkYqeKLwh77y6DSgN+z9T4YjmskuFyypcAZ/el76Zm2SYg8hDVY
         hY4fOUIN+f9aZTGlP7DzWJISCtJXncunYXTMuBj1G9oTskfC3s0DIMDmRszJlr7H9bZq
         6nkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=m9Z2CJj+yJrYFAzu14y9i6EVhHGD3zxJHlnCyIOpWp0=;
        b=Vt5+5k+c7iA/JgfUp4u3d9IyEabyiT+JkXmX+mDIsSITwQW/odHNQmrcj0GhsW/X4o
         tOoTnN7z6+r2VYqsJ/oX2QbGsqS5bYxEu7LRUBKTNa2UKULJi3dnZRzK66iYR9M3MNcM
         VgWW91AbvrFiVyJ0QLTfSSyeIuDX/eqIYm+VsrC3xkrUyOO03YX2bhhobnC3iSPs0Szo
         vo63BxfZZc0XSyiFMHiYznOIDW6nfi6REaI/35lTXvB5GJpoY6jle2ZCra6T2Ymv2frL
         u5PaPtvcQhYKYmwj9k7Kd6mKIIUIt0eswTbecaSYgDHA2SHy0T9Hnj4LKYZ7J0qghVJg
         XjOg==
X-Gm-Message-State: AGi0PuYi2WD0KHdXkF9CX1y0sy0R9CcHKX0pEigwuo56VR0ArH+09KsR
        9nts+SATsIxh3FO1nkL1UDY=
X-Google-Smtp-Source: APiQypLiVOiFLr+3C7viVJcGNRByma+IoiSpbXx7x0ABb5rEa0bDdXCh+C6oFJSQ7HeJCeaQcfSL6Q==
X-Received: by 2002:a63:db10:: with SMTP id e16mr165760pgg.361.1586194615539;
        Mon, 06 Apr 2020 10:36:55 -0700 (PDT)
Received: from [172.30.88.191] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id mg20sm193881pjb.12.2020.04.06.10.36.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2020 10:36:54 -0700 (PDT)
Subject: Re: imx6: Cannot register mem2mem
To:     Fabio Estevam <festevam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Tim Harvey <tharvey@gateworks.com>
References: <CAOMZO5BQEHA-+pMmKzQj8kteNgMACYP==ezFdz_oYhJYFWKXSw@mail.gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <77add588-5756-8684-3e8f-0f46cbb2442b@gmail.com>
Date:   Mon, 6 Apr 2020 10:36:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAOMZO5BQEHA-+pMmKzQj8kteNgMACYP==ezFdz_oYhJYFWKXSw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

On 4/6/20 6:37 AM, Fabio Estevam wrote:
> Hi,
>
> I am running kernel 5.6.2 on an imx6qp sabresd, but I cannot get the
> mem2mem element from imx-media-csc-scaler.c to probe.
>
> I don't see imx6_media_probe_complete() getting called, hence
> imx_media_csc_scaler_device_init() is never called and no mem2mem
> element is registered.
>
> Any ideas as to how to get mem2mem registered on i.MX6?

If you're sabresd does not have the OV5640 module attached, then probe 
won't complete.

You could make the upstream remote availability optional in the 
imx6-mipi-csi2 receiver driver:

--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -537,10 +537,8 @@ static int csi2_parse_endpoint(struct device *dev,
         struct v4l2_subdev *sd = dev_get_drvdata(dev);
         struct csi2_dev *csi2 = sd_to_dev(sd);

-       if (!fwnode_device_is_available(asd->match.fwnode)) {
-               v4l2_err(&csi2->sd, "remote is not available\n");
-               return -EINVAL;
-       }
+       if (!fwnode_device_is_available(asd->match.fwnode))
+               return -ENOTCONN;

         if (vep->bus_type != V4L2_MBUS_CSI2_DPHY) {
                 v4l2_err(&csi2->sd, "invalid bus type, must be MIPI 
CSI2\n");


Another option would be to disable the mipi-csi2 receiver in the device 
tree:

--- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
@@ -158,7 +158,7 @@
  };

  &mipi_csi {
-       status = "okay";
+       status = "disabled";

         port@0 {
                 reg = <0>;



The first patch doesn't make much sense though, without a remote sensor 
the mipi-csi2 receiver won't function, so there's no point in taking up 
resources used by the driver.

The second option will require migrating the mipi-csi2 receiver 
enablement to new target .dts files, for example a new 
"imx6qp-sabresd-mipi.dts". That has already been done for some boards, 
for example the imx6qdl-icore has a separate target imx6q-icore-mipi, 
that enables mipi-csi2.


Steve

