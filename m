Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25AD545E900
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 09:08:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245413AbhKZIMH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 03:12:07 -0500
Received: from mga12.intel.com ([192.55.52.136]:22606 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345567AbhKZIKG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 03:10:06 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="215653061"
X-IronPort-AV: E=Sophos;i="5.87,265,1631602800"; 
   d="scan'208";a="215653061"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 00:04:52 -0800
X-IronPort-AV: E=Sophos;i="5.87,265,1631602800"; 
   d="scan'208";a="607775204"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 00:04:51 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 15E6C205AA;
        Fri, 26 Nov 2021 10:04:49 +0200 (EET)
Date:   Fri, 26 Nov 2021 10:04:49 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] max96712: Select VIDEO_V4L2
Message-ID: <YaCVIerQA4LVTm28@paasikivi.fi.intel.com>
References: <20211101132502.700505-1-sakari.ailus@linux.intel.com>
 <YZ9Kkodn831YQsSC@bismarck.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YZ9Kkodn831YQsSC@bismarck.dyn.berto.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Thu, Nov 25, 2021 at 09:34:26AM +0100, Niklas Söderlund wrote:
> Hi Sakari,
> 
> I noticed this patch is marked as Rejected in patchwork, but it's still 
> needed. Will you resurrect this patch?

Good point.

I noticed Kieran submitted something alike but it seems to have been for a
different driver.

I'll send one that uses depends instead.

-- 
Regards,

Sakari Ailus
