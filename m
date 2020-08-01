Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3B5123514A
	for <lists+linux-media@lfdr.de>; Sat,  1 Aug 2020 10:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbgHAIzF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Aug 2020 04:55:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbgHAIzF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Aug 2020 04:55:05 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50FCCC06174A;
        Sat,  1 Aug 2020 01:55:05 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id v6so13658289ota.13;
        Sat, 01 Aug 2020 01:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PD30nvxX1ZoJQrMLgIM0dhy3mVwPXpU/L7/NQ7Q4ykU=;
        b=nyQUG69emeUwRUptSLM6NvwcTQki/oxnTijXtlQUFfPMjvb3tqTIp2N3AodZFhz2Bp
         Jlkg63ZCsNKPHcdDT43VTTKQJIWI3Xx508yvOQX5DG5Mt6rUIg4h5zGJhCuGkZHMEkJs
         RkEFR4y8w6UDlHP5jQcEcOpEsFd3L75eEeSnrFkoJ/7q2Oy8scdzrpPTyUQN+D7jw9Zp
         CzbKrmh6CCkmq0CFDdKd0Z8bTda30zVS+oCh/mPLt/rhWOBfnJrV35le1pHfNrGev+H5
         rYl5/XOIQesYEkfo/CQ/Ke1AxS2TY4lPJEcGMTLnqmJcVLW5pS6pPyzdq3qtGOaI2blt
         MZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PD30nvxX1ZoJQrMLgIM0dhy3mVwPXpU/L7/NQ7Q4ykU=;
        b=b3oDZsg7/7hc7cKZZyYdxpyfl7sqcn9Gx5HZLoeX5DIIT1vnb6+wOOFAGqQUbAFzMT
         kQkcEQhEdxCJ9GVILIWMZvy6TuJQk7hTiy7IBZjWPkPJejz5rUWEmdJxVIu8uGmpPtEc
         1z4mw3KOZjAax5mg8y3Rb4OIbeRudg+Llm/zhhK8b+CJr38Hlh3EcI6ukJ67liX/6oTb
         Unm9GB+PRbv1SlrpT6whrVL14TKojNwvtLmti2KblETPliGTicFFrJRO57kB9Ca/ay0r
         /YXSOWxmfWLTeCgKGqbY7i5+OQdU3sFhz7Ys10apI8cP8DEiSiBKkYe53b9wpdgZMlOf
         HT/g==
X-Gm-Message-State: AOAM532sdiD+YpAdJRi+ed5Nr3e53b/bVa4E5PvJE7UXc0bntLQEhXbT
        sKFAyuvqiE2Y8zyG/Bla2YtclikJKgSx4gRcg7Q=
X-Google-Smtp-Source: ABdhPJxQL45hl8gzpRGxxafs/GVFG5VgIT+99MqduKrfOkPwkN9dgMiwjS8yKeyCiNQ98F081M0oN3VJYpTPy11DRN4=
X-Received: by 2002:a9d:5e18:: with SMTP id d24mr5916447oti.88.1596272104634;
 Sat, 01 Aug 2020 01:55:04 -0700 (PDT)
MIME-Version: 1.0
References: <1595603296-25903-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1595603296-25903-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200731160247.GC5201@valkosipuli.retiisi.org.uk>
In-Reply-To: <20200731160247.GC5201@valkosipuli.retiisi.org.uk>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sat, 1 Aug 2020 09:54:38 +0100
Message-ID: <CA+V-a8scKj-9+zi2zSet4t7cPAzaPjoPqSz0vgwxGi4NOu3Cdg@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: i2c: ov772x: Add support for BT656 mode
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the review.

On Fri, Jul 31, 2020 at 5:03 PM Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Prabhakar,
>
> On Fri, Jul 24, 2020 at 04:08:15PM +0100, Lad Prabhakar wrote:
> > Add support to read the bus-type and enable BT656 mode if needed.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> The DT bindings should also be changed.
>
I'll get this done in V2.

> The default should be parallel, I guess, since the type hasn't been
> documented. Parsing should be also updated so the driver can set meaningful
> defaults for the flags --- this btw. also applies to the corresponding
> ov5640 patch.
>
Agreed, will do.

Cheers,
Prabhakar
> --
> Sakari Ailus
