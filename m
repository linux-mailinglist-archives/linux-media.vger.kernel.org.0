Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 382217DFE0
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2019 18:14:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732615AbfHAQOn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Aug 2019 12:14:43 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37216 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731756AbfHAQOn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Aug 2019 12:14:43 -0400
Received: by mail-lj1-f193.google.com with SMTP id z28so15744568ljn.4;
        Thu, 01 Aug 2019 09:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=t+mJh2gE4B8ztRCbGNmN1VpOh+YJUGLCZLfK7th1+30=;
        b=vG6nYzlkY+HZk89od2/NnrIZ/ItJC5M8rfwtN6ZI+z+NDAaOTtGaanj9TXbkn7DvKd
         ByLDHmtnGeZPzOMcd5poXPRViPJFD7lqD4EYN9Czd/AGzGJcnZhHEyZ4YWxe+R6RNHD5
         /9+JHqSEtQYJ+qdBan4xsQFm+QmqVikLcf2NvsNxDO0Zcjw7pb4UeTAd6ooFEzE/7oVO
         ZShZWs+hnK/gflB7EdVxglG72CC9uluARqftDa4xHrVxAThpNCBj5+9ZO5MdS2KlMZIK
         16X7eRIOsR+xF8oq66DPpDKLRLFGsmXlJP2lLfhTOP/jBxG2plhGtFdxTZJdh1J2gZpy
         Pqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=t+mJh2gE4B8ztRCbGNmN1VpOh+YJUGLCZLfK7th1+30=;
        b=MshwWOIQ8MH1CRqV/pD+0dHEUqvYiMNf/mRxfTlSQgA5CxrmpplqjazPasWqz30PlN
         q0opN0nukO+YsXzzOrOJmYeyCBirvzTYSk4tQl59QI3zyG4srAPkWSuPqoROaF1mZvdC
         zFqch1u27PZa1oH/H6ZFOyKMEUW+wIMid7JJImrqpEi7O3AB01I05CsghnUgab11BLGn
         gRCz4V60iA4xrp5w3AcNSeRpMi/Q6vWtNUBL2ZjXgQqetrQaQULAd//uoJ96n3O+YxEz
         OOfDgShbeqIwnbO8/DGa0EtScVsAhfe1t1RJs+hRPh2UrZ08C2kUD3HGKl39mFudEdio
         VBGw==
X-Gm-Message-State: APjAAAVcRG/oXRs0JPjSnsBkBZSBfVCoEFHDrd/U1hRcDUgI8idfdLgj
        y4K5OTtjgSqlFwTGfiuU7KU9bfPmZkLQt5OVIjI=
X-Google-Smtp-Source: APXvYqxBlptLyw+p5zzhagnNEAZ0fiBRoYdvUVlpzRecUG6TqeZwuXCeDc3ihPyjkJ3URQkHMXE+c0YKixFeb6gBAIY=
X-Received: by 2002:a2e:970a:: with SMTP id r10mr64728348lji.115.1564676081171;
 Thu, 01 Aug 2019 09:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190731163330.32532-1-sebastien.szymanski@armadeus.com>
In-Reply-To: <20190731163330.32532-1-sebastien.szymanski@armadeus.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 1 Aug 2019 13:14:52 -0300
Message-ID: <CAOMZO5Aq5WEGZ0uR5VS0A+UO_3LpGMxp9Y_agQSx1dTshATVEQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] media: imx7-media-csi: add i.MX6UL support
To:     =?UTF-8?Q?S=C3=A9bastien_Szymanski?= 
        <sebastien.szymanski@armadeus.com>
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 31, 2019 at 1:33 PM S=C3=A9bastien Szymanski
<sebastien.szymanski@armadeus.com> wrote:
>
> i.MX7 and i.MX6UL/L have the same CSI controller. So add i.MX6UL/L suppor=
t
> to imx7-media-csi driver.
>
> Signed-off-by: S=C3=A9bastien Szymanski <sebastien.szymanski@armadeus.com=
>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
