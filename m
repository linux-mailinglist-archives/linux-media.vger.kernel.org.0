Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B07412C2C4
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 11:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727117AbfE1JIk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 05:08:40 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:44992 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727443AbfE1JIO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 05:08:14 -0400
Received: by mail-oi1-f175.google.com with SMTP id z65so13664646oia.11
        for <linux-media@vger.kernel.org>; Tue, 28 May 2019 02:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kDByEXQ6Hf0CbYi5tGfeP4Y/wNBK9tNQLpjcw1bOeZo=;
        b=OP/IgysQdXyBC7aWcc8ztRELyrZYczvf6ydXAFrauGcAeQPQ0aQnrLJXIIYpVOmxav
         P0uChtMDV5cZ69pAuopjFCS5FE2RovXlnTPZzChBtLIav+10P9CnxY/BWxIGjVBzCQeP
         6TjLD3xAnXvZm6vT318aWMnXZamSlqFjbL0Oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kDByEXQ6Hf0CbYi5tGfeP4Y/wNBK9tNQLpjcw1bOeZo=;
        b=dE1olceKFzO/NeWiN+CdLYa93tHEQX0vQ0x5Ya5GzCljoujso9wsad3gUnXbEn9OKz
         7rmX8wwoupxMzsEg0mJjZ7qjC8nKMRAfUvfBiQy3C2KwXqCeVBwJ0cjFdbp48b/kiBiF
         nbd491FWStHDwWbTqJhdPQEVdtMBTXpizdWuFuvrYwcQ/4RDnvq2ZpQT3IV7kZ4iedGI
         oLZJEdzajXAQYXFHfi6ElIBOvDDtXCz+o9DMDTZyyco6OORFal8o9S0XyaDMbmQ05BbJ
         HLKbRf4EwxZVQq1J0eqLsYSDQhUVw/E+rx+x854IGRnC/ojLQiyKAId3KbWAegskHvXi
         UjiQ==
X-Gm-Message-State: APjAAAV9N2f82RZq6caO/yaKBm40EP0kcoZ0yBxVKU920nJWforI7uBk
        YT/+qWMlCSvTJ9z/CUOEBa16SG1pVg8=
X-Google-Smtp-Source: APXvYqy7W5cXJpy3EJ0CIi0cT6ofAnAgVY3CugQLnphNodIOMOBLrg0pd5lWpQ0Vnu0SsVfS8BxIeA==
X-Received: by 2002:aca:330b:: with SMTP id z11mr678249oiz.27.1559034493444;
        Tue, 28 May 2019 02:08:13 -0700 (PDT)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com. [209.85.167.178])
        by smtp.gmail.com with ESMTPSA id x21sm4664585otk.4.2019.05.28.02.08.12
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 02:08:12 -0700 (PDT)
Received: by mail-oi1-f178.google.com with SMTP id u64so13688937oib.1
        for <linux-media@vger.kernel.org>; Tue, 28 May 2019 02:08:12 -0700 (PDT)
X-Received: by 2002:aca:3c1:: with SMTP id 184mr2080922oid.170.1559034491936;
 Tue, 28 May 2019 02:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190528055635.12109-1-acourbot@chromium.org> <20190528055635.12109-5-acourbot@chromium.org>
 <fa11a504-071e-f786-8564-cb7e95248f64@xs4all.nl>
In-Reply-To: <fa11a504-071e-f786-8564-cb7e95248f64@xs4all.nl>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Tue, 28 May 2019 18:08:00 +0900
X-Gmail-Original-Message-ID: <CAPBb6MWKm2DxRdtWur80EkxvLYj_t7Dr62E2h0Xdm5A6wURV5A@mail.gmail.com>
Message-ID: <CAPBb6MWKm2DxRdtWur80EkxvLYj_t7Dr62E2h0Xdm5A6wURV5A@mail.gmail.com>
Subject: Re: [RFCv1 04/12] media: mtk-vcodec: fix copyright indent
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-mediatek@lists.infradead.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 28, 2019 at 6:07 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 5/28/19 7:56 AM, Alexandre Courbot wrote:
> > From: Yunfei Dong <yunfei.dong@mediatek.com>
> >
> > Minor identation fix for copyright notice in a few source files.
>
> How about converting to using SPDX as well?

Yeah, that would be much better. Should have thought about it.
