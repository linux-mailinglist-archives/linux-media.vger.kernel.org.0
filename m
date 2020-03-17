Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55E4D188480
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 13:51:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbgCQMvS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 08:51:18 -0400
Received: from smtprelay0066.hostedemail.com ([216.40.44.66]:50722 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725794AbgCQMvR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 08:51:17 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay05.hostedemail.com (Postfix) with ESMTP id ABC6718024A45;
        Tue, 17 Mar 2020 12:51:16 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1714:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3350:3622:3865:3870:3872:3873:3874:4321:5007:6119:10004:10400:10848:11232:11658:11914:12043:12297:12740:12760:12895:13069:13160:13229:13311:13357:13439:14181:14659:14721:21080:21433:21451:21627:30054:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: list89_453106e984b38
X-Filterd-Recvd-Size: 1573
Received: from XPS-9350.home (unknown [47.151.143.254])
        (Authenticated sender: joe@perches.com)
        by omf19.hostedemail.com (Postfix) with ESMTPA;
        Tue, 17 Mar 2020 12:51:15 +0000 (UTC)
Message-ID: <52f737a95e0e50d3f556f8ebf3677f99683ee70b.camel@perches.com>
Subject: Re: [PATCH] MAINTAINERS: Better regex for dma_buf|fence|resv
From:   Joe Perches <joe@perches.com>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>
Date:   Tue, 17 Mar 2020 05:49:27 -0700
In-Reply-To: <20200317071547.1008622-1-daniel.vetter@ffwll.ch>
References: <20200317071547.1008622-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2020-03-17 at 08:15 +0100, Daniel Vetter wrote:
> We're getting some random other stuff that we're not relly interested
> in, so match only word boundaries. Also avoid the capture group while
> at it.
[]
> diff --git a/MAINTAINERS b/MAINTAINERS
[]
> @@ -5025,7 +5025,7 @@ F:	include/linux/dma-buf*
>  F:	include/linux/reservation.h
>  F:	include/linux/*fence.h
>  F:	Documentation/driver-api/dma-buf.rst
> -K:	dma_(buf|fence|resv)
> +K:	'\bdma_(?:buf|fence|resv)\b'

You don't want the single quotes in the K: entry

K:	\bdma_(?:buf|fence|resv)\b

My mistake for adding them in the initial suggestion.


