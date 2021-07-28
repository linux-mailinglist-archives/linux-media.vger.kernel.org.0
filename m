Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 393F93D917C
	for <lists+linux-media@lfdr.de>; Wed, 28 Jul 2021 17:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235559AbhG1PCH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jul 2021 11:02:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236737AbhG1PCD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jul 2021 11:02:03 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86D9CC0613D3
        for <linux-media@vger.kernel.org>; Wed, 28 Jul 2021 08:02:00 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id f14-20020a05600c154eb02902519e4abe10so4557356wmg.4
        for <linux-media@vger.kernel.org>; Wed, 28 Jul 2021 08:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:content-transfer-encoding:date:message-id:to:cc
         :subject:from:references:in-reply-to;
        bh=dOY4vEhaPaTgB7/DroHoAq3EE2coFzwxxY57gsE0V9c=;
        b=ST7fZHfwMNntpLUUGEvmPTrpGH+Mgr4w2I9v1yOzr/JHClOkY5UPrgSR3uvMBUluJz
         P6JB+1f0Gafrlup8ZPe/QjztdI+NMizy7dDrzaxgfOLgD4OvbKCJSj7jn0xrBttL1Wed
         Nsq7l0iudkEEgJuIQaBPct4JrAmCjHSpzk8iOUhy44UDIL6qpyijO4SlrC3DbarFWi/7
         y7U2IGIGHiMgDzu7KUei+YRrwG6/LZDrOLfjTp4/9bw2+ZlVvrgT+qh6W2bK0TaXAe2O
         9JgwKO1Tc/p4W/VSrEk4s5HROSiAJWAm5/qv1M4dvS7MoEMlmqjkws4IJY+Ux0RkQwiv
         6WvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:to:cc:subject:from:references:in-reply-to;
        bh=dOY4vEhaPaTgB7/DroHoAq3EE2coFzwxxY57gsE0V9c=;
        b=BxKLjYIgHs2dFceBx50m1GrgJx29oqT3WkK9x4gRI57yc3LFs+3vmZ6gr3CG03F51U
         wkUjGDiMxV/lBDN+WMgOYNVOo4V1aMY22TZpwjWCFdtJhGCzp1MMj5jLxkQkSdNuIS++
         9jwCHFtjV+J+1s/+6moP/s+PVIEPmuMy18MkQwOE7md3XeChbhT1TTPqe2zvKywBVhPv
         vM32dQAefnLY5ZjaB0aVtgZ6qzFANr2nWYAzLDn+A8eOqnAM6C6iM7ZGT1G39viqDK8X
         gl5Vu4V623wqPyAvz2msjjY3nZ+ROlRqrFFQBlHELDBZu0CJv4SLCxY49GWdAskTVXRL
         jYew==
X-Gm-Message-State: AOAM530T5O/byCa8Z7GcEss8bJaXlQQz30U/QpnNWTyhfcGWqZstAE0T
        z2+PFQ0cZxPHgB0ziiwYSi2Sae1+dvpMyg==
X-Google-Smtp-Source: ABdhPJz5H0Pgi6hwypvzTXTrms2HnDG7trq4qNFzhB25tqrbW4IPnDihI6k+TDuDphYByhlVNJlIlw==
X-Received: by 2002:a7b:c144:: with SMTP id z4mr9849304wmi.54.1627484519113;
        Wed, 28 Jul 2021 08:01:59 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id t1sm265827wma.28.2021.07.28.08.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 08:01:58 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 28 Jul 2021 16:01:57 +0100
Message-Id: <CD4V41XHT0GH.2YVG02SRQNC7@arch-thunder>
To:     "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
Cc:     "Martin Kepplinger" <martin.kepplinger@puri.sm>,
        <linux-media@vger.kernel.org>,
        "Steve Longerbeam" <slongerbeam@gmail.com>,
        "Philipp Zabel" <p.zabel@pengutronix.de>,
        "Fabio Estevam" <festevam@gmail.com>,
        "Marek Vasut" <marek.vasut@gmail.com>, <kernel@pengutronix.de>,
        <linux-imx@nxp.com>
Subject: Re: [PATCH] media: imx: imx7-media-csi: Fix buffer return upon
 stream start failure
From:   "Rui Miguel Silva" <rmfrfs@gmail.com>
References: <20210519005834.8690-1-laurent.pinchart@ideasonboard.com>
 <09087c452885b0da779258b4962a349dbde1aec7.camel@puri.sm>
 <CD4NTXN3E6YR.2T29V4FEH13PB@arch-thunder>
 <YQFZKtF/JUm0ay+9@pendragon.ideasonboard.com>
In-Reply-To: <YQFZKtF/JUm0ay+9@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed Jul 28, 2021 at 2:18 PM WEST, Laurent Pinchart wrote:

> Hello,
>
> On Wed, Jul 28, 2021 at 10:19:36AM +0100, Rui Miguel Silva wrote:
> > On Wed Jul 28, 2021 at 9:50 AM WEST, Martin Kepplinger wrote:
> > > Am Mittwoch, dem 19.05.2021 um 03:58 +0300 schrieb Laurent Pinchart:
> > > > When the stream fails to start, the first two buffers in the queue
> > > > have
> > > > been moved to the active_vb2_buf array and are returned to vb2 by
> > > > imx7_csi_dma_unsetup_vb2_buf(). The function is called with the
> > > > buffer
> > > > state set to VB2_BUF_STATE_ERROR unconditionally, which is correct
> > > > when
> > > > stopping the stream, but not when the start operation fails. In tha=
t
> > > > case, the state should be set to VB2_BUF_STATE_QUEUED. Fix it.
> > > >=20
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > ---
> > > > =C2=A0drivers/staging/media/imx/imx7-media-csi.c | 15 +++++++++----=
--
> >=20
> > <snip>
> >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0imx7_csi_deinit(csi, VB2_BUF_STATE_ERROR);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > > > =C2=A0
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0csi->is_streaming =
=3D !!enable;
> > >
> > >
> > > This patch has not yet been accepted. Any specific reason? I need it.
> >=20
> > Good question, I gave my reviewed in May [0], maybe got lost in the
> > merge process somewhere. Mauro?
>
> I've just sent a pull request with all the pending i.MX8 patches,
> including Martin's i.MX8MQ CSI-2 receiver driver.

Thanks Laurent.

------
Cheers,
     Rui
>
