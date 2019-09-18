Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3FCEB5A9A
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2019 07:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbfIRFD0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Sep 2019 01:03:26 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:41613 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726930AbfIRFDZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Sep 2019 01:03:25 -0400
Received: by mail-ed1-f65.google.com with SMTP id f20so2933413edv.8
        for <linux-media@vger.kernel.org>; Tue, 17 Sep 2019 22:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o6Yu5aLgFr4xlN3BdFA/n9HFrfFS0OabwkHg9ZOTitM=;
        b=ItjY6m3MusiWRpAUhexsCn2x7kWW7VXP29efW/3uz4qPiXQfzG03vD4JkXRQ2D7skf
         JFZwUHN2MGp1Ct1Rgx8g0J3N/PYfEc9y+aBVN5tK6t3sAeJFVjYSq9pe5OCZlIowgiWH
         37j9TytWf9mwsqHPC0m/pNFJrl1RRnF9pgB/sbUn6V0yRRrkzB6bTeckc3csZQ3WLpg5
         xvvB7McYTqhmS4V3IO/gpgrpInApVa6eBEYCmIdB+Cic87G2YHZaDI9J8KaeGAVoltW1
         1S1/Rh4Xr5s70ajpyKIUwy8jpc09U4hmmUW+OjDcW0bqhQcqFoLyZgLWkcnVtDFTuntS
         EF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o6Yu5aLgFr4xlN3BdFA/n9HFrfFS0OabwkHg9ZOTitM=;
        b=gsrUT7soa218QLBn7AZa7M1JWgEhw5N5ch7jtLD7bIfMti4P1NTTC9qAXEKyvc4tKg
         F/l50fkR22I/PDq+LWV0FP6YZCCbhxo0w/0uB78i+JCXLU4fCM8jB6YTxH0gn+7aorvI
         OH9Z5gdwdXsklOHqS4zReaeu0d5lbIn3eO2NH+naMdyiA1zxl3g3Mxt8aLgj4ECVgi13
         /smqwUueHhC2tR8aqka9/iIZXaoqyNlMFs0SN7meKXrk4oxGVcOt7hW+wU9dwIiw38Mf
         Dsb8vBcZmbcdq7sxaOYpp1v7IQTTpsRypxtofX9rInM5KW5HyS3IA4wZ3bidfjWF6IT1
         qtUw==
X-Gm-Message-State: APjAAAWZkUfwLo26hTkijp67Mn2SS+Alnqlx5jnpYvh8fg/zIW9J0zLI
        aJR9wQZN2OiN40rX02+8jmdPIxgQy4Kqxmfm6hUFpPFbXgXNsQ==
X-Google-Smtp-Source: APXvYqyRColqHKOhn4iMIgeNXOivEgz2mu4ZEduWaPxQI1c56QurLgQdtjB6eorbWwrymHzWI/0PZ5LTSM1ZdQJQrIo=
X-Received: by 2002:a50:9b58:: with SMTP id a24mr1007726edj.29.1568783003621;
 Tue, 17 Sep 2019 22:03:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190909072815.23981-1-boris.brezillon@collabora.com>
In-Reply-To: <20190909072815.23981-1-boris.brezillon@collabora.com>
From:   Francois Buergisser <fbuergisser@google.com>
Date:   Wed, 18 Sep 2019 14:03:12 +0900
Message-ID: <CABK_QF10zXzkYaLgmkoDLcOYZHj4Es0ZuLWxM+mY=A3H-JBfQA@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: hantro: h264: Fix a comment in b1_ref_list_cmp()
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 9, 2019 at 4:28 PM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> So it matches the code and the spec.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Tested-by: Francois Buergisser <fbuergisser@chromium.org>
