Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDCB679116E
	for <lists+linux-media@lfdr.de>; Mon,  4 Sep 2023 08:35:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244824AbjIDGfO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Sep 2023 02:35:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbjIDGfN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Sep 2023 02:35:13 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98837D9
        for <linux-media@vger.kernel.org>; Sun,  3 Sep 2023 23:35:10 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkzdf0gkyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4506:4f15::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4RfJlt671Bz49Q3K;
        Mon,  4 Sep 2023 09:35:06 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1693809307;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vvr8PhGdOGiscgGTV8b4aXzD2fDTIyrKNfcmiAPi9LA=;
        b=LPqnbnqk9rM3jAjnVDSyLCufyGbNyqwHkhV/Ygw4azGgshYyRZ2eGQeVcRX6mNvcbpPPbi
        6l0CtNo+LOK3MM+w8uFeDX1e/TUG1f5jOp47YRr2/VJ5YtaaI/Y4w3LRXzHO+e57HbAWbs
        nkrE0/CD6/OaJqlynihntiXNNv3WWRdddB9hJ/qJPRyiHnnxoA/mcj9+PiTLdHW1D/jvas
        lwS3/zntrn/Mupz6aTjKwU6Yo4gK0xv6fFpTxPL9/T0WOSMHXvkz5vIBvwiODD377/E/Fk
        KwLe3vWOvYHmrN9cI4QtJEft8mhPucQ5DhfJYyyZMphWz6qd8NANnyD/Ee2tpw==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1693809307; a=rsa-sha256;
        cv=none;
        b=De+kckrLJkQ+bf9A2RDxV5HyxvzvSggQx2l5EqE6Jt0vCXalvZ2C9HDcgo3x/f1dAGijXR
        mFVAfk+nrvbM1OqvbdwpZvP4/gIPDHWQTk75WVPizD7x4Nw5ObhbyeVLYImPlAXtRjY/tZ
        BbUy76iFcVB048g0WDBwJnpwOJMsj4Cqz1f/d8SQRb4d6PXkDNyfgWb0TM7wUZbiagGFIg
        hYxdJAYyrYJA5psdgKSZvf7aSjjT8XQTLlK8qKzsDDymmAk35QgcZe/Z0Fi+QEPR5XCcml
        U0xwajrps//q6dUOYnzl+EGc50Pw4/8L25jje/y/LXluo89V9g+H9DpCOBa3rw==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1693809307;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vvr8PhGdOGiscgGTV8b4aXzD2fDTIyrKNfcmiAPi9LA=;
        b=C41wiSm0+CVZC1h417d9pjBtz8wWnMMqffAmKgjerCvURr4+TFQ2zcom2N79Mr1HGy0cw4
        GT57yTDDttWrbYmzDHRpSXrluM2/T2GDFRIWgB7esGdmkLJZjVoHz4mYTqHHpoJRqBLkDz
        AUbctlQPqPwea7+6A3C3KZW24WVCYSn1leLYPavoime+HilzELI1SnUJI5mgxGgHNB6ahk
        nMfPuUWZjCucSr0MEjMaNnEy7TFXnz4ZdjxTNJfrv565WfvRwCasR/iOZTDHXVGCbisS00
        TwbTk+c7ne8nLMqriILu90keMYKNcAtMDJcP1GtIYdSU8UvJBhlWD03+diR1Lg==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 57EBA634C93;
        Mon,  4 Sep 2023 09:35:05 +0300 (EEST)
Date:   Mon, 4 Sep 2023 06:35:05 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH] media: v4l2-subdev: Document that routing support
 depends on streams
Message-ID: <ZPV6mQjbzJWN5Yef@valkosipuli.retiisi.eu>
References: <20230818155518.440-1-laurent.pinchart@ideasonboard.com>
 <ZN+Z4aYPNp+ymIw6@valkosipuli.retiisi.eu>
 <20230820225604.GB10135@pendragon.ideasonboard.com>
 <ZPMmLDvCuibZNFkZ@valkosipuli.retiisi.eu>
 <8906817c-b6a8-ec1d-3b46-17b6d2c512a1@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8906817c-b6a8-ec1d-3b46-17b6d2c512a1@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 04, 2023 at 08:33:37AM +0300, Tomi Valkeinen wrote:
> On 02/09/2023 15:10, Sakari Ailus wrote:
> > Hi Laurent,
> > 
> > On Mon, Aug 21, 2023 at 01:56:04AM +0300, Laurent Pinchart wrote:
> > > Hi Sakari,
> > > 
> > > On Fri, Aug 18, 2023 at 04:18:41PM +0000, Sakari Ailus wrote:
> > > > On Fri, Aug 18, 2023 at 06:55:18PM +0300, Laurent Pinchart wrote:
> > > > > Routing support, through the subdev .set_routing() operation, requires
> > > > > the subdev to support streams. This is however not clearly documented
> > > > > anywhere. Fix it by expanding the operation's documentation to indicate
> > > > > that subdevs must set the V4L2_SUBDEV_FL_STREAMS flag.
> > > > > 
> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > ---
> > > > >   include/media/v4l2-subdev.h | 5 +++--
> > > > >   1 file changed, 3 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > > > > index b325df0d54d6..0b04ed1994b6 100644
> > > > > --- a/include/media/v4l2-subdev.h
> > > > > +++ b/include/media/v4l2-subdev.h
> > > > > @@ -822,8 +822,9 @@ struct v4l2_subdev_state {
> > > > >    *		     operation shall fail if the pad index it has been called on
> > > > >    *		     is not valid or in case of unrecoverable failures.
> > > > >    *
> > > > > - * @set_routing: enable or disable data connection routes described in the
> > > > > - *		 subdevice routing table.
> > > > > + * @set_routing: Enable or disable data connection routes described in the
> > > > > + *		 subdevice routing table. Subdevs that implement this operation
> > > > > + *		 must set the V4L2_SUBDEV_FL_STREAMS flag.
> > > > 
> > > > Could we set the flag in the core when this op exists for a sub-device?
> > > 
> > > That won't work in all cases, as a driver could expose immutable routes
> > > by creating them in the .init_cfg() function, without implementing
> > > .set_routing().
> > > 
> > > Another option would be to check if the drivers has created routes after
> > > the .init_cfg() called (indirectly) from v4l2_subdev_init_finalize(). It
> > > may be a bit fragile though.
> > 
> > If you have either, then the sub-device does support streams. As otherwise,
> > there are no streams exposed to the user space. Right?
> 
> We need to know the existence of V4L2_SUBDEV_FL_STREAMS flag before calling
> init_cfg, in __v4l2_subdev_state_alloc.

Good point. Still, it'd be great to get rid of such flags. They are
incorrectly set in so many places. :-(

-- 
Sakari Ailus
