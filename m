Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F1A3375635
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235014AbhEFPIO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:08:14 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:52564 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234918AbhEFPIL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 May 2021 11:08:11 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 146F0SjN152944;
        Thu, 6 May 2021 15:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=LdNFXLZvIrWNeAXvM8wGQFKUXDBQOjYA9/qHDh84w7Y=;
 b=cnDl7rQX2qZBzuBhqsSJFDPiaLix+S21ov8jtqBnh+mYnOOsrP0A4fZw+kJ44PNvN522
 Ggn36xyHp3bD03Ku+Wbvow+VCIueGiHa3VWtatIgIIxAi1jQWS1GYbeJrvVePm0hdDOt
 yRLLyOQXqip9YCo6yUoUKVUv5U1jJ4ISXlTC9V4AiZCTr0SWf+ug8+L1suf7SihOVyjU
 xj2Jt5eaTNGV/lRnSZacVEXS8Pb/1g9KPZjzMAbzAv9PnjN19oV0DVKTKnfHQ4UW7Sdx
 59/MV70atRuqcVYGzrlbOo7dzrQ8FmsTXPqnrOcW4Pbp0a0jtBADHM3tk6ESEMd5HHsY fA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 38bebc5bff-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 06 May 2021 15:07:05 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 146F1MHP012619;
        Thu, 6 May 2021 15:07:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 38bebvfgc9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 06 May 2021 15:07:05 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 146F62TM045877;
        Thu, 6 May 2021 15:07:04 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 38bebvfgbk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 06 May 2021 15:07:04 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 146F738w031942;
        Thu, 6 May 2021 15:07:03 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 06 May 2021 08:07:02 -0700
Date:   Thu, 6 May 2021 18:06:55 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Uladzislau Rezki <urezki@gmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: [syzbot] WARNING in __vmalloc_node_range
Message-ID: <20210506150655.GD1955@kadam>
References: <000000000000fdc0be05c1a6d68f@google.com>
 <20210506142210.GA37570@pc638.lan>
 <20210506145722.GC1955@kadam>
 <CACT4Y+bEpri=MaveEOSeGGa3i-hwVgt3Cq13GMQxPLWu7g+ThA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+bEpri=MaveEOSeGGa3i-hwVgt3Cq13GMQxPLWu7g+ThA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: ugl8PibTVt-L5ke14gFtMgCVzSchfDh7
X-Proofpoint-GUID: ugl8PibTVt-L5ke14gFtMgCVzSchfDh7
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9976 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 spamscore=0 adultscore=0 clxscore=1011 mlxscore=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2105060108
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 06, 2021 at 05:00:41PM +0200, 'Dmitry Vyukov' via syzkaller-bugs wrote:
> On Thu, May 6, 2021 at 4:57 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > On Thu, May 06, 2021 at 04:22:10PM +0200, Uladzislau Rezki wrote:
> > > Seems like vmalloc() is called with zero size passed:
> > >
> > > <snip>
> > > void *__vmalloc_node_range(unsigned long size, unsigned long align,
> > >                       unsigned long start, unsigned long end, gfp_t gfp_mask,
> > >                       pgprot_t prot, unsigned long vm_flags, int node,
> > >                       const void *caller)
> > > {
> > >       struct vm_struct *area;
> > >       void *addr;
> > >       unsigned long real_size = size;
> > >       unsigned long real_align = align;
> > >       unsigned int shift = PAGE_SHIFT;
> > >
> > > 2873  if (WARN_ON_ONCE(!size))
> > >               return NULL;
> > > <snip>
> > >
> > > from the dvb_dmx_init() driver:
> > >
> > > <snip>
> > > int dvb_dmx_init(struct dvb_demux *dvbdemux)
> > > {
> > >       int i;
> > >       struct dmx_demux *dmx = &dvbdemux->dmx;
> > >
> > >       dvbdemux->cnt_storage = NULL;
> > >       dvbdemux->users = 0;
> > > 1251  dvbdemux->filter = vmalloc(array_size(sizeof(struct dvb_demux_filter),
> > > <snip>                                              dvbdemux->filternum));
> >
> > Indeed.
> >
> > It is a mystery because array_size() should never return less than
> > sizeof(struct dvb_demux_filter).  That's the whole point of the
> > array_size() function is that it returns ULONG_MAX if there is an
> > integer overflow.
> 
> But it will return 0 if dvbdemux->filternum==0, right?
> 

Heh...  I'm an idiot.  I was thinking of struct_size().  Sorry.

regards,
dan carpenter

