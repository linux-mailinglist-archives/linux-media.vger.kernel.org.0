Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3FA5B7392
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2019 08:57:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731103AbfISG5K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Sep 2019 02:57:10 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:46264 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbfISG5J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Sep 2019 02:57:09 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8J6roDM092821;
        Thu, 19 Sep 2019 06:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=ty/R+tqGV2wRl7yqxixcHvAVmjcsptBtUQFz1cn/vUQ=;
 b=CnqHXzbtrH0O8kUBDgw64RY0nnK4Sq/qL/j1OjHOydCfzaqEOtL4NXQZgfn/EMeEJHzb
 /ElfIg+rRbVVkPWqlfHItkiPxKNTs8nHZci++7bcZfWdAJyMRPXjgv9ZsQJgnREKV3i1
 scg5CGFu/Dt81tRZWQ9H/QueX6zhhQvWKKh6Y61WpLOmi3ZNVyKMrCAZDSFhwnK0xbQW
 YX+mb9ImzNfg4yzwgz0fO9j+Czhlndu3RAX2/W2wV2KnfgP7jsJp1g+mF8HYUaX1hO31
 Ke54OMzK9sptk3OENQqLm4Wxx3fLDTugXkWaVG7jj6BBuvyUPZHlM8CHzRIhXDMFwYIV bg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 2v3vb51r96-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 19 Sep 2019 06:56:57 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8J6roZM168035;
        Thu, 19 Sep 2019 06:56:57 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 2v3vb4x2v8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 19 Sep 2019 06:56:56 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x8J6urfI021115;
        Thu, 19 Sep 2019 06:56:54 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 19 Sep 2019 06:56:53 +0000
Date:   Thu, 19 Sep 2019 09:56:44 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        ksummit-discuss@lists.linuxfoundation.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [Ksummit-discuss] [PATCH] media: add a subsystem profile
 documentation
Message-ID: <20190919065447.GF2959@kadam>
References: <156821693963.2951081.11214256396118531359.stgit@dwillia2-desk3.amr.corp.intel.com>
 <434c05bddd2b364e607e565227487910a8dd9793.1568391461.git.mchehab+samsung@kernel.org>
 <20190918123620.GA6306@pendragon.ideasonboard.com>
 <20190918105728.24e7eb48@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190918105728.24e7eb48@coco.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9384 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909190064
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9384 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909190064
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 18, 2019 at 10:57:28AM -0300, Mauro Carvalho Chehab wrote:
> > > +Patches for the media subsystem should be sent to the media mailing list
> > > +at linux-media@vger.kernel.org as plain text only e-mail. Emails with
> > > +HTML will be automatically rejected by the mail server. There's no need
> > > +to copy the maintainer or sub-maintainer(s).  
> > 
> > There's too much traffic on mailing lists for me to follow everything, I
> > much prefer being CC'ed on patches.
> 
> Well, by using patchwork, the best is to take a look on it at least for
> the patches that you're interested. You could script something using
> pwclient in order to make it easier.
> 
> Anyway, not sure if the other sub-maintainers see the same way. From my side,
> I prefer not to be c/c, as this is just more noise, as I just rely on
> patchwork for media patches. What about changing this to:
> 
> 	Patches for the media subsystem should be sent to the media mailing list
> 	at linux-media@vger.kernel.org as plain text only e-mail. Emails with
> 	HTML will be automatically rejected by the mail server. It could be wise 
> 	to also copy the sub-maintainer(s).

The documentation should say "Use get_maintainer.pl" and do what it
says.  Everything else is too complicated.

Occasionally staging maintainers will complain that they aren't CC'd
even though the staging/driver/README says to CC them and I am tell them
"No, the responsibility is for you to add yourself to MAINTAINERS.  It
doesn't matter what the documentation says, you messed up so you need to
stop getting annoyed with newbies for not reading the documentation when
it's your fault you weren't CC'd."

When I sent a patch, I use get_maintainer.pl then I add whoever the
wrote the commit from the Fixes tag.  Then I remove Colin King and Kees
Cook from the CC list because they worked all over the tree and I know
them.  I also normally remove LKML if there is another mailing list but
at least one subsystem uses LKML for patchwork so this isn't safe.

So the safest instructions are "Use get_matainer.pl and add the person
who wrote the commit in the Fixes tag".

regards,
dan carpenter


