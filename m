Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2010B33C28
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 01:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbfFCXzx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 19:55:53 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:40004 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbfFCXzw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 19:55:52 -0400
Received: by mail-qt1-f196.google.com with SMTP id a15so11659184qtn.7
        for <linux-media@vger.kernel.org>; Mon, 03 Jun 2019 16:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=BYb53a4r6sspVsczRW98hDfn+uqNP4/nosr7WGO7qC0=;
        b=sOCaTKUGUPksbeifwLLGU/68ZMUy7xNTBov7lO2sa7Ai7SkIkUDBIeFautz//5h3gc
         3xr09IQd7bZjBcXKhpSEIuXKNDXZRJ8pN7WrzaJZFL78HaWlcBqOryILoPSQNZhOnGWd
         s62/nzu9GZ5gTf2+xpMn1nSNvyUeT2fvqIC4EjBiK6EBY0VLOBTkK0sKbLJ0GYrtWs+l
         qQ5sj80LRvalq72swo38SdEZVh9h7nyUYiODW0L5I4kBJ8uCFIB8IPJaNV2qjYGLBQwF
         4y4PS5FHbqjQLnPhlLmxV1a5b+6iRH4uenEpsIXEAirioCE1XeF8iOZyXuipC3XIpjfK
         d7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=BYb53a4r6sspVsczRW98hDfn+uqNP4/nosr7WGO7qC0=;
        b=W2d/splYLb7vt9vPkE84kDOJVSHBOGoMd0g8c1Im+fqhO+CHRnGem4fHvyNQLsDL3x
         Ylzvvm7z2RP4xjlkua8krha9MwUPX25NV820lkvwD7wftGQoqBA3h0ofHNh65BcL13U/
         VswXswEw2HmZIyxFS7yjLXLeSelTccsrUIr8SobBlvtdCuUYNGlfE9OVa7w/9dxmHtwX
         ngCj9oRryB4moIjtnUX2r4yCQdPqDcSMgnD2nbOP6PrOkZnsRsV0vOZ5F0CPKj+8Ir+2
         YRkYXYIJOzIPGXwsVuJX1kHrXINHlaWmRSta+SGD7ohPIs5CcVURvETYK5l9MWQcWNlE
         9apQ==
X-Gm-Message-State: APjAAAUk8YyMsKQBnEJPn7L7rqVps53Uszql5aQaplUO49DI2WcG/37K
        u7mNkgGF+SEuOdYH9SQ0KgYq9w==
X-Google-Smtp-Source: APXvYqxZKSGmk/gGhCqu6HIe/46Jafz6E8Imc3cCd1ighBLM6N6QBzEDKhj2ocZnj6tKhKnAJljbCw==
X-Received: by 2002:ac8:1e15:: with SMTP id n21mr631247qtl.20.1559606151948;
        Mon, 03 Jun 2019 16:55:51 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id f189sm1500748qkj.13.2019.06.03.16.55.49
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 03 Jun 2019 16:55:51 -0700 (PDT)
Message-ID: <0fbe395c644bfba4830e98d208c143b8a265498a.camel@ndufresne.ca>
Subject: Re: [PATCH RFC 5/6] media: cedrus: Make the slice_params array size
 limitation more explicit
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Jernej =?UTF-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>,
        Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>
Date:   Mon, 03 Jun 2019 19:55:48 -0400
In-Reply-To: <1764986.tDiRxPxGAQ@jernej-laptop>
References: <20190603110946.4952-1-boris.brezillon@collabora.com>
         <20190603110946.4952-6-boris.brezillon@collabora.com>
         <1764986.tDiRxPxGAQ@jernej-laptop>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 03 juin 2019 à 23:48 +0200, Jernej Škrabec a écrit :
> Dne ponedeljek, 03. junij 2019 ob 13:09:45 CEST je Boris Brezillon napisal(a):
> > The driver only supports per-slice decoding, and in that mode
> > decode_params->num_slices must be set to 1 and the slice_params array
> > should contain only one element.
> 
> What Cedrus actually needs to know is if this is first slice in frame or not. I 
> imagine it resets some stuff internally when first slice is processed.
> 
> So if driver won't get all slices of one frame at once, it can't know if this 
> is first slice in frame or not. I guess we need additional flag for this.

A first slice of a frame comes with a new timestamp, so you don't need
a flag for that.

regards,
Nicolas

> 
> Best regards,
> Jernej
> 
> > The current code already had this limitation but it made it look like
> > the slice_params control was a single struct while, according to the
> > spec, it's actually an array. Make it more explicit by setting dims[0]
> > and adding a comment explaining why we have this limitation.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> 

