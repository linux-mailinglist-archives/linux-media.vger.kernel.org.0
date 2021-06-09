Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9375C3A1804
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 16:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238387AbhFIO4E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Jun 2021 10:56:04 -0400
Received: from mga01.intel.com ([192.55.52.88]:35631 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230239AbhFIO4D (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Jun 2021 10:56:03 -0400
IronPort-SDR: x+PTooIsecnKJsRsal4AwMbx5ntyZfve1n5T8YQr2GHk1KEDkaIWyHCBnpC+s3c71vxRWU/WdH
 K904Q0isS+Yg==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="226457692"
X-IronPort-AV: E=Sophos;i="5.83,261,1616482800"; 
   d="scan'208";a="226457692"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2021 07:54:08 -0700
IronPort-SDR: lqZE0eQv+v5lrVzBazQmDGO0q9nm+JbbXoTZ+SGwgEuL7AVOjWtaR/GnyU2eqMyfDGIIUsXcQy
 fqDscxUFbdbQ==
X-IronPort-AV: E=Sophos;i="5.83,261,1616482800"; 
   d="scan'208";a="449968541"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2021 07:54:06 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 7FC5020116;
        Wed,  9 Jun 2021 17:54:04 +0300 (EEST)
Date:   Wed, 9 Jun 2021 17:54:04 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: remove redundant initialization of
 variable ret
Message-ID: <20210609145404.GI3@paasikivi.fi.intel.com>
References: <20210609121408.186239-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210609121408.186239-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 09, 2021 at 01:14:08PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being initialized with a value that is never read,
> it is being updated later on. The assignment is redundant and can be
> removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
