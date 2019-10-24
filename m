Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF3F1E35F8
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 16:51:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409511AbfJXOvW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 10:51:22 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:39002 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409497AbfJXOvW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 10:51:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=gaLIhkds5LhzqeHA020QZNl9nhyON857LNUfIKzhycw=; b=Awt1+/lNz8gBVTSLZeaMFMgVM
        0JkSu4VqgHttERadzPyPX6fD35xj/90khifYeD2Mbb0LxLqOWeSBJQZia9J4Shh615lZLuN1+uXzH
        sJ9+eITDQBWjHJAHgulcbeYI9jO+vNyJhmBh/xza66qFPfPZA3nYdez8mMjgeqlW4BjJHejHfHIts
        nXA2PzPxIxg8ZOe90OWMTBobI3fzcN0QC2UTpLlB2rhDQhZUv5xyvWQfa63Wlv6Rqb9OPkP4tAuOR
        GDPHWlRBe2j52r8V6J1/D8uF9caAdDqTlbvEu3q20c7UGBtJ8G+SyPFPS/a7w+yO5g0O2d2oGkHVA
        iWVg4kCgQ==;
Received: from 177.133.95.187.dynamic.adsl.gvt.net.br ([177.133.95.187] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iNeSO-00021r-8N; Thu, 24 Oct 2019 14:51:20 +0000
Date:   Thu, 24 Oct 2019 11:51:12 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Sean Young <sean@mess.org>
Cc:     Gregor Jasny <gjasny@googlemail.com>, linux-media@vger.kernel.org
Subject: Re: v4l-utils.spec.in out of date?
Message-ID: <20191024115112.3bcf5185@coco.lan>
In-Reply-To: <20191024124301.GA18559@gofer.mess.org>
References: <20191024124301.GA18559@gofer.mess.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 24 Oct 2019 13:43:01 +0100
Sean Young <sean@mess.org> escreveu:

> Hi Gregor, Mauro,
> 
> The v4l-utils.spec.in file in the v4l-utils git repo looks like an out of
> date version of this file:
> 
> https://src.fedoraproject.org/rpms/v4l-utils/blob/master/f/v4l-utils.spec

True. Just get the one currently at Fedora and update at v4l2-utils.

> 
> Now I have some changes to go into this file. However patching an old
> version does not seem to make sense.

After picking the one from Fedora, feel free to modify it.

> 
> https://patchwork.linuxtv.org/patch/59602/
> 
> How should I proceed from here?
> 
> Thanks,
> Sean



Thanks,
Mauro
