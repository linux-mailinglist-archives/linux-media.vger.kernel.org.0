Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 714237DFE8
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2019 18:15:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732823AbfHAQPQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Aug 2019 12:15:16 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35498 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731704AbfHAQPQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Aug 2019 12:15:16 -0400
Received: by mail-lf1-f68.google.com with SMTP id p197so50656671lfa.2;
        Thu, 01 Aug 2019 09:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fzTcCU8DmiEfu3KOpz+zNVDtmEzQUG6MLn72PQe0yd0=;
        b=lR7SLV8tBosSuoZxn7SAB6sPGvH+WPf1E4MioS1ezN+r9IS3K3xjze4bze9tzXQFOe
         3CcP65yrQ4fBmXSJjNX0b91v5eQ+/I+/3GzeKru0jF79p9wLmvsFZUgsTRTXq9YEHECX
         nRmguLIWQSJLQmPLcyIgu+TgbBNts8/1TpeK5mDK8FcUnJKh1ltOVzUmVjSI/lRj+V2j
         kKDel2o4k4Gxy5XRmPUW0JdEfQX0NsVcdYQ89xV9+OZUe7oO72lCHNC/CRS/BuM0sGd9
         QkcSgfVKf6FZeJD1R/NrB01plBIYwGg+tPi6j6cScGTBGOQm7zqkhZj5+VLa9aTaXGsN
         zHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fzTcCU8DmiEfu3KOpz+zNVDtmEzQUG6MLn72PQe0yd0=;
        b=czRAEsJfm8gUV91TzklaQpUwTocXc+HZDe4N1khSXrOrlHpKPKh/nhj00dwozkJjNv
         4UkysuB/UlbjWT4FYOfvcpnbnem/oS9BFLF1z/wzTxq8jQJ6yJnxrnZHvZS4Ex41ey84
         g2pj7qlLahSeOB+bDGEgln9qwkqBz4vB2mA6HuUwRAjexEAQ8sc++oC8WUEZRKgLOXmM
         fBWiavNtlI9fUHUysXdTlNmLdANjhrUMSQVaaqlH+pAmJKR9LknK8zVpFGOxCvqHv9px
         nawXox7YnMEbslcFBSLsork5/EzBxnOsu/0Msaasc4ybTLrFlJMSIwkrqi0+ehKClwBo
         oHNg==
X-Gm-Message-State: APjAAAWekhrIjkYpofEjxv5Nj93emqIbp45iqK0YhAcGsQUKUd47W/eK
        ABoTh0ZFwsNWtet/W2mq91yA+Sy4dG4YRun6Ea0=
X-Google-Smtp-Source: APXvYqwNJxjcu2xuSyLo7PU4FvCCkXLvk9CQQaJBa+MRaFtEi3yjxNzKMFYskhzEERhc9bLgb9kY/z9FW7cowNHmpLw=
X-Received: by 2002:a19:6e41:: with SMTP id q1mr52031933lfk.20.1564676113934;
 Thu, 01 Aug 2019 09:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190731163358.32622-1-sebastien.szymanski@armadeus.com>
In-Reply-To: <20190731163358.32622-1-sebastien.szymanski@armadeus.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 1 Aug 2019 13:15:26 -0300
Message-ID: <CAOMZO5Ct1r_3HLzdEPGyk3pDZsVWhmiRgB436bb-NwGuLnzYKg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] media: dt-bindings: imx7-csi: add i.MX6UL/L support
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
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 31, 2019 at 1:34 PM S=C3=A9bastien Szymanski
<sebastien.szymanski@armadeus.com> wrote:
>
> Document "fsl,imx6ul-csi" entry.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: S=C3=A9bastien Szymanski <sebastien.szymanski@armadeus.com=
>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
