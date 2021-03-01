Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B06C32794B
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 09:34:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233160AbhCAIdm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 03:33:42 -0500
Received: from mga14.intel.com ([192.55.52.115]:56647 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232895AbhCAIdk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Mar 2021 03:33:40 -0500
IronPort-SDR: B1LNH7I/85b68iFtttNsvBcTFtzHBKNy//iJgsiLnuGZxF0yK09pSO8jQYOKaXC4dzbgDQksKG
 ksJ5IBOb4vtg==
X-IronPort-AV: E=McAfee;i="6000,8403,9909"; a="185718758"
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; 
   d="scan'208";a="185718758"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 00:31:41 -0800
IronPort-SDR: hadJVW2c2e/AJp+MHqcDWpB7XBXqewfPlSB7WsdFy6Q/IGf0/gsfiFTEVJAUyHiR1/anheqF0N
 yXLUlmg5vawg==
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; 
   d="scan'208";a="435329400"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 00:31:12 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id DBE0F202DD;
        Mon,  1 Mar 2021 10:31:04 +0200 (EET)
Date:   Mon, 1 Mar 2021 10:31:04 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 1/2] list: Add list_is_null() to check if a list_head has
 been initialized
Message-ID: <20210301083104.GR3@paasikivi.fi.intel.com>
References: <20210226224938.18166-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210226224938.18166-1-laurent.pinchart@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for the patch.

On Sat, Feb 27, 2021 at 12:49:37AM +0200, Laurent Pinchart wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> The new function checks if the list_head prev and next pointers are
> NULL, in order to see if a list_head that has been zeroed when allocated
> has been initialized with INIT_LIST_HEAD() or added to a list.
> 
> This can be used in cleanup functions that want to support being safely
> called when an object has not been initialized, to return immediately.
> In most cases other fields of the object can be checked for this
> purpose, but in some cases a list_head field is the only option.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  include/linux/list.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/include/linux/list.h b/include/linux/list.h
> index 85c92555e31f..e4fc6954de3b 100644
> --- a/include/linux/list.h
> +++ b/include/linux/list.h
> @@ -29,6 +29,19 @@ static inline void INIT_LIST_HEAD(struct list_head *list)
>  	list->prev = list;
>  }
>  
> +/**
> + * list_is_null - check if a list_head has been initialized
> + * @list: the list
> + *
> + * Check if the list_head prev and next pointers are NULL. This is useful to
> + * see if a list_head that has been zeroed when allocated has been initialized
> + * with INIT_LIST_HEAD() or added to a list.

How this should work with an entry that has been removed from a list with
list_del()? The values will be LIST_POISON[12] and so this function will
return true. Should it return false instead?

> + */
> +static inline bool list_is_null(struct list_head *list)
> +{
> +	return list->prev == NULL && list->next == NULL;

What would you think of issuing a warning if one is NULL but the other one
isn't? That could happen if the memory is uninitialised by the caller. It
should return true in that case, too.

> +}
> +
>  #ifdef CONFIG_DEBUG_LIST
>  extern bool __list_add_valid(struct list_head *new,
>  			      struct list_head *prev,

-- 
Kind regards,

Sakari Ailus
