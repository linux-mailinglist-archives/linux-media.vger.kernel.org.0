Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C72035E6F77
	for <lists+linux-media@lfdr.de>; Fri, 23 Sep 2022 00:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231462AbiIVWNo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Sep 2022 18:13:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231745AbiIVWNn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Sep 2022 18:13:43 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D27A71129CF
        for <linux-media@vger.kernel.org>; Thu, 22 Sep 2022 15:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663884821; x=1695420821;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5Plet3ZXCgISMPzrHIxdH5+lQt0tiUmliOp5pLhriDg=;
  b=RV5K+9QkTeIODuNMSC1XJbxppgLsvpXdpt7FTDQQyEZNt5FswQzS+/Qq
   rKEihApipwwQ4xijt0wPo2wRQzfof4euFcGd0NtDAyUfgMMEY+G5nuBwi
   TR4+5lcLM7WqyLe4+G/YhS85RCSHN/IzeKHPP4GLomJBCSpUd2rs+g8Vg
   CpNhs2bP1/0AJbJBTCWH3smT0b2BLzewGEsn8xM8jlNfcliXRNf6Opead
   fzrAUa25i9VwUuHSlC/5aIWBDWYdGobRg1Nymh4nDCxPc6vWzI7tYRdeN
   HWETtRTrRB3/dHLjuAVvRK9/sfYSndO68dx5hfDDhBmaOI26mEzUHx1pF
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="280816197"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="280816197"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 15:13:41 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="795282644"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 15:13:37 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id F37FB20077;
        Fri, 23 Sep 2022 01:05:00 +0300 (EEST)
Date:   Thu, 22 Sep 2022 22:05:00 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Scally <djrscally@gmail.com>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [ANN] Media Summit at ELCE Dublin, September 12: Draft Agenda V2
Message-ID: <YyzcDEg+Yh0LkVLb@paasikivi.fi.intel.com>
References: <3840c3cc-00fb-45dd-cb89-39b36fb6d733@xs4all.nl>
 <YxX8dzSsquJmO5hP@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxX8dzSsquJmO5hP@paasikivi.fi.intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello everyone,

On Mon, Sep 05, 2022 at 01:41:11PM +0000, Sakari Ailus wrote:
> I think it'd be great to have a GPG key signing party at the end of the
> meeting.

Thanks to everyone who participated!

I recently learned my @iki.fi key
(270CDCD35B9D7E26C2D72097BF53AD52308AD4EC) was not up-to-date in
<URL:hkps://keyserver.ubuntu.com/> keyserver. I've now updated it.

It also seems keyservers no longer regularly synchronise keys with each
other. Some of the keys I obtained from the Debian default keyserver
<URL:hkps://keys.openpgp.org> whereas the rest I got from the other one
(mentioned earlier).

-- 
Kind regards,

Sakari Ailus
