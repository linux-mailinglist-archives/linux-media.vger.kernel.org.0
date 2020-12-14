Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8A5D2DA267
	for <lists+linux-media@lfdr.de>; Mon, 14 Dec 2020 22:13:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503495AbgLNVNF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 16:13:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728716AbgLNVNF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 16:13:05 -0500
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 237F6C0613D3
        for <linux-media@vger.kernel.org>; Mon, 14 Dec 2020 13:12:25 -0800 (PST)
Received: by mail-qt1-x832.google.com with SMTP id b9so12992791qtr.2
        for <linux-media@vger.kernel.org>; Mon, 14 Dec 2020 13:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=SYdW4fFLmTGRGMJ7WtNGI4FaoP+0fTQweiqobDWY4vU=;
        b=Za89ne4eGwkio8T/augYS1z6q8XqjvVgiN2/sfqfWtQHhf3gUbwuUI/peQyWmKXU11
         lM7DTlUGOGM4UeJXe+yXKz3p51sEj/XeCcWTSI8Yz3Q9eKOv59rGLbkpR/Lf6kRMCB7a
         hwyxuVUS3iVmmNbIZoACqGQLL1vjV5QDpf5M13xzZJXBgcsw7DamlnqX08HOZl53D9wF
         CVPK0O1jR5UZWt9RgFLIUHJsV0xcDfyWAF70kNI6dVQ2LB+3RreK+vMvGR5hsR5qpGIq
         yFhC/CouWJWdyiBRN1XTXmJOMxy4Fx7IRfUwdbD4CtSaeBhCX4gsJKUo+YF94zcJqnk8
         3BHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=SYdW4fFLmTGRGMJ7WtNGI4FaoP+0fTQweiqobDWY4vU=;
        b=uedBfvsx7Zn3uW/XXrVcD4U3FOGjIy/KN/X/TmfViYpdQgn/pWbsojnHrOBFpPrLa0
         fxg2iPm1cY3UNWGDtMJrEbXPS+6Ur4ePyIGway1LZkE4VU/48l5xw8gpEMXGafNk+xiQ
         Nb/Zdf+6LFWXvrTFsMd29EukBj+80M3Q3em5MJihagMdXOtjMDsOKmjJ0CZSIn53la/0
         L5arWVDnpMOkEgYDzR/vlLymD1NbsWOPj6P6F5pxLjzj85XNH026YvpB46Xb6yJLjRMd
         GreUDoNzqIUJwSse1nHHAJ3u85vDM7AygJ4sDTIj8QvgZH6HKjaDDBcFY7TDbCFFENc5
         Fb2A==
X-Gm-Message-State: AOAM531RgjyaLaBv77SPT0ltU/qB76OuE6C3Dr5PrR3w+BkyuTZVyOS5
        9RS9votfiiRqix3HIXNKpHBY8w==
X-Google-Smtp-Source: ABdhPJyeXA4RznQi6HMlFqS8M48RHDKs7InpJz8fJjhBVRuIHVHPiziteot4AMyx9zn2QqXw47NRaQ==
X-Received: by 2002:ac8:4818:: with SMTP id g24mr32802858qtq.252.1607980344392;
        Mon, 14 Dec 2020 13:12:24 -0800 (PST)
Received: from nicolas-tpx395.lan (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id f22sm14913274qkl.65.2020.12.14.13.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 13:12:23 -0800 (PST)
Message-ID: <2c149355d8bde35098d03c9e1f72777d5a40eb80.camel@ndufresne.ca>
Subject: Re: How to get last frames in encode sequence returned by v4l2
 encoder driver without V4L2_ENC_CMD_STOP
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Hirokazu Honda <hiroh@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        J Kardatzke <jkardatzke@chromium.org>
Date:   Mon, 14 Dec 2020 16:12:21 -0500
In-Reply-To: <CAAFQd5BzLXnv7FY8BRi+45KrJ1Ph3PZeDS0SQe4Wkg0OYVbsxg@mail.gmail.com>
References: <CAO5uPHN-30N8Hv8exx6bzMQQDbLGJpfQobZ_pzDtqC83k3nCMQ@mail.gmail.com>
         <CAPBb6MXQjG8p2dh9T+GpFncu8WAUwjsWw=ggSMW7QdP0NQrskQ@mail.gmail.com>
         <CAO5uPHNGNwXadtRY6CYghsCYaPNCxOkxYR98CYvPfF0ZrqSPHw@mail.gmail.com>
         <3d557792606109728235db6b1a15d7313cce4096.camel@ndufresne.ca>
         <CAAFQd5BUsrjw8S_w1U03G8f-=93FFTBcCfu-Cg6bwxN9JPWnWg@mail.gmail.com>
         <210906667a4f582c81ec8375a586a5ba47b93881.camel@ndufresne.ca>
         <CAAFQd5AraF6sf79=q848VO1tWTWj6VaeG5sa38u_k4avkTPBGA@mail.gmail.com>
         <366ab6d001fd2f2db41e011d7348b0b54d4a8be1.camel@ndufresne.ca>
         <CAAFQd5BzLXnv7FY8BRi+45KrJ1Ph3PZeDS0SQe4Wkg0OYVbsxg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le vendredi 11 décembre 2020 à 12:18 +0900, Tomasz Figa a écrit :
> A lot of the hardware encoders implement only the basic codec
> features, e.g. they would only encode in-order (no B-frames), have at
> most 2 reference frames, etc. In that case, it's as simple as waiting
> for dequeuing a CAPTURE buffer with a timestamp matching the OUTPUT
> buffer being waited on.

To me this is not a justification to allow not implementing that drain process
with CMD_STOP. Having a single drain path ensure the userspace will work for
both non-featured and full featured encoder. In the end, recommending to not
implement CMD_STOP seems like giving vendors a short cut, which I don't think is
beneficial to the users.

