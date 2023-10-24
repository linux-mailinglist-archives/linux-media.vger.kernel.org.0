Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 280277D47C6
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 08:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232672AbjJXGzd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Oct 2023 02:55:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232706AbjJXGza (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 02:55:30 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F041D7D
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 23:55:28 -0700 (PDT)
Received: from [100.94.55.57] (cola.collaboradmins.com [195.201.22.229])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ehristev)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id C7BAB66072BA;
        Tue, 24 Oct 2023 07:55:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1698130526;
        bh=5DCzyQ2HxaWI8p4xR4sAmsF7o34IBwBvxEJX3Ow0H8w=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=SQhlPFx9HQlzq0BfqmB0iAdI8XL+SR3y/0iDnBapb/qSAqPT0c6kR2sWsYg3G6gj3
         eB0TnwgUJ2jB9lG0pqfEqq+woYeXzm6gMmRzg4xuspQwJEvtWmc8mKam954DDMwWjq
         zZI+vK+AkJ71Vg6GF6w3lqiZNMIoNMNkkqOYJR8ub2/c9MOfMMH1e9eQ+Ymm+U//w9
         Ei8DTUl93MnOh/LLVym6F3OkfW1CIDOugMf+mOJZct8haUEaRRgjUXTdFrrpnagg+W
         Tym1WgvJ3vTpW9xALmPYttjHsiea7UDB8RihKaUNXibikxie99895Y7mA8PMcy76QS
         no21ymWRukfzg==
Message-ID: <74e11289-268c-4f05-923b-2d00467c064a@collabora.com>
Date:   Tue, 24 Oct 2023 09:55:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] media: v4l2-subdev: Rename pad config 'try_*' fields
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Leon Luo <leonl@leopardimaging.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        Petr Cvek <petrcvekcz@gmail.com>
References: <20231023214011.17730-1-laurent.pinchart@ideasonboard.com>
From:   Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20231023214011.17730-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/24/23 00:40, Laurent Pinchart wrote:
> Hello,

Hello Laurent,

> 
> This series is the result of me getting bothered by the following note
> in the documentation of the v4l2_subdev_pad_config structure:
> 
>   * Note: This struct is also used in active state, and the 'try' prefix is
>   * historical and to be removed.
> 
> So I decided to drop the prefix.
> 
> Patches 1/7 to 6/7 replace direct usage of the fields in drivers with
> the corresponding accessor functions. There was a relatively large
> number of them in sensor drivers (in 6/7), but more worryingly, the
> atmel-isi (1/7), microchip-isc (2/7) and tegra-video (5/7) should really
> not have messed up with creating a v4l2_subdev_pad_config structure
> manually. I urge the maintainers of those drivers to address the issue.

Could you hint a bit about how the issue should be addressed ?
Instead of creating a `v4l2_subdev_pad_config`, one should use 
v4l2_subdev_lock_and_get_active_state() ? Is this the right way to do it ?

Thanks for looking into this,
Eugen

> 
> Finally, patch 7/7 renames the fields, which becomes easy after
> addressing all the drivers.
> 
> The patches have been compile-tested only.
> 
> Sakari, this conflicts with your "[PATCH v3 0/8] Unify sub-device state
> access functions" series. I don't mind rebasing on top if it gets merged
> first.
> 
> Laurent Pinchart (7):
>    media: atmel-isi: Use accessors for pad config 'try_*' fields
>    media: microchip-isc: Use accessors for pad config 'try_*' fields
>    media: atmel-isc: Use accessors for pad config 'try_*' fields
>    media: atomisp: Use accessors for pad config 'try_*' fields
>    media: tegra-video: Use accessors for pad config 'try_*' fields
>    media: i2c: Use accessors for pad config 'try_*' fields
>    media: v4l2-subdev: Rename pad config 'try_*' fields
> 
>   drivers/media/i2c/adv7183.c                   |  2 +-
>   drivers/media/i2c/imx274.c                    | 12 +++----
>   drivers/media/i2c/mt9m001.c                   |  2 +-
>   drivers/media/i2c/mt9m111.c                   |  2 +-
>   drivers/media/i2c/mt9t112.c                   |  2 +-
>   drivers/media/i2c/mt9v011.c                   |  2 +-
>   drivers/media/i2c/mt9v111.c                   |  2 +-
>   drivers/media/i2c/ov2640.c                    |  2 +-
>   drivers/media/i2c/ov2680.c                    |  4 +--
>   drivers/media/i2c/ov6650.c                    | 34 ++++++++++++-------
>   drivers/media/i2c/ov772x.c                    |  2 +-
>   drivers/media/i2c/ov9640.c                    |  2 +-
>   drivers/media/i2c/rj54n1cb0c.c                |  2 +-
>   drivers/media/i2c/saa6752hs.c                 |  2 +-
>   drivers/media/i2c/tw9910.c                    |  2 +-
>   drivers/media/platform/atmel/atmel-isi.c      | 12 ++++---
>   .../platform/microchip/microchip-isc-base.c   | 10 +++---
>   .../media/atomisp/i2c/atomisp-gc2235.c        |  2 +-
>   .../media/atomisp/i2c/atomisp-mt9m114.c       |  2 +-
>   .../media/atomisp/i2c/atomisp-ov2722.c        |  2 +-
>   .../staging/media/atomisp/pci/atomisp_tpg.c   |  2 +-
>   .../media/deprecated/atmel/atmel-isc-base.c   | 10 +++---
>   drivers/staging/media/tegra-video/vi.c        | 14 ++++----
>   include/media/v4l2-subdev.h                   | 33 ++++++++----------
>   24 files changed, 87 insertions(+), 74 deletions(-)
> 
> 
> base-commit: 94e27fbeca27d8c772fc2bc807730aaee5886055

