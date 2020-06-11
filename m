Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3BC1F65F6
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2020 12:52:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbgFKKwM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jun 2020 06:52:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726995AbgFKKwL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jun 2020 06:52:11 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA767C08C5C1;
        Thu, 11 Jun 2020 03:52:10 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 8DEC3634C87;
        Thu, 11 Jun 2020 13:51:58 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jjKoQ-0000NQ-3p; Thu, 11 Jun 2020 13:51:58 +0300
Date:   Thu, 11 Jun 2020 13:51:58 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/5] uapi/linux/media.h: add flags field to struct
 media_v2_topology
Message-ID: <20200611105157.GE805@valkosipuli.retiisi.org.uk>
References: <20200610230541.1603067-1-niklas.soderlund+renesas@ragnatech.se>
 <20200610230541.1603067-2-niklas.soderlund+renesas@ragnatech.se>
 <20200611031226.GE13598@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200611031226.GE13598@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 11, 2020 at 06:12:26AM +0300, Laurent Pinchart wrote:
> > diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> > index 383ac7b7d8f07eca..7c07b9939252c768 100644
> > --- a/include/uapi/linux/media.h
> > +++ b/include/uapi/linux/media.h
> > @@ -351,7 +351,7 @@ struct media_v2_topology {
> >  	__u64 topology_version;
> >  
> >  	__u32 num_entities;
> > -	__u32 reserved1;
> > +	__u32 flags;
> >  	__u64 ptr_entities;
> >  
> >  	__u32 num_interfaces;
> > @@ -367,6 +367,8 @@ struct media_v2_topology {
> >  	__u64 ptr_links;
> >  } __attribute__ ((packed));
> >  
> > +#define MEDIA_TOPOLOGY_FLAG_COMPLETE	(1 << 0)
> > +
> 
> Missing documentation :-)
> 
> Should we use the BIT() macro ?

No, it's uAPI.

-- 
Sakari Ailus
