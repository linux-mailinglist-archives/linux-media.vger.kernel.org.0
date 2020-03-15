Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8D8185CB0
	for <lists+linux-media@lfdr.de>; Sun, 15 Mar 2020 14:33:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728615AbgCONdZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Mar 2020 09:33:25 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:44370 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728600AbgCONdZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Mar 2020 09:33:25 -0400
Received: by mail-oi1-f193.google.com with SMTP id d62so14782130oia.11
        for <linux-media@vger.kernel.org>; Sun, 15 Mar 2020 06:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9LfXVY9ce3PeXnFuqVTDv0fnL1sgxA2R5cibFqVjkjA=;
        b=FC4P8VxTyd5GVE9jPuw7byk5C6X6uXgxVL7ryhbwUgjnpgdjTEKnWW02A3tKTWycqY
         JCrHcfoGb4+YPxZeELSXgX6HPSWYSJMODdg0hkB8YR/Dg7XVTuKWTxN9rT0ougkfgvaZ
         HAX2Eax0LinebonVIARhatMy+OzjqsRgKc6NnkkjFFP0TK/f3m/RPHWgySJFo+aa/UwB
         pC3oPLbRhEZ2iRU+0f9CLe7RMkTeylEPApS27j1cS9c9BWJH2rNYh49OjVs9oP8qgrb/
         Xau8pKAEj0Rz3Xbexwk7V5vZAOE6pKUPj9x3bS1EcP1mmLZZ8KnsMjzEgix56BnNsaME
         mayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9LfXVY9ce3PeXnFuqVTDv0fnL1sgxA2R5cibFqVjkjA=;
        b=cazUjMxkoVdJU2HYIaxL75u1env59tTgzG5kFLZ3b6VAf8dtWvCZOw3nQLciSW2zdu
         5HrwA3/7yCl1qw+C1dkoFarhjg4H48Wq+O17ONU+I5kCbOjJvt0BiqXTOg+eVoUQSyLm
         ZBNjxe/45pSJHeInhtK2ViHkIIHldqO1YgwaVn0UF+L3g168VK4pJnzxMrUw2NXGpQ8S
         T7cAjlrK90hG4gBECNa5W/hp7onV9k9Evju0jvPWD4UMuvAOxGXRXUhCUE39EpytdA2J
         S975Xj5GGLltfyzcFiDDxzq/+qUSbEJ0cen5ah76EHlN1DOvBBeHwJjjzyBj4BdkJWuE
         IvSQ==
X-Gm-Message-State: ANhLgQ2t65oqZLGqsqutoNWAn0D7NL9vaHJLXapAKQDLWt83ds8h/0IJ
        4DpPxeVDljQhjR4IKph/7zIjtUIyiyiiCxIevOs=
X-Google-Smtp-Source: ADFU+vsLvGbVvS1g7dhbFCMUx9auJzxdm2KmhI6E+FjTW5+KSish6RgidrYhFn7IzWTXu4O6Ix6Kov7QVC6uHrR6PvY=
X-Received: by 2002:aca:ac89:: with SMTP id v131mr14154662oie.7.1584279204463;
 Sun, 15 Mar 2020 06:33:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200315102724.26850-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200315125511.25756-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200315125511.25756-1-laurent.pinchart+renesas@ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sun, 15 Mar 2020 13:32:58 +0000
Message-ID: <CA+V-a8uo1yZq1mjw5KMcr9K1u_VCgUzkVi9HPKUzrOauFz11dQ@mail.gmail.com>
Subject: Re: [PATCH] media: v4l2-async: Accept endpoints and devices for
 fwnode matching
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thank you for the patch.

On Sun, Mar 15, 2020 at 12:55 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> fwnode matching was designed to match on nodes corresponding to a
> device. Some drivers, however, needed to match on endpoints, and have
> passed endpoint fwnodes to v4l2-async. This works when both the subdev
> and the notifier use the same fwnode types (endpoint or device), but
> makes drivers that use different types incompatible.
>
> Fix this by extending the fwnode match to handle fwnodes of different
> types. When the types (deduced from the node name) are different,
> retrieve the device fwnode for the side that provides an endpoint
> fwnode, and compare it with the device fwnode provided by the other
> side. This allows interoperability between all drivers, regardless of
> which type of fwnode they use for matching.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> This has been compile-tested only. Prabhakar, could you check if it
> fixes your issue ?
>
Yes it does handle all the case.

Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
--Prabhakar

>  drivers/media/v4l2-core/v4l2-async.c | 42 +++++++++++++++++++++++++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 8bde33c21ce4..995e5464cba7 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -71,7 +71,47 @@ static bool match_devname(struct v4l2_subdev *sd,
>
>  static bool match_fwnode(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
>  {
> -       return sd->fwnode == asd->match.fwnode;
> +       struct fwnode_handle *other_fwnode;
> +       struct fwnode_handle *dev_fwnode;
> +       bool asd_fwnode_is_ep;
> +       bool sd_fwnode_is_ep;
> +       const char *name;
> +
> +       /*
> +        * Both the subdev and the async subdev can provide either an endpoint
> +        * fwnode or a device fwnode. Start with the simple case of direct
> +        * fwnode matching.
> +        */
> +       if (sd->fwnode == asd->match.fwnode)
> +               return true;
> +
> +       /*
> +        * Otherwise, check if the sd fwnode and the asd fwnode refer to an
> +        * endpoint or a device. If they're of the same type, there's no match.
> +        */
> +       name = fwnode_get_name(sd->fwnode);
> +       sd_fwnode_is_ep = name && strstarts(name, "endpoint");
> +       name = fwnode_get_name(asd->match.fwnode);
> +       asd_fwnode_is_ep = name && strstarts(name, "endpoint");
> +
> +       if (sd_fwnode_is_ep == asd_fwnode_is_ep)
> +               return false;
> +
> +       /*
> +        * The sd and asd fwnodes are of different types. Get the device fwnode
> +        * parent of the endpoint fwnode, and compare it with the other fwnode.
> +        */
> +       if (sd_fwnode_is_ep) {
> +               dev_fwnode = fwnode_graph_get_port_parent(sd->fwnode);
> +               other_fwnode = asd->match.fwnode;
> +       } else {
> +               dev_fwnode = fwnode_graph_get_port_parent(asd->match.fwnode);
> +               other_fwnode = sd->fwnode;
> +       }
> +
> +       fwnode_handle_put(dev_fwnode);
> +
> +       return dev_fwnode == other_fwnode;
>  }
>
>  static bool match_custom(struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
> --
> Regards,
>
> Laurent Pinchart
>
