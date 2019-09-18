Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE9DB5BC3
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2019 08:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726991AbfIRGTX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Sep 2019 02:19:23 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:41374 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbfIRGTX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Sep 2019 02:19:23 -0400
Received: by mail-ed1-f65.google.com with SMTP id f20so3065854edv.8
        for <linux-media@vger.kernel.org>; Tue, 17 Sep 2019 23:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7OmU5MjiilYcaVCM1vh8BfeW1Mqj0bNWDwrVFQwMI3M=;
        b=nINMb4U4G7PBQUzXtOd/cbRQhOp5AKotN9wV2aN3b3AcLksmn0OLiqhvfR0O7nmOYN
         RugSOICpTz6ab3EL+jZFmalgSYZ8pMAOgT6eeEVBNRSXIpo0whBWqrIhuolBx1XTLkSi
         +vUkAbFiZmfeMIfd7oTfYW1xqvhcMePpYzhro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7OmU5MjiilYcaVCM1vh8BfeW1Mqj0bNWDwrVFQwMI3M=;
        b=b3Os39E2Q0ciNKaE84WA5Sz44cjpdQu8hXEnvavcm7Zf4Pc9eU5VjVovRT8TwUwLN3
         x+msXw2h4RDS6SQizqdbiyGnjBdiwTaF0b+SiAwyHDoFap/XY08XJCnnn+cxBeNE4phn
         eyh/PaLMNdTmmbzowY2sEzW/gLLv+MJZxmIO1/6ar1+v9FiL+o3ZYJzXkcDzHHdi+APv
         cjnyG7/WCPlWo5KYbpenj/OiJPJfXVmT+mnxnNi0Rl/UC2hQxvgUgZ5VISoK4JCCHg3X
         9oJAqjUcjV+zz8Tq98Rje/3N5wNhixDYneSG/HwCQlOOEr0xzxOv+O0jUkldhuTBYCsT
         Ms1w==
X-Gm-Message-State: APjAAAUfgoStJsTtfM0yX2ngPW1LW/Z22FKUix18xCGvSZsLIZ1l1r41
        nKt2Q+Wuh8KC/b8stja/55xEfa6YWwKi9w==
X-Google-Smtp-Source: APXvYqwpFw+89pYKbQ3ttSZIKE/i6CMJt13Y8hzUPLkiE5pXtpvIoY1TyiD1a3hQH0fGz8Ra6/2vxA==
X-Received: by 2002:a17:906:168f:: with SMTP id s15mr7863581ejd.109.1568787561278;
        Tue, 17 Sep 2019 23:19:21 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id b12sm200293edq.75.2019.09.17.23.19.19
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Sep 2019 23:19:19 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id 7so1029312wme.1
        for <linux-media@vger.kernel.org>; Tue, 17 Sep 2019 23:19:19 -0700 (PDT)
X-Received: by 2002:a1c:f707:: with SMTP id v7mr1387022wmh.116.1568787559416;
 Tue, 17 Sep 2019 23:19:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190909072815.23981-1-boris.brezillon@collabora.com>
 <20190909072815.23981-2-boris.brezillon@collabora.com> <CABK_QF07McU+iPvXLfnJY17bO0AOa3rkVEgFBswsM7UBYwygNQ@mail.gmail.com>
In-Reply-To: <CABK_QF07McU+iPvXLfnJY17bO0AOa3rkVEgFBswsM7UBYwygNQ@mail.gmail.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 18 Sep 2019 15:19:08 +0900
X-Gmail-Original-Message-ID: <CAAFQd5A-BJhuhkrZxcXqygXq_JotWOaUMPksNR_hVWZTG=4bww@mail.gmail.com>
Message-ID: <CAAFQd5A-BJhuhkrZxcXqygXq_JotWOaUMPksNR_hVWZTG=4bww@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: hantro: h264: Rename POC_CMP() into HANTRO_CMP()
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

On Wed, Sep 18, 2019 at 2:04 PM Francois Buergisser
<fbuergisser@google.com> wrote:
>
> On Mon, Sep 9, 2019 at 4:28 PM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > And use it for all native type comparisons, even if it's not strictly
> > required. By doing that we make the code more consistent and prevent
> > from potential incorrect results in case of overflow or when the the
> > values being compared are both negative.
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Tested-by: Francois Buergisser <fbuergisser@chromium.org>
Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
