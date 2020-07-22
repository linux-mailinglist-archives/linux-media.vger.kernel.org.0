Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7015022974A
	for <lists+linux-media@lfdr.de>; Wed, 22 Jul 2020 13:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728642AbgGVLT7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 07:19:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbgGVLT7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 07:19:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2449C0619DC;
        Wed, 22 Jul 2020 04:19:58 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 66B4CAE6;
        Wed, 22 Jul 2020 13:19:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1595416797;
        bh=9bheVS99DQaRwwdpBomM0E03oIp9aDYofl6Bxy+lGec=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=drGfHuMEbciHC9WdUPfke/cq1AfJNe3AVSCs8hCTL+8FLoq4KrkzUo2p+hIruq9iB
         cvlqu8xThmZpjCEkJ8vm04n8/Tx+cnT/p5abshMMLD7TRk33ni6zZLe4uaNJ4dEJ90
         Eto05h81Je5fIN0sBFgs3BFkqJOUYiH7bV7zjo6U=
Date:   Wed, 22 Jul 2020 14:19:52 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: Re: [PATCH for v5.9] media: omap: Replace HTTP links with HTTPS ones
Message-ID: <20200722111952.GC5833@pendragon.ideasonboard.com>
References: <20200719112133.58236-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200719112133.58236-1-grandmaster@al2klimov.de>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

Thank you for the patch.

On Sun, Jul 19, 2020 at 01:21:33PM +0200, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I expect Sakari to take this patch in his tree when he will be back from
vacation at the end of the month.

> ---
>  Continuing my work started at 93431e0607e5.
>  See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
>  (Actually letting a shell for loop submit all this stuff for me.)
> 
>  If there are any URLs to be removed completely
>  or at least not (just) HTTPSified:
>  Just clearly say so and I'll *undo my change*.
>  See also: https://lkml.org/lkml/2020/6/27/64
> 
>  If there are any valid, but yet not changed URLs:
>  See: https://lkml.org/lkml/2020/6/26/837
> 
>  If you apply the patch, please let me know.
> 
>  Sorry again to all maintainers who complained about subject lines.
>  Now I realized that you want an actually perfect prefixes,
>  not just subsystem ones.
>  I tried my best...
>  And yes, *I could* (at least half-)automate it.
>  Impossible is nothing! :)
> 
> 
>  drivers/media/platform/omap3isp/isp.c | 2 +-
>  drivers/staging/media/omap4iss/iss.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/omap3isp/isp.c b/drivers/media/platform/omap3isp/isp.c
> index b91e472ee764..74fa67082e09 100644
> --- a/drivers/media/platform/omap3isp/isp.c
> +++ b/drivers/media/platform/omap3isp/isp.c
> @@ -142,7 +142,7 @@ static struct isp_reg isp_reg_list[] = {
>   * readback the same register, in this case the revision register.
>   *
>   * See this link for reference:
> - *   http://www.mail-archive.com/linux-omap@vger.kernel.org/msg08149.html
> + *   https://www.mail-archive.com/linux-omap@vger.kernel.org/msg08149.html
>   */
>  void omap3isp_flush(struct isp_device *isp)
>  {
> diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
> index 6fb60b58447a..e06ea7ea1e50 100644
> --- a/drivers/staging/media/omap4iss/iss.c
> +++ b/drivers/staging/media/omap4iss/iss.c
> @@ -55,7 +55,7 @@ static void iss_print_status(struct iss_device *iss)
>   * readback the same register, in this case the revision register.
>   *
>   * See this link for reference:
> - *   http://www.mail-archive.com/linux-omap@vger.kernel.org/msg08149.html
> + *   https://www.mail-archive.com/linux-omap@vger.kernel.org/msg08149.html
>   */
>  static void omap4iss_flush(struct iss_device *iss)
>  {

-- 
Regards,

Laurent Pinchart
