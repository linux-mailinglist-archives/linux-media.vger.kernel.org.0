Return-Path: <linux-media+bounces-58971-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKlPC9zp4WmKzgAAu9opvQ
	(envelope-from <linux-media+bounces-58971-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 10:05:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C176841860F
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 10:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 601303021A3B
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 08:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA4439A05E;
	Fri, 17 Apr 2026 08:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvXfTkxP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F748376497
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 08:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776413141; cv=none; b=BSCe7uT7fJhfvnO0FNsg2GkJSDsH5RQSjdtUBDii0rA+WmArzQobWDuCcXAn+LphldDwCD80oorxUP4Ecz+8uvyeHjNcKA0mjZUpWsxmccKviXT9VKSnZ98j/gw+7hiVPteIAILe0va1v1A5dMbThczcfpXoyU/5xeZihcNHDQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776413141; c=relaxed/simple;
	bh=1AwS8Ldg92WK4KkmlNu1UjhcVxODuBNMsNe67KvbGDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SP6qfFqGz7NttIkkIwxNy3INHaWx3J2jFodNvDb88MJHNbNvsmcPl9Kxa4X7usypYyROh/0CBnzRjMrvxINQj6axz722xrMKLsrHO/KwmHq5QyGUeH3I480SMjsRTnE7bfxJ0xiVDADYq3/aP6NNuOCC1WXb4GskRNpdjILG/64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fvXfTkxP; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-482f454be5bso14306805e9.0
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 01:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776413139; x=1777017939; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GujTxUaku0DnUDB+OcwhQi4lfujIDMhc7CTwSfLTqrM=;
        b=fvXfTkxP/EnFWfPP5IYRcG0+toW+tFbHsCiKhIW65QwtZosdXIzKkG6i5QYlptndr2
         1q5xjqjLhzthsP6yf79LeiMLOFShaAZRpK98/vPO/uCcl3jxS245DfvhtYTtpdYoNMKM
         wHEA8IhZuef9lkVQOxscBWCx4o9LmeiCllGJlKIUd4hZQU+0mTezfskb7DAku8VAdogi
         cO3cJLDWD+Ss4aq751vBEgKhBCoFzEdEKGCpQGCyIPpaJRUs5stD+84sFXzoLNND6I9d
         Ca3TkZT3kJF5wz/TYnULrZgJLe5YIwj2Ax73I7kTobL+QxWMcONpC6HeFxSX38SLqc13
         +UQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776413139; x=1777017939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GujTxUaku0DnUDB+OcwhQi4lfujIDMhc7CTwSfLTqrM=;
        b=bDGXYo9i2BLGAZsJQHGQ4yMP+YU0uVLboD22mZYKk2trLgGHJk7YPNgCjDE8Idm7VJ
         V65+IBr0mtiQ+9HGNBkTsDroSBKV+FmdVpQ4IMHYJEIj2LOwKMN2AdDhhAZWldvW0pWq
         FTlc4P07vL+RP4lvM9mvGH7qeu6j6aN/0MDOOwIS7OS7Pl7JCBHgMKrozKmVpW9l2lU0
         gQmH/29oHBxWqur211LjmGTNVSh6sCVlzFpGcHDmQe6S/u/TRRrM/xt+h6Seu4Ag2mU+
         4YMxqb15PBIxCZCH+G4OV4bfTnI7kqyKxRsBAZcOm8fN3jbwhlUqarydBfXaJgVV44ri
         zRaQ==
X-Forwarded-Encrypted: i=1; AFNElJ+kXHVZx5fK0tcEuTwaRxE2BjSDe9Jh2bnblkq6rN9SbbTVjiLmjOKCQ8zSkLAUfFN/63tSbgDcxi9j2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVgoej03DWxKnn8QEZcQEpZ9yDO1M4ic7zbaBz4eUTsKeQdN1C
	2pl/joLNZqjqkfingIlaHTWHvFAhiwW+GKlgyL4PxSFQf8fcqpHeyqUE
X-Gm-Gg: AeBDievJuVdj+4lPtsqxXTthccHZafx59XHZpDn7+klIViSvj9V4AxN2SXp/4JwmKB8
	UG0t+lTD3cGI7KuFfS9QbExr6Tqtoqnuf0ub1fGOmxLSxHOPYBUzKbcbgfwX0Fq/iA6m4wMzLl0
	x/sRecTUnFwNlFNqyi9S86saT6u1wUaRL1oNfSBUDK5kGvrXDrR+jMKV4In1prT87KC6B2vA4Di
	4COhxqW2aGNF0DmjChcD/8LVNd94/euimc+zwhHVaPuJ1/SUsLSrVWQfGgt6mhDyEDMRvjAu1x4
	AmMclNeY6qX9/KNGwH2VPex85VuLXNefjvymzVpRH0mhW1thPVjUL9GV8eyzguxYwI4+I5Xos5n
	JONyGHHM4TGq2LHMa4n6sywklBs2+Y5/co/F/mnvfXn0Zd0AjvsYhZf6tL0QnQP7gjTxVmYafkl
	YjLrwrXb377mKWkIMdjDDw52lgSIYQEA==
X-Received: by 2002:a05:600c:870e:b0:488:aa33:dc8f with SMTP id 5b1f17b1804b1-488fb84ffb8mr22012425e9.0.1776413138495;
        Fri, 17 Apr 2026 01:05:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1070bfsm25752445e9.7.2026.04.17.01.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 01:05:37 -0700 (PDT)
Date: Fri, 17 Apr 2026 11:05:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: Huihui Huang <hhhuang@smu.edu.sg>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: ipu7: fix boot_config leak on
 queue_mem failure
Message-ID: <aeHpzkBvclNESSUv@stanley.mountain>
References: <20260416074800.2493565-1-hhhuang@smu.edu.sg>
 <20260417073939.2686170-1-hhhuang@smu.edu.sg>
 <aeHo2WOF1Rcp9zwf@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeHo2WOF1Rcp9zwf@stanley.mountain>
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[smu.edu.sg:email];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	TAGGED_FROM(0.00)[bounces-58971-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.080];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_SPF_ALLOW(0.00)[+ip4:172.232.135.74:c];
	TAGGED_RCPT(0.00)[linux-media];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smu.edu.sg:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,stanley.mountain:mid]
