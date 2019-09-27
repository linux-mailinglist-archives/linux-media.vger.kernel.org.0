Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19F40C0C05
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 21:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725980AbfI0TVi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 15:21:38 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39104 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbfI0TVi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 15:21:38 -0400
Received: by mail-lf1-f68.google.com with SMTP id 72so2726768lfh.6;
        Fri, 27 Sep 2019 12:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NRtadYP5nbR/QB1gCSx1xAuVyFcnYFdMokbHypTtJuw=;
        b=LReyqP239776XbWD2hbJq4Birvcg+ZyJd4AghLDcY9N1brxOImICcGYaMllKctg9A2
         kZF1IGf+ZF8Fq7QmXS7hweLNBrQ/Iva1pX/FjA0u4H1piO4wbCpL91mzd14/4CSf7wSA
         t81XxzhWvL0KPav4DvJZmVFQKCDr0Qji9bdgt7qh9q/TnbaCI8ANC2F4DAXjUks14PA9
         yaQDIrvV0f91jTZqZB/IugWgo6OV0MBJZmq4zo3sOtOyIrf0CiisM97TZLf7nCaZqdE9
         vrmqv/HjaWTYJuusCRErz76JblJSnswhR0GmQCq/ar/GV34EuenMb6AIVjKHjqHBGPDj
         zwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NRtadYP5nbR/QB1gCSx1xAuVyFcnYFdMokbHypTtJuw=;
        b=ebY0KN57EwWFqet+dAO+Bp9+Jhx+B23ZrH65k2kp/xYgogc1FYPyJrGsTZQkTamN03
         mwO660eBg05n5u3O/99KRNZxmdwyd26LkSAt3JP6bO8Q3SfbMovyxtMpUtfHZzvgnI4Y
         DdloGtlfVLR6AppAab9xBP0MtoHF4HR9VIETtf9TqAGmQiqgJsaQO5imlU2fnZIzdSK4
         C329VzUeXo9oFKJAf4WdwzctXxo+A4rTJcOpp0+KNNrjbq6Y7UmpGpp7Xw/VpvnMJFfZ
         NpTFJTFQKn5r+yJ5KFmTrwCA92jx0AEz/PrOtjvFZkKLliLUEjuZ+xgk6b+NxUQHoo9f
         STmA==
X-Gm-Message-State: APjAAAVXP+0cBz0iVQXwX/Fdv4miCccFtSe5V0GzZZsbOCC4U5DCYyM4
        +PBylRQ3U0fo1Ub4Ix7Gyb4hQ1PXZDoNgbMPH0A=
X-Google-Smtp-Source: APXvYqyGetNw8QB/cCEgUgX9QGK1q9E3QJdvmyT5x9eyUvu6MgVyKYnXCepxs0WWTUxJxzT+0Mmec35MAjwTHuknFH0=
X-Received: by 2002:ac2:5091:: with SMTP id f17mr3917135lfm.107.1569612095980;
 Fri, 27 Sep 2019 12:21:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190827215539.1286-1-mmichilot@gateworks.com>
 <cb3e9be4-9ce6-354f-bb7c-a4710edc1c1b@xs4all.nl> <20190829142931.GZ28351@bigcity.dyn.berto.se>
 <CAJ+vNU11HTcP8L5J2Xg+Rmhvb8JDYemhJxt-GaGG5Myk3n38Tw@mail.gmail.com>
In-Reply-To: <CAJ+vNU11HTcP8L5J2Xg+Rmhvb8JDYemhJxt-GaGG5Myk3n38Tw@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 27 Sep 2019 16:21:48 -0300
Message-ID: <CAOMZO5AwSO8BjpmcFMT-70Xot45D2SYZ7QHRgNSmU0o+PXCyXg@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: adv7180: fix adv7280 BT.656-4 compatibility
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Matthew Michilot <matthew.michilot@gmail.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tim,

On Wed, Sep 25, 2019 at 9:22 PM Tim Harvey <tharvey@gateworks.com> wrote:

> Have you looked at this yet? Without this patch the ADV7280A does not
> output proper BT.656. We tested this on a Gateworks Ventana GW5404-G
> which uses the ADV7280A connected to the IMX6 CSI parallel bus. I'm
> hoping to see this get merged and perhaps backported to older kernels.

In order to be backported to older kernels, please add a Fixes tag.

Thanks
