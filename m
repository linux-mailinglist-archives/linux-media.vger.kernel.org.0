Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BEFD3E7DF6
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 19:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbhHJRG7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 13:06:59 -0400
Received: from gateway24.websitewelcome.com ([192.185.50.45]:39310 "EHLO
        gateway24.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229516AbhHJRG6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 13:06:58 -0400
X-Greylist: delayed 1271 seconds by postgrey-1.27 at vger.kernel.org; Tue, 10 Aug 2021 13:06:58 EDT
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
        by gateway24.websitewelcome.com (Postfix) with ESMTP id CED58924D
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 11:37:41 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id DUl3m73Nj7sOiDUl3mcSKf; Tue, 10 Aug 2021 11:37:41 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=lGUjzyKyUUSWgZdGMi7kbumNtIqOETEgU5Hh8Sjxa4c=; b=cS61dmLe1QbOPH2mvus32IOnsp
        7X+z+IgRY0v57c/uWfkNlTQCO/Rg7s/63cLSS+BcUuYd3n5R69yc2WN1R9aCSB6afiJo25NCETOj5
        2A5OgOjUOxlJUe06saxBnF/OlNShL10cdQT/oZbHkBD/0rApZLT6TlTxC1j5VA2dnnVz71nMDSSlx
        HTgPsy7XgqPq7bORvMzYP4tN2/f86GzZsMquy90zxJSetI8XEindJoaDtyos59q6Rcry8Qj5HbAQ7
        LlK/G5D1TZm6983dto6mbiPJpLgiImHQ2Tb6f2eY2xmmIhuUFBviLYKOKbNyvwlEMZjN2TK86vCXx
        cpHMVDCg==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:37828 helo=[192.168.15.8])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <gustavo@embeddedor.com>)
        id 1mDUl2-0015cl-Va; Tue, 10 Aug 2021 11:37:41 -0500
Subject: Re: [PATCH v2 1/2] media: staging/intel-ipu3: css: Fix wrong size
 comparison
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-kernel@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
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
 <3c9ac43d-09ca-e5d5-83a8-7b6d23928763@embeddedor.com>
 <20210810151852.GI3@paasikivi.fi.intel.com>
 <a5e19508-4d7a-ba63-7ac0-ed2e56bc3bc1@embeddedor.com>
 <20210810163030.GJ3@paasikivi.fi.intel.com>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <f77680c5-756a-bb47-892f-084364727b1d@embeddedor.com>
