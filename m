Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD4FD6C719A
	for <lists+linux-media@lfdr.de>; Thu, 23 Mar 2023 21:18:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231312AbjCWUSr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Mar 2023 16:18:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjCWUSq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Mar 2023 16:18:46 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75BCDCC21
        for <linux-media@vger.kernel.org>; Thu, 23 Mar 2023 13:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679602725; x=1711138725;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IgTOQgLsxLFuiQp1pQiE0otcY2CgvH0h2bQ/SLRXJC8=;
  b=XbDkU6yokIBojfMgf7RtgQymeGON/5jUbmYRXNprGWKel2s44P8d11CZ
   sXZdk1+IR7QQKi+eaHBRB39aqDaFlJpLVqNlQtIalwZOayoSgsO5GcYXR
   /7DI8zfskaybX5hxb1rmqhpsG7zb9UJNLz0hRptYDKkkLFYeMFDBAG5Gv
   fouMSBp8OL1yHpSt0mMme21Y0/1RcDEWClP4yZU50lQ982MPqnydw0M0g
   QL9WS3cag0pp8MvgpbuQcQAtCM8xmU+4CnifnUueGdwsUw2zDlRWKsgZH
   5PNleLAEGGISKXW+2jsXSSFPVT991eSeYgGA7JjcdsMwJcET0NYvtOZbD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="341171193"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="341171193"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 13:18:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="684889466"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="684889466"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 13:18:42 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 94965120DC2;
        Thu, 23 Mar 2023 22:18:39 +0200 (EET)
Date:   Thu, 23 Mar 2023 22:18:39 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com
Subject: Re: [RFC 01/10] media: v4l: async: Return async sub-devices to
 subnotifier list
Message-ID: <ZBy0H/6D/053xfFe@kekkonen.localdomain>
References: <20230307212038.968381-1-sakari.ailus@linux.intel.com>
 <20230307212038.968381-2-sakari.ailus@linux.intel.com>
 <20230322125654.dp7vyqelnujjdrq5@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322125654.dp7vyqelnujjdrq5@uno.localdomain>
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Wed, Mar 22, 2023 at 01:56:54PM +0100, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Tue, Mar 07, 2023 at 11:20:29PM +0200, Sakari Ailus wrote:
> > When an async notifier is unregistered, the async sub-devices in the
> > notifier's done list will disappear with the notifier. However this is
> > currently also done to the sub-notifiers that remain registered. Their
> > sub-devices only need to be unbound while the async sub-devices themselves
> > need to be returned to the sub-notifier's waiting list. Do this now.
> 
> I'm a bit missing the point of re-adding the async sub-device to the
> waiting list if the sub-notifier is about to be un-registered as well.

The point is that that's not known. The main notifier may come back,
without the sub-notifier being removed. Those sub-devices only should be
removed with the sub-notifier.

> 
> The only use I found is printing out the list of pending async
> subdevices. Why is this relevant for sub-notifiers only ?

The current model assumes that the main notifier is always removed first of
all notifiers. That should of course be changed but it's much more than a
simple bugfix.

-- 
Regards,

Sakari Ailus
