Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95937D528F
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2019 23:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729554AbfJLVTq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Oct 2019 17:19:46 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42668 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729445AbfJLVTq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Oct 2019 17:19:46 -0400
Received: by mail-lj1-f195.google.com with SMTP id y23so12996003lje.9
        for <linux-media@vger.kernel.org>; Sat, 12 Oct 2019 14:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N5HuNYVeRW3guvh6ueBc5+Bbw5xhC+qK+0rjX29AgRE=;
        b=cX8UK+D0qcid1jK9HBkmsU2ZlZ5GhVb2We9kuoAczX/WHpqV8l8PlskWJ9Cfe79BvE
         LN8TYsv2dtL8Nk4fRjq1WEuEunT5Si2KyEl6Q8WSRzZVduaW/u4DWcp0uNjRGu4W8uvQ
         EKRN37AeiLHBbvTr0FuenjvzDbEsguXWuM4FlbjN8Zzr61QQ4R1pJeq897S+0N+pAZoZ
         aTQ1SD5vXvqqsNI32P9fu5oMr3Yv5myEw1nFcPg/ngjkPUZ88f4zrE+G8+djOBZ2pl6K
         O4qpDZfUE9DVjgOmiR6EB9Nr7t1LQZSHJ+s510JI2cXdwvQ9QUxhQvlQnfK2o2UASuhb
         +Wrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N5HuNYVeRW3guvh6ueBc5+Bbw5xhC+qK+0rjX29AgRE=;
        b=sWS/C8xVM5f70AL4b53vaX+jgRFgzSlQMK9v/txeg0rblBob6L8GxJoblG96B7XOlF
         rWrjizY3uea5i8Q161u51iYPmixALUb6cqBFfNbgMWzWH9QuzB6bqljRDemIgqC/MnUk
         DBsYDff3OSK/lQ0XSVZD+PU2/hNMMAcQOnRicPpUcJ0cpy60o8QLY1wGfU0/J3oawwdb
         hUdx3NVGRp+8VW8kjGU1z68ZsGAusboO3xeJ66ZJaDjVzT2FcG57MeMAWPLk81FVxt9y
         mSJCyBYb/F1y+uEa7lbJAcvhUSokhdChIAg0TA6G03Doo5uVIhdT6YQQUFZGUjjNWcOE
         xXJg==
X-Gm-Message-State: APjAAAWEdETbvov1vPjUfmJL553DpxjpMBWll42scnE61w42FjI19ZQx
        lXkdy8DY3aYr3Wfe91VSHZoKZL7cCt6Il7M9NWU=
X-Google-Smtp-Source: APXvYqzCJYwHHUH6ajx3sfwH1QLUkkG3JuxwFetDHkUUjuc2uuGuu5o9Z1aj3ZHBY+WEXzDFzD3OD2EhMoHbXznTNM0=
X-Received: by 2002:a2e:42d6:: with SMTP id h83mr12806864ljf.21.1570915183780;
 Sat, 12 Oct 2019 14:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191010154417.9437-1-festevam@gmail.com> <0f7a7910-8652-7a95-1f04-e25278ec05aa@gmail.com>
 <593b540b-d5f9-63ba-becc-0902dc5d7900@gmail.com>
In-Reply-To: <593b540b-d5f9-63ba-becc-0902dc5d7900@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sat, 12 Oct 2019 18:19:37 -0300
Message-ID: <CAOMZO5BgnbfFSmu7HEWtaT9Gexb-u13ZxzWEN-+Hw9eMfuC+LQ@mail.gmail.com>
Subject: Re: [PATCH] media: imx.rst: Update the imx6-sabreauto ADV7180 instructions
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     hverkuil-cisco@xs4all.nl,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Tim Harvey <tharvey@gateworks.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

On Sat, Oct 12, 2019 at 5:24 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:

> Ah, now I remember. You are using the imx6dl sabreauto, it's IPU-CSI

Yes, correct. I am using the imx6dl-sabreauto.

> video muxes have five input pads for each of the four MIPI CSI-2 virtual
> channels (pads 0 - 3) and one parallel input (pad 4). The output mux pad
> is pad 5.
>
> But the doc should clarify which SabreAuto corresponds to the given
> example pipeline config. Can you send a v2 of this patch that clarifies
> the config corresponds to the imx6 quad SabreAuto. If you like you could
> also include the analogous config for the imx6dl.

Good idea. Will send a v2 that clarifies the example pipeline for each
sabreauto variant.

Thanks
