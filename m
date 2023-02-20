Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB7CA69C9F7
	for <lists+linux-media@lfdr.de>; Mon, 20 Feb 2023 12:38:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231812AbjBTLiA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Feb 2023 06:38:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231768AbjBTLh6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Feb 2023 06:37:58 -0500
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7196293D7
        for <linux-media@vger.kernel.org>; Mon, 20 Feb 2023 03:37:57 -0800 (PST)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31K9FSHZ020931;
        Mon, 20 Feb 2023 12:37:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=KxlzubpNLkC512L/xxi403HvXwujEP1qf/1hgFpVR1M=;
 b=REnTRnX8NUUsLsoXjysYhdgUa6K8akdhPmprZY27j8gzWd/qC2SFtMfreTgVJjr6+KMX
 g2RtIrYRtcca5uixrLAyWY5gDAAwAUxLF9KIFF8CUsuvVejchfPyq2i0bgQfwbpY9zUl
 cWKy3sk1FqW2nM3PDR/kUqZL6aAB5IMo6yrE6KXEPMetGAZqXWtmekPXy9KFvtA2y70Y
 Kk9xFJLzGW2cwosJ0VzxJcZ2JdE9S4wwRhqBM8VU9LKqCmQTWcFOjRoHw2S+lg+ugqZu
 i7aLNNOPkawdRkPreyAkXDTN5NoQapPoTmvqjSNSJjZ+kVqm7DLuQz91cHi9qJnXHvI1 3g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ntpw62n0k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 20 Feb 2023 12:37:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B601610002A;
        Mon, 20 Feb 2023 12:37:43 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A30032194F0;
        Mon, 20 Feb 2023 12:37:43 +0100 (CET)
Received: from [10.129.167.26] (10.129.167.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Mon, 20 Feb
 2023 12:37:43 +0100
Message-ID: <1895e9b1-f7db-5b39-3a37-164cfa0cf0d5@foss.st.com>
Date:   Mon, 20 Feb 2023 12:37:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/4] media: i2c: st-vgxy61: Use VGXY61_NB_POLARITIES
 instead of hardcoded value in tx_from_ep
To:     Sakari Ailus <sakari.ailus@iki.fi>
CC:     <linux-media@vger.kernel.org>, <sylvain.petinot@foss.st.com>,
        <mchehab@kernel.org>, <laurent.pinchart@ideasonboard.com>
References: <20230201140417.89195-1-benjamin.mugnier@foss.st.com>
 <20230201140417.89195-5-benjamin.mugnier@foss.st.com>
 <Y+rBOp50nK0mKLhm@valkosipuli.retiisi.eu>
Content-Language: en-US
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <Y+rBOp50nK0mKLhm@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.129.167.26]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_08,2023-02-20_02,2023-02-09_01
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 2/14/23 00:01, Sakari Ailus wrote:
> Hi Benjamin,
> 
> On Wed, Feb 01, 2023 at 03:04:17PM +0100, Benjamin Mugnier wrote:
>> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> 
> I know this is a simple patch, but please add a commit message nonetheless.
> 
> Not having one produces a checkpatch.pl warning. Did you use it? :-)
> 

It's even worse, I remember using checkpatch.pl on the source file
directly but not on commits, so I missed it :'( I apologize.

Here is the long commit message:
tx_from_ep's for loop uses '5' as bound, while in fact it refers to the
number of polarities. Replace it by VGXY61_NB_POLARITIES for factorization.

Can you apply it directly to your tree, or do you want me to send a v2
with this fix?

Thanks a ton.

-- 
Regards,

Benjamin
