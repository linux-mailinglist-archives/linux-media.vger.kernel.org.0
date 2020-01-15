Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A27613CB91
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2020 19:04:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729149AbgAOSDS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jan 2020 13:03:18 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:36362 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726418AbgAOSDS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jan 2020 13:03:18 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00FHwkeD062666;
        Wed, 15 Jan 2020 18:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=lxeza2C4xQinNBLY8Tn9KuOSwJaqPtPyPnh2SkUU/nw=;
 b=X6IDYVjxu8uhIlS1dYiBrx7JAbPBXfUwhdaDjmMiqvC4IHCpqXcfUYft2qzrnghqq++g
 7HidjRwkKv15dYID4E7SE9GFuqKKxVmHBZKdrHDv767X8qAIxtqyIqP3fH+LmbdtjnoA
 3FgTaiHvap7zgWVSWOypboA5Yzf8/d+fAR/dcbu9A9ioGEmUKZ0EfOpdTUq++laMXMCL
 0KpxzCoH5H7gR8zZsVR3ZE++4VvReQ5bs46rVpiiWfnvfLL7MasWohBus/lAhCcCa0JK
 d58naJorccT/fyf1FeVTd3VNW57HOM7qQ+qPFhR3jq7CXeEosPzopQWpmysLlltQ1ObG TQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 2xf73twpp5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 15 Jan 2020 18:02:50 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00FHxDgx048148;
        Wed, 15 Jan 2020 18:00:49 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 2xj1prkdg6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 15 Jan 2020 18:00:49 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00FI0cl2026518;
        Wed, 15 Jan 2020 18:00:39 GMT
Received: from kadam (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 15 Jan 2020 10:00:38 -0800
Date:   Wed, 15 Jan 2020 21:01:17 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Sean Young <sean@mess.org>
Cc:     Phong Tran <tranmanphong@gmail.com>, mchehab@kernel.org,
        gregkh@linuxfoundation.org, allison@lohutok.net,
        tglx@linutronix.de,
        syzbot+6bf9606ee955b646c0e1@syzkaller.appspotmail.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        glider@google.com, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] media: dvb: check return value digitv_ctrl_msg
Message-ID: <20200115180116.GA21151@kadam>
References: <0000000000004f3d820596d8c51c@google.com>
 <20191203004138.21223-1-tranmanphong@gmail.com>
 <20200115173226.GA24471@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200115173226.GA24471@gofer.mess.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9501 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001150138
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9501 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001150138
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 15, 2020 at 05:32:26PM +0000, Sean Young wrote:
> Hello,
> 
> On Tue, Dec 03, 2019 at 07:41:38AM +0700, Phong Tran wrote:
> > For fixing syzbot "KMSAN: uninit-value in digitv_rc_query"
> > 
> > In scenario testing for syzbot, failure reading from
> > digitv_ctrl_msg() [1].
> > 
> > Eg:
> > [   91.846657][ T3844] dvb-usb: bulk message failed: -22 (7/0)
> > 
> > digitv_rc_query() always return 0. But in this case a wrong thing happens.
> > 
> > Reported-by: syzbot+6bf9606ee955b646c0e1@syzkaller.appspotmail.com
> > Tested-by: syzbot+6bf9606ee955b646c0e1@syzkaller.appspotmail.com
> 
> A fix for this was already merged I'm afraid, see commit eecc70d22ae5
> ("media: digitv: don't continue if remote control state can't be read").
> 
> > [1]: https://syzkaller.appspot.com/text?tag=CrashLog&x=16860a63600000
> > [2]: https://groups.google.com/d/msg/syzkaller-bugs/-TXIJAZ0J9Q/T4PEUQoeAQAJ
> > 
> > Signed-off-by: Phong Tran <tranmanphong@gmail.com>
> > ---
> >  drivers/media/usb/dvb-usb/digitv.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/media/usb/dvb-usb/digitv.c b/drivers/media/usb/dvb-usb/digitv.c
> > index dd5bb230cec1..61bc8945e6b9 100644
> > --- a/drivers/media/usb/dvb-usb/digitv.c
> > +++ b/drivers/media/usb/dvb-usb/digitv.c
> > @@ -231,17 +231,21 @@ static struct rc_map_table rc_map_digitv_table[] = {
> >  static int digitv_rc_query(struct dvb_usb_device *d, u32 *event, int *state)
> >  {
> >  	int i;
> > -	u8 key[5];
> > +	u8 key[5] = { 0 };
> 
> The merged commit does not change this line. Why was this changed?
> 

It would fix the problem that key[0] is never initialized...  But the
correct fix is to make key 4 elements long and delete key[0].

regards,
dan carpenter

