Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EACE3157A
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 21:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727263AbfEaTk1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 15:40:27 -0400
Received: from casper.infradead.org ([85.118.1.10]:60426 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726808AbfEaTk1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 15:40:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=2FfjeUKcqZhIhJkwLzXNsbQPC017VX4YDMGI9YS37s4=; b=KuSqNZRUm53eGSjG9lyhqLGHqA
        v8PeYdrAlZjKMm4gWFQPfMDXH6pJYL3P88mlvzTnUhhcl6fMcDvZ7HyFvfTXFHdBsHZWzhj6w3SXq
        P+OdM/bGHKM9HuwdYBkO8WFl2rctpIfFqzfrNkAImqtKxLyNk+1wxwLpfdoohrMkBJQlgYwBDu9PI
        kgvvfbURWMwNau2wNxxMw1Y6ALaGzw0rJvQKpcGGmd4NFjzG6m8wt5vOZXp0wK9PFbbKkmvS3J/wJ
        ehsy9R71b8hD/vTgWH3n5M58fyrqIvKkBymju4Cr1DYDYVNBmhkMnqq274THYw2IMn5CHudAPQftS
        xh9RFXvQ==;
Received: from 179.187.96.185.dynamic.adsl.gvt.net.br ([179.187.96.185] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hWnO5-0008LJ-EN; Fri, 31 May 2019 19:40:25 +0000
Date:   Fri, 31 May 2019 16:40:21 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     linux-media@vger.kernel.org
Subject: Re: [ANN] Patchwork version upgrade
Message-ID: <20190531164021.79cf54b7@coco.lan>
In-Reply-To: <fd13ba000e24d15f4016cc89970766253e334d6f.camel@ndufresne.ca>
References: <20190531124050.3f06e1b8@coco.lan>
        <fd13ba000e24d15f4016cc89970766253e334d6f.camel@ndufresne.ca>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 31 May 2019 15:01:06 -0400
Nicolas Dufresne <nicolas@ndufresne.ca> escreveu:

> Le vendredi 31 mai 2019 =C3=A0 12:40 -0300, Mauro Carvalho Chehab a =C3=
=A9crit :
> > Hi all,
> >=20
> > For a long time, we were running an old Patchwork version. The thing is=
 that
> > we had applied some patches on the top of it, and the upgrade was not
> > trivial.
> >=20
> > Today, we upgraded it to its latest stable version. Just like before,
> > you can access it via:
> >=20
> > 	https://patchwork.linuxtv.org
> >=20
> > As this is a new version, please report if you find any issues on it. =
=20
>=20
> Actually I went a little into it, the black and white alternance for
> lines clearly does not work.

Black and white alternance? Here, the background is always black
(tested with both Firefox and Chromium browser). Perhaps your browser
didn't apply the style.css correctly, ignoring this from style.css:

	.table-striped > tbody > tr:nth-of-type(odd) {
		background-color: black;
	}

What browser are you using?

> Any reason not to stick with the default CSS for the content ?=20
>=20
> An example that is readable:
> https://patchwork.kernel.org/project/dri-devel/list/

Well, changing the entire layout of LinuxTV site would be a lot harder.

Also, from my side, having a black background makes it less tiring
to work with patchwork.

Thanks,
Mauro
