Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7886B728CD4
	for <lists+linux-media@lfdr.de>; Fri,  9 Jun 2023 03:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236671AbjFIBGs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jun 2023 21:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjFIBGr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jun 2023 21:06:47 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86E011FDF
        for <linux-media@vger.kernel.org>; Thu,  8 Jun 2023 18:06:46 -0700 (PDT)
Received: from localhost (node-1w7jr9st5p2esmclet71ntnwp.ipv6.telus.net [IPv6:2001:569:beb1:1500:6f9d:3a5c:4d25:e949])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 8650D6606F22;
        Fri,  9 Jun 2023 02:06:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1686272805;
        bh=J+vHjjfoXCfTJc4NBj6Z9cZmA59zODsxNYnC8qb5l08=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KLdJ1Z5YD7QbywVaRXrWgAnhhk8V9YnQvMo2x1tEbBp/x9AN9u6u1I6XTbt67MFZ3
         BXDuL9JKb5FYjVIk+jumUYpK/NNEiSbjizQ2juZuZTqBVACN7999+bzO2i33gzmLE9
         cOX7LPSi2bsJnHY8jrmEoNSYYn0D5LHVHZ4lDXLFFdN2piifDdV/L1SOklhtzpF4oA
         4iWT8dKcrUV/dze6hNV+gDDxx5Oi76zFcT/p/hiSzslKzHL6gaQimKuiMJSxPZ5CoC
         qsvgmce9I2xLWUaE66gNwjosBYElBkZCC0m+q/S3ucCTR1uvOv/kHSBK3bejWMh6A+
         cfdk6lxcK01DQ==
Date:   Thu, 8 Jun 2023 18:06:39 -0700
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, nicolas.dufresne@collabora.com
Subject: Re: [PATCH] v4l2-compliance: call select before dequeuing event
Message-ID: <ZIJ7H6jV3hTP+rxi@db550>
References: <20230607021029.30466-1-deborah.brouwer@collabora.com>
 <216922d8-820d-a8c5-c79f-27b811f80fa5@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <216922d8-820d-a8c5-c79f-27b811f80fa5@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 07, 2023 at 01:13:49PM +0200, Hans Verkuil wrote:
> On 07/06/2023 04:10, Deborah Brouwer wrote:
> > When the streaming option is called with a stateful decoder,
> > testUserPtr() and testDmaBuf() will hang indefinitely when attempting to
> > dequeue a source change event. To prevent this call select() with a
> > timeout.
> > 
> > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > ---
> > It looks like this was the same issue that was previously fixed for testMmap()
> > in commit f0a5b17d9 ("v4l2-compliance: add timeout when waiting for event").
> > 
> >  utils/v4l2-compliance/v4l2-test-buffers.cpp | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> > 
> > diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> > index a097a0ff..0396e17e 100644
> > --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
> > +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> > @@ -1746,8 +1746,17 @@ int testUserPtr(struct node *node, struct node *node_m2m_cap, unsigned frame_cou
> >  
> >  		if (node->is_m2m) {
> >  			if (node->codec_mask & STATEFUL_DECODER) {
> > +				int fd_flags = fcntl(node->g_fd(), F_GETFL);
> > +				struct timeval tv = { 1, 0 };
> > +				fd_set efds;
> >  				v4l2_event ev;
> >  
> > +				fcntl(node->g_fd(), F_SETFL, fd_flags | O_NONBLOCK);
> > +				FD_ZERO(&efds);
> > +				FD_SET(node->g_fd(), &efds);
> > +				ret = select(node->g_fd() + 1, nullptr, nullptr, &efds, &tv);
> > +				fail_on_test_val(ret < 0, ret);
> > +				fail_on_test(ret == 0);
> >  				fail_on_test(node->dqevent(ev));
> 
> This code keeps the fd in non-blocking mode. You need to add a
> fcntl(node->g_fd(), F_SETFL, fd_flags) line here. See also testMmap().

Oh sorry yes I missed that line. I'll send v2 with it fixed.

Related question: would you ever expect this test to do anything other
than timeout? Probably I am missing something, but it seems like there
are no output buffers being queued, so there could never be a source change
event?
I was just testing it with vicodec and I always get the dmesg error
message "No buffer was provided with the request" and then it times out.

> 
> >  				fail_on_test(ev.type != V4L2_EVENT_SOURCE_CHANGE);
> >  				fail_on_test(!(ev.u.src_change.changes & V4L2_EVENT_SRC_CH_RESOLUTION));
> > @@ -1949,8 +1958,17 @@ int testDmaBuf(struct node *expbuf_node, struct node *node, struct node *node_m2
> >  
> >  		if (node->is_m2m) {
> >  			if (node->codec_mask & STATEFUL_DECODER) {
> > +				int fd_flags = fcntl(node->g_fd(), F_GETFL);
> > +				struct timeval tv = { 1, 0 };
> > +				fd_set efds;
> >  				v4l2_event ev;
> >  
> > +				fcntl(node->g_fd(), F_SETFL, fd_flags | O_NONBLOCK);
> > +				FD_ZERO(&efds);
> > +				FD_SET(node->g_fd(), &efds);
> > +				ret = select(node->g_fd() + 1, nullptr, nullptr, &efds, &tv);
> > +				fail_on_test_val(ret < 0, ret);
> > +				fail_on_test(ret == 0);
> >  				fail_on_test(node->dqevent(ev));
> 
> Ditto.
> 
> >  				fail_on_test(ev.type != V4L2_EVENT_SOURCE_CHANGE);
> >  				fail_on_test(!(ev.u.src_change.changes & V4L2_EVENT_SRC_CH_RESOLUTION));
> 
> Regards,
> 
> 	Hans
