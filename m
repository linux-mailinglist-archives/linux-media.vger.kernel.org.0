Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4DF5589E4
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 20:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbfF0SYP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 14:24:15 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46528 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbfF0SYP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 14:24:15 -0400
Received: by mail-lj1-f193.google.com with SMTP id v24so3324594ljg.13
        for <linux-media@vger.kernel.org>; Thu, 27 Jun 2019 11:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kss7oas/qNZzmNcSDwDrLjOc2Zc6Ri9iEBSld4aBFCw=;
        b=n6RyHdjCqBOGvBWn4oYvkW1QCRhcIj1wSKjKUtgGKRAPsIRAN8i+5uyLVpET1Rz9io
         VOI7F4HpIKQpgxkQ2t5D5Lkb8WI2xVJtyGQlNaSa33I6e5hsD2qgl+vtlETnvKfO1kn0
         nIpKOJxA3XP/N3q0Ig4ZuxE0N6Hddzrcty0VRwUaR6lmewEcXmafXLMugTADpkPVffjF
         NS5VqCnOnVYeEvUb5sF+MwTm9L+hqAoVjMpGHflNs66XAqU1poekOBwUjoauJsB7tvfw
         g/d/da+b/iFcHE+XievrT3XTFmCqLn5gsvJP7Vj2qlX3KReq7GnyhUSlnpx0s0Xcv28I
         20VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kss7oas/qNZzmNcSDwDrLjOc2Zc6Ri9iEBSld4aBFCw=;
        b=lXHfzRiGt9KrOhNjx62WBjlbRDZbKYmAEOiTn2q5VLiacrhkBDZYgbnvPaq3nQ5+5B
         Mo76ZTBauB4PZReaS2yqUbBuLMLddnSg/PcSCv/ddBfipV3VYF064wbdpXwP0/RtBPg+
         vLmDDcO22shg2uxjTEcSoOeXqvyCEa2P/kzDRGTXWRk/n/+C4dGdaPO6H0Gqb2SmYSDc
         m0CTn/NqBOv+YalOosJlZ0uzfylyq1pA1MgC4JT8PfYsBo9wkhik7Ck+S5tJlCmWodxV
         wayicBWRqvdQdclMiOlhA7XFF5Rt6ej1HT6hbZEX66+ZmKaaDuWuBX6Y40adShONziJl
         KDOg==
X-Gm-Message-State: APjAAAXXPG3EpWJB9N+qdVqm9W7rZmmtwTBerGzty6ebdoYtHfY8ij/O
        /xcSFUPeydrfJ9siPfibs3+hVuUODNEG3tQPwuA=
X-Google-Smtp-Source: APXvYqzvPJqvZLkfp5Qjg1FqLej05xiwwY3YPQJ2oTfGBlAPoiUObqMxbA5pI7ekzF3h4KFc5tb/dUVZT0DCgEGN6Vc=
X-Received: by 2002:a2e:4e12:: with SMTP id c18mr3490000ljb.211.1561659853285;
 Thu, 27 Jun 2019 11:24:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190626235614.26587-1-festevam@gmail.com> <20190626235614.26587-2-festevam@gmail.com>
 <20190627162742.t2ehnbrqaorv7v6v@valkosipuli.retiisi.org.uk>
In-Reply-To: <20190627162742.t2ehnbrqaorv7v6v@valkosipuli.retiisi.org.uk>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 27 Jun 2019 15:24:02 -0300
Message-ID: <CAOMZO5B9KMtbc8WLfLQi6dMM-mTi3ca0WFHvEVJ6G0stEm3uWQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: ov5645: Use regulator_bulk() functions
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        hverkuil-cisco@xs4all.nl, Todor Tomov <todor.tomov@linaro.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Thu, Jun 27, 2019 at 1:27 PM Sakari Ailus <sakari.ailus@iki.fi> wrote:

> This appears to change the order in which the regulators are enabled. Is
> that intentional? Does the sensor support this order as well?

Good catch! I have sent a v2 that preserves the regulator enable order.

Thanks
