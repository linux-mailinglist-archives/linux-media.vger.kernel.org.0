Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAE65118DF
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2019 14:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbfEBMTA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 May 2019 08:19:00 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36794 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbfEBMTA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 May 2019 08:19:00 -0400
Received: by mail-lf1-f67.google.com with SMTP id u17so1722265lfi.3;
        Thu, 02 May 2019 05:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0SNjztPUemVLTeTX5HL2waYiBQR8r75OELo66BjFUoA=;
        b=oiDRIhl0M87K/VSE0Ct9z19hQCpC4/o1p66nxiEjTv/kpmc8TXBzJA5owidDNCjuMr
         u5F+/ts9R5v23ut9eDl0wHZXimM6oRQIz05ppD2so8mqCbnzwGUdLSju10zdJ7R+lRe6
         c6Zz8Afqd6jNaJyGj2Ps6y8PDEjuwVgRoiro4GZUaXbloUwq5U24n/A2PEangNaFLEcn
         b6TPLpI14zMd8rjSsIQA9vgIWDvz87xWEpa139vsCTgpjkztsOfu6z51m6Xulp/I8wYM
         GNrosPjosbYz/G8bHdR5Ftpvczty3b9M2UFa1cJsGSl1/GKkQbUZ5oDuIexXlBbPFVSj
         9JlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0SNjztPUemVLTeTX5HL2waYiBQR8r75OELo66BjFUoA=;
        b=UeJtZaGwAToRr3egBd21q4DZqA8cHQOdVIr0zpRXnogx1KarA405i/xzO7XDTf8xSh
         3v6HRJZeFLySYOOdTRf9JRD2X9y+RUI3PPRcgCFeTli7cGmya97i1iA5UL77B5UetsbB
         rg7kI2NXYZK7ektE7slukE9JNTaER1o/PAX6/r6tO3B1iaF85FtHNboZDmJKrKI2k7jK
         AZYQDUo4sKL0v47ZO0ipH6IUuMQnR8SDiV46d6zHDlhujRrOhx0222MAbZeY49rC3yFW
         IUuScRU6YakraTBQx/qy15syCMxwrRj/E1g2AT++/JO6ijSTRt61GuPJKIVj4faaw+Il
         Vc+g==
X-Gm-Message-State: APjAAAXUCvBurEKst9lRw2f13iVCH2cNQ5En6q8a5AJeNrsU7wu2zeWG
        firi5V6LXsq5u0w8lh5L/GntzzJ1vet9zAJAUdQ=
X-Google-Smtp-Source: APXvYqy02pW1NewSWNKwYPVNlOHLum5fvjbinr4+d8kNGzsHODOOdARBrF355zx4tKnUCTxgYsy9IcBORZup7cw15tM=
X-Received: by 2002:a19:c7c3:: with SMTP id x186mr2010164lff.107.1556799538649;
 Thu, 02 May 2019 05:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190430074911.8361-1-sebastien.szymanski@armadeus.com>
In-Reply-To: <20190430074911.8361-1-sebastien.szymanski@armadeus.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 2 May 2019 09:18:53 -0300
Message-ID: <CAOMZO5DbzRYYzhd=W=YvKuYdXyCc3q08=yTG6-3U2rxAeFApZg@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: imx7-media-csi: add i.MX6UL support
To:     =?UTF-8?Q?S=C3=A9bastien_Szymanski?= 
        <sebastien.szymanski@armadeus.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        linux-media <linux-media@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi S=C3=A9bastien,

On Tue, Apr 30, 2019 at 4:49 AM S=C3=A9bastien Szymanski
<sebastien.szymanski@armadeus.com> wrote:

> +static const struct of_device_id imx7_csi_of_match[] =3D {
> +       { .compatible =3D "fsl,imx7-csi", .data =3D (void *)IMX7 },
> +       { .compatible =3D "fsl,imx6ul-csi", .data =3D (void *)IMX6UL },

Please add the new "fsl,imx6ul-csi" entry to
Documentation/devicetree/bindings/media/imx7-csi.txt in a separate
patch.

Thanks
