Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 621C75F1431
	for <lists+linux-media@lfdr.de>; Fri, 30 Sep 2022 22:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232058AbiI3Uwl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Sep 2022 16:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231612AbiI3Uwk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Sep 2022 16:52:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87C0118F42E
        for <linux-media@vger.kernel.org>; Fri, 30 Sep 2022 13:52:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8FEAE47C;
        Fri, 30 Sep 2022 22:52:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1664571152;
        bh=gszIBXMHIzUTkM2FGcgyfzpV4cDzfsI8JNwBzRd5D3M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fnWXaNhIqIB9IcDQzAcHM4Tb8jn/JhdlQpeJQV08HaDdGAmhE8wowUKyZFBLoLYY6
         1qyFiwBUqtNOLN+LZ35f93Bo/qEUiw6lDA5Fv/M0/709qoSGCZhiFRkoGLIz4W38jo
         /fX+WzfcJufF17acCzrm/O7har8IVqKB0/1/fmRY=
Date:   Fri, 30 Sep 2022 23:52:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Daniel Scally <djrscally@gmail.com>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [ANN] Media Summit at ELCE Dublin, September 12: Draft Agenda V2
Message-ID: <YzdXDuh9Wgm6o3OP@pendragon.ideasonboard.com>
References: <3840c3cc-00fb-45dd-cb89-39b36fb6d733@xs4all.nl>
 <YxX8dzSsquJmO5hP@paasikivi.fi.intel.com>
 <YxYLSk2pKdGnNDP3@pendragon.ideasonboard.com>
 <20220907115351.d774wruu22fdohwl@houat>
 <20220930204642.o6l7qtgg4mhvlthe@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220930204642.o6l7qtgg4mhvlthe@houat>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maxime,

On Fri, Sep 30, 2022 at 10:46:42PM +0200, Maxime Ripard wrote:
> On Wed, Sep 07, 2022 at 01:53:51PM +0200, Maxime Ripard wrote:
> > On Mon, Sep 05, 2022 at 05:44:26PM +0300, Laurent Pinchart wrote:
> > > On Mon, Sep 05, 2022 at 01:41:11PM +0000, Sakari Ailus wrote:
> > > > On Tue, Aug 23, 2022 at 12:53:44PM +0200, Hans Verkuil wrote:
> > > > > 16:45-18:00 Anything else?
> > > > 
> > > > I think it'd be great to have a GPG key signing party at the end of the
> > > > meeting.
> > > 
> > > It's a good idea. Could everybody please send their GPG key fingerprint
> > > in an e-mail reply to prepare for that ? It can easily be retrieved with
> > > 'gpg -K' (make sure to pick the right key if you have multiple of them).
> > > I'll start:
> > > 
> > > sec   rsa4096/0xF045C2B96991256E 2014-10-09 [C]
> > >       94231B980100EC619AC10E10F045C2B96991256E
> > > uid                   [ultimate] Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > 
> > > If you're generating a key for the occasion, create a primary key with
> > > the Certify (C) capability only, and create separate sub-keys for
> > > Signature (S) and Encryption (E). There's little reason these days to
> > > use less than 4096 bits for the primary key if you opt for RSA. The
> > > subkeys should have an expiration date.
> > > 
> > > The primary key can then be moved to safe storage, you will only need
> > > the subkeys for daily usage.  The primary key will be used only to
> > > create new subkeys and to sign other people's keys.
> > 
> > sec#  ed25519 2018-09-15 [C] [expires: 2023-03-17]
> >       BE5675C37E818C8B5764241C254BCFC56BF6CE8D
> > uid           [ultimate] Maxime Ripard <maxime.ripard@anandra.org>
> > uid           [ultimate] Maxime Ripard <mripard@kernel.org>
> > uid           [ultimate] Maxime Ripard (Work Address) <maxime@cerno.tech>
> 
> I'm not entirely sure what happened, but it looks like all the
> signatures I received so far (Laurent, Jernej, Ricardo, Kieran, Jacopo
> and Chen-Yu) have been missing that UID
> 
> Could you make sure that it's signed?

The key I have here doesn't have that UID. To what key server have you
pushed it ?

-- 
Regards,

Laurent Pinchart
