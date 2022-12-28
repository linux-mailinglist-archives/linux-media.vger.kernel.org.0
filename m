Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC1476573CE
	for <lists+linux-media@lfdr.de>; Wed, 28 Dec 2022 09:05:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbiL1IFq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Dec 2022 03:05:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbiL1IFp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Dec 2022 03:05:45 -0500
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D449A13C
        for <linux-media@vger.kernel.org>; Wed, 28 Dec 2022 00:05:43 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BS85UjC024253;
        Wed, 28 Dec 2022 02:05:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1672214730;
        bh=yqg0MADtJ83H48ewMmt3eE90PMwwCztium11RnUKCaw=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=rFDYbsreEK9iPCdgcZPuFvdl4gZm9LJcXTf4lq1Eg+Su2v8krpM8NeQHPQOlQah8+
         kpIL97+lgLN217QSbNBVjjVtMGBZUUPnuplXPar83builvq6nV+2NSkqvux7lRSF6b
         LxFbIMFJpHWrEyQd+c01iXn5t2T2klDgjiEGU6/U=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BS85Uf3016746
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 28 Dec 2022 02:05:30 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 28
 Dec 2022 02:05:30 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 28 Dec 2022 02:05:30 -0600
Received: from [10.250.234.199] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BS85QEf007384;
        Wed, 28 Dec 2022 02:05:27 -0600
Message-ID: <bb5def23-23fc-2a94-d2e1-527caa48e68c@ti.com>
Date:   Wed, 28 Dec 2022 13:35:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] media: ov5640: set correct default format for CSI-2 mode
Content-Language: en-US
To:     "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>,
        <linux-media@vger.kernel.org>
CC:     <mchehab@kernel.org>, <slongerbeam@gmail.com>,
        <laurent.pinchart@ideasonboard.com>, <jacopo@jmondi.org>,
        <sakari.ailus@linux.intel.com>
References: <20221212040526.3549644-1-guoniu.zhou@oss.nxp.com>
From:   "Luthra, Jai" <j-luthra@ti.com>
In-Reply-To: <20221212040526.3549644-1-guoniu.zhou@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Thanks for the patch.

On 12/12/22 09:35, G.N. Zhou (OSS) wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> 
> In commit a89f14bbcfa5 ("media: ov5640: Split DVP and CSI-2 formats"),
> it splits format list for DVP and CSI-2 mode, but the default format
> defined in commit 90b0f355c5a3 ("media: ov5640: Implement init_cfg")
> is only supported by DVP mode, so define a new default format for
> CSI-2 mode.
> 
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>

Reviewed-by: Jai Luthra <j-luthra@ti.com>

> ---
>   drivers/media/i2c/ov5640.c | 21 ++++++++++++++++++---
>   1 file changed, 18 insertions(+), 3 deletions(-)
> ...snip...
