Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46CF82E9AF9
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 17:23:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728013AbhADQWr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 11:22:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727919AbhADQWq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 11:22:46 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 238A2C061795
        for <linux-media@vger.kernel.org>; Mon,  4 Jan 2021 08:22:06 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 23so65577441lfg.10
        for <linux-media@vger.kernel.org>; Mon, 04 Jan 2021 08:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=J6AuW5fUv1BMzN7GXuqLe4jJTDgWk/nfp2F/gv5NAk4=;
        b=RjWGoQRKZhQSs8K+dDQh+Y7Q9t5cnGCmovY8mCQ+/gvLvZ9Li2Sv6CCikx4TwUBRMD
         djYUrsux5iogTTV59CCaDQ+nMKtoGFyOncq56bFO+zTmX355xI98/6qQWyQ4vKSS+Jsf
         NCPb+GTszNS+4+J0fq2jmuXedb9ZgsXGpee98P63qiJ9qrgE5r8BnXU9HpgBoPNkAGjn
         w+Gs/UxdpyXioo7s1fOVGugaS5rn6lyQn7lDEm2Mp1Em9uoCv2g1GJ7DtRd6HyuwBql0
         qcEtb4fN1HRdIb/lFFHhvvXMjOpdmg9U78UVURDX/8n+S2OjU9qHMVqBepFafR+Vly02
         vVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=J6AuW5fUv1BMzN7GXuqLe4jJTDgWk/nfp2F/gv5NAk4=;
        b=YcBQMS4dGmUW2Vg5/Ypswy9YiZM9yx0OMMfjOk7LRghtI+IzcKN5iEdT7t2wYtRcqF
         BkS6HcfQWyo+J7QxegrcFhN0i2jSFjReKTq5/bnr2Q9+nOwUtwNA9Oe2SrORy1d0mqnu
         AScdpsBYOtbPXMuqAsZ2g0Ooo0aCA+yj2lvSvor1i+gAneBFlF7/FSRJJnR/6uby/FDx
         s9KlfJdsagitAPddGSYMyxQevsB/7TFO94eeru4LI/wBgcHLtjfJNlMzHEMBQMxB0Af0
         J2VzoxmbsHuh3MKgHBc0A3HwWGdZorChzoH0TGDJyK0zXZ6VtgqmHvfN6lFvRXj56eqM
         AGsQ==
X-Gm-Message-State: AOAM531y0TH01KUvKC0m2ked/p/RJoXFoj6U3gU5ZTNtP4XGnkiyHsyq
        LbXkYa6gALBI75mDiRz7x9nkSwAbufpQI+ADY/k=
X-Google-Smtp-Source: ABdhPJyzTqsVxktetLxK9lzfynLttCg4uTaE0PdJ8zVkfKoZyAS/bOV7EHkIrnFPENvncG+5vQuJxJe1UBJopEp/ASQ=
X-Received: by 2002:a19:acd:: with SMTP id 196mr22236332lfk.539.1609777324562;
 Mon, 04 Jan 2021 08:22:04 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5DTW_YgVgyXqtccxQUm0A2kLLVcw_EhfsN0kZ9s2hgt7Q@mail.gmail.com>
 <X/KwKikMayH8AHnG@pendragon.ideasonboard.com> <CAOMZO5Dh-AKveQneMy5cuvWAX2PwTuC9Xq9rXMfAMD3WUoVGsg@mail.gmail.com>
 <X/MTatdI+tDQ/PQI@pendragon.ideasonboard.com> <20210104134511.4on6y6o6hdwdbthd@arch-thunder.localdomain>
In-Reply-To: <20210104134511.4on6y6o6hdwdbthd@arch-thunder.localdomain>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 4 Jan 2021 13:21:53 -0300
Message-ID: <CAOMZO5BtQsM+wR0i=bqLMhAXqdwJ5Eag1DNzUHCf+oGmntVoOQ@mail.gmail.com>
Subject: Re: imx6ull capture from OV5640
To:     Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        linux-media <linux-media@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        =?UTF-8?Q?S=C3=A9bastien_Szymanski?= 
        <sebastien.szymanski@armadeus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

H Rui,

On Mon, Jan 4, 2021 at 10:45 AM Rui Miguel Silva <rmfrfs@gmail.com> wrote:

> I really only had the warp7 board which only had the csi2 as video mux
> input, never got the chance to test it with a parallel input. And the
> driver expects that we always have a mux. I was not even aware that an
> imx6 would have the same csi ip.

Please check the following commit:

commit 0486a18ce82bd00d69ddc0fab8faa4b80df2117b
Author: S=C3=A9bastien Szymanski <sebastien.szymanski@armadeus.com>
Date:   Wed Jul 31 13:33:30 2019 -0300

    media: imx7-media-csi: add i.MX6UL support

    i.MX7 and i.MX6UL/L have the same CSI controller. So add i.MX6UL/L supp=
ort
    to imx7-media-csi driver.

    Signed-off-by: S=C3=A9bastien Szymanski <sebastien.szymanski@armadeus.c=
om>
    Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
    Reviewed-by: Fabio Estevam <festevam@gmail.com>
    Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
    Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
