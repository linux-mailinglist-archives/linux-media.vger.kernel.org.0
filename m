Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D265D022E
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 22:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730657AbfJHUe2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 16:34:28 -0400
Received: from mail-lj1-f182.google.com ([209.85.208.182]:36836 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727835AbfJHUe1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 16:34:27 -0400
Received: by mail-lj1-f182.google.com with SMTP id v24so201233ljj.3
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2019 13:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uCi97sxtg0z4vF3FQXokz4FVPlITwS7pPb2Go1jYykU=;
        b=GQAz5wCNUufKpZK0TY+dtNjXiFUKCqpOB8hADE9VlKi+mZjJNjD9TtWm7u/JKYYmFD
         a8kHSlepzO6LkLLjDEq3kuaWSYa+V2r+C74UaV9vUMms9S8+9yKEE0wHSaliimw5ycGB
         wHo+9ZasNmu/schJ2aj3jP8rnhxM5WjmOYmEhWLixohcN2pPM91LVays6sGnllL5coW/
         Td8MGLt2OADSEECNdeHOwgKodmfdDpH/XDnVJdVkbu+xDrQEVJ9hNobRyEhy7YlVmJZc
         obmnzm0nlprvASp/Hv1CsU2wJPpNBLyrOZ/ahswZ0DAJr0e3YUBl1qwv1nYfo3vdhSko
         I4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uCi97sxtg0z4vF3FQXokz4FVPlITwS7pPb2Go1jYykU=;
        b=JFfQRfjQ7evkgXNVOz9vdVLXhuEFjEkC5xX2o1L/9Tlxs+QFfRr+bMG+mBZLeQNRsV
         Rdywedq5pv7ADGriQqGFjL62wCjXXXRiffvup/UjEV/4RaeZURIzyP8kDjVv/wkjRi9j
         fOOtbn0cEtdjBtmSD12VA7ZXgXwkFJMeRmWc7IrvwGkVNrG+sQCPAnWPv6r8OzGfT91E
         3AwThfud24ViHPbQMZwmvRmDOKng7cgldHF/6pFzoDA62J/n29xPBi0lh1yhl+m5fc9Z
         Bac84ZN5/CH+zjm98lR+DbBFNE0/4hgo++tmx/aRbT5Hb4zlVBS7s+F3BzdWx3CjSCTp
         0rmw==
X-Gm-Message-State: APjAAAXsV/7b1MytyByxWs3a+lZD5TXKtrR+GsQzwBPPjKX4XY9ncIyo
        GwmqvLQ3seluwh6/vaHQfeUGBqjHaPWVRs8aefqbuTm4
X-Google-Smtp-Source: APXvYqzFPkcRjBro/RryDXUCfJGHgdZJ0ot3WWc/+e9UTIMkMGue8P01Bw6z63GlmgG8BI9ppHwDC4jdoINy9aCo7tM=
X-Received: by 2002:a2e:29dd:: with SMTP id p90mr81729ljp.26.1570566865841;
 Tue, 08 Oct 2019 13:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5B2kO7_xmA2jmqkH5cxE4hW+TYJhont-rtq0Jck3GKA0g@mail.gmail.com>
 <ba4541a2-9f91-afb6-57e8-84d51de61061@gmail.com> <CAOMZO5BRxvY2=8md7mo0ygsFXdrk2CVYrN_L5q-TQU_AhWCdgg@mail.gmail.com>
 <ca2d67ed-9da1-7579-05d1-4c912bbf8093@gmail.com> <CAOMZO5Cc9sJN+uP5ZAbcAsGoEKH_jN2v0hiCrMrHqj5Qci_Sew@mail.gmail.com>
 <CAOMZO5DmD5V+nT9QhWKTNHe+UydmQP=PJgxZopj7cm9YjEx68A@mail.gmail.com> <CAJ+vNU0EFWA66cnB+1ze-=vMr=WBWuV_=m6+DF_xQ6gng3J-bQ@mail.gmail.com>
In-Reply-To: <CAJ+vNU0EFWA66cnB+1ze-=vMr=WBWuV_=m6+DF_xQ6gng3J-bQ@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 8 Oct 2019 17:34:15 -0300
Message-ID: <CAOMZO5ATZw80cz6WsNUxWfgsqqX-R6A6SKz7tFQa=Tdy2ynWJA@mail.gmail.com>
Subject: Re: ADV7180 Capture with i.MX53
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tim,

On Tue, Oct 8, 2019 at 1:55 PM Tim Harvey <tharvey@gateworks.com> wrote:

> I still carry around a patch from Steve for imx-csi that drops first
> few frames from BT656 sources:
> https://github.com/Gateworks/linux-imx6/commit/959fbd42ee6433f49ef4a04fb1abe8f8c78db5ad
> to deal with this.

Tried this patch and now I see the scrolling happening horizontally
(from right to left).

Stil trying to get stable video from ADV7180.

Thanks
