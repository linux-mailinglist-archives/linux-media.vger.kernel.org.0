Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB642DF271
	for <lists+linux-media@lfdr.de>; Sun, 20 Dec 2020 01:09:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbgLTAIx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Dec 2020 19:08:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:38406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726771AbgLTAIx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Dec 2020 19:08:53 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608422893;
        bh=UVTrMZxourzJKz+ucOr71OHfCIHAav4FVKKyWXHo1T0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=nlGohQ9EaQJER4bWhErBzsKFgu5gC0Sqqv1XmkzwNuK2iCYBEP/l/y4igLoCypsyS
         5tjtQp/SNtWi6kIHO9GioxQpfmFNkmuoqO/S6XUgyeHb2VzOCxsijK4Tqr2WsXKXn7
         QPn2MiVX7oK1x5xXBZ+7HRkOOOAoElcOieMkT9MlzFSZi3sXRnR9VroD5otNegiKkH
         XquF3cbLDZlkg6x1nXB6OyX7luKIhiKIzN/ZmcxHKXrFQlhFvbXeQr8harbCR6+c4W
         xJcRZSjKRPVwTOkgQT0d88BWbpjYDgD7qjUsXpl0NANdmbUSOJrs1SEXz1zpWWLRCt
         8PNKwDUzcKqxA==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d3f2d76c-40d9-b167-7002-5a25ec81c73a@linux.intel.com>
References: <20201207164240.15436-1-jae.hyun.yoo@linux.intel.com> <20201207164240.15436-3-jae.hyun.yoo@linux.intel.com> <CACPK8Xd3dz1WLGNGqMiAZxhMEeGHbkPtvO2rYQ36Kbj=Uvy-jA@mail.gmail.com> <d3faea9e-e7d6-eba0-a6b2-c30bc9b6e147@linux.intel.com> <160820199393.1580929.9806429719720580479@swboyd.mtv.corp.google.com> <d3f2d76c-40d9-b167-7002-5a25ec81c73a@linux.intel.com>
Subject: Re: [PATCH 2/2] media: aspeed: fix clock handling logic
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Eddie James <eajames@linux.ibm.com>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-clk@vger.kernel.org, linux-media@vger.kernel.org
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Joel Stanley <joel@jms.id.au>
Date:   Sat, 19 Dec 2020 16:08:11 -0800
Message-ID: <160842289176.1580929.13125223155803124427@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Jae Hyun Yoo (2020-12-17 11:54:15)
> On 12/17/2020 2:46 AM, Stephen Boyd wrote:
> > Quoting Jae Hyun Yoo (2020-12-08 09:16:29)
> > So should the two patches be squashed together and go through the
> > media tree?
> >=20
>=20
> The first patch should go through clk tree, and the second one (this
> patch) should go through media tree. Both patches should be applied at
> the same time. Should I squash them in this case?

If one depends on the other, and having the first one breaks something
unless the second one is applied, then yes they should be squashed
together.
