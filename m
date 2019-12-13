Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB6211EC6C
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 22:02:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbfLMVCO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 16:02:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:39742 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725937AbfLMVCO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 16:02:14 -0500
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 07EDB2465E;
        Fri, 13 Dec 2019 21:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576270933;
        bh=+dKkT9qss0TqkoVOkTkEq+PspUmRCwAnZfc5MFA4ENA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LhHtURfCvYmIuRkJl99Qo4S/nI7eK7un+4JAniuPEYc13zprB59KF7t7i++Z6NeZ0
         yaLz2PsMmvHqR/ShLKJhzoFL45g70ouFfoSU8+Ug6F6LS86EAMxj6EaZW+wT/2pat3
         3jyrr61NeviJnSr9l2R62Si/MxU3Oq+AGSELqrAI=
Received: by mail-pl1-f176.google.com with SMTP id p27so1725298pli.10;
        Fri, 13 Dec 2019 13:02:13 -0800 (PST)
X-Gm-Message-State: APjAAAVvFC+lug4SRvof++l8PEvfQo7g/zkl7LVjmMPQIbErPwoNYMiY
        9frVdBYIfwWo896JXbdetgeHplb05fqLhZpjMw==
X-Google-Smtp-Source: APXvYqyB90WtC9yvdYd6CmgFqz44rFwwJP+EgXqkcen8gQAUWJSXIFADvOtFxe2f6ycbB1XDnFfJpLpI9ICEyUjapLU=
X-Received: by 2002:a0c:f68f:: with SMTP id p15mr13564621qvn.79.1576250763417;
 Fri, 13 Dec 2019 07:26:03 -0800 (PST)
MIME-Version: 1.0
References: <20191213074055.26193-1-maxime@cerno.tech>
In-Reply-To: <20191213074055.26193-1-maxime@cerno.tech>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 13 Dec 2019 09:25:51 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLxGe9sWrTdZhuT69o_LBxQTi6TxcbT28WdC1gsPw5+fQ@mail.gmail.com>
Message-ID: <CAL_JsqLxGe9sWrTdZhuT69o_LBxQTi6TxcbT28WdC1gsPw5+fQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: media: Convert Allwinner hardware codec to a schema
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 13, 2019 at 1:41 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The Allwinner SoCs have a hardware video codec that is supported in Linux,
> with a matching Device Tree binding.
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../allwinner,sun4i-a10-video-engine.yaml     | 83 +++++++++++++++++++
>  .../devicetree/bindings/media/cedrus.txt      | 57 -------------
>  2 files changed, 83 insertions(+), 57 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/cedrus.txt
>
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
> new file mode 100644
> index 000000000000..47c8513555b2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: GPL-2.0+

Do you have rights to change the license (adding '+' aka '-or-later')?
If so, please add BSD-2-Clause. I don't have any other comments, so
just confirm and I can change it when applying.

Rob
