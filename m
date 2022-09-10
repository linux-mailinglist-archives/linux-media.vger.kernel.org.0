Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF00D5B4609
	for <lists+linux-media@lfdr.de>; Sat, 10 Sep 2022 13:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbiIJLTD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Sep 2022 07:19:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbiIJLTC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Sep 2022 07:19:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 955AE5018A
        for <linux-media@vger.kernel.org>; Sat, 10 Sep 2022 04:19:01 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33247440;
        Sat, 10 Sep 2022 13:18:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662808738;
        bh=2/S80fOZdH19xvofwQYhXjNOG2TvF/WopcTyriBPjac=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jRhZe89TTt+Nk/N2yRgQMDx9/cnA+Qk7P6K4QxTV0ni5eEs8cotjxfCQ6DDuo74c+
         AsxgbikQYtiqnTVTB6SxJD1I61iie1ZRrMi8YcAH5AboFGtiUEPLcD9JGC7bzT1c22
         UVE6P5K7zyvNmGve0ZR9/iNHregNc4j1OW+3xnEM=
Date:   Sat, 10 Sep 2022 14:18:41 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Scally <djrscally@gmail.com>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [ANN] Media Summit at ELCE Dublin, September 12: Draft Agenda V2
Message-ID: <YxxykQwzXouGj6B6@pendragon.ideasonboard.com>
References: <3840c3cc-00fb-45dd-cb89-39b36fb6d733@xs4all.nl>
 <YxX8dzSsquJmO5hP@paasikivi.fi.intel.com>
 <YxYLSk2pKdGnNDP3@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YxYLSk2pKdGnNDP3@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 05, 2022 at 05:44:27PM +0300, Laurent Pinchart wrote:
> On Mon, Sep 05, 2022 at 01:41:11PM +0000, Sakari Ailus wrote:
> > On Tue, Aug 23, 2022 at 12:53:44PM +0200, Hans Verkuil wrote:
> > > 16:45-18:00 Anything else?
> > 
> > I think it'd be great to have a GPG key signing party at the end of the
> > meeting.
> 
> It's a good idea. Could everybody please send their GPG key fingerprint
> in an e-mail reply to prepare for that ? It can easily be retrieved with
> 'gpg -K' (make sure to pick the right key if you have multiple of them).
> I'll start:
> 
> sec   rsa4096/0xF045C2B96991256E 2014-10-09 [C]
>       94231B980100EC619AC10E10F045C2B96991256E
> uid                   [ultimate] Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> If you're generating a key for the occasion, create a primary key with
> the Certify (C) capability only, and create separate sub-keys for
> Signature (S) and Encryption (E). There's little reason these days to
> use less than 4096 bits for the primary key if you opt for RSA. The
> subkeys should have an expiration date.
> 
> The primary key can then be moved to safe storage, you will only need
> the subkeys for daily usage.  The primary key will be used only to
> create new subkeys and to sign other people's keys.

I have received keys for half of the attendees. If you are in the list
below, have a GPG key, and would like to participate in the key signing,
please send your public key by e-mail today.

Benjamin Gaignard
Daniel Scally
Dave Stevenson
Hugues Fruchet
Michael Olbrich
Michael Tretter
Nicolas Dufresne
Niklas Söderlund
Philipp Zabel

-- 
Regards,

Laurent Pinchart
