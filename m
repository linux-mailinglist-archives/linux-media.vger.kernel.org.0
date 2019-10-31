Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1107EEB103
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2019 14:17:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbfJaNQz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Oct 2019 09:16:55 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:51752 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726728AbfJaNQz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Oct 2019 09:16:55 -0400
Received: from pendragon.ideasonboard.com (lmontsouris-658-1-103-151.w92-154.abo.wanadoo.fr [92.154.14.151])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F29B320;
        Thu, 31 Oct 2019 14:16:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1572527813;
        bh=PLmT7haSn/x6jKex7ohVnLZSNCbvD6oFv1ZIkyIdKJ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rc9ZmDhqhFW5wMz4EyRD2ilAFzR4j/Mx35VYo5lruLiGrsRxblokmre5HepxFfDm6
         ALoJTDw2jErAaU8q95C2upbb0/H7emxuvdGZ2DN+SRDBvROKfpd/elRiJa52yKlQwG
         pqFFjBnvbcnIkdO9fmoVAKfHn4jcRVnPEjVQNTGk=
Date:   Thu, 31 Oct 2019 15:16:44 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     mchehab@kernel.org, robh+dt@kernel.org, sakari.ailus@iki.fi,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org
Subject: Re: [PATCH v4 0/2] Add IMX296 CMOS image sensor support
Message-ID: <20191031131644.GA8917@pendragon.ideasonboard.com>
References: <20191030094902.32582-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191030094902.32582-1-manivannan.sadhasivam@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mani,

Thank you for the patches.

On Wed, Oct 30, 2019 at 03:19:00PM +0530, Manivannan Sadhasivam wrote:
> Hello,
> 
> This patchset adds support for IMX296 CMOS image sensor from Sony.
> Sensor can be programmed through I2C and 4-wire interface but the
> current driver only supports I2C interface. The sensor is
> capable of outputting frames in CSI2 format (1 Lane). In the case
> of sensor resolution, driver only supports 1440x1088 at 30 FPS.
> 
> The driver has been validated using Framos IMX296 module interfaced to
> 96Boards Dragonboard410c.

I've just been made aware of your work. I also worked on an IMX296
sensor driver in parallel, which I will post to the list. My driver
doesn't hardcode the resolution but computes register values at runtime,
so I wonder if it could be a better option. I'll post it now.

> Changes in v4:
> 
> * Fixed issues related to gain settings and few misc cleanups in driver
> * Documented port node and removed maxItems, default prop from dt binding
>   as per the review
> 
> Changes in v3:
> 
> * Fixed the reference to video-interfaces.txt in binding.
> 
> Changes in v2:
> 
> * Switched to YAML binding
> 
> Manivannan Sadhasivam (2):
>   dt-bindings: media: i2c: Add IMX296 CMOS sensor binding
>   media: i2c: Add IMX296 CMOS image sensor driver
> 
>  .../devicetree/bindings/media/i2c/imx296.yaml |  94 +++
>  MAINTAINERS                                   |   8 +
>  drivers/media/i2c/Kconfig                     |  11 +
>  drivers/media/i2c/Makefile                    |   1 +
>  drivers/media/i2c/imx296.c                    | 715 ++++++++++++++++++
>  5 files changed, 829 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx296.yaml
>  create mode 100644 drivers/media/i2c/imx296.c

-- 
Regards,

Laurent Pinchart
