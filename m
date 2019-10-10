Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7068BD26F5
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2019 12:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387460AbfJJKKm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Oct 2019 06:10:42 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58522 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726602AbfJJKKm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Oct 2019 06:10:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=IAzYfXFc86QBYgLEwTDLJJETscUlZvc3L/WvvycB9dU=; b=AmHNM1oFe8Jix92tyRD11GHl5
        8Cc3lHMvnpieg8K/3FU6QAm3bAlpZyvxQdMYuI+LQ1eHEM5akoiz0TUmrTo5QlRgbVZZmvzmEMENG
        78+xB5MzkBLlNC6il5fsW9f6/7S7084mSlpeqirA52zrNdbpiiRHx4DrNsHGr+2bSJK6FJ9UO55O2
        hs8Wvd8kjlFuRArTdmKyTWH4p3xuHNY3GOhfvwy9C6vA6nLhLQ9G7Qm/cFpZ6ylnCq1quHhAxXsJ+
        7D5mCi568xqD6nIlBog9bVxy9FzSbdwjDZC05uGPzHBZuVbVO4n2yNREqkyUNFgCMKDAZiku9hu/x
        0VQOocAvw==;
Received: from 177.205.100.4.dynamic.adsl.gvt.net.br ([177.205.100.4] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iIVOr-0000EF-Cl; Thu, 10 Oct 2019 10:10:25 +0000
Date:   Thu, 10 Oct 2019 07:10:20 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Gon Solo <gonsolo@gmail.com>
Cc:     linux-media@vger.kernel.org, mchehab@infradead.org, jp@jpvw.nl,
        crope@iki.fi, sean@mess.org, linux-kernel@vger.kernel.org,
        Andreas Wendleder <andreas.wendleder@gmail.com>
Subject: Re: [PATCH 0/4] Add support for Logilink VG0022A.
Message-ID: <20191010071020.2f921117@coco.lan>
In-Reply-To: <20191010095103.3803-1-gonsolo@gmail.com>
References: <20191010091848.GA2898@Limone>
        <20191010095103.3803-1-gonsolo@gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Patches applied.

Em Thu, 10 Oct 2019 11:50:59 +0200
Gon Solo <gonsolo@gmail.com> escreveu:

> These patches add support for the Logilink VG0022A.
> 
> Signed-off-by: Andreas Wendleder <andreas.wendleder@gmail.com>
> 
> Gon Solo (4):
>   si2168: Use bits and convert to kernel-doc format.
>   si2157: Add option for not downloading firmware.
>   af9035: Make speed computation clear.
>   Add support for Logilink VG0022A.

For the si2168 and af9035 patches, I applied the version I wrote.

Regards,
Mauro
