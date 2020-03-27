Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3680194F78
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2020 04:05:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727805AbgC0DFQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 23:05:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:43572 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726496AbgC0DFQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 23:05:16 -0400
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 621242083E;
        Fri, 27 Mar 2020 03:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585278315;
        bh=YIf6aQbdkDH1cQnI7Mm8lvierFh+tPaKpJdINhnNVxg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gscSa0b2I4VjrlYCOv6soG876N5HH7XtFKOr7CVoyAdEubKbOAJ2tJIWrq1LDaPTv
         2OgcQNdP2Smb82Ad4//KDNT/R+YSAMyUtelYOm0raw7jA6ZAs18OP02GBfdrLMIrk+
         4mrxLpUGuZIV9KQiswZsEDoDT2LpjukSVdhCuT54=
Received: by mail-qt1-f177.google.com with SMTP id c9so7493936qtw.7;
        Thu, 26 Mar 2020 20:05:15 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3EcYiEJR8aTgYF3FBJe0EykJJSVmwDyCUv91OtZP/pPZ9JQ6K8
        liKQAzEcFgKVaM6tnBMILar6ZpV7DqOb7rVOSQ==
X-Google-Smtp-Source: ADFU+vslGC615com2rm1wCgzAp5WB2w4yiciuQ1qMy22ERjZcJ2jcVj8Uw6zWW9MVqImCv+H7p5eSrCRLUyipOXv8/Y=
X-Received: by 2002:ac8:59:: with SMTP id i25mr12051193qtg.110.1585278314570;
 Thu, 26 Mar 2020 20:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200325213439.16509-8-ezequiel@collabora.com> <20200326191343.1989-1-ezequiel@collabora.com>
In-Reply-To: <20200326191343.1989-1-ezequiel@collabora.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 26 Mar 2020 21:05:03 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ4sLE8mf=Ssg3wxbpf-f65i+YRkCBj+8DVGPonRA0=9A@mail.gmail.com>
Message-ID: <CAL_JsqJ4sLE8mf=Ssg3wxbpf-f65i+YRkCBj+8DVGPonRA0=9A@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: rockchip-vpu: Convert bindings to json-schema
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Collabora Kernel ML <kernel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 26, 2020 at 1:14 PM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> Convert Rockchip VPU (Hantro IP block) codec driver documentation to
> json-schema.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
> v4:
> * Fix issues pointed out by Rob,
>   and make sure now dt_binding_check passes.
>
>  .../bindings/media/rockchip-vpu.txt           | 43 -----------
>  .../bindings/media/rockchip-vpu.yaml          | 74 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 75 insertions(+), 44 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/rockchip-vpu.txt
>  create mode 100644 Documentation/devicetree/bindings/media/rockchip-vpu.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
