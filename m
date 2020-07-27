Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C40E22F2E1
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 16:44:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728391AbgG0OoG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 10:44:06 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:42940 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727833AbgG0OoG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 10:44:06 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06REVp00042215;
        Mon, 27 Jul 2020 14:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=Bt368gAPPpp7rvvC5hFX8UQ+yv9eW0vOFZjOfPmmBL8=;
 b=BaWHlInmrtDf9J/Ey/RRm47Nq4nYhdDnJzUYiIwX+c+QwuN9x2SlXlg/jXL/YjKMNbHd
 UQM0e+id4PDquDCSSeQYapYIPwIzQ5AOa4jDYRF4s46KqKmuFU/aZ9miQngpiocUfDWt
 n5C7dC19eBX/uzochhOjEj0wjE2VXfZCOoKzVkN/52lkrq7dt0I9g5niLJEZnos4s7w7
 VZ54WfRqH86rDFkeGvWt8Vo3pBpAhNlUGVuzvNmBZ8ysUp5r05/7gTdM7tLJt7CJ/eeF
 VCzzA0FkCRiu6qrTKTjLRhZbdEX/nBp0hVUv6+9e0eDKoiSUf3pl7DjMfW85kAK+LhHW Cw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 32hu1j1xts-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 27 Jul 2020 14:43:48 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06REWbox036552;
        Mon, 27 Jul 2020 14:43:48 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 32hu5quuuc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 27 Jul 2020 14:43:47 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06REhkl7019489;
        Mon, 27 Jul 2020 14:43:46 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 27 Jul 2020 07:43:45 -0700
Date:   Mon, 27 Jul 2020 17:43:35 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Peilin Ye <yepeilin.cs@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vandana BN <bnvandana@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
Message-ID: <20200727144335.GB2571@kadam>
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com>
 <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam>
 <CAK8P3a3+9Gr6G6KDWu=iW3316O9cPH+XupBBajJaxrq20xQcyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3+9Gr6G6KDWu=iW3316O9cPH+XupBBajJaxrq20xQcyQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9694 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007270104
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9694 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 clxscore=1015 mlxscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007270104
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 27, 2020 at 04:05:38PM +0200, Arnd Bergmann wrote:
> On Mon, Jul 27, 2020 at 3:16 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > On Mon, Jul 27, 2020 at 09:25:16AM +0200, Arnd Bergmann wrote:
> > > On Mon, Jul 27, 2020 at 12:28 AM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> > > >
> > > > video_put_user() is copying uninitialized stack memory to userspace due
> > > > to the compiler not initializing holes in the structures declared on the
> > > > stack. Fix it by initializing `ev32` and `vb32` using memset().
> > > >
> > > > Reported-and-tested-by: syzbot+79d751604cb6f29fbf59@syzkaller.appspotmail.com
> > > > Link: https://syzkaller.appspot.com/bug?extid=79d751604cb6f29fbf59
> > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> > >
> > > Thanks a lot for addressing this! I now see that I actually created a similar
> > > bugfix for it back in January, but for some reason that got stuck in my
> > > backlog and I never wrote a proper description for it or sent it out to the
> > > list, sorry about that. I would hope we could find a way to have either
> > > the compiler or sparse warn if we copy uninitialized data to user space,
> > > but we now don't even check for that within the kernel any more.
> >
> > Here are my latest warnings on linux-next from Friday.
> 
> Ah, I forgot you had that kind of list already, thanks for checking!
> 
> > block/scsi_ioctl.c:707 scsi_put_cdrom_generic_arg() warn: check that 'cgc32' doesn't leak information (struct has a hole after 'data_direction')
> 
> I see no padding in this one, should be fine AFAICT. Any idea why you
> get a warning
> for this instance?
> 

The warning message only prints the first struct hole or uninitialized
struct memeber.  ->data_direction in this case.

block/scsi_ioctl.c
   646  #ifdef CONFIG_COMPAT
   647  struct compat_cdrom_generic_command {
   648          unsigned char   cmd[CDROM_PACKET_SIZE];
   649          compat_caddr_t  buffer;
   650          compat_uint_t   buflen;
   651          compat_int_t    stat;
   652          compat_caddr_t  sense;
   653          unsigned char   data_direction;

There is going to be 3 bytes of padding between this char and the next
int.

   654          compat_int_t    quiet;
   655          compat_int_t    timeout;
   656          compat_caddr_t  reserved[1];
   657  };
   658  #endif

The bug seems real, but it depends on the compiler of course.

> > drivers/input/misc/uinput.c:743 uinput_ff_upload_to_user() warn: check that 'ff_up_compat' doesn't leak information (struct has a hole after 'replay')
> 
> This one hs padding in it and looks broken.

No.  This a bug in smatch.  It's memcpy() over the hole, but the check
isn't capturing that.  The code is slightly weird...  I could try
silence the warning but it would only silence this one false positive so
I haven't investigated it.

> 
> > drivers/input/misc/uinput.c:958 uinput_ioctl_handler() warn: check that 'ff_up' doesn't leak information (struct has a hole after 'replay')
> 
> hard to tell.
> 

Looks ok, I think.

> > drivers/firewire/core-cdev.c:463 ioctl_get_info() warn: check that 'bus_reset' doesn't leak information (struct has a hole after 'generation')
> 
> broken, trivial to fix
> 
> > drivers/scsi/megaraid/megaraid_mm.c:824 kioc_to_mimd() warn: check that 'cinfo.base' doesn't leak information
> 
> Seems fine due to __packed annotation.
> 

It's not related __packed.  Smatch is saying that cinfo.base isn't
necessarily initialized.

drivers/scsi/megaraid/megaraid_mm.c
   816  
   817                  case MEGAIOC_QADAPINFO:
   818  
   819                          hinfo = (mraid_hba_info_t *)(unsigned long)
   820                                          kioc->buf_vaddr;
   821  
   822                          hinfo_to_cinfo(hinfo, &cinfo);

hinfo_to_cinfo() is a no-op if hinfo is NULL.  Smatch can't tell if
"hinfo" is non-NULL.

   823  
   824                          if (copy_to_user(kmimd.data, &cinfo, sizeof(cinfo)))
   825                                  return (-EFAULT);
   826  
   827                          return 0;
   828  

> > drivers/gpio/gpiolib-cdev.c:473 lineevent_read() warn: check that 'ge' doesn't leak information (struct has a hole after 'id')
> 
> The driver seems to initialize the elements correctly before putting
> them into the kfifo, so there is no infoleak. However the structure layout
> of "struct gpioevent_data" is incompatible between x86-32 and x86-64
> calling conventions, so this is likely broken in x86 compat mode,
> unless user space can explicitly deal with the difference.

Smatch isn't parsing kfifo_out() correctly.  It turns out that
kfifo_out() is slightly complicated for Smatch.

> 
> > drivers/gpu/drm/i915/i915_query.c:136 query_engine_info() warn: check that 'query.num_engines' doesn't leak information
> 
> I don't think this leaks any state, as it just copies data to user space that
> it copied from there originally.

Yeah.  copy_query_item() isn't parsed correctly.  I've added this one
to my TODO list because it should parse this correctly.

regards,
dan carpenter

