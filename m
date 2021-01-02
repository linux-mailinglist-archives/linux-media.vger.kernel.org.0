Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE6172E87F0
	for <lists+linux-media@lfdr.de>; Sat,  2 Jan 2021 16:30:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbhABPai (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Jan 2021 10:30:38 -0500
Received: from mga01.intel.com ([192.55.52.88]:37818 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726575AbhABPai (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 2 Jan 2021 10:30:38 -0500
IronPort-SDR: DIzg1Pah+cqgyRhLaWPrswNnO3QxCQ0y17uDLiFkE+K1iXaiEh04kn8BZ8LlgjphuB0wHWVnCk
 Qcs428T0+kHw==
X-IronPort-AV: E=McAfee;i="6000,8403,9852"; a="195340921"
X-IronPort-AV: E=Sophos;i="5.78,469,1599548400"; 
   d="scan'208";a="195340921"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2021 07:28:53 -0800
IronPort-SDR: UTT2cr3YzKcjYAK285254rYvQSZ5xCEUJ1eXvK1VPzNT9p2KImOc7owUnuYSfWl0YHzdJcFbec
 1I3k+g6FmeDg==
X-IronPort-AV: E=Sophos;i="5.78,469,1599548400"; 
   d="scan'208";a="396844956"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2021 07:28:51 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id E918E207BF; Sat,  2 Jan 2021 17:28:49 +0200 (EET)
Date:   Sat, 2 Jan 2021 17:28:49 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com
Subject: Re: [PATCH] media: v4l2-async: Add waiting subdevices debugfs
Message-ID: <20210102152849.GC11878@paasikivi.fi.intel.com>
References: <20201228180511.43486-1-ezequiel@collabora.com>
 <20201228183520.GB26370@paasikivi.fi.intel.com>
 <X+pN4Z3eCIV9cjNV@pendragon.ideasonboard.com>
 <faa537997323c4c6e7e21e0edcc2fbc63e03725c.camel@collabora.com>
 <X+s53z5vB0hiZY2E@pendragon.ideasonboard.com>
 <91034a368adcd53691de2b814f5c929e8ccba061.camel@collabora.com>
 <20210102152814.GB11878@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210102152814.GB11878@paasikivi.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> Could you simply print the node name, %pfw?

The full path of the node, I meant. The modifier is correct.

-- 
Sakari Ailus
