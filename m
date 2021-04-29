Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47F9A36EAF2
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 14:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236278AbhD2M4L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 08:56:11 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:37160 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235908AbhD2M4K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 08:56:10 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13TCrjmq067316;
        Thu, 29 Apr 2021 12:55:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=/v0hnkc5VQ//MlMo9LHLiozP+/cPjSQg2GVarccDiBc=;
 b=muXDhUBJWUKqel/l12/uolsHfdylq2i+gzgVIYkcwBKq0WHRW2kQI44zHj+rBF1VPLUF
 oDUTlM3IaIXogzpnvaf4aJawf3YdV/W8qDG5ikcqqha5ZL5daMlrKYLiAJPE7YHeFVSr
 hiiF24W4VW7qavJR3wUcU3M0uC02MGyh7VRhlbvoZN/1+4BL9q+dpMPnKVxz+53bnzL6
 ewik1GKWPw8Dc6OiKQw7DQeb25HX3IeYmHrkCKFylA7joee8shecz9LZb1PF+CKkHTf4
 n5ZcRWCwfLYXlwvP/qa/WNk/fgvkuMpBK+fJgj2kr9DQ+j4+4oJnVy6aqIA/BCqgde06 /g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 385ahbv8ug-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Apr 2021 12:55:09 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13TCsgtu034819;
        Thu, 29 Apr 2021 12:55:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3020.oracle.com with ESMTP id 384w3w7atu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Apr 2021 12:55:08 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13TCt7Xb037433;
        Thu, 29 Apr 2021 12:55:07 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 384w3w7atc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Apr 2021 12:55:07 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 13TCt5PA020098;
        Thu, 29 Apr 2021 12:55:05 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 29 Apr 2021 05:55:05 -0700
Date:   Thu, 29 Apr 2021 15:54:56 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Deepak R Varma <drv@mailo.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, mh12gx2825@gmail.com
Subject: Re: [PATCH v1 4/6] staging: media: atomisp: reformat code comment
 blocks
Message-ID: <20210429125456.GD21598@kadam>
References: <cover.1619022192.git.drv@mailo.com>
 <efdd8910b519dd55838570c72e3ce35e063f4a11.1619022192.git.drv@mailo.com>
 <20210429100808.GZ1981@kadam>
 <YIqZHWkHi8HWnF0C@192.168.1.8>
 <20210429114304.GC21598@kadam>
 <YIqesrvl3lFwWDhV@192.168.1.8>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIqesrvl3lFwWDhV@192.168.1.8>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: N2_4Q6ChWtfiM-SugcsYx30q84eG2wU0
X-Proofpoint-ORIG-GUID: N2_4Q6ChWtfiM-SugcsYx30q84eG2wU0
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9969 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104290088
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 29, 2021 at 05:25:30PM +0530, Deepak R Varma wrote:
> On Thu, Apr 29, 2021 at 02:43:04PM +0300, Dan Carpenter wrote:
> > On Thu, Apr 29, 2021 at 05:01:41PM +0530, Deepak R Varma wrote:
> > > On Thu, Apr 29, 2021 at 01:08:09PM +0300, Dan Carpenter wrote:
> > > > On Wed, Apr 21, 2021 at 10:26:09PM +0530, Deepak R Varma wrote:
> > > > > @@ -1044,7 +1048,7 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
> > > > >  	}
> > > > >  
> > > > >  	/*
> > > > > -	// set analog/digital gain
> > > > > +	 * set analog/digital gain
> > > > >  	switch(AnalogGain)
> > > > >  	{
> > > > >  	case 0:
> > > > 
> > > > How on earth does this compile?
> > > 
> > > There is a closing */ down under after the entire switch block. The
> > > change I made is within the comment block. I have compiled the built the
> > > driver successfully.
> > 
> > Oh...  Duh.  I thought you converted the // to /*.  This patch doesn't
> > make any sense though because originally it was commented out code, but
> > now it's a commented out ball of code and notes.
> 
> No problem. It looks wrong with the limited lines in diff. Appreciate
> you looking at it though.
> 

Yeah.  That's fine by me.

> Is it okay if I send in a separate patch with comment clean up? There
> are several #if 0 code block directives for this driver that I believe can
> be taken off as well. Should I clean those up as well?

Yep.  Delete those as well.

regards,
dan carpenter

