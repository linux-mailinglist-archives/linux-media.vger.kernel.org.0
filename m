Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA8E5F275E
	for <lists+linux-media@lfdr.de>; Mon,  3 Oct 2022 02:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbiJCAUp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Oct 2022 20:20:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiJCAUn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Oct 2022 20:20:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE19024BE1
        for <linux-media@vger.kernel.org>; Sun,  2 Oct 2022 17:20:42 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8AAD0E03;
        Mon,  3 Oct 2022 02:20:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1664756440;
        bh=02BUDsluiWPm4kbo8RTQ2K9uBxPxgzkn5wXwXTIp/QI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Hy2V/2VW0pvB/CNjE38Hps0/zXBxskM/Foduo2gfty99aL3nmtFQbVnMyNYUNcW1Y
         /y4UkbSvUBn4FPSJO3by5GurgYQWQdFCS2u4yuceuO6DS+KZbD5vH+lr6wW6vMw8Sd
         BavROZn18sDVq9lkN9BItKuD6/JEC6Uw/q8ICP5Y=
Date:   Mon, 3 Oct 2022 03:20:39 +0300
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
Message-ID: <Yzoq1w4GZvhjvTYZ@pendragon.ideasonboard.com>
References: <3840c3cc-00fb-45dd-cb89-39b36fb6d733@xs4all.nl>
 <YxX8dzSsquJmO5hP@paasikivi.fi.intel.com>
 <YxYLSk2pKdGnNDP3@pendragon.ideasonboard.com>
 <20220907115351.d774wruu22fdohwl@houat>
 <20220930204642.o6l7qtgg4mhvlthe@houat>
 <YzdXDuh9Wgm6o3OP@pendragon.ideasonboard.com>
 <20221001100741.4iivrmhn7ph2nhs2@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221001100741.4iivrmhn7ph2nhs2@houat>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Oct 01, 2022 at 12:07:41PM +0200, Maxime Ripard wrote:
> On Fri, Sep 30, 2022 at 11:52:30PM +0300, Laurent Pinchart wrote:
> > On Fri, Sep 30, 2022 at 10:46:42PM +0200, Maxime Ripard wrote:
> > > On Wed, Sep 07, 2022 at 01:53:51PM +0200, Maxime Ripard wrote:
> > > > On Mon, Sep 05, 2022 at 05:44:26PM +0300, Laurent Pinchart wrote:
> > > > > On Mon, Sep 05, 2022 at 01:41:11PM +0000, Sakari Ailus wrote:
> > > > > > On Tue, Aug 23, 2022 at 12:53:44PM +0200, Hans Verkuil wrote:
> > > > > > > 16:45-18:00 Anything else?
> > > > > > 
> > > > > > I think it'd be great to have a GPG key signing party at the end of the
> > > > > > meeting.
> > > > > 
> > > > > It's a good idea. Could everybody please send their GPG key fingerprint
> > > > > in an e-mail reply to prepare for that ? It can easily be retrieved with
> > > > > 'gpg -K' (make sure to pick the right key if you have multiple of them).
> > > > > I'll start:
> > > > > 
> > > > > sec   rsa4096/0xF045C2B96991256E 2014-10-09 [C]
> > > > >       94231B980100EC619AC10E10F045C2B96991256E
> > > > > uid                   [ultimate] Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > 
> > > > > If you're generating a key for the occasion, create a primary key with
> > > > > the Certify (C) capability only, and create separate sub-keys for
> > > > > Signature (S) and Encryption (E). There's little reason these days to
> > > > > use less than 4096 bits for the primary key if you opt for RSA. The
> > > > > subkeys should have an expiration date.
> > > > > 
> > > > > The primary key can then be moved to safe storage, you will only need
> > > > > the subkeys for daily usage.  The primary key will be used only to
> > > > > create new subkeys and to sign other people's keys.
> > > > 
> > > > sec#  ed25519 2018-09-15 [C] [expires: 2023-03-17]
> > > >       BE5675C37E818C8B5764241C254BCFC56BF6CE8D
> > > > uid           [ultimate] Maxime Ripard <maxime.ripard@anandra.org>
> > > > uid           [ultimate] Maxime Ripard <mripard@kernel.org>
> > > > uid           [ultimate] Maxime Ripard (Work Address) <maxime@cerno.tech>
> > > 
> > > I'm not entirely sure what happened, but it looks like all the
> > > signatures I received so far (Laurent, Jernej, Ricardo, Kieran, Jacopo
> > > and Chen-Yu) have been missing that UID
> > > 
> > > Could you make sure that it's signed?
> > 
> > The key I have here doesn't have that UID. To what key server have you
> > pushed it ?
> 
> It is published on keys.openpgp.org and I sent it yesterday to
> keyserver.ubuntu.com.

The latter gave me your third UID, the former didn't.

-- 
Regards,

Laurent Pinchart