X-Rspamd-Queue-Id: C176841860F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 11:01:29AM +0300, Dan Carpenter wrote:
> On Fri, Apr 17, 2026 at 03:39:39PM +0800, Huihui Huang wrote:
> > There is a memory leak in drivers/staging/media/ipu7/ipu7-boot.c.
> > 
> > In ipu7_boot_init_boot_config(), boot_config is allocated by
> > ipu7_dma_alloc(). If the second ipu7_dma_alloc() for queue_mem fails,
> > the function returns -ENOMEM without freeing the previously allocated
> > boot_config.
> > 
> > Add the missing ipu7_dma_free() call before returning on the error
> > path.
> > 
> > Signed-off-by: Huihui Huang <hhhuang@smu.edu.sg>
> > ---
> > v2: Reword commit message in imperative mood. Remove unnecessary
> >     NULL assignment on the error path.
> > ---
> >  drivers/staging/media/ipu7/ipu7-boot.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/staging/media/ipu7/ipu7-boot.c b/drivers/staging/media/ipu7/ipu7-boot.c
> > index d7901ff78b38..495b3e05a9b1 100644
> > --- a/drivers/staging/media/ipu7/ipu7-boot.c
> > +++ b/drivers/staging/media/ipu7/ipu7-boot.c
> > @@ -263,6 +263,8 @@ int ipu7_boot_init_boot_config(struct ipu7_bus_device *adev,
> >  					   GFP_KERNEL, 0);
> >  	if (!syscom->queue_mem) {
> >  		dev_err(dev, "Failed to allocate queue memory.\n");
> > +		ipu7_dma_free(adev, adev->boot_config_size,
> > +			      adev->boot_config, adev->boot_config_dma_addr, 0);
> >  		return -ENOMEM;
> 
> Adding a free here leads to a double free.  It's the same issue.
> One magical cleanup function in the caller.
> 
> I haven't looked at this but I bet there are bugs in the error handling
> since magical cleanup functions are always buggy.

Btw, if you had kept the "adev->boot_config = NULL;" assignment that
you had in v1 then that would have prevented the double free since
ipu7_boot_release_boot_config() tests for that...  This information is
not useful to you at this point but I'm sure you will find it
frustrating.  :P

regards,
dan carpenter


