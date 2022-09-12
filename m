Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 165815B5C7A
	for <lists+linux-media@lfdr.de>; Mon, 12 Sep 2022 16:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbiILOm0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Sep 2022 10:42:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbiILOmE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Sep 2022 10:42:04 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26786356EE
        for <linux-media@vger.kernel.org>; Mon, 12 Sep 2022 07:41:46 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id x1so8807604plv.5
        for <linux-media@vger.kernel.org>; Mon, 12 Sep 2022 07:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Ff+zeYOGhl0GRcmIWHpr6gXpp5v27YUFrc/3zntPxqw=;
        b=BqBQ6sixgy5R0Ho4spFu1DbPM0/T8xLPxRaAK3PhTD5NbvqD9mEFsgCzkwaaxJk8TF
         pscG2OZyBt/HXl7PMoEtEv3FBf2jo6LAV9Ecrw8I/W2ZBhNg2Hcdi++4grXBpyt2pCBf
         0vKg+DBAaQ40ghZtNluAh1sWmZgalUQ4A61OAfRByjpVYEkgSFDoc0cOoCLOCTnodaO4
         5oplPxuKjFDc2kzfGYYbIKsEBX2236Xi64O1roJPmnnPOp/Zb2LCj7BysWm13uZKkS4g
         P3/ziBDsFJPFg76eefLkkth+pyf+zlOjv54dUCWOTWz4hwrk8+wo6Q9EIVa4J/EnENhj
         /X9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Ff+zeYOGhl0GRcmIWHpr6gXpp5v27YUFrc/3zntPxqw=;
        b=7qXDiWgNpQAj1QENE5bTBbwZNGlm6fAgc/YOfyFUTSprDFSzQy9xxryzdCdxpUp9iz
         cLr8EQpo4FXEJAvfdi3ccOBQguQ4JgmEomN/999QJRQncUQzhbfiaqmk2RLFbqq6Dax9
         WNsSstRmpXpuBo/qUda/ocuSzSu5m35hMEuh+fP0XjdTHvv1AvRaTR+YwQa4nE8ZsagG
         9BQEgbpNikZK8o2fdbsKBR2ohtBg8teR0h5IBZkQ1NHeqRRZguuTILAjhbrAxv8TYTM1
         YGt09q8QWkG6FTLJC7FXMdwdRW9DuyGtjLDRJDX8SnplUF6JqEq9Butj4D7s5Ht5NC+C
         Pbjg==
X-Gm-Message-State: ACgBeo39wzLOlOTr3tu/3tym1iRqxZaTTqzqAsPDlivESHQMoYuWN5Qz
        za8CNzMq79yiDzcDD9r4xgk=
X-Google-Smtp-Source: AA6agR5+uRufxScOzJFFg0OJhrHWVGhGHdxM7QRifgV6YOSqCHOrG1MwUBBS6ql+VsrMX3LAILpGpw==
X-Received: by 2002:a17:90b:1b12:b0:200:5dbd:adff with SMTP id nu18-20020a17090b1b1200b002005dbdadffmr24606605pjb.43.1662993705437;
        Mon, 12 Sep 2022 07:41:45 -0700 (PDT)
Received: from [192.168.0.51] (ip5f5a621e.dynamic.kabel-deutschland.de. [95.90.98.30])
        by smtp.gmail.com with ESMTPSA id 1-20020a17090a0f8100b002004a2eab5bsm5287760pjz.14.2022.09.12.07.41.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 07:41:45 -0700 (PDT)
Message-ID: <c96f4806-13ec-335f-68ab-10194411da43@googlemail.com>
Date:   Mon, 12 Sep 2022 16:41:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: [PATCH v7 0/5] Switch build system to meson
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl,
        kieran.bingham@ideasonboard.com, mchehab@kernel.org,
        nicolas@ndufresne.ca, p.zabel@pengutronix.de, rosenp@gmail.com,
        sakari.ailus@iki.fi, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com
References: <20220909134412.21934-1-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
From:   Gregor Jasny <gjasny@googlemail.com>
In-Reply-To: <20220909134412.21934-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Laurent and all the other helping hands,

On 9/9/22 3:44 PM, Laurent Pinchart wrote:
> This series is the latest (and greatest) attempt to switch v4l-utils
> from autotools to meson.
> 
> Compared to v6, the first noticeable change is that fixups have been
> squashed into their corresponding commit. Detailed changelogs are now
> included in individual patches.

Tested-by: Gregor Jasny <gjasny@googlemail.com>

v7 is still working as expected with my Debian and Ubuntu packaging scripts.

What would you think would be a good time to release these changes? 
Should I do a release shortly after the this change has landed?

Thanks,
Gregor
