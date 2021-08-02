Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9BF53DDA2A
	for <lists+linux-media@lfdr.de>; Mon,  2 Aug 2021 16:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236746AbhHBOGl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Aug 2021 10:06:41 -0400
Received: from gateway33.websitewelcome.com ([192.185.145.216]:25091 "EHLO
        gateway33.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237267AbhHBOEq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Aug 2021 10:04:46 -0400
X-Greylist: delayed 1240 seconds by postgrey-1.27 at vger.kernel.org; Mon, 02 Aug 2021 10:04:46 EDT
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
        by gateway33.websitewelcome.com (Postfix) with ESMTP id 13B0311A2F5
        for <linux-media@vger.kernel.org>; Mon,  2 Aug 2021 08:43:48 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id AYENm6g7GjSwzAYENmgLym; Mon, 02 Aug 2021 08:43:47 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ofCX79+Rdf3KA3ygQd5aThXKKbcOK34wLcXaAGModx0=; b=Rw0CtDE1sjh2NVCk9V6FIHr2ha
        fm459NwtYD/fFi5HNqYS7vFodXN3cuSisRlKnLm4Tdffp66F/Il285vyvcvIJ4qFA+frcMr9mezf4
        +hqngJI5USHqj+hxTyx8uxCXuMHDZ2rg+T6sMnUkqMUSgGS2OT3QPnUN8u8Rp6vs9NcBVAjZUoW2V
        GGHqg1FDzFn1qFj7zUea+eNNphWNYuhOtiLMNqLYnqCgwB3saNkSgmwfUnZoGz0Ly4Lpfy+SD0GQG
        2AYe5Knt9xfNY2w5TULaJGjUEmK9VTH7/Io3W1z4rzObmbJOsZ2xy39aiNWTCypZ7WGsbHrv06uqb
        hdjeKb1w==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:56648 helo=[192.168.15.8])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <gustavo@embeddedor.com>)
        id 1mAYEM-001O0n-Lf; Mon, 02 Aug 2021 08:43:46 -0500
Subject: Re: [PATCH v2 1/2] media: staging/intel-ipu3: css: Fix wrong size
 comparison
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-hardening@vger.kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>
References: <cover.1627646101.git.gustavoars@kernel.org>
 <184d96f95d6261b1a91704eb68adbd0a2e1c2cc2.1627646101.git.gustavoars@kernel.org>
 <20210802060546.GL3@paasikivi.fi.intel.com>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <3c9ac43d-09ca-e5d5-83a8-7b6d23928763@embeddedor.com>
Date:   Mon, 2 Aug 2021 08:46:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210802060546.GL3@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1mAYEM-001O0n-Lf
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8]) [187.162.31.110]:56648
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 9
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 8/2/21 01:05, Sakari Ailus wrote:
> Hi Gustavo,
> 
> I missed you already had sent v2...
> 
> On Fri, Jul 30, 2021 at 07:08:13AM -0500, Gustavo A. R. Silva wrote:
>> There is a wrong comparison of the total size of the loaded firmware
>> css->fw->size with the size of a pointer to struct imgu_fw_header.
>>
>> Fix this by using the right operand 'struct imgu_fw_header' for
>> sizeof, instead of 'struct imgu_fw_header *' and turn binary_header
>> into a flexible-array member. Also, adjust the relational operator
>> to be '<=' instead of '<', as it seems that the intention of the
>> comparison is to determine if the loaded firmware contains any
>> 'struct imgu_fw_info' items in the binary_header[] array than merely
>> the file_header (struct imgu_fw_bi_file_h).
>>
>> The replacement of the one-element array with a flexible-array member
>> also help with the ongoing efforts to globally enable -Warray-bounds
>> and get us closer to being able to tighten the FORTIFY_SOURCE routines
>> on memcpy().
>>
>> Link: https://github.com/KSPP/linux/issues/79
>> Link: https://github.com/KSPP/linux/issues/109
>> Fixes: 09d290f0ba21 ("media: staging/intel-ipu3: css: Add support for firmware management")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>> ---
>>
>> It'd be just great if someone that knows this code better can confirm
>> these changes are correct. In particular the adjustment of the
>> relational operator. Thanks!
>>
>> Changes in v2:
>>  - Use flexible array and adjust relational operator, accordingly.
> 
> The operator was just correct. The check is just there to see the firmware
> is at least as large as the struct as which it is being accessed.

