Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8F982B17C0
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 10:04:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbgKMJEF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 04:04:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726160AbgKMJEE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 04:04:04 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BC96C0613D1
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2020 01:04:04 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id ay21so9849281edb.2
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2020 01:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=+ueWlKxVNhHafWyCXncNB9AbiZ5VgU22yoB46KFP4WI=;
        b=UqsaKQxw31YyIo5mum3eA9JIJv4qoDDyXzeyL876hbGcKId1yAqY3q29r6lrIO99V2
         QzjkbyHW150DZwNrFnGNB2yXv5yMKGxj4fNc6Se8SOQr2LtcVv7qOP99d7Cxj4Pzfa88
         c2UyMX4Op3N/EwH7dmh5VdFdroYG/IyEMwOtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=+ueWlKxVNhHafWyCXncNB9AbiZ5VgU22yoB46KFP4WI=;
        b=TIY2GMqN1qtjEJiE+lIHhhNFQkqHwIa3d7Oxidax7fwk2SVdTpE0uFb3RdeEEJYM0M
         HKU/tmvsOZyJl/k+Xt5NgSpzpC6tgx6j6L3gSayUozcWtoixjIxoFAdSiWJi9BD8XMEJ
         SmMbVsobQ5frjs2ccH19knBJQ3p1BFDeyaapwsxHc85FXYx01BvMnQMVk9lgQZclxBgV
         da9zcpBjZq2egj5hXVs3UkoEl/iBMRiFxoRHfuQEl3fqXcGzfwEXN4f7G3sbZekQHJTu
         h/4pBIAqg1eqSG0xUDPP9mXz83uj3F1rp2WJWqdMM3OCe385J+zHqAm+PFiEtNGG5q/P
         6Dug==
X-Gm-Message-State: AOAM533dve/jRk0xo0nNC4uVrrdFi/7Pe36Vbn9BE9FEAji9aKrAZ2gV
        ebLr22pdhUy/rdfAHsD9wFaIt4FKHNkJMAGIYI13g5aDFs/aWA==
X-Google-Smtp-Source: ABdhPJwfNmcF/de+IlCqddeyVTVqae4o6TlxUTBokiZ6OfytRTosWeeZTG5f6pjPBzqWbiZaq5hxT6S7YzDGgwI+F8Q=
X-Received: by 2002:a05:6402:38f:: with SMTP id o15mr1459117edv.73.1605258243210;
 Fri, 13 Nov 2020 01:04:03 -0800 (PST)
MIME-Version: 1.0
From:   Hirokazu Honda <hiroh@chromium.org>
Date:   Fri, 13 Nov 2020 18:03:52 +0900
Message-ID: <CAO5uPHN-30N8Hv8exx6bzMQQDbLGJpfQobZ_pzDtqC83k3nCMQ@mail.gmail.com>
Subject: How to get last frames in encode sequence returned by v4l2 encoder
 driver without V4L2_ENC_CMD_STOP
To:     linux-media@vger.kernel.org
Cc:     Hirokazu Honda <hiroh@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        J Kardatzke <jkardatzke@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

According to the official v4l2 encoder driver usage description [1],
v4l2 steatful encoder driver doesn't have a guarantee when frames fed
to a driver will be returned.
To make sure all pending frames are output by the driver, an app must
call VIDIOC_ENCODER_CMD with cmd=V4L2_ENC_CMD_STOP.
However, it is not mandatory to support the command in the current
v4l2 stateful encoder API specification.
An app can check it by VIDIOC_TRY_ENCODER_CMD beforehand.
My question is when an app has to get all the frames of an encoder
sequence, how we can achieve this without V4L2_ENC_CMD_STOP support.
This demand is natural and in fact WebCodecs [2] requires this.

I think there are two options,
1.) Ensure that a driver will eventually output frames if it doesn't
support V4L2_ENC_CMD_STOP.
2.) Change V4L2_ENC_CMD_STOP support to be mandatory

Any comments are appreciated.
Thanks so much in advance.

[1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-encoder.html#drain
[2] https://web.dev/webcodecs/

Sincerely,
-Hiro
