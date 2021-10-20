Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13468434570
	for <lists+linux-media@lfdr.de>; Wed, 20 Oct 2021 08:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbhJTGwg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Oct 2021 02:52:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:59834 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229591AbhJTGwf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Oct 2021 02:52:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 47E5361074;
        Wed, 20 Oct 2021 06:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634712621;
        bh=PURJ57CDCK1CRMg4ZPPC0Zof7vbwM57cPumF7fbuLJI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OuVNV+doiltxzOI0vzzO8N6FQkXjkSceYpUTO7khRcAoIZArPDbOgjk1B2/rkogrb
         5b2VDMahz1vFawbpLSCTRd2p85ljk35uaTE1nNkDHK6sHEn4/gmuJ+bQUzR4fZfE3b
         +H29T1khuTJAuz40cIpzEM9zD80kZM/aoQUb0o8AYidFlRELcKA9yklToJOloggdPR
         V7IVUaqBR4SBOdys4AvRBqzftmLRr90AHIZJ3uL4NNcmRkXeURqXjKwT1S7EuNsQ0S
         1lgJ2pPc7OZMkIaZrBasATzOlBmTO4ae4ycC5HNPrvKigSYwoWobvNAtFvJo3nky0D
         P7ZCVBjCEh2bQ==
Date:   Wed, 20 Oct 2021 07:50:15 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Tsuchiya Yuto <kitakar@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Alan <alan@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/17] various fixes for atomisp to make it work
Message-ID: <20211020075015.316d827c@sal.lan>
In-Reply-To: <CAHp75VcDZQ1M2iNKewxqcG3C+bzSEGV05dTmYp3xXhnhNGdviw@mail.gmail.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
        <CAHp75VcDZQ1M2iNKewxqcG3C+bzSEGV05dTmYp3xXhnhNGdviw@mail.gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 18 Oct 2021 10:56:40 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> escreveu:

> On Mon, Oct 18, 2021 at 6:45 AM Tsuchiya Yuto <kitakar@gmail.com> wrote:
> >
> > Hi all,
> >
> > This patch series contains fixes for atomisp to work (again). Tested on
> > Microsoft Surface 3 (Windows) and Xiaomi Mi Pad 2 (Android model) with
> > v5.15-rc5. Both are Cherry Trail (ISP2401) devices.
> >
> > I'm still not used to Linux patch sending flow. Sorry in advance
> > if there is some weirdness :-) but I did my best.  
> 
> I agree with Hans, you did an excellent job!
> I will try to find time to look into this. In any case it seems to me
> that this is a material more likely for v5.17-rc1, rather than v5.16.

Yeah, it sounds to late to apply it for 5.16.

Regards,
Mauro
