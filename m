Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A1C917A47D
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2020 12:43:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgCELnU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Mar 2020 06:43:20 -0500
Received: from mga09.intel.com ([134.134.136.24]:11986 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725912AbgCELnU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Mar 2020 06:43:20 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Mar 2020 03:43:19 -0800
X-IronPort-AV: E=Sophos;i="5.70,517,1574150400"; 
   d="scan'208";a="320181753"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Mar 2020 03:43:16 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id E0E2F2088D; Thu,  5 Mar 2020 13:43:14 +0200 (EET)
Date:   Thu, 5 Mar 2020 13:43:14 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Lad Prabhakar <prabhakar.csengg@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH] media: i2c: ov5645: Add virtual_channel module parameter
Message-ID: <20200305114314.GP5379@paasikivi.fi.intel.com>
References: <20200228164126.17517-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200228164126.17517-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Fri, Feb 28, 2020 at 04:41:26PM +0000, Lad Prabhakar wrote:
> OV5645 can operate in virtual channel 0-3 in CSI2 interfaces, this patch
> adds support for module parameter virtual_channel to select the required
> channel. By default OV5645 operates in virtual channel 0.

What's your use case for different virtual channels?

-- 
Regards,

Sakari Ailus
