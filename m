Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2267CF030
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 03:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729647AbfJHBHj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 21:07:39 -0400
Received: from mail-lj1-f172.google.com ([209.85.208.172]:37438 "EHLO
        mail-lj1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729648AbfJHBHi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 21:07:38 -0400
Received: by mail-lj1-f172.google.com with SMTP id l21so15678321lje.4
        for <linux-media@vger.kernel.org>; Mon, 07 Oct 2019 18:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2mb360uqB7tXssXvXRKpLquANfHbile0JxaeoT2WoWc=;
        b=IOPc4KupybuIKhDnbMYOVk7iGIPRdr5ZcrFzZz1iKBC4T+YzL3Sopu2U/7nqVORymn
         M0lgKzt/PUjPemBIDDzCQeVm/Ze4nMGsAzK58EgX+k2TXnjnhuN4nDFD3EcHcez/7ggp
         fwRfXOQkno0+14m8nMYmWmdckKTz1GoxGP1/pWlZOS3hhwsEGQpvltPCXYsXbP6PcvYj
         uo3BmNeSyVB/sGoCnXARSMbakqsHzZPBHs9l8g09XykPGpAf1epzKXgg0VkQXzLn/KCt
         MDJatvnIoYy986DkcpnABQCkOyXGrjGGlGCr8fxV6yHrxyyUeCufiM7nXHAjTxYS86bQ
         7G7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2mb360uqB7tXssXvXRKpLquANfHbile0JxaeoT2WoWc=;
        b=PqpDXnkV/ow6J42bvDnwmzkYCRWOigi+Z+u5WaHZJVLp+PVXcakPHANxx6ps+iwLmf
         4nTcLSzw+HIqQlJRas88GN44u/NrLTEnfCgAjhD/NNyFff7DeNR5hluaFmUswZu2TP/D
         NaGQsK1WXFf4qIMMZ7ZTuOB6asIpPi1ETvdVaDyCb0ZXbvVEIEfn4JY4hIFc+zD2/GAA
         K0uFgHG2Vix+m5Ktc+uP4LNQEmI8lm95BHbD9K8odgwHQjYsJwDavWnYeP6UXiUkFyKn
         f+vQfIeXS1TUit8Mq8Bj9JecU5HDaTm0Hmwz3MlpdbNuB7vplHO1rMsi+VwGfQdJGGHA
         G03Q==
X-Gm-Message-State: APjAAAXbhuGRneznUiOlaSMAr3g376KeGgLHi8Zq5CYaGerURCVaHkrO
        SUCJ2jY7W3MLRedAWkF7zPD6Ig07ioaxY6p/x9s=
X-Google-Smtp-Source: APXvYqzL13/09ZGGlC7d4zu+4iW+6Fw88qa2A9ZGZP9xzJK0Zv2TN1YeyoP/HcHh/Fj6jLSyxBYteEWQOeoEbTlLARQ=
X-Received: by 2002:a2e:9750:: with SMTP id f16mr14042298ljj.239.1570496856284;
 Mon, 07 Oct 2019 18:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5B2kO7_xmA2jmqkH5cxE4hW+TYJhont-rtq0Jck3GKA0g@mail.gmail.com>
 <ba4541a2-9f91-afb6-57e8-84d51de61061@gmail.com> <CAOMZO5BRxvY2=8md7mo0ygsFXdrk2CVYrN_L5q-TQU_AhWCdgg@mail.gmail.com>
 <ca2d67ed-9da1-7579-05d1-4c912bbf8093@gmail.com>
In-Reply-To: <ca2d67ed-9da1-7579-05d1-4c912bbf8093@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 7 Oct 2019 22:07:25 -0300
Message-ID: <CAOMZO5Cc9sJN+uP5ZAbcAsGoEKH_jN2v0hiCrMrHqj5Qci_Sew@mail.gmail.com>
Subject: Re: ADV7180 Capture with i.MX53
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tim Harvey <tharvey@gateworks.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 7, 2019 at 9:51 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:

> Ah progress. Try:
>
> v4l2-ctl -d0 --set-fmt-video=field=interlaced

Yes, with this hint I can run:

# v4l2-ctl -d0 --set-fmt-video=field=interlaced
# v4l2-ctl --device /dev/video0 --stream-mmap --stream-to=x.raw --stream-count=1

And it seems to accept the capture of a frame.

Without passing field=interlaced, I used to get:

# v4l2-ctl --device /dev/video0 --stream-mmap --stream-to=x.raw --stream-count=1
[  163.838944] ipu1_csi0: capture format not valid

So now I need to see if I can get Gstreamer to accept a pipeline like:

gst-lauch-1.0 v4l2src ! kmssink

Thanks



> Unless you specify interlaced at the video interface, the driver will
> just combine alternate fields into seq-bt. I guess the v4l2src plugin
> doesn't support seq-bt.
