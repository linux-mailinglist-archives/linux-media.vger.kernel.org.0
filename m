Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4151F5AFDC7
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 09:44:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbiIGHoU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 03:44:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbiIGHoT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 03:44:19 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C27B79E2E0
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 00:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662536657; x=1694072657;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ofee96CYsjcA644g+IP3Xz1wjwsdKZHhXjEkVRqivIQ=;
  b=YdXlrrsVvET8ygd+wFOYAy8VILy3z/GcJORVR7xxIsIVRv897z1BeR6x
   Vl8lhudXVeyPG7xsIoJcyzttNQ1XB0bY0NKvNSK7Am+L0dRD7vUWMtdwZ
   NoV31G96OoJWr2oHnMklshF0DC+7STlD7m4XzCm4vct27DaHHulSP3pNc
   ns804Ibji9K7h+0OioqSjKJxuS+H4neiVVsR1yNTtKbj5pRwAzo5E3vvN
   vDIN41ZPXOz3pDB/8RwoeILRnCshewJfhHuZBUacOxClT+gJygJSXNSxG
   BDhJ0ur03VyaCsDQzecTEsDs6WcXeCgYeLZjPbQnimDwNqJSPH+ydrcpQ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="283804143"
X-IronPort-AV: E=Sophos;i="5.93,296,1654585200"; 
   d="scan'208";a="283804143"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 00:44:17 -0700
X-IronPort-AV: E=Sophos;i="5.93,296,1654585200"; 
   d="scan'208";a="676065004"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 00:44:13 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id C08C02017A;
        Wed,  7 Sep 2022 10:44:11 +0300 (EEST)
Date:   Wed, 7 Sep 2022 07:44:11 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
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
Message-ID: <YxhLy2rKhss1Edll@paasikivi.fi.intel.com>
References: <3840c3cc-00fb-45dd-cb89-39b36fb6d733@xs4all.nl>
 <YxX8dzSsquJmO5hP@paasikivi.fi.intel.com>
 <YxYLSk2pKdGnNDP3@pendragon.ideasonboard.com>
 <b76bd2fb-d0bc-2e71-26ec-b98b9949700d@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b76bd2fb-d0bc-2e71-26ec-b98b9949700d@xs4all.nl>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, Sep 07, 2022 at 08:51:48AM +0200, Hans Verkuil wrote:
> Hi Laurent,
> 
> On 05/09/2022 16:44, Laurent Pinchart wrote:
> > On Mon, Sep 05, 2022 at 01:41:11PM +0000, Sakari Ailus wrote:
> >> On Tue, Aug 23, 2022 at 12:53:44PM +0200, Hans Verkuil wrote:
> >>> 16:45-18:00 Anything else?
> >>
> >> I think it'd be great to have a GPG key signing party at the end of the
> >> meeting.
> > 
> > It's a good idea. Could everybody please send their GPG key fingerprint
> > in an e-mail reply to prepare for that ? It can easily be retrieved with
> > 'gpg -K' (make sure to pick the right key if you have multiple of them).
> > I'll start:
> > 
> > sec   rsa4096/0xF045C2B96991256E 2014-10-09 [C]
> >       94231B980100EC619AC10E10F045C2B96991256E
> > uid                   [ultimate] Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > If you're generating a key for the occasion, create a primary key with
> > the Certify (C) capability only, and create separate sub-keys for
> > Signature (S) and Encryption (E). There's little reason these days to
> > use less than 4096 bits for the primary key if you opt for RSA. The
> > subkeys should have an expiration date.
> > 
> > The primary key can then be moved to safe storage, you will only need
> > the subkeys for daily usage.  The primary key will be used only to
> > create new subkeys and to sign other people's keys.
> > 
> 
> Can you also give instructions on what to do at the key signing party?
> 
> I do this so rarely that I always forget what magic gpg commands I need
> to make to sign keys.
> 
> If everyone has this information at hand, then we can quickly proceed with
> this on Monday.

There's one here (directly linking to the signing section albeit the rest
is important, too):

<URL:https://www.cryptnet.net/fdp/crypto/keysigning_party/en/keysigning_party.html#id2557964>

I also wrote a small script that assumes there will be no errors of any
sort at any point of time, in conjunction with the e-mail on the key list.

-- 
Sakari Ailus
