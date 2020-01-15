Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99EA113CBCD
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2020 19:15:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729112AbgAOSPF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jan 2020 13:15:05 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:47868 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729011AbgAOSPF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jan 2020 13:15:05 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00FID4P1074941;
        Wed, 15 Jan 2020 18:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=yFUfzyH2YoDWvOLB9nWPhKlDX/Fse9xv2kghokm2tN8=;
 b=sLJnaZh+TOmqzsWppei+lP7DoO8FZ5/i8yXdmno25Nh6nbAM5+bbcJJIrrELK4isDnbQ
 Dnc/DjN0BqcEVQV3OBy87C+MdPsQLIngCUVjDL9xtqk1W2pHhA90TmXPIcAjMmMyqwGf
 yTiwKRQfvWH+NEGKRRx74AhnLVKNMIJmy1hHlMz5RymgX6UnVh6pSjKn0xt+FA/dZpXZ
 nCf7CfSA0y3KTDgowCe5HGRCOYCeQDdXrDmd8estJT8LpWp2bIuxe5nv+B1nD+6MPNIl
 4uLeXYHI7f59uEIuN19G54tygBf7/uloxqHzRfw2bJz3Ays5kJ1k4TwK/+KBieHFtAHV MA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 2xf73twrnc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 15 Jan 2020 18:14:42 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00FIETd3162262;
        Wed, 15 Jan 2020 18:14:42 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 2xj61k6gt9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 15 Jan 2020 18:14:42 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 00FIEe2X008926;
        Wed, 15 Jan 2020 18:14:40 GMT
Received: from kadam (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 15 Jan 2020 10:14:39 -0800
Date:   Wed, 15 Jan 2020 21:15:18 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Sean Young <sean@mess.org>
Cc:     Phong Tran <tranmanphong@gmail.com>, mchehab@kernel.org,
        gregkh@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de,
        syzbot+6bf9606ee955b646c0e1@syzkaller.appspotmail.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        glider@google.com, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] media: dvb: check return value digitv_ctrl_msg
Message-ID: <20200115181315.GG9562@kadam>
References: <0000000000004f3d820596d8c51c@google.com>
 <20191203004138.21223-1-tranmanphong@gmail.com>
 <20200115173226.GA24471@gofer.mess.org>
 <20200115180116.GA21151@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200115180116.GA21151@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9501 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001150140
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9501 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001150140
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 15, 2020 at 09:01:17PM +0300, Dan Carpenter wrote:
> On Wed, Jan 15, 2020 at 05:32:26PM +0000, Sean Young wrote:
> > Hello,
> > 
> > On Tue, Dec 03, 2019 at 07:41:38AM +0700, Phong Tran wrote:
> > > For fixing syzbot "KMSAN: uninit-value in digitv_rc_query"
> > > 
> > > In scenario testing for syzbot, failure reading from
> > > digitv_ctrl_msg() [1].
> > > 
> > > Eg:
> > > [   91.846657][ T3844] dvb-usb: bulk message failed: -22 (7/0)
> > > 
> > > digitv_rc_query() always return 0. But in this case a wrong thing happens.
> > > 
> > > Reported-by: syzbot+6bf9606ee955b646c0e1@syzkaller.appspotmail.com
> > > Tested-by: syzbot+6bf9606ee955b646c0e1@syzkaller.appspotmail.com
> > 
> > A fix for this was already merged I'm afraid, see commit eecc70d22ae5
> > ("media: digitv: don't continue if remote control state can't be read").
> > 
> > > [1]: https://syzkaller.appspot.com/text?tag=CrashLog&x=16860a63600000
> > > [2]: https://groups.google.com/d/msg/syzkaller-bugs/-TXIJAZ0J9Q/T4PEUQoeAQAJ
> > > 
> > > Signed-off-by: Phong Tran <tranmanphong@gmail.com>
> > > ---
> > >  drivers/media/usb/dvb-usb/digitv.c | 12 ++++++++----
> > >  1 file changed, 8 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/media/usb/dvb-usb/digitv.c b/drivers/media/usb/dvb-usb/digitv.c
> > > index dd5bb230cec1..61bc8945e6b9 100644
> > > --- a/drivers/media/usb/dvb-usb/digitv.c
> > > +++ b/drivers/media/usb/dvb-usb/digitv.c
> > > @@ -231,17 +231,21 @@ static struct rc_map_table rc_map_digitv_table[] = {
> > >  static int digitv_rc_query(struct dvb_usb_device *d, u32 *event, int *state)
> > >  {
> > >  	int i;
> > > -	u8 key[5];
> > > +	u8 key[5] = { 0 };
> > 
> > The merged commit does not change this line. Why was this changed?
> > 
> 
> It would fix the problem that key[0] is never initialized...  But the
> correct fix is to make key 4 elements long and delete key[0].

Phong,

Presumably you can fix this?  You will have to renumber key[1] to
key[0] and key[2] to key[1] etc...  Add a fixes tag.

Fixes: 774c0de4aed4 ("V4L/DVB (4616): [PATCH] Nebula DigiTV USB RC support")

Otherwise if you want I can send the patch.

regards,
dan carpenter

