Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16C495B0387
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 14:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbiIGMBS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 08:01:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbiIGMBR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 08:01:17 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 587A380F45
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 05:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662552076; x=1694088076;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u4NMVIieRqWcx5jdkBYimgeBbSoC7PlvvYjRz96Kx78=;
  b=QsiMPqNtSHh6FlBAe78fUpSw/aN3Vlpi539ONWZDJnCXUUo477j8Kx6o
   RqzQn0TS5YK5CKi0+Sop2niYtUsTsm9xKysmHdI7SKRbczcJgrRSuOdG4
   bJQqybkFlgcyGCZzveuEgxbRjHB7U3slCKch42HnpIet4RlNf0/4iw0X4
   WQOKiCOKSURoCNdgCGJrw2aFAbaIZgtnLauwar/DOTAl4QUbOZKbBBy/a
   CnObkU3zQWEJe27JhGn0SNXxsJGtx5lKlqbI3oOE71ZwRJHcGQ++Pqobe
   vt0HO15dE9zJIWQe9ADxY23mAt+lS9j4FGhbA8SPL87SkjWDI9wly8pgX
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="360798103"
X-IronPort-AV: E=Sophos;i="5.93,296,1654585200"; 
   d="scan'208";a="360798103"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 05:01:16 -0700
X-IronPort-AV: E=Sophos;i="5.93,296,1654585200"; 
   d="scan'208";a="790023316"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 05:01:12 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 0DE8C2017A;
        Wed,  7 Sep 2022 15:01:10 +0300 (EEST)
Date:   Wed, 7 Sep 2022 12:01:10 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Message-ID: <YxiIBoaLEjtqIpk1@paasikivi.fi.intel.com>
References: <3840c3cc-00fb-45dd-cb89-39b36fb6d733@xs4all.nl>
 <YxX8dzSsquJmO5hP@paasikivi.fi.intel.com>
 <YxYLSk2pKdGnNDP3@pendragon.ideasonboard.com>
 <YxhKCtYC3vq5vTro@paasikivi.fi.intel.com>
 <YxhLz6veSZgsZj9f@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxhLz6veSZgsZj9f@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 07, 2022 at 10:44:15AM +0300, Laurent Pinchart wrote:
> On Wed, Sep 07, 2022 at 07:36:42AM +0000, Sakari Ailus wrote:
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
> > 
> > Maybe we could put the keys here for easier access?
> 
> I was planning to consolidate the list and send it to all attendees
> before the workshop.

That would work, too. It's probably still about as easy to put them on that
page.

> > <URL:https://pilvi.retiisi.eu/s/CYZp6Bz4yj4Ak2e>

-- 
Sakari Ailus
