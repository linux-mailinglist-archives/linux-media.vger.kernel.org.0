Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9C124472F4
	for <lists+linux-media@lfdr.de>; Sun,  7 Nov 2021 14:01:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235371AbhKGNEd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Nov 2021 08:04:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235343AbhKGNEc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Nov 2021 08:04:32 -0500
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90805C061570;
        Sun,  7 Nov 2021 05:01:49 -0800 (PST)
Received: by mail-ua1-x932.google.com with SMTP id b17so26396870uas.0;
        Sun, 07 Nov 2021 05:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=quOBM2NpHn6KafwV3R18O1zrHDLFupHJtPU9Ga2jxwk=;
        b=eFUDrCO9bQt4Aqt6mzJVekQ/s/OkpeAaJfCVk6waioTa94QLOWYUP8J+D1tF87ZUli
         /ycTvq6GPX9nPG0XQ1q5+h3vbDQwaur5W5SORWLagoaHNzqyYuEu/J5v+wfQn6evlwda
         dU1uXXORj7DmKRPbCBrJoERS8MOeqf9zbNjxLRYbXNgh08KZZnD+PqjVRnZOXuOvS9EX
         Pc1PETRhrqALSNHOPQI/zgQIfO95jcpE+IRVFxdQpSu2/G1HZbKUSUTFwW5vOg9VcclI
         iIdTSSHp5XIrgYRM6pWd276v/U4jd2rMg3vhTAG6behlmIBydctHv9PNYxvx3slkzPG3
         0t+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=quOBM2NpHn6KafwV3R18O1zrHDLFupHJtPU9Ga2jxwk=;
        b=cIQlqA6WTdZnW2Qb0OybeFXYw0Brn9GqkOV4ogaN53wZqEQqAy/49GCfrgJqWY8Bb5
         dsHn3ieVyW3gry3jCRNtkvvkVZ7uXBQTGVmBu0AaxLJVOD8IOvP6M2v3d46q4Irksl2k
         Qgcnl6xTb/5ZnQSs9pEInMUwWGg7WgfmnxqSFelxJ6dAebAusE4X/LTcSAmybNXiNmHP
         /aothB1uaRBZJc2/HXzq2Bpo4Ini7gYPWcf+lffNg/ia5hFBHJZTxOsxQ5HgRaSv7EOt
         b4ruMxO4DofgT3QyafLkEoMnSge+13sfMjwQyyWi/BlQLEkQYylTR3j7xnFam6b3/evd
         Gf/w==
X-Gm-Message-State: AOAM533Uxw6vRhwWKjwOJyWK2tICc+75MzxjZOZegqczRO1Dgfdb4lY9
        QVViy63mfiHbnJcqJ0Zmq8ojGSgSGJ7+R/mKQi4=
X-Google-Smtp-Source: ABdhPJxsnijnu77ptUeDEei5srxGdEfmRJIU4GoqqDk3GHu7BcJ0YDJvyFMfGdbH4vGW9bCYRJzkiWJElJ9lxdSo8rc=
X-Received: by 2002:ab0:6ca7:: with SMTP id j7mr72879532uaa.133.1636290108692;
 Sun, 07 Nov 2021 05:01:48 -0800 (PST)
MIME-Version: 1.0
References: <20211106155427.753197-1-aford173@gmail.com> <20211106155427.753197-4-aford173@gmail.com>
In-Reply-To: <20211106155427.753197-4-aford173@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sun, 7 Nov 2021 10:01:38 -0300
Message-ID: <CAOMZO5AzRuJ=t3PWSy2XY+BgL-ouNUi4-cP_yv0pe16vPvmrWQ@mail.gmail.com>
Subject: Re: [PATCH V2 4/5] arm64: dts: imx8mm-beacon: Enable OV5640 Camera
To:     Adam Ford <aford173@gmail.com>
Cc:     "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Tim Harvey <tharvey@gateworks.com>,
        Schrempf Frieder <frieder.schrempf@kontron.de>,
        linux-media <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Adam Ford-BE <aford@beaconembedded.com>,
        cstevens@beaconembedded.com,
        Jagan Teki <jagan@amarulasolutions.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Nov 6, 2021 at 12:54 PM Adam Ford <aford173@gmail.com> wrote:
>
> The baseboard has support for a TDNext 5640 Camera which
> uses an OV5640 connected to a 2-lane CSI2 interface.
>
> With the CSI and mipi_csi2 drivers pointing to an OV5640 camera, the media
> pipeline can be configured with the following:
>
>     media-ctl --links "'ov5640 1-003c':0->'imx7-mipi-csis.0':0[1]"
>
> The camera and various nodes in the pipeline can be configured for UYVY:
>     media-ctl -v -V "'ov5640 1-003c':0 [fmt:UYVY8_1X16/640x480 field:none]"
>     media-ctl -v -V "'csi':0 [fmt:UYVY8_1X16/640x480 field:none]"
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
