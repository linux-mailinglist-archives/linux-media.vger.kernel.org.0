Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB4096F1201
	for <lists+linux-media@lfdr.de>; Fri, 28 Apr 2023 08:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345371AbjD1Gw5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Apr 2023 02:52:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345175AbjD1Gw4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Apr 2023 02:52:56 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94A1D1BF3
        for <linux-media@vger.kernel.org>; Thu, 27 Apr 2023 23:52:55 -0700 (PDT)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1psHyP-0006Aj-Uz; Fri, 28 Apr 2023 08:52:54 +0200
Message-ID: <aea6c4a7-5bb0-9395-8883-6b163c181995@leemhuis.info>
Date:   Fri, 28 Apr 2023 08:52:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: v4l2-async: regression due to endpoint matching
Content-Language: en-US, de-DE
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org,
        Linux kernel regressions list <regressions@lists.linux.dev>
References: <8360125.31r3eYUQgx@steina-w>
From:   "Linux regression tracking #adding (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <8360125.31r3eYUQgx@steina-w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1682664775;bdb477f9;
X-HE-SMSGID: 1psHyP-0006Aj-Uz
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 27.04.23 16:40, Alexander Stein wrote:
> 
> I have a setup on my TQMa6x (imx6q-mba6a.dts) with a tc358743 attached to the 
> MIPI CSI input.
> I noticed that since commit 1f391df44607 ("media: v4l2-async: Use endpoints in 
> __v4l2_async_nf_add_fwnode_remote()") the async subdevice probing does not 
> work anymore. If I revert that, it is working again, even on next-20230425.
> [...]

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced 1f391df44607
#regzbot title media: v4l2-async: async subdevice probing stopped
working on TQMa6x
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (the parent of this mail). See page linked in footer for
details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

