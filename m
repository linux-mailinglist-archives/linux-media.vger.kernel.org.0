Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB7196C10F1
	for <lists+linux-media@lfdr.de>; Mon, 20 Mar 2023 12:38:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbjCTLi0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Mar 2023 07:38:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231130AbjCTLiX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Mar 2023 07:38:23 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86C0F13D
        for <linux-media@vger.kernel.org>; Mon, 20 Mar 2023 04:38:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 36A88B80E38
        for <linux-media@vger.kernel.org>; Mon, 20 Mar 2023 11:38:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40528C433EF;
        Mon, 20 Mar 2023 11:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679312297;
        bh=x26jifIA877ku7ewKfzKLbfZrFX+aeGVPrCt/zpGgPw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=T1vgVMcxLCaBm0T+YuRNgYxro40XiZ6dYhEZt0iGjhspaHpj5NJkjl/6cMPE33XLa
         moa/X5Kb6oqfDTJJ7ahFLscEmuBkt8sqcZ3v5sJ5e48BB3FNzLAlpcw4yjJj+8BrY6
         4tl6g64c+FWWzNuLo+0XYtu5D1HxszcUGP9ju4un7aDyd0NdEOhjeftTd5NkslazdH
         g1vIe4M0xqx0S0qVhh/uLLQhpNRNS0qbWKoYMWoLsQHpwiGFkK+CiX2O6HYDw/pN93
         W4KDUr/+kXpn4IceoIvjXg2riEqpE1VTItc1jHHgfOqc1sXQvOIPZPfrzf+Hfmf+1z
         dhkdTFRweUgOQ==
Date:   Mon, 20 Mar 2023 12:38:11 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc:     linux-media@vger.kernel.org, gjasny@googlemail.com,
        hverkuil@xs4all.nl, kieran.bingham@ideasonboard.com,
        nicolas@ndufresne.ca, p.zabel@pengutronix.de, rosenp@gmail.com,
        sakari.ailus@iki.fi, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com, deborah.brouwer@collabora.com,
        ariel@vanguardiasur.com.ar, ezequiel@vanguardiasur.com.ar,
        tomi.valkeinen@ideasonboard.com
Subject: Re: [v4l-utils] [PATCH v10 3/5] meson: Add support for doxygen
 documentation
Message-ID: <20230320123811.4b120519@coco.lan>
In-Reply-To: <20230223164441.22719-4-laurent.pinchart@ideasonboard.com>
References: <20230223164441.22719-1-laurent.pinchart@ideasonboard.com>
        <20230223164441.22719-4-laurent.pinchart@ideasonboard.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 23 Feb 2023 18:44:39 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> 

> +doxygen_install_dir = join_paths(get_option('datadir'), 'doc',
> +                                 '@0@'.format(meson.project_name()))
> +
> +doxygen_output = []
> +if get_option('doxygen-html')
> +    doxygen_output += 'html'
> +endif
> +if get_option('doxygen-man')
> +    doxygen_output += 'man'
> +endif
> +
> +custom_target('doxygen',
> +              input : doxyfile,
> +              output : doxygen_output,
> +              command : [prog_doxygen, doxyfile],
> +              install : true,
> +              install_dir : doxygen_install_dir)

This is not right. It makes man pages to be installed inside:
	/usr/share/doc/v4l-utils/man/man3

It should be, instead:

	usr/share/man/man3

I suspect you'll need a separate custom_target for man.

Please fix it ASAP.

Thanks,
Mauro
