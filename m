Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E684D27FE
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2019 13:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbfJJLe3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Oct 2019 07:34:29 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:52996 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbfJJLe3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Oct 2019 07:34:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=T15puKazwBt66FgQt1uCJU8HUv8ZgBQadGJIaMXHcQo=; b=l60y0UJbSOjOUb9VZ8YXtleH1
        oc/1GSBg7c4JUqj4AgifXJsOW0BU9QkaTtl0BbQ20eNjrscNzD6PGVn6BvDol31OLP6fi+5o3qo2Q
        cC17rlozldmfQfiBoLlXrFtu93Bw//WmC1cZd29tujKegrzBsjseO96u1LMg6Zu1dDMs0IXt2omqt
        IgWMH1SHvt/gtgNWFkCBk7Mn71aatifvgrcC74o+VQb9zTjtwl7MsRczpZcLB77T2cfdok6pfPAFh
        A51CgxxWmVpo15BWKR5QJ1gfW8SSlcpnygn53kK/9ltzrAfZZWwc38hdvdvxW5MxR+Cu7yhJzjfIV
        /CmwL2E9Q==;
Received: from 177.205.100.4.dynamic.adsl.gvt.net.br ([177.205.100.4] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iIWiB-0007mf-Lf; Thu, 10 Oct 2019 11:34:28 +0000
Date:   Thu, 10 Oct 2019 08:34:23 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Gon Solo <gonsolo@gmail.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        JP <jp@jpvw.nl>, crope@iki.fi, Sean Young <sean@mess.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] media: si2168: use bits instead of bool for flags
Message-ID: <20191010083423.3fff672f@coco.lan>
In-Reply-To: <20191010105544.GA6507@Limone>
References: <20191004090855.14e418ed@coco.lan>
        <2942b7ca9ecf86b6bff75c10ccfca25c173c3f0d.1570194906.git.mchehab+samsung@kernel.org>
        <20191010105544.GA6507@Limone>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 10 Oct 2019 12:55:44 +0200
Gon Solo <gonsolo@gmail.com> escreveu:

> On Fri, Oct 04, 2019 at 10:15:22AM -0300, Mauro Carvalho Chehab wrote:
> > Using bool on struct is not recommended, as it wastes lots of
> > space. So, instead, let's use bits.  
> 
> Wouldn't "bool b:1;" even be better? I performed a little test:
> 
> #include <stdbool.h>
> #include <stdio.h>
> 
> struct uints {
> 	unsigned int a0;
> 	unsigned int a1;
> 	unsigned int a2;
> 	unsigned int a3;
> 	unsigned int a4;
> 	unsigned int a5;
> 	unsigned int a6;
> 	unsigned int a7;
> };
> 
> struct bools {
> 	bool a0;
> 	bool a1;
> 	bool a2;
> 	bool a3;
> 	bool a4;
> 	bool a5;
> 	bool a6;
> 	bool a7;
> };
> 
> struct bit_uints {
> 	unsigned int a0:1;
> 	unsigned int a1:1;
> 	unsigned int a2:1;
> 	unsigned int a3:1;
> 	unsigned int a4:1;
> 	unsigned int a5:1;
> 	unsigned int a6:1;
> 	unsigned int a7:1;
> };
> 
> struct bit_bools {
> 	bool a0:1;
> 	bool a1:1;
> 	bool a2:1;
> 	bool a3:1;
> 	bool a4:1;
> 	bool a5:1;
> 	bool a6:1;
> 	bool a7:1;
> };
> 
> int main() {
> 	printf("bit_uints: %ld\n", sizeof(struct bit_uints));
> 	printf("bit_bools: %ld\n", sizeof(struct bit_bools));
> 	printf("uints: %ld\n", sizeof(struct uints));
> 	printf("bools: %ld\n", sizeof(struct bools));
> }
> 
> Result:
> 
> bit_uints: 4
> bit_bools: 1
> uints: 32
> bools: 8
> 
> I know with different types within the struct it looks different, but
> still.

No. In practice, the compiler will add 3 bytes of pad after bit_bools
(on 32-bit archs), due to performance reasons.

Using "unsigned int" makes it clearer.

Thanks,
Mauro
