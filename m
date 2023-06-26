Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22C5273DDEC
	for <lists+linux-media@lfdr.de>; Mon, 26 Jun 2023 13:41:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbjFZLlZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jun 2023 07:41:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbjFZLlY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jun 2023 07:41:24 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88F65A0
        for <linux-media@vger.kernel.org>; Mon, 26 Jun 2023 04:41:23 -0700 (PDT)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1qDkaw-0005a3-1h; Mon, 26 Jun 2023 13:41:22 +0200
Message-ID: <fa1fe0cc-4e87-78fb-fa89-3d0ac9d90bf3@leemhuis.info>
Date:   Mon, 26 Jun 2023 13:41:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: v4l2-async: regression due to endpoint matching
Content-Language: en-US, de-DE
From:   "Linux regression tracking #adding (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org,
        Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
          Linux regressions mailing list 
          <regressions@lists.linux.dev>
References: <8360125.31r3eYUQgx@steina-w>
 <aea6c4a7-5bb0-9395-8883-6b163c181995@leemhuis.info>
In-Reply-To: <aea6c4a7-5bb0-9395-8883-6b163c181995@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1687779683;13bf4328;
X-HE-SMSGID: 1qDkaw-0005a3-1h
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28.04.23 08:52, Linux regression tracking #adding (Thorsten Leemhuis)
wrote:
> [CCing the regression list, as it should be in the loop for regressions:
> https://docs.kernel.org/admin-guide/reporting-regressions.html]
> 
> [TLDR: I'm adding this report to the list of tracked Linux kernel
> regressions; the text you find below is based on a few templates
> paragraphs you might have encountered already in similar form.
> See link in footer if these mails annoy you.]
> 
> On 27.04.23 16:40, Alexander Stein wrote:
>>
>> I have a setup on my TQMa6x (imx6q-mba6a.dts) with a tc358743 attached to the 
>> MIPI CSI input.
>> I noticed that since commit 1f391df44607 ("media: v4l2-async: Use endpoints in 
>> __v4l2_async_nf_add_fwnode_remote()") the async subdevice probing does not 
>> work anymore. If I revert that, it is working again, even on next-20230425.
>> [...]
> 
> Thanks for the report. To be sure the issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
> tracking bot:
> 
> #regzbot ^introduced 1f391df44607
> #regzbot title media: v4l2-async: async subdevice probing stopped
> working on TQMa6x
> #regzbot ignore-activity

I'm removing this from the list of tracked regressions, because as I
understand things a revert would cause a regressions itself; a quick fix
sadly is not really possible and a proper one already WIP[1]. There
hence is not much worth tracking this. Should happen in a ideal world,
but that's how it is sometimes:

#regzbot inconclusive: revert no option and a proper fix will take some time
#regzbot ignore-activity

[1] afaics it's this, but I might be wrong with
https://lore.kernel.org/all/20230622114028.908825-1-sakari.ailus@linux.intel.com/

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
