Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6207A1AAB
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 11:37:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233371AbjIOJhJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 05:37:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233117AbjIOJhI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 05:37:08 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0BA619BC
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 02:37:02 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38F7A2ek008712;
        Fri, 15 Sep 2023 11:36:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        message-id:date:mime-version:subject:to:references:from
        :in-reply-to:content-type:content-transfer-encoding; s=
        selector1; bh=KmZTADPBnLWCO7iWbPGH5fxL+iNhdLB3MKBrrBIMZR0=; b=zn
        XO3Id6cBBWvKc/cdc4EConOy/6q4nlKu7JRHRsOAI+3e08oHl5WNPbBTOHw0ehDN
        44cDr4A5RzKafg3mdpnIEhVNKVYSxLV54q1VGISDi4LCeUiQmnEejiX2+uvKvNxr
        g9tu95RmQmotr3hocGAQIx88l/aq3oI6BJ3Brogtqn8HAa7lkAKKJJXwC5E/YNYk
        6BDfo9r8SdzkyUzzcwbMbFUY5nckw2ayvKql0tuNQmSdJinOXyjIwHzXXZA4V30u
        ofdOc3w8cUZZpeppjXaljr1HgZyQ0pjnIIOI+gOYYgqeXX3NBvILYtO8sIZlf+YY
        dEm+27G3OYvUdiQvU9bg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t2y7nmnst-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 15 Sep 2023 11:36:58 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ECA0E100040;
        Fri, 15 Sep 2023 11:36:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D115121B53D;
        Fri, 15 Sep 2023 11:36:57 +0200 (CEST)
Received: from [10.252.22.235] (10.252.22.235) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Sep
 2023 11:36:57 +0200
Message-ID: <1ecf2939-b016-693c-1a8e-71e50bf5ace7@foss.st.com>
Date:   Fri, 15 Sep 2023 11:36:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [ANN] Introducing build scripts to test
Content-Language: en-US
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        <linuxtv-ci@linuxtv.org>
References: <18989016-6392-a77b-6cf7-1223c9161def@xs4all.nl>
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <18989016-6392-a77b-6cf7-1223c9161def@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.252.22.235]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_06,2023-09-14_01,2023-05-22_02
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

A bit late to the party, I tried it this morning and everything went
flawlessly. Instructions are clear and command line tools are well designed.
This will be useful for us. Thank you for releasing it.

On 8/28/23 15:29, Hans Verkuil wrote
> To give an idea of the expected build times:
> 
> On an AMD Ryzen 9 6900HX (8 cores) a standard build of the staging tree
> (build.sh -test all) takes 39 minutes.
> 
> On an AMD Ryzen Threadripper 3970X (32 cores) it takes a bit over 13 minutes.

For the record on my Intel i7-11850H :

$ time ./build.sh -test all
real	36m21.633s
user	452m2.855s
sys	39m30.233s

-- 
Regards,

Benjamin
