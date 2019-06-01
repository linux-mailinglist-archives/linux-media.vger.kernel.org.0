Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03AB931FA3
	for <lists+linux-media@lfdr.de>; Sat,  1 Jun 2019 16:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbfFAODZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Jun 2019 10:03:25 -0400
Received: from casper.infradead.org ([85.118.1.10]:40544 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbfFAODZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Jun 2019 10:03:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=v0LrETNumBSzOdfcO9SplNOuuMpdyL4QdkEXtDe1++k=; b=UlLJQVZgPChSP8Uk9dq3h6IR2R
        4gU4+F+Ij+aULct1GC/dh6JFgerVeR9bNNCqhhACq1KMt4zxi3tjplk27D/05TyMHUzx4FrinW1wP
        gzEx10Sc78ly1c5O9JRlHE7YExko48zhmjBEOdlM7Y1Y0iC1uWyRUC0KOVbTitSKLNLS7ZymBgIkL
        Vr9z+M72lnd+A4pZ5rNesnOebhTkYoRoIjgxQmYrosxC3qETIMbGN8gQBe5KZbp+Usk48HLqqqSmH
        wyNWJedM66ImpzOszka5orPXf+DyqK51aRwQ+Zus8jXwMLt7QB84MT+NZ1h6chJ49zzR5Fj7Ku4fZ
        zQPJu1Wg==;
Received: from 179.187.96.185.dynamic.adsl.gvt.net.br ([179.187.96.185] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hX4bR-0005d5-3q; Sat, 01 Jun 2019 14:03:22 +0000
Date:   Sat, 1 Jun 2019 11:03:17 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@collabora.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [ANN] Patchwork version upgrade
Message-ID: <20190601110317.4b8e50dd@coco.lan>
In-Reply-To: <ac538d8e-5b2a-788f-f425-a59283497a85@collabora.com>
References: <20190531124050.3f06e1b8@coco.lan>
        <ac538d8e-5b2a-788f-f425-a59283497a85@collabora.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 31 May 2019 17:07:01 -0300
Andr=C3=A9 Almeida <andrealmeid@collabora.com> escreveu:

> If one tries to access a page that doesn't exists (e.g. [1]), the page
> shows that Django is on debug mode. According to Django
> documentation[2], is not a good idea running with debugging enabled on
> production environment. To fix this, just change the `DEBUG =3D True` to
> `DEBUG =3D False` on `settings.py`. The result should be something like
> this [3].

Fixed.

>=20
> Thanks,
> Andr=C3=A9

Thanks,
Mauro
