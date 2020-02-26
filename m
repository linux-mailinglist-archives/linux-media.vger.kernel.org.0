Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9824217020F
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 16:14:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727992AbgBZPOg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 10:14:36 -0500
Received: from mga14.intel.com ([192.55.52.115]:24234 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726148AbgBZPOf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 10:14:35 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Feb 2020 07:14:35 -0800
X-IronPort-AV: E=Sophos;i="5.70,488,1574150400"; 
   d="scan'208";a="350410152"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Feb 2020 07:14:33 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 4F6CE20884; Wed, 26 Feb 2020 17:14:31 +0200 (EET)
Date:   Wed, 26 Feb 2020 17:14:31 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Daniel =?iso-8859-1?Q?Gl=F6ckner?= <dg@emlix.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org,
        Jouni Ukkonen <jouni.ukkonen@intel.com>
Subject: Re: [PATCH 1/3] media: v4l: Add 14-bit raw bayer pixel formats
Message-ID: <20200226151431.GY5379@paasikivi.fi.intel.com>
References: <8885ed8c-6121-d40e-bc45-3ed58f800a95@emlix.com>
 <20200224175222.1875-1-dg@emlix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200224175222.1875-1-dg@emlix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On Mon, Feb 24, 2020 at 06:52:20PM +0100, Daniel Glöckner wrote:
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> The formats added by this patch are:
> 
> 	V4L2_PIX_FMT_SBGGR14
> 	V4L2_PIX_FMT_SGBRG14
> 	V4L2_PIX_FMT_SGRBG14
> 	V4L2_PIX_FMT_SRGGB14
> 
> Signed-off-by: Jouni Ukkonen <jouni.ukkonen@intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Hans Verkuil <hans.verkuil@cisco.com>
> [dg@emlix.com: rebased onto current media_tree]
> Signed-off-by: Daniel Glöckner <dg@emlix.com>

For the three patches:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
