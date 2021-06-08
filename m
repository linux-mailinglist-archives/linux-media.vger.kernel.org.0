Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3B7C39F15C
	for <lists+linux-media@lfdr.de>; Tue,  8 Jun 2021 10:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231384AbhFHIta (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 04:49:30 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:52765 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231327AbhFHIta (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Jun 2021 04:49:30 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id qXOXlp79dhqltqXOalOCWE; Tue, 08 Jun 2021 10:47:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623142056; bh=XyQjnjy143kbpHHhMEbIvQxLBPLF4NoZsIE56mz0JaE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Ml8+uqesp4rdr9gFhdJugphyxM4N8TgqWM8FYW221L4RONAroaFKIhNCcYSHXhDz8
         OXNnegJUr+03BQzWyEmh5nSfGFOrfo9HXLFn7KiOmufgGGiFKDOBnHHp+y0vkx4QMW
         ROIf2m3F80SM31ZaOCCJAk0dtOhLQIDVDrvr/w6g57BcMgxmysAloxURb+gZNuKjhD
         1eZWg+998ZJZk5JjeuW3iYjjFujzHVhiJOgLgLOXDM7farRttWlvDSGcrX2ZzzacKN
         vgqxGj53wqQ+jJ1ONQIXtSpSkbJpcPxDAX70tWXnf5u1YWw3jpb88xyfwVZOobWqKU
         b/kWT4oRRbWNQ==
Subject: Re: [PATCH] TDA1997x: enable EDID support
To:     =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
References: <m3sg1uq6xu.fsf@t19.piap.pl>
 <dbb99d7b-18eb-317c-911a-b982486848fa@xs4all.nl> <m3eeddhora.fsf@t19.piap.pl>
 <CAJ+vNU0E_0pB-1T+VpdmjJNVirAwCUNjKVbEV4wEbqHOzURj_A@mail.gmail.com>
 <m3k0n57y72.fsf@t19.piap.pl> <e9acc316-54c4-0387-eaaf-18dfb4dce34e@xs4all.nl>
 <m3czsw922k.fsf@t19.piap.pl>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <73734d99-5fdf-57f5-282c-94d4f38a8a9d@xs4all.nl>
Date:   Tue, 8 Jun 2021 10:47:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <m3czsw922k.fsf@t19.piap.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfLjFq23vzSMI75+oQRmTtz5MrmVO6YIINN/A/3gpZDzCOw0ORXmTBCXSBY/VhF1esM8cGZVWCh0Xi6WwGQuuxhtZtGnjDWjMVki9ADJzSAUsi+C8Ahpp
 o/ItBtB3gO8T4otq4us9+lbvoddJX0jk/ev9frTEK3syocUtneRUi0bKopNYYcjKpoa3bL63I8BiV/+zGq9YNBACzcJUB0T1HmgqmUF8AGXQiyUN7Eyyw0Wu
 sGn3x/mMD6S3CEecGH6CBXu7EnYlQR1j9MtIBDr9PeO1UcWY53bxmAPvIv3Pa4UJbBf8EM+1wmtfoJw29QxLiOuS4qUJE5Hu3wIntLzbhes=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/06/2021 10:45, Krzysztof Hałasa wrote:
> Hans Verkuil <hverkuil@xs4all.nl> writes:
> 
>> OK, I think the history is clear. Can you post a v2 with a Fixes tag and
>> comment a bit on why this was not caught before?
> 
> Sure, will do. That "Fixes" tag... since it's from the beginning (the
> Gateworks' branch was never a part of the official tree), do I still
> need it? It would have to point to the initial submission of this
> driver.
> 

Yes, that's fine. It's been broken since the beginning, so the Fixes
tag will indicate that.

Regards,

	Hans
