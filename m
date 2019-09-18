Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6361FB5AA0
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2019 07:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727132AbfIRFEK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Sep 2019 01:04:10 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:36446 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726444AbfIRFEJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Sep 2019 01:04:09 -0400
Received: by mail-ed1-f65.google.com with SMTP id f2so5400268edw.3
        for <linux-media@vger.kernel.org>; Tue, 17 Sep 2019 22:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OHURgL8YrqfsdYLneBy7ACmZxY783i3qLJ/kVnEBgIg=;
        b=NGNBMnDrYY6pjbfCkUnyS1o9LLcMfIfjqirQfoaYRgbSycTvjp6EI0K9zs8G2udNpq
         21FAlzEKxelzZ6YfJumj4+I0xhan3zcHjyQCQYJaDp2CflBYW3i4Xs0BD/wd3234UftB
         ZDYL7XxCFcSPEfoe8Y0RD4rgHqiCq8oIrfmqUTwyA9W1mNhn0mDJguZ/3WnxYmkwAIOE
         RhuzLP4LlyKDkHEiMoQH0rtDHQjfzd6m0woEXBLCEWQ3vtbGFR+klpAs6gE0Y5Yb27G1
         r1xAtwmwt/SdhqsteOugdam7Su8J8OhNhi1NC7afpsY9d5ivMyqfegC4cY0mL4qhw3L3
         sT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OHURgL8YrqfsdYLneBy7ACmZxY783i3qLJ/kVnEBgIg=;
        b=JACOO2sSHPlUbzbW8QcKxCE9+SxLCNAa5/yJtd49YABwmND4vab2PablCcq5BbNOrD
         QntcnWF9sJfBeGOdzQJ2tXbF4sUdfb3yTMj6dsOjOd3huYaOI7ZYi5Nc0tIDRP7iHEGA
         PRAtgvh5e8oyeraFoVBE4pjtGSjtNxQSeNNTH5xEIonweS97ux8O13PWMgxrsApoU8Bu
         o8nHThZYSS0dqSW1Z6y+4gsHIXpI56o1rDmSmo9Jocv7tp9UnztNxcdZ8T8dGeG1zh/d
         cr9Y1qhNsMMVyT/YssZkTmLTxWiGQ7i6xdWeO7u+ESLk3K9EuH7nqlHy5ootUxDpsZKI
         qgRQ==
X-Gm-Message-State: APjAAAXxkvuNG48KwXDztW5DYUagGCXEvN7evygL+R4OD2K2YuuQmbVk
        fW7jxl6owh40ugIwixXN3nxKYqTGvSrIyr4//nlEaQ==
X-Google-Smtp-Source: APXvYqyorIk2TG7oqekd+bCVHiaStJd/Xj/lzbL53mMLXZHPY2Wr3tcqMVCHqTFgVIPcda4MM56EjA9c+IujUCJ7DiI=
X-Received: by 2002:a50:95c1:: with SMTP id x1mr8217609eda.180.1568783047335;
 Tue, 17 Sep 2019 22:04:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190909072815.23981-1-boris.brezillon@collabora.com> <20190909072815.23981-2-boris.brezillon@collabora.com>
In-Reply-To: <20190909072815.23981-2-boris.brezillon@collabora.com>
From:   Francois Buergisser <fbuergisser@google.com>
Date:   Wed, 18 Sep 2019 14:03:56 +0900
Message-ID: <CABK_QF07McU+iPvXLfnJY17bO0AOa3rkVEgFBswsM7UBYwygNQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: hantro: h264: Rename POC_CMP() into HANTRO_CMP()
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
> And use it for all native type comparisons, even if it's not strictly
> required. By doing that we make the code more consistent and prevent
> from potential incorrect results in case of overflow or when the the
> values being compared are both negative.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Tested-by: Francois Buergisser <fbuergisser@chromium.org>
