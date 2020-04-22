Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1711B479B
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 16:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbgDVOpF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Apr 2020 10:45:05 -0400
Received: from smtprelay0106.hostedemail.com ([216.40.44.106]:45042 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726018AbgDVOpD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Apr 2020 10:45:03 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay02.hostedemail.com (Postfix) with ESMTP id 543E94DB6;
        Wed, 22 Apr 2020 14:45:02 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:857:960:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1714:1730:1747:1777:1792:2198:2199:2393:2559:2562:2731:2828:3138:3139:3140:3141:3142:3350:3622:3868:3872:4321:5007:7809:9010:10004:10400:10848:11232:11658:11914:12043:12297:12740:12760:12895:13069:13311:13357:13439:14181:14659:14721:21080:21451:21627:21773:30054:30060:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:4,LUA_SUMMARY:none
X-HE-Tag: wheel41_6607a0a47ab58
X-Filterd-Recvd-Size: 1617
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf05.hostedemail.com (Postfix) with ESMTPA;
        Wed, 22 Apr 2020 14:45:01 +0000 (UTC)
Message-ID: <a857bb9785f48dea47b4d04dd0b939b0172e6320.camel@perches.com>
Subject: Re: [PATCH] media: MAINTAINERS: Fix Hantro, Rga and Rkvdec entries
From:   Joe Perches <joe@perches.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Johan Jonker <jbx6244@gmail.com>
Date:   Wed, 22 Apr 2020 07:42:43 -0700
In-Reply-To: <20200422111403.19114-1-ezequiel@collabora.com>
References: <20200422111403.19114-1-ezequiel@collabora.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2020-04-22 at 08:14 -0300, Ezequiel Garcia wrote:
> It seems recent merges introduced a couple issues
> here, so let's fix them all. Also, reorder Rockchip
> video decoder as per parse-maintainers.pl script
> and add linux-rockchip mailing list.
[]
> diff --git a/MAINTAINERS b/MAINTAINERS
[]
> +ROCKCHIP VIDEO DECODER DRIVER
> +M:	Ezequiel Garcia <ezequiel@collabora.com>
> +L:	linux-media@vger.kernel.org
> +L:	linux-rockchip@lists.infradead.org
> +S:	Maintained
> +F:	drivers/staging/media/rkvdec/
> +F:	Documentation/devicetree/bindings/media/rockchip,vdec.yaml

alphabetic case sensitive order please.

+F:	Documentation/devicetree/bindings/media/rockchip,vdec.yaml
+F:	drivers/staging/media/rkvdec/


