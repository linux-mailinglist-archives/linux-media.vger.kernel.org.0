Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 439FE69F2DB
	for <lists+linux-media@lfdr.de>; Wed, 22 Feb 2023 11:41:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231218AbjBVKlr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Feb 2023 05:41:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231551AbjBVKlp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Feb 2023 05:41:45 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B57FC37737
        for <linux-media@vger.kernel.org>; Wed, 22 Feb 2023 02:41:43 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id d10so423321pgt.12
        for <linux-media@vger.kernel.org>; Wed, 22 Feb 2023 02:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d2wqDkrxiDWE09Q3a4bC8PL8sBN0U7HIVcRwNkYnjZ0=;
        b=VNtUMOUQf74azEyXsdfqaK1OT1s9jBblvEY+ZHAsOgG5fK2Ro8H40koIUe9ZBQBkwn
         iK6jg2bO+5AsGX3GZxCA6JJ9AoCpXnQNFAWaRiwcekVBdTHO7a/tEdmIApfUmMYr6rfj
         pz2qQRijYALBlofBjQedes2kuMOnSwJLSQzCYG73AwSCbf9Mb+lI+FIE+cC/6nC9wgj/
         hFsCVVhEGEz4nWg7/bvQ+p3MI3RKtAsVBOyLF46SrAdrfrd86DRsRmDgGlCYhoZWfwKm
         ZWJ15t1Th/UMbJD9O5MZl1yJFEgVMjblswWLAgVfdaTKF/4f5f8JsMY+KTpMXsfcotA9
         KMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d2wqDkrxiDWE09Q3a4bC8PL8sBN0U7HIVcRwNkYnjZ0=;
        b=EwpDnV4PUjRnan8fjB55bSITTvSPavNdZd5SuMaSN3nCdJ5zQc4Sq243cNhEInZLvu
         zc9f9ehVJ2UNiH9E8N59Vn9eqFF8hn6RrwmESx31duCiKE9UfBXaa/HAVgo5CfPSrBSK
         ksqifb6zl4ICK7wsZ5bj1HuRMLLV3vPaSRjqrS8yznmmhcyC0h+b9EY/cOoQb2btSCea
         dYrv3TsJGcsvAhiGcHbG1xttePU9eITUUl8GmhAwiUayVi4meWKeLpDtPAlnaVmLBRAx
         oiMlCnjOpATOI25UAvT1tlJZbVbNhpOICkBc5x7mey1aj1lcXXdYFXemnWEVX6uI9mpg
         c9CQ==
X-Gm-Message-State: AO0yUKU11++H3qUyMvO+XT+YDObpT29yRpKE2jYFvBDZzCQQN1grAqSK
        jfAFK3JpPRiD1xN07U51BwI=
X-Google-Smtp-Source: AK7set/k4D/Zogwhn995G3dmFqEmEnf1JAK0P5livOLtASjBTSXX6QjWSZkDYWt2r1ti7a4Uw2We0w==
X-Received: by 2002:a62:5250:0:b0:5a8:4bfb:6bee with SMTP id g77-20020a625250000000b005a84bfb6beemr8368252pfb.9.1677062503207;
        Wed, 22 Feb 2023 02:41:43 -0800 (PST)
Received: from [192.168.0.54] (ip5f5a5b70.dynamic.kabel-deutschland.de. [95.90.91.112])
        by smtp.gmail.com with ESMTPSA id n24-20020aa79058000000b00592591d1634sm4796970pfo.97.2023.02.22.02.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 02:41:42 -0800 (PST)
Message-ID: <e890fca0-a706-a43d-83ed-80c1f59b1182@googlemail.com>
Date:   Wed, 22 Feb 2023 11:41:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [v4l-utils] [PATCH v9 3/7] Add support for meson building
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, kieran.bingham@ideasonboard.com,
        mchehab@kernel.org, nicolas@ndufresne.ca, p.zabel@pengutronix.de,
        rosenp@gmail.com, sakari.ailus@iki.fi, sean@mess.org,
        user.vdr@gmail.com, xavier.claessens@collabora.com,
        deborah.brouwer@collabora.com, ariel@vanguardiasur.com.ar,
        ezequiel@vanguardiasur.com.ar, tomi.valkeinen@ideasonboard.com
References: <20230221143204.26591-1-laurent.pinchart@ideasonboard.com>
 <20230221143204.26591-4-laurent.pinchart@ideasonboard.com>
 <0da1d7df-5ba5-c6ce-afa0-3450ea3e8ed3@xs4all.nl>
 <Y/Tab2i9eA+wcoF2@pendragon.ideasonboard.com>
From:   Gregor Jasny <gjasny@googlemail.com>
In-Reply-To: <Y/Tab2i9eA+wcoF2@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On 21.02.23 15:51, Laurent Pinchart wrote:
>> I wonder if we shouldn't make a 1.24 stable release first without this patch
>> series, then introduce meson with version 1.25. Besides, the last stable release
>> was 16 months ago, so I think it is high time for a new stable anyway.
> 
> Works for me.
> 
>> Gregor, any opinion?

Sure, I can create a new release tonight. Would anyone want to merge 
something prior to the release?

Thanks,
Gregor
