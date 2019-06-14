Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57F824584E
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2019 11:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbfFNJL4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jun 2019 05:11:56 -0400
Received: from smtprelay0199.hostedemail.com ([216.40.44.199]:57466 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725859AbfFNJL4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jun 2019 05:11:56 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay08.hostedemail.com (Postfix) with ESMTP id 7610C182CF668;
        Fri, 14 Jun 2019 09:11:54 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::::::::,RULES_HIT:41:355:379:599:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3867:3874:4321:5007:10004:10400:10848:11026:11232:11657:11658:11914:12043:12048:12740:12760:12895:13069:13311:13357:13439:14659:14721:21080:21627:30054:30091,0,RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:27,LUA_SUMMARY:none
X-HE-Tag: eyes88_4aa5799cf532f
X-Filterd-Recvd-Size: 1967
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf09.hostedemail.com (Postfix) with ESMTPA;
        Fri, 14 Jun 2019 09:11:52 +0000 (UTC)
Message-ID: <9fd990d12ea1488592c5a590046f001a187b9c3f.camel@perches.com>
Subject: Re: [PATCH v2] media: mtk-vcodec: remove unneeded proxy functions
From:   Joe Perches <joe@perches.com>
To:     Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org
Date:   Fri, 14 Jun 2019 02:11:51 -0700
In-Reply-To: <20190614075640.106709-1-acourbot@chromium.org>
References: <20190614075640.106709-1-acourbot@chromium.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2019-06-14 at 16:56 +0900, Alexandre Courbot wrote:
> We were getting the codec interface through a proxy function that does
> not bring anything compared to just accessing the interface definition
> directly, so just do that. Also make the decoder interfaces const.
[]
> diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
[]
> @@ -485,16 +485,9 @@ static int vdec_h264_get_param(void *h_vdec, enum vdec_get_param_type type,
>  	return 0;
>  }
>  
> -static struct vdec_common_if vdec_h264_if = {
> +const struct vdec_common_if vdec_h264_if = {

probably better to fixup whatever chains prevent
this (if any) from being static const

>  	.init		= vdec_h264_init,
>  	.decode		= vdec_h264_decode,
>  	.get_param	= vdec_h264_get_param,
>  	.deinit		= vdec_h264_deinit,
>  };


