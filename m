Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 288F7E34F5
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 16:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388734AbfJXODV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 10:03:21 -0400
Received: from mga12.intel.com ([192.55.52.136]:14218 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730547AbfJXODU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 10:03:20 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Oct 2019 07:03:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,224,1569308400"; 
   d="scan'208";a="210164958"
Received: from jjackiew-mobl1.ger.corp.intel.com (HELO mara.localdomain) ([10.249.148.206])
  by fmsmga001.fm.intel.com with ESMTP; 24 Oct 2019 07:03:19 -0700
Received: from sailus by mara.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1iNdj3-00014W-RR; Thu, 24 Oct 2019 17:04:29 +0300
Date:   Thu, 24 Oct 2019 17:04:29 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] Documentation: media: *_DEFAULT targets for subdevs
Message-ID: <20191024140428.GF3966@mara.localdomain>
References: <20191024123526.4778-1-ribalda@kernel.org>
 <20191024133333.GE3966@mara.localdomain>
 <CAPybu_2hdvq_M-8X0_-MVxSjaJ8H0x+zDRaa4Cf=b0PQtVnzmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPybu_2hdvq_M-8X0_-MVxSjaJ8H0x+zDRaa4Cf=b0PQtVnzmQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

On Thu, Oct 24, 2019 at 03:43:36PM +0200, Ricardo Ribalda Delgado wrote:
> Hi Sakari
> 
> Lets say the user wants to select the active pixels. He needs to set
> the crop and the compose.
> 
> 1) he gets V4L2_SEL_TGT_CROP_DEFAULT
> 
> 2) he sets V4L2_SEL_TGT_CROP
> 
> How does he knows which compose to use? What if the compose starts at
> (0,0) instead of (32,32)....?
> 
> I think it is easier if
> 
> 3) he gets V4L2_SEL_TGT_COMPOSE_DEFAULT
> 
> 4) he sets V4L2_SEL_TGT_COMPOSE
> 
> This is similar as how we do it today with a v4l2_device. What if we
> simply replicate that behaviour?

The compose rectangle is relative to the crop rectangle (if there's a crop
rectangle), and always starts at 0,0.

See:

<URL:https://hverkuil.home.xs4all.nl/spec/uapi/v4l/dev-subdev.html#selections-cropping-scaling-and-composition>

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
