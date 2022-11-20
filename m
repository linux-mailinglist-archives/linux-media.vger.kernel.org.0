Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06D82631754
	for <lists+linux-media@lfdr.de>; Mon, 21 Nov 2022 00:30:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbiKTXaH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Nov 2022 18:30:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiKTXaG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Nov 2022 18:30:06 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A49CF1834F
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 15:30:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3ADBA60C8C
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 23:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DBEEC433C1;
        Sun, 20 Nov 2022 23:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668987004;
        bh=zphVPuwwcLjthlyE7wv5/pH/nYXfv5WDHxfhfw6GXd4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ckk0MPMIupM7/8nYBopEfL5uUkZueg6QWwoY9j+tw89MC/mzIOHA5FtjPEyh+g37X
         XekDVzkcIbPos8wuNnZuDaTT8iTBaQh10sQUghJvmegV87E+LN+b4BYbuZyiMgVgU1
         FD2r5qb4fSm3jqVlxfJoKkNn9Vy7AQRBWnSmDomHRjQGOLsWXIMiRuM3ACvWViRJzc
         3u8RNPJ7Pp4XtrzsZtZHsmlHXDyWbMGRIjJmuNLJdByFgLv0Uy1/pYR8wSIM1JZ8iR
         yktRQ1hodNPAXug8W1vTjL7b9lNDMRzRRO/o33EyPOQWal8RHOrqPbKwEDb9XsYm/3
         lqxAKYjuG5ijA==
Date:   Sun, 20 Nov 2022 23:29:56 +0000
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 12/17] media: atomisp: Fix VIDIOC_REQBUFS failing
 when VIDIOC_S_FMT has not been called yet
Message-ID: <20221120232956.6df4784b@sal.lan>
In-Reply-To: <f5f0e988-d5a2-12ea-cbb7-caa49f1c00d8@redhat.com>
References: <20221020195533.114049-1-hdegoede@redhat.com>
        <20221020195533.114049-13-hdegoede@redhat.com>
        <20221114203819.44e7baad@sal.lan>
        <f5f0e988-d5a2-12ea-cbb7-caa49f1c00d8@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
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

Em Sun, 20 Nov 2022 23:17:56 +0100
Hans de Goede <hdegoede@redhat.com> escreveu:

> Hi,
> 
> On 11/14/22 21:38, Mauro Carvalho Chehab wrote:
> > Em Thu, 20 Oct 2022 21:55:28 +0200
> > Hans de Goede <hdegoede@redhat.com> escreveu:
> >   
> >> camorama calls VIDIOC_REQBUFS(V4L2_MEMORY_MMAP) to test if MMAP support
> >> works (this was added specifically because of the previously broken
> >> MMAP support in atomisp).
> >>
> >> Currently this fails because atomisp_get_css_frame_info() fails in this
> >> case. Although it is weird to call VIDIOC_REQBUFS before VIDIOC_S_FMT,
> >> it is allowed to do this.
> >>
> >> Fix this not working by doing a S_FMT to V4L2_PIX_FMT_YUV420 + the highest
> >> supported resolution.
> >>
> >> Note this will cause camorama to use mmap mode, which means it will also
> >> use libv4l2 to do format conversion. libv4l2 will pick V4L2_PIX_FMT_RGB565
> >> as input format and this will lead to a garbled video display. This is
> >> a libv4lconvert bug, the RGB565 -> RGB24 path in libv4lconvert assumes
> >> that stride == width which is not true on the atomisp.  
> > 
> > Hmm... should we add a patch on Camorama for it to not use libv4l2 if
> > format == V4L2_PIX_FMT_RGB565?  
> 
> This is not controlled by Camorama but by libv4lconvert, AFAICT there are
> no atomisp2 native formats which are supported in Camorama without libv4l  ?

Actually, I added support on Camorama to decode it, plus other formats.
It currently supports:

	V4L2_PIX_FMT_ABGR32
	V4L2_PIX_FMT_ARGB32
	V4L2_PIX_FMT_BGR24
	V4L2_PIX_FMT_BGR32
	V4L2_PIX_FMT_NV12
	V4L2_PIX_FMT_NV21
	V4L2_PIX_FMT_RGB24
	V4L2_PIX_FMT_RGB32
	V4L2_PIX_FMT_RGB565
	V4L2_PIX_FMT_RGB565X
	V4L2_PIX_FMT_UYVY
	V4L2_PIX_FMT_VYUY
	V4L2_PIX_FMT_YUYV
	V4L2_PIX_FMT_YVYU
	V4L2_PIX_FMT_XBGR32
	V4L2_PIX_FMT_XRGB32
	V4L2_PIX_FMT_YUV420
	V4L2_PIX_FMT_YVU420

It is just that it defaults to request RGB24 when not in userptr mode
or when --dont-use-libv4l2 is not used.

I guess it makes sense to make it smarter by using a native format,
using its internal logic if the format is directly supported on it.

It would also make sense to add Bayer and MPEG formats to it
as well.

> >> I've already send out a libv4lconvert fix for this. Also this can be worked
> >> around by passing --dont-use-libv4l2 as argument to camorama.  
> > 
> > Was the patch already applied? The better would be to apply it at
> > libv4l2 upstream, as a fix, porting it to old versions, and mentioning
> > on what versions this got fixed on this changeset.  
> 
> I see that you have already found the patches. I will add a comment
> to the commit msg pointing to the now applied patch.

Ok.

Regards,
Mauro
