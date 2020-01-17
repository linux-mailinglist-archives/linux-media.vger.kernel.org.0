Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC3F14049A
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2020 08:51:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729139AbgAQHvO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jan 2020 02:51:14 -0500
Received: from mga17.intel.com ([192.55.52.151]:50831 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729011AbgAQHvO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jan 2020 02:51:14 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Jan 2020 23:51:13 -0800
X-IronPort-AV: E=Sophos;i="5.70,329,1574150400"; 
   d="scan'208";a="261707105"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Jan 2020 23:51:12 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 8ACF620836; Fri, 17 Jan 2020 09:51:10 +0200 (EET)
Date:   Fri, 17 Jan 2020 09:51:10 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Bingbu Cao <bingbu.cao@intel.com>
Cc:     linux-media@vger.kernel.org, tfiga@chromium.org,
        tian.shu.qiu@intel.com, bingbu.cao@linux.intel.com
Subject: Re: [PATCH] Revert "media: staging/intel-ipu3: make imgu use fixed
 running mode"
Message-ID: <20200117075110.GO5440@paasikivi.fi.intel.com>
References: <1579145689-23252-1-git-send-email-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579145689-23252-1-git-send-email-bingbu.cao@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Thu, Jan 16, 2020 at 11:34:49AM +0800, Bingbu Cao wrote:
> This reverts commit e878742c83ec26ef256ebb6b36a4d44644548f25.
> 
> Imgu should still keep the capability and flexibility to allow user to
> run 2 video pipes, as the user may use the video pipe to capture still
> frames with less system load and power than still pipe.
> 
> Suggested-by: Tomasz Figa <tfiga@chromium.org>

You're missing Sob line here. Please resend with that included.

-- 
Kind regards,

Sakari Ailus