Date:   Tue, 10 Aug 2021 11:40:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810163030.GJ3@paasikivi.fi.intel.com>
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
X-Exim-ID: 1mDUl2-0015cl-Va
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8]) [187.162.31.110]:37828
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 21
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 8/10/21 11:30, Sakari Ailus wrote:
> On Tue, Aug 10, 2021 at 11:26:14AM -0500, Gustavo A. R. Silva wrote:
>> Hi Sakari,
>>
>> Please, see my comments below...
>>
>> On 8/10/21 10:18, Sakari Ailus wrote:
>>> Hi Gustavo,
>>>
>>> Apologies for the delay.
>>>
>>> On Mon, Aug 02, 2021 at 08:46:20AM -0500, Gustavo A. R. Silva wrote:
>>>> Hi Sakari,
>>>>
>>>> On 8/2/21 01:05, Sakari Ailus wrote:
>>>>> Hi Gustavo,
>>>>>
>>>>> I missed you already had sent v2...
>>>>>
>>>>> On Fri, Jul 30, 2021 at 07:08:13AM -0500, Gustavo A. R. Silva wrote:
>>>>>> There is a wrong comparison of the total size of the loaded firmware
>>>>>> css->fw->size with the size of a pointer to struct imgu_fw_header.
>>>>>>
>>>>>> Fix this by using the right operand 'struct imgu_fw_header' for
>>>>>> sizeof, instead of 'struct imgu_fw_header *' and turn binary_header
>>>>>> into a flexible-array member. Also, adjust the relational operator
>>>>>> to be '<=' instead of '<', as it seems that the intention of the
>>>>>> comparison is to determine if the loaded firmware contains any
>>>>>> 'struct imgu_fw_info' items in the binary_header[] array than merely
>>>>>> the file_header (struct imgu_fw_bi_file_h).
>>>>>>
>>>>>> The replacement of the one-element array with a flexible-array member
>>>>>> also help with the ongoing efforts to globally enable -Warray-bounds
>>>>>> and get us closer to being able to tighten the FORTIFY_SOURCE routines
>>>>>> on memcpy().
>>>>>>
>>>>>> Link: https://github.com/KSPP/linux/issues/79
>>>>>> Link: https://github.com/KSPP/linux/issues/109
>>>>>> Fixes: 09d290f0ba21 ("media: staging/intel-ipu3: css: Add support for firmware management")
>>>>>> Cc: stable@vger.kernel.org
>>>>>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>>>>>> ---
>>>>>>
>>>>>> It'd be just great if someone that knows this code better can confirm
>>>>>> these changes are correct. In particular the adjustment of the
>>>>>> relational operator. Thanks!
>>>>>>
>>>>>> Changes in v2:
>>>>>>  - Use flexible array and adjust relational operator, accordingly.
>>>>>
>>>>> The operator was just correct. The check is just there to see the firmware
>>>>> is at least as large as the struct as which it is being accessed.
>>>>
>>>> I'm a bit confused, so based on your reply to v1 of this series, this patch
>>>> is now correct, right?
>>>>
>>>> The operator in v1 _was_ correct as long as the one-element array wasn't
>>>> transformed into a flexible array, right?
>>>>
>>>> Notice that generally speaking flexible-array members don't occupy space in the
>>>> containing structure:
>>>>
>>>> $ pahole -C imgu_fw_header drivers/staging/media/ipu3/ipu3-css-fw.o
>>>> struct imgu_fw_header {
>>>> 	struct imgu_fw_bi_file_h   file_header;          /*     0    72 */
>>>> 	/* --- cacheline 1 boundary (64 bytes) was 8 bytes ago --- */
>>>> 	struct imgu_fw_info        binary_header[] __attribute__((__aligned__(8))); /*    72     0 */
>>>>
>>>> 	/* size: 72, cachelines: 2, members: 2 */
>>>> 	/* forced alignments: 1 */
>>>> 	/* last cacheline: 8 bytes */
>>>> } __attribute__((__aligned__(8)));
>>>>
>>>> $ pahole -C imgu_fw_header drivers/staging/media/ipu3/ipu3-css-fw.o
>>>> struct imgu_fw_header {
>>>> 	struct imgu_fw_bi_file_h   file_header;          /*     0    72 */
>>>> 	/* --- cacheline 1 boundary (64 bytes) was 8 bytes ago --- */
>>>> 	struct imgu_fw_info        binary_header[1] __attribute__((__aligned__(8))); /*    72  1200 */
>>>>
>>>> 	/* size: 1272, cachelines: 20, members: 2 */
>>>> 	/* forced alignments: 1 */
>>>> 	/* last cacheline: 56 bytes */
>>>> } __attribute__((__aligned__(8)));
>>>>
>>>> So, now that the flexible array transformation is included in the same patch as the
>>>> bugfix, the operator is changed from '<' to '<='
>>>
>>> '<' is correct since you only need as much data as the struct you're about
>>> to access is large, not a byte more than that. As Dan noted.
>>>
>>> I think you could add a check for binary_nr is at least one.
>>
>> If we need to check that binary_nr is at least one, then this would be the right
>> change:
>>
>>         css->fwp = (struct imgu_fw_header *)css->fw->data;
>> -       if (css->fw->size < sizeof(struct imgu_fw_header *) ||
>> +       if (css->fw->size < struct_size(css->fwp, binary_header, 1) ||
>>             css->fwp->file_header.h_size != sizeof(struct imgu_fw_bi_file_h))
>>                 goto bad_fw;
> 
> There's already a check the space required for the array of binary_nr is
> there. But not the number itself.

Yep; and that is for the upper limit.

The whole fix would be this:

diff --git a/drivers/staging/media/ipu3/ipu3-css-fw.c b/drivers/staging/media/ipu3/ipu3-css-fw.c
index 45aff76198e2..8830f42f2b12 100644
--- a/drivers/staging/media/ipu3/ipu3-css-fw.c
+++ b/drivers/staging/media/ipu3/ipu3-css-fw.c
@@ -124,12 +124,11 @@ int imgu_css_fw_init(struct imgu_css *css)
        /* Check and display fw header info */

        css->fwp = (struct imgu_fw_header *)css->fw->data;
-       if (css->fw->size < sizeof(struct imgu_fw_header *) ||
+       if (css->fw->size < struct_size(css->fwp, binary_header, 1) ||
            css->fwp->file_header.h_size != sizeof(struct imgu_fw_bi_file_h))
                goto bad_fw;
-       if (sizeof(struct imgu_fw_bi_file_h) +
-           css->fwp->file_header.binary_nr * sizeof(struct imgu_fw_info) >
-           css->fw->size)
+       if (struct_size((struct imgu_fw_header *)0, binary_header,
+                       css->fwp->file_header.binary_nr) > css->fw->size)
                goto bad_fw;

        dev_info(dev, "loaded firmware version %.64s, %u binaries, %zu bytes\n",
diff --git a/drivers/staging/media/ipu3/ipu3-css-fw.h b/drivers/staging/media/ipu3/ipu3-css-fw.h
index 3c078f15a295..c0bc57fd678a 100644
--- a/drivers/staging/media/ipu3/ipu3-css-fw.h
+++ b/drivers/staging/media/ipu3/ipu3-css-fw.h
@@ -171,7 +171,7 @@ struct imgu_fw_bi_file_h {

 struct imgu_fw_header {
        struct imgu_fw_bi_file_h file_header;
-       struct imgu_fw_info binary_header[1];   /* binary_nr items */
+       struct imgu_fw_info binary_header[];    /* binary_nr items */
 };

 /******************* Firmware functions *******************/


Notice that "css->fw->size < struct_size(css->fwp, binary_header, 1)" with binary_header declared as a flexible-array
member is equivalent to "css->fw->size < sizeof(struct imgu_fw_header)" with binary_header declared as a one-element
array.

--
Gustavo
