Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71764194755
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 20:17:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbgCZTRn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 15:17:43 -0400
Received: from mail-lf1-f54.google.com ([209.85.167.54]:42780 "EHLO
        mail-lf1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbgCZTRn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 15:17:43 -0400
Received: by mail-lf1-f54.google.com with SMTP id t21so5851678lfe.9
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2020 12:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lnvA9EG0/j/Gkw/ooyO6kB/OszSwNJvY+TB0VL7FdUw=;
        b=IzsBl36P3rAMbbVB89JRx0NkdyPcryRSo3S5kzhp5GxoJtI05DiCEFfm6v6YtbLQUn
         z3TPkIoCRq4pSFvRFbN5UXci2kWP0RICC4WgoGfYU0nkrHYjS49QVgGXtbmzGqjSzxXH
         B8qVyr1oqKK223eev9qzgtr0nIRN22sc3WNeuM+ovfu4z5wSHWhfmIkm2nVhaCMUQ99p
         eMono5bHqpzTEf/Zkn+2lic7TjMrWSbTYJ6r0qAZsUwydmshTa26LyJncqnEkrc9e1+W
         Mh4yWHaL2gvoDxLYM1OGdeTDYhqDMlosInhuBxSnaD92Z7EvMuUD/hnkhHdmfgt8glF5
         I+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lnvA9EG0/j/Gkw/ooyO6kB/OszSwNJvY+TB0VL7FdUw=;
        b=PAJbK6m6153cZ85hXp7iz+roZL/2HaNVUERXqx/CHzRlXvjsjFIbRjOvDmh8ZCGAen
         PHXpHmlT/mCSAimIo758UlU7SJDWlLPWH4A4NzKdZGHWGDyDHQgfClBhRQM1YZJ21gO8
         KW3b3aL8gK65ToeNdru8qhUa2v8PtptzAgfU9eIw5jWT5ITOHArx1WCGKsNsDfs85wnp
         LLmbok8//JWLevhxSLzla7RkiGfvgZXuXgV75+bmCr0Lz4HfC6nDvHfFIxJmWG3lCQyP
         EiQRq7poFxOjg1IcS1cTToCfnazPp6XgXAbk/fprD9feMfCC0higf7lAj/wGeRM5gjo/
         oHhA==
X-Gm-Message-State: ANhLgQ3TLpkb7XBveJ6kFye2kkKSJQZ72MlwLAGHo5NYlrmLDB+O7D0Y
        KMLRt6f7nH14tbjjpcuZhMdkZ7zSdyprNCK9XfE=
X-Google-Smtp-Source: ADFU+vtrq2HygTzjHemp4owvtQrjMaW3JZESvIaDWXvMl0q0gsCwxbCBr6+8kIq7DJYmPp7jGbqBwWEQVM1F7wbcVUY=
X-Received: by 2002:a05:6512:1116:: with SMTP id l22mr6703428lfg.70.1585250259740;
 Thu, 26 Mar 2020 12:17:39 -0700 (PDT)
MIME-Version: 1.0
References: <30c5947f-a026-66a9-75f2-d2531cc73a1e@gmail.com>
In-Reply-To: <30c5947f-a026-66a9-75f2-d2531cc73a1e@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 26 Mar 2020 16:17:31 -0300
Message-ID: <CAOMZO5Bz+qh7S3s8SfJRPVjjvokMx-r6udzFg=0poJmCbzMj9w@mail.gmail.com>
Subject: Re: IMX219 MIPI Sensor (meda-tree) with vaniila I.MX6Q media drivers
To:     =?UTF-8?B?0JzQuNGF0LDQudC70L7QsiDQkNC70LXQutGB0LXQuSDQkNC90LDRgtC+0LvRjNC10LLQuNGH?= 
        <minimumlaw@gmail.com>, Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 26, 2020 at 5:30 AM =D0=9C=D0=B8=D1=85=D0=B0=D0=B9=D0=BB=D0=BE=
=D0=B2 =D0=90=D0=BB=D0=B5=D0=BA=D1=81=D0=B5=D0=B9 =D0=90=D0=BD=D0=B0=D1=82=
=D0=BE=D0=BB=D1=8C=D0=B5=D0=B2=D0=B8=D1=87
<minimumlaw@gmail.com> wrote:
>
> Hi!
>
> We build custom CPU Module with NXP/Freescale IMX6QuadPlus CPU.I use
> latest stable kernel from kernel.org. This time kernel version 5.5.11.
> Also I connect to I.MX MIPI cameras from RaspberryPI (Rev 2.1 with Sony
> IMX219). For IMX219 used actual driver from [1]. Usersapce based on
> Gentoo Linux, have media-utils version 1.2.1, v4l2-utils version 1.18.0,
> gstreamer version 1.14.5 with v4l2 plugins. Also Wayland version 1.17
> based graphics with XWayland.
>
> Camera write in DTB:
> =3D=3D=3D=3D cut: DTB fragments =3D=3D=3D=3D
> / {
> [skiped]
>         imx219_clk: camera-clk {
>                 compatible =3D "fixed-clock";
>                 #clock-cells =3D <0>;
>                 clock-frequency =3D <24000000>;
>         };
>
>         imx219_1v2_reg: cam1v2_regulator {
>                 compatible =3D "regulator-fixed";
>                 regulator-name =3D "IMX219_1V2";
>                 regulator-min-microvolt =3D <1200000>;
>                 regulator-max-microvolt =3D <1200000>;
>                 vin-supply =3D <&p3v3_reg>;
>                 regulator-always-on;
>         };
>
>         imx219_1v8_reg: cam1v8_regulator {
>                 compatible =3D "regulator-fixed";
>                 regulator-name =3D "IMX219_1V8";
>                 regulator-min-microvolt =3D <1800000>;
>                 regulator-max-microvolt =3D <1800000>;
>                 vin-supply =3D <&p3v3_reg>;
>                 regulator-always-on;
>         };
>
>         imx219_2v8_reg: cam2v8_regulator {
>                 compatible =3D "regulator-fixed";
>                 regulator-name =3D "IMX219_2V8";
>                 regulator-min-microvolt =3D <2800000>;
>                 regulator-max-microvolt =3D <2800000>;
>                 vin-supply =3D <&p3v3_reg>;
>                 regulator-always-on;
>         };
> [skiped]
> csi_i2c: i2c-mux@1 { /* CSI camera */
>         #address-cells =3D <1>;
>         #size-cells =3D <0>;
>         reg =3D <1>;
>         sensor@10 {     /* Raspberry Camera V2 */
>                 compatible =3D "sony,imx219";
>                 reg =3D <0x10>;
>                 #address-cells =3D <1>;
>                 #size-cells =3D <0>;
>                 clocks =3D <&imx219_clk>;
>                 clock-names =3D "xclk";

No clock-names is described in
Documentation/devicetree/bindings/media/i2c/imx219.yaml

>                 DOVDD-supply =3D <&imx219_1v8_reg>; /* 1.8v */
>                 AVDD-supply =3D <&imx219_2v8_reg>;  /* 2.8v */
>                 DVDD-supply =3D <&imx219_1v2_reg>;  /* 1.2v */

These supplies names do not match the ones described in:
Documentation/devicetree/bindings/media/i2c/imx219.yaml
