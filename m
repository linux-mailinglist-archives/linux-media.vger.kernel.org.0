Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 070CF4F066
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2019 23:17:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbfFUVRN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Jun 2019 17:17:13 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:34422 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbfFUVRN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Jun 2019 17:17:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=qu9zhz0VbubD/aIMmtVALLqw4rls2icALX3kK1BJ398=; b=CbxbvGaDW/SGjuYT4KQh+32Is
        xpEmBHgzuKDh/qAxROQUjrKjjT9w3CxRffdXdDW0YzOEux4EeSam+Qv0k5p3Zq9TvO7sxu4PQZZKy
        zZZ7u5slvmEXS8y3gF39SEEc2+jDTzDmj0PwCs87UVbLb5xdfNUnjDQFvhJei+lbvyJrMNa89akji
        LrE5fwnfDBaSBCu75KLqcurpU4nWp4HMEl+IiEdPhhaw4TuDHpCE7pU67jYxRLcqkQV7eEb8tvdFu
        4B37eiy4LroTrFKc3jXDmBaZFP+aA+EM6P578AVObB0N7QZfLhDHXqz7ZPpXbSMCMjo0hkehNzXEq
        V7CyY7Fvg==;
Received: from [177.97.20.138] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1heQuE-0000UU-EY; Fri, 21 Jun 2019 21:17:11 +0000
Date:   Fri, 21 Jun 2019 18:17:05 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@collabora.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        helen.koike@collabora.com, kernel@collabora.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] media: vimc: stream: add missing function
 documentation
Message-ID: <20190621181705.44415597@coco.lan>
In-Reply-To: <20190617133221.21246-1-andrealmeid@collabora.com>
References: <20190617133221.21246-1-andrealmeid@collabora.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 17 Jun 2019 10:32:20 -0300
Andr=C3=A9 Almeida <andrealmeid@collabora.com> escreveu:

> Add comments at vimc_streamer_s_stream and vimc_streamer_thread, making
> the vimc-stream totally documented.

I'm applying it right now.

Yet, if this is fully documented, IMO you should add it to
Documentation/media/v4l-drivers, replacing the comments to kernel-doc
markups.

That would make easier for the ones to read the comments and, if someone
changes a function call, warnings will be produced, and the developer
will be warned.

Thanks,
Mauro
