Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA02D4CCF9
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2019 13:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbfFTLiF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jun 2019 07:38:05 -0400
Received: from shell.v3.sk ([90.176.6.54]:51004 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726404AbfFTLiF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jun 2019 07:38:05 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id ADE6ECBF55;
        Thu, 20 Jun 2019 13:38:01 +0200 (CEST)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 4uX7VXVtM3NX; Thu, 20 Jun 2019 13:37:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id EF5D4CBFFB;
        Thu, 20 Jun 2019 13:37:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 1qhcORAKhm8I; Thu, 20 Jun 2019 13:37:55 +0200 (CEST)
Received: from belphegor (nat-pool-brq-t.redhat.com [213.175.37.10])
        by zimbra.v3.sk (Postfix) with ESMTPSA id 6A844CBF55;
        Thu, 20 Jun 2019 13:37:55 +0200 (CEST)
Message-ID: <26d8ac51ff8c454a357028f267efd0d4cdd0ea84.camel@v3.sk>
Subject: Re: [PATCH v6 5/7] [media] marvell-ccic/mmp: add devicetree support
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>
Date:   Thu, 20 Jun 2019 13:37:53 +0200
In-Reply-To: <20190620113511.rxoybnxm2exv2ibl@valkosipuli.retiisi.org.uk>
References: <20190528090731.10341-1-lkundrak@v3.sk>
         <20190528090731.10341-6-lkundrak@v3.sk>
         <20190614103940.4dg43fo7dmbwnpfs@uno.localdomain>
         <20190620113511.rxoybnxm2exv2ibl@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2019-06-20 at 14:35 +0300, Sakari Ailus wrote:
> Ping?
> 
> Lubomir: I'm applying the set now, but please addres Jacopo's comment.
> Thanks.

Hi, I'm wondering if you could wait a couple of minutes?

I've tested the patch set on my machine last night and I was about to
submit the updated set just now.

Alternatively, I can just address Jacopo's comment with a patch that
applies on top of the set, but it would make slightly more sense if it
came earlier.

Thanks
Lubo

