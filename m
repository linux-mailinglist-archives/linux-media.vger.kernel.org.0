Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F09441329CA
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 16:17:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728258AbgAGPRG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jan 2020 10:17:06 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:46374 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727880AbgAGPRG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jan 2020 10:17:06 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 007F9r0U013800;
        Tue, 7 Jan 2020 15:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=Say3XTIhs6nXkbS1lnDzdEp36ppxZZXiHKXD2fXO7f0=;
 b=c7GBA789r9+cmxzI3kHJ/fQSrCd/3r1Ac2PcSY8pXNJtYzvXl6QaupOLOkruqBReEie7
 AbhPI5S4neVcPYt0646GQDhGdGmFsKDN7DkYT1JkTjsm/o/D2rUDag8EVDwQHCjBzFNA
 1eHZ/P/Wrm4CF52Q3LEPf0y9/dc1Za74vxyN8C1+M9sFUIIqThOYr8pBaaM6T15L2iYJ
 PI2ybKXl5+YOAxnyB3r/kKejrUoZm5sW60jDxiGGbngOzvm88bBMyIrKpoLnA/cZNMA3
 F6WQLCjrhr3ZdabjHs3JfiDBgg6RUHlTrjSTcByyaHU/Gn9casqlDaDAMqk+w3snqHjh Ag== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 2xakbqp1v3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 07 Jan 2020 15:17:02 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 007FEG2e073138;
        Tue, 7 Jan 2020 15:17:02 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 2xcpcqfevx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 07 Jan 2020 15:17:01 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 007FGxCV012709;
        Tue, 7 Jan 2020 15:17:00 GMT
Received: from kadam (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 07 Jan 2020 07:16:59 -0800
Date:   Tue, 7 Jan 2020 18:16:51 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     linux-block <linux-block@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [bug report] compat_ioctl: move CDROM_SEND_PACKET handling into
 scsi
Message-ID: <20200107151651.GA27042@kadam>
References: <20200107084659.uyaucu73yd5rhim3@kili.mountain>
 <CAK8P3a1iUADRcjWEMZjVuCKyESXA7fHEypvFK7vEQ0CseXfmtg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1iUADRcjWEMZjVuCKyESXA7fHEypvFK7vEQ0CseXfmtg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9492 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001070126
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9492 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001070126
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 07, 2020 at 04:03:12PM +0100, Arnd Bergmann wrote:
> On Tue, Jan 7, 2020 at 9:49 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > Hello Arnd Bergmann,
> >
> > The patch f3ee6e63a9df: "compat_ioctl: move CDROM_SEND_PACKET
> > handling into scsi" from Nov 28, 2019, leads to the following static
> > checker warning:
> >
> >         block/scsi_ioctl.c:703 scsi_put_cdrom_generic_arg()
> >         warn: check that 'cgc32' doesn't leak information (struct has a hole after 'data_direction')
> >
> > block/scsi_ioctl.c
> >    686  static int scsi_put_cdrom_generic_arg(const struct cdrom_generic_command *cgc,
> >    687                                        void __user *arg)
> >    688  {
> >    689  #ifdef CONFIG_COMPAT
> >    690          if (in_compat_syscall()) {
> >    691                  struct compat_cdrom_generic_command cgc32 = {
> >    692                          .buffer         = (uintptr_t)(cgc->buffer),
> >    693                          .buflen         = cgc->buflen,
> >    694                          .stat           = cgc->stat,
> >    695                          .sense          = (uintptr_t)(cgc->sense),
> >    696                          .data_direction = cgc->data_direction,
> >    697                          .quiet          = cgc->quiet,
> >    698                          .timeout        = cgc->timeout,
> >    699                          .reserved[0]    = (uintptr_t)(cgc->reserved[0]),
> >    700                  };
> >
> > It's possible that initializations like this don't clear out the struct
> > hole but I haven't seen a compiler which is affected.  So maybe it's
> > fine?
> 
> I thlought we already rely on this to initialize the entire structure, but
> trying out a test case shows that it does happen:

There aren't that many cases where we rely on it to happen.  Under 20
so far as Smatch can detect.  I'm not really certain what the correct
approach is to deal with them...  I think they pretty much all work
fine with existing compilers.

regards,
dan carpenter

