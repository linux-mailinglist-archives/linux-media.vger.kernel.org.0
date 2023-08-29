Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB0B578C354
	for <lists+linux-media@lfdr.de>; Tue, 29 Aug 2023 13:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231437AbjH2LdT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Aug 2023 07:33:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230493AbjH2LdO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Aug 2023 07:33:14 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DD56129
        for <linux-media@vger.kernel.org>; Tue, 29 Aug 2023 04:33:12 -0700 (PDT)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1qawy6-0006XV-SO; Tue, 29 Aug 2023 13:33:10 +0200
Message-ID: <afe1fc2c-e3dd-9da1-1a80-27d81f16774b@leemhuis.info>
Date:   Tue, 29 Aug 2023 13:33:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] breakage in sun6i-csi media api
Content-Language: en-US, de-DE
To:     Linux regressions mailing list <regressions@lists.linux.dev>
Cc:     linux-media@vger.kernel.org
References: <f13c27fb-2afe-b94e-aad9-ed5ecc818183@brixit.nl>
 <ZHmzZUkcFK8Gq_JL@aptenodytes>
 <e168d246-528d-b615-aa50-af8f17af4442@brixit.nl>
 <ZHm46or-MhTb457b@aptenodytes>
 <20230602100352.GK19463@pendragon.ideasonboard.com>
 <25cf3947-1fe0-7280-09e2-3dc107b2c8e7@leemhuis.info>
 <20230629000837.122abd21@sal.lan> <ZK68_SoDU6GQSbh2@aptenodytes>
From:   "Linux regression tracking #update (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ZK68_SoDU6GQSbh2@aptenodytes>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1693308792;fbe6ea75;
X-HE-SMSGID: 1qawy6-0006XV-SO
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 12.07.23 16:47, Paul Kocialkowski wrote:
> On Thu 29 Jun 23, 00:08, Mauro Carvalho Chehab wrote:
>> Em Mon, 26 Jun 2023 14:23:50 +0200
>> "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info> escreveu:
>>
>> IMO, the best here would be to modify the application to be smarter,
>> using the topology actually reported by MEDIA_IOC_G_TOPOLOGY, instead
>> on relying on some specific hard-coded types.
> Absolutely!

#regzbot resolve: reverting or fixing would cause other regression,
fixing the app thus is the better of two bad solutions
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
