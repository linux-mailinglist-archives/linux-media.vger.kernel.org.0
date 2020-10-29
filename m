Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9174C29EEC2
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 15:50:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727526AbgJ2Ouy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 10:50:54 -0400
Received: from retiisi.eu ([95.216.213.190]:59088 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726521AbgJ2Ouy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 10:50:54 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 41139634C87;
        Thu, 29 Oct 2020 16:50:12 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kY9Fl-0001vS-EP; Thu, 29 Oct 2020 16:50:13 +0200
Date:   Thu, 29 Oct 2020 16:50:13 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Thierry Reding <treding@nvidia.com>,
        linux-media@vger.kernel.org
Subject: Re: Suggestion regarding x8 gang mode device tree changes
Message-ID: <20201029145013.GA6899@valkosipuli.retiisi.org.uk>
References: <e253fee3-5358-aaf1-d317-162dc8e98afc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e253fee3-5358-aaf1-d317-162dc8e98afc@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sowjanya,

On Wed, Oct 28, 2020 at 06:48:59PM -0700, Sowjanya Komatineni wrote:
> Hi Sakari,
> 
> Missed to add you to below patch series for HDMI2CSI bridge support
> 
> https://patchwork.kernel.org/project/linux-media/cover/1603768763-25590-1-git-send-email-skomatineni@nvidia.com/
> 
> Patch-10 of this series is for x8 capture from HDMI2CSI bridge.
> 
> Would like to get your suggestion on x8 gang/combined ports capture
> implementation.

The majority of CSI-2 receiver devices support partitioning the lanes among
different PHYs in various ways. They do support usually up to four lanes,
but adding four more lanes is not a reason for making the API different.

So instead, you should implement this as a single port that simply has 8
lanes.

-- 
Kind regards,

Sakari Ailus
