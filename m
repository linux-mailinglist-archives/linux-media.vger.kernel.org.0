Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A077A2112FD
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 20:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726616AbgGASqp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 14:46:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbgGASqo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 14:46:44 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4B9AC08C5C1;
        Wed,  1 Jul 2020 11:46:44 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id 12so14988554oir.4;
        Wed, 01 Jul 2020 11:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u5c83WCGX0NDyaUCMmG0xgffkHyXstMK7mXxU0DUqNM=;
        b=dwkLGxYa3+N9fekdfFDFa5FVj3CBLbagAn/Nr7MHAjYudTprLVSdReSc2VzzdNArpW
         8QsAVf+aLNZMoQvO7x5uQk49CqeV4qe10P3PN4OwLL2q0PbJWg9uxtrsogXHCEdp2ZW6
         yngjH/EXW4oizpkILGQoSyyRWsqCDs6+ZDeFKXg9D0E+m7ucWbzmQ6nnTgtDwZ3DXagw
         3YMIdW4r55KKXHaUuCTYYjd43m0nQRV2P3ryCy0iC/PrgWOesB0WFUyuqIC9UpM19k1b
         UzdNPlf+DwaUD1qcwu94oPFV4T2FwATGcALYrW0Mz1WBFHVRCqYrEMgyCg8m177BHSOZ
         EavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u5c83WCGX0NDyaUCMmG0xgffkHyXstMK7mXxU0DUqNM=;
        b=aM2i0KvOaQQw40jN4E5ecCjNE2Md5SeXFnZfzllag4OqN3Ke1fDqVr6dvOUhIT3/Jq
         5aPR5JbARRjECk3ndkCdsIJbJZzGHPJKd9jc3HJ7bcA7GNS7KL5+e+ei0vVPkccu/jxf
         oDvZv5yoHl3M21MsOJ+sCzI8/J+AX631Wt4Xs33/tDImxCOdZ+vU2cLdArZx7tBXHNDF
         DRHAMIGg20WelocpuL6/ELTMaTSe+rBVUBPHpFCX8jLvyQJoOpYz2zwinzLGg/bkmsq1
         9gy9k7shnGavLslm5Igak5bn0z6zyCMwvSV6zqUdhnpCb7T0KZzyIV3ufiFB7o/sShkS
         5q2w==
X-Gm-Message-State: AOAM532kkvdqRMKrx8mzuh+qvczgqy4u9tabCGd69MrUcAQEcue9hcse
        bo9tYN4OsCzkqhERm1f/GQBxB3qwnT+251WFlxM=
X-Google-Smtp-Source: ABdhPJwHzMay7ZnRljIpduOFKx31p6b8NTrJ1RgzCwos45MT0JO3GrKNQSxxo1iYRBFfO5WFOQgVImjaRqbMF/+LGUc=
X-Received: by 2002:a54:4518:: with SMTP id l24mr21862766oil.8.1593629204142;
 Wed, 01 Jul 2020 11:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200701062140.12953-1-laurent.pinchart+renesas@ideasonboard.com> <20200701062140.12953-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200701062140.12953-2-laurent.pinchart+renesas@ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 1 Jul 2020 19:46:17 +0100
Message-ID: <CA+V-a8s6izi09GKU83LBmgXGaGcnuCDnf0ZZOSBTkHhB3JsxqQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] device property: Add a function to test is a
 fwnode is a graph endpoint
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thank you for the patch.

On Wed, Jul 1, 2020 at 7:21 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> Drivers may need to test if a fwnode is a graph endpoint. To avoid
> hand-written solutions that wouldn't work for all fwnode types, add a
> new fwnode_graph_is_endpoint() function for this purpose. We don't need
> to wire it up to different backends for OF and ACPI for now, as the
> implementation can simply be based on checkout the presence of a
> remote-endpoint property.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  include/linux/property.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
--Prabhakar

> diff --git a/include/linux/property.h b/include/linux/property.h
> index 10d03572f52e..9f805c442819 100644
> --- a/include/linux/property.h
> +++ b/include/linux/property.h
> @@ -389,6 +389,11 @@ struct fwnode_handle *
>  fwnode_graph_get_remote_node(const struct fwnode_handle *fwnode, u32 port,
>                              u32 endpoint);
>
> +static inline bool fwnode_graph_is_endpoint(struct fwnode_handle *fwnode)
> +{
> +       return fwnode_property_present(fwnode, "remote-endpoint");
> +}
> +
>  /*
>   * Fwnode lookup flags
>   *
> --
> Regards,
>
> Laurent Pinchart
>
