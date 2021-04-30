Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1E5436F5D3
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 08:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbhD3God (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 02:44:33 -0400
Received: from mga14.intel.com ([192.55.52.115]:26689 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229508AbhD3God (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 02:44:33 -0400
IronPort-SDR: 79HzPVukz4g7ZR5w7KNhzR+mJGUyf7kqTLSUH9+/bCMU1UrsZkw32T3fdHyqAGjESn3Rhk7sxk
 ubYCn0jsXcpw==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="196771496"
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; 
   d="scan'208";a="196771496"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2021 23:43:45 -0700
IronPort-SDR: 4rOfv24PM6WHiFGSH9bzpw2vA0yXJwhx6NPRvksNu8aJ6AtBXb7FbxFxz1WeMwkh2snxEXwVIM
 49fjJOoYr58g==
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; 
   d="scan'208";a="388438373"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2021 23:43:43 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 02DBD203B0;
        Fri, 30 Apr 2021 09:43:40 +0300 (EEST)
Date:   Fri, 30 Apr 2021 09:43:39 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Deepak R Varma <drv@mailo.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/9] staging: media: atomisp: code cleanup fixes
Message-ID: <20210430064339.GB3@paasikivi.fi.intel.com>
References: <cover.1619628317.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1619628317.git.drv@mailo.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Deepak,

On Wed, Apr 28, 2021 at 11:34:29PM +0530, Deepak R Varma wrote:
> This patch set addresses multiple issues reported by  of checkpatch script as
> WARNING and CHECK complaints. Other feedback received from the
> maintainers is incorporated as well.
> 
> Note:
>    - The patches should be applied in the ascending order.
>    - Patch count revised to 9 from 6
>    - patch 1/9 is not being sent since it was already submitted by
>      another developer.

Then what is now the 2nd patch should have been the first. No need to
resend because of just that though.

For the rest of the patches apart from 5th,

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
