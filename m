Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7097B35D29E
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 23:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240321AbhDLVbM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 17:31:12 -0400
Received: from mga18.intel.com ([134.134.136.126]:55318 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239392AbhDLVbH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 17:31:07 -0400
IronPort-SDR: +Pj0XN/gmUusSFMMw0xiWQPRlOqifM1+pKmCrZPJfoOJCm1KxtritVwuaMGkF11Xr/Peafp0cy
 uJYb52h3nwZA==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="181799803"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="181799803"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 14:30:47 -0700
IronPort-SDR: K63XHryXXzqS080UzD9jLi5X/KJ+TvajITlty1evV0jVGd5CoC+5/xXQVpdeeqYZPoTLS37FlO
 gKxxb+o9az6g==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="600125623"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 14:30:45 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 8F1E0200E8;
        Tue, 13 Apr 2021 00:30:43 +0300 (EEST)
Date:   Tue, 13 Apr 2021 00:30:43 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [PATCH] staging: media: atomisp: i2c: align line break to match
 with open parenthesis
Message-ID: <20210412213043.GP3@paasikivi.fi.intel.com>
References: <20210412134301.11587-1-martinsdecarvalhobeatriz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412134301.11587-1-martinsdecarvalhobeatriz@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Beatriz,

Thanks for the patch.

On Mon, Apr 12, 2021 at 02:43:01PM +0100, Beatriz Martins de Carvalho wrote:
> Aligns line break with the remaining function arguments
> to the open parenthesis.
> Issue found by checkpatch in file atomisp-gc2235.c
> 
> Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