I'm a bit confused, so based on your reply to v1 of this series, this patch
is now correct, right?

The operator in v1 _was_ correct as long as the one-element array wasn't
transformed into a flexible array, right?

Notice that generally speaking flexible-array members don't occupy space in the
containing structure:

$ pahole -C imgu_fw_header drivers/staging/media/ipu3/ipu3-css-fw.o
struct imgu_fw_header {
	struct imgu_fw_bi_file_h   file_header;          /*     0    72 */
	/* --- cacheline 1 boundary (64 bytes) was 8 bytes ago --- */
	struct imgu_fw_info        binary_header[] __attribute__((__aligned__(8))); /*    72     0 */

	/* size: 72, cachelines: 2, members: 2 */
	/* forced alignments: 1 */
	/* last cacheline: 8 bytes */
} __attribute__((__aligned__(8)));

$ pahole -C imgu_fw_header drivers/staging/media/ipu3/ipu3-css-fw.o
struct imgu_fw_header {
	struct imgu_fw_bi_file_h   file_header;          /*     0    72 */
	/* --- cacheline 1 boundary (64 bytes) was 8 bytes ago --- */
	struct imgu_fw_info        binary_header[1] __attribute__((__aligned__(8))); /*    72  1200 */

	/* size: 1272, cachelines: 20, members: 2 */
	/* forced alignments: 1 */
	/* last cacheline: 56 bytes */
} __attribute__((__aligned__(8)));

So, now that the flexible array transformation is included in the same patch as the
bugfix, the operator is changed from '<' to '<='

Can you please confirm if this v2 is now correct? if so, it'd be great to have your
Reviewed-by tag. :)

Thanks!
--
Gustavo

> 
>>  - Update changelog text.
>>
>>  drivers/staging/media/ipu3/ipu3-css-fw.c | 2 +-
>>  drivers/staging/media/ipu3/ipu3-css-fw.h | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/media/ipu3/ipu3-css-fw.c b/drivers/staging/media/ipu3/ipu3-css-fw.c
>> index 45aff76198e2..630cb5186b48 100644
>> --- a/drivers/staging/media/ipu3/ipu3-css-fw.c
>> +++ b/drivers/staging/media/ipu3/ipu3-css-fw.c
>> @@ -124,7 +124,7 @@ int imgu_css_fw_init(struct imgu_css *css)
>>  	/* Check and display fw header info */
>>  
>>  	css->fwp = (struct imgu_fw_header *)css->fw->data;
>> -	if (css->fw->size < sizeof(struct imgu_fw_header *) ||
>> +	if (css->fw->size <= sizeof(struct imgu_fw_header) ||
>>  	    css->fwp->file_header.h_size != sizeof(struct imgu_fw_bi_file_h))
>>  		goto bad_fw;
>>  	if (sizeof(struct imgu_fw_bi_file_h) +
>> diff --git a/drivers/staging/media/ipu3/ipu3-css-fw.h b/drivers/staging/media/ipu3/ipu3-css-fw.h
>> index 3c078f15a295..c0bc57fd678a 100644
>> --- a/drivers/staging/media/ipu3/ipu3-css-fw.h
>> +++ b/drivers/staging/media/ipu3/ipu3-css-fw.h
>> @@ -171,7 +171,7 @@ struct imgu_fw_bi_file_h {
>>  
>>  struct imgu_fw_header {
>>  	struct imgu_fw_bi_file_h file_header;
>> -	struct imgu_fw_info binary_header[1];	/* binary_nr items */
>> +	struct imgu_fw_info binary_header[];	/* binary_nr items */
>>  };
>>  
>>  /******************* Firmware functions *******************/
> 
