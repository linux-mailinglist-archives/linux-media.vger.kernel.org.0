Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E523E131B53
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2020 23:28:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727152AbgAFW2K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 17:28:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:58844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726721AbgAFW2K (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Jan 2020 17:28:10 -0500
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BAE4A24679;
        Mon,  6 Jan 2020 22:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578349688;
        bh=rTHOxJUOIChFRf7dTkpIQvZPNS5PI3aBhK4tnTxHTso=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rbvUGtRkLEnm2FOVFDxL99P5oJz20WQa5tFLv9pzHTPe+VTTlH/BMydAKDogf3P6v
         020hIch7atDLHRQMJFPZzdfn0gazAvFvDqJ+VzTAWs+Vr1pPrrFCIEtYs5qI/EhGtN
         UQhh8l34D8hbUx2wwx3tNTfwVBD5oBP2frJy5vq8=
Received: by mail-qt1-f172.google.com with SMTP id n15so43786149qtp.5;
        Mon, 06 Jan 2020 14:28:08 -0800 (PST)
X-Gm-Message-State: APjAAAXnEQaiaQrtiTK/RlRQvWxT4avDX71ZveckWjKtmSgEI0RDoyq3
        aNnABtdRLmnM24tDcccA5AxHZtBu9ry5PYKHxA==
X-Google-Smtp-Source: APXvYqwVixOr4A1a7oe+76qjMKIzU19osJwUbcFGBZCzSX/7V+QBSOFhX0//2c3Px8FWbPRIeaJstLXgvayduvlSds4=
X-Received: by 2002:aed:2344:: with SMTP id i4mr79020804qtc.136.1578349687943;
 Mon, 06 Jan 2020 14:28:07 -0800 (PST)
MIME-Version: 1.0
References: <20191227200116.2612137-1-helen.koike@collabora.com> <20191227200116.2612137-9-helen.koike@collabora.com>
In-Reply-To: <20191227200116.2612137-9-helen.koike@collabora.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 6 Jan 2020 16:27:56 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL25gQZxdN+2ciSj7HLbOjN3OvjY-GrA57m9_y-CdYZLA@mail.gmail.com>
Message-ID: <CAL_JsqL25gQZxdN+2ciSj7HLbOjN3OvjY-GrA57m9_y-CdYZLA@mail.gmail.com>
Subject: Re: [PATCH v12 08/11] media: staging: dt-bindings: add Rockchip ISP1
 yaml bindings
To:     Helen Koike <helen.koike@collabora.com>
Cc:     "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Eddie Cai <eddie.cai.linux@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "heiko@sntech.de" <heiko@sntech.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        joacim.zetterling@gmail.com, kernel@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Jacob Chen <jacob-chen@iotwrt.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 27, 2019 at 2:02 PM Helen Koike <helen.koike@collabora.com> wrote:
>
> Add yaml DT bindings for Rockchip ISP1.
>
> This was tested and verified with:
> mv drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml Documentation/devicetree/bindings/media/
> make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-isp1.yaml
>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>
> ---
>
> Changes in v12:
> - The commit replaces the following commit in previous series named
> media: staging: dt-bindings: Document the Rockchip ISP1 bindings
> This new patch adds yaml binding and was verified with
> make dtbs_check and make dt_binding_check
>
> Changes in v11:
> - add clock-names values
>
> Changes in v10:
> - unsquash
>
> Changes in v9:
> - squash
> - move to staging
>
> Changes in v8:
> - fix title division style
>
> Changes in v7:
> - update document with new design and tested example
>
>  .../bindings/media/rockchip-isp1.yaml         | 193 ++++++++++++++++++
>  1 file changed, 193 insertions(+)
>  create mode 100644 drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
