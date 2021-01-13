Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7E682F482F
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 11:03:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbhAMKDc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 05:03:32 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:54986 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbhAMKDb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 05:03:31 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10DA03cm171319;
        Wed, 13 Jan 2021 10:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=jp+K+7j7YaTFi7y42TbbGWkVcjfUldJ+Q6gh/Vz/KO0=;
 b=ZZ8X1e646+qAmJx3SzdWEx7Llk9LUFEMoxWVChX6ahP1rYSImKMKePv6UXCtXvHy5tAb
 5szQqOzbECyvaU0zyR0vQJ9TqEXhbfbKE+/jFZviYBqxHuyGyJsauvyHpNUd/obinRwG
 ir+1MMst1IqefH+TLEIxTcijgKG5uSsc4Wobp7QBw8v4SKTkUdv3G5icrV6K/QOeq0X/
 01RTWyHey6ZHOEuMQ3vCf6ZRuUOa618sY81WjBaEufbpxk2csGKZmMRMj1t8mxO7EDlX
 E0ccWDSOzUceYpQZoVmqFouGMqxAS3FNjtf40RSyNw/K7ld8+Qylw4cH9UIFAzneIKTV sg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 360kcytn6v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 13 Jan 2021 10:02:39 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10DA1eRV041372;
        Wed, 13 Jan 2021 10:02:38 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 360ke836fm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 13 Jan 2021 10:02:38 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10DA2Z68019379;
        Wed, 13 Jan 2021 10:02:35 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 13 Jan 2021 02:02:35 -0800
Date:   Wed, 13 Jan 2021 13:02:24 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     =?utf-8?B?5oWV5Yas5Lqu?= <mudongliangabcd@gmail.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, mchehab@kernel.org, sean@mess.org,
        anant.thazhemadam@gmail.com,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Greg KH <greg@kroah.com>, Dmitry Vyukov <dvyukov@google.com>
Subject: Re: "UBSAN: shift-out-of-bounds in mceusb_dev_recv" should share the
 same root cause with "UBSAN: shift-out-of-bounds in mceusb_dev_printdata"
Message-ID: <20210113100224.GH5083@kadam>
References: <CAD-N9QW-zm37f9PW-iF-NaAH5LLePWFba3aG5LkXD2a07YBZpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD-N9QW-zm37f9PW-iF-NaAH5LLePWFba3aG5LkXD2a07YBZpg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9862 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101130058
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9862 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1011 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101130058
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jan 13, 2021 at 01:04:44PM +0800, 慕冬亮 wrote:
> Hi developers,
> 
> I found that "UBSAN: shift-out-of-bounds in mceusb_dev_recv" and
> "UBSAN: shift-out-of-bounds in mceusb_dev_printdata" should share the
> same root cause.
> The reason is that the PoCs after minimization has a high similarity
> with the other. And their stack trace only diverges at the last
> function call. The following is some analysis for this bug.
> 
> The following code in the mceusb_process_ir_data is the vulnerable
> --------------------------------------------------------------------------------------------------------------------------
> for (; i < buf_len; i++) {
>      switch (ir->parser_state) {
>      case SUBCMD:
>              ir->rem = mceusb_cmd_datasize(ir->cmd, ir->buf_in[i]);
>              mceusb_dev_printdata(ir, ir->buf_in, buf_len, i - 1,
>                                                    ir->rem + 2, false);
>              if (i + ir->rem < buf_len)
>              mceusb_handle_command(ir, &ir->buf_in[i - 1]);
> --------------------------------------------------------------------------------------------------------------------------
> 
> The first report crashes at a shift operation(1<<*hi) in mceusb_handle_command.
> --------------------------------------------------------------------------------------------------------------------------
> static void mceusb_handle_command(struct mceusb_dev *ir, u8 *buf_in)
> {
> u8 *hi = &buf_in[2]; /* read only when required */
> if (cmd == MCE_CMD_PORT_SYS) {
>       switch (subcmd) {
>       case MCE_RSP_GETPORTSTATUS:
>               if (buf_in[5] == 0)
>                      ir->txports_cabled |= 1 << *hi;
> --------------------------------------------------------------------------------------------------------------------------
> 
> The second report crashes at another shift operation (1U << data[0])
> in mceusb_dev_printdata.
> --------------------------------------------------------------------------------------------------------------------------
> static void mceusb_dev_printdata(struct mceusb_dev *ir, u8 *buf, int buf_len,
> int offset, int len, bool out)
> {
> data   = &buf[offset] + 2;
> 
>           period = DIV_ROUND_CLOSEST((1U << data[0] * 2) *
>                         (data[1] + 1), 10);
> --------------------------------------------------------------------------------------------------------------------------
> 
> >From the analysis, we can know the data[0] and *hi access the same
> memory cell - ``ir->buf_in[i+1]``. So the root cause should be that it
> misses the check of ir->buf_in[i+1].
> 
> For the patch of this bug, there is one from anant.thazhemadam@gmail.com:
> --------------------------------------------------------------------------------------------------------------------------
> diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
> index f1dbd059ed08..79de721b1c4a 100644
> --- a/drivers/media/rc/mceusb.c
> +++ b/drivers/media/rc/mceusb.c
> @@ -1169,7 +1169,7 @@ static void mceusb_handle_command(struct
> mceusb_dev *ir, u8 *buf_in)
>   switch (subcmd) {
>   /* the one and only 5-byte return value command */
>   case MCE_RSP_GETPORTSTATUS:
> - if (buf_in[5] == 0)
> + if ((buf_in[5] == 0) && (*hi <= 32))

This should be < instead of <=.  Shifting by 32 is undefined.  Also this
patch can't be applied at all so it's hard to review.  Read the two
paragraphs of Documentation/process/email-clients.rst

There are some other bugs:

	ir->num_txports = *hi;

If "ir->num_txports" is over 31 then it will lead to undefined behavior
in mceusb_set_tx_mask().  It not totally clear to me what the correct
limit is.  So search through the code a bit more I guess and try find
the remaining bugs and what the limits should be.

regards,
dan carpenter


