Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1894236D379
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 09:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231635AbhD1Hy3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 03:54:29 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:59886 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229643AbhD1Hy2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 03:54:28 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13S7rL8e002509;
        Wed, 28 Apr 2021 07:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=AKjr5Mo/adx/g8/qcHycfBQ5/KxoVEwsWbF6MXeqaAY=;
 b=GC+7KIp40xm5AzbROZ8bEHHNTSgU+5byZl9+xLkFtXSL5nMpjIC1zIzYnLbuuMc3cCDq
 RzbB73PtCZisn9hRiVf4OtrpMCV2v0ZBoM69EGFk5YM6YJ2XK/6OsauCgtuH4fEL8rZQ
 bZEd/xH77HzllDFsnzzJVb0bMhBL8fs5ecRMG4kboXQ9vaIGGa5HE5SEov6eFvyvFWOl
 C4S+eLvpheT5yJXdovaVNxjxw8RHqZCj02nGT4qZaq3YKCe5PQyoAuamolJlXa8eB278
 01GNiQnzvzKwO5k/Gma97C4X5BUllF1mGlofJ2k3vBNOE2G7OK6MDKAUB4LvF92CILIE vQ== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 385sgq91tf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 28 Apr 2021 07:53:33 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 13S7p1qf156396;
        Wed, 28 Apr 2021 07:53:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 384b58238h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 28 Apr 2021 07:53:32 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13S7rW2R166987;
        Wed, 28 Apr 2021 07:53:32 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 384b582384-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 28 Apr 2021 07:53:32 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 13S7rUdk023886;
        Wed, 28 Apr 2021 07:53:31 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 28 Apr 2021 00:53:30 -0700
Date:   Wed, 28 Apr 2021 10:53:23 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Fabio Aiuto <fabioaiuto83@gmail.com>
Cc:     Deepak R Varma <mh12gx2825@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] staging: media: atomisp: reformat code comment blocks
Message-ID: <20210428075323.GP1981@kadam>
References: <cover.1618859059.git.drv@mailo.com>
 <7cf7b8253550460e7273c94bae005939000679fd.1618859059.git.drv@mailo.com>
 <20210420084448.GC1411@agape.jhs>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210420084448.GC1411@agape.jhs>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: d1KBNGNDMsVudIB_tINeTfsVoRLkojPf
X-Proofpoint-ORIG-GUID: d1KBNGNDMsVudIB_tINeTfsVoRLkojPf
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 20, 2021 at 10:44:48AM +0200, Fabio Aiuto wrote:
> On Tue, Apr 20, 2021 at 12:45:04AM +0530, Deepak R Varma wrote:
> >  	switch(AnalogGain)
> >  	{
> >  	case 0:
> > @@ -1069,8 +1071,9 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
> >  	*/
> >  	if (DigitalGain >= 16 || DigitalGain <= 1)
> >  		DigitalGain = 1;
> > -	/* AnalogGainToWrite =
> > -		(u16)((DigitalGain << 12) | AnalogGainToWrite); */
> > +
> > +	/* AnalogGainToWrite = (u16)((DigitalGain << 12) | AnalogGainToWrite);
> > +	 */
> 
> this is best recommended for one line comment:
> 
> /* AnalogGainToWrite = (u16)((DigitalGain << 12) | AnalogGainToWrite); */
> 

I'm going through old emails...

Just delete all commented out code.

regards,
dan carpenter

