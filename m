Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD2835A409A
	for <lists+linux-media@lfdr.de>; Mon, 29 Aug 2022 03:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbiH2BSz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Aug 2022 21:18:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiH2BSy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Aug 2022 21:18:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD1DD240BD
        for <linux-media@vger.kernel.org>; Sun, 28 Aug 2022 18:18:53 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCBED481;
        Mon, 29 Aug 2022 03:18:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661735932;
        bh=8X/denmRpAQF6CmRC78B8/aB74Dx9S9DdXMxvfdfJ/o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uIjasoOOhQkHknZKqKr2DvcyD+nH5uc33Xhul6ULyf/j1oomhgXM1hzcmKp5KUEHb
         Gf2XOVR5mqXKi/BzzM60FJM6/YZ8tuevGUmhPAFkrFyRhsrk2PONSdZizcopJx1WQ1
         J1oGLmNP5b7YZT9UIncDLVzT9/sdN1zmKjNk9Z9s=
Date:   Mon, 29 Aug 2022 04:18:43 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Gregor Jasny <gjasny@googlemail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] libdvbv5: Fix invalid header file name in Doxygen INPUT
Message-ID: <YwwT8/ClGTBnejuS@pendragon.ideasonboard.com>
References: <20220829011511.1992-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220829011511.1992-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

By the way, on this topic, there's a set of Doxygen warnings:

lib/include/libdvbv5/pmt.h:59: warning: documented symbol 'stream_reserved0' was not declared or defined.
lib/include/libdvbv5/pmt.h:101: warning: documented symbol 'stream_reserved' was not declared or defined.
lib/include/libdvbv5/pmt.h:103: warning: documented symbol 'stream_private' was not declared or defined.
lib/include/libdvbv5/dvb-dev.h:117: warning: Found unknown command '@type'
lib/include/libdvbv5/dvb-dev.h:173: warning: argument 'enable_monitor' of command @param is not found in the argument list of dvb_dev_find(struct dvb_device *dvb, dvb_dev_change_t handler, void *user_priv)
lib/include/libdvbv5/dvb-dev.h:173: warning: The following parameter of dvb_dev_find(struct dvb_device *dvb, dvb_dev_change_t handler, void *user_priv) is not documented:
  parameter 'handler'
lib/include/libdvbv5/dvb-sat.h:149: warning: argument 'parms' of command @param is not found in the argument list of dvb_sat_real_freq(struct dvb_v5_fe_parms *p, int freq)
lib/include/libdvbv5/dvb-sat.h:149: warning: The following parameters of dvb_sat_real_freq(struct dvb_v5_fe_parms *p, int freq) are not documented:
  parameter 'p'
  parameter 'freq'
lib/include/libdvbv5/desc_extension.h:143: warning: argument 'buf' of command @param is not found in the argument list of dvb_desc_ext_print_func(struct dvb_v5_fe_parms *parms, const struct dvb_extension_descriptor *ext, const void *desc)

Mauro, if you had a chance to look at them, it would be nice to avoid
warnings at build time.

On Mon, Aug 29, 2022 at 04:15:11AM +0300, Laurent Pinchart wrote:
> The list of INPUT files in doxygen_libdvbv5.cfg contains
> desc_descriptor_id.h, which doesn't exist. The correct file name is
> desc_registration_id.h. Fix it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  doxygen_libdvbv5.cfg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/doxygen_libdvbv5.cfg b/doxygen_libdvbv5.cfg
> index b25301a05bf5..83f33a23ebf4 100644
> --- a/doxygen_libdvbv5.cfg
> +++ b/doxygen_libdvbv5.cfg
> @@ -776,7 +776,6 @@ INPUT                  = $(SRCDIR)/doc/libdvbv5-index.doc \
>  			 $(SRCDIR)/lib/include/libdvbv5/desc_event_extended.h \
>  			 $(SRCDIR)/lib/include/libdvbv5/desc_event_short.h \
>  			 $(SRCDIR)/lib/include/libdvbv5/desc_extension.h \
> -			 $(SRCDIR)/lib/include/libdvbv5/desc_descriptor_id.h \
>  			 $(SRCDIR)/lib/include/libdvbv5/desc_frequency_list.h \
>  			 $(SRCDIR)/lib/include/libdvbv5/desc_hierarchy.h \
>  			 $(SRCDIR)/lib/include/libdvbv5/desc_isdbt_delivery.h \
> @@ -784,6 +783,7 @@ INPUT                  = $(SRCDIR)/doc/libdvbv5-index.doc \
>  			 $(SRCDIR)/lib/include/libdvbv5/desc_logical_channel.h \
>  			 $(SRCDIR)/lib/include/libdvbv5/desc_network_name.h \
>  			 $(SRCDIR)/lib/include/libdvbv5/desc_partial_reception.h \
> +			 $(SRCDIR)/lib/include/libdvbv5/desc_registration_id.h \
>  			 $(SRCDIR)/lib/include/libdvbv5/desc_sat.h \
>  			 $(SRCDIR)/lib/include/libdvbv5/desc_service.h \
>  			 $(SRCDIR)/lib/include/libdvbv5/desc_t2_delivery.h \
> 
> base-commit: f50720c40409bfd27056011da1350462b41af9d3

-- 
Regards,

Laurent Pinchart
