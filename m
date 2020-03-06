Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1007717BA0D
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2020 11:19:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbgCFKTK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Mar 2020 05:19:10 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44061 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbgCFKTK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Mar 2020 05:19:10 -0500
Received: by mail-ot1-f66.google.com with SMTP id v22so1870031otq.11;
        Fri, 06 Mar 2020 02:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IoHyFheQbLvWaqu8JmtXrevLVQ2eNF1/ry5EBSUAxhI=;
        b=p9wLAfZ0san/NF6WFjAtmFuQ94dW+jXKMoUSjddo2ccb+2JWERyMVU3orURu6BMrLd
         MV/YtCL21b7jaf9NhIrWkoH3FqdM0tSaJ4W9JNmBNYOIo1tev64UoSz7D/SLiE7+69PF
         VplsjRc4fy4/0BE2lpf4mkytKpEHzAdEh2Ho0a7b6MucZsG4UDeflqYGjUiscFz0H/T/
         63nGI1j+jrdvNPkdGJBUXRyf6hiELfw4aBF3B7CQTNATbaa0q8kvj7lF+dcdteIt8lYD
         hWXpWvgquW9//nh5OydbcL3GJ+hzS1LN81drgOIQXSVf4h3y2badceTkjB6uTqNMuORR
         o/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IoHyFheQbLvWaqu8JmtXrevLVQ2eNF1/ry5EBSUAxhI=;
        b=WFeyu/LH+dpMQAiKapV/Us48QH1EA6Z5VU0OvTCUI54nsMvDCl+88kc/TXRdMzAUso
         W3bXdLYgYxbBN4yK8aTJUYoJkR7h4STWxmY231JI7iAJw4ksYkUkT7yFQOjxXOjWwDHE
         VrjG9CktT/BwE/x3k9yasxI6AzZgVSeZSHBmnu2hO6pageSk49Lxm1JINTPAc0p3C0e3
         hYQcY1Ft5SmOoJ4gk02j3khu4Yzgwv47Ik5tAOjerOoGhfp06NGMcL5GBhceGC9qTWcK
         5N3cykoZSCW5g5InePFuCsyW9jF8G6wjlK4ydoBORs/VQsDi6bAP1tmkXb7O70xyOukF
         KCSw==
X-Gm-Message-State: ANhLgQ0mcWlB/w9vNaswxTX7mCAXv5+D3rItplG0tI7hKx3ZMJw4Zgxc
        Z24dl5P8LIgF8kwrbtVjWVRfOtobQl6d/sy4Eiw=
X-Google-Smtp-Source: ADFU+vt6mnTdWQ6RxyyFMqAxyTQC5gXDaaqEFjYr7pojs7qjmb5v1nf4DcANsuCgTC26YvQ/S5viKLF5TlIRf+PUEGk=
X-Received: by 2002:a9d:6d85:: with SMTP id x5mr1917571otp.176.1583489949499;
 Fri, 06 Mar 2020 02:19:09 -0800 (PST)
MIME-Version: 1.0
References: <20200228164126.17517-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200305114314.GP5379@paasikivi.fi.intel.com>
In-Reply-To: <20200305114314.GP5379@paasikivi.fi.intel.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 6 Mar 2020 10:18:43 +0000
Message-ID: <CA+V-a8tGEYT7sOqzLRu8cx3u1DySt4mOz0UujU57SZSGqXB=Pw@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: ov5645: Add virtual_channel module parameter
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Thu, Mar 5, 2020 at 11:43 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Prabhakar,
>
> On Fri, Feb 28, 2020 at 04:41:26PM +0000, Lad Prabhakar wrote:
> > OV5645 can operate in virtual channel 0-3 in CSI2 interfaces, this patch
> > adds support for module parameter virtual_channel to select the required
> > channel. By default OV5645 operates in virtual channel 0.
>
> What's your use case for different virtual channels?
>
Just ability to switch to different virtual channel, based on ov5640
driver. The rcar-csi2
has capability to capture  from multiple channels so that we can
capture simultaneously
from two sensors.

Cheers,
--Prabhakar

> --
> Regards,
>
> Sakari Ailus
