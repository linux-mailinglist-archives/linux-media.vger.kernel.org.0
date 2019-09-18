Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDCDEB5BC2
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2019 08:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbfIRGSX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Sep 2019 02:18:23 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:45399 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbfIRGSX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Sep 2019 02:18:23 -0400
Received: by mail-ed1-f65.google.com with SMTP id h33so5463717edh.12
        for <linux-media@vger.kernel.org>; Tue, 17 Sep 2019 23:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5l3w16S6FVTnX8s/2MDjiT0WEAx6ub9WKGCC7G8zG7A=;
        b=caPLDh4bVC+TM7+T8Fmnu2z4nTvcpgKligZfkR7gu7YZZ7TNxNYgGlNqZ2B6xFnHqq
         nf8cJglE65xIeFowTZWzApLd7RzrbFwNYXZ/n3MGslAT1DzszFmMPIhivv5VMb2gwtyM
         QAUqtO4EgMqySIQnAZu+0cEEcX3RZIVDkK1lA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5l3w16S6FVTnX8s/2MDjiT0WEAx6ub9WKGCC7G8zG7A=;
        b=oXNCGrt/SagAVI43DTDwz0DZLpBTBBMAOe0YmsR4yClsAGbqV7/MVwdZpmiHztil1z
         pWhnviycWAaO50777kWQW96LOWwhMkTPml+ijB8hdrmJ/42PTQ+074mXfQPGWm52vT2Q
         1vo1Q1PYNp6stPRxwSX4ngdCzWCQ8YhP69U8dLfPRHsSBCusPae7BD99aFkAYKLxEtwR
         6GLDzKajdCy6NAKBBUNsysFiutZRdk3KAq7PhQjAhHSoX8SqGbc9pVAogQBAxLQWoW3e
         E01CrDqtBycNrwxHY+RVWmuVzKr3bwt7sGQ6cC2bWFTE3FqOn0UooDKN+wHsD+2tAt3i
         bqSA==
X-Gm-Message-State: APjAAAUeVpTzGfl6kHlzLxZ6fg3Lu/yx90mbntdwKUXll8mbrf7WSRTl
        c/zRAkELzkx+ed5PZRek2CjBSrEvUUNcZg==
X-Google-Smtp-Source: APXvYqyxr7AVSl2Ll6G+VwmhDLTlWMeZ+gtkzQfth3KuE9RiAYSjQ34P8P0ZuXVUHKdfyvHwI9ttUQ==
X-Received: by 2002:a17:906:31c6:: with SMTP id f6mr7870267ejf.41.1568787501610;
        Tue, 17 Sep 2019 23:18:21 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id m1sm747750edq.83.2019.09.17.23.18.19
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Sep 2019 23:18:19 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id y19so5533856wrd.3
        for <linux-media@vger.kernel.org>; Tue, 17 Sep 2019 23:18:19 -0700 (PDT)
X-Received: by 2002:a05:6000:1082:: with SMTP id y2mr1555827wrw.77.1568787498695;
 Tue, 17 Sep 2019 23:18:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190909072815.23981-1-boris.brezillon@collabora.com> <CABK_QF10zXzkYaLgmkoDLcOYZHj4Es0ZuLWxM+mY=A3H-JBfQA@mail.gmail.com>
In-Reply-To: <CABK_QF10zXzkYaLgmkoDLcOYZHj4Es0ZuLWxM+mY=A3H-JBfQA@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 18 Sep 2019 15:18:07 +0900
X-Gmail-Original-Message-ID: <CAAFQd5C99RnhcG1BnoUF1=C90bVhY-KUyD1VPFqEc5F0RjTGeQ@mail.gmail.com>
Message-ID: <CAAFQd5C99RnhcG1BnoUF1=C90bVhY-KUyD1VPFqEc5F0RjTGeQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: hantro: h264: Fix a comment in b1_ref_list_cmp()
To:     Francois Buergisser <fbuergisser@google.com>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 18, 2019 at 2:03 PM Francois Buergisser
<fbuergisser@google.com> wrote:
>
> On Mon, Sep 9, 2019 at 4:28 PM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > So it matches the code and the spec.
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Tested-by: Francois Buergisser <fbuergisser@chromium.org>
Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
