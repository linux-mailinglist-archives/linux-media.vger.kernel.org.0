Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 771323916B2
	for <lists+linux-media@lfdr.de>; Wed, 26 May 2021 13:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbhEZLyU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 07:54:20 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:55775 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234481AbhEZLwL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 07:52:11 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ls3NlTCMIWkKbls3QlCyOr; Wed, 26 May 2021 13:50:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622029831; bh=juoWGaHNbHl2FSEv5DpMVwvxfrfot9RIxDernjro99Q=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=QI+Xrzj5oY9xKsmpHOcXiSL5+paJvYOMfwwMIHojXjd9A7VL2kQPrArJPMGIGeVBC
         uG15vQxAX4vUpzdemzZzMiyeve2c+aGMxyu5OAdzvc33kZbeh8nTAgXGo61M8CXcmj
         i0BoOVM7bsd3MzZuzOhXm16JjIYYyKk3StdUkUyLPl/hYMkg2T0ISso2jeeuWh0bFa
         D8SVY+coWOkSnZY9j/+65j1kOAsGqYypNMEHb4rVX/40/9D1JvxN0sOCf1Nf0o4yg7
         MQoj+ovot2KFE2WObO5Lxs4Lr4pXl1j/k1R+2i4NnKQXci6XuiBubgYHYUA/PHZ+jl
         R0mHZEGnf20Hw==
Subject: Re: [PATCH v5 02/16] phy: Distinguish between Rx and Tx for MIPI
 D-PHY with submodes
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-sunxi@googlegroups.com
Cc:     Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        kevin.lhopital@hotmail.com,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
References: <20210115200141.1397785-1-paul.kocialkowski@bootlin.com>
 <20210115200141.1397785-3-paul.kocialkowski@bootlin.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <58d6651d-09c3-2b93-bd5b-1807744b2354@xs4all.nl>
Date:   Wed, 26 May 2021 13:50:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210115200141.1397785-3-paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfIKtpY4V226WObacR6uCv2pLF5qZOhTXPLEGIKajbtpMsfp6Mp3aOkSAlIifh58GcpjquWBHJ+YyUJCGEEiRLd/A23b+YFa7BeyBFm70E/XSbxQKy9Yp
 L4C9bZDOFlw6zumUkkHyoiIslp3/S3Hk+IjDNYo0nCY7eYGlxiU8aAPxdJxCjUV0boKP6LRQM1Bx0JWcnkO8uwuwdX6z3GH1RNFX0qXueKMPMuhKN1anywbn
 79X1JBFxf1kHfugUHSC2TkEyyNHzLvadDPoXRorbKngWjIDUkv8FcMsXj9NSegg+g6aKc9KX2UUNwYkV+3Q6h4/jJ6C/ctgVOwpeoCS9TeiPD/BgqPpOGiN/
 hMgRx6JOIB7HV2Naixzx2M7Pkh1bNoo933+aNVp3a+w5E6/6/F3l2zZnqPxQzZZyhm3Y0ND8AlSplw14Ti70pWKTfsT63GRkBUYzdu1Zx+Ta6szYN1H27i6L
 v67l5voEAxL51GBOCUR3d6Fp5POjRl9cLVb71LrKGdul0a3HlASW6+3cK4sRGrDQ+hVjvYIjGRG3pGbPXnYLgSXF2hnfbo1v6JkqQVIt6fADKtksKx0VExzz
 i/8DYQ3rEGRiaRUxg2kdJEsb88IGXgTktjAefhOWA3Dr205ukywYeKvPF0xk8oYkeSrK/hlL/LEmKonoANl0ncw/GB3+2NvEtEJdEvyqSLaSe9ygkYYuUraU
 XVYCq2+UKNQ4JUFtLI9KfvZBhbUJ2wITtrW94Le5cUDigcrvn9mcQMhyDhrq/aMNPHobzdyfixWs7+OFuMqGuehZcrBzilAgJhUGQAzbCY0UEmhG/sw9IDg/
 R2wqVFKjCcGc9XkEEBCSjVmQX7lVolAWw28ABMTwUL8ZgympFut3ryZLx73OIc6pbrPt/e52ynJNhSsHZzraJeNU6rMW7ZmOG5aiMPrY94x7Okowinrurt8b
 7+McjEg6SwtlU13erf1Y2KvnthS8iGpeuw5paPWZWOXtwjvIgjocPOTnlj9DX+mvSl2ZEbXAyrLq86jc5ww+8ZBSXpAFJvggjbEWuSy2/cE771ktor91OeBY
 GRDnmy5BeSPpvBFZYmmfPq77zGvqRlCgoWfXrtGl5zQpmyashyHw0H+a
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/01/2021 21:01, Paul Kocialkowski wrote:
> As some D-PHY controllers support both Rx and Tx mode, we need a way for
> users to explicitly request one or the other. For instance, Rx mode can
> be used along with MIPI CSI-2 while Tx mode can be used with MIPI DSI.
> 
> Introduce new MIPI D-PHY PHY submodes to use with PHY_MODE_MIPI_DPHY.
> The default (zero value) is kept to Tx so only the rkisp1 driver, which
> uses D-PHY in Rx mode, needs to be adapted.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Acked-by: Helen Koike <helen.koike@collabora.com>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c |  3 ++-
>  include/linux/phy/phy-mipi-dphy.h                   | 13 +++++++++++++
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 2e5b57e3aedc..cab261644102 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -948,7 +948,8 @@ static int rkisp1_mipi_csi2_start(struct rkisp1_isp *isp,
>  
>  	phy_mipi_dphy_get_default_config(pixel_clock, isp->sink_fmt->bus_width,
>  					 sensor->lanes, cfg);
> -	phy_set_mode(sensor->dphy, PHY_MODE_MIPI_DPHY);
> +	phy_set_mode_ext(cdev->dphy, PHY_MODE_MIPI_DPHY,
> +			 PHY_MIPI_DPHY_SUBMODE_RX);

drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c: In function ‘rkisp1_mipi_csi2_start’:
drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:951:19: error: ‘cdev’ undeclared (first use in this function)
  951 |  phy_set_mode_ext(cdev->dphy, PHY_MODE_MIPI_DPHY,
      |                   ^~~~

Huh?

Regards,

	Hans

>  	phy_configure(sensor->dphy, &opts);
>  	phy_power_on(sensor->dphy);
>  
> diff --git a/include/linux/phy/phy-mipi-dphy.h b/include/linux/phy/phy-mipi-dphy.h
> index a877ffee845d..0f57ef46a8b5 100644
> --- a/include/linux/phy/phy-mipi-dphy.h
> +++ b/include/linux/phy/phy-mipi-dphy.h
> @@ -6,6 +6,19 @@
>  #ifndef __PHY_MIPI_DPHY_H_
>  #define __PHY_MIPI_DPHY_H_
>  
> +/**
> + * enum phy_mipi_dphy_submode - MIPI D-PHY sub-mode
> + *
> + * A MIPI D-PHY can be used to transmit or receive data.
> + * Since some controllers can support both, the direction to enable is specified
> + * with the PHY sub-mode. Transmit is assumed by default with phy_set_mode.
> + */
> +
> +enum phy_mipi_dphy_submode {
> +	PHY_MIPI_DPHY_SUBMODE_TX = 0,
> +	PHY_MIPI_DPHY_SUBMODE_RX,
> +};
> +
>  /**
>   * struct phy_configure_opts_mipi_dphy - MIPI D-PHY configuration set
>   *
> 

