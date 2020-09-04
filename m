Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABFD925E355
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 23:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728120AbgIDVeM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Sep 2020 17:34:12 -0400
Received: from smtprelay0198.hostedemail.com ([216.40.44.198]:39058 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727020AbgIDVeI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Sep 2020 17:34:08 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id 75B528384365;
        Fri,  4 Sep 2020 21:34:04 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:967:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1537:1566:1593:1594:1711:1714:1730:1747:1777:1792:2393:2525:2560:2563:2682:2685:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3622:3865:3867:3868:3870:3871:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:5007:7903:9025:10004:10400:10848:11232:11658:11914:12043:12048:12297:12555:12663:12679:12740:12760:12895:13069:13161:13229:13311:13357:13439:14181:14659:14721:21080:21627:21740:30054:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: brain20_590dcfc270b5
X-Filterd-Recvd-Size: 1527
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf16.hostedemail.com (Postfix) with ESMTPA;
        Fri,  4 Sep 2020 21:34:02 +0000 (UTC)
Message-ID: <f5e9bd00f94d4058e7fa214b4219d3e1978e8b55.camel@perches.com>
Subject: Re: [PATCH 08/29] dma-buf: Avoid comma separated statements
From:   Joe Perches <joe@perches.com>
To:     kieran.bingham+renesas@ideasonboard.com,
        Jiri Kosina <trivial@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
In-Reply-To: <e6035e4b-9d4e-3c23-c140-4e9d6822496b@ideasonboard.com>
References: <cover.1598331148.git.joe@perches.com>
         <990bf6f33ccaf73ad56eb4bea8bd2c0db5e90a31.1598331148.git.joe@perches.com>
         <e6035e4b-9d4e-3c23-c140-4e9d6822496b@ideasonboard.com>
Content-Type: text/plain; charset="ISO-8859-1"
Date:   Fri, 04 Sep 2020 14:33:52 -0700
MIME-Version: 1.0
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2020-09-04 at 12:42 +0100, Kieran Bingham wrote:
> I'm pleased to see this is treewide ;-)
> Definitely prefer this.

These are only the comma uses in if/do/while blocks that
would also need braces as separate statements.

There a multiple dozens more just with single statements
terminated by commas and not semicolons.

See:  https://lore.kernel.org/patchwork/patch/1291033/


