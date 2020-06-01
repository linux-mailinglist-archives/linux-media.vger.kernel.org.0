Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37D8B1EA39E
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2020 14:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgFAMQg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jun 2020 08:16:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbgFAMQf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jun 2020 08:16:35 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEF5AC03E97C
        for <linux-media@vger.kernel.org>; Mon,  1 Jun 2020 05:16:34 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id v2so3391315pfv.7
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2020 05:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Adc9Q8cwLIx/y058NsBjevbjaAdgThoe4xUlCWv9YbQ=;
        b=s0YrPVZufkHndEoJJcFJlhncyyv5QPS6DHRcnQ1uMYCMUDPK8dvxHVyVS3Omnz8ZDN
         L2GiNuIZUEppwr3xwhMWzU7aAklk2qMmTpWiyL8zO3duJSbSbhBmrbZqzFVqWdhD1d9t
         xeC4a286hlTnDVGE+mY7EACs4+59R6a5j1ehPW19rmFWVWR2cz0p7ENP7Itzl1dN2zX9
         lFf/uH1bk9YKk3ygJnxBO7z0pT1ZWP9Eme6NMIpt82oJ4a5tAUkYMbLzrzkC5WYMOT89
         c3L8LkumGaluGEl2XQl8UrEHEFviY1sPU2TBSHQH87/KsStm/+ffMUExbIFAQnxKU1LW
         2yRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Adc9Q8cwLIx/y058NsBjevbjaAdgThoe4xUlCWv9YbQ=;
        b=g7Y3FQzvKHSJuT3oU5SpbWzxSPnnGhk9CRd+RYF0bSXsDXdmNbeJgu7GzYpNESgcPm
         G32BQtPHyJoUHfZz/hEqreZClXotr4R3YlG2HZjTfK6Dhdkdrt22EDFVDEenXM8aUkIB
         MMzNg0Gd+KzVfgrk1HGhc4T1iaGDDatCQ9GRMGNtNYbpZcUP+D9Vlk8aJKB5MacWn/4J
         esQ5R1WzCyJJcfgo0Dptc0LJK0mfjRiIRKtGVkXNwpD5C6s3sIhz1VFaz6TjbbOAFGjM
         fvNC+6O6KUcV0j7iIa4ncj7DrhqqvD35lQ2S5waQvyN3ip5iNZNVbs7r4M7BrYxO839V
         L79Q==
X-Gm-Message-State: AOAM533s/4TiC/qOyPvn6KuAbjoeyXQouH886aae8jZcWIBtbpSaINZo
        LGthGnwIDmbtaHQsfk4IQRW85Q==
X-Google-Smtp-Source: ABdhPJzoMYjh8ba0kkN9sqd6dAzPmRNYU40/cEyRLNlqbnNP2sJbrs9Iacg74UfaXufAitRgd0ahXw==
X-Received: by 2002:a63:c948:: with SMTP id y8mr18877516pgg.118.1591013794218;
        Mon, 01 Jun 2020 05:16:34 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.174])
        by smtp.gmail.com with ESMTPSA id d17sm7435775pjw.17.2020.06.01.05.16.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 05:16:33 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
X-Google-Original-From: Kaaira Gupta <Kaairakgupta@es.iitr.ac.in>
Date:   Mon, 1 Jun 2020 17:46:26 +0530
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        laurent.pinchart@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kieran.bingham@ideasonboard.com,
        dafna Hirschfeld <dafna3@gmail.com>
Subject: [PATCH] vimc: debayer: Add support for ARGB format
Message-ID: <20200601121626.GA13308@kaaira-HP-Pavilion-Notebook>
References: <20200528185717.GA20581@kaaira-HP-Pavilion-Notebook>
 <0ab57863-935d-3ab5-dfea-80a44c63ae18@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ab57863-935d-3ab5-dfea-80a44c63ae18@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, May 29, 2020 at 05:43:57PM +0200, Dafna Hirschfeld wrote:
> Hi,
> Thanks for the patch
> 
> I don't know how real devices handle ARGB formats,
> I wonder if it should be the part of the debayer.

Hi! qcam tries to support BA24 as it is one of the formats that vimc
lists as its supported formats wih --list-formats. Shouldn't BA24 be
possible to capture with vimc?

If yes, which entity should support it, if not debayer? Should there be
a separate conversion entity, or should we keep the support in debayer
itself for efficiency issues?

> 
> 
> On 28.05.20 20:57, Kaaira Gupta wrote:
> > Running qcam for pixelformat 0x34324142 showed that vimc debayer does
> > not support it. Hence, add the support for Alpha (255).
> 
> I would change the commit log to:
> 
> Add support for V4L2_PIX_FMT_RGB24 format in the debayer
> and set the alpha channel to constant 255.
> 
> Thanks,
> Dafna
> 
> > 
> > Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
> > ---
> >   .../media/test-drivers/vimc/vimc-debayer.c    | 27 ++++++++++++-------
> >   1 file changed, 18 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
> > index c3f6fef34f68..f34148717a40 100644
> > --- a/drivers/media/test-drivers/vimc/vimc-debayer.c
> > +++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
> > @@ -62,6 +62,7 @@ static const u32 vimc_deb_src_mbus_codes[] = {
> >   	MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> >   	MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA,
> >   	MEDIA_BUS_FMT_RGB888_1X32_PADHI,
> > +	MEDIA_BUS_FMT_ARGB8888_1X32
> >   };
> >   static const struct vimc_deb_pix_map vimc_deb_pix_map_list[] = {
> > @@ -322,15 +323,23 @@ static void vimc_deb_process_rgb_frame(struct vimc_deb_device *vdeb,
> >   	unsigned int i, index;
> >   	vpix = vimc_pix_map_by_code(vdeb->src_code);
> > -	index = VIMC_FRAME_INDEX(lin, col, vdeb->sink_fmt.width, 3);
> > -	for (i = 0; i < 3; i++) {
> > -		switch (vpix->pixelformat) {
> > -		case V4L2_PIX_FMT_RGB24:
> > -			vdeb->src_frame[index + i] = rgb[i];
> > -			break;
> > -		case V4L2_PIX_FMT_BGR24:
> > -			vdeb->src_frame[index + i] = rgb[2 - i];
> > -			break;
> > +
> > +	if (vpix->pixelformat == V4L2_PIX_FMT_ARGB32) {
> > +		index =  VIMC_FRAME_INDEX(lin, col, vdeb->sink_fmt.width, 4);
> > +		vdeb->src_frame[index] = 255;
> > +		for (i = 0; i < 3; i++)
> > +			vdeb->src_frame[index + i + 1] = rgb[i];
> > +	} else {
> > +		index =  VIMC_FRAME_INDEX(lin, col, vdeb->sink_fmt.width, 3);
> > +		for (i = 0; i < 3; i++) {
> > +			switch (vpix->pixelformat) {
> > +			case V4L2_PIX_FMT_RGB24:
> > +				vdeb->src_frame[index + i] = rgb[i];
> > +				break;
> > +			case V4L2_PIX_FMT_BGR24:
> > +				vdeb->src_frame[index + i] = rgb[2 - i];
> > +				break;
> > +			}
> >   		}
> >   	}
> >   }
> > 
