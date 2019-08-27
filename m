Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53D739E590
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 12:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726833AbfH0KS7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 06:18:59 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53605 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726039AbfH0KS7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 06:18:59 -0400
Received: by mail-wm1-f68.google.com with SMTP id 10so2472160wmp.3
        for <linux-media@vger.kernel.org>; Tue, 27 Aug 2019 03:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=lBgsxRDtUnhi6eJW1rksIrblTl1v7CCVnJs4RlMRloc=;
        b=qqP/sZIZ2jshNaw4uk78KwyvrmmdziMtxmdwnV97mY3YWiWTY4Znb0HG8zEX0cbhRL
         nq+4qt+JDTkk0Ofy2vQKxveZDecPsIbUAsPbDBni8+rkjB59c2Z2O0nP6L+H8JhxURwq
         L+XsfHO5NGsDh4MASemMO2zfIbbiFYsPS1SIXh5R4vYgjyf/cXmxAN6vzvaaUPoaV6Un
         Ul55+22Xx8FFsnuy8NCwlwDgn2LWGV0UOEQKUQ+AAErNyeLp1E+gT9zxHbJSl5UaJ/qc
         VHbnPrdeHBboI45h9gsXVykeXNZwmeLwRMCl9i8LWGtwI+NUWWk7s5/ClS+TT0yxyuAP
         hXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=lBgsxRDtUnhi6eJW1rksIrblTl1v7CCVnJs4RlMRloc=;
        b=mCnVa+FxPlEkt9d2ejrshB9YOBUfTqDVB8RlNli8hqOL7NxdqdjAL6J97Seedw8dgQ
         NSib431iiyAjjY2R2R23h5pKARbpxykoffOewJksMT9bDuPsTyFAChabD5a8yfWnBHKv
         sZRHOgeqL6+TNJVW3NbD0Br7UmjysQp17gnncOcH+B9IsqpYjZEnZM+RPZJ/TQxjJ8pM
         qOsF3iLNDxfUXdwBcBQFBsXqRmDas/TeRg2DaefOwGfvFFCeIahEd2Cnx5kXy/b7QX63
         JU/4GD5BL7juLjyg40dXNozCVN2hHtfcLOgj/AXmUSTsh6bdiSW/UNF7LXNURpwcmo0c
         Mrqw==
X-Gm-Message-State: APjAAAU1U03mIxZfHUpCeV4Xgco0iC8M62B+sHOm+don8AL9BetIOEWT
        gYIeaGq6qif5I2heIh/DCfrE7TAF
X-Google-Smtp-Source: APXvYqzGeQ4UdQ8jJR6rMTu0nADWNvW/8oyxhsdsLvm2K1z50AX5gtZzX9eXKYyfsdxF8lkLCx2NKw==
X-Received: by 2002:a1c:6387:: with SMTP id x129mr26735554wmb.166.1566901136412;
        Tue, 27 Aug 2019 03:18:56 -0700 (PDT)
Received: from arch-late (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id f134sm3335673wmg.20.2019.08.27.03.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 03:18:55 -0700 (PDT)
References: <20190824163337.8260-1-slongerbeam@gmail.com>
User-agent: mu4e 1.2.0; emacs 27.0.50
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v2 0/2] media: imx: Fix subdev unregister/register issues
In-reply-to: <20190824163337.8260-1-slongerbeam@gmail.com>
Date:   Tue, 27 Aug 2019 11:18:54 +0100
Message-ID: <m336hm29o1.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,
On Sat 24 Aug 2019 at 17:33, Steve Longerbeam wrote:
> If the media device module is removed and re-probed without also removing
> and re-probing the subdevice modules, .unregister() and .register() ops
> are called on the subdevices without the subdevice drivers being removed
> and re-probed. This creates two problems:
>
> - the CSI and PRPENCVF subdevices attempt to register a stale video capture
>   device resulting in the kobject "tried to init an initialized object"
>   backtrace.
>
> - pad graph objects are added to the media device pad list twice, resulting
>   in list corruption on the pad list.
>
> The following two patches fix those issues.
>
> History:
> v2:
> - Add missing local var ic_priv in prp_registered() in first patch.
>
> Steve Longerbeam (2):
>   media: imx: Move capture device init to registered
>   media: imx: Move pads init to probe
>
>  drivers/staging/media/imx/imx-ic-prp.c        | 25 ++++-----
>  drivers/staging/media/imx/imx-ic-prpencvf.c   | 51 ++++++++++---------
>  drivers/staging/media/imx/imx-media-capture.c | 15 +++---
>  drivers/staging/media/imx/imx-media-csi.c     | 35 +++++++------
>  drivers/staging/media/imx/imx-media-vdic.c    | 27 ++++------
>  drivers/staging/media/imx/imx6-mipi-csi2.c    | 27 +++++-----
>  drivers/staging/media/imx/imx7-media-csi.c    | 38 +++++++-------
>  drivers/staging/media/imx/imx7-mipi-csis.c    | 23 +++------
>

For the imx7 parts:

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

Many thanks for this.

Cheers,
  Rui
