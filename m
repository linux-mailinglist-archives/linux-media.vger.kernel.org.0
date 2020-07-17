Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32D462238B6
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 11:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726040AbgGQJvV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 05:51:21 -0400
Received: from smtprelay0220.hostedemail.com ([216.40.44.220]:36768 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725864AbgGQJvV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 05:51:21 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay08.hostedemail.com (Postfix) with ESMTP id 860B4182CF66E;
        Fri, 17 Jul 2020 09:51:20 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:988:989:1260:1277:1311:1313:1314:1345:1359:1381:1437:1515:1516:1518:1534:1538:1593:1594:1711:1714:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3350:3622:3653:3865:3867:3870:3871:3872:3873:3874:4321:5007:7901:7903:10004:10400:10848:11232:11658:11914:12048:12049:12297:12555:12740:12760:12895:13069:13255:13311:13357:13439:14181:14659:14721:21080:21627:30034:30054:30070:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:2,LUA_SUMMARY:none
X-HE-Tag: star74_1d16f1b26f09
X-Filterd-Recvd-Size: 1558
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf19.hostedemail.com (Postfix) with ESMTPA;
        Fri, 17 Jul 2020 09:51:19 +0000 (UTC)
Message-ID: <9bd42f458908eedd810c5e8805f997997763d32a.camel@perches.com>
Subject: Re: [PATCH 3/3] media: Add support for the AM/FM radio chip KT0913
 from KT Micro.
From:   Joe Perches <joe@perches.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Santiago Hormazabal <santiagohssl@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        linux-kernel@vger.kernel.org
Date:   Fri, 17 Jul 2020 02:51:18 -0700
In-Reply-To: <b8cb9dbf-2a81-6a12-c754-e524f42a0574@xs4all.nl>
References: <20200717004441.116248-1-santiagohssl@gmail.com>
         <20200717004441.116248-4-santiagohssl@gmail.com>
         <b8cb9dbf-2a81-6a12-c754-e524f42a0574@xs4all.nl>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2020-07-17 at 11:29 +0200, Hans Verkuil wrote:
> It's standard linux codingstyle to use lowercase for hex numbers.
> Can you change that throughout the source for the next version?

Is there a standard?  It's not in coding-style.rst.

While I prefer lowercase too, it seems the kernel has
only ~2:1 preference for lowercase to uppercase hex.

$ git grep -ohP '\b0[xX][0-9a-f]+\b' | grep [a-f] | wc -l
1149833
$ git grep -ohP '\b0[xX][0-9A-F]+\b' | grep [A-F] | wc -l
575781


