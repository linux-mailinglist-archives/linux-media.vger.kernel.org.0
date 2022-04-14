Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5550F5005D3
	for <lists+linux-media@lfdr.de>; Thu, 14 Apr 2022 08:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239965AbiDNGVW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Apr 2022 02:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbiDNGVV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Apr 2022 02:21:21 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B49E84A3D5
        for <linux-media@vger.kernel.org>; Wed, 13 Apr 2022 23:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649917137; x=1681453137;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A4cLRD28vTrrCJLKlXhMfSzt8zAVCzM8HZMW2BhIIYk=;
  b=E2eMo9YfDB6rFaGOKIIs51rNvxHoeCWsWzKwTalXlQV2c4M9z7C3v7y5
   /cTPm6yUOkiFoCaUzjNz/UkIzDgpcAdelwP8bNkLcnH1ZCDbq1v02FEvi
   JPJ+e5z1AP3zA8IcF/9j/5+WrfpOJIof8Ctc0WnjJ4pu00IYvBlWifV10
   szfHs4UFE8EsAe1iwkn1dxMdyD9ZrFyeB+EzwI6HAfB31zuP5NP6eTrfQ
   keHlrvhqW2idgWOf0Je3efmtJSsHJG6JIJIgh/aEyQbgiCUJ4pt+6BcPw
   NCzX9Egri2EOhpZ3YPe2v6g/Bz1i6AqW/2ftB/IXoKeT44C/3Nmds6w3L
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="323302706"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; 
   d="scan'208";a="323302706"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 23:18:57 -0700
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; 
   d="scan'208";a="527266264"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 23:18:55 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 88C4C2030F;
        Thu, 14 Apr 2022 09:18:53 +0300 (EEST)
Date:   Thu, 14 Apr 2022 09:18:53 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Yunke Cao <yunkec@google.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Daniel Scally <djrscally@gmail.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: entity: skip non-data link when removing reverse
 links
Message-ID: <Yle8zUUjbVW392Gc@paasikivi.fi.intel.com>
References: <20220412062313.1645762-1-yunkec@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412062313.1645762-1-yunkec@google.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yunke,

Thanks for the patch.

On Tue, Apr 12, 2022 at 03:23:13PM +0900, Yunke Cao wrote:
> The original implementation removes reverse links for any input link and
> assumes the presense of sink/source.
> It fails when the link is a not a data link.
> media_entity_remove_links when there's an ancillary link can also fail.

The function's return type is void. Are there other adverse effects from
this? Looking at the function, it would seem like that the reverse link
simply isn't found in this case, and so not removed.

> 
> We only need to remove reverse links for a data link.

Ideally this would not be based on the link flags as it's not a very robust
way to test whather a backlink needs to be removed.

> 
> Signed-off-by: Yunke Cao <yunkec@google.com>
> ---
>  drivers/media/mc/mc-entity.c | 34 +++++++++++++++++++---------------
>  1 file changed, 19 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 1ff60d411ea9..11f5207f73aa 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -597,26 +597,30 @@ static void __media_entity_remove_link(struct media_entity *entity,
>  	struct media_link *rlink, *tmp;
>  	struct media_entity *remote;
>  
> -	if (link->source->entity == entity)
> -		remote = link->sink->entity;
> -	else
> -		remote = link->source->entity;
> +	/* Remove the reverse links for a data link. */
> +	if ((link->flags & MEDIA_LNK_FL_LINK_TYPE) == MEDIA_LNK_FL_DATA_LINK) {
> +		if (link->source->entity == entity)
> +			remote = link->sink->entity;
> +		else
> +			remote = link->source->entity;
>  
> -	list_for_each_entry_safe(rlink, tmp, &remote->links, list) {
> -		if (rlink != link->reverse)
> -			continue;
> +		list_for_each_entry_safe(rlink, tmp, &remote->links, list) {
> +			if (rlink != link->reverse)
> +				continue;
>  
> -		if (link->source->entity == entity)
> -			remote->num_backlinks--;
> +			if (link->source->entity == entity)
> +				remote->num_backlinks--;
>  
> -		/* Remove the remote link */
> -		list_del(&rlink->list);
> -		media_gobj_destroy(&rlink->graph_obj);
> -		kfree(rlink);
> +			/* Remove the remote link */
> +			list_del(&rlink->list);
> +			media_gobj_destroy(&rlink->graph_obj);
> +			kfree(rlink);
>  
> -		if (--remote->num_links == 0)
> -			break;
> +			if (--remote->num_links == 0)
> +				break;
> +		}
>  	}
> +
>  	list_del(&link->list);
>  	media_gobj_destroy(&link->graph_obj);
>  	kfree(link);

-- 
Kind regards,

Sakari Ailus
