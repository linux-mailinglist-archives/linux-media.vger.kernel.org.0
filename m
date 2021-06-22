Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77FBC3B09B8
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 17:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232305AbhFVQBa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 12:01:30 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:30760 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231936AbhFVQB3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 12:01:29 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15MFpQqQ023812;
        Tue, 22 Jun 2021 15:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=ED5iyeezQwP9/QrsPW/S4yjxx/rYY+YkA3oHNCLyP4I=;
 b=v+KXrFfVAtoP2i6l3xQvMK7MBoCvO8MHlplziyN8lTQ6nqQNnhKE5aPyuxQiRWnH7Akj
 beTWo1VR7dPJL5RnyY+j2wbG/QBk3350+rnDiayxTbLQ4YLbKzoFTIQdddp68OTgV98x
 A75v9rncvHY9WneUoTlqPl/0r7YGs9T7IFk8qk6Un2C0r3JlcjVTWd9CKZtObEEQ/3vZ
 ih46DilR/4iMqd1Rp5hUKIDd+zqVr4mByNsBcCld8md30iymwGLTX+fA7ClI4FOqoIMt
 tz111VFCkZMFKtD+VfElwAV0nGuit0JijRytO+NeBT+v10JZayrEA5qKqHrOOFfjPOV1 vQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 39as86ubdk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 22 Jun 2021 15:59:09 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15MFpqlW047254;
        Tue, 22 Jun 2021 15:59:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3020.oracle.com with ESMTP id 399tbsyjkj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 22 Jun 2021 15:59:07 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15MFwxUl076818;
        Tue, 22 Jun 2021 15:59:07 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 399tbsyjk3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 22 Jun 2021 15:59:07 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 15MFx5BH010749;
        Tue, 22 Jun 2021 15:59:05 GMT
Received: from kadam (/102.222.70.252)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 22 Jun 2021 15:59:05 +0000
Date:   Tue, 22 Jun 2021 18:58:58 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-subdev: fix some NULL vs IS_ERR() checks
Message-ID: <20210622155858.GN1861@kadam>
References: <YNH0WU7BcQ/60UNG@mwanda>
 <YNH87qd4eJOR296R@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNH87qd4eJOR296R@pendragon.ideasonboard.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: vV7IEPK0QWG9SP5aW84Tsz2E7S1sToF9
X-Proofpoint-GUID: vV7IEPK0QWG9SP5aW84Tsz2E7S1sToF9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 22, 2021 at 06:08:30PM +0300, Laurent Pinchart wrote:
> Hi Dan,
> 
> Thank you for the patch.
> 
> On Tue, Jun 22, 2021 at 05:31:53PM +0300, Dan Carpenter wrote:
> > The v4l2_subdev_alloc_state() function returns error pointers, it
> > doesn't return NULL.
> 
> It's funny you send this patch today, I've been thinking about the exact
> same issue yesterday, albeit more globally, when trying to figure out if
> a function I called returned NULL or an error pointer on error.
> 
> Would it make to create an __err_ptr annotation to mark functions that
> return an error pointer ? This would both give a simple indication to
> the user and allow tools such as smatch to detect errors.
> 

If you have the cross function DB enabled then Smatch can figure out if
it returns error pointers or NULL.  The big problem is that Smatch works
on the precompiled code and doesn't understand ifdeffed code.

I haven't pushed all the Smatch checks.  I told someone last month, I'd
give them a month to fix any bugs since it was their idea.  But I'll
push it soon.

#if IS_ENABLED(CONFIG)
function returns error pointer or valid
#else
struct foo *function() { return NULL; }
#endif

I believe that there are also people who use a two pass Coccinelle
system where they make a list of functions that return error pointers
and then check the callers.

The Huawei devs find a bunch of these bugs through static analysis but
I don't know which tools they are using.

Today, I accidentally introduced a bug by converting a call that can
"in theory/the future return error pointers" but also returns NULL at
the end of a list.  I thought it was only supposed to be checked for
NULLs.  Fortunately Colin King found it right away.  That was just
sloppiness on my part :/ and it's pretty rare to find code like that.

regards,
dan carpenter
