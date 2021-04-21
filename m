Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA160367210
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 19:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245065AbhDURyr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 13:54:47 -0400
Received: from msg-2.mailo.com ([213.182.54.12]:34880 "EHLO msg-2.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245062AbhDURyq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 13:54:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619027511; bh=KmEs2Jw6W/Sa4tMaUwVQoGqFAg9/D9hlUcgxz6/4Ibk=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=GPdsuvzdILH348+ILnSMZVmzUPuy1UDE9Q05gp16riuDrm/MEcaI4tgHuiVgznDnZ
         GZNRZ3ZZRybuH2/3JGVpHQoYAXNNpWMvhJyVW42bv+JUf1g3NSG/B4lj62rXYPoXUL
         IAUQYHDOZVpSn5IFFZolzidrL9hIvj7GHReHfUOQ=
Received: by 192.168.90.13 [192.168.90.13] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Wed, 21 Apr 2021 19:51:50 +0200 (CEST)
X-EA-Auth: cOEA2r8N0tvh3q22alNot4CePdoQ85+cXUuZoHT8f0oww9NMENQ2f4wp0ZpWxPGTUsiffL2YbcygWEFaYFaNOX6tRmtGwkFE
Date:   Wed, 21 Apr 2021 23:21:44 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Fabio Aiuto <fabioaiuto83@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, mh12gx2825@gmail.com
Subject: Re: [PATCH v1 4/6] staging: media: atomisp: reformat code comment
 blocks
Message-ID: <20210421175144.GA224467@localhost>
References: <cover.1619022192.git.drv@mailo.com>
 <efdd8910b519dd55838570c72e3ce35e063f4a11.1619022192.git.drv@mailo.com>
 <20210421171045.GB1414@agape.jhs>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210421171045.GB1414@agape.jhs>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 21, 2021 at 07:10:46PM +0200, Fabio Aiuto wrote:
> On Wed, Apr 21, 2021 at 10:26:09PM +0530, Deepak R Varma wrote:
> > Reformat code comment blocks according to the coding style guidelines.
> > This resolves different checkpatch script WARNINGs around block comments.
> > 
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > ---
> > 
> > Changes in v1:
> >    - implement following changes suggested by Fabio Aiuto                              
> >        a. Corrected commenting style                                                               
> >        b. Similar style implemented for other comment blocks in                                    
> >           the same files.                                       
> 
> If you want to tag me you should add the Suggested-by: tag in commit message
> before Signed-off-by tag...
> 
> $ vim +485 Documentation/process/submitting-patches.rst

Yes, perfect. I will tag you in v3 accordingly.

Thank you.
deepak.

> 
> thank you,
> 
> fabio


