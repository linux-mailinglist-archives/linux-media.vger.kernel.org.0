Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDD02434BA5
	for <lists+linux-media@lfdr.de>; Wed, 20 Oct 2021 14:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbhJTNAL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Oct 2021 09:00:11 -0400
Received: from mga09.intel.com ([134.134.136.24]:17078 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229702AbhJTNAL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Oct 2021 09:00:11 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="228644529"
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; 
   d="scan'208";a="228644529"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2021 05:57:56 -0700
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; 
   d="scan'208";a="718938576"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2021 05:57:54 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 4D4F92015A;
        Wed, 20 Oct 2021 15:57:52 +0300 (EEST)
Date:   Wed, 20 Oct 2021 15:57:52 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     kernel@puri.sm, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, lkp@intel.com, mchehab@kernel.org,
        paul.kocialkowski@bootlin.com
Subject: Re: [PATCH v3 0/2] media: hi846: minor build fixes
Message-ID: <YXASUAHcvQlWefwp@paasikivi.fi.intel.com>
References: <20211019155509.1018130-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211019155509.1018130-1-martin.kepplinger@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 19, 2021 at 05:55:07PM +0200, Martin Kepplinger wrote:
> Similar to many other drivers this basically should fix the build warning
> where the const struct of_device_id we define can be unused. Reported
> here:
> https://lore.kernel.org/linux-media/202110170632.b6umsB8m-lkp@intel.com/

Thanks, Martin!> 

-- 
Sakari Ailus
