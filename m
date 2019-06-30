Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 683395B0B1
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2019 18:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbfF3QoH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Jun 2019 12:44:07 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:51968 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbfF3QoH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Jun 2019 12:44:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=f5w7qjqF8UN5IbxHxdHITmqFtOXDcWM6WVEa9icjIp8=; b=AlBqeAYjRnthXxANRntP0wUoY
        yhq4TX9rtV6mtDM0bW6juHanf3tbylDqDcWpagVapGLlnWI6FN12C98DdRzr3QLsfBYKbjtWuWWwH
        JBbZhq+KNduUSbp6ClImkiSniYMt631cRv5+FILcoooSmyU2QLnLBtHB4bOIu0bprl6TSYsNjriVF
        DeDngm4M96z0nvvS5FiBoBIk3tF2fzvVbRFo8ffTB14ihyIM8v3+M42BRnB9ApGj8sDPvc0ZC1Cs1
        89bEdkeBlqirzwLHlJ+iPUQqr1CdL5KC/p8MbH11ysyquVh/vsG0UpJPzZdR3csdxzgBYSzHtzLJ3
        gZOdG1d5Q==;
Received: from 177.157.117.207.dynamic.adsl.gvt.net.br ([177.157.117.207] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hhcvu-0003PX-VP
        for linux-media@vger.kernel.org; Sun, 30 Jun 2019 16:44:07 +0000
Date:   Sun, 30 Jun 2019 13:44:04 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     linux-media@vger.kernel.org
Subject: [ANN] Media summit in Lisbon at September
Message-ID: <20190630134404.7ba170f0@coco.lan>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

We are organizing a media mini-summit in Lisbon to happen in September,
at the same week as the Linux Plumber Conference and the Kernel Summit.

We're still discussing the details about that.

In principle, it will be a free event for the ones registered
to Linux Plumbers Conference, happening between Sept 9-11.
They have a room available that we could use for the meeting on that
period of time, but we need to adjust to avoid conflicts with other
interesting micro-conferences that will happen in parallel (or
eventually do it outside that period, but that would be harder to
organize).

I'll let you know more details once we got it.

If you plan to attend, please let me know. It is open for all, but
we'll have a limited number of seats. So, the earliest we get the
number of interested people, the best.

-

At the last summit, we were supposed to do a Key Signing Party, but
we end not doing it, due to lack of time. I suggest we add this again,
but doing it earlier, in order to avoid getting out of time for doing
it.

=46rom my side, I'd like to discuss what criteria we should adopt for
the code that comes via /drivers/staging/media, in particular:
how much time should we keep a code there that doesn't receive any
patch addressing the drivers real issues (excluding codepatch,
cleanups and kAPI changes)?

What other themes should be discussed?

Thanks,
Mauro
