Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0793574E4
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 01:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbfFZXXK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 19:23:10 -0400
Received: from mail-lf1-f41.google.com ([209.85.167.41]:38072 "EHLO
        mail-lf1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbfFZXXK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 19:23:10 -0400
Received: by mail-lf1-f41.google.com with SMTP id b11so257826lfa.5
        for <linux-media@vger.kernel.org>; Wed, 26 Jun 2019 16:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VM9AlqMybH36J/+PMUnvMpdqk5cH2IZ7g2BhZHuDZ3k=;
        b=tbiAP9090QOZMug4BMi9/U38etCfgH7+qhCJwtYnnDI48D/amnI/lqxXlUTQdW3Juf
         6SgtXmo++6Bw9T6MHSjgoa1KDTI7gbHmLkG1Bo1Gs3WBM6wDKPsR0+wS1LOKC0HR20uG
         XqYROrN94ZAAJzM/yqvR8Siy+pnN3cBtDHFYpnsFevEffC7xmu+NoFkA7iiV/wPj7HB6
         8s3slJ00+Z2f/Pbs/9Zzypt050NvZW9SVEtNc6ss+jPhqMgNUwWKkakABMwYDWZqjxwI
         aHqYA26QdqYNAefOJ2anUEl2+pKYFEeVk5YkyrahOptTmvfj4PCq6OCBJ/yj3DCWbv9M
         +hMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VM9AlqMybH36J/+PMUnvMpdqk5cH2IZ7g2BhZHuDZ3k=;
        b=cwIEUgMAWgoMi3iUHCjlpH/YbH7feSSceKLid7J1QtsYwWgTcDTlksKDQhzgiepJkU
         GQmR7UhuL56/7zG3QtTKlQokSFRU27rzFbOkkW5aIYOypgAiGXfXKMHypQQX2nULW2kI
         +hJsYR6+5U0pCqK/TO/3lvpzRJ82U3WabXNQoT8pZyI3S+57O/95OneMAI5YUTGGHFnY
         QUvLdr0Ag4Ixx+6MJikZp4wXhCMbOioxh0klZdjxMi8P9sl0lspufSqIYgj3UbM6nKqR
         +CoJq+rbX0ACYIGkz9+q6dZwHIT/QMFjNGT8veb9wuRbnxvdUzx1f8XsSRhOPu2XtPLi
         arTA==
X-Gm-Message-State: APjAAAUqZ35Fi3ML+P1LxQaZ3sbMizGRW3VYQsk1a2zjGbBfK0PDokwu
        JXRZMTRMtZdiY54SQcNbXj/wCr3t1Ex3kaQw/2s=
X-Google-Smtp-Source: APXvYqyXbsU738YQcpAmo+pqE+HHatpsprlNAgMftk4ES93g5N1dErIHcoYMJmCyEofk0/tkuK5rfG0dPN1pBPmik40=
X-Received: by 2002:a19:5046:: with SMTP id z6mr318534lfj.185.1561591388075;
 Wed, 26 Jun 2019 16:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190625203945.28081-1-ezequiel@collabora.com>
 <1561535121.4870.1.camel@pengutronix.de> <CAOMZO5Be-5Em0DR5nCBfzsW4mKMz6ThF+kSukcG6WuFF-0vwaQ@mail.gmail.com>
 <3797cdd2-f6c8-f23d-788c-b8efc3e75b21@gmail.com>
In-Reply-To: <3797cdd2-f6c8-f23d-788c-b8efc3e75b21@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 26 Jun 2019 20:22:57 -0300
Message-ID: <CAOMZO5AGZcsrzogzxRo9UNauYgWZLdiVE8vJ3-FxU2X4K8Jwxg@mail.gmail.com>
Subject: Re: [PATCH] media: imx: mipi csi-2: Don't fail if initial state times-out
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kernel@collabora.com, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

On Wed, Jun 26, 2019 at 6:19 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:

> Did you only get the LP-11 timeout warning message with this patch on
> the OV5645, or both the LP-11 timeout and clock lane timeout warnings?

With this patch applied I get only the LP-11 timeout warnings, not
clock lane timeouts.

Thanks
